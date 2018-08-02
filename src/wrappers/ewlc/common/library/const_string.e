note
	description: "A string made from a `C' const char pointer."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli
					
					This class  is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class CONST_STRING
	-- An efficient wrapper for const pointer to strings returned by
	-- many C functions. No further memory is allocated when a CONST_STRING is created: the buffer of the C library is used directly. 

	-- For example, GTK+ has many calls like this (taken from its
	-- documentation):

	-- const gchar* gtk_entry_get_text (GtkEntry *entry);
	
	-- Memory efficiency is gained with slower changing features. If you need
	-- to change its content consider using feature string to get a new
	-- (non-const) STRING with the same content.

inherit 
	STRING
		undefine is_equal
		redefine 
			resize, clear_count, wipe_out,
			clear_count_and_capacity,
			copy, fill_with, replace_all, 
			append, append_string,
			append_substring,
			infix "+",
			infix "<",
			infix ">",
			infix "<=",
			infix ">=",
			compare, three_way_comparison,
			as_upper, as_lower,
			--is_equal,
			substring,
			prepend,
			insert_string, replace_substring,
			put, swap, insert_character, shrink,
			remove, 
			add_first, precede,
			add_last, append_character,
			extend,
			to_lower, to_upper,
			keep_head, keep_tail,
			-- remove_first, remove_head,
			-- remove_last, remove_tail,
			remove_substring, remove_between, 
			remove_suffix, remove_prefix,
			left_adjust, right_adjust,
			do_all,
			extend_multiple, precede_multiple,
			extend_to_count, precede_to_count,
			reverse,
			remove_all_occurrences,
			extend_unless,
			from_external
		end

	-- DISPOSABLE
	-- rename is_equal as disposable_is_equal
	-- 		export {} disposable_is_equal
	-- 		undefine fill_tagged_out_memory, copy, out_in_tagged_out_memory
	-- 		end 
	
	-- insert WRAPPER_HANDLER undefine --- is_equal,
	-- copy,fill_tagged_out_memory, out_in_tagged_out_memory end

create {ANY} from_external

feature {ANY} 
	from_external (a_c_string: POINTER)
		do
			is_unchanged := True
			-- Allocating a small area of memory that will be freed in
			-- place of the "const char *" when Eiffel Garbage Collector
			-- disposes an unmodified CONST_STING.
			
			-- sacrificial_lamb:= calloc(1,1)
			original_c_string := a_c_string
			Precursor (a_c_string)
			-- from_external_copy (a_c_string) 
			-- XXX: Not optimal, but otherwise will try to free `a_c_string'
		end
			
	is_changed: BOOLEAN
			-- Has the Current constant string been changed?
		do 
			Result := not is_unchanged 
		end

	is_unchanged: BOOLEAN
			-- Has Current CONST_STRING not been changed?

	modify
			-- Make Current changeable. The underlying "const char*"
			-- string is copyied into a new changeable buffer. The 
			-- original C string pointer will be available at `original_c_string'
		local previous: like storage; i: INTEGER
		do
			original_c_string := to_external
			from 
				previous := storage
				storage := storage.calloc(capacity+1)
				i:=count-1
			until i < 0
			loop
				storage.put(previous.item(i),i)
				i := i - 1
			end
			is_unchanged := False
		ensure
			changeable: is_changed
		end

