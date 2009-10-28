-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ABSTRACT_STRING
	--
	-- Character STRINGs indexed from `1' to `count'.
	--
	-- See also FIXED_STRING and STRING

inherit
	ANY
		redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory, is_equal
		end
	HASHABLE
		redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory
		end
	COMPARABLE
		redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory, is_equal, compare, three_way_comparison,
			infix ">", infix "<=", infix ">="
		end
	STORABLE
		redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory, is_equal
		end
	TRAVERSABLE[CHARACTER]
		redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory, is_equal
		end

insert
	PLATFORM
		redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory, is_equal
		end
	RECYCLABLE
		undefine copy, out_in_tagged_out_memory, fill_tagged_out_memory, is_equal
		end
	STRING_HANDLER
		undefine copy, out_in_tagged_out_memory, fill_tagged_out_memory, is_equal
		end

feature {STRING_HANDLER}
	storage: NATIVE_ARRAY[CHARACTER]
			-- The place where characters are stored.

feature {ANY}
	count: INTEGER
			-- String length which is also the maximum valid index.
			--
			-- See also `is_empty', `lower', `upper'.

	capacity: INTEGER
			-- Capacity of the `storage' area.

	lower: INTEGER is 1
			-- Minimum index; actually, this is always 1 (this feature is
			-- here to mimic the one of the COLLECTION hierarchy).
			--
			-- See also `upper', `valid_index', `item'.

	upper: INTEGER is
			-- Maximum index; actually the same value as `count' (this
			-- feature is here to mimic the one of the COLLECTION hierarchy).
			--
			-- See also `lower', `valid_index', `item'.
		do
			Result := count
		ensure
			Result = count
		end

	copy (other: like Current) is
		deferred
		ensure then
			count = other.count
		end

