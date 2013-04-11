indexing
	description: "Automatic String Completion"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Glib developers
					
					This library is free software; you can redistribute it and/or
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

class G_COMPLETION
	-- Automatic String Completion supports for automatic completion
	-- using a group of target strings.

	-- G_COMPLETION provides support for automatic completion of a
	-- string using any group of target strings. It is typically used
	-- for file name completion as is common in many UNIX shells.

	-- Target items are added and removed with `add', `remove',
	-- `clear'.  A completion attempt is requested with `complete'.

	-- TODO: the underlying GCompletion allows strings to be UTF8 with
	-- "g_completion_complete_utf8". Provide an UTF_8 variant. Items in
	-- the completion can be simple strings (e.g.  filenames) as
	-- supported by this first version of G_COMPLETION, or pointers to
	-- arbitrary data structures. If data structures are used a new
	-- generic variant shall be implemented, providing a
	-- GCompletionFunc in "g_completion_new", which retrieves the
	-- item's string from the data structure. It would also be useful
	-- to change the way in which strings are compared by setting a
	-- different GCompletionStrncmpFunc in "g_completion_set_compare".

inherit 
		C_STRUCT redefine default_create end 
		EIFFEL_OWNED redefine default_create , dispose end

insert 
		GCOMPLETION_EXTERNALS redefine default_create end 
		GCOMPLETION_STRUCT redefine default_create end
		GLIST_EXTERNALS undefine default_create end -- used in matching
		GLIST_STRUCT undefine default_create, struct_size end -- used in matching

create {ANY}  from_external_pointer

feature {ANY}
	default_create is
		do
			from_external_pointer(g_completion_new (default_pointer))
			-- Creates a new GCompletion. The argument is the function to
			-- be called to return the string representing an item in the
			-- GCompletion, or NULL if strings are going to be used as
			-- the GCompletion items.
		end

	add_strings (some_strings: COLLECTION[ABSTRACT_STRING]) is
			-- Adds `some_strings' to Current GCompletion.

			-- Note: TODO when some_strings is a G_LIST_STRING this call is more efficient
		require some_strings/=Void
		do
			not_yet_implemented
			-- g_completion_add_items(handle,some_strings.handle)
		end

	remove (some_strings: COLLECTION[ABSTRACT_STRING]) is
			-- Removes `some_strings' from Current GCompletion.
		require some_strings/=Void
		do
			not_yet_implemented
			-- g_completion_remove_items(handle,some_strings.handle)
		end

	clear is
			-- Removes all items from the GCompletion.
		do
			g_completion_clear_items(handle)
		end

	complete (a_prefix: STRING) is
			-- Attempts to complete `a_prefix' using the GCompletion
			-- target items.
		require prefix_not_void: a_prefix /= Void
		local
			g_list, a_new_prefix: POINTER
		do
			g_list := g_completion_complete(handle, a_prefix.to_external, $a_new_prefix)
			-- the prefix string, typically typed by the user, which is
			-- compared with each of the items.

			-- `a_new_prefix' if non-NULL, returns the longest prefix
			-- which is common to all items that matched prefix, or NULL
			-- if no items matched prefix. This string should be freed
			-- when no longer needed.
			if a_new_prefix.is_not_null then
				create longest_common_prefix.from_external_copy(a_new_prefix)
			end
			-- g_completion_complete returns the list of items whose
			-- strings begin with prefix. This should not be changed. So we copy it.

			if g_list.is_not_null then 
				from create {FAST_ARRAY[STRING]} matching.with_capacity(g_list_length(g_list).to_integer_32)
				until g_list.is_not_null loop
					matching.add_last(create {STRING}.from_external_copy(glist_struct_get_data(g_list)))
					g_list:=glist_struct_get_next(g_list)
				end
			else matching:=Void
			end
		end

	matching: COLLECTION[STRING]
			-- the list of items whose strings begin with `a_prefix'
	
	longest_common_prefix: STRING 
			-- the longest prefix which is common to all items that
			-- matched `a_prefix' during last `complete' invocation; Void
			-- if no items matched `a_prefix'. This string should be
			-- freed when no longer needed.
	
	dispose is
			-- Frees all memory used by the GCompletion.
		do
			g_completion_free(handle)
		end
end --  class G_COMPLETION

--   GCompletionFunc ()
	
--  gchar*      (*GCompletionFunc)              (gpointer );

-- Specifies the type of the function passed to
-- g_completion_new(). It should return the string corresponding to
-- the given target item. This is used when you use data structures
-- as GCompletion items.
	
--    Param1 :  the completion item.
--    Returns : the string corresponding to the item.

--   GCompletionStrncmpFunc ()

--  gint        (*GCompletionStrncmpFunc)       (const gchar *s1,
--                                               const gchar *s2,
--                                               gsize n);

--    Specifies the type of the function passed to g_completion_set_compare(). This is
--    used when you use strings as GCompletion items.

--    s1 :      string to compare with s2.
--    s2 :      string to compare with s1.
--    n :       maximal number of bytes to compare.
--    Returns : an integer less than, equal to, or greater than zero if the first n
--              bytes of s1 is found, respectively, to be less than, to match, or to be
--              greater than the first n bytes of s2.


