-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STRING_OUTPUT_STREAM
   --
   -- An output stream where data is written to a string buffer.
   --

inherit
   TERMINAL_OUTPUT_STREAM
      redefine put_abstract_string, dispose
      end

create {ANY}
   make, connect_to

feature {ANY}
   to_string: STRING
         -- A copy of the internal buffer. If you don't want memory consumption, see `append_in'.
      do
         Result := string.twin
      end

   append_in (a_string: STRING)
         -- Append the contents of the internal buffer to the given string.
      require
         a_string /= Void
      do
         a_string.append(string)
      end

   write_to (output: OUTPUT_STREAM)
         -- Write the contents of the internal buffer to the given output stream.
      require
         output.is_connected
      do
         output.put_string(string)
      end

   count: INTEGER
         -- The size of the internal buffer
      do
         Result := string.count
      end

   is_connected: BOOLEAN

   disconnect
      do
         filter := Void
         is_connected := False
      end

   clear
         -- Remove all stored characters
      do
         string.clear_count
      ensure
         string.is_empty
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         string.extend(c)
      end

   filtered_flush
      do
         -- nothing to do
      end

feature {ABSTRACT_STRING}
   put_abstract_string (s: ABSTRACT_STRING)
      do
         string.append(s)
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         std_error.put_string("STRING_OUTPUT_STREAM.filtered_descriptor has been called!%N")
         crash
      end

   filtered_has_descriptor: BOOLEAN False

   filtered_stream_pointer: POINTER
      do
         std_error.put_string("STRING_OUTPUT_STREAM.filtered_stream_pointer has been called!%N")
         crash
      end

   filtered_has_stream_pointer: BOOLEAN False

feature {}
   make
      do
         string := ""
         is_connected := True
      end

   connect_to (a_string: like string)
      require
         not a_string.immutable
      do
         string := a_string
         is_connected := True
      ensure
         string = a_string
      end

   string: STRING
         -- where the characters go to

   dispose
      do
         -- No need to force people to disconnect such a STREAM.
      end

invariant
   not string.immutable

end -- class STRING_OUTPUT_STREAM
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
