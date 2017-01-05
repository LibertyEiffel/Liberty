-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2017: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
class EDC_STRING_STREAM

inherit
   TERMINAL_INPUT_OUTPUT_STREAM
      redefine valid_last_character
      end

create {EDC_BLOB}
   from_string

feature {EDC_BLOB}
   from_string (a_string: like string)
      do
         if string = Void then
            string := a_string.twin
         else
            string.copy(a_string)
         end
         offset := string.lower - 1
      end

   to_string: STRING
      do
         Result := once ""
         Result.copy(string)
      end

feature {ANY}
   end_of_input: BOOLEAN
      do
         Result := offset > string.upper
      end

   is_connected: BOOLEAN True

   can_unread_character: BOOLEAN
      do
         Result := offset >= string.lower
      end

   disconnect
      do
         filter := Void
      end

   valid_last_character: BOOLEAN
      do
         Result := string.valid_index(offset)
      end

   append_in (a_string: STRING)
         -- Append the contents of the internal buffer to the given string.
      require
         a_string /= Void
      do
         a_string.append(string)
      end

   clear
         -- Remove all stored characters
      do
         string.clear_count
         offset := string.lower - 1
      ensure
         string.is_empty
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

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         string.extend(c)
      end

   filtered_flush
      do
         -- nothing to do
      end

feature {FILTER}
   filtered_descriptor: INTEGER
      do
         check
            False
         end
      end

   filtered_has_descriptor: BOOLEAN False

   filtered_stream_pointer: POINTER
      do
         check
            False
         end
      end

   filtered_has_stream_pointer: BOOLEAN False

feature {}
   string: STRING

   offset: INTEGER

end -- class EDC_STRING_STREAM
