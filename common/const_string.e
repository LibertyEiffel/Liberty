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

			-- When an entry is used its text changes, so we just can't 
			-- use an once function like this in GTK_ENTRY wrapper:

			-- text: STRING is
			--   once
			--     create Result.from_external (gtk_entry_get_text 
			--     (my_gtk_entry))
			--   end

			-- Infact AFAIK once mimicks more or less the intended 
			-- behaviour of "const char*". But this approach has too many 
			-- drawbacks to be ever taken in consideration. The 
			-- following code works indeed:

			-- text: STRING is 
         --   do
         --     create Result.from_external_copy (gtk_entry_get_text       
         --     (my_gtk_entry))                                       
         --   end                                                     

			-- While it works as intended it is memory unefficient. 
			-- Every time the Eiffel program needs to access an entry 
			-- text it has to allocate a new string and then copy it. 
			-- It should also be taken in consideration that many times 
			-- an Eiffel program will just read this string and it will 
			-- not modify it. So I wrote this class. 
			-- I admit that the naming is not the most fitting one. If 
			-- you have ideas for a better naming, please let me know.

			-- The idea is to create an Eiffel string directly from the
			-- pointer without copying it (with from_external) and
			-- redefining all the modifying features. When a program
			-- tries to modify the string the original C string is copied
			-- into a freshly allocated buffer (with
			-- from_external_copy). So creating such a string is (almost)
			-- as fast as the C version, accessing is as fast as the 
			-- original STRING. All the features that modify the string 
			-- itself will have a little performance loss.

			-- The fastest way to make many changes to a CONST_STRING is 
			-- to copy it into a STRING and change it.
			

class CONST_STRING

inherit 
	STRING
		redefine 
			resize, clear_count, wipe_out,
			clear_count_and_capacity,
			copy, fill_with, replace_all, 
			append, append_string, prepend,
			insert_string, replace_substring,
			put, swap, insert_character, shrink,
			remove, 
			add_first, precede,
			add_last, append_character,
			extend,
			to_lower, to_upper,
			keep_head, keep_tail,
			remove_first, remove_head,
			remove_last, remove_tail,
			remove_substring, remove_between, 
			remove_suffix, remove_prefix,
			left_adjust, right_adjust,
			do_all,
			extend_multiple, precede_multiple,
			extend_to_count, precede_to_count,
			reverse,
			remove_all_occurrences,    extend_unless
			dispose, 
			from_external
		end

creation from_external  

feature 
	from_external (a_c_string: POINTER) is
		do
			is_unchanged := True
			Precursor (a_c_string)
		ensure unchanged: is_unchanged
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
		ensure changeable: is_changed = True
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
			Precursor 
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

   swap (i1, i2: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor 
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
			Precursor 
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

   remove_first is
		do
			if is_unchanged then modify end
			Precursor 
		end

   remove_head (n: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (n)
		end

	remove_last is
		do
			if is_unchanged then modify end
			Precursor 
		end

   remove_tail (n: INTEGER_32) is
		do
			if is_unchanged then modify end
			Precursor (n)
		end

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

feature from STRING
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
			Precursor 
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
end -- class CONST_STRING
