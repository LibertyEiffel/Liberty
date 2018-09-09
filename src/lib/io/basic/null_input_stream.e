-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NULL_INPUT_STREAM
   --
   -- This "null" stream provides an unbroken sequence of '%U'
   -- (like /dev/zero does on Unix)
   --

inherit
   TERMINAL_INPUT_STREAM
      redefine
         filtered_read_line_in, dispose
      end

feature {ANY}
   end_of_input: BOOLEAN False

   is_connected: BOOLEAN True

   can_unread_character: BOOLEAN True

   disconnect
      do
         filter := Void
      end

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      do
      end

   filtered_unread_character
      do
      end

   filtered_last_character: CHARACTER '%U'

   filtered_read_line_in (buffer: STRING)
      do
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         std_error.put_string("NULL_INPUT_STREAM.filtered_descriptor has been called!%N")
         crash
      end

   filtered_has_descriptor: BOOLEAN False

   filtered_stream_pointer: POINTER
      do
         std_error.put_string("NULL_INPUT_STREAM.filtered_stream_pointer has been called!%N")
         crash
      end

   filtered_has_stream_pointer: BOOLEAN False

feature {}
   dispose
      do
         -- No need to force people to disconnect such a STREAM.
      end

end -- class NULL_INPUT_STREAM
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
