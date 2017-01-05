-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class PLATFORM

insert
   ANY

feature {} -- Maximum:
   Maximum_character_code: INTEGER_16
         -- Largest supported code for CHARACTER values.
      external "built_in"
      ensure
         meaningful: Result >= 127
      end

   Maximum_integer_8: INTEGER_8 127
         -- Largest supported value of type INTEGER_8.

   Maximum_integer_16: INTEGER_16 32767
         -- Largest supported value of type INTEGER_16.

   Maximum_integer, Maximum_integer_32: INTEGER 2147483647
         -- Largest supported value of type INTEGER/INTEGER_32.

   Maximum_integer_64: INTEGER_64 9223372036854775807
         -- Largest supported value of type INTEGER_64.

   Maximum_real_32: REAL_32 {REAL_32 3.4028234663852885981170418348451692544e+38}
         -- Largest non-special (no NaNs nor infinity) supported value of type REAL_32.

   Maximum_real, Maximum_real_64: REAL_64
         -- Largest non-special (no NaNs nor infinity) supported value of type REAL.
         -- Just to give an idea of this value: 1.79769313486231570....e+308
      external "built_in"
      end

   Maximum_real_80: REAL_80
         -- Largest supported value of type REAL_80.
      external "built_in"
      ensure
         meaningful: Result >= Maximum_real
      end

feature {} -- Minimum:
   Minimum_character_code: INTEGER_16
         -- Smallest supported code for CHARACTER values.
      external "built_in"
      ensure
         meaningful: Result <= 0
      end

   Minimum_integer_8: INTEGER_8 -128
         -- Smallest supported value of type INTEGER_8.

   Minimum_integer_16: INTEGER_16 -32768
         -- Smallest supported value of type INTEGER_16.

   Minimum_integer, Minimum_integer_32: INTEGER -2147483648
         -- Smallest supported value of type INTEGER/INTEGER_32.

   Minimum_integer_64: INTEGER_64 -9223372036854775808
         -- Smallest supported value of type INTEGER_64.

   Minimum_real_32: REAL_32 {REAL_32 -3.40282346638528859811704183484516925440e+38}
         -- Smallest non-special (no NaNs nor infinity) supported value of type REAL_32.

   Minimum_real, Minimum_real_64: REAL_64
         -- Smallest non-special (no NaNs nor infinity) supported value of type REAL.
         -- Just to give an idea of this value: -1.79769313486231570....e+308
      external "built_in"
      end

   Minimum_real_80: REAL
         -- Smallest supported value of type REAL_80.
      external "built_in"
      ensure
         meaningful: Result <= 0.0
      end

feature {} -- Bits:
   Boolean_bits: INTEGER
         -- Number of bits in a value of type BOOLEAN.
      external "built_in"
      ensure
         meaningful: Result >= 1
      end

   Character_bits: INTEGER
         -- Number of bits in a value of type CHARACTER.
      external "built_in"
      ensure
         meaningful: Result >= 1
         large_enough: {INTEGER_32 2 } ^ Result >= Maximum_character_code
      end

   Integer_bits: INTEGER
         -- Number of bits in a value of type INTEGER.
      external "built_in"
      ensure
         integer_definition: Result = 32
      end

   Real_bits: INTEGER 64
         -- Number of bits in a value of type REAL.

   Pointer_bits: INTEGER
         -- Number of bits in a value of type POINTER.
      external "built_in"
      end

end -- class PLATFORM
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
