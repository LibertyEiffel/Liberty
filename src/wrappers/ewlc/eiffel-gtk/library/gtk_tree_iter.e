note
	description: "The GtkTreeIter is the primary structure for accessing a structure. Models are expected to put a unique integer in the stamp member, and put model-specific data in the three user_data members."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

class GTK_TREE_ITER

inherit
	C_STRUCT redefine allocate end

insert
	GTK
	GTK_TREE_ITER_EXTERNALS rename set_stamp as set_stamp_internal end
	GTK_TREE_MODEL_EXTERNALS
	GLIB_MEMORY_ALLOCATION

create {ANY}
	make,
	make_from_model, from_model,
	from_external_pointer,
	copy_from_pointer,
	as_children_of

feature {ANY} -- Creation

	make
		require
			gtk_initialized: gtk.is_initialized
		do
			allocate
		end
	
	make_from_model, from_model (a_model: GTK_TREE_MODEL)
		require
			gtk_initialized: gtk.is_initialized
			valid_model: a_model/=Void
		do
			allocate
			tree_model := a_model
		ensure
			handle.is_not_null
			attached_to_model
		end

	copy_from_pointer (a_ptr: POINTER)
		require
			a_ptr.is_not_null
		do
			handle := gtk_tree_iter_copy (a_ptr)
		end

	as_children_of (a_parent: GTK_TREE_ITER)
			-- Create an iterator pointing to the first child of
			-- `a_parent'.
		require
			parent_not_void: a_parent /= Void
			parent_has_children: a_parent.has_children
		do
			allocate
			tree_model := a_parent.tree_model
			is_valid := (gtk_tree_model_iter_children
							 (tree_model.handle, handle,
							  a_parent.handle).to_boolean)
		end

feature {ANY}
	is_valid: BOOLEAN
			-- Is last action made on Current successful, making it valid?

	start, first
			-- Moves Current to the first iterator in the tree (the one
			-- at the path "0"). `is_valid' will be set to False if the
			-- tree is empty.
		require
			attached_to_model
		do
			is_valid:=(gtk_tree_model_get_iter_first (tree_model.handle, handle)).to_boolean
		end

	next
			-- Points Current to the node following it at the current
			-- level. If there is no next position `is_valid' will be
			-- False and Current is set to be invalid.
		require
			attached_to_model
		do
			is_valid:=(gtk_tree_model_iter_next (tree_model.handle,handle)).to_boolean
		end

	to_children_of (a_parent: GTK_TREE_ITER)
			-- Sets Current iterator to point to the first child of
			-- `tree_model'. If parent has no children `is_valid' will be
			-- False. Current will remain a valid node after this
			-- function has been called. If `a_parent' is Void returns
			-- the first node, equivalent to `first'
		require
			attached_to_model
		do
			if a_parent=Void then
				is_valid:=(gtk_tree_model_iter_children (tree_model.handle, handle, default_pointer)).to_boolean
			else
				is_valid:=(gtk_tree_model_iter_children (tree_model.handle, handle, a_parent.handle)).to_boolean
			end
		end

	has_children, has_child: BOOLEAN
			-- Does Current iterator have children?
		require
			attached_to_model
		do
			Result := (gtk_tree_model_iter_has_child (tree_model.handle,
						  handle)).to_boolean
		end

	n_children, children_count: INTEGER
			-- Number of children that Current iter has. As a special case, if iter
			-- is NULL, then the number of toplevel nodes is returned. (Note:
			-- `n_children' feature name comes from C Api. `children_count' is
			-- another name of the same feature that follow Eiffel naming style)
		require
			attached_to_model
		do
			Result := gtk_tree_model_iter_n_children (tree_model.handle, handle)
		end

	toplevel_nodes_count: INTEGER
			-- Number of toplevel nodes of `tree_model'
		require
			attached_to_model
		do
			Result := gtk_tree_model_iter_n_children (tree_model.handle,default_pointer)
		end

	to_nth_child_of (a_parent: like Current; an_index: INTEGER)
			-- Sets Current to be the child of `a_parent', using `an_index'. The
			-- first index is 0. If n is too big, or parent has no children, iter
			-- is set to an invalid iterator and `is_valid' will be
			-- False. `a_parent' will remain a valid node after this function has
			-- been called. As a special case, if `a_parent' is Void, then the nth
			-- root node is set. `is_valid' is True, if `a_parent' has an nth
			-- child.

			-- Note: Is `to_nth_child' a better name than `to_nth_child_of'?
		require
			valid_index: an_index >= 0
			attached_to_model
		local
			parent_ptr: POINTER
		do
			if a_parent/=Void then parent_ptr := a_parent.handle end
			is_valid := (gtk_tree_model_iter_nth_child  (tree_model.handle,handle,
							 parent_ptr, an_index)).to_boolean
		end

	to_parent (a_child: like Current)
			-- Sets Current to be the parent of `a_child'. If child is at the
			-- toplevel it doesn't have a parent, then iter is set to an invalid
			-- iterator and `is_valid' will be False. `a_child' will remain a valid
			-- node after this function has been called.
		require
			valid_child: a_child /= Void
			attached_to_model
		do
			is_valid := (gtk_tree_model_iter_parent (tree_model.handle,handle,
							 a_child.handle)).to_boolean
		end

	to_string: STRING
			-- a representation of the iter. This string is a ':' separated list of
			-- numbers. For example, "4:10:0:3" would be an acceptable return value
			-- for this string.
		require
			attached_to_model
		do
			create Result.from_external (gtk_tree_model_get_string_from_iter (tree_model.handle,handle))
			-- Note: gtk_tree_model_get_string_from_iter returns a newly-allocated
			-- string that Must be freed with g_free. As far as I know this means
			-- that Result shall be created without copying the string and letting
			-- the Garbage Collector free it.
		end

	attached_to_model: BOOLEAN
		do
			Result := tree_model /= Void
		end

feature {CALLBACK}

	attach_to (a_model: like tree_model)
		require
			not attached_to_model
			a_model /= Void
		do
			tree_model := a_model
		ensure
			attached_to_model
			tree_model = a_model
		end

feature {ANY}  -- struct size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTreeIter)"
		end

feature {}

	allocate
			-- There is no malloc-like function in GTK to allocate iterators.
			-- Therefore, we allocate iterators using gtk_tree_iter_copy()
		require
			handle.is_null
		do
			handle := gtk_tree_iter_copy (dummy_iter)
			if handle.is_null then
				raise_exception (No_more_memory)
			end
		end

	dummy_iter: POINTER
		once
			Result := calloc (1, struct_size)
			if Result.is_null then
				raise_exception (No_more_memory)
			end
		end

feature {ANY}
	dispose
		do
			if handle.is_not_null then gtk_tree_iter_free (handle) end
			handle:= default_pointer
		end

feature {ANY}
	stamp: INTEGER
			-- A unique stamp to catch invalid iterators
		do
			Result := get_stamp (handle)
		end

	set_stamp (a_stamp: INTEGER)
		do
			set_stamp_internal (handle, a_stamp)
		end

	-- TODO: (if ever necessary) user_data[|2|3]
	-- gpointer user_data; 	Model specific data
	-- gpointer user_data2; 	Model specific data
	-- gpointer user_data3; 	Model specific data 

	tree_model: GTK_TREE_MODEL
			-- Reference to the tree model.

			-- Note: It could have been just a POINTER but in this case
			-- we would not be sure that the model is still alive when
			-- the iterator tries to access it.
end
