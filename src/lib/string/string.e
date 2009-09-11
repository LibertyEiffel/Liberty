-- See the Copyright notice at the end of this file.
--
class STRING
	--
	-- Resizable character STRINGs indexed from `1' to `count'.
	--

inherit
	ANY
		redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory, is_equal
		end
	HASHABLE
		redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory
		end
	COMPARABLE
		redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory, is_equal, compare, three_way_comparison
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
		redefine copy, out_in_tagged_out_memory, fill_tagged_out_memory, is_equal
		end

creation {ANY}
	with_capacity, make, copy, make_empty, make_filled, from_external, from_external_copy,
	from_external_sized, from_external_sized_copy, make_from_string

feature {STRING, STRING_HANDLER}
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

feature {ANY} -- Creation / Modification:
	make, with_capacity (needed_capacity: INTEGER) is
			-- Initialize the string to have at least `needed_capacity' characters of storage.
		require
			non_negative_size: needed_capacity >= 0
		do
			if needed_capacity > 0 then
				if capacity < needed_capacity then
					storage := storage.calloc(needed_capacity)
					capacity := needed_capacity
				end
			end
			count := 0
		ensure
			needed_capacity <= capacity
			empty_string: count = 0
		end

	make_empty is
			-- Create an empty string.
		do
			make(0)
		end

	make_filled (c: CHARACTER; n: INTEGER) is
			-- Initialize string with `n' copies of `c'.
		require
			valid_count: n >= 0
		do
			make(n)
			count := n
			fill_with(c)
		ensure
			count_set: count = n
			filled: occurrences(c) = count
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

	hash_code: INTEGER is
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

	infix "<" (other: like Current): BOOLEAN is
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

	compare, three_way_comparison (other: like Current): INTEGER is
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

	is_equal (other: like Current): BOOLEAN is
			-- Do both strings have the same character sequence?
			--
			-- See also `same_as'.
		do
			if count = other.count then
				Result := storage.fast_memcmp(other.storage, count)
			end
		end

	same_as (other: STRING): BOOLEAN is
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

	has_substring (other: STRING): BOOLEAN is
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

	has_suffix (s: STRING): BOOLEAN is
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

	has_prefix (p: STRING): BOOLEAN is
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

	to_hexadecimal is
			-- Convert Current bit sequence into the corresponding
			-- hexadecimal notation.
		require
			is_bit
		local
			i, k, new_count: INTEGER; value: INTEGER
		do
			from
				i := 1
				k := count #\\ 4
				if k > 0 then
					new_count := 1
				end
			until
				k = 0
			loop
				value := value * 2 + item(i).value
				i := i + 1
				k := k - 1
			end
			if new_count > 0 then
				put(value.hexadecimal_digit, new_count)
			end
			from
			until
				i > count
			loop
				from
					value := item(i).value
					i := i + 1
					k := 3
				until
					k = 0
				loop
					value := value * 2 + item(i).value
					i := i + 1
					k := k - 1
				end
				new_count := new_count + 1
				put(value.hexadecimal_digit, new_count)
			end
			count := new_count
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

feature {ANY} -- Modification:
	resize (new_count: INTEGER) is
			-- Resize Current. When `new_count' is greater than
			-- `count', new positions are initialized with the
			-- default value of type CHARACTER ('%U').
		require
			new_count >= 0
		do
			if new_count <= count then
			elseif capacity < new_count then
				ensure_capacity(new_count)
			else
				storage.clear(count, new_count - 1)
			end
			count := new_count
		ensure
			count = new_count
			capacity >= old capacity
		end

	clear_count, wipe_out is
			-- Discard all characters so that `is_empty' is True after that call.
			--	The internal `capacity' is not changed by this call (i.e. the internal `storage' memory is
			--	neither released nor shrunk).
			--
			-- See also `clear_count_and_capacity'.
		do
			count := 0
		ensure
			is_empty: count = 0
			capacity = old capacity
		end

	clear_count_and_capacity is
			-- Discard all characters (`is_empty' is True after that call). The internal `capacity' may also be
			-- reduced after this call.
			--
			-- See also `clear_count'.
		local
			null_storage: like storage
		do
			count := 0
			capacity := 0
			storage := null_storage
		ensure
			is_empty: count = 0
			capacity = 0
			storage.is_null
		end

	copy (other: like Current) is
			-- Copy `other' onto Current.
			--
			-- See also `copy_substring'.
		local
			c: INTEGER
		do
			c := other.count
			if c > 0 then
				if capacity < c then
					storage := storage.calloc(c)
					capacity := c
				end
				storage.copy_from(other.storage, c - 1)
			end
			count := c
		ensure then
			count = other.count
		end

	copy_substring (s: like Current; start_index, end_index: INTEGER) is
			-- Copy the substring from `s' from `start_index' to `end_index'
			-- to Current.
			--
			-- See also `copy'.
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= s.count
			meaningful_interval: start_index <= end_index + 1
		local
			needed_capacity: INTEGER
		do
			needed_capacity := end_index - start_index + 1
			if needed_capacity > capacity then
				ensure_capacity(needed_capacity)
			end
			storage.slice_copy(0, s.storage, start_index - 1, end_index - 1)
			count := needed_capacity
		end

	fill_with (c: CHARACTER) is
			-- Replace every character with `c'.
		do
			storage.set_all_with(c, count - 1)
		ensure
			occurrences(c) = count
		end

	replace_all (old_character, new_character: like item) is
			-- Replace all occurrences of the element `old_character' by `new_character'.
		do
			storage.fast_replace_all(old_character, new_character, count - 1)
		ensure
			count = old count
			old_character /= new_character implies occurrences(old_character) = 0
		end

	append, append_string (s: STRING) is
			-- Append a copy of 's' to `Current'.
			--
			-- See also `add_last', `add_first', `prepend', '+'.
		require
			s_not_void: s /= Void
		local
			s_count, needed_capacity: INTEGER
		do
			-- *** TO DEBUG THE CORE COMPILER:
			-- ***
--***			if has_substring(once "if((((C)->id)") then	sedb_breakpoint end
			-- ***			
			s_count := s.count
			needed_capacity := count + s_count
			if needed_capacity > capacity then
				ensure_capacity(needed_capacity)
			end
			storage.copy_at(count, s.storage, s_count)
			count := needed_capacity
		end

	append_substring (s: STRING; start_index, end_index: INTEGER) is
			-- Append the substring from `s' from `start_index' to `end_index'
			-- to Current.
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= s.count
			meaningful_interval: start_index <= end_index + 1
		local
			needed_capacity: INTEGER
		do
			needed_capacity := count + end_index - start_index + 1
			if needed_capacity > capacity then
				ensure_capacity(needed_capacity)
			end
			storage.slice_copy(count, s.storage, start_index - 1, end_index - 1)
			count := needed_capacity
		end

	prepend (other: STRING) is
			-- Prepend `other' to `Current'.
			--
			-- See also `append'.
		require
			other /= Void
		local
			i, j: INTEGER
		do
			i := count
			j := other.count
			resize(i + j)
			if i > 0 and then j > 0 then
				storage.move(0, i - 1, j)
			end
			storage.copy_from(other.storage, j - 1)
		ensure
			(old other.twin + old Current.twin).is_equal(Current)
		end

	insert_string (s: STRING; i: INTEGER) is
			-- Insert `s' at index `i', shifting characters from index `i'
			-- to `count' rightwards.
		require
			string_not_void: s /= Void
			valid_insertion_index: 1 <= i and i <= count + 1
		local
			j, k: INTEGER
		do
			j := count
			k := s.count
			resize(j + k)
			if i <= j then
				storage.move(i - 1, j - 1, k)
			end
			storage.copy_at(i - 1, s.storage, k)
		end

	replace_substring (s: STRING; start_index, end_index: INTEGER) is
			-- Replace the substring from `start_index' to `end_index',
			-- inclusive, with `s'.
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		local
			remove_len, insert_len, difference, old_count: INTEGER
		do
			old_count := count
			remove_len := end_index - start_index + 1
			insert_len := s.count
			difference := insert_len - remove_len
			if difference > 0 then
				resize(old_count + difference)
				if end_index < old_count then
					-- something to move?
					storage.move(end_index + 1 - 1, old_count - 1, difference)
				end
			elseif difference < 0 then
				if end_index < count then
					-- something to move?
					storage.move(end_index + 1 - 1, old_count - 1, difference)
				end
				resize(old_count + difference)
			end
			storage.copy_at(start_index - 1, s.storage, s.count)
		end

	infix "+" (other: STRING): like Current is
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

	put (c: CHARACTER; i: INTEGER) is
			-- Put `c' at index `i'.
			--
			-- See also `item', `lower', `upper', `swap'.
		require
			valid_index: valid_index(i)
		do
			storage.put(c, i - 1)
		ensure
			item(i) = c
		end

	swap (i1, i2: INTEGER) is
			-- Swap two characters.
			--
			-- See also `item', `put'.
		require
			valid_index(i1)
			valid_index(i2)
		local
			tmp: CHARACTER
		do
			tmp := item(i1)
			put(item(i2), i1)
			put(tmp, i2)
		ensure
			item(i1) = old item(i2)
			item(i2) = old item(i1)
		end

	insert_character (c: CHARACTER; i: INTEGER) is
			-- Inserts `c' at index `i', shifting characters from
			-- position 'i' to `count' rightwards.
		require
			valid_insertion_index: 1 <= i and i <= count + 1
		local
			j: INTEGER
		do
			from
				j := count
				add_last(' ')
			until
				j = i - 1
			loop
				put(item(j), j + 1)
				j := j - 1
			end
			put(c, i)
		ensure
			item(i) = c
		end

	shrink (min_index, max_index: INTEGER) is
			-- Keep only the slice [`min_index' .. `max_index'] or nothing
			-- when the slice is empty.
		require
			1 <= min_index
			max_index <= count
			min_index <= max_index + 1
		do
			if max_index < min_index then
				count := 0
			elseif min_index = 1 then
				count := max_index
			else
				storage.slice_copy(0, storage, min_index - 1, max_index - 1)
				count := max_index - min_index + 1
			end
		ensure
			count = max_index - min_index + 1
		end

	remove (i: INTEGER) is
			-- Remove character at position `i'.
			--
			-- See also `remove_head', `remove_between', `remove_suffix', `remove_prefix'.
		require
			valid_removal_index: valid_index(i)
		do
			remove_between(i, i)
		ensure
			count = old count - 1
		end

	add_first, precede (c: CHARACTER) is
			-- Add `c' at first position.
			--
			-- See also `add_last'.
		local
			i: INTEGER
		do
			from
				add_last(' ')
				i := count
			until
				i = 1
			loop
				put(item(i - 1), i)
				i := i - 1
			end
			put(c, 1)
		ensure
			count = 1 + old count
			item(1) = c
		end

	add_last, append_character, extend (c: CHARACTER) is
			-- Append `c' to string.
			--
			-- See also `add_first'.
		do
			if count = capacity then
				ensure_capacity(count + 1)
			end
			storage.put(c, count)
			count := count + 1
		ensure
			count = 1 + old count
			item(count) = c
		end

	to_lower is
			-- Convert all characters to lower case.
			--
			-- See also `to_upper', `as_lower', `as_upper'.
		local
			i: INTEGER
		do
			from
				i := count
			until
				i = 0
			loop
				put(item(i).to_lower, i)
				i := i - 1
			end
		end

	to_upper is
			-- Convert all characters to upper case.
			--
			-- See also `to_lower', `as_upper', `as_lower'.
		local
			i: INTEGER
		do
			from
				i := count
			until
				i = 0
			loop
				put(item(i).to_upper, i)
				i := i - 1
			end
		end

	as_lower: like Current is
			-- New object with all letters in lower case.
			--
			-- See also `as_upper', `to_lower', `to_upper'.
		do
			create Result.copy(Current)
			Result.to_lower
		end

	as_upper: like Current is
			-- New object with all letters in upper case.
			--
			-- See also `as_lower', `to_upper', `to_lower'.
		do
			create Result.copy(Current)
			Result.to_upper
		end

	keep_head (n: INTEGER) is
			-- Remove all characters except for the first `n'.
			-- Do nothing if `n' >= `count'.
			--
			-- See also `keep_tail', `remove_head', `remove_tail'.
		require
			n_non_negative: n >= 0
		do
			if n < count then
				remove_tail(count - n)
			end
		ensure
			count = n.min(old count)
		end

	keep_tail (n: INTEGER) is
			-- Remove all characters except for the last `n'.
			-- Do nothing if `n' >= `count'.
			--
			-- See also `keep_head', `remove_tail', `remove_head'.
		require
			n_non_negative: n >= 0
		do
			if n < count then
				remove_head(count - n)
			end
		ensure
			count = n.min(old count)
		end

	remove_first is
			-- Remove the `first' item.
			--
			-- See also `remove_head', `remove_last', `remove'.
		require
			not is_empty
		do
			storage.remove_first(count - 1)
			count := count - 1
		ensure
			count = old count - 1
		end

	remove_the_first is
		obsolete "Now use `remove_first' instead (feb 2006)."
		do
			remove_first
		end

	remove_head (n: INTEGER) is
			-- Remove `n' first characters. If `n' >= `count', remove all.
			--
			-- See also `remove_tail', `remove', `remove_the_first'.
		require
			n_non_negative: n >= 0
		do
			if n > count then
				count := 0
			else
				if n > 0 then
					remove_between(1, n)
				end
			end
		ensure
			count = (old count - n).max(0)
		end

	remove_last is
			-- Remove the `last' item.
			--
			-- See also `remove_tail', `remove_first', `remove'.
		require
			not is_empty
		do
			count := count - 1
		ensure
			count = old count - 1
		end

	remove_the_last is
		obsolete "Now use `remove_last' instead (feb 2006)."
		do
			remove_last
		end

	remove_tail (n: INTEGER) is
			-- Remove `n' last characters. If `n' >= `count', remove all.
			--
			-- See also `remove_head', `remove', `remove_the_last'.
		require
			n_non_negative: n >= 0
		do
			if n > count then
				count := 0
			else
				count := count - n
			end
		ensure
			count = (old count - n).max(0)
		end

	remove_substring, remove_between (start_index, end_index: INTEGER) is
			-- Remove all characters from `strt_index' to `end_index' inclusive.
		require
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		local
			i, len: INTEGER
		do
			len := end_index - start_index + 1
			if len > 0 then
				from
					i := end_index + 1
				until
					i > count
				loop
					put(item(i), i - len)
					i := i + 1
				end
				count := count - len
			end
		ensure
			count = old count - (end_index - start_index + 1)
		end

	remove_suffix (s: STRING) is
			-- Remove the suffix `s' of current string.
			--
			-- See also `remove_prefix', `remove_tail', `remove'.
		require
			has_suffix(s)
		do
			remove_tail(s.count)
		ensure
			(old Current.twin).is_equal(Current + old s.twin)
		end

	remove_prefix (s: STRING) is
			-- Remove the prefix `s' of current string.
			--
			-- See also `remove_suffix', `remove_head', `remove'.
		require
			has_prefix(s)
		do
			remove_head(s.count)
		ensure
			(old s.twin + Current).is_equal(old Current.twin)
		end

	left_adjust is
			-- Remove leading blanks.
			--
			-- See also `remove_head', `first'.
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > count or else item(i) /= ' '
			loop
				i := i + 1
			end
			remove_head(i - 1)
		ensure
			stripped: is_empty or else first /= ' '
		end

	right_adjust is
			-- Remove trailing blanks.
			--
			-- See also `remove_tail', `last'.
		do
			from
			until
				count = 0 or else item(count) /= ' '
			loop
				count := count - 1
			end
		ensure
			stripped: is_empty or else last /= ' '
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
		local
			c: INTEGER
		do
			c := end_index - start_index + 1
			create Result.make(c)
			if c > 0 then
				Result.set_count(c)
				Result.storage.slice_copy(0, storage, start_index - 1, end_index - 1)
			end
		ensure
			substring_count: Result.count = end_index - start_index + 1
		end

	extend_multiple (c: CHARACTER; n: INTEGER) is
			-- Extend Current with `n' times character `c'.
		require
			n >= 0
		local
			i: INTEGER
		do
			from
				i := n
			until
				i = 0
			loop
				add_last(c)
				i := i - 1
			end
		ensure
			count = n + old count
		end

	precede_multiple (c: CHARACTER; n: INTEGER) is
			-- Prepend `n' times character `c' to Current.
		require
			n >= 0
		local
			old_count: INTEGER
		do
			if n > 0 then
				old_count := count
				if old_count = 0 then
					extend_multiple(c, n)
				else
					extend_multiple('%U', n)
					storage.move(0, old_count - 1, n)
					storage.set_all_with(c, n - 1)
				end
			end
		ensure
			count = n + old count
		end

	extend_to_count (c: CHARACTER; needed_count: INTEGER) is
			-- Extend Current with `c' until `needed_count' is reached.
			-- Do nothing if `needed_count' is already greater or equal
			-- to `count'.
		require
			needed_count >= 0
		local
			offset: INTEGER
		do
			from
				offset := needed_count - count
			until
				offset <= 0
			loop
				add_last(c)
				offset := offset - 1
			end
		ensure
			count >= needed_count
		end

	precede_to_count (c: CHARACTER; needed_count: INTEGER) is
			-- Prepend `c' to Current until `needed_count' is reached.
			-- Do nothing if `needed_count' is already greater or equal
			-- to `count'.
		require
			needed_count >= 0
		local
			offset, old_count: INTEGER
		do
			old_count := count
			offset := needed_count - old_count
			if offset > 0 then
				extend_to_count('%U', needed_count)
				storage.move(0, old_count - 1, offset)
				storage.set_all_with(c, offset - 1)
			end
		ensure
			count >= needed_count
		end

	reverse is
			-- Reverse the string.
		local
			i1, i2: INTEGER
		do
			from
				i1 := 1
				i2 := count
			until
				i1 >= i2
			loop
				swap(i1, i2)
				i1 := i1 + 1
				i2 := i2 - 1
			end
		end

	remove_all_occurrences (ch: CHARACTER) is
			-- Remove all occurrences of `ch'.
			--
			-- See also `occurrences', `remove'.
		local
			i, j: INTEGER
		do
			from
				i := 1
				j := 1
			until
				i > count
			loop
				if item(i) /= ch then
					put(item(i), j)
					j := j + 1
				end
				i := i + 1
			end
			count := j - 1
		ensure
			count = old count - old occurrences(ch)
		end

	substring_index (other: STRING; start_index: INTEGER): INTEGER is
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

	first_substring_index (other: STRING): INTEGER is
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
	extend_unless (ch: CHARACTER) is
			-- Extend `Current' (using `extend') with `ch' unless `ch' is
			-- already the `last' character.
		do
			if count = 0 or else item(count) /= ch then
				add_last(ch)
			end
		ensure
			last = ch
			count >= old count
		end

	get_new_iterator: ITERATOR[CHARACTER] is
		do
			create {ITERATOR_ON_STRING} Result.make(Current)
		end