feature {ANY}
	resize (new_count: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (new_count)
		end

	clear_count
		do
			if is_unchanged then modify end
			Precursor 
		end

	wipe_out
		do
			if is_unchanged then modify end
			Precursor 
		end

	clear_count_and_capacity
		do
			if is_unchanged then modify end
			Precursor 
		end

	copy (other: like Current)
		do
			if is_unchanged then modify end
			Precursor (other)
		end

	fill_with (c: CHARACTER)
		do
			if is_unchanged then modify end
			Precursor (c)
		end

	replace_all (old_character, new_character: CHARACTER)
		do
			if is_unchanged then modify end
			Precursor (old_character, new_character)
		end

	append (s: STRING)
		do
			if is_unchanged then modify end
			Precursor (s)
		end

	append_string (s: STRING)
		do
			if is_unchanged then modify end
			Precursor (s)
		end

	append_substring (s: STRING; start_index, end_index: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (s, start_index, end_index)
		end

	prepend (other: STRING)
		do
			if is_unchanged then modify end
			Precursor (other)
		end

	insert_string (s: STRING; i: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (s,i)
		end

	replace_substring (s: STRING; start_index, end_index: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor  (s, start_index, end_index)
		end

	put (c: CHARACTER; i: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (c,i)
		end

	infix "+" (other: STRING): STRING
			-- Create a new STRING which is the concatenation of
			-- `Current' and `other'.
			--
			-- See also `append'.
		do
			create Result.make(count + other.count)
			Result.append(Current)
			Result.append(other)
		end

	infix ">" (other: STRING): BOOLEAN
		do
			Result := other < Current
		end
	
	infix ">=" (other: STRING): BOOLEAN
		do
			Result := not (Current < other)
		end
	
	infix "<=" (other: STRING): BOOLEAN
		do
			Result := not (other < Current)
		end
	
	infix "<" (other: STRING): BOOLEAN
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

	compare, three_way_comparison (other: STRING): INTEGER
		do
			if Current < other then
				Result := -1
			elseif other < Current then
				Result := 1
			end
		end
	
	as_upper: STRING
		do
			create Result.copy(Current)
			Result.to_upper
		end

	as_lower: STRING
		do
			create Result.copy(Current)
			Result.to_lower
		end

	substring (start_index, end_index: INTEGER): STRING
			-- New string consisting of items [`start_index'.. `end_index'].
			--
			-- See also `substring_index'.
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
	
	swap (i1, i2: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (i1, i2)
		end

	insert_character (c: CHARACTER; i: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (c,i)
		end

	shrink (min_index, max_index: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (min_index,max_index)
		end

	remove (i: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (i)
		end

	add_first (c: CHARACTER)
		do
			if is_unchanged then modify end
			Precursor (c)
		end

	precede (c: CHARACTER)
		do
			if is_unchanged then modify end
			Precursor (c)
		end

	add_last (c: CHARACTER)
		do
			if is_unchanged then modify end
			Precursor (c)
		end

	append_character (c: CHARACTER)
		do
			if is_unchanged then modify end
			Precursor (c) 
		end

	extend (c: CHARACTER)
		do
			if is_unchanged then modify end
			Precursor (c)
		end

	to_lower
		do
			if is_unchanged then modify end
			Precursor 
		end

	to_upper
		do
			if is_unchanged then modify end
			Precursor 
		end

	keep_head (n: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (n)
		end

	keep_tail (n: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (n)
		end

feature {ANY} -- commented out to achieve compatibility with both SE 2.2 and 2.3
	--    remove_head (n: INTEGER_32) is
	-- 		do
	-- 			if is_unchanged then modify end
	-- 			Precursor (n)
	-- 		end
	
	--    remove_tail (n: INTEGER_32) is
	-- 		do
	-- 			if is_unchanged then modify end
	-- 			Precursor (n)
	-- 		end

feature {ANY} 
	remove_substring (start_index, end_index: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (start_index, end_index)
		end

	remove_between (start_index, end_index: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (start_index, end_index)
		end

	remove_suffix (s: STRING)
		do
			if is_unchanged then modify end
			Precursor (s)
		end

	remove_prefix (s: STRING)
		do
			if is_unchanged then modify end
			Precursor (s)
		end

	left_adjust
		do
			if is_unchanged then modify end
			Precursor 
		end

	right_adjust
		do
			if is_unchanged then modify end
			Precursor 
		end

feature {} -- functions from STRING that change signature in 2.3. Note: commented out to achieve compatibility with both SE 2.2 and 2.3

	--    remove_first (n: INTEGER_32) is
	-- 		do
	-- 			if is_unchanged then modify end
	-- 			Precursor (n)
	-- 		end
	
	-- 	remove_last (n: INTEGER_32) is
	-- 		do
	-- 			if is_unchanged then modify end
	-- 			Precursor (n) 
	-- 		end

feature {ANY} -- from STRING
	do_all (action: ROUTINE[TUPLE[CHARACTER]])
		do
			if is_unchanged then modify end
			Precursor (action)
		end

	extend_multiple (c: CHARACTER; n: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (c,n)
		end

	precede_multiple (c: CHARACTER; n: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (c, n) 
		end

	extend_to_count (c: CHARACTER; needed_count: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (c,needed_count)
		end

	precede_to_count (c: CHARACTER; needed_count: INTEGER_32)
		do
			if is_unchanged then modify end
			Precursor (c,needed_count)
		end

	reverse
		do
			if is_unchanged then modify end
			Precursor 
		end

	remove_all_occurrences (ch: CHARACTER)
		do
			if is_unchanged then modify end
			Precursor (ch)
		end

	extend_unless (ch: CHARACTER)
		do
			if is_unchanged then modify end
			Precursor (ch)
		end

	is_equal (other: STRING ): BOOLEAN is -- like Current
		do
			if count = other.count
			 then Result := storage.fast_memcmp(other.storage,count)
			end
		end

feature {} -- Implementation
	original_c_string: POINTER 
			-- The address that contains the original C string 

	sacrificial_lamb: POINTER 
			-- Temporary keeping it NULL
			-- A address of a small area of memory allocated at creation 
			-- time that will take the place of the "const char *" when 
			-- Eiffel Garbage Collector disposes an unmodified 
			-- CONST_STING.
			-- Note: the symbolical name is intentional.... Think about 
			-- it as a small Eiffellish Easter Egg.... 8)

	dispose
		do
			original_c_string := to_external
			if is_unchanged then
				-- an hack to force the Garbage Collector to leave the
				-- storage as it is and not free it, since it hasn't been 
				-- allocated by Eiffel and must NOT be freed.
				-- change it to a dummy array
				print(dispose_notice) 
				storage := storage.from_pointer(sacrificial_lamb)
			end
		end

	dispose_notice: STRING
		"CONST_STRING.dispose: the string is unchanged; using a tentative hack to avoid crash during quitting or disposing; a pre-allocated 1-char-long memory area will be set as storage.%N"

	calloc (a_number, a_size: INTEGER): POINTER
			-- void *calloc(size_t nmemb, size_t size);
			--
			-- calloc() allocates memory for an array of nmemb elements
			-- of size bytes each and returns a pointer to the allocated
			-- memory. The memory is set to zero.
		external "C use <stdlib.h>"
		alias "se_calloc"
		ensure Result.is_not_null
		end

end -- class CONST_STRING