feature {ANY} -- Testing:
	is_empty: BOOLEAN is
			-- Has string length 0?
			--
			-- See also `count'.
		do
			Result := count = 0
		end

	item (i: INTEGER): CHARACTER is
			-- Character at position `i'.
			--
			-- See also `lower', `upper', `valid_index', `put'.
		do
			Result := storage.item(i - 1)
		end

	frozen infix "@" (i: INTEGER): CHARACTER is
			-- The infix notation which is actually just a synonym for `item'.
			--
			-- See also `item', `put'.
		require
			valid_index: valid_index(i)
		do
			Result := item(i)
		ensure
			definition: Result = item(i)
		end

	infix "<" (other: ABSTRACT_STRING): BOOLEAN is
			-- Is `Current' less than `other'?
			--
			-- See also `>', `<=', `>=', `min', `max'.
		local
			i: INTEGER; maxi: INTEGER
		do
			from
				i := 1
				maxi := count.min(other.count)
			until
				i > maxi or else item(i) /= other.item(i)
			loop
				i := i + 1
			end
			if i <= maxi then
				Result := item(i) < other.item(i)
			else
				Result := i <= other.count
			end
		end

	infix "<=" (other: ABSTRACT_STRING): BOOLEAN is
		do
			Result := not (other < Current)
		end

	infix ">" (other: ABSTRACT_STRING): BOOLEAN is
		do
			Result := other < Current
		end

	infix ">=" (other: ABSTRACT_STRING): BOOLEAN is
		do
			Result := not (Current < other)
		end

	compare, three_way_comparison (other: ABSTRACT_STRING): INTEGER is
		local
			i: INTEGER; maxi: INTEGER
		do
			from
				i := 1
				maxi := count.min(other.count)
			until
				i > maxi or else item(i) /= other.item(i)
			loop
				i := i + 1
			end
			if count < i then
				if other.count < i then
				else
					Result := -1
				end
			elseif other.count < i then
				Result := 1
			elseif item(i) < other.item(i) then
				Result := -1
			else
				Result := 1
			end
		end

	is_equal (other: ABSTRACT_STRING): BOOLEAN is
			-- Do both strings have the same character sequence?
			--
			-- See also `same_as'.
		do
			if count = other.count then
				Result := storage.fast_memcmp(other.storage, count)
			end
		end

	same_as (other: ABSTRACT_STRING): BOOLEAN is
			-- Case insensitive `is_equal'.
		require
			other /= Void
		local
			s1, s2: like storage; i: INTEGER
		do
			i := count
			if i = other.count then
				if storage.fast_memcmp(other.storage, i) then
					Result := True
				else
					from
						i := i - 1
						s1 := storage
						s2 := other.storage
						Result := True
					until
						i < 0
					loop
						if s1.item(i).same_as(s2.item(i)) then
							i := i - 1
						else
							i := -1
							Result := False
						end
					end
				end
			end
		end

	item_code (i: INTEGER): INTEGER is
			-- Code of character at position `i'.
			--
			-- See also `item'.
		require
			valid_index: valid_index(i)
		do
			Result := storage.item(i - 1).code
		ensure
			definition: Result = item(i).code
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `c' at or after `start_index', 0 if none.
			--
			-- See also `reverse_index_of', `first_index_of', `last_index_of', `has'.
		require
			valid_start_index: start_index >= 1 and start_index <= count + 1
		do
			if start_index <= count then
				Result := storage.fast_index_of(c, start_index - 1, count - 1)
				if Result = count then
					Result := 0
				else
					Result := Result + 1
				end
			end
		ensure
			Result /= 0 implies item(Result) = c
		end

	reverse_index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `c' at or before `start_index', 0 if none.
			-- The search is done in reverse direction, which means from the `start_index' down
			-- to the first character.
			--
			-- See also `index_of', `last_index_of', `first_index_of'.
		require
			valid_start_index: start_index >= 0 and start_index <= count
		do
			if count > 0 then
				Result := storage.fast_reverse_index_of(c, start_index - 1) + 1
			end
		ensure
			Result /= 0 implies item(Result) = c
		end

	first_index_of (c: CHARACTER): INTEGER is
			-- Index of first occurrence of `c', 0 if none.
			--
			-- See also `last_index_of', `index_of', `reverse_index_of'.
		do
			Result := index_of(c, 1)
		ensure
			definition: Result = index_of(c, 1)
		end

	last_index_of (c: CHARACTER): INTEGER is
			-- Index of last occurrence of `c', 0 if none.
			--
			-- See also `first_index_of', `reverse_index_of', `index_of'.
		do
			Result := reverse_index_of(c, upper)
		ensure
			definition: Result = reverse_index_of(c, upper)
		end

	has (c: CHARACTER): BOOLEAN is
			-- True if `c' is in the STRING.
			--
			-- See also `index_of', `occurrences', `has_substring'.
		do
			Result := storage.fast_has(c, count - 1)
		end

	has_substring (other: ABSTRACT_STRING): BOOLEAN is
			-- True if `Current' contains `other'.
			--
			-- See also `substring_index', `has'.
		require
			other_not_void: other /= Void
		do
			Result := substring_index(other, 1) /= 0
		end

	occurrences (c: CHARACTER): INTEGER is
			-- Number of times character `c' appears in the string.
			--
			-- See also `remove_all_occurrences', `has'.
		do
			Result := storage.fast_occurrences(c, count - 1)
		ensure
			Result >= 0
		end

	has_suffix (s: ABSTRACT_STRING): BOOLEAN is
			-- True if suffix of `Current' is `s'.
			--
			-- See also `remove_suffix', `has_prefix', `has_substring'.
		require
			s /= Void
		local
			i1, i2: INTEGER
		do
			if s.count <= count then
				from
					i1 := count - s.count + 1
					i2 := 1
				until
					i1 > count or else item(i1) /= s.item(i2)
				loop
					i1 := i1 + 1
					i2 := i2 + 1
				end
				Result := i1 > count
			end
		end

	has_prefix (p: ABSTRACT_STRING): BOOLEAN is
			-- True if prefix of `Current' is `p'.
			--
			-- See also `remove_prefix', `has_suffix', `has_substring'.
		require
			p /= Void
		local
			i: INTEGER
		do
			if p.count <= count then
				from
					i := p.count
				until
					i = 0 or else item(i) /= p.item(i)
				loop
					i := i - 1
				end
				Result := i = 0
			end
		end