feature {ANY} -- Interfacing with C string:
	to_external: POINTER is
			-- Gives C access to the internal `storage' (may be dangerous).
			-- To be compatible with C, a null character is added at the end
			-- of the internal `storage'. This extra null character is not
			-- part of the Eiffel STRING.
		do
			if capacity > count then
				count := count + 1
				if item(count) /= '%U' then
					put('%U', count)
				end
			else
				add_last('%U')
			end
			count := count - 1
			Result := storage.to_pointer
		ensure
			count = old count
			Result.is_not_null
		end

	from_external (p: POINTER) is
			-- Internal `storage' is set using `p' (may be dangerous because
			-- the external C string `p' is not duplicated). Assume `p' has a
			-- null character at the end in order to compute the Eiffel
			-- `count'. This extra null character is not part of the Eiffel
			-- STRING. Also consider `from_external_copy' to choose the most
			-- appropriate.
		require
			p.is_not_null
		do
			from
				storage := storage.from_pointer(p)
				count := 0
			until
				storage.item(count) = '%U'
			loop
				count := count + 1
			end
			capacity := count + 1
		ensure
			capacity = count + 1
			p = to_external
		end

	from_external_copy (p: POINTER) is
			-- Internal `storage' is set using a copy of `p'. Assume `p' has a
			-- null character at the end in order to compute the Eiffel
			-- `count'. This extra null character is not part of the Eiffel
			-- STRING. Also consider `from_external' to choose the most
			-- appropriate.
		require
			p.is_not_null
		local
			s: like storage; i: INTEGER
		do
			from
				s := s.from_pointer(p)
				count := 0
			until
				s.item(i) = '%U'
			loop
				add_last(s.item(i))
				i := i + 1
			end
		end

	from_external_sized (p: POINTER; size: INTEGER) is
			-- Internal `storage' is set using `p' (may be dangerous because
			-- the external C string `p' is not duplicated). The 'count' of
			-- characters of the string is set to 'size'.
			-- Also consider `from_external_sized_copy' to choose the most
			-- appropriate.
		require
			p.is_not_null
			size >= 0
		do
			storage := storage.from_pointer(p)
			count := size
			capacity := size
		ensure
			count = size
			capacity = size
			p = storage.to_pointer -- caution: to_external will add a trailing null
		end

	from_external_sized_copy (p: POINTER; size: INTEGER) is
			-- Internal `storage' is set using a copy of `p'. 
			-- 'size' characters are copied, setting then 'count' to 'size'.
			-- Also consider `from_external' to choose the most
			-- appropriate.
		require
			p.is_not_null
			size >= 0
		local
			s: like storage
		do
			from
				if capacity < size then
					capacity := size
					storage := storage.calloc(size)
				end
				s := s.from_pointer(p)
				count := 0
			until
				count = size
			loop
				storage.put(s.item(count),count)
				count := count + 1
			end
		ensure
			count = size
		end

feature {ANY} -- Other features here for ELKS compatibility:
	make_from_string (model: STRING) is
			-- (Here for ELKS compatibility.)
			-- Initialize from the characters of `model'.
			-- Useful in proper descendants of STRING.
		require
			model /= Void
		local
			c: INTEGER
		do
			c := model.count
			ensure_capacity(c)
			count := c
			storage.copy_from(model.storage, c - 1)
		ensure
			count = model.count
		end

	same_string (other: STRING): BOOLEAN is
			-- (Here for ELKS compatibility.)
			-- Do `Current' and `other' have the same character sequence?
			-- Useful in proper descendants of STRING.
		require
			other_not_void: other /= Void
		do
			Result := string.is_equal(other.string)
		end

	string: STRING is
			-- (Here for ELKS compatibility.)
			-- New STRING having the same character sequence as `Current'.
			-- Useful in proper descendants of STRING.
		do
			create Result.make_from_string(Current)
		end

feature {STRING, STRING_HANDLER}
	set_count (new_count: like count) is
		require
			new_count <= capacity
		do
			count := new_count
		ensure
			count = new_count
		end

	ensure_capacity (needed_capacity: like capacity) is
		require
			needed_capacity >= 0
		local
			new_capacity: like capacity
		do
			if storage.is_null then -- implies capacity = 0 (see invariant)
				new_capacity := needed_capacity.max(32)
				storage := storage.calloc(new_capacity)
				capacity := new_capacity
			elseif capacity < needed_capacity then
				new_capacity := needed_capacity.max(capacity #* 2)
				storage := storage.realloc(capacity, new_capacity)
				capacity := new_capacity
			end
		ensure
			capacity >= needed_capacity
		end

feature {STRING_HANDLER}
	set_storage (new_storage: like storage; new_capacity: like capacity) is
		require
			count <= new_capacity
		do
			storage := new_storage
			capacity := new_capacity
		ensure
			storage = new_storage
			capacity = new_capacity
		end

feature {RECYCLING_POOL, STRING_RECYCLING_POOL}
	recycle is
		do
			clear_count
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

invariant
	0 <= count
	count <= capacity
	capacity > 0 implies storage.is_not_null

end -- class STRING
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
