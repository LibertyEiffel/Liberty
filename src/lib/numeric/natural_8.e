expanded class NATURAL_8

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
