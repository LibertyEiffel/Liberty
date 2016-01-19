indexing
	description: "Unicode UTF-8 string."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, Glib team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class UTF8_STRING
	-- A string of Unicode characters encoded into UTF-8. 
	
	-- This particular encoding trades access efficiency for space efficiency:
	-- it uses a variable amount of memory to store each character, from 8 to
	-- 32 bits, thus making traversal and random-access costly; AFAIK random
	-- access is O(n) and trasversal while being still an O(1) operation is
	-- much more complex and costly than traversing a normal STRING.

	-- UNICODE_MANIPULATION

	-- A number of functions for dealing with Unicode characters and
	-- strings. There are analogues of the traditional C functions
	-- found in ctype.h character classification and case conversion
	-- functions, UTF-8 analogues of some string utility functions,
	-- functions to perform normalization, case conversion and
	-- collation on UTF-8 strings and finally functions to convert
	-- between the UTF-8, UTF-16 and UCS-4 encodings of Unicode.
	
	-- The implementations of the Unicode functions in GLib are based
	-- on the Unicode Character Data tables, which are available from
	-- www.unicode.org. GLib 2.8 supports Unicode 4.0, GLib 2.10
	-- supports Unicode 4.1, GLib 2.12 supports Unicode 5.0.

inherit
	HASHABLE
		redefine copy
		end
	COMPARABLE
		redefine is_equal, copy, compare, three_way_comparison
		end
	TRAVERSABLE[UNICODE_CHARACTER]
		redefine is_equal, copy
		end
	RECYCLABLE
		redefine is_equal, copy
		end
	WRAPPER

insert 
	GUNICODE_EXTERNALS
	GUNICODE_MACROS
	GMEM_EXTERNALS

create {ANY}
	make, copy, make_empty, make_filled, from_utf8

feature {ANY}
	capacity: NATURAL_32
	-- String capacity in bytes
	
	count: NATURAL_32
	-- String length in characters

	lower: NATURAL_32 is do Result:=0.to_natural_32 end
	-- Minimum index; currently it is 0 to mimic C strings; note that
	-- correct coding style shall not rely on the actual value of this
	-- feature.

	upper: NATURAL_32 is
		-- Maximum index
	do
		Result:=count-1.to_natural_32
	end

feature {} -- 
	bytes_count: NATURAL_32 
	-- size in bytes. When you use non-ASCII characters it will be different than count

feature {ANY} -- Creation / Modification:
	make (needed_capacity: NATURAL_32) is
			-- Initialize the string to have at least `needed_capacity' bytes
			-- of storage.
		do
			if needed_capacity > 0.to_natural_32 then
				if capacity < needed_capacity then
					wrapper := g_try_malloc(needed_capacity)
					if wrapper.is_null then raise(No_more_memory)
					else capacity := needed_capacity
					end
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

	make_filled (a_character: UNICODE_CHARACTER; n: NATURAL_32) is
			-- Initialize string with `n' copies of `a_character'.
		require
			a_character.is_valid
		do
			make(n)
			count := n
			fill_with(a_character)
		ensure
			count_set: count = n
			filled: occurrences(a_character) = count
		end

	from_string (a_string: STRING) is
		-- Create an UTF8 string from `a_string'.
	require a_string/=Void
	local validated: BOOLEAN; an_end: POINTER
	do
		validated := g_utf8_validate (a_string.to_external, a_string.count, $an_end).to_boolean
		if validated then 
			handle := g_memdup(a_string.to_external, a_string.count)
			bytes_count := a_string.count
			capacity := bytes_count
			count := g_utf8_strlen(handle, bytes_count)
		else
			raise(Non_valid_utf8_string)
		end
	end

	Non_valid_utf8_string: STRING is "Given string is not UTF8 valid."

feature {WRAPPER_HANDLER}
	from_pointer (a_pointer: POINTER) is
		-- Create an UTF8 using the content found into `a_pointer' which is a zero-terminated string and it is not copied
	local validated: BOOLEAN; an_end: POINTER
	do
		validated := g_utf8_validate (a_pointer, -1, $an_end).to_boolean
		if validated then 
			handle := a_pointer
			bytes_count := an_end - a_pointer
			capacity := bytes_count
			count := g_utf8_strlen(handle, bytes_count)
		else
			raise(Non_valid_utf8_string)
		end
	end

