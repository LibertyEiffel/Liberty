-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class REAL_128

insert
   REAL_GENERAL

feature {ANY} -- Conversions:
   force_to_real_32: REAL_32
      external "built_in"
      end

   force_to_real_64: REAL_64
      external "built_in"
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

feature {ANY}
   zero: REAL_32 0.0

   one: REAL_32 1.0

   infix "~=" (other: like Current): BOOLEAN
      do
         Result := (Current - other).abs * ({REAL_128 2.0} ^ (mantissa_bits - precision)) <= Current.abs
      end

   hash_code: INTEGER
      do
         Result := force_to_integer_32
         if Result < 0 then
            Result := -(Result + 1)
         end
      end

   mantissa_bits: INTEGER_8 112

   exponent_bits: INTEGER_8 15

feature {}
   sprintf (buffer: NATIVE_ARRAY[CHARACTER]; mode: CHARACTER; f: INTEGER; value: REAL_128)
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "basic_sprintf"
         feature_name: "sprintf_real_extended"
         }"
      end

end -- class REAL_128
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
