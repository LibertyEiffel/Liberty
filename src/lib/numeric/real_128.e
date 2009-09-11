-- See the Copyright notice at the end of this file.
--
expanded class REAL_128
--
-- 128 bits floating point.
--
-- Warning: this REAL_128 class is architecture dependent.
--
-- See also REAL_32, REAL_64, REAL_80, REAL_EXTENDED.

insert
	REAL_GENERAL

feature {ANY} -- Conversions:
	force_to_real_32: REAL_32 is
		external "built_in"
		end

	force_to_real_64: REAL_64 is
		external "built_in"
		end

	force_to_integer_64: INTEGER_64 is
		external "built_in"
		end

	force_to_integer_32: INTEGER_32 is
		external "built_in"
		end

	force_to_integer_16: INTEGER_16 is
		external "built_in"
		end

feature {ANY}
	zero: REAL_32 is 0.0

	one: REAL_32 is 1.0

	infix "~=" (other: like Current): BOOLEAN is
		do
			Result := (Current - other).abs * ({REAL_128 2.0} ^ (mantissa_bits - 3)) < Current.abs
		end

	hash_code: INTEGER is
		do
			Result := force_to_integer_32
			if Result < 0 then
				Result := -(Result + 1)
			end
		end

	mantissa_bits: INTEGER_8 is 112

	exponent_bits: INTEGER_8 is 15

feature {}
	sprintf (buffer: NATIVE_ARRAY[CHARACTER]; mode: CHARACTER; f: INTEGER; value: REAL_128) is
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "basic_sprintf"
			feature_name: "sprintf_real_extended"
			}"
		end

end -- class REAL_128
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
