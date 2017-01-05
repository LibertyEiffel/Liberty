-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class REAL_GENERAL
   --
   -- Common anchestor of floating-point arithmetic classes, also known as REAL numbers: REAL_32, REAL_64, REAL_128, REAL_EXTENDED.
   --

inherit
   FLOAT
      redefine out_in_tagged_out_memory, fill_tagged_out_memory, is_equal, infix "<=", infix ">", infix ">="
      end

insert
   REAL_PRECISION
      redefine out_in_tagged_out_memory, fill_tagged_out_memory, is_equal, precision
      end

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := Current = other
      end

   prefix "+": like Current
      do
         Result := Current
      end

   prefix "-": like Current
      external "built_in"
      end

   infix "+" (other: like Current): like Current
      external "built_in"
      end

   infix "-" (other: like Current): like Current
      external "built_in"
      end

   infix "*" (other: like Current): like Current
      external "built_in"
      end

   infix "/" (other: like Current): like Current
      external "built_in"
      end

   infix "^" (e: INTEGER): like Current
      external "built_in"
      end

   infix "<" (other: like Current): BOOLEAN
      external "built_in"
      end

   infix "<=" (other: like Current): BOOLEAN
      external "built_in"
      end

   infix ">" (other: like Current): BOOLEAN
      external "built_in"
      end

   infix ">=" (other: like Current): BOOLEAN
      external "built_in"
      end

   abs: like Current
      do
         if Current < {REAL_32 0.0} then
            Result := -Current
         else
            Result := Current
         end
      end

   is_not_a_number: BOOLEAN
      external "built_in"
      end

   is_infinity: BOOLEAN
      external "built_in"
      end

   is_zero: BOOLEAN
      do
         Result := Current = 0.0 or else Current = -0.0
      end

   infix "~=" (other: like Current): BOOLEAN
      deferred
      end

   precision: INTEGER_8
      do
         Result := Precursor
         if Result > mantissa_bits then
            Result := mantissa_bits
         end
      ensure then
         Result <= mantissa_bits
      end

   is_subnormal: BOOLEAN
      external "built_in"
      end

   is_normal: BOOLEAN
      external "built_in"
      end

   divisible (other: like Current): BOOLEAN
      do
         Result := other /= 0.0
      end

feature {ANY} -- Conversions:
   frozen rounded: like Current
      external "built_in"
      end

   frozen floor: like Current
      external "built_in"
      end

   frozen ceiling: like Current
         -- Smallest integral value no smaller than Current.
      external "built_in"
      end

feature {ANY} -- Object Printing:
   to_string: STRING
      do
         sprintf(sprintf_buffer, 'f', 6, Current)
         create Result.from_external_copy(sprintf_buffer.to_pointer)
      end

   to_string_format (f: INTEGER): STRING
      do
         sprintf(sprintf_buffer, 'f', f, Current)
         create Result.from_external_copy(sprintf_buffer.to_pointer)
      end

   to_string_scientific (f: INTEGER): STRING
      do
         sprintf(sprintf_buffer, 'e', f, Current)
         create Result.from_external_copy(sprintf_buffer.to_pointer)
      end

   append_in (buffer: STRING)
      do
         append_in_format(buffer, 6)
      end

   append_in_format (str: STRING; f: INTEGER)
      local
         i: INTEGER
      do
         from
            sprintf(sprintf_buffer, 'f', f, Current)
            i := 0
         until
            sprintf_buffer.item(i) = '%U'
         loop
            str.extend(sprintf_buffer.item(i))
            i := i + 1
         end
      end

   append_in_scientific (str: STRING; f: INTEGER)
      local
         i: INTEGER
      do
         from
            sprintf(sprintf_buffer, 'e', f, Current)
            i := 0
         until
            sprintf_buffer.item(i) = '%U'
         loop
            str.extend(sprintf_buffer.item(i))
            i := i + 1
         end
      end

   out_in_tagged_out_memory, fill_tagged_out_memory
      do
         Current.append_in(tagged_out_memory)
      end

feature {ANY} -- Maths functions:
   frozen sqrt: like Current
      external "built_in"
      end

   frozen sin: like Current
      external "built_in"
      end

   frozen cos: like Current
      external "built_in"
      end

   frozen tan: like Current
      external "built_in"
      end

   frozen asin: like Current
      external "built_in"
      end

   frozen acos: like Current
      external "built_in"
      end

   frozen atan: like Current
      external "built_in"
      end

   frozen atan2 (x: like Current): like Current
      external "built_in"
      end

   frozen sinh: like Current
      external "built_in"
      end

   frozen cosh: like Current
      external "built_in"
      end

   frozen tanh: like Current
      external "built_in"
      end

   frozen exp: like Current
      external "built_in"
      end

   frozen log: like Current
      external "built_in"
      end

   frozen log10: like Current
      external "built_in"
      end

   frozen pow (e: like Current): like Current
      external "built_in"
      end

feature {ANY} -- Hashing:
   hash_code: INTEGER
      deferred
      end

feature {ANY} -- Miscellaneous:
   sign: INTEGER_8
      do
         if Current < {REAL_32 0.0 } then
            Result := -1
         elseif Current > {REAL_32 0.0 } then
            Result := 1
         else
            Result := 0
         end
      end

   mantissa_bits: INTEGER_8
      deferred
      end

   exponent_bits: INTEGER_8
      deferred
      end

feature {}
   sprintf_buffer: NATIVE_ARRAY[CHARACTER]
      once
         Result := Result.calloc(1024)
      end

   sprintf (buffer: NATIVE_ARRAY[CHARACTER]; mode: CHARACTER; f: INTEGER; value: like Current)
         -- Put in the `buffer' a viewable version of the `value' using `mode' with `f' digits for the fractional
         -- part. Assume the `buffer' is large enough.
      require
         mode = 'f' xor mode = 'e'
         f >= 0
      deferred
      end

end -- class REAL_GENERAL
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
