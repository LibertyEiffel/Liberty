-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_STRING

inherit
   JSON_VALUE
      redefine
         out_in_tagged_out_memory, is_equal
      end

insert
   HASHABLE
      redefine
         out_in_tagged_out_memory
      end
   UNICODE_STRING_HELPER
      redefine
         out_in_tagged_out_memory, is_equal
      end

create {JSON_HANDLER}
   make, from_string

feature {ANY}
   accept (visitor: VISITOR)
      local
         v: JSON_VISITOR
      do
         v ::= visitor
         v.visit_string(Current)
      end

   hash_code: INTEGER

   is_equal (other: like Current): BOOLEAN
      do
         Result := string.is_equal(other.string)
      end

   append_in (str: STRING; raw: BOOLEAN)
         -- Append the JSON string into `str'
         -- If `raw' is True, append raw UTF-8 codes; otherwise, use '\u' sequences
      require
         str /= Void
      local
         strout: STRING_OUTPUT_STREAM
      do
         create strout.connect_to(str)
         write_to(strout, raw)
         strout.disconnect
      end

   write_to (str: OUTPUT_STREAM; raw: BOOLEAN)
         -- Write the JSON string to `str'
         -- If `raw' is True, write raw UTF-8 codes; otherwise, use '\u' sequences
      require
         str.is_connected
      local
         i, u: INTEGER; utf8: STRING
      do
         str.put_character('"')
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
               str.put_character(u.to_character)
            else
               if raw then
                  utf8 := once ""
                  utf8.clear_count
                  utf8_character_in(u, utf8)
                  str.put_string(utf8)
               else
                  append_unicode_in(str, u)
               end
            end
            i := i + 1
         end
         str.put_character('"')
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "JSON_STRING[")
         append_in(tagged_out_memory, False)
         tagged_out_memory.extend(']')
      end

feature {JSON_HANDLER}
   string: UNICODE_STRING

   invalidate
         -- Allows to modify the string, e.g. to clean it. Note: an invalidated string cannot be revalidated.
      do
         is_valid := False
      end

   is_valid: BOOLEAN

feature {}
   make (a_string: like string)
      require
         a_string /= Void
      do
         is_valid := True
         string := a_string
         hash_code := a_string.hash_code
      ensure
         string = a_string
         set_string_invariant(a_string)
         is_valid
      end

   from_string (a_string: ABSTRACT_STRING)
      do
         make(create {UNICODE_STRING}.from_utf8(a_string.out))
      end

   append_unicode_in (str: OUTPUT_STREAM; u: INTEGER)
      local
         h: INTEGER; hex: STRING
      do
         str.put_character('\')
         str.put_character('u')
         hex := once ""
         hex.copy(once "0000")
         u.to_hexadecimal_in(hex)
         from
            h := hex.upper - 3
         until
            h > hex.upper
         loop
            str.put_character(hex.item(h))
            h := h + 1
         end
      end

   set_string_invariant (a_string: like string): BOOLEAN
      require
         a_string /= Void
      do
         string_invariant := a_string.twin
         Result := True
      end

   string_invariant: like string

invariant
   string_exists: string /= Void
   invariant_string: is_valid implies string_invariant.is_equal(string)
   invariant_hash_code: is_valid implies hash_code = string.hash_code -- of course, but better said...

end -- class JSON_STRING
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
