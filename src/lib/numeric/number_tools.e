-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class NUMBER_TOOLS
   --
   -- This class provides abstract creation functions for NUMBERs as well as
   -- some other useful tools for NUMBERs.
   --
   -- Because this class is expanded, one may simply declare some entity of
   -- type NUMBER_TOOLS to use those NUMBER tools. One may also inherit this
   -- class in order to use those tools as well.
   --

feature {ANY}
   from_integer (n: INTEGER): NUMBER
      do
         Result := from_integer_64(n)
      end

   from_integer_64 (n: INTEGER_64): NUMBER
         -- Uses value `n' to create a new NUMBER.
      do
         create {INTEGER_64_NUMBER} Result.make(n)
      ensure
         Result.to_integer_64 = n
      end

   from_string (formula: ABSTRACT_STRING): NUMBER
         -- Parse the contents of `formula' to create a new NUMBER. If some
         -- error occurs (like for example a division by zero), the `Result'
         -- is Void and the error report is left in the `parser_buffer'.
      require
         is_number(formula)
      do
         parser_buffer.initialize_with(formula)
         parser_buffer.skip_separators
         Result := parse_create_e0
         if parser_buffer.last_error /= Void then
            Result := Void
         end
      ensure
         Result /= Void xor parser_buffer.last_error /= Void
      end

   from_input_stream (input: INPUT_STREAM): NUMBER
         -- Create a number from a file or standard input
      require
         input.is_connected
      local
         string: STRING
      do
         if not input.end_of_input then
            create string.make(0)
            input.read_line_in(string)
            Result := from_string(string)
         end
      ensure
         Result /= Void xor parser_buffer.last_error /= Void
      end

   is_number (formula: ABSTRACT_STRING): BOOLEAN
         -- Is the `formula' a correct notation to create a NUMBER ?
         -- Actually, any correct `formula' using a combination of literal
         -- integer constants with + - * / () and ! is a correct notation to
         -- create a NUMBER. Traditional priority rules are used for
         -- operators and the ! character denote the factorial computation.
         -- Here is the BNF grammar used:
         --
         --  E0 = E1 R1
         --  E1 = E2 R2
         --  E2 = E3 R3
         --  E3 = "+" E3 | "-" E3 | "(" E0 ")" | "constant"
         --  R1 = "+" E1 R1 | "-" E1 R1 | ^
         --  R2 = "*" E2 R2 | "/" E2 R2 | ^
         --  R3 = "!" | ^
      require
         not formula.is_empty
      do
         parser_buffer.initialize_with(formula)
         parser_buffer.skip_separators
         Result := parse_e0
         if Result then
            if parser_buffer.current_index /= formula.count + 1 then
               Result := False
               parser_buffer.set_last_error_message(once "End of text expected.")
            end
         end
      ensure
         Result xor parser_buffer.last_error /= Void
      end

   parser_buffer: MINI_PARSER_BUFFER
         -- This once function gives access to the unique `parser_buffer' to
         -- allow the memorization of the `Current' position and the
         -- memorization of the last error message.
      once
         create Result
      end

