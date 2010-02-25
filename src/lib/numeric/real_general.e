-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class REAL_GENERAL
	--
	-- (This class is here to prepare the new support for REAL: REAL_32, REAL_64, etc.)
	-- Work in progress. Please, do not use it now. July 7th 2004
	--

inherit
	FLOAT
		redefine out_in_tagged_out_memory, fill_tagged_out_memory, is_equal, infix "<=", infix ">", infix ">="
		end

feature {ANY}
	is_equal (other: like Current): BOOLEAN is
		do
			Result := Current = other
		end

	prefix "+": like Current is
		do
			Result := Current
		end

	prefix "-": like Current is
		external "built_in"
		end

	infix "+" (other: like Current): like Current is
		external "built_in"
		end

	infix "-" (other: like Current): like Current is
		external "built_in"
		end

	infix "*" (other: like Current): like Current is
		external "built_in"
		end

	infix "/" (other: like Current): like Current is
		external "built_in"
		end

	infix "^" (e: INTEGER): like Current is
		external "built_in"
		end

	infix "<" (other: like Current): BOOLEAN is
		external "built_in"
		end

	infix "<=" (other: like Current): BOOLEAN is
		external "built_in"
		end

	infix ">" (other: like Current): BOOLEAN is
		external "built_in"
		end

	infix ">=" (other: like Current): BOOLEAN is
		external "built_in"
		end

	abs: like Current is
		do
			if Current < {REAL_32 0.0} then
				Result := -Current
			else
				Result := Current
			end
		end

	is_not_a_number: BOOLEAN is
		external "built_in"
		end

	is_infinity: BOOLEAN is
		external "built_in"
		end

	is_zero: BOOLEAN is
		do
			Result := Current = 0.0 or else Current = -0.0
		end

	infix "~=" (other: like Current): BOOLEAN is
		deferred
		end

	is_subnormal: BOOLEAN is
		external "built_in"
		end

	is_normal: BOOLEAN is
		external "built_in"
		end

	divisible (other: like Current): BOOLEAN is
		do
			Result := other /= 0.0
		end

feature {ANY} -- Conversions:
	frozen rounded: like Current is
		external "built_in"
		end

	frozen floor: like Current is
		external "built_in"
		end

	frozen ceiling: like Current is
			-- Smallest integral value no smaller than Current.
		external "built_in"
		end

feature {ANY} -- Object Printing:
	to_string: STRING is
		do
			sprintf(sprintf_buffer, 'f', 6, Current)
			create Result.from_external_copy(sprintf_buffer.to_pointer)
		end

	to_string_format (f: INTEGER): STRING is
		do
			sprintf(sprintf_buffer, 'f', f, Current)
			create Result.from_external_copy(sprintf_buffer.to_pointer)
		end

	to_string_scientific (f: INTEGER): STRING is
		do
			sprintf(sprintf_buffer, 'e', f, Current)
			create Result.from_external_copy(sprintf_buffer.to_pointer)
		end

	append_in (buffer: STRING) is
		do
			append_in_format(buffer, 6)
		end

	append_in_format (str: STRING; f: INTEGER) is
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

	append_in_scientific (str: STRING; f: INTEGER) is
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

	out_in_tagged_out_memory, fill_tagged_out_memory is
		do
			Current.append_in(tagged_out_memory)
		end

feature {ANY} -- Maths functions:
	frozen sqrt: like Current is
		external "built_in"
		end

	frozen sin: like Current is
		external "built_in"
		end

	frozen cos: like Current is
		external "built_in"
		end

	frozen tan: like Current is
		external "built_in"
		end

	frozen asin: like Current is
		external "built_in"
		end

	frozen acos: like Current is
		external "built_in"
		end

	frozen atan: like Current is
		external "built_in"
		end

	frozen atan2 (x: like Current): like Current is
		external "built_in"
		end

	frozen sinh: like Current is
		external "built_in"
		end

	frozen cosh: like Current is
		external "built_in"
		end

	frozen tanh: like Current is
		external "built_in"
		end

	frozen exp: like Current is
		external "built_in"
		end

	frozen log: like Current is
		external "built_in"
		end

	frozen log10: like Current is
		external "built_in"
		end

	frozen pow (e: like Current): like Current is
		external "built_in"
		end

feature {ANY} -- Hashing:
	hash_code: INTEGER is
		deferred
		end

feature {ANY} -- Miscellaneous:
	sign: INTEGER_8 is
		do
			if Current < {REAL_32 0.0 } then
				Result := -1
			elseif Current > {REAL_32 0.0 } then
				Result := 1
			else
				Result := 0
			end
		end

	mantissa_bits: INTEGER_8 is
		deferred
		end

	exponent_bits: INTEGER_8 is
		deferred
		end

feature {}
	sprintf_buffer: NATIVE_ARRAY[CHARACTER] is
		once
			Result := Result.calloc(1024)
		end

	sprintf (buffer: NATIVE_ARRAY[CHARACTER]; mode: CHARACTER; f: INTEGER; value: like Current) is
			-- Put in the `buffer' a viewable version of the `value' using `mode' with `f' digits for the fractional
			-- part. Assume the `buffer' is large enougth.
		require
			mode = 'f' xor mode = 'e'
			f >= 0
		deferred
		end

end -- class REAL_GENERAL
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
