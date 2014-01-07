-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright(C) 2006-2009: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
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
class EDC_STORABLE_SAVEPOINT_STREAM

inherit
   TERMINAL_INPUT_OUTPUT_STREAM
      redefine can_disconnect
      end

create {EDC_STORABLE_SAVEPOINT}
   make

feature {ANY}
   is_connected: BOOLEAN is True

   can_disconnect: BOOLEAN is False

   disconnect is
      do
         crash
      end

feature {EDC_STORABLE_SAVEPOINT}
   reset is
      do
         index := 0
      end

   clear is
      do
         buffer.clear_count
         reset
      end

feature {ANY}
   end_of_input: BOOLEAN is
      do
         Result := index > buffer.upper
      end

   can_unread_character: BOOLEAN is
      do
         Result := index > buffer.lower
      end

feature {FILTER_INPUT_STREAM} -- input features:
   filtered_read_character is
      do
         index := index + 1
      end

   filtered_unread_character is
      do
         index := index - 1
      end

   filtered_last_character: CHARACTER is
      do
         Result := buffer.item(index)
      end

feature {FILTER_OUTPUT_STREAM} -- output features:
   filtered_put_character (c: CHARACTER) is
      do
         buffer.force(c, index)
         index := index + 1
      end

   filtered_flush is
      do
         -- nothing
      end

feature {FILTER} -- meaningless features:
   filtered_descriptor: INTEGER is
      do
         crash
      end

   filtered_has_descriptor: BOOLEAN is False

   filtered_stream_pointer: POINTER is
      do
         crash
      end

   filtered_has_stream_pointer: BOOLEAN is False

feature {}
   make is
      do
         create buffer.with_capacity(4096)
         index := 0
      end

   buffer: FAST_ARRAY[CHARACTER]

   index: INTEGER

invariant
   not_filtered: not input_is_filtered and not output_is_filtered

end -- class EDC_STORABLE_SAVEPOINT_STREAM
