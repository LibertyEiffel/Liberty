class LINKED_STRING
	-- A STRING class proving efficient concatenation.
	-- Appended strings are not internalized, only referred to. Changes to the
	-- strings added will be reflected in the LINKED_STRING.

inherit
	STRING
		redefine make, with_capacity, item, is_equal, same_as, reverse_index_of, has, occurrences, resize, clear_count, wipe_out,
			clear_count_and_capacity, copy, copy_substring, fill_with, replace_all, append, append_string, prepend, insert_string,
			replace_substring, infix "+", put, insert_character, shrink, add_last, append_character, extend, remove_first,
			remove_last, first, last, substring, precede_multiple, precede_to_count,
			set_count, index_of, set_storage, get_new_iterator, from_external_sized, from_external_copy, from_external_sized_copy
			append_substring, make_from_string, reverse, ensure_capacity, from_external, to_external, recycle
		end

creation {ANY}
	from_string, make, copy

feature {ANY} -- Creation / Modification:
	make, with_capacity (needed_capacity: INTEGER) is
			-- Initialize the string to have at least `needed_capacity' characters of storage.
		do
			strings := {LINKED_LIST[STRING] << {STRING}.with_capacity(needed_capacity) >> }
			count := 0
		end

feature {ANY} -- Testing:
	item (i: INTEGER): CHARACTER is
			-- Character at position `i'.
			--
			-- See also `lower', `upper', `valid_index', `put'.
		local
			iter: ITERATOR[STRING]; n: INTEGER
		do
			iter := strings.new_iterator
			from
				iter.start
				n := i
			until
				n < iter.item.count
			loop
				n := n - iter.item.count
				iter.next
			end
			Result := iter.item(n)
		end

	is_equal (other: like Current): BOOLEAN is
		do
			-- local iter, another_iter: ITERATOR[CHARACTER]
			-- do
			-- 	if count = other.count then
			-- 		from
			-- 			iter:=new_iterator
			-- 			other:=other.new_iterator
			-- 		until iter.is_off or else Result=False
			-- 		loop
			-- 			Result := iter.item = another_iter.item
			-- 			iter.next
			-- 			another_item.next
			-- 		end
			-- 	end
			-- end
			not_yet_implemented
		end

	same_as (other: STRING): BOOLEAN is
			-- Case insensitive `is_equal'.
		do
			not_yet_implemented
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
		do
			not_yet_implemented
		end

	reverse_index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
			-- Index of first occurrence of `c' at or before `start_index', 0 if none.
			-- The search is done in reverse direction, which means from the `start_index' down
			-- to the first character.
			--
			-- See also `index_of', `last_index_of', `first_index_of'.
		do
			not_yet_implemented
		end

	has (c: CHARACTER): BOOLEAN is
			-- True if `c' is in the STRING.
			--
			-- See also `index_of', `occurrences', `has_substring'.
		do
			not_yet_implemented
		end

	occurrences (c: CHARACTER): INTEGER is
			-- Number of times character `c' appears in the string.
			--
			-- See also `remove_all_occurrences', `has'.
		do
			not_yet_implemented
		end

feature {ANY} -- Testing and Conversion:
	

feature {ANY} -- Modification:
	resize (new_count: INTEGER) is
			-- Resize Current. When `new_count' is greater than
			-- `count', new positions are initialized with the
			-- default value of type CHARACTER ('%U').
		do
			not_yet_implemented
		end

	clear_count, wipe_out is
			-- Discard all characters so that `is_empty' is True after that call.
			--	The internal `capacity' is not changed by this call (i.e. the internal `storage' memory is
			--	neither released nor shrunk).
			--
			-- See also `clear_count_and_capacity'.
		do
			not_yet_implemented
		end

	clear_count_and_capacity is
			-- Discard all characters (`is_empty' is True after that call). The internal `capacity' may also be
			-- reduced after this call.
			--
			-- See also `clear_count'.
		do
			not_yet_implemented
		end

	copy (other: like Current) is
			-- Copy `other' onto Current.
			--
			-- See also `copy_substring'.
		do
			not_yet_implemented
		end

	copy_substring (s: like Current; start_index, end_index: INTEGER) is
			-- Copy the substring from `s' from `start_index' to `end_index'
			-- to Current.
			--
			-- See also `copy'.
		do
			not_yet_implemented
		end

	fill_with (c: CHARACTER) is
			-- Replace every character with `c'.
		do
			not_yet_implemented
		end

	replace_all (old_character, new_character: like item) is
			-- Replace all occurrences of the element `old_character' by `new_character'.
		do
			not_yet_implemented
		end

	append, append_string (s: STRING) is
			-- Append a copy of 's' to `Current'.
			--
			-- See also `add_last', `add_first', `prepend', '+'.
		do
			not_yet_implemented
		end

	append_substring (s: STRING; start_index, end_index: INTEGER) is
			-- Append the substring from `s' from `start_index' to `end_index'
			-- to Current.
		do
			not_yet_implemented
		end

	prepend (other: STRING) is
			-- Prepend `other' to `Current'.
			--
			-- See also `append'.
		do
			not_yet_implemented
		end

	insert_string (s: STRING; i: INTEGER) is
			-- Insert `s' at index `i', shifting characters from index `i'
			-- to `count' rightwards.
		do
			not_yet_implemented
		end

	replace_substring (s: STRING; start_index, end_index: INTEGER) is
			-- Replace the substring from `start_index' to `end_index',
			-- inclusive, with `s'.
		do
			not_yet_implemented
		end

	infix "+" (other: STRING): like Current is
			-- Create a new STRING which is the concatenation of
			-- `Current' and `other'.
			--
			-- See also `append'.
		do
			not_yet_implemented
		end

	put (c: CHARACTER; i: INTEGER) is
			-- Put `c' at index `i'.
			--
			-- See also `item', `lower', `upper', `swap'.
		do
			not_yet_implemented
		end

	insert_character (c: CHARACTER; i: INTEGER) is
			-- Inserts `c' at index `i', shifting characters from
			-- position 'i' to `count' rightwards.
		do
			not_yet_implemented
		end

	shrink (min_index, max_index: INTEGER) is
			-- Keep only the slice [`min_index' .. `max_index'] or nothing
			-- when the slice is empty.
		do
			not_yet_implemented
		end

	add_last, append_character, extend (c: CHARACTER) is
			-- Append `c' to string.
			--
			-- See also `add_first'.
		do
			not_yet_implemented
		end

	remove_first is
			-- Remove the `first' item.
			--
			-- See also `remove_head', `remove_last', `remove'.
		do
			not_yet_implemented
		end

	remove_last is
			-- Remove the `last' item.
			--
			-- See also `remove_tail', `remove_first', `remove'.
		do
			not_yet_implemented
		end

