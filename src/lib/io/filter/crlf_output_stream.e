-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CRLF_OUTPUT_STREAM
   --
   -- An output stream that forces newlines to be internet-compatible CRLF (ASCII codes 13, 10)
   -- sequences. Each line (esp. the last once) must be finished by such a sequence.
   --

inherit
   FILTER_OUTPUT_STREAM
      rename
         connect_to as reconnect_to
      end

create {ANY}
   connect_to

feature {}
   local_can_disconnect: BOOLEAN
         -- Lines must be finished: can disconnect only after a CRLF sequence
      do
         Result := state = State_new_line
      end

   state: INTEGER_8

   State_new_line: INTEGER_8 0
   State_in_line: INTEGER_8 1
   State_after_carriage_return: INTEGER_8 2

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         inspect state
         when State_new_line, State_in_line then
            inspect c
            when '%R' then
               stream.filtered_put_character(c)
               state := State_after_carriage_return
            when '%N' then
               stream.filtered_put_character('%R')
               stream.filtered_put_character(c)
               state := State_new_line
            else
               stream.filtered_put_character(c)
               state := State_in_line
            end
         when State_after_carriage_return then
            inspect c
            when '%R' then
               stream.filtered_put_character(c)
            when '%N' then
               stream.filtered_put_character(c)
               state := State_new_line
            else
               stream.filtered_put_character(c)
               state := State_in_line
            end
         end
      end

   filtered_flush
      do
         stream.filtered_flush
      end

feature {}
   connect_to (a_stream: like stream)
      require
         a_stream /= Void
      do
         a_stream.set_filter(Current)
         stream := a_stream
      ensure
         stream = a_stream
      end

end -- class LINES_OUTPUT_STREAM
--
-- Copyright (C) 2013-2017: Cyril ADRIAN <cyril.adrian@gmail.com>
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
