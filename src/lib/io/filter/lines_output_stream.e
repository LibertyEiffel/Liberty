-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LINES_OUTPUT_STREAM
   --
   -- An output stream that flushes at each newline.
   --

inherit
   FILTER_OUTPUT_STREAM
      rename
         connect_to as reconnect_to
      end

create {ANY}
   connect_to

feature {}
   local_can_disconnect: BOOLEAN True

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         stream.filtered_put_character(c)
         if c = '%N' then
            filtered_flush
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

invariant
   stream /= Void

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
