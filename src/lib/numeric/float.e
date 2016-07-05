-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class FLOAT
   --
   -- This class defines the floating-point operations.
   --

inherit
   NUMERIC
   COMPARABLE

feature {ANY}
   infix "+" (another: like Current): like Current
      deferred
      end

   infix "-" (another: like Current): like Current
      deferred
      end

   infix "*" (another: like Current): like Current
      deferred
      end

   infix "/" (another: like Current): like Current
     deferred
      end

   infix "^" (another: INTEGER): like Current
         -- Raise Current to `e'-th power (see also `pow').
      deferred
      end

   abs: like Current
      deferred
      end

   is_not_a_number: BOOLEAN
         -- Also known as NaN in IEEE-754.
      deferred
      end

   is_infinity: BOOLEAN
         -- Is either plus or minus infinity?
      deferred
      end

   is_zero: BOOLEAN
         -- Is either -0.0 or +0.0 ?
      deferred
      ensure
         definition: Result = (Current = zero or else Current = -zero)
      end

   infix "~=" (other: like Current): BOOLEAN
         -- Is `Current' near equal to `other'.
      deferred
      end

   is_subnormal: BOOLEAN
         -- Is it too small to be represented in normalized format.
      deferred
      ensure
         Result = (Current = zero) or else Current = -zero
      end

   is_normal: BOOLEAN
         -- The most general situation (see ensure).
      deferred
      ensure
         Result = not (is_subnormal or is_infinity or is_not_a_number)
      end

   divisible (other: like Current): BOOLEAN
      deferred
      end

feature {ANY} -- Conversions:
   frozen rounded: like Current
         -- Round to nearest integer away from zero.
      deferred
      end

   frozen floor: like Current
         -- Largest integral value no greater than Current.
      deferred
      end

   frozen ceiling: like Current
         -- Smallest integral value no smaller than Current.
      deferred
      end

feature {ANY} -- Object Printing:
   to_string: STRING
         -- Convert `Current' into a new allocated STRING using 6 as the default number of digits for the
         -- fractional part.
         -- Example: `(1.5).to_string' will return "1.500000".
         --
         -- Note: see also `to_string_format', `to_string_scientific' as well as `append_in' to save memory.
      deferred
      end

   to_string_format (f: INTEGER): STRING
         -- Convert `Current' into a new allocated STRING using `f' digits for fractional part.
         -- Example: `(1.5).to_string_format(2)' will return "1.50".
         --
         -- Note: see also `to_string_scientific', `to_string' as well as `append_in_format' to save memory.
      require
         f >= 0
      deferred
      end

   to_string_scientific (f: INTEGER): STRING
         -- Convert `Current' into a new allocated STRING, using the scientific notation with `f' digits for
         -- the fractional part.
         -- Example: `(155.5).to_string_scientific(4)' will return "1.5550e+02".
         --
         -- Note: see also `to_string', `to_string_format' as well as `append_in_scientific' to save memory.
      deferred
      end

   append_in (buffer: STRING)
         -- Append the equivalent of `to_string' at the end of `buffer'. Thus you can save
         -- memory because no other STRING is allocated for the job.
      require
         buffer /= Void
      deferred
      end

   append_in_format (str: STRING; f: INTEGER)
         -- Append the equivalent of `to_string_format' at the end of `buffer'. Thus you can save
         -- memory because no other STRING is allocated for the job.
      require
         str /= Void
         f >= 0
      deferred
      end

   append_in_scientific (str: STRING; f: INTEGER)
         -- Append the equivalent of `to_string_scientific' at the end of `buffer'. Thus you can save
         -- memory because no other STRING is allocated for the job.
      require
         str /= Void
         f >= 0
      deferred
      end

feature {ANY} -- Maths functions:
   frozen sqrt: like Current
         -- Square root of `Current'.
      require
         Current >= zero
      deferred
      end

   frozen sin: like Current
         -- Sine of `Current'.
      deferred
      end

   frozen cos: like Current
         -- Cosine of `Current'.
      deferred
      end

   frozen tan: like Current
         -- Tangent of `Current'.
      deferred
      end

   frozen asin: like Current
         -- Arc Sine of `Current'.
      deferred
      end

   frozen acos: like Current
         -- Arc Cosine of `Current'.
      deferred
      end

   frozen atan: like Current
         -- Arc Tangent of `Current'.
      deferred
      end

   frozen atan2 (x: like Current): like Current
         -- Arc Tangent of `Current' / `x'.
      deferred
      end

   frozen sinh: like Current
         -- Hyperbolic Sine of `Current'.
      deferred
      end

   frozen cosh: like Current
         -- Hyperbolic Cosine of `Current'.
      deferred
      end

   frozen tanh: like Current
         -- Hyperbolic Tangent of `Current'.
      deferred
      end

   frozen exp: like Current
         -- Exponential of `Current'.
      deferred
      end

   frozen log: like Current
         -- Natural Logarithm of `Current'.
      deferred
      end

   frozen log10: like Current
         -- Base-10 Logarithm of Current.
      deferred
      end

   frozen pow (e: like Current): like Current
         -- `Current' raised to the power of `e' (ANSI C `pow').
      deferred
      end

feature {ANY} -- Hashing:
   hash_code: INTEGER
      deferred
      end

feature {ANY} -- Miscellaneous:
   sign: INTEGER_8
         -- Sign of `Current' (0 -1 or 1).
      deferred
      end

   mantissa_bits: INTEGER_8
         -- Give the number of bits, corresponding to the mantissa,
         -- in the binary representation of the real number.
      deferred
      end

   exponent_bits: INTEGER_8
         -- Give the number of bits, corresponding to the exponent,
         -- in the binary representation of the real number.
      deferred
      end

end -- class FLOAT
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
