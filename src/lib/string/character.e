expanded class CHARACTER
	--
	-- Note: An Eiffel CHARACTER is mapped as a C unsigned char or as a Java Byte.
	--

insert
	HASHABLE
		redefine out_in_tagged_out_memory, fill_tagged_out_memory
		end
	COMPARABLE
		redefine out_in_tagged_out_memory, fill_tagged_out_memory, infix ">=", infix "<=", infix ">"
		end
	PLATFORM
		undefine is_equal
		redefine out_in_tagged_out_memory, fill_tagged_out_memory
		end

feature {ANY}
	code: INTEGER_16 is
			-- ASCII code of Current. (No Sign-extended conversion.)
			--
			-- See also `to_integer_8'.
		external "built_in"
		ensure
			Result.in_range(Minimum_character_code, Maximum_character_code)
		end
	
	to_integer_8: INTEGER_8 is
			-- Sign-extended conversion.
			--
			-- See also `code'.
		external "built_in"
		end

	to_integer: INTEGER_8 is
		obsolete "Now use `to_integer_8' instead (march 2006)."
		do
			Result := to_integer_8
		end

	infix "<" (other: CHARACTER): BOOLEAN is
			-- Comparison using `code'.
		do
			Result := code < other.code
		ensure then
			Result = (code < other.code)
		end

	infix "<=" (other: CHARACTER): BOOLEAN is
			-- Comparison using `code'.
		do
			Result := code <= other.code
		end

	infix ">" (other: CHARACTER): BOOLEAN is
			-- Comparison using `code'.
		do
			Result := code > other.code
		end

	infix ">=" (other: CHARACTER): BOOLEAN is
			-- Comparison using `code'.
		do
			Result := code >= other.code
		end

	value, decimal_value: INTEGER_8 is
			-- Gives the value of a decimal digit.
		require
			is_digit
		do
			Result := code.to_integer_8 - 48
		ensure
			Result.in_range(0, 9)
		end

	binary_value: INTEGER_8 is
			-- Gives the value of a binary digit.
		require
			is_binary_digit
		do
			Result := code.to_integer_8 - 48
		ensure
			Result.in_range(0, 1)
		end

	octal_value: INTEGER_8 is
			-- Gives the value of an octal digit.
		require
			is_octal_digit
		do
			Result := code.to_integer_8 - 48
		ensure
			Result.in_range(0, 7)
		end

	hexadecimal_value: INTEGER_8 is
			-- Gives the value of an hexadecimal digit.
		require
			is_hexadecimal_digit
		do
			Result := code.to_integer_8
			if code < 'A'.code then
				Result := Result - 48
			elseif code < 'a'.code then
				Result := Result - 55
			else
				Result := Result - 87
			end
		ensure
			Result.in_range(0, 15)
		end

	same_as (other: CHARACTER): BOOLEAN is
			-- Case insensitive comparison.
			-- No difference between upper/lower case letters.
		do
			if Current = other then
				Result := True
			else
				inspect
					code
				when 65 .. 90 then
					Result := code = other.code - 32
				when 97 .. 122 then
					Result := code = other.code + 32
				else
				end
			end
		ensure
			Result implies to_lower = other or to_upper = other
		end

	to_upper: CHARACTER is
			-- Conversion to the corresponding upper case.
		do
			if code < 97 then
				Result := Current
			elseif code > 122 then
				Result := Current
			else
				Result := (code - 32).to_character
			end
		end

	to_lower: CHARACTER is
			-- Conversion to the corresponding lower case.
		do
			if code < 65 then
				Result := Current
			elseif code > 90 then
				Result := Current
			else
				Result := (code + 32).to_character
			end
		end

	is_letter: BOOLEAN is
			-- Is it a letter ('a' .. 'z' or 'A' .. 'Z') ?
		do
			if Current >= 'a' then
				Result := Current <= 'z'
			elseif Current >= 'A' then
				Result := Current <= 'Z'
			end
		ensure
			Result = in_range('A', 'Z') or in_range('a', 'z')
		end

	is_digit, is_decimal_digit: BOOLEAN is
			-- Belongs to '0'..'9'.
			--
			-- See also `value', `decimal_value'
		do
			if Current >= '0' then
				Result := Current <= '9'
			end
		ensure
			Result = in_range('0', '9')
		end

	is_binary_digit: BOOLEAN is
			-- Belongs to '0'..'1'.
		do
			if Current >= '0' then
				Result := Current <= '1'
			end
		ensure
			Result = in_range('0', '1')
		end

	is_octal_digit: BOOLEAN is
			-- Belongs to '0'..'7'.
		do
			if Current >= '0' then
				Result := Current <= '7'
			end
		ensure
			Result = in_range('0', '7')
		end

	is_hexadecimal_digit: BOOLEAN is
			-- Is it one character of "0123456789abcdefABCDEF" ?
		do
			if is_digit then
				Result := True
			elseif Current >= 'a' then
				Result := Current <= 'f'
			elseif Current >= 'A' then
				Result := Current <= 'F'
			end
		ensure
			Result = (once "0123456789abcdefABCDEF").has(Current)
		end

	is_lower: BOOLEAN is
			-- Is it some lowercase letter ('a'..'z')?
		do
			inspect
				Current
			when 'a' .. 'z' then
				Result := True
			else
			end
		end

	is_upper: BOOLEAN is
			-- Is it some uppercase letter ('A'..'Z')?
		do
			inspect
				Current
			when 'A' .. 'Z' then
				Result := True
			else
			end
		end

	is_separator: BOOLEAN is
			-- True when character is a separator.
		do
			inspect
				Current
			when ' ', '%T', '%N', '%R', '%U', '%F' then
				Result := True
			else
			end
		end

	is_letter_or_digit: BOOLEAN is
			-- Is it a letter (see `is_letter') or a digit (see `is_digit') ?
		do
			Result := is_letter or else is_digit
		ensure
			definition: Result = (is_letter or is_digit)
		end

	is_ascii: BOOLEAN is
			-- Is character a 8-bit ASCII character?
		do
			Result := code < 128
		end

	is_bit: BOOLEAN is
			-- True for `0' and `1'.
		do
			inspect
				Current
			when '0', '1' then
				Result := True
			else
			end
		end

	next: CHARACTER is
			-- Give the next character (the following `code')
		require
			code < Maximum_character_code
		do
			Result := (code + 1).to_character
		end

	previous: CHARACTER is
			-- Give the previous character (the `code' before)
		require
			code > Minimum_character_code
		do
			Result := (code - 1).to_character
		end

feature {ANY} -- Conversions:
	to_hexadecimal: STRING is
			-- Create a new STRING giving the `code' in hexadecimal.
			-- For example :
			--    (255).to_character.to_hexadecimal gives "FF".
			-- Note: see `to_hexadecimal_in' to save memory.
		do
			create Result.make(2)
			to_hexadecimal_in(Result)
		ensure
			Result.count = 2
		end

	to_hexadecimal_in (str: STRING) is
			-- Append the equivalent of `to_hexadecimal' at the end of
			-- `str'. Thus you can save memory because no other
			-- STRING is allocated for the job.
		local
			c: INTEGER_16
		do
			c := code |>> 4
			inspect
				c
			when 0 .. 9 then
				str.extend(('0'.code + c).to_character)
			else
				str.extend(('A'.code - 10 + c).to_character)
			end
			c := code & 0x000F
			inspect
				c
			when 0 .. 9 then
				str.extend(('0'.code + c).to_character)
			else
				str.extend(('A'.code - 10 + c).to_character)
			end
		ensure
			str.count = 2 + old str.count
		end

	to_string: STRING is
		do
			create Result.make_filled(Current, 1)
		ensure
			Result.count = 1
			Result.first = Current
		end

feature {ANY} -- Object Printing:
	out_in_tagged_out_memory, fill_tagged_out_memory is
		do
			tagged_out_memory.extend(Current)
		end

feature {ANY} -- Hashing:
	hash_code: INTEGER is
		do
			Result := code
		end

feature {ANY} -- Miscellaneous:
	is_alpha: BOOLEAN is
			-- See `is_letter' (yes this is just a call to `is_letter').
			-- Isn't `is_letter' better English ;-)
		do
			Result := is_letter
		ensure
			Result = is_letter
		end

end -- class CHARACTER
