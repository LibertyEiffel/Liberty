indexing
	description: "[
					  number in range 0-255
					  this class only works on systems which use two's complement
					  encoding for signed integers
					  ]"
	copyright: "(C) 2006 Raphael Mack <mail@raphael-mack.de>"
	authors: "Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- TODO: unicode support
			-- TODO: manifest notation
			-- TODO: other sized friends (NATURAL_16, 32, 64)
			-- TODO: implement to_number
			-- TODO: octal and hexadecimal output
			-- TODO: some TODOs (sqrt, log,...)
		
expanded class NATURAL_8
	
insert
	COMPARABLE
		redefine
			fill_tagged_out_memory, out_in_tagged_out_memory, is_equal
		end

	HASHABLE
		redefine
			fill_tagged_out_memory, out_in_tagged_out_memory
		end
	
	PLATFORM
		undefine
			fill_tagged_out_memory, out_in_tagged_out_memory, is_equal
		end

-- manifest creation for expanded types is not supported by se 2.3svn-r7842
-- creation
--	manifest_creation
	
feature {ANY} -- initialization
	make_from_signed (model: like storage) is
		require
			valid_range: model >= model.zero
		do
			storage := model
		end

	force_from_signed (model: like storage) is
			-- just ignore the sign of model and interpret the bit sequence 
			-- as unsigned number
		do
			storage := model
		end

