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
   accept (visitor: VISITOR) is
      local
         v: JSON_VISITOR
      do
         v ::= visitor
         v.visit_number(Current)
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result :=   int      = other.int
            and then frac     = other.frac
            and then frac_exp = other.frac_exp
            and then exp      = other.exp
      end

   is_integer: BOOLEAN is
      do
         Result := frac_exp <= exp --| **** TODO manage overflows
      end

   to_integer: INTEGER_64 is
      require
         is_integer
      do
         Result := int * {INTEGER_64 10} ^ exp
            + int.sign * frac * {INTEGER_64 10} ^ (exp - frac_exp)
      end

   to_real: REAL_64 is
      do
         Result := int.to_real_64 * ({INTEGER_64 10} ^ exp).to_real_64
            + int.sign * frac.to_real_64 / ({INTEGER_64 10} ^ (frac_exp - exp)).to_real_64
      end

   append_in (str: STRING) is
      require
         str /= Void
      local
         frac10: INTEGER_64
      do
         int.append_in(str)
         if frac_exp > 0 then
            str.extend('.')
            from
               frac10 := {INTEGER_64 10} ^ (frac_exp - 1)
            until
               frac10 <= frac
            loop
               str.extend('0')
               frac10 := frac10 // 10
            end
            frac.append_in(str)
         end
         if exp /= 0 then
            str.extend('e')
            exp.append_in(str)
         end
      end

   out_in_tagged_out_memory is
      do
         tagged_out_memory.append(once "[NUMBER int=")
         int.append_in(tagged_out_memory)
         tagged_out_memory.append(once ", frac=")
         frac.append_in(tagged_out_memory)
         tagged_out_memory.append(once ", frac_exp=")
         frac_exp.append_in(tagged_out_memory)
         tagged_out_memory.append(once ", exp=")
         exp.append_in(tagged_out_memory)
         tagged_out_memory.append(once " => ")
         append_in(tagged_out_memory)
         tagged_out_memory.extend(']')
      end

feature {JSON_VISITOR, JSON_NUMBER}
   int, frac, frac_exp, exp: INTEGER_64

feature {}
   make (a_int, a_frac, a_frac_exp, a_exp: INTEGER_64) is
      do
         int := a_int
         frac := a_frac
         frac_exp := a_frac_exp
         exp := a_exp
      ensure
         int = a_int
         frac = a_frac
         frac_exp = a_frac_exp
         exp = a_exp
      end

end -- class JSON_NUMBER
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
