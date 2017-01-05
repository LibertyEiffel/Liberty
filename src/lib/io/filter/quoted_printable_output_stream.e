-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class QUOTED_PRINTABLE_OUTPUT_STREAM
   --
   -- A quoted-printable encoder. The underlying stream gets encoded in quoted-printable via this filter.
   --

inherit
   FILTER_OUTPUT_STREAM

create {ANY}
   connect_to

feature {}
   local_can_disconnect: BOOLEAN True

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         inspect
            c.code
         when 0 .. 9, 11 .. 31, 128 .. 255 then
            put_quoted_character(c)
         else
            stream.filtered_put_character(c)
         end
      end

   filtered_flush
      do
         stream.filtered_flush
      end

feature {}
   put_quoted_character (c: CHARACTER)
      local
         s: STRING
      do
         s := once ""
         s.clear_count
         c.code.to_hexadecimal_in(s)
         stream.filtered_put_character('=')
         stream.filtered_put_character(s.item(s.upper - 1))
         stream.filtered_put_character(s.last)
      end

end -- class QUOTED_PRINTABLE_OUTPUT_STREAM
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