feature {ANY}
	sign: INTEGER_8 is
			-- Sign of Current (0 -1 or 1).
		do
			if Current = zero then
				Result := 0
			else
				Result := 1
			end
		end

	infix "+" (other: like Current): like Current is
		require
			no_overflow1: Current #+ other >= Current
			no_overflow2: Current #+ other >= other
		do
			Result := Current #+ other
		ensure
			Result #- other = Current
		end

	infix "-" (other: like Current): like Current is
		require
			no_overflow: other <= Current
		do
			Result := Current #- other
		ensure
			valid_result: Result + other = Current
		end

	infix "*" (other: like Current): like Current is
		require
			no_overflow: divisible(other) implies Current #* other #// other = Current
		do
			Result := Current #* other
		ensure
			Current /= zero and other /= zero implies Result /= zero
			Result /= zero implies Result #// other = Current
			Result /= zero implies Result #\\ other = zero
		end

	infix "/" (other: like Current): REAL is
		require
			divisible: divisible(other)
		do
			Result := int_sharp_div(storage, other.storage)
		ensure
			positive: Result >= 0.0
		end

	infix "//" (other: like Current): like Current is
		require
			divisible(other)
		do
			Result := Current #// other
		ensure
			euclidian_divide_case1: Current >= zero implies Result * other + Current \\ other = Current
			euclidian_divide_case2: Current < zero implies Result #* other #+ (Current \\ other) = Current
		end

	infix "\\" (other: like Current): like Current is
		require
			divisible(other)
		do
			Result := Current #\\ other
		ensure
			good_remainder: Result #- (Current #\\ other) #\\ other = zero
		end	

	prefix "+": like Current is
		do
			Result := Current
		end

	is_odd: BOOLEAN is
			-- Is odd?
		do
			Result := Current & one /= zero
		end

	is_even: BOOLEAN is
			-- Is even?
		do
			Result := Current & one = zero
		end

	sqrt: REAL is
			-- Square root of `Current'.
		do
			-- TODO
		end

	log: REAL is
			-- Natural Logarithm of `Current'.
		require
			Current > zero
		do
			-- TODO
		end

	log10: REAL is
			-- Base-10 Logarithm of Current.
		require
			Current > zero
		do
			-- TODO
		end

	gcd (other: like Current): like Current is
			-- Great Common Divisor of `Current' and `other'.
		do
			if other = zero then
				Result := Current
			else
				Result := other.gcd(Current \\ other)
			end
		ensure
			Result >= zero
			Result = zero implies Current = zero and other = zero
			Result >= (one + one) implies Current \\ Result = zero and other \\ Result = zero and (Current // Result).gcd(other // Result) = one
		end

	
feature {ANY} -- comparision
	is_equal (other: like Current): BOOLEAN is
		do
			Result := storage.is_equal (other.storage)
		end
	
	infix "<" (other: like Current): BOOLEAN is
		do
			if storage >= 0 and other.storage >= 0 then
				Result := storage < other.storage
			elseif storage >= 0 then
				Result := True
			elseif other.storage >= 0 then
				Result := False
			else
				Result := other.storage < storage
			end
		end

feature {ANY} -- Conversions
	to_string: STRING is
			-- The decimal view of `Current' into a new allocated STRING.
			-- For example, if `Current' is 3 the `Result' is "3".
			--
			-- See also `append_in', `to_string_format', `to_unicode_string', `to_hexadecimal', `to_octal'.
		do
			string_buffer.clear_count
			append_in(string_buffer)
			Result := string_buffer.twin
		end

	to_integer_64: INTEGER_64 is
			-- Explicit conversion to INTEGER_64.
		require
			fit: fit_integer_64
		do
			Result := storage.to_integer_64
		end

	to_integer_32: INTEGER_32 is
			-- Explicit conversion to INTEGER_32.
		require
			fit: fit_integer_32
		do
			Result := storage.to_integer_32
		end

	to_integer_16: INTEGER_16 is
			-- Explicit conversion to INTEGER_16.
		require
			fit: fit_integer_16
		do
			Result := storage.to_integer_16
		end

	to_integer_8: INTEGER_8 is
			-- Explicit conversion to INTEGER_8.
		require
			fit: fit_integer_8
		do
			Result := storage
		end

	fit_integer_8: BOOLEAN is
			-- does Current fit into an INTEGER_8?
		do
			Result := storage >= 0
		end

	fit_integer_16: BOOLEAN is
			-- does Current fit into an INTEGER_16?
		do
			Result := True
		end

	fit_integer_32: BOOLEAN is
			-- does Current fit into an INTEGER_32?
		do
			Result := True
		end

	fit_integer_64: BOOLEAN is
			-- does Current fit into an INTEGER_64?
		do
			Result := True
		end
	
	to_character: CHARACTER is
		require
			Current.storage >= 0
			Current.storage <= Maximum_character_code
		do
			Result := storage.to_character
		end

	to_boolean: BOOLEAN is
			-- Return False for 0, otherwise True.
			--
			-- See also `to_string', `to_character', `to_hexadecimal', `to_number'.
		do
			Result := Current /= zero
		ensure
			Result = (Current /= zero)
		end

	to_string_format (s: INTEGER): STRING is
			-- Same as `to_string' but the result is on `s' character and the number is right aligned.
			--
			-- See also `append_in_format', `to_character', `to_number', `to_hexadecimal'.
		require
			to_string.count <= s
		local
			i: INTEGER
		do
			string_buffer.clear_count
			append_in(string_buffer)
			from
				create Result.make(string_buffer.count.max(s))
				i := s - string_buffer.count
			until
				i <= 0
			loop
				Result.extend(' ')
				i := i - 1
			end
			Result.append(string_buffer)
		ensure
			Result.count = s
		end

	append_in_format (buffer: STRING; s: INTEGER) is
			-- Append in the `buffer' the equivalent of `to_string_format'.
			-- If you look for performances, you should always prefer `append_in_format' which allow you to recycle
			-- a unique common `buffer' (each call of `to_string_format' allocate a new object!).
			--
			-- See also `append_in', `append_in_unicode', `append_in_unicode_format', `to_hexadecimal_in'.
		require
			to_string.count <= s
		local
			i: INTEGER
		do
			string_buffer.clear_count
			append_in(string_buffer)
			from
				i := s - string_buffer.count
			until
				i <= 0
			loop
				buffer.extend(' ')
				i := i - 1
			end
			buffer.append(string_buffer)
		ensure
			buffer.count >= old buffer.count + s
		end	
	
	decimal_digit: CHARACTER is
		require
			storage.in_range(0, 9)
		do
			Result := (Current.storage + '0'.code).to_character
		end

	hexadecimal_digit: CHARACTER is
		require
			storage.in_range(0, 15)
		do
			if storage <= 9 then
				Result := (storage + '0'.code).to_character
			else
				Result := ('A'.code + (storage - 10)).to_character
			end
		end

feature {ANY} -- Bitwise Logical Operators:
	bit_test (idx: INTEGER_8): BOOLEAN is
			-- The value of the `idx'-ith bit (the right-most bit is at
			-- index 0).
		require
			idx >= 0
			idx < object_size * 8
		do
			Result := Current.bit_shift_right(idx) & one /= zero
		end

	bit_set (idx: INTEGER_8): like Current is
			-- The value of the `idx'-ith bit (the right-most bit is at
			-- index 0).
		require
			idx >= 0
			idx < object_size * 8
		local
			mask: like Current
		do
			mask := one
			Result := Current.bit_or(mask.bit_shift_left(idx))
		ensure
			Result.bit_test(idx)
			Result = Current or Result.bit_reset(idx) = Current
		end

	bit_reset (idx: INTEGER_8): like Current is
			-- The value of the `idx'-ith bit (the right-most bit is at
			-- index 0).
		require
			idx >= 0
			idx < object_size * 8
		local
			mask: like Current
		do
			mask := one
			Result := Current.bit_and(mask.bit_shift_left(idx).bit_not)
		ensure
			not Result.bit_test(idx)
			Result = Current or Result.bit_set(idx) = Current
		end

	infix "|>>", bit_shift_right (s: INTEGER_8): like Current is
			-- Shift by `s' positions right (sign bit copied) bits falling
			-- off the end are lost.
		require
			s >= 0
		do
			Result.make_from_signed(storage |>>> s)
		end

	infix "|<<", bit_shift_left (s: INTEGER_8): like Current is
			-- Shift by `s' positions left bits falling off the end are lost.
		require
			s >= 0
		do
			Result.make_from_signed(storage |<< s)
		end

	infix "#>>", bit_rotate_right (s: INTEGER_8): like Current is
			-- Rotate by `s' positions right.
		require
			s > 0
			s < object_size * 8
		do
			Result.make_from_signed(storage #>> s)
		end
	
	infix "#<<", bit_rotate_left (s: INTEGER_8): like Current is
			-- Rotate by `s' positions left.
		require
			s > 0
			s < object_size * 8
		do
			Result.make_from_signed(storage #<< s)
		end

	bit_rotate (s: INTEGER_8): like Current is
			-- Rotate by `s' positions (positive `s' shifts right, negative left
			--
			-- See also infix "#>>" and infix "#<<".
		require
			s > -object_size * 8
			s < object_size * 8
		do
			Result.make_from_signed(storage.bit_rotate(s))
		end

	prefix "~", bit_not: like Current is
			-- One's complement of `Current'.
		do
			Result.make_from_signed(~storage)
		end

	infix "&", bit_and (other: like Current): like Current is
			-- Bitwise logical and of `Current' with `other'.
		do
			Result.make_from_signed(storage & other.storage)
		end

	infix "|", bit_or (other: like Current): like Current is
			-- Bitwise logical inclusive or of `Current' with `other'.
		do
			Result.make_from_signed(storage | other.storage)
		end

	bit_xor (other: like Current): like Current is
			-- Bitwise logical exclusive or of `Current' with `other'.
		do
			Result.make_from_signed(storage.bit_xor(other.storage))
		end

	bit_shift (s: INTEGER_8): like Current is
			-- Shift by `s' positions (positive `s' shifts right (sign bit
			-- copied), negative shifts left bits falling off the end are lost).
			--
			-- See also infix "|>>" and infix "|<<".
		require
			s /= 0
		do
			Result.make_from_signed(storage.bit_shift_unsigned(s))
		end
	
