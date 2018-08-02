-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STRING_INPUT_STREAM
   --
   -- An input stream where the data is read from a string.
   --

inherit
   TERMINAL_INPUT_STREAM
      redefine
         valid_last_character, dispose
      end

create {ANY}
   from_string

feature {ANY}
   end_of_input: BOOLEAN
      do
         Result := offset > string.upper
      end

   is_connected: BOOLEAN

   must_disconnect: BOOLEAN False

   can_unread_character: BOOLEAN
      do
         Result := offset >= string.lower
      end

   disconnect
      do
         filter := Void
         is_connected := False
      end

   valid_last_character: BOOLEAN
      do
         Result := string.valid_index(offset)
      end

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      do
         offset := offset + 1
      end

   filtered_unread_character
      do
         offset := offset - 1
      end

   filtered_last_character: CHARACTER
      do
         Result := string.item(offset)
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         std_error.put_string("STRING_INPUT_STREAM.filtered_descriptor has been called!%N")
         crash
      end

   filtered_has_descriptor: BOOLEAN False

   filtered_stream_pointer: POINTER
      do
         std_error.put_string("STRING_INPUT_STREAM.filtered_stream_pointer has been called!%N")
         crash
      end

   filtered_has_stream_pointer: BOOLEAN False

feature {}
   dispose
      do
         -- No need to force people to disconnect such a STREAM.
      end

   from_string (a_string: ABSTRACT_STRING)
      require
         a_string /= Void
      do
         string := a_string.out
         offset := string.lower - 1
         is_connected := True
      end

   string: STRING
         -- where the data comes from

   offset: INTEGER

end -- class STRING_INPUT_STREAM
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
