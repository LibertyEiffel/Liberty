indexing
	description: "GTK_TREE_PATH, an object referring to a row."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_TREE_PATH

inherit
	SHARED_C_STRUCT redefine dispose end

insert
	GTK_TREE_MODEL_EXTERNALS

creation
	make, make_first, 
	from_external_pointer, from_string, first, from_path

-- feature  -- size
-- 	size: INTEGER is
-- 		external "C inline use <gtk/gtk.h>"
-- 		alias "sizeof(GtkTreePath)"
-- 		end

feature {NONE} -- Creation
	make is
			-- Creates a new GtkTreePath. This structure refers to a row.
		do
			handle:= gtk_tree_path_new 
		end

	from_string (a_path: STRING) is
			-- Creates a new GtkTreePath initialized to
			-- `a_path'. `a_path' is expected to be a colon separated
			-- list of numbers. For example, the string "10:4:0" would
			-- create a path of depth 3 pointing to the 11th child of the
			-- root node, the 5th child of that 11th child, and the 1st
			-- child of that 5th child. If an invalid path string is
			-- passed in, this object will "is_null" (i.e. is_null = True)
		require path_not_void: a_path /= Void
		do
			handle := gtk_tree_path_new_from_string (a_path.to_external)
		end
	
	-- unwrappable varargs function GtkTreePath*
	-- gtk_tree_path_new_from_indices (gint first_index, ...); Creates
	-- a new path with first_index and varargs as indices.  first_index
	-- : first integer ... : list of integers terminated by -1 Returns
	-- : A newly created GtkTreePath.

	make_first, first is
			-- Creates a new GtkTreePath. The string representation of
			-- this path is "0"
		do
			handle := gtk_tree_path_new_first
		end

	from_path (a_path: like Current) is
			-- Creates a new GtkTreePath as a copy of path.
		do
			handle := gtk_tree_path_copy (a_path.handle)
		end

feature
	to_string: STRING is
			-- Generates a string representation of the path. This string
			-- is a ':' separated list of numbers. For example,
			-- "4:10:0:3" would be an acceptable return value for this
			-- string.
		require is_not_null
		do
			create Result.from_external (gtk_tree_path_to_string (handle))
			-- gtk_tree_path_to_string returns a newly-allocated
			-- string. Must be freed with g_free(). TODO: check if STRING
			-- calling just free() is a problem.
		end

	append_index (an_index: INTEGER) is
			-- Appends a new index to a path. As a result, the depth of
			-- the path is increased.
		do
			gtk_tree_path_append_index (handle, an_index)
		ensure depth_increased: depth > old depth
		end

	prepend_index (an_index: INTEGER) is
			-- Prepends a new index to a path. As a result, the depth of
			-- the path is increased.
		do
			gtk_tree_path_prepend_index (handle, an_index)
		ensure depth_increased: depth > old depth
		end

	depth: INTEGER is
			-- the current depth of path.
		do
			Result:=gtk_tree_path_get_depth(handle)
		end

	indices: NATIVE_ARRAY [INTEGER] is
			-- the current indices of path. This is an array of integers,
			-- each representing a node in a tree.

			-- Currently crudely implemented as a NATIVE_ARRAY[INTEGER] that should contain depth-elements.		
		obsolete "TODO: This is a crude implementation. indices shall be at least a FAST_ARRAY[INTEGER] to be useable"
		do
			-- The following seems an hack. Indeed it's the "normal" way
			-- to create a NATIVE_ARRAY from a C pointer to that array
			Result := Result.from_pointer (gtk_tree_path_get_indices (handle))
		end

feature -- Disposing
	dispose is
			-- Frees path. 
		do
			gtk_tree_path_free (handle)
			handle := default_pointer
		end

feature -- Comparing

	compare (another: like Current): INTEGER is
			-- Compares two paths. If Current appears before `another' in a tree, then
			-- -1 is returned. If `another' appears before Current, then 1 is
			-- returned. If the two nodes are equal, then 0 is returned.
		require
			exists: is_not_null
			valid_another: another /= Void implies another.is_not_null
		do
			Result:= gtk_tree_path_compare (handle, another.handle)
		end

feature -- Moving
	next is
			-- Moves the path to point to the next node at the current depth.
		do
			gtk_tree_path_next (handle)
		end

	is_move_made: BOOLEAN
			-- Has last command actually moved Current?

	prev is
			-- Moves the path to point to the previous node at the
			-- current depth, if it exists. `is_move_made' is True if
			-- path has a previous node, and the move was made.
		do
			is_move_made := (gtk_tree_path_prev(handle)).to_boolean
		end

	up is
			-- Moves the path to point to its parent node, if it has a
			-- parent. `is_move_made' is True if path has a parent, and
			-- the move was made.
		do
			is_move_made := (gtk_tree_path_up(handle)).to_boolean
		end

	down is
			-- Moves path to point to the first child of the current
			-- path.
		do
			gtk_tree_path_down (handle)
		end

feature -- Queries
	is_ancestor_of (another: like Current): BOOLEAN is
			-- Is `another' a descendant of Current path?
		do
			Result:=(gtk_tree_path_is_ancestor(handle,another.handle)).to_boolean
		end

	is_descendant_of (another: like Current): BOOLEAN is
			-- IS Current  path is a descendant of `another'?
		do
			Result:=(gtk_tree_path_is_descendant(handle,another.handle)).to_boolean
		end
end
