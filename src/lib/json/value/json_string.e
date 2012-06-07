-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_STRING

inherit
   JSON_VALUE
      undefine
         is_equal
      redefine
         out_in_tagged_out_memory
      end

insert
   HASHABLE
      redefine
         out_in_tagged_out_memory
      end
   UNICODE_STRING_HELPER
      undefine
         is_equal
      redefine
         out_in_tagged_out_memory
      end

create {JSON_HANDLER}
   make

feature {ANY}
   accept (visitor: VISITOR) is
      local
         v: JSON_VISITOR
      do
         v ::= visitor
         v.visit_string(Current)
      end

   hash_code: INTEGER

   is_equal (other: like Current): BOOLEAN is
      do
         Result := string.is_equal(other.string)
      end

   append_in (str: STRING; raw: BOOLEAN) is
         -- Append the JSON string into `str'
         -- If `raw' is True, append raw utf8 codes; otherwise, use '\u' sequences
      require
         str /= Void
      local
         i, u: INTEGER
      do
         str.extend('"')
         from
            i := string.lower
         until
            i > string.upper
         loop
            u := string.item(i)
            inspect
               u
            when 0..31, 127 then
               append_unicode_in(str, u)
            when 32..126 then
               str.extend(u.to_character)
            else
               if raw then
                  utf8_character_in(u, str)
               else
                  append_unicode_in(str, u)
               end
            end
            i := i + 1
         end
         str.extend('"')
      end

   out_in_tagged_out_memory is
      do
         append_in(tagged_out_memory, False)
      end

feature {JSON_VISITOR, JSON_STRING}
   string: UNICODE_STRING

feature {}
   make (a_string: like string) is
      require
         a_string /= Void
      do
         string := a_string
         hash_code := a_string.hash_code
      ensure
         string = a_string
      end

   append_unicode_in (str: STRING; u: INTEGER) is
      local
         h: INTEGER; hex: STRING
      do
         str.extend('\')
         str.extend('u')
         hex := once ""
         hex.copy(once "0000")
         u.to_hexadecimal_in(hex)
         from
            h := hex.upper - 3
         until
            h > hex.upper
         loop
            str.extend(hex.item(h))
            h := h + 1
         end
      end

invariant
   string /= Void
   hash_code = string.hash_code

end -- class JSON_STRING
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
