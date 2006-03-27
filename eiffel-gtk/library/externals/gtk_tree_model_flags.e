indexing
	description: "enum GtkTreeModelFlags "
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

	-- These flags indicate various properties of a GtkTreeModel. They are returned by gtk_tree_model_get_flags(), and must be static for the lifetime of the object. A more complete description of GTK_TREE_MODEL_ITERS_PERSIST can be found in the overview of this section.
deferred class GTK_TREE_MODEL_FLAGS
feature  -- enum
	are_valid_gtk_tree_model_flags (some_flags: INTEGER): BOOLEAN is
		do	
			Result:=(some_flags & (gtk_tree_model_iters_persist |
										  gtk_tree_model_list_only))
		end
	
	gtk_tree_model_iters_persist: INTEGER is 
			-- 	Iterators survive all signals emitted by the tree.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_MODEL_ITERS_PERSIST"
		end
	
	gtk_tree_model_list_only: INTEGER is 
			-- 	The model is a list only, and never has children
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_MODEL_LIST_ONLY"
		end
end