feature {ANY} -- Testing and Conversion:
	is_ascii: BOOLEAN is
			-- Is `Current' only made of (7 bit) ASCII characters?
		local
			i: INTEGER
		do
			from
				i := upper
				Result := True
			until
				i < lower or else not Result
			loop
				Result := item(i).is_ascii
				i := i - 1
			end
		ensure
			Result = for_all(agent {CHARACTER}.is_ascii)
		end

	is_boolean: BOOLEAN is
			-- Does `Current' represent a BOOLEAN?
			-- Valid BOOLEANs are "True" and "False".
		do
			Result := (once "True").is_equal(Current) or else (once "False").is_equal(Current)
		end

	to_boolean: BOOLEAN is
			-- Boolean value
			-- "True" yields True, "False" yields False (what a surprise).
		require
			represents_a_boolean: is_boolean
		do
			Result := (once "True").is_equal(Current)
		end

	is_integer: BOOLEAN is
			-- Does 'Current' represent an INTEGER?
			-- `Result' is True if and only if the following two conditions
			-- hold:
			--
			-- 1. In the following BNF grammar, the value of `Current' can be
			-- produced by "Integer_literal", if leading and trailing
			-- separators are ignored:
			--
			-- Integer_literal = [Sign] Integer
			-- Sign            = "+" | "-"
			-- Integer         = Digit | Digit Integer
			-- Digit           = "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
			--
			-- 2. The numerical value represented by `Current' is within the
			-- range that can be represented by an instance of type INTEGER.
		local
			i, state, value, bound, critical_bound: INTEGER; cc: CHARACTER
		do
			-- state 0: nothing read.
			-- state 1: "+" or "-" read.
			-- state 2: error.
			-- state 3: in the number.
			-- state 4: last digit of a critically big number
			-- state 5: after the number.
			from
				i := 1
			variant
				count - i
			until
				state = 2 or else i > count
			loop
				cc := item(i)
				inspect
					state
				when 0 then
					if cc.is_separator then
					elseif cc = '+' then
						bound := Maximum_integer #\\ 10
						critical_bound := Maximum_integer #// 10
						state := 1
					elseif cc = '-' then
						bound := -(Minimum_integer #\\ 10)
						critical_bound := -(Minimum_integer #// 10)
						state := 1
					elseif cc.is_digit then
						bound := Maximum_integer #\\ 10
						critical_bound := Maximum_integer #// 10
						value := cc.decimal_value
						state := 3
					else
						state := 2
					end
				when 1 then
					if cc.is_digit then
						value := cc.decimal_value
						state := 3
					else
						state := 2
					end
				when 3 then
					if cc.is_digit then
						value := 10 * value + cc.decimal_value
						if value >= critical_bound then
							state := 4
						end
					elseif cc.is_separator then
						state := 5
					else
						state := 2
					end
				when 4 then
					if cc.is_digit then
						if value > critical_bound then
							state := 2
						else
							if cc.decimal_value <= bound then
								state := 5
							else
								state := 2
							end
						end
					elseif cc.is_separator then
						state := 5
					else
						state := 2
					end
				when 5 then
					if cc.is_separator then
					else
						state := 2
					end
				end
				i := i + 1
			end
			Result := state >= 3
		end

	to_integer: INTEGER is
			-- `Current' must look like an INTEGER.
		require
			is_integer
		local
			i: INTEGER; cc: CHARACTER; negative: BOOLEAN
		do
			from
				i := 1
			variant
				count - i
			until
				not item(i).is_separator
			loop
				i := i + 1
			end
			cc := item(i)
			i := i + 1
			if cc = '+' then
				cc := item(i)
				i := i + 1
			elseif cc = '-' then
				negative := True
				cc := item(i)
				i := i + 1
			end
			check
				cc.is_digit
			end
			Result := -cc.value
			from
			variant
				count - i
			until
				i > count
			loop
				cc := item(i)
				if cc.is_digit then
					Result := 10 * Result - cc.decimal_value -- Should not overflow since `is_integer' is true
				else
					check
						cc.is_separator
					end
					i := count -- terminate the loop
				end
				i := i + 1
			end
			if negative then
			else
				Result := -Result
			end
		end

	is_integer_64: BOOLEAN is
			-- Does 'Current' represent an INTEGER_64?
			-- `Result' is True if and only if the following two conditions
			-- hold:
			--
			-- 1. In the following BNF grammar, the value of `Current' can be
			-- produced by "Integer_literal", if leading and trailing
			-- separators are ignored:
			--
			-- Integer_literal = [Sign] Integer
			-- Sign            = "+" | "-"
			-- Integer         = Digit | Digit Integer
			-- Digit           = "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
			--
			-- 2. The numerical value represented by `Current' is within the
			-- range that can be represented by an instance of type INTEGER_64.
		local
			i, state: INTEGER; value, bound, critical_bound: INTEGER_64; cc: CHARACTER
		do
			-- state 0: nothing read.
			-- state 1: "+" or "-" read.
			-- state 2: error.
			-- state 3: in the number.
			-- state 4: last digit of a critically big number
			-- state 5: after the number.
			from
				i := 1
			variant
				count - i
			until
				state = 2 or else i > count
			loop
				cc := item(i)
				inspect
					state
				when 0 then
					if cc.is_separator then
					elseif cc = '+' then
						bound := Maximum_integer_64 #\\ 10
						critical_bound := Maximum_integer_64 #// 10
						state := 1
					elseif cc = '-' then
						bound := -(Minimum_integer_64 #\\ 10)
						critical_bound := -(Minimum_integer_64 #// 10)
						state := 1
					elseif cc.is_digit then
						bound := Maximum_integer_64 #\\ 10
						critical_bound := Maximum_integer_64 #// 10
						value := cc.decimal_value
						state := 3
					else
						state := 2
					end
				when 1 then
					if cc.is_digit then
						value := cc.decimal_value
						state := 3
					else
						state := 2
					end
				when 3 then
					if cc.is_digit then
						value := 10 * value + cc.decimal_value
						if value >= critical_bound then
							state := 4
						end
					elseif cc.is_separator then
						state := 5
					else
						state := 2
					end
				when 4 then
					if cc.is_digit then
						if value > critical_bound then
							state := 2
						else
							if cc.decimal_value <= bound then
								state := 5
							else
								state := 2
							end
						end
					elseif cc.is_separator then
						state := 5
					else
						state := 2
					end
				when 5 then
					if cc.is_separator then
					else
						state := 2
					end
				end
				i := i + 1
			end
			Result := state >= 3
		end

	to_integer_64: INTEGER_64 is
			-- `Current' must look like an INTEGER_64.
		require
			is_integer_64
		local
			i: INTEGER; cc: CHARACTER; negative: BOOLEAN
		do
			from
				i := 1
			variant
				count - i
			until
				not item(i).is_separator
			loop
				i := i + 1
			end
			cc := item(i)
			i := i + 1
			if cc = '+' then
				cc := item(i)
				i := i + 1
			elseif cc = '-' then
				negative := True
				cc := item(i)
				i := i + 1
			end
			check
				cc.is_digit
			end
			Result := -cc.value
			from
			variant
				count - i
			until
				i > count
			loop
				cc := item(i)
				if cc.is_digit then
					Result := 10 * Result - cc.decimal_value -- Should not overflow since `is_integer_64' is true
				else
					check
						cc.is_separator
					end
					i := count -- terminate the loop
				end
				i := i + 1
			end
			if negative then
			else
				Result := -Result
			end
		end

	is_real: BOOLEAN is
			-- Can contents be read as a REAL ?
			-- Fails for numbers where the base or "10 ^ exponent" are not in
			-- the range `Minimum_real' ... `Maximum_real'. Parsing is done
			-- positive. That means if `Minimum_real.abs' is not equal to
			-- `Maximum_real' it will not work correctly. Furthermore the
			-- arithmetric package used must support the value 'inf' for a
			-- number greater than Maximum_real.
			-- `Result' is True if and only if the following two conditions
			-- hold:
			--
			-- 1. In the following BNF grammar, the value of `Current' can be
			-- produced by "Real_literal", if leading or trailing separators
			-- are ignored.
			--
			-- Real_literal    = Mantissa [Exponent_part]
			-- Exponent_part   = "E" Exponent
			--                 | "e" Exponent
			-- Exponent        = Integer_literal
			-- Mantissa        = Decimal_literal
			-- Decimal_literal = Integer_literal ["." Integer]
			-- Integer_literal = [Sign] Integer
			-- Sign            = "+" | "-"
			-- Integer         = Digit | Digit Integer
			-- Digit           = "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"
			--
			--
			-- 2. The numerical value represented by `Current' is within the
			-- range that can be represented by an instance of type REAL.
		local
			i, state: INTEGER; cc: CHARACTER; base, exp, value, multiplier: REAL; negative, neg_exp: BOOLEAN
		do
			-- state 0: nothing read.
			-- state 1: "+" or "-" read.
			-- state 2: in the number.
			-- state 3: decimal point read
			-- state 4: in fractional part
			-- state 5: read 'E' or 'e' for scientific notation
			-- state 6: read "-" or "+" sign of exponent
			-- state 7: in exponent
			-- state 8: after the number.
			-- state 9: error.
			from
				i := 1
			variant
				count - i
			until
				state = 9 or else i > count
			loop
				cc := item(i)
				inspect
					state
				when 0 then
					if cc.is_separator then
					elseif cc = '+' then
						state := 1
					elseif cc = '-' then
						negative := True
						state := 1
					elseif cc.is_digit then
						base := cc.decimal_value
						state := 2
					elseif cc = '.' then
						state := 3
					else
						state := 9
					end
				when 1 then
					if cc.is_digit then
						base := cc.decimal_value
						state := 2
					elseif cc = '.' then
						state := 3
					else
						state := 9
					end
				when 2 then
					if cc.is_digit then
						base := base * 10 + cc.decimal_value
					elseif cc = '.' then
						state := 3
					elseif cc = 'e' or else cc = 'E' then
						state := 5
					elseif cc.is_separator then
						state := 8
					else
						state := 9
					end
				when 3 then
					multiplier := 0.1
					if cc.is_digit then
						base := base + multiplier * cc.decimal_value
						state := 4
					else
						state := 9
					end
				when 4 then
					multiplier := multiplier * 0.1
					if cc.is_digit then
						base := base + multiplier * cc.decimal_value
					elseif cc.is_separator then
						state := 8
					elseif cc = 'e' or else cc = 'E' then
						state := 5
					else
						state := 9
					end
				when 5 then
					if cc = '-' then
						neg_exp := True
						state := 6
					elseif cc = '+' then
						state := 6
					elseif cc.is_digit then
						exp := cc.decimal_value
						state := 7
					else
						state := 9
					end
				when 6 then
					if cc.is_digit then
						exp := cc.decimal_value
						state := 7
					else
						state := 9
					end
				when 7 then
					if cc.is_digit then
						exp := exp * 10 + cc.decimal_value
					elseif cc.is_separator then
						state := 8
					else
						state := 9
					end
				when 8 then
					if cc.is_separator then
					else
						state := 9
					end
				end
				i := i + 1
			end
			if state /= 0 and then state /= 9 and then state /= 1 then
				Result := True
				if neg_exp then
					exp := -1 * exp
				end
				value := base * 10.0.pow(exp)
				if value > Maximum_real then
					-- can only happen if value = inf
					Result := False
				end
			end
		end

	to_real: REAL is
			-- Conversion to the corresponding REAL value. The string must looks like a REAL (or like an
			-- INTEGER because the fractionnal part is optional). For an exact definition see 'is_real'.
			-- Note that this conversion might not be exact.
		require
			represents_a_real: is_real
		local
			i, state: INTEGER; cc: CHARACTER; base, exp, multiplier: REAL; negative, neg_exp: BOOLEAN
		do
			-- state 0: nothing read.
			-- state 1: "+" or "-" read.
			-- state 2: in the number.
			-- state 3: decimal point read
			-- state 4: in fractional part
			-- state 5: read 'E' or 'e' for scientific notation
			-- state 6: read "-" or "+" sign of exponent
			-- state 7: in exponent
			-- state 8: after the number.
			from
				i := 1
			variant
				count - i
			until
				i > count
			loop
				cc := item(i)
				inspect
					state
				when 0 then
					if cc.is_separator then
					elseif cc = '+' then
						state := 1
					elseif cc = '-' then
						negative := True
						state := 1
					elseif cc.is_digit then
						base := cc.decimal_value
						state := 2
					else
						-- cc = '.'
						state := 3
					end
				when 1 then
					if cc.is_digit then
						base := cc.decimal_value
						state := 2
					else
						-- cc = '.'
						state := 3
					end
				when 2 then
					if cc.is_digit then
						base := base * 10 + cc.decimal_value
					elseif cc = '.' then
						state := 3
					elseif cc.is_separator then
						state := 8
					else
						-- cc = 'e' or else cc = 'E'
						state := 5
					end
				when 3 then
					multiplier := 0.1
					if cc.is_separator then
						state := 8
					else
						-- cc.is_digit
						base := base + multiplier * cc.decimal_value
						state := 4
					end
				when 4 then
					multiplier := multiplier * 0.1
					if cc.is_digit then
						base := base + multiplier * cc.decimal_value
					elseif cc.is_separator then
						state := 8
					else
						-- cc = 'e' or else cc = 'E'
						state := 5
					end
				when 5 then
					if cc = '-' then
						neg_exp := True
						state := 6
					elseif cc = '+' then
						state := 6
					else
						-- cc.is_digit
						exp := cc.decimal_value
						state := 7
					end
				when 6 then
					-- cc.is_digit
					exp := cc.decimal_value
					state := 7
				when 7 then
					if cc.is_digit then
						exp := exp * 10 + cc.decimal_value
					else
						-- cc.is_separator
						state := 8
					end
				when 8 then
					-- cc.is_separator
					i := count -- terminate the loop
				end
				i := i + 1
			end
			if neg_exp then
				exp := -1 * exp
			end
			if negative then
				Result := -1 * base * 10.0.pow(exp)
			else
				Result := base * 10.0.pow(exp)
			end
		end

	is_number: BOOLEAN is
			-- Can contents be read as a NUMBER?
		local
			number_tools: NUMBER_TOOLS
		do
			Result := number_tools.is_number(Current)
		end

	to_number: NUMBER is
			-- Current must looks like an INTEGER.
		require
			is_number
		local
			number_tools: NUMBER_TOOLS
		do
			Result := number_tools.from_string(Current)
		end

	is_bit: BOOLEAN is
			-- True when the contents is a sequence of bits (i.e., mixed
			-- characters `0' and characters `1').
		local
			i: INTEGER
		do
			from
				i := count
				Result := True
			until
				not Result or else i = 0
			loop
				Result := item(i).is_bit
				i := i - 1
			end
		ensure
			Result = (count = occurrences('0') + occurrences('1'))
		end

	binary_to_integer: INTEGER is
			-- Assume there is enougth space in the INTEGER to store
			-- the corresponding decimal value.
		require
			is_bit
			count <= Integer_bits
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > count
			loop
				if item(i) = '1' then
					Result := Result |<< 1 + 1
				else
					Result := Result |<< 1
				end
				i := i + 1
			end
		end

feature {ANY}
	infix "+" (other: ABSTRACT_STRING): STRING is
			-- Create a new STRING which is the concatenation of
			-- `Current' and `other'.
			--
			-- See also `append'.
		require
			other_exists: other /= Void
		do
			create Result.make(count + other.count)
			Result.append(Current)
			Result.append(other)
		ensure
			result_count: Result.count = count + other.count
		end

	as_lower: STRING is
			-- New object with all letters in lower case.
			--
			-- See also `as_upper', `to_lower', `to_upper'.
		do
			create Result.make_from_string(Current)
			Result.to_lower
		end

	as_upper: STRING is
			-- New object with all letters in upper case.
			--
			-- See also `as_lower', `to_upper', `to_lower'.
		do
			create Result.make_from_string(Current)
			Result.to_upper
		end

feature {ANY} -- Printing:
	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(Current)
		end

	fill_tagged_out_memory is
		do
			tagged_out_memory.append(once "count: ")
			count.append_in(tagged_out_memory)
			tagged_out_memory.append(once "capacity: ")
			capacity.append_in(tagged_out_memory)
			tagged_out_memory.append(once "storage: %"")
			tagged_out_memory.append(Current)
			tagged_out_memory.add_last('%"')
		end

feature {ANY} -- Other features:
	first: CHARACTER is
			-- Access to the very `first' character.
			--
			-- See also `last', `item'.
		do
			Result := storage.item(0)
		end

	last: CHARACTER is
			-- Access to the very `last' character.
			--
			-- See also `first', `item'.
		do
			Result := storage.item(count - 1)
		end

	substring (start_index, end_index: INTEGER): like Current is
			-- New string consisting of items [`start_index'.. `end_index'].
			--
			-- See also `substring_index' and `copy_substring' to save memory.
		require
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		deferred
		ensure
			substring_count: Result.count = end_index - start_index + 1
		end

	substring_index (other: ABSTRACT_STRING; start_index: INTEGER): INTEGER is
			-- Position of first occurrence of `other' at or after `start_index', 0 if none.
			--
			-- See also `substring', `first_substring_index'.
		require
			other_not_void: other /= Void
			valid_start_index: start_index >= 1 and start_index <= count + 1
		local
			i, s: INTEGER
		do
			from
				s := start_index
			until
				Result /= 0 or else s + other.count - 1 > count
			loop
				from
					i := 1
				until
					i > other.count or else item(s + i - 1) /= other.item(i)
				loop
					i := i + 1
				end
				if i > other.count then
					Result := s
				else
					s := s + 1
				end
			end
		end

	first_substring_index (other: ABSTRACT_STRING): INTEGER is
			-- Position of first occurrence of `other' at or after 1, 0 if none.
			--
			-- See also `substring_index'.
		require
			other_not_void: other /= Void
		do
			Result := substring_index(other, 1)
		ensure
			definition: Result = substring_index(other, 1)
		end

feature {ANY} -- Splitting a STRING:
	split: ARRAY[STRING] is
			-- Split the string into an array of words. Uses `is_separator' of
			-- CHARACTER to find words. Gives Void or a non empty array.
			--
			-- See also `split_in'.
		do
			if count > 0 then
				split_buffer.clear_count
				split_in(split_buffer)
				if not split_buffer.is_empty then
					Result := split_buffer.twin
				end
			end
		ensure
			Result /= Void implies not Result.is_empty
		end

	split_in (words: COLLECTION[STRING]) is
			-- Same jobs as `split' but result is appended in `words'.
			--
			-- See also `split'.
		require
			words /= Void
		local
			state, i: INTEGER; c: CHARACTER
		do
			-- state = 0: waiting next word.
			-- state = 1: inside a new word.
			if count > 0 then
				from
					i := 1
				until
					i > count
				loop
					c := item(i)
					if state = 0 then
						if not c.is_separator then
							string_buffer.clear_count
							string_buffer.add_last(c)
							state := 1
						end
					else
						if not c.is_separator then
							string_buffer.add_last(c)
						else
							words.add_last(string_buffer.twin)
							state := 0
						end
					end
					i := i + 1
				end
				if state = 1 then
					words.add_last(string_buffer.twin)
				end
			end
		ensure
			words.count >= old words.count
		end

feature {ANY} -- Other features:
	new_iterator: ITERATOR[CHARACTER] is
		do
			create {ITERATOR_ON_STRING} Result.make(Current)
		end

	intern: FIXED_STRING is
			-- A shared version of this string.
		deferred
		ensure
			Result /= Void
			Result.is_equal(Current)
			Result.is_interned
			interned.fast_has(Result)
		end

feature {ANY} -- Interfacing with C string:
	to_external: POINTER is
			-- Gives C access to the internal `storage' (may be dangerous).
			-- To be compatible with C, a null character is added at the end
			-- of the internal `storage'. This extra null character is not
			-- part of the Eiffel STRING.
		deferred
		ensure
			(is_empty or else storage.item(count) /= '%U') implies (capacity > count and then storage.item(count) = '%U')
			count = old count
			Result.is_not_null
		end

feature {}
	string_buffer: STRING is
			-- Private, temporary once buffer.
		once
			create Result.make(256)
		end

	split_buffer: ARRAY[STRING] is
		once
			create Result.with_capacity(4, 1)
		end

	computed_hash_code: INTEGER is
		local
			i, j: INTEGER
		do
			from
				j := count
				i := 1
			until
				j <= 0
			loop
				Result := {INTEGER 5} #* Result #+ item(i).code
				i := i + 1
				j := j - 1
			end
			if Result < 0 then
				Result := ~Result
			end
		end

	interned: SET[FIXED_STRING] is
		once
			create {HASHED_SET[FIXED_STRING]}Result.make
		end

invariant
	0 <= count
	count <= capacity
	capacity > 0 implies storage.is_not_null

end -- class ABSTRACT_STRING
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
