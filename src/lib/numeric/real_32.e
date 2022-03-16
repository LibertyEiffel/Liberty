-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class REAL_32

insert
   REAL_GENERAL

feature {ANY} -- Conversions:
   to_real_64: REAL_64
         -- Explicit conversion to REAL_64.
      do
         Result := Current
      ensure
         Current = Result
      end

   to_real_extended: REAL_EXTENDED
         -- Explicit conversion to REAL_EXTENDED.
      do
         Result := Current
      ensure
         Current = Result
      end

   to_real_80: REAL_80
         -- Explicit conversion to REAL_80.
      do
         Result := Current
      ensure
         Current = Result
      end

   to_real_128: REAL_128
         -- Explicit conversion to REAL_128.
      do
         Result := Current
      ensure
         Current = Result
      end

   force_to_integer_64: INTEGER_64
      external "built_in"
      end

   force_to_integer_32: INTEGER_32
      external "built_in"
      end

   force_to_integer_16: INTEGER_16
      external "built_in"
      end

   force_to_natural_64: NATURAL_64
      external "built_in"
      end

   force_to_natural_32: NATURAL_32
      external "built_in"
      end

   force_to_natural_16: NATURAL_16
      external "built_in"
      end

feature {ANY}
   zero: REAL_32 {REAL_32 0.0}

   one: REAL_32 {REAL_32 1.0}

   infix "~=" (other: like Current): BOOLEAN
      do
         Result := (Current - other).abs * ({REAL_32 2.0} ^ (mantissa_bits - precision)) <= Current.abs
      end

   hash_code: INTEGER
      do
         Result := force_to_integer_32
         if Result < 0 then
            Result := -(Result + 1)
         end
      end

   mantissa_bits: INTEGER_8 23

   exponent_bits: INTEGER_8 8

feature {}
   sprintf (buffer: NATIVE_ARRAY[CHARACTER]; mode: CHARACTER; f: INTEGER; value: REAL_64)
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "basic_sprintf"
         feature_name: "sprintf_real_64"
         }"
      end

end -- class REAL_32
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
