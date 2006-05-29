indexing
	description: "Enum  GtkMenuDirectionType - An enumeration representing directional movements within a menu."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class  GTK_MENU_DIRECTION_TYPE
feature  -- enum
	is_valid_menu_direction (a_direction :INTEGER): BOOLEAN is
		do	
			Result:=((a_direction = gtk_menu_dir_parent) or else
						(a_direction = gtk_menu_dir_child) or else
						(a_direction = gtk_menu_dir_next) or else 
						(a_direction = gtk_menu_dir_prev))
		end

	gtk_menu_dir_parent: INTEGER is
			-- To the parent menu shell.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MENU_DIR_PARENT"
		end
	
	gtk_menu_dir_child: INTEGER is
			-- To the submenu, if any, associated with the item.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MENU_DIR_CHILD"
		end

	gtk_menu_dir_next: INTEGER is
			-- To the next menu item.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MENU_DIR_NEXT"
		end

	gtk_menu_dir_prev: INTEGER is
			-- To the previous menu item.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MENU_DIR_PREV"
		end
end
