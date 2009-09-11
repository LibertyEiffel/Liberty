-- See the Copyright notice at the end of this file.
--
expanded class NATURAL_8
--
-- 8 bits unsigned integer. Numbers in range [0 .. 255].
--
-- See also NATURAL_16, NATURAL_32, NATURAL_64, INTEGER_8, INTEGER_16, INTEGER_32, INTEGER_64.
--

insert
	NATURAL_GENERAL
		redefine infix "//", infix "\\"
		end
	
feature {ANY} -- Explicit conversions:
	to_natural_16: NATURAL_16 is
			-- Explicit conversion to NATURAL_16.
		external "built_in"
		ensure
			Result.to_natural_8 = Current
		end
	
	to_natural_32: NATURAL_32 is
			-- Explicit conversion to NATURAL_32.
		external "built_in"
		ensure
			Result.to_natural_8 = Current
		end
	
	to_natural_64: NATURAL_64 is
			-- Explicit conversion to NATURAL_64.
		external "built_in"
		ensure
			Result.to_natural_8 = Current
		end
	
	fit_integer_8: BOOLEAN is
			-- Does `Current' fit in INTEGER_8?
		do
			Result := Current <= 127.to_natural_8
		ensure
			Result = (Current <= 127.to_natural_8)
		end

	to_integer_8: INTEGER_8 is
			-- Explicit conversion to INTEGER_8.
		require
			fit_integer_8
		external "built_in"
		ensure
			Result.to_natural_8 = Current
		end

	to_integer_16: INTEGER_16 is
			-- Explicit conversion to INTEGER_16.
		external "built_in"
		ensure
			Result.to_natural_8 = Current
		end

	to_integer_32: INTEGER_32 is
			-- Explicit conversion to INTEGER_32.
		external "built_in"
		ensure
			Result.to_natural_8 = Current
		end

	to_integer_64: INTEGER_64 is
			-- Explicit conversion to INTEGER_64.
		external "built_in"
		ensure
			Result.to_natural_8 = Current
		end
	
	to_real_32: REAL_32 is
			-- Explicit conversion to REAL_32.
		do
			Result := to_integer_16
		end

	to_real_64: REAL_64 is
			-- Explicit conversion to REAL_64.
		do
			Result := to_integer_16
		end

feature {ANY}
	infix "//" (other: like Current): like Current is
		require
			other /= 0.to_natural_8
		external "built_in"
		end

	infix "\\" (other: like Current): like Current is
		require
			other /= 0.to_natural_8
		external "built_in"
		end	

	is_odd: BOOLEAN is
		do
			Result := to_integer_16.is_odd
		end

	is_even: BOOLEAN is
		do
			Result := to_integer_16.is_even
		end
	
	hash_code: INTEGER is
		do
			Result := to_integer_16
		end

	append_in (buffer: STRING) is
		do
		   to_integer_16.append_in(buffer)
		end

	append_in_unicode (buffer: UNICODE_STRING) is
		do
		   to_integer_16.append_in_unicode(buffer)
		end

	decimal_digit: CHARACTER is
			-- Gives the corresponding CHARACTER for range 0..9.
		require
			in_range(0.to_natural_8, 9.to_natural_8)
		do
			Result := to_integer_8.hexadecimal_digit
		end

	hexadecimal_digit: CHARACTER is
		require
			in_range(0.to_natural_8, 15.to_natural_8)
		do
			Result := to_integer_8.hexadecimal_digit
		end

	to_character: CHARACTER is
		require
			to_integer_16 <= Maximum_character_code
		do
			Result := to_integer_16.to_character
		end
	
	to_number: NUMBER is
		do
			Result := to_integer_16.to_number
		end
	
feature {}
	bit_count: INTEGER_8 is 8

end -- NATURAL_8
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