feature {ANY} -- Testing:
	is_empty: BOOLEAN is
			-- Has string length 0?
			--
			-- See also `count'.
		do
			Result := count = 0
		end

	item (i: like lower): UNICODE_CHARACTER is
			-- Get unicode at position `i'.
			--
			-- See also `lower', `upper', `valid_index', `put'.
		require valid_index(i)
		local location: POINTER
		do
			Result.set(g_utf8_get_char(handle+g_utf8_offset_to_pointer(handle,i)))
		end

	infix "@" (i: like lower):  is
			-- The infix notation which is actually just a synonym for `item'.
			--
			-- See also `item', `put'.
		require valid_index(i)
		do
			Result := item(i)
		ensure definition: Result = item(i)
		end

	hash_code: INTEGER is
		local i: ITERATOR_ON_UTF8_STRING
		do
			from i:=get_new_iterator; i.start
			until i.is_off
			loop
				Result := {INTEGER 5} #* Result #+ i.item.code.hash_code
				i.next
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
			i,j: ITERATOR_ON_UTF8_STRING
		do
			from
				i:=get_new_iterator; i.start
				j:=other.get_new_iterator; j.start
				maxi := count.min(other.count)
			until (i.is_off or j.is_off) or else i.item/=j.item
			loop i.next; j.next
			end
			if i.is_off or j.is_off then
				Result := count < other.count
			else Result := i.item < j.item
			end
		end

	compare, three_way_comparison (other: like Current): INTEGER is
		-- Compares Current with `other' using the linguistically correct rules
		-- for the current locale. Result is < 0 if Current compares before
		-- `other', 0 if they compare equal, > 0 if Current compares after
		-- `other'. When sorting a large number of strings, it will be
		-- significantly faster to obtain collation keys with `collate_key'
		-- and compare the keys when sorting instead of sorting the original
		-- strings. Note: in C langauge comparison of collated key is done with
		-- function strcmp; AFAIK it should be the same comparing Eiffel
		-- STRINGs Paolo 2009-06-22
		do
			Result :=g_utf8_collate(handle,other.handle)
		
		end

	is_equal (other: like Current): BOOLEAN is
			-- Do both strings have the same character sequence?
			--
			-- See also `same_as'.
		local i,j: ITERATOR_ON_UTF8_STRING
		do
			if Current = other then Result := True
			else
				if count = other.count then 
					-- TODO: Could be improved. If stored in canonical form
					-- direct memory comparison could be made. Paolo 2009-06-20
					from 
						Result := True
						i := Current.get_new_iterator; i.start
						j :=   other.get_new_iterator; j.start
					until i.is_off or else Result=False
					loop
						check not i.is_off implied not j.is_off end
						Result := i.item = j.item
						i.next; j.next
					end
				else Result:=False
				end
			end
		end

	same_as (other: UNICODE_STRING): BOOLEAN is
			-- Case insensitive `is_equal'.
		require
			other /= Void
		local i,j: ITERATOR_ON_UTF8_STRING
		do
			if count=other.count then
				from 
					i := Current.get_new_iterator; i.start
					j :=   other.get_new_iterator; j.start
					Result := True
				until i.is_off or else Result = False
				loop
					Result := i.item.to_lower = j.item.to_lower
					i.next; j.next
				end
			else Result:=False
			end
		end

	index_of (a_character: like item; a_start_index: like lower): REFERENCE[like lower] is
			-- Index of first occurrence of `a_character' at or after `a_start_index'
			-- Void if not found.
			--
			-- See also `reverse_index_of', `first_index_of', `last_index_of', `has'.
		require
			valid_start_index: start_index >= 1 and start_index <= count + 1
			a_character.is_valid
		local location: POINTER; integer_result: INTEGER_32
		do
			not_yet_implemented
			-- Not correct
			location := g_utf8_strchr(handle, -1, a_character.code)
			if location.is_not_null then
				integer_result := g_utf8_pointer_to_offset(handle,location)
				check integer_result > 0 end
				create Result.set_item(integer_result.to_natural_32)				
			end
		ensure
			Result /= Void implies item(Result.item) = a_character
		end

	reverse_index_of (a_character: like item; a_start_index: like lower): REFERENCE[like lower] is
			-- Index of first occurrence of `a_character' at or before
			-- `a_start_index'; Void if none.

			-- The search is done in reverse direction, which means from the `start_index' down
			-- to the first character.
			--
			-- See also `index_of', `last_index_of', `first_index_of'.
		require
			valid_start_index: start_index >= 0 and start_index <= count
			a_character.is_valid	
		local location: POINTER; integer_result: INTEGER_32
		do
			not_yet_implemented
			-- Not correct
			location := g_utf8_strrchr(handle, -1, a_character.code)
			if location.is_not_null then
				integer_result := g_utf8_pointer_to_offset(handle,location)
				check integer_result > 0 end
				create Result.set_item(integer_result.to_natural_32)				
			end
		ensure
			Result /= Void implies item(Result.item) = a_character
		end

	first_index_of (a_character: like item): REFERENCE[like lower] is
			-- Index of first occurrence of `a_character'.
			--
			-- See also `last_index_of', `index_of', `reverse_index_of'.
		require
			a_character.is_valid
		local location: POINTER; integer_result: INTEGER_32
		do
			location := g_utf8_strchr(handle, -1, a_character.code)
			if location.is_not_null then
				integer_result := g_utf8_pointer_to_offset(handle,location)
				check integer_result > 0 end
				create Result.set_item(integer_result.to_natural_32)				
			end
		ensure
			definition: Resulti/=Void implies Result.is_equal(index_of(a_character,lower))
		end

	last_index_of (unicode: like item): REFERENCE[like lower] is
			-- Index of last occurrence of `unicode', 0 if none.
			--
			-- See also `first_index_of', `reverse_index_of', `index_of'.
		do
			not_yet_implemented
		ensure
			definition: Result = reverse_index_of(unicode, upper)
		end

	has (a_character: like first): BOOLEAN is
			-- True if `unicode' is in the STRING.
			--
			-- See also `index_of', `occurrences', `has_substring'.
		require
			valid_unicode_value: valid_unicode(unicode)
		do
			Result := index_of(unicode, 1) /= 0
		end

	has_substring (other: UNICODE_STRING): BOOLEAN is
			-- True if `Current' contains `other'.
			--
			-- See also `substring_index', `has'.
		require
			other_not_void: other /= Void
		do
			Result := substring_index(other, 1) /= 0
		end

	occurrences (unicode: INTEGER): INTEGER is
			-- Number of times character `unicode' appears in the string.
			--
			-- See also `remove_all_occurrences', `has'.
		require
			valid_unicode_value: valid_unicode(unicode)
		local
			i: INTEGER
		do
			from
				i := index_of(unicode, 1)
			until
				i = 0
			loop
				Result := Result + 1
				i := index_of(unicode, i)
			end
		ensure
			Result >= 0
		end

	has_suffix (s: UNICODE_STRING): BOOLEAN is
			-- True if suffix of `Current' is `s'.
			--
			-- See also `remove_suffix', `has_prefix', `has_substring'.
		require
			s /= Void
		local
			i, offset: INTEGER
		do
			offset := count - s.count
			from
				Result := offset >= 0
				i := lower
			until
				not Result or else i > s.upper
			loop
				Result := item(i + offset) = s.item(i)
				i := i + 1
			end
		end

	has_prefix (p: UNICODE_STRING): BOOLEAN is
			-- True if prefix of `Current' is `p'.
		require
			p /= Void
		local
			i: INTEGER
		do
			from
				Result := count >= p.count
				i := lower
			until
				not Result or else i > p.upper
			loop
				Result := item(i) = p.item(i)
				i := i + 1
			end
		end

