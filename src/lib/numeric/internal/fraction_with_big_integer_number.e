-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FRACTION_WITH_BIG_INTEGER_NUMBER
   --
   -- To implement NUMBER (do not use this class, see NUMBER).
   --

inherit
   FRACTION_GENERAL_NUMBER

create {ANY}
   make, make_simply

feature {ANY}
   numerator: INTEGER_GENERAL_NUMBER

   denominator: INTEGER_GENERAL_NUMBER

feature {NUMBER}
   make (n, d: INTEGER_GENERAL_NUMBER)
         -- Create a simplified large_fraction
      require
         not ((n \\ d) @= 0)
      local
         gcd_frac, num, den: INTEGER_GENERAL_NUMBER
      do
         gcd_frac := n.gcd(d)
         num ::= n // gcd_frac
         den ::= d // gcd_frac
         if den.is_negative then
            numerator ::= -num
            denominator ::= -den
         else
            numerator := num
            denominator := den
         end
      end

   make_simply (n, d: INTEGER_GENERAL_NUMBER)
         -- create a large_fraction without simplify it
      require
         d.is_positive
         n.gcd(d).is_one
         d @>= 2
      do
         numerator := n
         denominator := d
      ensure
         numerator = n
         denominator = d
      end

feature {ANY}
   inverse: NUMBER
      local
         tmp1, tmp2: INTEGER_GENERAL_NUMBER
      do
         if numerator @= 1 then
            Result := denominator
         elseif numerator @= -1 then
            Result := -denominator
         elseif is_negative then
            tmp1 ::= -denominator
            tmp2 ::= -numerator
            create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(tmp1, tmp2)
         else
            create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(denominator, numerator)
         end
      end

   prefix "-": NUMBER
      local
         tmp: INTEGER_GENERAL_NUMBER
      do
         tmp ::= -numerator
         create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(tmp, denominator)
      end

   infix "+" (other: NUMBER): NUMBER
      do
         Result := other.add_with_fraction_with_big_integer_number(Current)
      end

   append_in (buffer: STRING)
      do
         numerator.append_in(buffer)
         buffer.extend('/')
         denominator.append_in(buffer)
      end

   append_in_unicode (buffer: UNICODE_STRING)
      do
         numerator.append_in_unicode(buffer)
         buffer.extend('/'.code)
         denominator.append_in_unicode(buffer)
      end

   append_decimal_in (buffer: STRING; digits: INTEGER; all_digits: BOOLEAN)
      do
         decimal_in(buffer, numerator, denominator, is_negative, digits, all_digits)
      end

   is_equal (other: NUMBER): BOOLEAN
      local
         n2: like Current
      do
         if n2 ?:= other then
            n2 ::= other
            Result := denominator.is_equal(n2.denominator) and then numerator.is_equal(n2.numerator)
         end
      end

   force_to_real_64: REAL_64
         --|*** This is not very good, bad precision on big numbers
         --| (Vincent Croizier, 05/07/04) ***
      do
         Result := numerator.force_to_real_64 / denominator.force_to_real_64
      end

   infix "*" (other: NUMBER): NUMBER
      do
         Result := other.multiply_with_fraction_with_big_integer_number(Current)
      end

   infix "@+" (other: INTEGER_64): NUMBER
         -- Sum of 'Current' and 'other'.
      local
         tmp: INTEGER_GENERAL_NUMBER
      do
         tmp ::= denominator @* other + numerator
         create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(tmp, denominator)
      end

