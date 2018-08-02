-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class COMPLEX_GENERAL[A_SIZE -> FLOAT]
   --
   -- Common ancestor of all complex types: COMPLEX_32, COMPLEX_64, ...
   --

insert
   NUMERIC
      rename sign as real_sign
      redefine out, fill_tagged_out_memory
      end
   MATH_CONSTANTS
      -- to get Pi
      undefine is_equal, out, fill_tagged_out_memory
      end
   EXCEPTIONS
      undefine is_equal, out, fill_tagged_out_memory
      end

feature {ANY}
   set_i
         -- Set Current to the imaginary unit
      do
         real := real.zero
         imaginary := imaginary.one
      end

   set, set_cartesian (a_real_part, an_imaginary_part: A_SIZE)
      do
         real := a_real_part
         imaginary := an_imaginary_part
      end

   set_polar (a_modulus, a_phase: A_SIZE)
      do
         real := a_modulus * a_phase.cos
         imaginary := a_modulus * a_phase.sin
         not_yet_implemented
      end

feature {ANY}
   infix "+" (other: like Current): like Current
      do
         Result.set(real + other.real, imaginary + other.imaginary)
      end

   infix "-" (other: like Current): like Current
      do
         Result.set(real - other.real, imaginary - other.imaginary)
      end

   infix "*" (other: like Current): like Current
      do
         Result.set(real * other.real - imaginary * other.imaginary, imaginary * other.real + real * other.imaginary)
      end

   infix "/" (other: like Current): like Current
      local
         den: A_SIZE
      do
         den := other.squared_modulus
         Result.set(real * other.real - imaginary * other.imaginary, imaginary * other.real + real * other.imaginary)
      end

   infix "^" (e: INTEGER): like Current
      local
         ci, ni: INTEGER
      do
         -- current index and index of the next iteration
         from
            Result := Current
            ci := 1
            ni := 2
         until
            ni > e
         loop
            Result := Result * Result
            ci := ni
            ni := ni * 2
         end

         from
         until
            ci = e
         loop
            Result := Result * Current
            ci := ci + 1
         end
      end

   prefix "+": like Current
      do
         Result := Current
      end

   prefix "-": like Current
      do
         Result.set(-real, -imaginary)
      end

   divisible (other: like Current): BOOLEAN
      do
         Result := other /= zero
      end

   hash_code: INTEGER
      do
         Result := (real + imaginary).hash_code
         -- Note: it is debatable if such an hash code implementation is actually useful.
      end

   real_sign: INTEGER_8
      do
         Result := real.sign
      end

   sign: like Current
      require
         not is_zero
      local
         coeff: A_SIZE
      do
         -- See http://en.wikipedia.org/wiki/Sign_function sign is NOT an INTEGER_8 for a complex but like Current!
         -- It could be naively implemented with
         Result.set_polar(coeff.one, phase)
         -- but it may be implemented in a better way.
      end

   is_zero: BOOLEAN
      do
         Result := real ~= real.zero and imaginary ~= real.zero
      end

   zero: like Current
      do
         Result.set(real.zero, imaginary.zero)
      end

   one: like Current
      do
         Result.set(real.one, imaginary.zero)
      end

   i: like Current
         -- Imaginary unit
      do
         Result.set_i
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := real = other.real and then imaginary = other.imaginary
      end

   is_near_equal, infix "~=" (other: like Current): BOOLEAN
      do
         debug
            print(&Current + " ~= " + &other + "%N")
         end
         Result := real ~= other.real and imaginary ~= other.imaginary
      end

   conjugate: like Current
      do
         Result.set(real, -imaginary)
      end

feature {ANY} -- Cartesian representation
   real, imaginary: A_SIZE

feature {ANY} -- Polar representation
   modulus: A_SIZE
      do
         Result := squared_modulus.sqrt
      ensure
         non_negative: Result.sign /= -1
      end

   phase: A_SIZE
      require
         not is_zero
      do
         not_yet_implemented
         -- Pi is not converted automatically to A_SIZE
         -- inspect real.sign
         -- when  1 then Result := imaginary.atan2(real) -- same as (imaginary/real).atan
         -- when -1 then
         --     if imaginary.sign = -1 then Result := imaginary.atan2(real) + Pi
         --     else Result := imaginary.atan2(real) - Pi
         --     end
         -- else
         --     inspect imaginary.sign
         --     when  1 then Result :=  Pi/2.0
         --     when -1 then Result := -Pi/2.0
         --     when  0 then raise_exception(Precondition)
         --     end
         -- end
      end

   squared_modulus: A_SIZE
      do
         Result := real * real + imaginary * imaginary
         -- Note: NUMERIC does not have infix "^" (an_exponent: INTEGER): like Current...
      ensure
         non_negative: Result.sign /= -1
      end

feature {ANY} -- Object Printing:
   out: STRING
         -- do
         --    Result := "("
         --    real.append_in(Result)
         --    Result.append(once ", ")
         --    imaginary.append_in(Result)
         --    Result.append_character(')')
      local
         real_digits, imaginary_digits: INTEGER
      do
         -- This is a far and large heuristic way to compute significant decimal digits of floating point number
         real_digits := real.mantissa_bits.to_integer_32 // 3
         imaginary_digits := imaginary.mantissa_bits.to_integer_32 // 3
         create Result.with_capacity(real_digits + imaginary_digits + 6)
         Result.append(once "(")
         real.append_in_scientific(Result, real_digits)
         Result.append(once ", ")
         imaginary.append_in_scientific(Result, imaginary_digits)
         Result.append(once ")")
      end

   fill_tagged_out_memory
      do
         tagged_out_memory.append("real, ")
         real.fill_tagged_out_memory
         tagged_out_memory.append(" imaginary, ")
         imaginary.fill_tagged_out_memory
      end

end -- class COMPLEX_GENERAL
--
-- Copyright (C) 2011-2018: by all the people cited in the AUTHORS file.
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
