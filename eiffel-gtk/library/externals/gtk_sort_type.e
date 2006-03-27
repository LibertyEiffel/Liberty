indexing
	description: "Enum GtkSortType -- Determines the direction of a sort."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_SORT_TYPE
feature  -- enum
	is_valid_gtk_sort_type (a_sort_type: INTEGER): BOOLEAN is
		do	
			Result:=((a_sort_type=gtk_sort_ascending) or else
						(a_sort_type=gtk_sort_descending))
		end
	
	gtk_sort_ascending: INTEGER is 
			-- 	Sorting is in ascending order.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SORT_ASCENDING"
		end
	
	gtk_sort_descending: INTEGER is 
			-- 	Sorting is in descending order.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SORT_DESCENDING"
		end
end
