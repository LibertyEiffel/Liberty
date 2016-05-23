-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class NATURAL_8

insert
   NATURAL_GENERAL
      redefine infix "//", infix "\\"
      end

feature {ANY} -- Explicit conversions:
   to_natural_16: NATURAL_16
         -- Explicit conversion to NATURAL_16.
      external "built_in"
      ensure
         Result.to_natural_8 = Current
      end

   to_natural_32: NATURAL_32
         -- Explicit conversion to NATURAL_32.
      external "built_in"
      ensure
         Result.to_natural_8 = Current
      end

   to_natural_64: NATURAL_64
         -- Explicit conversion to NATURAL_64.
      external "built_in"
      ensure
         Result.to_natural_8 = Current
      end

   fit_integer_8: BOOLEAN
         -- Does `Current' fit in INTEGER_8?
      do
         Result := Current <= 127.to_natural_8
      ensure
         Result = (Current <= 127.to_natural_8)
      end

   to_integer_8: INTEGER_8
         -- Explicit conversion to INTEGER_8.
      require
         fit_integer_8
      external "built_in"
      ensure
         Result.to_natural_8 = Current
      end

   to_integer_16: INTEGER_16
         -- Explicit conversion to INTEGER_16.
      external "built_in"
      ensure
         Result.to_natural_8 = Current
      end

   to_integer_32: INTEGER_32
         -- Explicit conversion to INTEGER_32.
      external "built_in"
      ensure
         Result.to_natural_8 = Current
      end

   to_integer_64: INTEGER_64
         -- Explicit conversion to INTEGER_64.
      external "built_in"
      ensure
         Result.to_natural_8 = Current
      end

   to_real_32: REAL_32
         -- Explicit conversion to REAL_32.
      do
         Result := to_integer_16
      end

   to_real_64: REAL_64
         -- Explicit conversion to REAL_64.
      do
         Result := to_integer_16
      end

feature {ANY}
   infix "//" (other: like Current): like Current
      require
         other /= 0.to_natural_8
      external "built_in"
      end

   infix "\\" (other: like Current): like Current
      require
         other /= 0.to_natural_8
      external "built_in"
      end

   is_odd: BOOLEAN
      do
         Result := to_integer_16.is_odd
      end

   is_even: BOOLEAN
      do
         Result := to_integer_16.is_even
      end

   hash_code: INTEGER
      do
         Result := to_integer_16
      end

   append_in (buffer: STRING)
      do
         to_integer_16.append_in(buffer)
      end

   append_in_unicode (buffer: UNICODE_STRING)
      do
         to_integer_16.append_in_unicode(buffer)
      end

   decimal_digit: CHARACTER
         -- Gives the corresponding CHARACTER for range 0..9.
      require
         in_range(0.to_natural_8, 9.to_natural_8)
      do
         Result := to_integer_8.hexadecimal_digit
      end

   hexadecimal_digit: CHARACTER
      require
         in_range(0.to_natural_8, 15.to_natural_8)
      do
         Result := to_integer_8.hexadecimal_digit
      end

   to_character: CHARACTER
      require
         to_integer_16 <= Maximum_character_code
      do
         Result := to_integer_16.to_character
      end

   to_number: NUMBER
      do
         Result := to_integer_16.to_number
      end

   bit_count: INTEGER_8 8

end -- NATURAL_8
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
