indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_TREE_ROW_REFERENCE
inherit

	GTK_TREE_MODEL_EXTERNALS
	SHARED_C_STRUCT rename make as allocate_gtktreerowreference redefine dispose end
	
creation make

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTreeRowReference)"
		end

feature {NONE} -- Creation
	make (a_model: GTK_TREE_MODEL; a_path: GTK_TREE_PATH) is
			-- Creates a row reference based on `a_path'. This reference
			-- will keep pointing to the node pointed to by `a_path', so
			-- long as it exists. It listens to all signals emitted by
			-- `a_model', and updates its path appropriately. If path
			-- isn't a valid path in model, then exists will be False.
		require
			valid_model: a_model /= Void
			valid_path: a_path /= Void
		do
			handle:= gtk_tree_row_reference_new (a_model.handle, a_path.handle)
		end

	from_reference (another: like Current) is
			-- Create Current fron `another' GtkTreeRowReference.
		require another/=Void
		do
			handle := gtk_tree_row_reference_copy (another.handle)
		end

	-- Currently not wrapped: GtkTreeRowReference*
	-- gtk_tree_row_reference_new_proxy (GObject *proxy, GtkTreeModel
	-- *model, GtkTreePath *path); You do not need to use this
	-- function. Creates a row reference based on path. This reference
	-- will keep pointing to the node pointed to by path, so long as it
	-- exists. If path isn't a valid path in model, then NULL is
	-- returned. However, unlike references created with
	-- gtk_tree_row_reference_new(), it does not listen to the model
	-- for changes. The creator of the row reference must do this
	-- explicitly using gtk_tree_row_reference_inserted(),
	-- gtk_tree_row_reference_deleted(),
	-- gtk_tree_row_reference_reordered().  These functions must be
	-- called exactly once per proxy when the corresponding signal on
	-- the model is emitted. This single call updates all row
	-- references for that proxy. Since built-in GTK+ objects like
	-- GtkTreeView already use this mechanism internally, using them as
	-- the proxy object will produce unpredictable results. Further
	-- more, passing the same object as model and proxy doesn't work
	-- for reasons of internal implementation.  This type of row
	-- reference is primarily meant by structures that need to
	-- carefully monitor exactly when a row_reference updates itself,
	-- and is not generally needed by most applications. proxy : A
	-- proxy GObject -- model : A GtkTreeModel -- path : A valid
	-- GtkTreePath to monitor -- Returns : A newly allocated
	-- GtkTreeRowReference, or NULL -- gtk_tree_row_reference_get_model
	-- ()
	
feature -- Queries
	model: GTK_TREE_MODEL is
			-- the model which reference is monitoring in order to
			-- appropriately the path. Can be Void
		local ptr: POINTER
		do
			ptr := gtk_tree_row_reference_get_model (handle)
			if ptr.is_not_null
			then create Result.from_pointer (handle)
			end
		end

	path: GTK_TREE_PATH is
			-- The path that the row reference currently points to, or
			-- Void if the path pointed to is no longer valid.
		local ptr: POINTER
		do
			ptr :=  gtk_tree_row_reference_get_path (handle)
			if ptr.is_not_null
			then create Result.from_pointer (handle)
			end
		ensure is_valid implies Result /= Void
		end

	is_valid: BOOLEAN is
			-- Does Current reference points to a valid path?
		do
			Result := (gtk_tree_row_reference_valid(handle)).to_boolean
		end

feature -- Disposing
	dispose is
		do
			-- Free's reference. reference may be NULL.
			gtk_tree_row_reference_free (handle)
		end
feature {NONE} -- Unimplemented
	
-- Unimplemented parts

-- reference : 	a GtkTreeRowReference
-- Returns : 	a copy of reference.

-- Since 2.2
-- gtk_tree_row_reference_inserted ()

-- void        gtk_tree_row_reference_inserted (GObject *proxy,
--                                              GtkTreePath *path);

-- Lets a set of row reference created by gtk_tree_row_reference_new_proxy() know that the model emitted the "row_inserted" signal.

-- proxy : 	A GObject
-- path : 	The row position that was inserted
-- gtk_tree_row_reference_deleted ()

-- void        gtk_tree_row_reference_deleted  (GObject *proxy,
--                                              GtkTreePath *path);

-- Lets a set of row reference created by gtk_tree_row_reference_new_proxy() know that the model emitted the "row_deleted" signal.

-- proxy : 	A GObject
-- path : 	The path position that was deleted
-- gtk_tree_row_reference_reordered ()

-- void        gtk_tree_row_reference_reordered
--                                             (GObject *proxy,
--                                              GtkTreePath *path,
--                                              GtkTreeIter *iter,
--                                              gint *new_order);

-- Lets a set of row reference created by gtk_tree_row_reference_new_proxy() know that the model emitted the "rows_reordered" signal.

-- proxy : 	A GObject
-- path : 	The parent path of the reordered signal
-- iter : 	The iter pointing to the parent of the reordered
-- new_order : 	The new order of rows

end