feature {ANY} -- Testing and Conversion:
	is_ascii: BOOLEAN is
			-- True if all unicode value is in range 0..127
		local
			i: INTEGER
		do
			from
				i := count - 1
			until
				i < 0 or else storage.item(i) & 0xFF80 /= 0
			loop
				i := i - 1
			end
			Result := i < 0
		end

	to_utf8: STRING is
			-- New string is created, current unicode string is encoded
			-- with UTF-8 format.
			--
			-- See also: `utf8_encode_in' and `as_utf8' to save memory.
		do
			tmp_buffer.clear_count
			utf8_encode_in(tmp_buffer)
			Result := tmp_buffer.twin
		end

	to_string: STRING is
		obsolete "Now use `to_utf8' instead (May 2008)."
		do
			Result := to_utf8
		end

	as_utf8: STRING is
			-- Encode the string in UTF-8. Always returns the same once object.
			--
			-- See also: `to_utf8', `utf8_encode_in'.
		do
			Result := once ""
			Result.clear_count
			utf8_encode_in(Result)
		end

	as_string: STRING is
		obsolete "Now use `as_utf8' instead (May 2008)."
		do
			Result := as_utf8
		end

	utf8_encode_in (s: STRING) is
			-- Append the string in UTF-8 to `s'.
			--
			-- See also: `to_utf8', `as_utf8'.
		require
			s /= Void
		local
			i: INTEGER; v: INTEGER
		do
			from
				i := 1
			until
				i > count
			loop
				v := item(i)
				if v < 128 then
					s.extend(v.to_character)
				elseif v < 2048 then
					s.extend((v #// 64 + 192).to_character)
					s.extend((v #\\ 64 + 128).to_character)
				elseif v < 65536 then
					s.extend((v #// 4096 + 224).to_character)
					v := v #\\ 4096
					s.extend((v #// 64 + 128).to_character)
					s.extend((v #\\ 64 + 128).to_character)
				else
					check
						v < 0x00110000
					end
					s.extend((v #// 0x00040000 + 240).to_character)
					v := v #\\ 0x00040000
					s.extend((v #// 0x00001000 + 128).to_character)
					v := v #\\ 0x00001000
					s.extend((v #// 64 + 128).to_character)
					s.extend((v #\\ 64 + 128).to_character)
				end
				i := i + 1
			end
		end

	utf16be_encode_in (s: STRING) is
			-- Append the string in UTF-16BE to `s'
		require
			s /= Void
		local
			i, k: INTEGER; v: INTEGER_16
		do
			from
			until
				i >= count
			loop
				v := storage.item(i)
				s.extend((v |>>> 8).to_character)
				s.extend((v & 0x00FF).to_character)
				if v & 0xF800 = 0xD800 then
					check
						low_surrogate_indexes.item(k) = i + 1
					end
					s.extend((low_surrogate_values.item(k) #// 256 + 220).to_character)
					s.extend((low_surrogate_values.item(k) & 0x00FF).to_character)
					k := k + 1
				end
				i := i + 1
			end
		end

	utf8_decode_from (s: STRING): BOOLEAN is
			-- Use `s' as UTF-8 format encoded unicode string
			-- Return `False' if decoding process failed
		require
			s /= Void
		local
			i, k, seq_length: INTEGER; v: INTEGER
		do
			from
				Result := True
				i := 1
			until
				i > s.count
			loop
				v := s.item(i).code
				i := i + 1
				inspect
					v
				when 0 .. 127 then
					extend(v)
					k := 0
				when 192 .. 223 then
					v := v - 192
					k := 2
				when 224 .. 239 then
					v := v - 224
					k := 3
				when 240 .. 247 then
					v := v - 240
					k := 4
				else
					extend(65533)
					Result := False
					k := 0
				end
				from
					seq_length := k
				until
					k <= 1
				loop
					if i <= s.count and then s.item(i).code.in_range(128, 191) then
						v := v * 64 + s.item(i).code - 128
						i := i + 1
						k := k - 1
					else
						extend(65533)
						Result := False
						k := 0
					end
				end
				if k = 1 then
					if v < 128 or else v < 2048 and then seq_length > 2 or else v < 65536 and then seq_length > 3 then
						-- overlong sequence, must be refused by any UTF-8
						-- complient decode for security reasons.
						extend(65533)
						Result := False
					elseif not valid_unicode(v) then
						extend(65533)
						Result := False
					else
						extend(v)
					end
				end
			end
		end

feature {}
	from_utf8 (s: STRING) is
			-- Use `s' as UTF-8 format encoded unicode string
			-- This function may be used for manifest strings
			-- See `utf8_decode_from' for error detection
		require
			s /= Void
		local
			error: BOOLEAN
		do
			make(s.count)
			error := utf8_decode_from(s)
		end

feature {ANY} -- Modification:
	resize (new_count: INTEGER) is
			-- Resize Current. When `new_count' is greater than
			-- `count', new positions are initialized with unicode 0.
		require
			new_count >= 0
		local
			i: INTEGER
		do
			if new_count <= count then
			elseif capacity < new_count then
				if capacity = 0 then
					storage := storage.calloc(new_count)
				else
					storage := storage.realloc(capacity, new_count)
				end
				capacity := new_count
			else
				storage.clear(count, new_count - 1)
			end
			count := new_count
			from
				i := low_surrogate_indexes.upper
			until
				i < 0 or else low_surrogate_indexes.item(i) <= new_count
			loop
				--TODO: only one remove out of the loop
				low_surrogate_indexes.remove_last
				low_surrogate_values.remove_last
				i := i - 1
			end
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
			low_surrogate_indexes.make(0)
			low_surrogate_values.make(0)
		ensure
			is_empty: count = 0
			capacity = old capacity
		end

	clear_count_and_capacity is
			-- Discard all characters (`is_empty' is True after that call). The internal `capacity' may also be
			-- reduced after this call.
			--
			-- See also `clear_count'.
		do
			low_surrogate_indexes.clear_count_and_capacity
			low_surrogate_values.clear_count_and_capacity
			clear_count
			--*** capacity := 0
			--*** storage := null_storage
		ensure
			is_empty: count = 0
			capacity = 0
		end

	copy (other: like Current) is
			-- Copy `other' onto Current.
			--
			-- See also `copy_substring'.
		do
			count := other.count
			if count > 0 then
				if capacity < count then
					storage := storage.calloc(count)
					capacity := count
				end
				storage.copy_from(other.storage, count - 1)
			end
			if low_surrogate_indexes = Void then
				create low_surrogate_indexes.make(0)
				create low_surrogate_values.make(0)
			end
			low_surrogate_indexes.copy(other.low_surrogate_indexes)
			low_surrogate_values.copy(other.low_surrogate_values)
		ensure then
			count = other.count
		end

	copy_substring (s: like Current; start_index, end_index: INTEGER) is
			-- Copy the substring from `s' from `start_index' to `end_index'
			-- to Current.
			--
			-- See also `copy'.
			--|*** DUMB IMPLEMENTATION
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= s.count
			meaningful_interval: start_index <= end_index + 1
		do
			clear_count
			append_substring(s, start_index, end_index)
		end

	fill_with (unicode: INTEGER) is
			-- Replace every unicode with the new value.
		require
			valid_unicode_value: valid_unicode(unicode)
		local
			i: INTEGER; code: INTEGER_16; remainder: INTEGER_16
		do
			if unicode >= 65536 then
				-- stored as high and low surrogate
				code := (unicode #// 1024 - 64).low_16
				remainder := (unicode & 0x000003FF).to_integer_16 --unicode #\\ 1024
				storage.set_all_with(code, count - 1)
				low_surrogate_values.resize(count)
				low_surrogate_values.set_all_with(remainder)
				from
					i := count - 1
					low_surrogate_indexes.resize(count)
				until
					i < 0
				loop
					low_surrogate_indexes.put(i + 1, i)
					i := i - 1
				end
			else
				code := unicode.low_16
				storage.set_all_with(code, count - 1)
				low_surrogate_values.resize(0)
				low_surrogate_indexes.resize(0)
			end
		ensure
			occurrences(unicode) = count
		end

	replace_all (old_code, new_code: like item) is
			-- Replace all occurrences of the element `old_code' by `new_code'.
		require
			valid_unicode_value: valid_unicode(old_code)
			valid_unicode_value: valid_unicode(new_code)
		local
			i: INTEGER
		do
			--*** May be implemented in a more efficient way...
			if old_code /= new_code then
				from
					i := index_of(old_code, 1)
				until
					i = 0
				loop
					put(new_code, i)
					i := index_of(old_code, i + 1)
				end
			end
		ensure
			count = old count
			old_code /= new_code implies occurrences(old_code) = 0
		end

	append, append_string (s: UNICODE_STRING) is
			-- Append a copy of 's' to `Current'.
			--
			-- See also `add_last', `add_first', `prepend', '+'.
		require
			s_not_void: s /= Void
		local
			s_count, needed_capacity, new_capacity, i: INTEGER; indexes: FAST_ARRAY[INTEGER]
		do
			s_count := s.count
			needed_capacity := count + s_count
			if needed_capacity > capacity then
				if capacity = 0 then
					storage := storage.calloc(needed_capacity)
					capacity := needed_capacity
				else
					new_capacity := (2 * capacity).max(needed_capacity)
					storage := storage.realloc(capacity, new_capacity)
					capacity := new_capacity
				end
			end
			storage.copy_at(count, s.storage, s_count)
			from
				indexes := s.low_surrogate_indexes
			until
				i > indexes.upper
			loop
				low_surrogate_indexes.add_last(indexes.item(i) + count)
				low_surrogate_values.add_last(s.low_surrogate_values.item(i))
				i := i + 1
			end
			count := needed_capacity
		end

	append_substring (s: like Current; start_index, end_index: INTEGER) is
			-- Append the substring from `s' from `start_index' to `end_index'
			-- to Current.
			--|*** DUMB IMPLEMENTATION
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= s.count
			meaningful_interval: start_index <= end_index + 1
		local
			i: INTEGER
		do
			from
				i := start_index
			until
				i > end_index
			loop
				extend(s.item(i))
				i := i + 1
			end
		end

	prepend (other: UNICODE_STRING) is
			-- Prepend `other' to `Current'.
			--
			-- See also `append'.
		require
			other /= Void
		local
			i, j, k: INTEGER
		do
			i := count
			j := other.count
			resize(i + j)
			if i > 0 and then j > 0 then
				storage.move(0, i - 1, j)
				from
					k := low_surrogate_indexes.upper
				until
					k < 0
				loop
					low_surrogate_indexes.put(low_surrogate_indexes.item(k) + j, k)
					k := k - 1
				end
			end
			-- May be implemented in a more efficient way...
			from
				k := other.low_surrogate_indexes.upper
			until
				k < 0
			loop
				low_surrogate_indexes.add_first(other.low_surrogate_indexes.item(k))
				low_surrogate_values.add_first(other.low_surrogate_values.item(k))
				k := k - 1
			end
			storage.copy_from(other.storage, j - 1)
		ensure
			(old other.twin + old Current.twin).is_equal(Current)
		end

	insert_string (s: UNICODE_STRING; i: INTEGER) is
			-- Insert `s' at index `i', shifting characters from index `i'
			-- to `count' rightwards.
		require
			string_not_void: s /= Void
			valid_insertion_index: 1 <= i and i <= count + 1
		local
			j, k: INTEGER; pos, n: INTEGER
		do
			j := count
			k := s.count
			resize(j + k)
			if i <= j then
				storage.move(i - 1, j - 1, k)
			end
			storage.copy_at(i - 1, s.storage, k)
			pos := low_surrogate_position(i)
			j := low_surrogate_indexes.count + s.low_surrogate_indexes.count
			low_surrogate_indexes.resize(j)
			low_surrogate_values.resize(j)
			from
				-- move existing surrogates and adjust indexes
				n := s.low_surrogate_indexes.upper
			until
				n < 0
			loop
				j := j - 1
				low_surrogate_indexes.put(low_surrogate_indexes.item(pos + n) + k, j)
				low_surrogate_values.put(low_surrogate_values.item(pos + n), j)
				n := n - 1
			end
			from
				-- copy surrogates from s and adjust indexes
				n := s.low_surrogate_indexes.upper
				j := pos + n
			until
				n < 0
			loop
				low_surrogate_indexes.put(s.low_surrogate_indexes.item(n) + i, j)
				low_surrogate_values.put(s.low_surrogate_values.item(n), j)
				j := j - 1
				n := n - 1
			end
		end

	replace_substring (s: UNICODE_STRING; start_index, end_index: INTEGER) is
			-- Replace the substring from `start_index' to `end_index',
			-- inclusive, with `s'.
		require
			string_not_void: s /= Void
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		do
			-- May be implemented in a more efficient way...
			remove_between(start_index, end_index)
			insert_string(s, start_index)
		end

	infix "+" (other: UNICODE_STRING): like Current is
			-- Create a new UNICODE_STRING which is the concatenation of
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

	put (unicode: INTEGER; i: INTEGER) is
			-- Put `unicode' at position `i'.
			--
			-- See also `item', `lower', `upper', `swap'.
		require
			valid_index: valid_index(i)
			valid_unicode_value: valid_unicode(unicode)
		local
			v, n: INTEGER
		do
			if unicode >= 65536 then
				-- stored as high and low surrogate
				v := unicode #// 1024 - 64
				if storage.item(i - 1) & 0xF800 = 0xD800 then
					low_surrogate_values.put((unicode & 0x000003FF).to_integer_16, low_surrogate_index(i))
				else
					n := low_surrogate_position(i)
					low_surrogate_indexes.add_last(0)
					low_surrogate_values.add_last(0)
					if n /= low_surrogate_indexes.upper then
						low_surrogate_indexes.move(n, low_surrogate_indexes.upper - 1, 1)
						low_surrogate_values.move(n, low_surrogate_values.upper - 1, 1)
					end
					low_surrogate_indexes.put(i, n)
					low_surrogate_values.put((unicode & 0x000003FF).to_integer_16, n)
				end
				storage.put(v.low_16, i - 1)
			else
				if storage.item(i - 1) & 0xF800 = 0xD800 then
					v := low_surrogate_index(i)
					low_surrogate_indexes.remove(v)
					low_surrogate_values.remove(v)
				end
				storage.put(unicode.low_16, i - 1)
			end
		ensure
			item(i) = unicode
		end

	swap (i1, i2: INTEGER) is
			-- Swap two characters.
			--
			-- See also `item', `put'.
		require
			valid_index(i1)
			valid_index(i2)
		local
			tmp: INTEGER_16; j1, j2: INTEGER; low_tmp: INTEGER_16; k1, k2: INTEGER
		do
			j1 := i1 - 1
			j2 := i2 - 1
			tmp := storage.item(j1)
			if tmp & 0xF800 = 0xD800 then
				if storage.item(j2) & 0xF800 = 0xD800 then
					k1 := low_surrogate_index(i1)
					k2 := low_surrogate_index(i2)
					low_tmp := low_surrogate_values.item(k1)
					low_surrogate_values.put(low_surrogate_values.item(k2), k1)
					low_surrogate_values.put(low_tmp, k2)
					low_surrogate_indexes.put(i2, k1)
					low_surrogate_indexes.put(i1, k2)
				else
					low_tmp := low_surrogate_values.item(k1)
					k1 := low_surrogate_index(i1)
					k2 := low_surrogate_position(i2)
					if k2 > k1 + 1 then
						low_surrogate_indexes.move(k1 + 1, k2 - 1, -1)
						low_surrogate_values.move(k1 + 1, k2 - 1, -1)
						k2 := k2 - 1
					elseif k1 > k2 then
						low_surrogate_indexes.move(k2, k1 - 1, 1)
						low_surrogate_values.move(k2, k1 - 1, 1)
						--else no move
					end
					low_surrogate_indexes.put(i1, k2)
					low_surrogate_values.put(low_tmp, k2)
				end
			else
				if storage.item(j2) & 0xF800 = 0xD800 then
					low_tmp := low_surrogate_values.item(k2)
					k1 := low_surrogate_position(i1)
					k2 := low_surrogate_index(i2)
					if k1 > k2 + 1 then
						low_surrogate_indexes.move(k2 + 1, k1 - 1, -1)
						low_surrogate_values.move(k2 + 1, k1 - 1, -1)
						k1 := k1 - 1
					elseif k2 > k1 then
						low_surrogate_indexes.move(k1, k2 - 1, 1)
						low_surrogate_values.move(k1, k2 - 1, 1)
						--else no move
					end
					low_surrogate_indexes.put(i2, k1)
					low_surrogate_values.put(low_tmp, k1)
					-- else i1 and i2 are not surrogate
				end
			end
			storage.put(storage.item(j2), j1)
			storage.put(tmp, j2)
		ensure
			item(i1) = old item(i2)
			item(i2) = old item(i1)
		end

	insert_character (unicode: INTEGER; i: INTEGER) is
			-- Inserts `unicode' at index `i', shifting characters from
			-- position 'i' to `count' rightwards.
		require
			valid_insertion_index: 1 <= i and i <= count + 1
			valid_unicode_value: valid_unicode(unicode)
		local
			j, k: INTEGER
		do
			k := low_surrogate_position(i)
			from
				j := low_surrogate_indexes.upper
			until
				j < k
			loop
				low_surrogate_indexes.put(low_surrogate_indexes.item(j) + 1, j)
				j := j - 1
			end
			resize(count + 1)
			if count > 1 then
				storage.move(i - 1, count - 2, 1)
				storage.put(0, i - 1)
			end
			put(unicode, i)
		ensure
			item(i) = unicode
		end

	shrink (min_index, max_index: INTEGER) is
			-- Keep only the slice [`min_index' .. `max_index'] or nothing
			-- when the slice is empty.
		require
			1 <= min_index
			max_index <= count
			min_index <= max_index + 1
		local
			i, j: INTEGER
		do
			if max_index < min_index then
				count := 0
				low_surrogate_indexes.make(0)
				low_surrogate_values.make(0)
			elseif min_index = 1 then
				count := max_index
				i := low_surrogate_position(count)
				if i <= low_surrogate_indexes.upper then
					if low_surrogate_indexes.item(i) = max_index then
						i := i + 1
					end
				end
				low_surrogate_indexes.resize(i)
				low_surrogate_values.resize(i)
			else
				storage.slice_copy(0, storage, min_index - 1, max_index - 1)
				from
					i := low_surrogate_position(min_index)
				until
					i > low_surrogate_indexes.upper or else low_surrogate_indexes.item(i) > max_index
				loop
					low_surrogate_indexes.put(low_surrogate_indexes.item(i) - min_index + 1, j)
					low_surrogate_values.put(low_surrogate_values.item(i), j)
					j := j + 1
					i := i + 1
				end
				low_surrogate_indexes.resize(j)
				low_surrogate_values.resize(j)
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

	add_first, precede (unicode: INTEGER) is
			-- Add `unicode' at first position.
			--
			-- See also `add_last'.
		require
			valid_unicode_value: valid_unicode(unicode)
		local
			i: INTEGER
		do
			from
				i := low_surrogate_indexes.upper
			until
				i < 0
			loop
				low_surrogate_indexes.put(low_surrogate_indexes.item(i) + 1, i)
				i := i - 1
			end
			resize(count + 1)
			if count > 1 then
				storage.move(0, count - 2, 1)
				storage.put(0, 0)
			end
			put(unicode, 1)
		ensure
			count = 1 + old count
			item(1) = unicode
		end

	add_last, append_character, extend (unicode: INTEGER) is
			-- Append `unicode' to string.
			--
			-- See also `add_first'.
		require
			valid_unicode_value: valid_unicode(unicode)
		local
			new_capacity: INTEGER
		do
			if capacity > count then
			elseif capacity = 0 then
				new_capacity := 32
				storage := storage.calloc(new_capacity)
				capacity := new_capacity
			else
				new_capacity := 2 * capacity
				storage := storage.realloc(capacity, new_capacity)
				capacity := new_capacity
			end
			if unicode >= 65536 then
				-- stored as high and low surrogate
				low_surrogate_indexes.add_last(count)
				low_surrogate_values.add_last((unicode & 0x000003FF).to_integer_16)
				storage.put((unicode #// 1024 - 64).low_16, count)
			else
				storage.put(unicode.low_16, count)
			end
			count := count + 1
		ensure
			count = 1 + old count
			item(count) = unicode
		end

	to_lower is
			-- Convert all characters to lower case.
			--
			-- See also `to_upper', `as_lower', `as_upper'.
		do
			not_yet_implemented
		end

	to_upper is
			-- Convert all characters to upper case.
			--
			-- See also `to_lower', `as_upper', `as_lower'.
		do
			not_yet_implemented
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
			--*** May be improved?
			remove_between(1, 1)
		ensure
			count = old count - 1
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
				low_surrogate_indexes.make(0)
				low_surrogate_values.make(0)
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
			--*** May be improved
			remove_tail(1)
		ensure
			count = old count - 1
		end

	remove_tail (n: INTEGER) is
			-- Remove `n' last characters. If `n' >= `count', remove all.
			--
			-- See also `remove_head', `remove', `remove_the_last'.
		require
			n_non_negative: n >= 0
		local
			i: INTEGER
		do
			if n > count then
				count := 0
				low_surrogate_indexes.make(0)
				low_surrogate_values.make(0)
			else
				count := count - n
				i := low_surrogate_position(count + 1)
				low_surrogate_indexes.resize(i)
				low_surrogate_values.resize(i)
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
			i, k, len: INTEGER
		do
			len := end_index - start_index + 1
			if len > 0 then
				from
					i := low_surrogate_position(start_index)
					k := low_surrogate_position(end_index + 1)
				until
					k > low_surrogate_indexes.upper
				loop
					low_surrogate_indexes.put(low_surrogate_indexes.item(k) - len, i)
					low_surrogate_values.put(low_surrogate_values.item(k), i)
					k := k + 1
					i := i + 1
				end
				low_surrogate_indexes.resize(i)
				low_surrogate_values.resize(i)
				storage.slice_copy(start_index - 1, storage, end_index, count - 1)
				count := count - len
			end
		ensure
			count = old count - (end_index - start_index + 1)
		end

	remove_suffix (s: UNICODE_STRING) is
			-- Remove the suffix `s' of current string.
			--
			-- See also `remove_prefix', `remove_tail', `remove'.
		require
			has_suffix(s)
		do
			not_yet_implemented
			-- remove_last(s.count); equal sequence may have different size
		ensure
			(old Current.twin).is_equal(Current + old s.twin)
		end

	remove_prefix (s: UNICODE_STRING) is
			-- Remove the prefix `s' of current string.
			--
			-- See also `remove_suffix', `remove_head', `remove'.
		require
			has_prefix(s)
		do
			not_yet_implemented
			-- remove_head(s.count); equal sequence may have different size
		ensure
			(old Current.twin).is_equal(old s.twin + Current)
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
				i > count or else not is_space(item(i -- not_yet_implemented -- handle combining characters
				))
			loop
				i := i + 1
			end
			remove_head(i - 1)
		ensure
		-- not_yet_implemented -- handle combining characters
			stripped: is_empty or else not is_space(first)
		end

	right_adjust is
			-- Remove trailing blanks.
			--
			-- See also `remove_tail', `last'.
		local
			i: INTEGER
		do
			from
			until
				count = 0 or else not is_space(item(count -- not_yet_implemented -- handle combining characters
				))
			loop
				count := count - 1
			end
			i := low_surrogate_position(count + 1)
			low_surrogate_indexes.resize(i)
			low_surrogate_values.resize(i)
		ensure
		-- not_yet_implemented -- handle combining characters
			stripped: is_empty or else not is_space(last)
		end

feature {ANY} -- Printing:
	out_in_tagged_out_memory is
		do
			utf8_encode_in(tagged_out_memory)
		end

	fill_tagged_out_memory is
		do
			tagged_out_memory.append(once "count: ")
			count.append_in(tagged_out_memory)
			tagged_out_memory.append(once "capacity: ")
			capacity.append_in(tagged_out_memory)
			tagged_out_memory.append(once "storage: %"")
			utf8_encode_in(tagged_out_memory)
			tagged_out_memory.append_character('%"')
		end

feature {ANY} -- Other features:
	first: UNICODE_CHARACTER is
			-- The first character.
			--
			-- See also `last', `item'.
		do
			Result.set(g_utf8_get_char(handle))
		end

	last: INTEGER is
			-- The last character.
			--
			-- See also `first', `item'.
		do
		end

	substring (a_start_index, an_end_index: like lower): like Current is
			-- New string consisting of items [`start_index'.. `end_index'].
			--
			-- See also `substring_index' and `copy_substring' to save memory.
		require
			valid_start_index: 1 <= start_index
			valid_end_index: end_index <= count
			meaningful_interval: start_index <= end_index + 1
		local
			location, end_point: POINTER
		do
			create Result.with_capacity(end_index - start_index + 1)
			from location:=g_utf8_offset_to_pointer(handle,a_start_index.to_integer_32)
			until
			loop
			end
		ensure
			substring_count: Result.count = end_index - start_index + 1
		end

	extend_multiple (unicode: INTEGER; n: INTEGER) is
			-- Extend Current with `n' times character `unicode'.
		require
			n >= 0
			valid_unicode_value: valid_unicode(unicode)
		local
			i: INTEGER
		do
			from
				i := n
			until
				i = 0
			loop
				append_character(unicode)
				i := i - 1
			end
		ensure
			count = n + old count
		end

	precede_multiple (unicode: INTEGER; n: INTEGER) is
			-- Prepend `n' times character `unicode' to Current.
		require
			n >= 0
			valid_unicode_value: valid_unicode(unicode)
		local
			i: INTEGER
		do
			if n > 0 then
				if count = 0 then
					extend_multiple(unicode, n)
				else
					--|*** May be implemented in a more efficient way...
					from
						i := n
					until
						i = 0
					loop
						precede(unicode)
						i := i - 1
					end
				end
			end
		ensure
			count = n + old count
		end

	extend_to_count (unicode: INTEGER; needed_count: INTEGER) is
			-- Extend Current with `unicode' until `needed_count' is reached.
			-- Do nothing if `needed_count' is already greater or equal
			-- to `count'.
		require
			needed_count >= 0
			valid_unicode_value: valid_unicode(unicode)
		do
			if needed_count > count then
				extend_multiple(unicode, needed_count - count)
			end
		ensure
			count >= needed_count
		end

	precede_to_count (unicode: INTEGER; needed_count: INTEGER) is
			-- Prepend `unicode' to Current until `needed_count' is reached.
			-- Do nothing if `needed_count' is already greater or equal
			-- to `count'.
		require
			needed_count >= 0
			valid_unicode_value: valid_unicode(unicode)
		do
			if needed_count > count then
				precede_multiple(unicode, needed_count - count)
			end
		ensure
			count >= needed_count
		end

	reverse is
			-- Reverse the string.
		local
			i1, i2: INTEGER
		do
			not_yet_implemented
			--|*** reverse grapheme
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

	remove_all_occurrences (unicode: INTEGER) is
			-- Remove all occurrences of `unicode'.
			--
			-- See also `occurrences', `remove'.
		require
			valid_unicode_value: valid_unicode(unicode)
		local
			i: INTEGER
		do
			--|*** May be implemented in a more efficient way...
			from
				i := index_of(unicode, 1)
			until
				i = 0
			loop
				remove(i)
				i := index_of(unicode, i)
			end
		ensure
			count = old count - old occurrences(unicode)
		end

	substring_index (other: UNICODE_STRING; start_index: INTEGER): INTEGER is
			-- Position of first occurrence of `other' at or after `start', 0 if none.
			--
			-- See also `substring', `first_substring_index'.
		require
			other_not_void: other /= Void
			valid_start_index: start_index >= 1 and start_index <= count + 1
		do
			not_yet_implemented
		end

	first_substring_index (other: UNICODE_STRING): INTEGER is
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
	split: ARRAY[UTF8_STRING] is
			-- Split the string into an array of words. Uses `is_separator'
			-- to find words. Gives Void or a non empty array.
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

	split_in (words: COLLECTION[UTF_STRING]) is
			-- Same jobs as `split' but result is appended in `words'.
			--
			-- See also `split'.
		require
			words /= Void
		do
		ensure
			words.count >= old words.count
		end

	get_new_iterator: ITERATOR[INTEGER] is
		do
			create {ITERATOR_ON_UNICODE_STRING} Result.make(Current)
		end

feature {} -- Implementation
	split_buffer: ARRAY[UTF8_STRING] is
		once
			create Result.with_capacity(4, 1)
		end

feature {}
	-- TODO: In UNICODE_STRING we have "manifest_initialize (c: like capacity; s: like storage; ls_cap: INTEGER; lsv: NATIVE_ARRAY[INTEGER_16]; lsi: NATIVE_ARRAY[INTEGER]) is -- This function is a compiler-hook automatically called when -- a manifest unicode string (i.e. U"foo") is used in the Eiffel -- source code." Provide an UTF8 equivalent

--   g_utf8_next_char()

--  #define     g_utf8_next_char(p)

--    Skips to the next character in a UTF-8 string. The string must be valid; this
--    macro is as fast as possible, and has no error-checking. You would use this macro
--    to iterate over a string character by character. The macro returns the start of
--    the next UTF-8 character. Before using this macro, use g_utf8_validate() to
--    validate strings that may contain invalid UTF-8.

--    p : Pointer to the start of a valid UTF-8 character.

--    ---------------------------------------------------------------------------------

--   g_utf8_get_char ()

--  gunichar    g_utf8_get_char                 (const gchar *p);

--    Converts a sequence of bytes encoded as UTF-8 to a Unicode character. If p does
--    not point to a valid UTF-8 encoded character, results are undefined. If you are
--    not sure that the bytes are complete valid Unicode characters, you should use
--    g_utf8_get_char_validated() instead.

--    p :       a pointer to Unicode character encoded as UTF-8
--    Returns : the resulting character

--    ---------------------------------------------------------------------------------

--   g_utf8_get_char_validated ()

--  gunichar    g_utf8_get_char_validated       (const gchar *p,
--                                               gssize max_len);

--    Convert a sequence of bytes encoded as UTF-8 to a Unicode character. This
--    function checks for incomplete characters, for invalid characters such as
--    characters that are out of the range of Unicode, and for overlong encodings of
--    valid characters.

--    p :       a pointer to Unicode character encoded as UTF-8
--    max_len : the maximum number of bytes to read, or -1, for no maximum.
--    Returns : the resulting character. If p points to a partial sequence at the end
--              of a string that could begin a valid character, returns (gunichar)-2;
--              otherwise, if p does not point to a valid UTF-8 encoded Unicode
--              character, returns (gunichar)-1.

--    ---------------------------------------------------------------------------------

--   g_utf8_offset_to_pointer ()

--  gchar*      g_utf8_offset_to_pointer        (const gchar *str,
--                                               glong offset);

--    Converts from an integer character offset to a pointer to a position within the
--    string.

--    Since 2.10, this function allows to pass a negative offset to step backwards. It
--    is usually worth stepping backwards from the end instead of forwards if offset is
--    in the last fourth of the string, since moving forward is about 3 times faster
--    than moving backward.

--    str :     a UTF-8 encoded string
--    offset :  a character offset within str
--    Returns : the resulting pointer

--    ---------------------------------------------------------------------------------

--   g_utf8_pointer_to_offset ()

--  glong       g_utf8_pointer_to_offset        (const gchar *str,
--                                               const gchar *pos);

--    Converts from a pointer to position within a string to a integer character
--    offset.

--    Since 2.10, this function allows pos to be before str, and returns a negative
--    offset in this case.

--    str :     a UTF-8 encoded string
--    pos :     a pointer to a position within str
--    Returns : the resulting character offset

--    ---------------------------------------------------------------------------------

--   g_utf8_prev_char ()

--  gchar*      g_utf8_prev_char                (const gchar *p);

--    Finds the previous UTF-8 character in the string before p.

--    p does not have to be at the beginning of a UTF-8 character. No check is made to
--    see if the character found is actually valid other than it starts with an
--    appropriate byte. If p might be the first character of the string, you must use
--    g_utf8_find_prev_char() instead.

--    p :       a pointer to a position within a UTF-8 encoded string
--    Returns : a pointer to the found character.

--    ---------------------------------------------------------------------------------

--   g_utf8_find_next_char ()

--  gchar*      g_utf8_find_next_char           (const gchar *p,
--                                               const gchar *end);

--    Finds the start of the next UTF-8 character in the string after p.

--    p does not have to be at the beginning of a UTF-8 character. No check is made to
--    see if the character found is actually valid other than it starts with an
--    appropriate byte.

--    p :       a pointer to a position within a UTF-8 encoded string
--    end :     a pointer to the end of the string, or NULL to indicate that the string
--              is nul-terminated, in which case the returned value will be
--    Returns : a pointer to the found character or NULL

--    ---------------------------------------------------------------------------------

--   g_utf8_find_prev_char ()

--  gchar*      g_utf8_find_prev_char           (const gchar *str,
--                                               const gchar *p);

--    Given a position p with a UTF-8 encoded string str, find the start of the
--    previous UTF-8 character starting before p. Returns NULL if no UTF-8 characters
--    are present in str before p.

--    p does not have to be at the beginning of a UTF-8 character. No check is made to
--    see if the character found is actually valid other than it starts with an
--    appropriate byte.

--    str :     pointer to the beginning of a UTF-8 encoded string
--    p :       pointer to some position within str
--    Returns : a pointer to the found character or NULL.

--    ---------------------------------------------------------------------------------

--   g_utf8_strlen ()

--  glong       g_utf8_strlen                   (const gchar *p,
--                                               gssize max);

--    Returns the length of the string in characters.

--    p :       pointer to the start of a UTF-8 encoded string.
--    max :     the maximum number of bytes to examine. If max is less than 0, then the
--              string is assumed to be nul-terminated. If max is 0, p will not be
--              examined and may be NULL.
--    Returns : the length of the string in characters

--    ---------------------------------------------------------------------------------

--   g_utf8_strncpy ()

--  gchar*      g_utf8_strncpy                  (gchar *dest,
--                                               const gchar *src,
--                                               gsize n);

--    Like the standard C strncpy() function, but copies a given number of characters
--    instead of a given number of bytes. The src string must be valid UTF-8 encoded
--    text. (Use g_utf8_validate() on all text before trying to use UTF-8 utility
--    functions with it.)

--    dest :    buffer to fill with characters from src
--    src :     UTF-8 encoded string
--    n :       character count
--    Returns : dest

--    ---------------------------------------------------------------------------------

--   g_utf8_strchr ()

--  gchar*      g_utf8_strchr                   (const gchar *p,
--                                               gssize len,
--                                               gunichar c);

--    Finds the leftmost occurrence of the given Unicode character in a UTF-8 encoded
--    string, while limiting the search to len bytes. If len is -1, allow unbounded
--    search.

--    p :       a nul-terminated UTF-8 encoded string
--    len :     the maximum length of p
--    c :       a Unicode character
--    Returns : NULL if the string does not contain the character, otherwise, a pointer
--              to the start of the leftmost occurrence of the character in the string.

--    ---------------------------------------------------------------------------------

--   g_utf8_strrchr ()

--  gchar*      g_utf8_strrchr                  (const gchar *p,
--                                               gssize len,
--                                               gunichar c);

--    Find the rightmost occurrence of the given Unicode character in a UTF-8 encoded
--    string, while limiting the search to len bytes. If len is -1, allow unbounded
--    search.

--    p :       a nul-terminated UTF-8 encoded string
--    len :     the maximum length of p
--    c :       a Unicode character
--    Returns : NULL if the string does not contain the character, otherwise, a pointer
--              to the start of the rightmost occurrence of the character in the
--              string.

--    ---------------------------------------------------------------------------------

--   g_utf8_strreverse ()

--  gchar*      g_utf8_strreverse               (const gchar *str,
--                                               gssize len);

--    Reverses a UTF-8 string. str must be valid UTF-8 encoded text. (Use
--    g_utf8_validate() on all text before trying to use UTF-8 utility functions with
--    it.)

--    Note that unlike g_strreverse(), this function returns newly-allocated memory,
--    which should be freed with g_free() when no longer needed.

--    str :     a UTF-8 encoded string
--    len :     the maximum length of str to use. If len < 0, then the string is
--              nul-terminated.
--    Returns : a newly-allocated string which is the reverse of str.

--    Since 2.2

--    ---------------------------------------------------------------------------------

--   g_utf8_validate ()

--  gboolean    g_utf8_validate                 (const gchar *str,
--                                               gssize max_len,
--                                               const gchar **end);

--    Validates UTF-8 encoded text. str is the text to validate; if str is
--    nul-terminated, then max_len can be -1, otherwise max_len should be the number of
--    bytes to validate. If end is non-NULL, then the end of the valid range will be
--    stored there (i.e. the start of the first invalid character if some bytes were
--    invalid, or the end of the text being validated otherwise).

--    Note that g_utf8_validate() returns FALSE if max_len is positive and NUL is met
--    before max_len bytes have been read.

--    Returns TRUE if all of str was valid. Many GLib and GTK+ routines require valid
--    UTF-8 as input; so data read from a file or the network should be checked with
--    g_utf8_validate() before doing anything else with it.

--    str :     a pointer to character data
--    max_len : max bytes to validate, or -1 to go until NUL
--    end :     return location for end of valid data
--    Returns : TRUE if the text was valid UTF-8

--    ---------------------------------------------------------------------------------

--   g_utf8_strup ()

--  gchar*      g_utf8_strup                    (const gchar *str,
--                                               gssize len);

--    Converts all Unicode characters in the string that have a case to uppercase. The
--    exact manner that this is done depends on the current locale, and may result in
--    the number of characters in the string increasing. (For instance, the German
--    ess-zet will be changed to SS.)

--    str :     a UTF-8 encoded string
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string, with all characters converted to uppercase.

--    ---------------------------------------------------------------------------------

--   g_utf8_strdown ()

--  gchar*      g_utf8_strdown                  (const gchar *str,
--                                               gssize len);

--    Converts all Unicode characters in the string that have a case to lowercase. The
--    exact manner that this is done depends on the current locale, and may result in
--    the number of characters in the string changing.

--    str :     a UTF-8 encoded string
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string, with all characters converted to lowercase.

--    ---------------------------------------------------------------------------------

--   g_utf8_casefold ()

--  gchar*      g_utf8_casefold                 (const gchar *str,
--                                               gssize len);

--    Converts a string into a form that is independent of case. The result will not
--    correspond to any particular case, but can be compared for equality or ordered
--    with the results of calling g_utf8_casefold() on other strings.

--    Note that calling g_utf8_casefold() followed by g_utf8_collate() is only an
--    approximation to the correct linguistic case insensitive ordering, though it is a
--    fairly good one. Getting this exactly right would require a more sophisticated
--    collation function that takes case sensitivity into account. GLib does not
--    currently provide such a function.

--    str :     a UTF-8 encoded string
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string, that is a case independent form of str.

--    ---------------------------------------------------------------------------------

	normalize (a_mode: G_NORMALIZE_MODE): UTF8_STRING is
		-- Converts a string into canonical form, standardizing such issues as
		-- whether a character with an accent is represented as a base
		-- character and combining accent or as a single precomposed character.
		-- You should generally call `normalize' before comparing two Unicode
		-- strings.

		-- "default" `a_normalization_mode' only standardizes differences that
		-- do not affect the text content, such as the above-mentioned accent
		-- representation.  "all" also standardizes the "compatibility"
		-- characters in Unicode, such as SUPERSCRIPT THREE to the standard
		-- forms (in this case DIGIT THREE). Formatting information may be lost
		-- but for most text operations such characters should be considered
		-- the same. For example, `collate' normalizes with "all" as its first
		-- step.

		-- "compose" and "all_compose" are like "default" and "all", but
		-- returned a result with composed forms rather than a maximally
		-- decomposed form. This is often useful if you intend to convert the
		-- string to a legacy encoding or pass it to a system with less capable
		-- Unicode handling.
	do
		create Result.from_pointer
		(g_utf8_normalize (handle, bytes_count, a_mode.value))
		--    str :     a UTF-8 encoded string.
		--    len :     length of str, in bytes, or -1 if str is nul-terminated.
		--    mode :    the type of normalization to perform.
		--    Returns : a newly allocated string, that is the normalized form of str.
	ensure not_void: Result/=Void
	end

--    ---------------------------------------------------------------------------------

--   g_utf8_collate_key ()

--  gchar*      g_utf8_collate_key              (const gchar *str,
--                                               gssize len);

--    Converts a string into a collation key that can be compared with other collation
--    keys produced by the same function using strcmp(). The results of comparing the
--    collation keys of two strings with strcmp() will always be the same as comparing
--    the two original keys with g_utf8_collate().

--    str :     a UTF-8 encoded string.
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string. This string should be freed with g_free()
--              when you are done with it.

--    ---------------------------------------------------------------------------------

--   g_utf8_collate_key_for_filename ()

--  gchar*      g_utf8_collate_key_for_filename (const gchar *str,
--                                               gssize len);

--    Converts a string into a collation key that can be compared with other collation
--    keys produced by the same function using strcmp().

--    In order to sort filenames correctly, this function treats the dot '.' as a
--    special case. Most dictionary orderings seem to consider it insignificant, thus
--    producing the ordering "event.c" "eventgenerator.c" "event.h" instead of
--    "event.c" "event.h" "eventgenerator.c". Also, we would like to treat numbers
--    intelligently so that "file1" "file10" "file5" is sorted as "file1" "file5"
--    "file10".

--    str :     a UTF-8 encoded string.
--    len :     length of str, in bytes, or -1 if str is nul-terminated.
--    Returns : a newly allocated string. This string should be freed with g_free()
--              when you are done with it.

--    Since 2.8

feature {} -- Implementation 
	offset_to_pointer (an_offset: INTEGER_32): POINTER
		-- A pointer to `an_offset' on Current

		--Converts from an integer character offset to a pointer to a position
		--within the string.

		-- Since 2.10, this function allows to pass a negative offset to step
		-- backwards. It is usually worth stepping backwards from the end
		-- instead of forwards if offset is in the last fourth of the string,
		-- since moving forward is about 3 times faster than moving backward.
	do
		Result := g_utf8_offset_to_pointer(handle,an_offset)
	end

	pointer_to_offset (a_pointer: POINTER): INTEGER_32 is
		-- Converts from `a_pointer' (within string) to position within a
		-- string to a integer character offset.

		-- Since 2.10, this function allows pos to be before str, and returns a
		-- negative offset in this case.
	do
		Result:=g_utf8_pointer_to_offset(handle,a_position)
	end

feature {} -- Unwrapped code
--   g_utf8_to_utf16 ()

--  gunichar2*  g_utf8_to_utf16                 (const gchar *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from UTF-8 to UTF-16. A 0 character will be added to the result
--    after the converted text.

--    str :           a UTF-8 encoded string
--    len :           the maximum length (number of characters) of str to use. If len <
--                    0, then the string is nul-terminated.
--    items_read :    location to store number of bytes read, or NULL. If NULL, then
--                    G_CONVERT_ERROR_PARTIAL_INPUT will be returned in case str
--                    contains a trailing partial character. If an error occurs then
--                    the index of the invalid input is stored here.
--    items_written : location to store number of gunichar2 written, or NULL. The value
--                    stored here does not include the trailing 0.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UTF-16 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set.

--    ---------------------------------------------------------------------------------

--   g_utf8_to_ucs4 ()

--  gunichar*   g_utf8_to_ucs4                  (const gchar *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from UTF-8 to a 32-bit fixed width representation as UCS-4. A
--    trailing 0 will be added to the string after the converted text.

--    str :           a UTF-8 encoded string
--    len :           the maximum length of str to use. If len < 0, then the string is
--                    nul-terminated.
--    items_read :    location to store number of bytes read, or NULL. If NULL, then
--                    G_CONVERT_ERROR_PARTIAL_INPUT will be returned in case str
--                    contains a trailing partial character. If an error occurs then
--                    the index of the invalid input is stored here.
--    items_written : location to store number of characters written or NULL. The value
--                    here stored does not include the trailing 0 character.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UCS-4 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set.

--    ---------------------------------------------------------------------------------

--   g_utf8_to_ucs4_fast ()

--  gunichar*   g_utf8_to_ucs4_fast             (const gchar *str,
--                                               glong len,
--                                               glong *items_written);

--    Convert a string from UTF-8 to a 32-bit fixed width representation as UCS-4,
--    assuming valid UTF-8 input. This function is roughly twice as fast as
--    g_utf8_to_ucs4() but does no error checking on the input.

--    str :           a UTF-8 encoded string
--    len :           the maximum length of str to use. If len < 0, then the string is
--                    nul-terminated.
--    items_written : location to store the number of characters in the result, or
--                    NULL.
--    Returns :       a pointer to a newly allocated UCS-4 string. This value must be
--                    freed with g_free().

--    ---------------------------------------------------------------------------------

--   g_utf16_to_ucs4 ()

--  gunichar*   g_utf16_to_ucs4                 (const gunichar2 *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from UTF-16 to UCS-4. The result will be terminated with a 0
--    character.

--    str :           a UTF-16 encoded string
--    len :           the maximum length (number of gunichar2) of str to use. If len <
--                    0, then the string is terminated with a 0 character.
--    items_read :    location to store number of words read, or NULL. If NULL, then
--                    G_CONVERT_ERROR_PARTIAL_INPUT will be returned in case str
--                    contains a trailing partial character. If an error occurs then
--                    the index of the invalid input is stored here.
--    items_written : location to store number of characters written, or NULL. The
--                    value stored here does not include the trailing 0 character.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UCS-4 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set.

--    ---------------------------------------------------------------------------------

--   g_utf16_to_utf8 ()

--  gchar*      g_utf16_to_utf8                 (const gunichar2 *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from UTF-16 to UTF-8. The result will be terminated with a 0
--    byte.

--    Note that the input is expected to be already in native endianness, an initial
--    byte-order-mark character is not handled specially. g_convert() can be used to
--    convert a byte buffer of UTF-16 data of ambiguous endianess.

--    str :           a UTF-16 encoded string
--    len :           the maximum length (number of gunichar2) of str to use. If len <
--                    0, then the string is terminated with a 0 character.
--    items_read :    location to store number of words read, or NULL. If NULL, then
--                    G_CONVERT_ERROR_PARTIAL_INPUT will be returned in case str
--                    contains a trailing partial character. If an error occurs then
--                    the index of the invalid input is stored here.
--    items_written : location to store number of bytes written, or NULL. The value
--                    stored here does not include the trailing 0 byte.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UTF-8 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set.

--    ---------------------------------------------------------------------------------

--   g_ucs4_to_utf16 ()

--  gunichar2*  g_ucs4_to_utf16                 (const gunichar *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from UCS-4 to UTF-16. A 0 character will be added to the result
--    after the converted text.

--    str :           a UCS-4 encoded string
--    len :           the maximum length (number of characters) of str to use. If len <
--                    0, then the string is terminated with a 0 character.
--    items_read :    location to store number of bytes read, or NULL. If an error
--                    occurs then the index of the invalid input is stored here.
--    items_written : location to store number of gunichar2 written, or NULL. The value
--                    stored here does not include the trailing 0.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UTF-16 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set.

--    ---------------------------------------------------------------------------------

--   g_ucs4_to_utf8 ()

--  gchar*      g_ucs4_to_utf8                  (const gunichar *str,
--                                               glong len,
--                                               glong *items_read,
--                                               glong *items_written,
--                                               GError **error);

--    Convert a string from a 32-bit fixed width representation as UCS-4. to UTF-8. The
--    result will be terminated with a 0 byte.

--    str :           a UCS-4 encoded string
--    len :           the maximum length (number of characters) of str to use. If len <
--                    0, then the string is terminated with a 0 character.
--    items_read :    location to store number of characters read, or NULL.
--    items_written : location to store number of bytes written or NULL. The value here
--                    stored does not include the trailing 0 byte.
--    error :         location to store the error occuring, or NULL to ignore errors.
--                    Any of the errors in GConvertError other than
--                    G_CONVERT_ERROR_NO_CONVERSION may occur.
--    Returns :       a pointer to a newly allocated UTF-8 string. This value must be
--                    freed with g_free(). If an error occurs, NULL will be returned
--                    and error set. In that case, items_read will be set to the
--                    position of the first invalid input character.

--    ---------------------------------------------------------------------------------

--   g_unichar_to_utf8 ()

--  gint        g_unichar_to_utf8               (gunichar c,
--                                               gchar *outbuf);

--    Converts a single character to UTF-8.

--    c :       a Unicode character code
--    outbuf :  output buffer, must have at least 6 bytes of space. If NULL, the length
--              will be computed and returned and nothing will be written to outbuf.
--    Returns : number of bytes written

-- See Also

--    g_locale_to_utf8(), g_locale_from_utf8() Convenience functions for converting
--                                             between UTF-8 and the locale encoding.

--    --------------

--    ^[3] surrogate pairs
	
feature {RECYCLING_POOL}
	recycle is
		do
			clear_count
		end

invariant
	0 <= count
	count <= capacity
	
end --  class UTF8_STRING
