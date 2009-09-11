-- See the Copyright notice at the end of this file.
--
expanded class INTEGER_16
--
-- 16 bits signed integer.
--
-- See also INTEGER_8, INTEGER_32, INTEGER_64.

insert
	INTEGER_GENERAL

feature {ANY} -- Conversions:
	fit_integer_8: BOOLEAN is
			-- Does `Current' fit in INTEGER_8?
		do
			if Current >= -128 then
				Result := Current <= 127
			end
		ensure
			Result = Current.in_range(-128, 127)
		end

	to_integer_8: INTEGER_8 is
			-- Explicit conversion to INTEGER_8.
		require
			fit_integer_8
		external "built_in"
		ensure
			Current.is_equal(Result)
		end

	to_integer_32: INTEGER_32 is
			-- Explicit conversion to INTEGER_32.
		do
			Result := Current
		ensure
			Current = Result
		end

	to_integer_64: INTEGER_64 is
			-- Explicit conversion to INTEGER_64.
		do
			Result := Current
		ensure
			Current = Result
		end

	fit_natural_8: BOOLEAN is
			-- Does `Current' fit in NATURAL_8?
		do
			if Current >= 0 then
				Result := Current <= 255
			end
		ensure
			Result = Current.in_range(0, 255)
		end

	to_natural_8: NATURAL_8 is
			-- Explicit conversion to NATURAL_8.
		require
			fit_natural_8
		external "built_in"
		ensure
			Result.to_integer_16 = Current
		end
	
	to_natural_16: NATURAL_16 is
			-- Explicit conversion to NATURAL_16.
		require
			Current >= 0
		external "built_in"
		ensure
			Result.to_integer_16 = Current
		end
	
	to_natural_32: NATURAL_32 is
			-- Explicit conversion to NATURAL_32.
		require
			Current >= 0
		external "built_in"
		ensure
			Result.to_integer_16 = Current
		end
	
	to_natural_64: NATURAL_64 is
			-- Explicit conversion to NATURAL_64.
		require
			Current >= 0
		external "built_in"
		ensure
			Result.to_integer_16 = Current
		end
	
	to_real_32: REAL_32 is
			-- Explicit conversion to REAL_32.
		do
			Result := Current
		end

	to_real_64: REAL_64 is
			-- Explicit conversion to REAL_64.
		do
			Result := Current
		end

	to_number: NUMBER is
			-- Explicit conversion to NUMBER.
		local
			number_tools: NUMBER_TOOLS
		do
			Result := number_tools.from_integer(Current)
		ensure then
			Result @= Current
		end

	decimal_digit: CHARACTER is
		do
			Result := (Current + '0'.code).to_character
		end

	hexadecimal_digit: CHARACTER is
		do
			if Current <= 9 then
				Result := (Current + '0'.code).to_character
			else
				Result := ('A'.code + (Current - 10)).to_character
			end
		end

feature {ANY}
	low_8: INTEGER_8 is
			-- The 8 low bits of `Current' (i.e. the right-most part).
		external "built_in"
		end

	high_8: INTEGER_8 is
			-- The 8 high bits of `Current' (i.e. the left-most part).
		do
			Result := (Current |>> 8).low_8
		end

	one: INTEGER_8 is 1

	zero: INTEGER_8 is 0

	hash_code: INTEGER is
		do
			Result := Current & 0x7FFF
		end

	sqrt: REAL is
		do
			Result := to_real_64.sqrt
		end

	log: REAL is
		do
			Result := to_real_64.log
		end

	log10: REAL is
		do
			Result := to_real_64.log10
		end

feature {}
	bit_count: INTEGER_8 is 16
	
end -- class INTEGER_16
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
