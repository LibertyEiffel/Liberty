-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_PARSER

insert
   JSON_HANDLER

create {JSON_HANDLER}
   make

feature {JSON_HANDLER}
   parse_json_text (text: INPUT_STREAM): JSON_TEXT
      require
         text.is_connected
      local
         context: JSON_PARSE_CONTEXT
         value: JSON_VALUE
      do
         create context.make(text, on_error)

         debug ("json/parser")
            debug_parse_in(once "parse_json_text", context)
         end
         value := parse_value(context, False)
         if value /= Void then
            if Result ?:= value then
               Result ::= value
            else
               context.error(once "Invalid JSON text")
            end
         end
         debug ("json/parser")
            debug_parse_out(once "parse_json_text", context, Result)
         end
     end

feature {}
   parse_value (context: JSON_PARSE_CONTEXT; nested: BOOLEAN): JSON_VALUE
      require
         context.is_valid
      do
         debug ("json/parser")
            debug_parse_in(once "parse_value", context)
         end
         context.skip_blanks
         if context.is_valid then
            inspect
               context.item
            when '{' then
               Result := parse_object(context, nested)
            when '[' then
               Result := parse_array(context, nested)
            when '"' then
               if nested then
                  Result := parse_string(context)
               else
                  context.error(once "Unexpected string at top level")
               end
            when '0'..'9', '-' then
               if nested then
                  Result := parse_number(context)
               else
                  context.error(once "Unexpected number at top level")
               end
            when 't' then
               if nested then
                  Result := parse_true(context)
               else
                  context.error(once "Unexpected true at top level")
               end
            when 'f' then
               if nested then
                  Result := parse_false(context)
               else
                  context.error(once "Unexpected false at top level")
               end
            when 'n' then
               if nested then
                  Result := parse_null(context)
               else
                  context.error(once "Unexpected null at top level")
               end
            else
               context.error(once "Unexpected character '#(1)'" # &context.item)
            end
         elseif nested then
            context.error(once "No value")
            print_run_time_stack
         end
         debug ("json/parser")
            debug_parse_out(once "parse_value", context, Result)
         end
      end

   parse_object (context: JSON_PARSE_CONTEXT; nested: BOOLEAN): JSON_OBJECT
      require
         context.is_valid
         context.item = '{'
      local
         dict: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING]
         done, error: BOOLEAN
         value: JSON_VALUE; key: JSON_STRING
      do
         debug ("json/parser")
            debug_parse_in(once "parse_object", context)
         end
         from
            create dict.make
            context.next -- skip '{'
         until
            done or else error
         loop
            context.skip_blanks
            if not context.is_valid then
               context.error(once "Unfinished object")
               error := True
            elseif context.item = '}' then
               -- extension: allow a comma just before a closing brace
               done := True
               if nested then
                  context.next
               end
            elseif context.item /= '"' then
               context.error(once "Expected string")
               error := True
            else
               key := parse_string(context)
               if key /= Void then
                  context.skip_blanks
                  if not context.is_valid or else context.item /= ':' then
                     context.error(once "Expected ':'")
                     error := True
                  else
                     context.next
                     context.skip_blanks
                     value := parse_value(context, True)
                     if value /= Void then
                        if dict.has(key) then
                           context.error(once "Duplicate key: #(1)" # &key)
                           error := True
                        else
                           dict.add(value, key)

                           context.skip_blanks
                           if not context.is_valid then
                              context.error(once "Unfinished object")
                              error := True
                           else
                              inspect
                                 context.item
                              when '}' then
                                 done := True
                                 if nested then
                                    context.next
                                 end
                              when ',' then
                                 context.next
                              else
                                 context.error(once "Expected ','")
                                 error := True
                              end
                           end
                        end
                     end
                  end
               end
            end
         end

         if done then
            create Result.make(dict)
            Result.set_position(context.line, context.column)
         end
         debug ("json/parser")
            debug_parse_out(once "parse_object", context, Result)
         end
      end

   parse_array (context: JSON_PARSE_CONTEXT; nested: BOOLEAN): JSON_ARRAY
      require
         context.is_valid
         context.item = '['
      local
         array: FAST_ARRAY[JSON_VALUE]
         done, error: BOOLEAN
         value: JSON_VALUE
      do
         debug ("json/parser")
            debug_parse_in(once "parse_array", context)
         end
         from
            create array.make(0)
            context.next -- skip '['
         until
            done or else error
         loop
            context.skip_blanks
            if not context.is_valid then
               context.error(once "Unfinished array")
               error := True
            elseif context.item = ']' then
               -- extension: allow a comma just before a closing bracket
               done := True
               if nested then
                  context.next
               end
            else
               value := parse_value(context, True)
               if value /= Void then
                  array.add_last(value)
                  context.skip_blanks
                  if not context.is_valid then
                     context.error(once "Unfinished array")
                     error := True
                  else
                     inspect
                        context.item
                     when ']' then
                        done := True
                        if nested then
                           context.next
                        end
                     when ',' then
                        context.next
                     else
                        context.error(once "Expected ','")
                        error := True
                     end
                  end
               end
            end
         end

         if done then
            create Result.make(array)
            Result.set_position(context.line, context.column)
         end
         debug ("json/parser")
            debug_parse_out(once "parse_array", context, Result)
         end
      end

   parse_string (context: JSON_PARSE_CONTEXT): JSON_STRING
      require
         context.is_valid
         context.item = '"'
      local
         state, unicode: INTEGER
         done, error: BOOLEAN
         str: UNICODE_STRING
      do
         debug ("json/parser")
            debug_parse_in(once "parse_string", context)
         end
         from
            context.next -- skip '"'
            create str.make_empty
         until
            done or else error
         loop
            if not context.is_valid then
               context.error(once "Unfinished string")
               error := True
            else
               inspect
                  state

               when 0 then -- normal
                  inspect
                     context.item
                  when '\' then
                     state := 1
                  when '"' then
                     done := True
                  else
                     if context.item.code < 32 then
                        context.error(once "Invalid raw character")
                        error := True
                     else
                        str.extend(context.item.code)
                     end
                  end

               when 1 then -- after '\'
                  inspect
                     context.item
                  when '"', '/' then
                     str.extend(context.item.code)
                     state := 0
                  when 'b' then
                     str.extend('%B'.code)
                     state := 0
                  when 'f' then
                     str.extend('%F'.code)
                     state := 0
                  when 'n' then
                     str.extend('%N'.code)
                     state := 0
                  when 'r' then
                     str.extend('%R'.code)
                     state := 0
                  when 't' then
                     str.extend('%T'.code)
                     state := 0
                  when 'u' then
                     state := 2
                     unicode := 0
                  else
                     context.error(once "Invalid escape sequence")
                     error := True
                  end

               when 2..5 then -- after '\u'
                  if not context.item.is_hexadecimal_digit then
                     context.error(once "Expected 4 hexadecimal digits, got only #(2)" # &(state - 2))
                     error := True
                  else
                     unicode := unicode * 16 + context.item.hexadecimal_value
                     if state = 5 then
                        str.extend(unicode)
                        state := 0
                     else
                        state := state + 1
                     end
                  end
               end

               context.next
            end
         end

         if done then
            create Result.make(str)
            Result.set_position(context.line, context.column)
         end
         debug ("json/parser")
            debug_parse_out(once "parse_string", context, Result)
         end
      end

   parse_number (context: JSON_PARSE_CONTEXT): JSON_NUMBER
      require
         context.is_valid
         ;(once "0123456789-").has(context.item)
      local
         state: INTEGER; int, frac: NATURAL_64; exp, frac_exp: INTEGER_64
         neg, expneg: INTEGER_8
      do
         debug ("json/parser")
            debug_parse_in(once "parse_number", context)
         end
         if context.item = '-' then
            neg := -1
            context.next
         else
            neg := 1
         end
         if not context.is_valid then
            context.error(once "Unfinished number")
            state := -2
         else
            inspect
               context.item
            when '0' then
               check
                  int = 0.to_natural_64
               end
               context.next
               inspect
                  context.item
               when '.' then
                  state := 10
                  context.next
               when 'e', 'E' then
                  state := 20
                  context.next
               when '0'..'9' then
                  context.error(once "Invalid number")
                  state := -2
               else
                  state := -1
               end
            when '1'..'9' then
               int := context.item.decimal_value.to_natural_64
               context.next
            else
               context.error(once "Invalid number")
               state := -2
            end
         end

         from
         until
            state < 0
         loop
            if not context.is_valid then
               context.error(once "Unfinished number")
               state := -2
            else
               inspect
                  state

               when 0 then -- integral part
                  inspect
                     context.item
                  when '.' then
                     state := 10
                     context.next
                  when 'e', 'E' then
                     state := 20
                     context.next
                  when '0'..'9' then
                     int := int * 10.to_natural_64 + context.item.decimal_value.to_natural_64
                     context.next
                  else
                     state := -1
                  end

               when 10 then -- fractional part, waiting first digit
                  inspect
                     context.item
                  when '0'..'9' then
                     frac := context.item.decimal_value.to_natural_64
                     frac_exp := 1
                     state := 11
                     context.next
                  else
                     context.error(once "Invalid number")
                     state := -2
                  end

               when 11 then -- fractional part, next digits
                  inspect
                     context.item
                  when '0'..'9' then
                     frac := frac * 10.to_natural_64 + context.item.decimal_value.to_natural_64
                     frac_exp := frac_exp + 1
                     context.next
                  when 'e', 'E' then
                     state := 20
                     context.next
                  else
                     state := -1
                  end

               when 20 then -- exponential part, waiting sign or first digit
                  inspect
                     context.item
                  when '+' then
                     state := 21
                     expneg := 1
                     context.next
                  when '-' then
                     state := 21
                     expneg := -1
                     context.next
                  when '0'..'9' then
                     exp := context.item.decimal_value
                     state := 22
                     expneg := 1
                     context.next
                  else
                     context.error(once "Invalid number")
                     state := -2
                  end

               when 21 then -- exponential part, after sign, waiting first digit
                  inspect
                     context.item
                  when '0'..'9' then
                     exp := context.item.decimal_value
                     state := 22
                     context.next
                  else
                     context.error(once "Invalid number")
                     state := -2
                  end

               when 22 then -- exponential part, after sign and first digit
                  inspect
                     context.item
                  when '0'..'9' then
                     exp:= exp * 10 + context.item.decimal_value
                     context.next
                  else
                     state := -1
                  end
               end
            end
         end

         if state = -1 then
            create Result.make(neg, int, frac, frac_exp, expneg * exp)
            Result.set_position(context.line, context.column)
         end
         debug ("json/parser")
            debug_parse_out(once "parse_number", context, Result)
         end
      end

   parse_true (context: JSON_PARSE_CONTEXT): JSON_TRUE
      require
         context.is_valid
         context.item = 't'
      do
         debug ("json/parser")
            debug_parse_in(once "parse_true", context)
         end
         if context.skip("true") then
            create Result.make
            Result.set_position(context.line, context.column)
         else
            context.error(once "Expected 'true'")
         end
         debug ("json/parser")
            debug_parse_out(once "parse_true", context, Result)
         end
      end

   parse_false (context: JSON_PARSE_CONTEXT): JSON_FALSE
      require
         context.is_valid
         context.item = 'f'
      do
         debug ("json/parser")
            debug_parse_in(once "parse_false", context)
         end
         if context.skip("false") then
            create Result.make
            Result.set_position(context.line, context.column)
         else
            context.error(once "Expected 'false'")
         end
         debug ("json/parser")
            debug_parse_out(once "parse_false", context, Result)
         end
      end

   parse_null (context: JSON_PARSE_CONTEXT): JSON_NULL
      require
         context.is_valid
         context.item = 'n'
      do
         debug ("json/parser")
            debug_parse_in(once "parse_null", context)
         end
         if context.skip("null") then
            create Result.make
            Result.set_position(context.line, context.column)
         else
            context.error(once "Expected 'null'")
         end
         debug ("json/parser")
            debug_parse_out(once "parse_null", context, Result)
         end
      end

feature {}
   make (a_on_error: like on_error)
      require
         a_on_error /= Void
      do
         on_error := a_on_error
      ensure
         on_error = a_on_error
      end

   on_error: PROCEDURE[TUPLE[ABSTRACT_STRING, INTEGER, INTEGER]]

feature {} -- debug
   debug_parse_in (tag: STRING; context: JSON_PARSE_CONTEXT)
      do
         std_error.put_line(once "->#(1) at #(2)" # tag # context.debug_position)
      end

   debug_parse_out (tag: STRING; context: JSON_PARSE_CONTEXT; res: JSON_VALUE)
      do
         if res = Void then
            std_error.put_line(once "<-#(1) at #(2) -- result: Void" # tag # context.debug_position)
         else
            std_error.put_line(once "<-#(1) at #(2) -- result: #(3)" # tag # context.debug_position # &res)
         end
      end

invariant
   on_error /= Void

end -- class JSON_PARSER
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
