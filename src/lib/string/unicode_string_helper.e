-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class UNICODE_STRING_HELPER

feature {ANY}
   utf8_character_in (character: INTEGER; s: STRING)
      require
         character >= 0
         s /= Void
      local
         v: INTEGER
      do
         v := character
         if v < 128 then
            s.extend(v.to_character)
         elseif v < 2048 then
            s.extend((v #// 64 + 192).to_character)
            s.extend((v #\\ 64 + 128).to_character)
         elseif v < 65536 then
            s.extend((v #// 4096 + 224).to_character)
            v := v #\\ 4096
            s.extend((v #// 64 + 128).to_character)
            s.extend((v #\\ 64 + 128).to_character)
         else
            check
               v < 0x00110000
            end
            s.extend((v #// 0x00040000 + 240).to_character)
            v := v #\\ 0x00040000
            s.extend((v #// 0x00001000 + 128).to_character)
            v := v #\\ 0x00001000
            s.extend((v #// 64 + 128).to_character)
            s.extend((v #\\ 64 + 128).to_character)
         end
      end

end -- class UNICODE_STRING_HELPER
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
