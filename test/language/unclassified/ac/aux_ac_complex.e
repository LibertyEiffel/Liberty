-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class AUX_AC_COMPLEX

insert
   NUMERIC
      redefine out
      end

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := standard_is_equal(other)
      end

   is_near_equal (other: like Current): BOOLEAN
      do
         Result := re ~= other.re and im ~= other.im
      end

   re: REAL

   im: REAL

   make (r, i: REAL): like Current
      do
         Result.set_item(r, i)
      end

   set_item (r, i: REAL)
      do
         re := r
         im := i
      end

   infix "+" (other: like Current): like Current
      do
         Result.set_item(re + other.re, im + other.im)
      end

   infix "-" (other: like Current): like Current
      do
         Result.set_item(re - other.re, im - other.im)
      end

   infix "*" (other: like Current): like Current
      do
         Result.set_item(re * other.re - im * other.im, re * other.im + im * other.re)
      end

   infix "/" (other: like Current): like Current
         -- The ratio of self and `other'.
         -- From Numerical Recipes in C, 2nd ed. p. 949.
      local
         r, den: REAL
      do
         if other.re.abs >= other.im.abs then
            r := other.im / other.re
            den := other.re + r * other.im
            Result.set_item((re + r * im) / den, (im - r * re) / den)
         else
            r := other.re / other.im
            den := other.im + r * other.re
            Result.set_item((re * r + im) / den, (im * r - re) / den)
         end
      end

   prefix "-": like Current
      do
         Result.set_item(-re, -im)
      end

   prefix "+": like Current
      do
         Result.set_item(re, im)
      end

   valid_divisor (other: like Current): BOOLEAN
      do
         Result := other /= zero
      end

   sign: INTEGER_8
      do
         check
            False
         end
      end

   divisible (other: like Current): BOOLEAN
      do
         Result := re /= 0 or else im /= 0
      end

   one: like Current
      do
         Result.set_item(re.one, im.zero)
      end

   zero: like Current
      do
         Result.set_item(re.zero, im.zero)
      end

   plus_scalar (scalar: REAL): like Current
      do
         Result.set_item(re + scalar, im)
      end

   times_scalar (scalar: REAL): like Current
      do
         Result.set_item(re * scalar, im * scalar)
      end

   exp: like Current
         -- The complex exponential `e^self'.
      local
         rp: REAL
      do
         rp := re.exp
         Result.set_item(rp * im.cos, rp * im.sin)
      end

   out: STRING
      do
         create Result.make(24)
         Result.append("(")
         Result.append(re.out)
         Result.append(", ")
         Result.append(im.out)
         Result.append(")")
      ensure
         not Result.is_empty
      end

   set_item_numeric (other: like Current)
      do
         set_item(other.re, other.im)
      end

feature {ANY}
   hash_code: INTEGER
      do
         Result := re.hash_code + im.hash_code
      end

end -- class AUX_AC_COMPLEX
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
