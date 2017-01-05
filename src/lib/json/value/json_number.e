-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class JSON_NUMBER

inherit
   JSON_VALUE
      redefine
         is_equal, out_in_tagged_out_memory
      end

create {JSON_HANDLER}
   make

feature {ANY}
   accept (visitor: VISITOR)
      local
         v: JSON_VISITOR
      do
         v ::= visitor
         v.visit_number(Current)
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result :=   sign     = other.sign
            and then int      = other.int
            and then frac     = other.frac
            and then frac_exp = other.frac_exp
            and then exp      = other.exp
      end

   is_integer: BOOLEAN
      do
         Result := frac_exp <= exp --| **** TODO manage overflows
      end

   to_integer: INTEGER_64
      require
         is_integer
      do
         Result := sign * int.to_integer_64 * {INTEGER_64 10} ^ exp
            + sign * frac.to_integer_64 * {INTEGER_64 10} ^ (exp - frac_exp)
      end

   to_real: REAL_64
      do
         Result := sign * int.to_real_64 * ({INTEGER_64 10} ^ exp).to_real_64
            + sign * frac.to_real_64 / ({INTEGER_64 10} ^ (frac_exp - exp)).to_real_64
      end

   append_in (str: STRING)
      local
         strout: STRING_OUTPUT_STREAM
      do
         create strout.connect_to(str)
         write_to(strout)
         strout.disconnect
      end

   write_to (str: OUTPUT_STREAM)
      require
         str.is_connected
      local
         frac10: NATURAL_64
      do
         if sign < 0 then
            str.put_character('-')
         end
         str.put_natural_64(int)
         if frac_exp > 0 then
            str.put_character('.')
            from
               frac10 := ({INTEGER_64 10} ^ (frac_exp - 1)).to_natural_64
            until
               frac10 <= frac
            loop
               str.put_character('0')
               frac10 := frac10 // 10.to_natural_64
            end
            str.put_natural_64(frac)
         end
         if exp /= 0 then
            str.put_character('e')
            str.put_integer(exp)
         end
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(once "JSON_NUMBER[")
         append_in(tagged_out_memory)
         tagged_out_memory.extend(']')
      end

feature {JSON_HANDLER}
   sign: INTEGER_8
   int, frac: NATURAL_64
   frac_exp, exp: INTEGER_64

feature {}
   make (a_sign: like sign; a_int: like int; a_frac: like frac; a_frac_exp: like frac_exp; a_exp: like exp)
      require
         a_sign = 1 or else a_sign = -1
         a_frac_exp >= 0
      do
         sign := a_sign
         int := a_int
         frac := a_frac
         frac_exp := a_frac_exp
         exp := a_exp
      ensure
         sign = a_sign
         int = a_int
         frac = a_frac
         frac_exp = a_frac_exp
         exp = a_exp
      end

invariant
   sign = 1 or else sign = -1
   frac_exp >= 0

end -- class JSON_NUMBER
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
