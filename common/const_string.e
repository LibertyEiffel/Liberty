indexing
	description: "A string made from a `C' const char pointer."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli
					
					This class  is free software; you can redistribute it and/or
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

			-- This class has been implemented to wrap efficiently const 
			-- pointer to strings returned by many C functions.
			-- For example, GTK+ has many calls like this (taken from 
			-- its documentation):

			-- const gchar* gtk_entry_get_text (GtkEntry *entry);

			-- It retrieves the contents of the entry widget. It returns
			-- a pointer to the contents of the widget as a string. This
			-- string points to internally allocated storage in the
			-- widget and must not be freed, modified or stored.

			-- Changing instances of this class is not the best idea.
			-- Consider using feature string to get a (non-const) STRING.

class CONST_STRING

inherit 
	STRING
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
			is_equal,
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

creation from_external

feature 
	from_external (a_c_string: POINTER) is
		do
			is_unchanged := True
			Precursor (a_c_string)
		end
			
	is_changed: BOOLEAN  is
		do 
			Result := not is_unchanged 
		end

	is_unchanged: BOOLEAN

	modify is
			-- Make Current changeable. The underlying "const char*"
			-- string is copyied into a new changeable buffer. The 
			-- original C string pointer will be available at `original_c_string'
		do
			original_c_string := to_external
			from_external_copy (original_c_string)
			is_unchanged := False
		ensure
			changeable: is_changed
		end

feature
   resize (new_count: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (new_count)
		end

   clear_count is
		do
			if is_unchanged then modify end
			Precursor 
		end

   wipe_out is
		do
			if is_unchanged then modify end
			Precursor 
		end

   clear_count_and_capacity is
		do
			if is_unchanged then modify end
			Precursor 
		end

   copy (other: like Current) is
		do
			if is_unchanged then modify end
			Precursor (other)
		end

   fill_with (c: CHARACTER) is
		do
			if is_unchanged then modify end
			Precursor (c)
		end

   replace_all (old_character, new_character: CHARACTER) is
		do
			if is_unchanged then modify end
			Precursor (old_character, new_character)
		end

   append (s: STRING) is
		do
			if is_unchanged then modify end
			Precursor (s)
		end

   append_string (s: STRING) is
		do
			if is_unchanged then modify end
			Precursor (s)
		end

   append_substring (s: STRING; start_index, end_index: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (s, start_index, end_index)
		end

   prepend (other: STRING) is
		do
			if is_unchanged then modify end
			Precursor (other)
		end

   insert_string (s: STRING; i: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (s,i)
		end

   replace_substring (s: STRING; start_index, end_index: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor  (s, start_index, end_index)
		end

   put (c: CHARACTER; i: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (c,i)
		end

	infix "+" (other: STRING): STRING is
			-- Create a new STRING which is the concatenation of
			-- `Current' and `other'.
			--
			-- See also `append'.
		do
			create Result.make(count + other.count)
			Result.append(Current)
			Result.append(other)
		end

	infix ">" (other: STRING): BOOLEAN is
		do
			Result := other < Current
		end
	
	infix ">=" (other: STRING): BOOLEAN is
		do
			Result := not (Current < other)
		end
	
	infix "<=" (other: STRING): BOOLEAN is
		do
			Result := not (other < Current)
		end
	
	infix "<" (other: STRING): BOOLEAN is
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

	compare, three_way_comparison (other: STRING): INTEGER is
		do
			if Current < other then
				Result := -1
			elseif other < Current then
				Result := 1
			end
		end
	
	as_upper: STRING is
		do
			create Result.copy(Current)
			Result.to_upper
		end

	as_lower: STRING is
		do
			create Result.copy(Current)
			Result.to_lower
		end

	substring (start_index, end_index: INTEGER): STRING is
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
	
   swap (i1, i2: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (i1, i2)
		end

   insert_character (c: CHARACTER; i: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (c,i)
		end

   shrink (min_index, max_index: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (min_index,max_index)
		end

   remove (i: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (i)
		end

   add_first (c: CHARACTER) is
		do
			if is_unchanged then modify end
			Precursor (c)
		end

   precede (c: CHARACTER) is
		do
			if is_unchanged then modify end
			Precursor (c)
		end

   add_last (c: CHARACTER) is
		do
			if is_unchanged then modify end
			Precursor (c)
		end

   append_character (c: CHARACTER) is
		do
			if is_unchanged then modify end
			Precursor (c) 
		end

   extend (c: CHARACTER) is
		do
			if is_unchanged then modify end
			Precursor (c)
		end

   to_lower is
		do
			if is_unchanged then modify end
			Precursor 
		end

   to_upper is
		do
			if is_unchanged then modify end
			Precursor 
		end

   keep_head (n: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (n)
		end

   keep_tail (n: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (n)
		end

feature -- commented out to achieve compatibility with both SE 2.2 and 2.3
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

feature 
   remove_substring (start_index, end_index: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (start_index, end_index)
		end

   remove_between (start_index, end_index: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (start_index, end_index)
		end

   remove_suffix (s: STRING) is
		do
			if is_unchanged then modify end
			Precursor (s)
		end

   remove_prefix (s: STRING) is
		do
			if is_unchanged then modify end
			Precursor (s)
		end

   left_adjust is
		do
			if is_unchanged then modify end
			Precursor 
		end

   right_adjust is
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
   do_all (action: ROUTINE[TUPLE[CHARACTER]]) is
		do
			if is_unchanged then modify end
			Precursor (action)
		end

   extend_multiple (c: CHARACTER; n: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (c,n)
		end

   precede_multiple (c: CHARACTER; n: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (c, n) 
		end

   extend_to_count (c: CHARACTER; needed_count: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (c,needed_count)
		end

   precede_to_count (c: CHARACTER; needed_count: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (c,needed_count)
		end

   reverse is
		do
			if is_unchanged then modify end
			Precursor 
		end

   remove_all_occurrences (ch: CHARACTER) is
		do
			if is_unchanged then modify end
			Precursor (ch)
		end

	extend_unless (ch: CHARACTER) is
		do
			if is_unchanged then modify end
			Precursor (ch)
		end

	is_equal (other: STRING): BOOLEAN is
		do
			if count = other.count then
				Result := storage.fast_memcmp(other.storage, count)
			end
		end

feature {} -- Implementation
	original_c_string: POINTER 
			-- The address that contains the original C string

end -- class CONST_STRING