feature {}
   parse_e0: BOOLEAN
      do
         Result := parse_e1 and then parse_r1
      end

   parse_e1: BOOLEAN
      do
         Result := parse_e2 and then parse_r2
      end

   parse_e2: BOOLEAN
      do
         Result := parse_e3
         parse_r3
      end

   parse_e3: BOOLEAN
      do
         if parser_buffer.end_reached then
            parser_buffer.set_last_error_message(Integer_expected)
         else
            inspect
               parser_buffer.current_character
            when '+', '-' then
               parser_buffer.next
               parser_buffer.skip_separators
               Result := parse_e3
            when '(' then
               parser_buffer.next
               parser_buffer.skip_separators
               Result := parse_e0
               if Result then
                  if parser_buffer.end_reached or else parser_buffer.current_character /= ')' then
                     Result := False
                     parser_buffer.set_last_error_message(Integer_expected)
                  else
                     parser_buffer.next
                     parser_buffer.skip_separators
                  end
               end
            else
               Result := parse_constant
            end
         end
      end

   parse_r1: BOOLEAN
      do
         if parser_buffer.end_reached then
            Result := True
         else
            inspect
               parser_buffer.current_character
            when '+', '-' then
               parser_buffer.next
               parser_buffer.skip_separators
               Result := parse_e1 and then parse_r1
            else
               Result := True
            end
         end
      end

   parse_r2: BOOLEAN
      do
         if parser_buffer.end_reached then
            Result := True
         else
            inspect
               parser_buffer.current_character
            when '*', '/' then
               parser_buffer.next
               parser_buffer.skip_separators
               Result := parse_e2 and then parse_r2
            else
               Result := True
            end
         end
      end

   parse_r3
      do
         if not parser_buffer.end_reached then
            if parser_buffer.current_character = '!' then
               parser_buffer.next
               parser_buffer.skip_separators
            end
         end
      end

   parse_constant: BOOLEAN
      local
         stop: BOOLEAN
      do
         if parser_buffer.end_reached or else not parser_buffer.current_character.is_digit then
            parser_buffer.set_last_error_message(Integer_expected)
         else
            Result := True
            from
               parser_buffer.next
            until
               stop
            loop
               if parser_buffer.end_reached then
                  stop := True
               elseif parser_buffer.current_character.is_digit then
                  parser_buffer.next
               else
                  stop := True
               end
            end
            parser_buffer.skip_separators
         end
      end

   parse_create_e0: NUMBER
      do
         Result := parse_create_e1
         Result := parse_create_r1(Result)
      end

   parse_create_e1: NUMBER
      do
         Result := parse_create_e2
         Result := parse_create_r2(Result)
      end

   parse_create_e2: NUMBER
      do
         Result := parse_create_e3
         Result := parse_create_r3(Result)
      end

   parse_create_e3: NUMBER
      do
         inspect
            parser_buffer.current_character
         when '+' then
            parser_buffer.next
            parser_buffer.skip_separators
            Result := parse_create_e3
         when '-' then
            parser_buffer.next
            parser_buffer.skip_separators
            Result := -parse_create_e3
         when '(' then
            parser_buffer.next
            parser_buffer.skip_separators
            Result := parse_create_e0
            parser_buffer.next
            parser_buffer.skip_separators
         else
            Result := parse_create_constant
         end
      end

   parse_create_r1 (left: NUMBER): NUMBER
      do
         if parser_buffer.end_reached then
            Result := left
         else
            inspect
               parser_buffer.current_character
            when '+' then
               parser_buffer.next
               parser_buffer.skip_separators
               Result := left + parse_create_e1
               Result := parse_create_r1(Result)
            when '-' then
               parser_buffer.next
               parser_buffer.skip_separators
               Result := left - parse_create_e1
               Result := parse_create_r1(Result)
            else
               Result := left
            end
         end
      end

   parse_create_r2 (left: NUMBER): NUMBER
      do
         if parser_buffer.end_reached then
            Result := left
         else
            inspect
               parser_buffer.current_character
            when '*' then
               parser_buffer.next
               parser_buffer.skip_separators
               Result := left * parse_create_e2
               Result := parse_create_r2(Result)
            when '/' then
               parser_buffer.next
               parser_buffer.skip_separators
               Result := parse_create_e2
               if Result.is_zero then
                  parser_buffer.set_last_error_message(once "Attempt to divide " + left.to_string + once " by zero.")
               else
                  Result := left / Result
               end
               Result := parse_create_r2(Result)
            else
               Result := left
            end
         end
      end

   parse_create_r3 (left: NUMBER): NUMBER
      do
         Result := left
         if not parser_buffer.end_reached then
            if parser_buffer.current_character = '!' then
               parser_buffer.next
               parser_buffer.skip_separators
               if Result.is_integer_general_number then
                  if Result.is_positive then
                     Result := Result.factorial
                  else
                     parser_buffer.set_last_error_message(once "Attempt to compute %
                                 %factorial of a negative value (" + Result.to_string + once ").")
                  end
               else
                  parser_buffer.set_last_error_message(once "Attempt to compute %
           %factorial with a non integral value (" + Result.to_string + once ").")
               end
            end
         end
      end

   parse_create_constant: NUMBER
      local
         stop: BOOLEAN; c: CHARACTER; n, n_save: INTEGER
      do
         from
         until
            stop
         loop
            if parser_buffer.end_reached then
               stop := True
            else
               c := parser_buffer.current_character
               if c.is_digit then
                  if Result /= Void then
                     Result := Result @* 10 @+ c.decimal_value
                  else
                     --|*** BUG ***
                     n_save := n
                     n := n * 10 + c.decimal_value
                     if n < 0 then
                        Result := from_integer(n_save)
                        Result := Result @* 10 @+ c.decimal_value
                     end
                     --|*** WORK AROUND ***
                     if n >= 214748364 then
                        Result := from_integer(n)
                     end
                     --|*** D.Colnet 17 nov. 2002 ***
                  end
                  parser_buffer.next
               else
                  stop := True
               end
            end
         end
         parser_buffer.skip_separators
         if Result = Void then
            Result := from_integer(n)
         end
      ensure
         Result /= Void
      end

   Integer_expected: STRING "Integer constant expected."

end -- class NUMBER_TOOLS
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
