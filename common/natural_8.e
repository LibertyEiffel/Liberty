indexing
	description: "number in range 0-255"
	copyright: "(C) 2006 Raphael Mack <mail@raphael-mack.de>"
	authors: "Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

expanded class NATURAL_8

insert
	COMPARABLE
		redefine
			fill_tagged_out_memory, out_in_tagged_out_memory, is_equal
		end
	NUMERIC
		undefine
			fill_tagged_out_memory, out_in_tagged_out_memory
		end

	PLATFORM
		undefine
			fill_tagged_out_memory, out_in_tagged_out_memory, is_equal
		end
	
feature {ANY} -- initialization
	make_from_signed (model: like item) is
		do
			item := model
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
--			no_overflow1: Current #+ other >= Current
--			no_overflow2: Current #+ other >= other
		do
			Result := Current #+ other
		ensure
			Result #- other = Current
		end

	infix "-" (other: like Current): like Current is
		require
			no_overflow: Current >= other
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
		do
			-- TODO
		end

	infix "//" (other: like Current): like Current is
			-- Quotient of the euclidian division of `Current' by `other'.
			-- The corresponding remainder is given by infix "\\".
			--
			-- See also infix "#//".
		require
			divisible(other)
		do
			Result := Current #// other
		ensure
			euclidian_divide_case1: Current >= zero implies Result * other + Current \\ other = Current
			euclidian_divide_case2: Current < zero implies Result #* other #+ (Current \\ other) = Current
		end

	infix "\\" (other: like Current): like Current is
			-- Remainder of the euclidian division of `Current' by `other'.
			-- By definition, `0 <= Result < other.abs'.
			--
			-- See also infix "#\\", infix "//".
		require
			divisible(other)
		do
			Result := Current #\\ other
		ensure
			Result >= zero
			good_remainder: Result #- (Current #\\ other) #\\ other = zero
		end	

	prefix "+": like Current is
		do
			Result := Current
		end

	prefix "-": like Current is
		require
			invalid: False
		do
		end	
	
feature {ANY} -- comparision
	is_equal (other: like Current): BOOLEAN is
		do
			Result := item.is_equal (other.item)
		end
	
	infix "<" (other: like Current): BOOLEAN is
		do
			-- TODO: check this
--			if item > 0 and other.item > 0 then
				Result := item < other.item
--			elseif item > 0 then
--				Result := True
--			elseif other.item > 0 then
--				Result := False
--			else
--				Result := item > other.item
--			end
		end

feature {ANY} -- Miscellaneous
	divisible (other: like Current): BOOLEAN is
		do
			Result := other /= zero
		end	

	hash_code: INTEGER is
		do
			Result := item
		end

feature {ANY} -- overflowing operators
	infix "#+" (other: like Current): like Current is
		do
			-- TODO:
			Result.make_from_signed (item #+ other.item)
		end
	
	infix "#-" (other: like Current): like Current is
		do
			-- TODO
			Result.make_from_signed (item #- other.item)
		end

	infix "#*" (other: like Current): like Current is
		do
			Result.make_from_signed(item #* other.item)
		end

	infix "#\\" (other: like Current): like Current is
		require
			divisible(other)
		do
			Result.make_from_signed (int_sharp_mod(item, other.item))
		ensure
			(Current - Result) #\\ other = zero
		end

	infix "#//" (other: like Current): like Current is
		require
			divisible(other)
		do
			Result.make_from_signed (int_sharp_div(item, other.item))
		ensure
			Result * other + Current #\\ other = Current
		end
	
feature {ANY} -- Object printing
	out_in_tagged_out_memory, fill_tagged_out_memory is
		do
			Current.append_in(tagged_out_memory)
		end

	append_in (buffer: STRING) is
			-- Append in the `buffer' the equivalent of `to_string'.
			-- If you look for performances, you should always prefer `append_in' which allow you to recycle
			-- a unique common `buffer' (each call of `to_string' allocate a new object!).
			--
			-- See also `append_in_format', `append_in_unicode', `append_in_unicode_format', `to_hexadecimal_in'.
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
--					print("(val #\\ ten)" + (val #\\ ten).out + "%N")
--					buffer.extend((val #\\ ten).decimal_digit)
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
	item: INTEGER_8


feature {ANY}
	to_integer_32: INTEGER_32 is
			-- Explicit conversion to INTEGER_32.
		do
			Result := item.to_integer_32
		end

	one: NATURAL_8 is
		do
			Result.make_from_signed(1)
		end
	
	zero: NATURAL_8 is
		do
			Result.make_from_signed(0)
		end

	ten: NATURAL_8 is
		do
			Result.make_from_signed(10)
		end

	to_character: CHARACTER is
		require
			Current.item >= 0
			Current.item <= Maximum_character_code
		do
			Result := item.to_character
		end
	
	decimal_digit: CHARACTER is
		do
			Result := (Current.item + '0'.code).to_character
		end
	
	int_sharp_mod (x, y: like item): like item is
		external "C inline use unistd.h"
		alias "((uint8_t)$x %% (uint8_t)$y)"
		end

	int_sharp_div (x, y: like item): like item is
		external "C inline use unistd.h"
		alias "((uint8_t)$x / (uint8_t)$y)"
		end

end