feature {ANY} -- Miscellaneous
	divisible (other: like Current): BOOLEAN is
		do
			Result := other /= zero
		end	

	hash_code: INTEGER is
		do
			Result := to_integer_32 & 0x7fffffff
		end

	one: like Current is
		do
			Result.make_from_signed(1)
		end
	
	zero: like Current is
		do
			Result.make_from_signed(0)
		end

	ten: like Current is
		do
			Result.make_from_signed(10)
		end

feature {ANY} -- overflowing operators
	infix "#+" (other: like Current): like Current is
		do
			Result.make_from_signed (storage #+ other.storage)
		end
	
	infix "#-" (other: like Current): like Current is
		do
			Result.make_from_signed (storage #- other.storage)
		end

	infix "#*" (other: like Current): like Current is
		do
			Result.make_from_signed(storage #* other.storage)
		end

	infix "#\\" (other: like Current): like Current is
		require
			divisible(other)
		do
			Result.make_from_signed (int_sharp_mod(storage, other.storage))
		ensure
			(Current #- Result) #\\ other = zero
		end

	infix "#//" (other: like Current): like Current is
		require
			divisible(other)
		local
			w, x, y, z, p: like Current
		do
			Result.make_from_signed (int_sharp_idiv(storage, other.storage))
		ensure
			(Result * other) + (Current #\\ other) = Current
		end
	
feature {ANY} -- Object printing
	out_in_tagged_out_memory, fill_tagged_out_memory is
		do
			Current.append_in(tagged_out_memory)
		end

	append_in (buffer: STRING) is
		require
			buffer /= Void
		local
			val: like Current; i, idx: INTEGER
			lb: STRING
		do
			if Current = zero then
				buffer.extend('0')
			else
				from
					-- Save the position of first character in the buffer.
					i := buffer.count + 1
					val := Current
					lb := buffer.twin
				until
					val = zero
				loop
					lb.extend((val #\\ ten).decimal_digit)
					val := val #// ten
				end
				buffer.copy (lb)
				-- Change character order.
				from
					idx := buffer.count
				until
					i >= idx
				loop
					buffer.swap(i, idx)
					idx := idx - 1
					i := i + 1
				end
			end
		end

feature {NATURAL_8}
	storage: INTEGER_8

feature {} -- manifest creation
	manifest_make (needed_capacity: INTEGER_32; signed: INTEGER_8) is
		do
			make_from_signed(signed)
		end

	manifest_put (index: INTEGER_32; element: like storage) is
		do
			
		end

feature {}
	int_sharp_div (x, y: like storage): REAL_32 is
		external "C inline use unistd.h"
		alias "(float)((float)(uint8_t)$x / (float)((uint8_t)$y))"
		end

	int_sharp_mod (x, y: like storage): like storage is
		external "C inline use unistd.h"
		alias "((uint8_t)$x %% (uint8_t)$y)"
		end

	int_sharp_idiv (x, y: like storage): like storage is
		external "C inline use unistd.h"
		alias "(uint8_t)((uint8_t)$x / (uint8_t)$y)"
		end

feature {}
	string_buffer: STRING is
		once
			create Result.make(128)
		end

end
