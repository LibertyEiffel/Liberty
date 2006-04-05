indexing
	description: "enum GtkTreeViewColumnSizing - The sizing method the column uses to determine its width. Please note that GTK_TREE_VIEW_COLUMN_AUTOSIZE are inefficient for large views, and can make columns appear choppy."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TREE_VIEW_COLUMN_SIZING
feature  -- enum
	is_valid_gtk_tree_view_column_sizing (a_sizing :INTEGER): BOOLEAN is
		do	
			Result:=((a_sizing = gtk_tree_view_column_grow_only) or else
						(a_sizing = gtk_tree_view_column_autosize) or else
						(a_sizing = gtk_tree_view_column_fixed))
		end

	gtk_tree_view_column_grow_only: INTEGER is
			-- 	Columns only get bigger in reaction to changes in the model
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_COLUMN_GROW_ONLY"
		end

	gtk_tree_view_column_autosize: INTEGER is
			-- 	Columns resize to be the optimal size everytime the model changes.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_COLUMN_AUTOSIZE"
		end
	
	gtk_tree_view_column_fixed: INTEGER is
			-- 	Columns are a fixed numbers of pixels wide.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_COLUMN_FIXED"
		end
end
