note
	description: "External calls for GTK_FILE_SELECTION"
	copyright: "Copyright (C) 2007 $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_SELECTION_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_file_selection_new (a_title: POINTER): POINTER is
			-- GtkWidget* gtk_file_selection_new (const gchar *title);
		external "C use <gtk/gtk.h>"
		end

	gtk_file_selection_set_filename (a_filesel, a_filename: POINTER) is
			-- void gtk_file_selection_set_filename (GtkFileSelection *filesel,
			-- const gchar *filename);
		external "C use <gtk/gtk.h>"
		end

	gtk_file_selection_get_filename (a_filesel: POINTER): POINTER is
			-- const gchar* gtk_file_selection_get_filename (GtkFileSelection
			-- *filesel);
		external "C use <gtk/gtk.h>"
		end

	gtk_file_selection_complete (a_filesel, a_pattern: POINTER) is
			-- void gtk_file_selection_complete (GtkFileSelection *filesel, const
			-- gchar *pattern);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_selection_show_fileop_buttons (a_filesel: POINTER) is
			-- void gtk_file_selection_show_fileop_buttons (GtkFileSelection
			-- *filesel);
		external "C use <gtk/gtk.h>"
		end

	gtk_file_selection_hide_fileop_buttons (a_filesel: POINTER) is
			-- void gtk_file_selection_hide_fileop_buttons (GtkFileSelection
			-- *filesel);
		external "C use <gtk/gtk.h>"
		end

	gtk_file_selection_get_selections (a_filesel: POINTER): POINTER is
			-- gchar** gtk_file_selection_get_selections (GtkFileSelection
			-- *filesel);
		external "C use <gtk/gtk.h>"
		end

	gtk_file_selection_set_select_multiple (a_filesel: POINTER; select_multiple_bool: INTEGER) is
			-- void gtk_file_selection_set_select_multiple (GtkFileSelection
			-- *filesel, gboolean select_multiple);
		external "C use <gtk/gtk.h>"
		end

	gtk_file_selection_get_select_multiple (a_filesel: POINTER): INTEGER is
			-- gboolean gtk_file_selection_get_select_multiple (GtkFileSelection
			-- *filesel);
		external "C use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkFileSelection)"
		end
end
