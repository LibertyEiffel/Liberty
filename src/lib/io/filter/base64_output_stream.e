-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BASE64_OUTPUT_STREAM
   --
   -- A Base64 encoder. The underlying stream gets encoded in Base64 via this filter.
   --

inherit
   FILTER_OUTPUT_STREAM
      redefine disconnect
      end

create {ANY}
   connect_to

feature {ANY}
   disconnect
      local
         k: INTEGER
      do
         -- Before closing the stream, add the padding characters:
         inspect
            state
         when 0 then
            -- nothing to add
         when 1 then
            k := previous_character.code & 3 |<< 4
            stream.filtered_put_character(t2b(k))
            stream.filtered_put_character('=')
            stream.filtered_put_character('=')
         when 2 then
            k := previous_character.code & 15 |<< 2
            stream.filtered_put_character(t2b(k))
            stream.filtered_put_character('=')
         end
         -- To be able to use the object again (via another `connect_to'):
         state := 0 -- Now close the stream:
         Precursor
      end

feature {}
   local_can_disconnect: BOOLEAN True

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      local
         k: INTEGER
      do
         inspect
            state
         when 0 then
            k := c.code |>> 2
            stream.filtered_put_character(t2b(k))
            state := 1
         when 1 then
            k := previous_character.code & 3 |<< 4 | (c.code |>> 4)
            stream.filtered_put_character(t2b(k))
            state := 2
         when 2 then
            k := previous_character.code & 15 |<< 2 | (c.code |>> 6)
            stream.filtered_put_character(t2b(k))
            k := c.code & 63
            stream.filtered_put_character(t2b(k))
            state := 0
         end
         previous_character := c
      end

   filtered_flush
      do
         stream.filtered_flush
      end

feature {}
   state: INTEGER

   previous_character: CHARACTER

feature {}
   alphabet: STRING "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

   t2b (code: INTEGER): CHARACTER
      require
         code >= 0 and then code < 64
      do
         Result := alphabet.item(code + 1)
      ensure
         alphabet.has(Result)
      end

end -- class BASE64_OUTPUT_STREAM
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
