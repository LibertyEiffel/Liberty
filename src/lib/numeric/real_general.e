deferred class REAL_GENERAL
	--
	-- (This class is here to prepare the new support for REAL: REAL_32, REAL_64, etc.)
	-- Work in progress. Please, do not use it now. July 7th 2004
	--

inherit
	NUMERIC
		redefine out_in_tagged_out_memory, fill_tagged_out_memory
		end
	COMPARABLE
		undefine is_equal
		redefine out_in_tagged_out_memory, fill_tagged_out_memory, infix "<=", infix ">", infix ">="
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
			-- Raise Current to `e'-th power (see also `pow').
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
			-- Also known as NaN in IEEE-754.
		external "built_in"
		end

	is_infinity: BOOLEAN is
			-- Is either plus or minus infinity?
		external "built_in"
		end

	is_zero: BOOLEAN is
			-- Is either -0.0 or +0.0 ?
		do
			Result := Current = 0.0 or else Current = -0.0
		end

	infix "~=" (other: like Current): BOOLEAN is
			-- Is `Current' near equal to `other'.
		deferred
		end

	is_subnormal: BOOLEAN is
			-- Is it too small to be represented in normalized format.
		external "built_in"
		ensure
			Result = (Current = 0.0) or else Current = -0.0
		end

	is_normal: BOOLEAN is
			-- The most general situation (see ensure).
		external "built_in"
		ensure
			Result = not (is_subnormal or is_infinity or is_not_a_number)
		end

	divisible (other: like Current): BOOLEAN is
		do
			Result := other /= 0.0
		end

feature {ANY} -- Conversions:
	frozen rounded: like Current is
			-- Round to nearest integer away from zero.
		external "built_in"
		end

	frozen floor: like Current is
			-- Largest integral value no greater than Current.
		external "built_in"
		end

	frozen ceiling: like Current is
			-- Smallest integral value no smaller than Current.
		external "built_in"
		end

feature {ANY} -- Object Printing:
	to_string: STRING is
			-- Convert `Current' into a new allocated STRING using 6 as the default number of digits for the
			-- fractional part.
			-- Exemple: `(1.5).to_string' will return "1.500000".
			--
			-- Note: see also `to_string_format', `to_string_scientific' as well as `append_in' to save memory.
		do
			sprintf(sprintf_buffer, 'f', 6, Current)
			create Result.from_external_copy(sprintf_buffer.to_pointer)
		end

	to_string_format (f: INTEGER): STRING is
			-- Convert `Current' into a new allocated STRING using `f' digits for fractional part.
			-- Exemple: `(1.5).to_string_format(2)' will return "1.50".
			--
			-- Note: see also `to_string_scientific', `to_string' as well as `append_in_format' to save memory.
		require
			f >= 0
		do
			sprintf(sprintf_buffer, 'f', f, Current)
			create Result.from_external_copy(sprintf_buffer.to_pointer)
		end

	to_string_scientific (f: INTEGER): STRING is
			-- Convert `Current' into a new allocated STRING, using the scientific notation with `f' digits for
			-- the fractional part.
			-- Exemple: `(155.5).to_string_scientific(4)' will return "1.5550e+02".
			--
			-- Note: see also `to_string', `to_string_format' as well as `append_in_scientific' to save memory.
		do
			sprintf(sprintf_buffer, 'e', f, Current)
			create Result.from_external_copy(sprintf_buffer.to_pointer)
		end

	append_in (buffer: STRING) is
			-- Append the equivalent of `to_string' at the end of `buffer'. Thus you can save
			-- memory because no other STRING is allocated for the job.
		require
			buffer /= Void
		do
			append_in_format(buffer, 6)
		end

	append_in_format (str: STRING; f: INTEGER) is
			-- Append the equivalent of `to_string_format' at the end of `buffer'. Thus you can save
			-- memory because no other STRING is allocated for the job.
		require
			str /= Void
			f >= 0
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
			-- Append the equivalent of `to_string_scientific' at the end of `buffer'. Thus you can save
			-- memory because no other STRING is allocated for the job.
		require
			str /= Void
			f >= 0
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
			-- Square root of `Current'.
		require
			Current >= 0.0
		external "built_in"
		end

	frozen sin: like Current is
			-- Sine of `Current'.
		external "built_in"
		end

	frozen cos: like Current is
			-- Cosine of `Current'.
		external "built_in"
		end

	frozen tan: like Current is
			-- Tangent of `Current'.
		external "built_in"
		end

	frozen asin: like Current is
			-- Arc Sine of `Current'.
		external "built_in"
		end

	frozen acos: like Current is
			-- Arc Cosine of `Current'.
		external "built_in"
		end

	frozen atan: like Current is
			-- Arc Tangent of `Current'.
		external "built_in"
		end

	frozen atan2 (x: like Current): like Current is
			-- Arc Tangent of `Current' / `x'.
		external "built_in"
		end

	frozen sinh: like Current is
			-- Hyperbolic Sine of `Current'.
		external "built_in"
		end

	frozen cosh: like Current is
			-- Hyperbolic Cosine of `Current'.
		external "built_in"
		end

	frozen tanh: like Current is
			-- Hyperbolic Tangent of `Current'.
		external "built_in"
		end

	frozen exp: like Current is
			-- Exponential of `Current'.
		external "built_in"
		end

	frozen log: like Current is
			-- Natural Logarithm of `Current'.
		external "built_in"
		end

	frozen log10: like Current is
			-- Base-10 Logarithm of Current.
		external "built_in"
		end

	frozen pow (e: like Current): like Current is
			-- `Current' raised to the power of `e' (ANSI C `pow').
		external "built_in"
		end

feature {ANY} -- Hashing:
	hash_code: INTEGER is
		deferred
		end

feature {ANY} -- Miscellaneous:
	sign: INTEGER_8 is
			-- Sign of `Current' (0 -1 or 1).
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
			-- Give the number of bits, corresponding to the mantissa,
			-- in the binary representation of the real number.
		deferred
		end

	exponent_bits: INTEGER_8 is
			-- Give the number of bits, corresponding to the exponent,
			-- in the binary representation of the real number.
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
