-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class STRING
	--
	-- Resizable character STRINGs indexed from `1' to `count'.
	--

inherit
	NATIVELY_STORED_STRING

creation {ANY}
	with_capacity, make, copy, make_empty, make_filled, from_external, from_external_copy,
	from_external_sized, from_external_sized_copy, make_from_string

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

	make_from_string (model: ABSTRACT_STRING) is
			-- Initialize from the characters of `model'.
		require
			model /= Void
		local
			c: INTEGER; nss: NATIVELY_STORED_STRING
		do
			c := model.count
			ensure_capacity(c)
			count := c
			nss ?= model
			if nss/=Void then storage.copy_from(nss.storage, c - 1)
			else append(model)
			end
		ensure
			count = model.count
		end

feature {ANY}
	hash_code: INTEGER is
		do
			Result := computed_hash_code
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

	append, append_string (s: ABSTRACT_STRING) is
			-- Append a copy of 's' to `Current'.
			--
			-- See also `add_last', `add_first', `prepend', '+'.
		require
			s_not_void: s /= Void
		local
			needed_capacity: INTEGER
			nss: NATIVELY_STORED_STRING
			i: like new_iterator
		do
			-- Note: pre-computing needed capacity may be costly for ROPEs. Consider moving it into the NATIVELY_STORED_STRING-specific part of the feature.
			needed_capacity := count + s.count
			if needed_capacity > capacity then
				ensure_capacity(needed_capacity)
			end
			nss ?= s
			if nss/=Void then storage.copy_at(count, nss.storage, nss.count)
			else 
				from i:=s.new_iterator; i.start until not i.is_off
				loop
					Current.append_character(i.item)
					i.next
				end
			end
			count := needed_capacity
		end

	append_substring (s: ABSTRACT_STRING; start_index, end_index: INTEGER) is
			-- Append the substring from `s' from `start_index' to `end_index'
			-- to Current.
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= s.count
			meaningful_interval: start_index <= end_index + 1
		local
			needed_capacity: INTEGER
			nss: NATIVELY_STORED_STRING
		do
			needed_capacity := count + end_index - start_index + 1
			if needed_capacity > capacity then
				ensure_capacity(needed_capacity)
			end
			nss ?= s
			if nss/=Void then storage.slice_copy(count, nss.storage, start_index - 1, end_index - 1)
			else not_yet_implemented 
			end
			count := needed_capacity
		end

	prepend (other: ABSTRACT_STRING) is
			-- Prepend `other' to `Current'.
			--
			-- See also `append'.
		require
			other /= Void
		local
			i, j: INTEGER; nss: NATIVELY_STORED_STRING
		do
			i := count
			j := other.count
			resize(i + j)
			if i > 0 and then j > 0 then
				storage.move(0, i - 1, j)
			end
			nss ?= other
			if nss/=Void then storage.copy_from(nss.storage, j - 1)
			else not_yet_implemented
			end
		ensure
			(old other.twin + old Current.twin).is_equal(Current)
		end

	insert_string (s: ABSTRACT_STRING; i: INTEGER) is
			-- Insert `s' at index `i', shifting characters from index `i'
			-- to `count' rightwards.
		require
			string_not_void: s /= Void
			valid_insertion_index: 1 <= i and i <= count + 1
		local
			j, k: INTEGER; nss: NATIVELY_STORED_STRING
		do
			j := count
			k := s.count
			resize(j + k)
			if i <= j then
				storage.move(i - 1, j - 1, k)
			end
			nss ?= s
			if nss /= Void then storage.copy_at(i - 1, nss.storage, k)
			else not_yet_implemented
			end
		end

	replace_substring (s: ABSTRACT_STRING; start_index, end_index: INTEGER) is
			-- Replace the substring from `start_index' to `end_index',
			-- inclusive, with `s'.
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		local
			remove_len, insert_len, difference, old_count: INTEGER
			nss: NATIVELY_STORED_STRING
			i: INTEGER; iter: ITERATOR[CHARACTER]
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
			nss ?= s
			if nss/=Void then storage.copy_at(start_index - 1, nss.storage, s.count)
			else
				from i:=start_index; iter:=s.new_iterator; iter.start
				until not iter.is_off
				loop
					put(iter.item,i)
					i:=i+1
					iter.next
				end
			end
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

	remove_suffix (s: ABSTRACT_STRING) is
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

	remove_prefix (s: ABSTRACT_STRING) is
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

feature {ANY} -- Other features:
	substring (start_index, end_index: INTEGER): like Current is
		local
			c: INTEGER
		do
			c := end_index - start_index + 1
			create Result.make(c)
			if c > 0 then
				Result.set_count(c)
				Result.storage.slice_copy(0, storage, start_index - 1, end_index - 1)
			end
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

feature {ANY} -- Testing and Conversion:
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

	intern: FIXED_STRING is
			-- A shared version of this string.
		do
			intern_key.make_from_string(Current)
			Result := interned.reference_at(intern_key)
			if Result = Void then
				Result := (create {FIXED_STRING}.make_from_string(Current))
				Result.do_intern
				intern_key.recycle
			end
		end

feature {}
	intern_key: FIXED_STRING is
		once
			create Result.make_from_string("")
			Result.recycle
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

feature {STRING_HANDLER}
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

invariant
	0 <= count
	count <= capacity
	capacity > 0 implies storage.is_not_null

end -- class STRING
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