feature {ANY} -- Other features:
	first: CHARACTER is
			-- Access to the very `first' character.
			--
			-- See also `last', `item'.
		do
			not_yet_implemented
		end

	last: CHARACTER is
			-- Access to the very `last' character.
			--
			-- See also `first', `item'.
		do
			not_yet_implemented
		end

	substring (start_index, end_index: INTEGER): like Current is
			-- New string consisting of items [`start_index'.. `end_index'].
			--
			-- See also `substring_index' and `copy_substring' to save memory.
		do
			not_yet_implemented
		end

	precede_multiple (c: CHARACTER; n: INTEGER) is
			-- Prepend `n' times character `c' to Current.
		do
			not_yet_implemented
		end

	precede_to_count (c: CHARACTER; needed_count: INTEGER) is
			-- Prepend `c' to Current until `needed_count' is reached.
			-- Do nothing if `needed_count' is already greater or equal
			-- to `count'.
		do
			not_yet_implemented
		end

	reverse is
			-- Reverse the string.
		do
			not_yet_implemented
		end

feature {ANY} -- Other features:
	new_iterator: ITERATOR[CHARACTER] is
		do
			create {ITERATOR_ON_LINKED_STRING} Result.make(Current)
		end

feature {ANY} -- Interfacing with C string:
	to_external: POINTER is
			-- Gives C access to the internal `storage' (may be dangerous).
			-- To be compatible with C, a null character is added at the end
			-- of the internal `storage'. This extra null character is not
			-- part of the Eiffel STRING.
		do
			not_yet_implemented
		end

	from_external (p: POINTER) is
			-- Internal `storage' is set using `p' (may be dangerous because
			-- the external C string `p' is not duplicated). Assume `p' has a
			-- null character at the end in order to compute the Eiffel
			-- `count'. This extra null character is not part of the Eiffel
			-- STRING. Also consider `from_external_copy' to choose the most
			-- appropriate.
		do
			not_yet_implemented
		end

	from_external_copy (p: POINTER) is
			-- Internal `storage' is set using a copy of `p'. Assume `p' has a
			-- null character at the end in order to compute the Eiffel
			-- `count'. This extra null character is not part of the Eiffel
			-- STRING. Also consider `from_external' to choose the most
			-- appropriate.
		do
			not_yet_implemented
		end

	from_external_sized (p: POINTER; size: INTEGER) is
			-- Internal `storage' is set using `p' (may be dangerous because
			-- the external C string `p' is not duplicated). The 'count' of
			-- characters of the string is set to 'size'.
			-- Also consider `from_external_sized_copy' to choose the most
			-- appropriate.
		do
			not_yet_implemented
		end

	from_external_sized_copy (p: POINTER; size: INTEGER) is
			-- Internal `storage' is set using a copy of `p'.
			-- 'size' characters are copied, setting then 'count' to 'size'.
			-- Also consider `from_external' to choose the most
			-- appropriate.
		do
			not_yet_implemented
		end

feature {ANY} -- Other features here for ELKS compatibility:
	make_from_string (model: STRING) is
			-- (Here for ELKS compatibility.)
			-- Initialize from the characters of `model'.
			-- Useful in proper descendants of STRING.
		do
			not_yet_implemented
		end

feature {STRING, STRING_HANDLER}
	set_count (new_count: like count) is
		do
			not_yet_implemented
		end

	ensure_capacity (needed_capacity: like capacity) is
		do
			not_yet_implemented
		end

feature {STRING_HANDLER}
	set_storage (new_storage: like storage; new_capacity: like capacity) is
		do
			not_yet_implemented
		end

feature {RECYCLING_POOL, STRING_RECYCLING_POOL}
	recycle is
		do
			not_yet_implemented
		end

feature {ANY} -- Specific LINKED-STRING
	infix "|" (another: STRING): like Current is
			-- Append `another' to Current. Result is Current.
			-- Typical usage is:
			-- foo is
			-- local ls: LINKED_STRING
			-- do
			--   print ( (linked_string("Foo bar")|" maman "|my_string|another).out)
			-- end
		require
			another /= Void
		do
			strings.add_last(another)
			count := count + another.count
			Result := Current
		ensure
			definition: Result = Current
			increased_count: count = old count + another.count
		end

	infix "#" (another: STRING): like Current is
			-- Replace the occurrence of "@(x)" having the lowest x with `another'.
			-- It mimicks the usage of STRING_FORMATTER.
		do
			not_yet_implemented
		end

feature {LINKED_STRING} -- Implementation
	strings: LINKED_LIST[STRING]

invariant
	strings_list_not_void: strings /= Void

end -- class LINKED_STRING
