tayindexing
	description: "Enum GtkTreeViewDropPosition An enum for determining where a dropped row goes. "
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GtkTreeViewDropPosition
feature  -- enum
	is_valid_GtkTreeViewDropPosition (a_position :INTEGER): BOOLEAN is
		do	
			Result:=((a_position=gtk_tree_view_drop_before) or else 
						(a_position = gtk_tree_view_drop_after) or else
						(a_position = gtk_tree_view_drop_into_or_before) or else
						(a_position = gtk_tree_view_drop_into_or_after))
			
		end

	gtk_tree_view_drop_before: INTEGER is 
			-- drop before this row 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_DROP_BEFORE"
		end

	gtk_tree_view_drop_after: INTEGER is 
			--  drop after this row 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_DROP_AFTER"
		end
	
  gtk_tree_view_drop_into_or_before: INTEGER is 
			--  drop as a child of this row (with fallback to before or after if into is not possible)
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_DROP_INTO_OR_BEFORE"
		end
	
  gtk_tree_view_drop_into_or_after: INTEGER is 
			--  drop as a child of this row (with fallback to before or after if into is not possible)
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TREE_VIEW_DROP_INTO_OR_AFTER"
		end
end

