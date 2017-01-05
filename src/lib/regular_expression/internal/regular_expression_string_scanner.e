-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class REGULAR_EXPRESSION_STRING_SCANNER
   --
   -- Facility to scan strings
   -- TODO improve it by using STRING_HANDLER and string's storage
   --

feature {ANY} -- make
   make
         -- Initialise the attributes.
      do
         create last_string.make(10)
      end

feature {ANY} -- basic
   scanned_string: ABSTRACT_STRING
         -- The expression being currently build.

   set_scanned_string (string: like scanned_string)
         -- Set the 'scanned_string' with 'string'.
      do
         scanned_string := string
         clear_error
         goto_position(scanned_string.lower)
      ensure
         has_no_error: not has_error
         definition: scanned_string = string
         at_the_begin: position = scanned_string.lower
      end

feature {ANY} -- error management
   has_error: BOOLEAN
         -- True when an error was encountered

   clear_error
         -- Remove the error flag
      do
         has_error := False
      ensure
         has_no_error: not has_error
      end

   last_error: STRING
         -- Returns a string recorded for the error.
      require
         has_error: has_error
      do
         Result := last_string
      ensure
         not_void: Result /= Void
      end

   set_error (message: STRING)
         -- Set has_error and last_error.
         -- The explaining error string 'last_error'
         -- is created as follow: "Error at position 'position': 'message'.".
      require
         message_not_void: message /= Void
         has_no_error: not has_error
      do
         has_error := True
         last_string.clear_count
         last_string.append_string(once "Error at position ")
         position.append_in(last_string)
         last_string.append_string(once ": ")
         last_string.append_string(message)
         last_string.append_character('.')
      ensure
         has_error: has_error
      end

feature {ANY} -- scanning
   position: INTEGER
         -- The scanned position.
         -- It is the position of 'last_character'.

   last_character: CHARACTER
         -- The scanned character.
         -- The last character read from 'scanned_string'.

   valid_last_character: BOOLEAN
         -- True when 'last_character' is valid.
         -- Is like 'scanned_string.valid_index(position)'

   valid_previous_character: BOOLEAN
         -- True if the position-1 is a valid position.
      require
         scanned_string /= Void
      do
         Result := scanned_string.valid_index(position - 1)
      ensure
         definition: Result = scanned_string.valid_index(position - 1)
      end

   previous_character: like last_character
         -- The character at position-1.
      require
         valid_previous_character
      do
         Result := scanned_string.item(position - 1)
      ensure
         definition: Result = scanned_string.item(position - 1)
      end

   valid_next_character: BOOLEAN
         -- True if the position+1 is a valid position.
      require
         scanned_string /= Void
      do
         Result := scanned_string.valid_index(position + 1)
      ensure
         definition: Result = scanned_string.valid_index(position + 1)
      end

   next_character: like last_character
         -- The character at position+1.
      require
         valid_next_character
      do
         Result := scanned_string.item(position + 1)
      ensure
         definition: Result = scanned_string.item(position + 1)
      end

   end_of_input: BOOLEAN
         -- True when all the characters of 'scanned_string'
         -- are scanned.
      do
         Result := not valid_last_character
      ensure
         implies_last_character_not_valid: Result implies not valid_last_character
      end

   goto_position (pos: INTEGER)
         -- Change the currently scanned position to 'pos'.
         -- Updates 'last_character' and 'valid_last_character' to
         -- reflect the new position value.
      require
         has_no_error: not has_error
         scanned_string /= Void
      do
         position := pos
         valid_last_character := scanned_string.valid_index(pos)
         if valid_last_character then
            last_character := scanned_string.item(pos)
         end
      ensure
         has_no_error: not has_error
         position_set: position = pos
         validity_updated: valid_last_character = scanned_string.valid_index(position)
         character_updated: valid_last_character implies last_character = scanned_string.item(position)
      end

   read_character
         -- Reads the next character.
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
      do
         goto_position(position + 1)
      ensure
         next_position: position > old position
         has_no_error: not has_error
      end

   read_integer
         -- Reads an integer value beginning at the
         -- currently scanned position.
         -- The read value is stored in 'last_integer'.
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         begin_with_a_digit: last_character.is_decimal_digit
      do
         from
            last_integer := last_character.decimal_value
            read_character
         until
            end_of_input or else not last_character.is_decimal_digit
         loop
            last_integer := 10 * last_integer + last_character.decimal_value
            read_character
         end
      ensure
         has_no_error: not has_error
         digits_eaten: end_of_input or else not last_character.is_decimal_digit
      end

   saved_position: INTEGER
         -- The saved position (only one is currently enough).

   save_position
         -- Saves the current scanning position.
      require
         not_at_end: not end_of_input
      do
         saved_position := position
      ensure
         not_at_end: not end_of_input
         position_kept: position = old position
         saved_position_set: saved_position = position
      end

   restore_saved_position
         -- Restore the scanning position to the last saved one.
      do
         goto_position(saved_position)
      ensure
         position_restored: position = old saved_position
         not_at_end: not end_of_input
      end

   last_string: STRING
         -- A string buffer.

   last_integer: INTEGER
         -- An integer buffer.

invariant
   last_string_not_void: last_string /= Void

end -- class REGULAR_EXPRESSION_STRING_SCANNER
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
