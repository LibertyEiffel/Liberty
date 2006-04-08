indexing
	description: "The GtkTreeIter is the primary structure for accessing a structure. Models are expected to put a unique integer in the stamp member, and put model-specific data in the three user_data members."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_TREE_ITER

inherit
	SHARED_C_STRUCT redefine dispose end
	
insert
	GTK_TREE_ITER_EXTERNALS rename set_stamp as set_stamp_internal end
	GTK_TREE_MODEL_EXTERNALS
		
creation make, make_from_model, from_model, from_external_pointer

feature -- Creation
	make_from_model, from_model (a_model: GTK_TREE_MODEL) is
		require valid_model: a_model/=Void
		do
			tree_model := a_model
		end
feature

	is_valid: BOOLEAN
			-- Is last action made on Current successful, making it
			-- valid?

	start, first is
			-- Initializes Current with the first iterator in the tree (the one at the path "0") and returns TRUE. Returns FALSE if the tree is empty.
		do
			is_valid:=(gtk_tree_model_get_iter_first (tree_model.handle, handle)).to_boolean
		end
	
	next is
			-- Points Current to the node following it at the current
			-- level. If there is no next position
			-- `is_valid' will be False and Current is
			-- set to be invalid.
		do
			is_valid:=(gtk_tree_model_iter_next (tree_model.handle,handle)).to_boolean
		end
	
	to_children_of (a_parent: GTK_TREE_ITER) is
			-- Sets Current iterator to point to the first child of
			-- `tree_model'. If parent has no children `is_valid' will be
			-- False. Current will remain a valid node after this
			-- function has been called. If `a_parent' is Void returns
			-- the first node, equivalent to `first'
		do
			if a_parent=Void then
				is_valid:=(gtk_tree_model_iter_children (tree_model.handle, handle, default_pointer)).to_boolean
			else
				is_valid:=(gtk_tree_model_iter_children (tree_model.handle, handle, a_parent.handle)).to_boolean	
			end
		end
			


	has_child: BOOLEAN is
			-- Does Current iterator have children?
		do
			Result:=(gtk_tree_model_iter_has_child (tree_model.handle,
																 handle)).to_boolean
		end


	n_children, children_count: INTEGER is
			-- Number of children that Current iter has. As a special
			-- case, if iter is NULL, then the number of toplevel nodes
			-- is returned. (Note: `n_children' feature name comes from C
			-- Api. `children_count' is another name of the same feature
			-- that follow Eiffel naming style)
		do
			Result := gtk_tree_model_iter_n_children (tree_model.handle,handle)
		end
	
	toplevel_nodes_count: INTEGER is
			-- Number of toplevel nodes of `tree_model'
		do
			Result := gtk_tree_model_iter_n_children (tree_model.handle,default_pointer)
		end


	to_nth_child_of (a_parent: like Current; an_index: INTEGER) is
			-- Sets Current to be the child of `a_parent', using
			-- `an_index'. The first index is 0. If n is too big, or
			-- parent has no children, iter is set to an invalid iterator
			-- and `is_valid' will be False. `a_parent'
			-- will remain a valid node after this function has been
			-- called. As a special case, if `a_parent' is Void, then the
			-- nth root node is set. `is_valid' is True,
			-- if `a_parent' has an nth child.

			-- Note: Is `to_nth_child' a better name than `to_nth_child_of'?
		require valid_index: an_index >= 0
		local parent_ptr: POINTER
		do
			if a_parent/=Void then parent_ptr := a_parent.handle end
			is_valid:=(gtk_tree_model_iter_nth_child (tree_model.handle,handle,
																						  parent_ptr, an_index)).to_boolean
		end

	to_parent (a_child: like Current) is
			-- Sets Current to be the parent of `a_child'. If child is at
			-- the toplevel it doesn't have a parent, then iter is set to
			-- an invalid iterator and `is_valid' will
			-- be False. `a_child' will remain a valid node after this
			-- function has been called.
		require valid_child: a_child /= Void
		do
			is_valid:=(gtk_tree_model_iter_parent (tree_model.handle,handle,
																					  a_child.handle)).to_boolean
		end

	to_string: STRING is
			-- a representation of the iter. This string is a ':'
			-- separated list of numbers. For example, "4:10:0:3" would
			-- be an acceptable return value for this string.
		do
			create Result.from_external (gtk_tree_model_get_string_from_iter (tree_model.handle,handle))
			-- Note: gtk_tree_model_get_string_from_iter returns a
			-- newly-allocated string that Must be freed with g_free. As
			-- far as I know this means that Result shall be created
			-- without copying the string and letting the Garbage
			-- Collector free it.
		end

feature  -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTreeIter)"
		end

	dispose is
		do
			if handle.is_not_null then gtk_tree_iter_free (handle) end
			handle:= default_pointer
		end

feature
	stamp: INTEGER is
			-- A unique stamp to catch invalid iterators
		do
			Result := get_stamp (handle)
		end
	
	set_stamp (a_stamp: INTEGER) is
		do
			set_stamp_internal (handle, a_stamp)
		end

	-- TODO: (if ever necessary) user_data[|2|3]
	-- gpointer user_data; 	Model specific data
	-- gpointer user_data2; 	Model specific data
	-- gpointer user_data3; 	Model specific data 

feature {NONE} -- Implementation
	tree_model: GTK_TREE_MODEL
			-- Reference to the tree model. It could have been just a
			-- POINTER but in this case we would not be sure that the
			-- model is still alive when the iterator tries to access it.
end
