expanded class INTEGER_16

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
