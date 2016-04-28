note
	description: "External calls for GTK_MENU"
	copyright: "Copyright (C) 2007 Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_MENU_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_is_menu (a_ptr: POINTER): INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IS_MENU"
		end

	gtk_menu_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_set_screen (a_menu: POINTER; a_gdkscreen: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_reorder_child (a_menu: POINTER; a_child: POINTER; a_position: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_attach (a_menu: POINTER; a_child: POINTER;
						  left_attach, right_attach, top_attach, bottom_attach: INTEGER) is
		-- left_attach, right_attach, top_attach, bottom_attach should be NATURAL since they're guint
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_popup (a_menu, parent_menu_shell, parent_menu_item, a_gtkmenupositionfunc, some_data: POINTER;
						 a_button: INTEGER; an_activate_time:  INTEGER_32) is
			-- Note: a_button shall be a NATURAL
			-- Note: an_activate_time shall be a NATURAL_32
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_set_accel_group (a_menu: POINTER; an_accel_group: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	
	gtk_menu_get_accel_group (a_menu: POINTER): POINTER is --  GtkAccelGroup *
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_set_accel_path (a_menu: POINTER; a_path: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_set_title (a_menu: POINTER; a_title: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	

	gtk_menu_get_tearoff_state (a_menu: POINTER): INTEGER is --	gboolean
		external "C use <gtk/gtk.h>"
		end
	

	gtk_menu_get_title (a_menu: POINTER): POINTER is -- 	const gchar*
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_popdown (a_menu: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_reposition (a_menu: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_get_active (a_menu: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_set_active (a_menu: POINTER; an_index: INTEGER) is
			-- Note: an_index shall be NATURAL
		external "C use <gtk/gtk.h>"
		end
	

	gtk_menu_set_tearoff_state (a_menu: POINTER; a_torn_off: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_attach_to_widget (a_menu, an_attach_widget, a_gtk_menu_detach_func: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_detach (a_menu: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_get_attach_widget (a_menu: POINTER) is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_get_for_attach_widget (a_widget: POINTER) is -- GList*
		external "C use <gtk/gtk.h>"
		end
	
	-- void (*GtkMenuPositionFunc) (a_menu: POINTER,gint *x,gint
	-- *y,gboolean *push_in,gpointer user_data) 

	-- void (*GtkMenuDetachFunc) (GtkWidget *attach_widget, a_menu: POINTER) 

	gtk_menu_set_monitor (a_menu: POINTER; a_monitor_num: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
end
