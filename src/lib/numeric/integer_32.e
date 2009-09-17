expanded class INTEGER_32

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
			Result = Current
		end

	fit_integer_16: BOOLEAN is
			-- Does `Current' fit in INTEGER_16?
		do
			if Current >= -32768 then
				Result := Current <= 32767
			end
		ensure
			Result = Current.in_range(-32768, 32767)
		end

	to_integer_16: INTEGER_16 is
			-- Explicit conversion to INTEGER_16.
		require
			fit_integer_16
		external "built_in"
		ensure
			Result = Current
		end

	to_integer_64: INTEGER_64 is
			-- Explicit conversion to INTEGER_64.
		do
			Result := Current
		ensure
			Result = Current
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
	
	fit_natural_16: BOOLEAN is
			-- Does `Current' fit in NATURAL_16?
		do
			if Current >= 0 then
				Result := Current <= 65535
			end
		ensure
			Result = Current.in_range(0, 65535)
		end

	to_natural_16: NATURAL_16 is
			-- Explicit conversion to NATURAL_16.
		require
			fit_natural_16
		external "built_in"
		ensure
			Result.to_integer_32 = Current
		end
	
	to_natural_32: NATURAL_32 is
			-- Explicit conversion to NATURAL_32.
		require
			Current >= 0
		external "built_in"
		ensure
			Result.to_integer_32 = Current
		end
	
	to_natural_64: NATURAL_64 is
			-- Explicit conversion to NATURAL_64.
		require
			Current >= 0
		external "built_in"
		ensure
			Result.to_integer_32 = Current
		end
	
	force_to_real_32: REAL_32 is
			-- Forced conversion to REAL_32 (possible loss of precision).
			-- (See also `fit_real_32' and `to_real_32'.)
		external "built_in"
		end

	fit_real_32: BOOLEAN is
			-- Does `Current' fit in REAL_32?
		do
			Result := integer_32_fit_real_32(Current)
		end

	to_real_32: REAL_32 is
			-- Explicit conversion to REAL_32. (See also `force_to_real_32'.)
		require
			fit_real_32
		do
			Result := force_to_real_32
		ensure
			Result.force_to_integer_32 = Current
		end

	to_real_64: REAL_64 is
			-- Explicit conversion to REAL_64.
		do
			Result := Current
		ensure
			Result = Current
		end

	to_number: NUMBER is
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
	low_16: INTEGER_16 is
			-- The 16 low bits of `Current' (i.e. the right-most part).
		external "built_in"
		end

	high_16: INTEGER_16 is
			-- The 16 high bits of `Current' (i.e. the left-most part).
		do
			Result := (Current |>> 16).low_16
		end

	one: INTEGER_8 is 1

	zero: INTEGER_8 is 0

	hash_code: INTEGER_32 is
		do
			Result := Current & 0x7FFFFFFF
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
	integer_32_fit_real_32 (integer_32: INTEGER_32): BOOLEAN is
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "integer_fit_real"
			feature_name: "integer_32_fit_real_32"
			}"
		end

	bit_count: INTEGER_8 is 32
	
end -- class INTEGER_32