feature {NUMBER, NUMBER_TOOLS}
   add_with_big_integer_number (other: BIG_INTEGER_NUMBER): NUMBER
      local
         tmp: INTEGER_GENERAL_NUMBER
      do
         tmp ::= other * denominator + numerator
         Result := from_two_integer_general_number(tmp, denominator)
      end

   add_with_fraction_with_big_integer_number (other: FRACTION_WITH_BIG_INTEGER_NUMBER): NUMBER
      local
         new_num, new_den, dg, d1, d2, g: INTEGER_GENERAL_NUMBER
      do
         if denominator.is_equal(other.denominator) then
            new_num ::= numerator + other.numerator
            if new_num.is_zero then
               Result := zero
            else
               g := new_num.gcd(denominator)
               if denominator.is_equal(g) then
                  Result := new_num // g
               else
                  new_num ::= new_num // g
                  new_den ::= denominator // g
                  create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(new_num, new_den)
               end
            end
         else
            dg := denominator.gcd(other.denominator)
            check
               dg.is_positive
            end
            d1 ::= denominator // dg
            d2 ::= other.denominator // dg
            check
               denominator.is_equal(dg * d1)
               other.denominator.is_equal(dg * d2)
            end
            new_num ::= numerator * d2 + other.numerator * d1
            if new_num.is_zero then
               Result := new_num
            else
               new_den ::= denominator * d2
               g := new_num.gcd(dg)
               if g.is_one then
                  create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(new_num, new_den)
               else
                  new_num ::= new_num // g
                  new_den ::= new_den // g
                  check
                     not new_den.is_one
                  end
                  create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(new_num, new_den)
               end
            end
         end
      end

   multiply_with_big_integer_number (other: BIG_INTEGER_NUMBER): NUMBER
      local
         g, n, d: INTEGER_GENERAL_NUMBER
      do
         g := other.gcd(denominator)
         d ::= denominator // g
         n ::= numerator * (other // g)
         if d.is_one then
            Result := n
         else
            create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(n, d)
         end
      end

   multiply_with_fraction_with_big_integer_number (other: FRACTION_WITH_BIG_INTEGER_NUMBER): NUMBER
      local
         g1, g2, n, d: INTEGER_GENERAL_NUMBER
      do
         g1 := numerator.gcd(other.denominator)
         g2 := denominator.gcd(other.numerator)
         n ::= numerator // g1 * (other.numerator // g2)
         d ::= denominator // g2 * (other.denominator // g1)
         if d.is_one then
            Result := n
         else
            create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(n, d)
         end
      end

feature {ANY}
   infix "@*" (other: INTEGER_64): NUMBER
      local
         tmp1, tmp2, g: INTEGER_GENERAL_NUMBER
      do
         g := denominator.gcd(other.to_number)
         check
            g.is_integer_64
         end
         if g.is_one then
            tmp1 ::= numerator @* other
            create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(tmp1, denominator)
         elseif denominator.is_equal(g) then
            Result := numerator @* (other // g.to_integer_64)
         else
            tmp1 ::= numerator @* (other // g.to_integer_64)
            tmp2 ::= denominator // g
            create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(tmp1, tmp2)
         end
      end

   infix "@/" (other: INTEGER_64): NUMBER
      local
         tmp1, tmp2, g: INTEGER_GENERAL_NUMBER
      do
         if other = 1 then
            Result := Current
         elseif other = -1 then
            Result := -Current
         else
            g := numerator.gcd(other.to_number)
            check
               g.is_integer_64
            end
            if g.is_one then
               if other < 0 then
                  tmp1 ::= -numerator
                  tmp2 ::= -(denominator @* other)
                  create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(tmp1, tmp2)
               else
                  tmp2 ::= denominator @* other
                  create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(numerator, tmp2)
               end
            elseif other < 0 then
               tmp1 ::= -(numerator // g)
               tmp2 ::= -denominator @* (other // g.to_integer_64)
               create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(tmp1, tmp2)
            else
               tmp1 ::= numerator // g
               tmp2 ::= denominator @* (other // g.to_integer_64)
               create {FRACTION_WITH_BIG_INTEGER_NUMBER} Result.make_simply(tmp1, tmp2)
            end
         end
      end

   infix "@<" (other: INTEGER_64): BOOLEAN
      do
         if is_negative then
            if other < 0 then
               Result := numerator < denominator @* other
            else
               Result := True
            end
         else
            if other >= 0 then
               Result := numerator < denominator @* other
            end
         end
      end

   infix "@>" (other: INTEGER_64): BOOLEAN
      do
         Result := not (Current @< other)
      end

   infix "@<=" (other: INTEGER_64): BOOLEAN
      do
         Result := Current @< other
      end

   infix "@>=" (other: INTEGER_64): BOOLEAN
      do
         Result := not (Current @< other)
      end

   infix "<" (other: NUMBER): BOOLEAN
      do
         Result := other.greater_with_fraction_with_big_integer_number(Current)
      end

   infix "#=" (other: REAL_64): BOOLEAN
      do
         if is_negative then
            if other >= 0 then
            elseif Current < min_double then
            else
               Result := force_to_real_64 = other
            end
         elseif other < 0 then
         elseif Current > max_double then
         else
            Result := force_to_real_64 = other
         end
      end

   infix "#<" (other: REAL_64): BOOLEAN
      do
         if is_negative then
            if other >= 0 then
               Result := True
            elseif Current < min_double then
               Result := True
            else
               Result := force_to_real_64 < other
            end
         elseif other < 0 then
         elseif Current > max_double then
         else
            Result := force_to_real_64 < other
         end
      end

   infix "#<=" (other: REAL_64): BOOLEAN
      do
         if is_negative then
            if other >= 0 then
               Result := True
            elseif Current <= -max_double then
               Result := True
            else
               Result := force_to_real_64 <= other
            end
         elseif other <= 0 then
         elseif Current >= max_double then
         else
            Result := force_to_real_64 <= other
         end
      end

   infix "#>=" (other: REAL_64): BOOLEAN
      do
         if is_negative then
            if other >= 0 then
            elseif Current <= min_double then
            else
               Result := force_to_real_64 >= other
            end
         elseif other <= 0 then
            Result := True
         elseif Current >= max_double then
            Result := True
         else
            Result := force_to_real_64 >= other
         end
      end

   infix "#>" (other: REAL_64): BOOLEAN
      do
         if is_negative then
            if other >= 0 then
            elseif Current < min_double then
            else
               Result := force_to_real_64 > other
            end
         elseif other < 0 then
            Result := True
         elseif Current > max_double then
            Result := True
         else
            Result := force_to_real_64 > other
         end
      end

feature {NUMBER, NUMBER_TOOLS}
   greater_with_big_integer_number (other: BIG_INTEGER_NUMBER): BOOLEAN
      do
         Result := denominator.multiply_with_big_integer_number(other) < numerator
      end

   greater_with_fraction_with_big_integer_number (other: FRACTION_WITH_BIG_INTEGER_NUMBER): BOOLEAN
      do
         if is_negative = other.is_negative then
            Result := numerator * other.denominator > other.numerator * denominator
         elseif other.is_negative then
            Result := True
         end
      end

end -- class FRACTION_WITH_BIG_INTEGER_NUMBER
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
