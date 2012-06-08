-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class JSON_PARSER

insert
   JSON_HANDLER

feature {JSON_HANDLER}
   parse_json_text (text: INPUT_STREAM): JSON_TEXT is
      require
         text.is_connected
      local
         context: JSON_PARSE_CONTEXT
         value: JSON_VALUE
      do
         error := Void
         create context.make(text)

         debug ("json/parser")
            debug_parse_in(once "parse_json_text", context)
         end
         value := parse_value(context)
         if error = Void then
            if Result ?:= value then
               Result ::= value
            else
               error := context.error(once "Invalid JSON text")
            end
         end
         debug ("json/parser")
            debug_parse_out(once "parse_json_text", context, Result)
         end
     end

   error: ABSTRACT_STRING

feature {}
   parse_value (context: JSON_PARSE_CONTEXT): JSON_VALUE is
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
               Result := parse_object(context)
            when '[' then
               Result := parse_array(context)
            when '"' then
               Result := parse_string(context)
            when '0'..'9', '-' then
               Result := parse_number(context)
            when 't' then
               Result := parse_true(context)
            when 'f' then
               Result := parse_false(context)
            when 'n' then
               Result := parse_null(context)
            else
               error := context.error(once "Unexpected character '#(1)'" # &context.item)
            end
         else
            error := context.error(once "Index out of range")
         end
         debug ("json/parser")
            debug_parse_out(once "parse_value", context, Result)
         end
      ensure
         error = Void implies Result /= Void
      end

   parse_object (context: JSON_PARSE_CONTEXT): JSON_OBJECT is
      require
         context.is_valid
         context.item = '{'
      local
         dict: LINKED_HASHED_DICTIONARY[JSON_VALUE, JSON_STRING]
         done: BOOLEAN
         value: JSON_VALUE; key: JSON_STRING
      do
         debug ("json/parser")
            debug_parse_in(once "parse_object", context)
         end
         from
            create dict.make
            context.next -- skip '{'
         until
            done or else error /= Void
         loop
            context.skip_blanks
            if not context.is_valid then
               error := context.error(once "Unfinished object")
            elseif context.item /= '"' then
               error := context.error(once "Expected string")
            else
               key := parse_string(context)
               if error = Void then
                  context.skip_blanks
                  if not context.is_valid or else context.item /= ':' then
                     error := context.error(once "Expected ':'")
                  else
                     context.next
                     context.skip_blanks
                     value := parse_value(context)
                     if error = Void then
                        if dict.has(key) then
                           error := context.error(once "Duplicate key: #(1)" # &key)
                        else
                           dict.add(value, key)

                           context.skip_blanks
                           if not context.is_valid then
                              error := context.error(once "Unfinished object")
                           else
                              inspect
                                 context.item
                              when '}' then
                                 done := True
                                 context.next
                              when ',' then
                                 context.next
                              else
                                 error := context.error(once "Expected ','")
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
      ensure
         error = Void implies Result /= Void
      end

   parse_array (context: JSON_PARSE_CONTEXT): JSON_ARRAY is
      require
         context.is_valid
         context.item = '['
      local
         array: FAST_ARRAY[JSON_VALUE]
         done: BOOLEAN
         value: JSON_VALUE
      do
         debug ("json/parser")
            debug_parse_in(once "parse_array", context)
         end
         from
            create array.make(0)
            context.next -- skip '['
         until
            done or else error /= Void
         loop
            context.skip_blanks
            if not context.is_valid then
               error := context.error(once "Unfinished array")
            else
               value := parse_value(context)
               if error = Void then
                  array.add_last(value)
                  context.skip_blanks
                  if not context.is_valid then
                     error := context.error(once "Unfinished array")
                  else
                     inspect
                        context.item
                     when ']' then
                        done := True
                        context.next
                     when ',' then
                        context.next
                     else
                        error := context.error(once "Expected ','")
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
      ensure
         error = Void implies Result /= Void
      end

   parse_string (context: JSON_PARSE_CONTEXT): JSON_STRING is
      require
         context.is_valid
         context.item = '"'
      local
         state, unicode: INTEGER
         done: BOOLEAN
         str: UNICODE_STRING
      do
         debug ("json/parser")
            debug_parse_in(once "parse_string", context)
         end
         from
            context.next -- skip '"'
            create str.make_empty
         until
            done or else error /= Void
         loop
            if not context.is_valid then
               error := context.error(once "Unfinished string")
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
                        error := context.error(once "Invalid raw character")
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
                     error := context.error(once "Invalid escape sequence")
                  end

               when 2..5 then -- after '\u'
                  if not context.item.is_hexadecimal_digit then
                     error := context.error(once "Expected 4 hexadecimal digits, got only #(2)" # &(state - 2))
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
      ensure
         error = Void implies Result /= Void
      end

   parse_number (context: JSON_PARSE_CONTEXT): JSON_NUMBER is
      require
         context.is_valid
         ;(once "0123456789-").has(context.item)
      local
         state: INTEGER; int, frac, exp, frac_exp: INTEGER_64
         neg, expneg: BOOLEAN
      do
         debug ("json/parser")
            debug_parse_in(once "parse_number", context)
         end
         if context.item = '-' then
            neg := True
            context.next
         end
         if not context.is_valid then
            error := context.error(once "Unfinished number")
         else
            inspect
               context.item
            when '0' then
               check
                  int = 0
               end
               state := -1
               context.next
            when '1'..'9' then
               int := context.item.decimal_value
               context.next
            else
               error := context.error(once "Invalid number")
            end
         end

         from
         until
            state < 0 or else error /= Void
         loop
            if not context.is_valid then
               error := context.error(once "Unfinished number")
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
                     int := int * 10 + context.item.decimal_value
                     context.next
                  else
                     state := -1
                  end

               when 10 then -- fractional part, waiting first digit
                  inspect
                     context.item
                  when '0'..'9' then
                     frac := context.item.decimal_value
                     frac_exp := 1
                     state := 11
                     context.next
                  else
                     error := context.error(once "Invalid number")
                  end

               when 11 then -- fractional part, next digits
                  inspect
                     context.item
                  when '0'..'9' then
                     frac := frac * 10 + context.item.decimal_value
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
                     context.next
                  when '-' then
                     state := 21
                     expneg := True
                     context.next
                  when '0'..'9' then
                     exp := context.item.decimal_value
                     state := 22
                     context.next
                  else
                     error := context.error(once "Invalid number")
                  end

               when 21 then -- exponential part, after sign, waiting first digit
                  inspect
                     context.item
                  when '0'..'9' then
                     exp := context.item.decimal_value
                     state := 22
                     context.next
                  else
                     error := context.error(once "Invalid number")
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

         if state < 0 then
            if neg then
               int := -int
            end
            if expneg then
               exp := -exp
            end
            create Result.make(int, frac, frac_exp, exp)
            Result.set_position(context.line, context.column)
         end
         debug ("json/parser")
            debug_parse_out(once "parse_number", context, Result)
         end
      ensure
         error = Void implies Result /= Void
      end

   parse_true (context: JSON_PARSE_CONTEXT): JSON_TRUE is
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
            error := context.error(once "Expected 'true'")
         end
         debug ("json/parser")
            debug_parse_out(once "parse_true", context, Result)
         end
      ensure
         error = Void implies Result /= Void
      end

   parse_false (context: JSON_PARSE_CONTEXT): JSON_FALSE is
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
            error := context.error(once "Expected 'false'")
         end
         debug ("json/parser")
            debug_parse_out(once "parse_false", context, Result)
         end
      ensure
         error = Void implies Result /= Void
      end

   parse_null (context: JSON_PARSE_CONTEXT): JSON_NULL is
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
            error := context.error(once "Expected 'null'")
         end
         debug ("json/parser")
            debug_parse_out(once "parse_null", context, Result)
         end
      ensure
         error = Void implies Result /= Void
      end

feature {}
   debug_parse_in (tag: STRING; context: JSON_PARSE_CONTEXT) is
      do
         io.put_line(once "->#(1) at #(2)" # tag #context.debug_position)
      end

   debug_parse_out (tag: STRING; context: JSON_PARSE_CONTEXT; res: JSON_VALUE) is
      require
         error = Void implies res /= Void
      do
         if error /= Void then
            io.put_line(once "<-#(1) at #(2) -- error: #(3)" # tag #context.debug_position # error)
         else
            io.put_line(once "<-#(1) at #(2) -- result: #(3)" # tag #context.debug_position # &res)
         end
      end

end -- class JSON_PARSER
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
