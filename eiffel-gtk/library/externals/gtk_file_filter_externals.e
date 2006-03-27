indexing
	description: "External calls for GTK_FILE_FILTER"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_FILTER_EXTERNALS
insert GTK_FILE_FILTER_FLAGS
feature {NONE} -- External calls

	gtk_file_filter_new: POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_filter_set_name (a_gtkfilefilter, a_name: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_filter_get_name (a_gtkfilefilter: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_filter_add_mime_type (a_gtkfilefilter, a_mime_type: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_filter_add_pattern (a_gtkfilefilter, a_pattern: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_filter_add_pixbuf_formats (a_gtkfilefilter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_filter_add_custom (a_gtkfilefilter: POINTER;
										 some_flags: INTEGER;
										 a_function, some_data, a_gdestroynotify_function: POINTER) is
		require are_valid_gtk_file_filter_flags (some_flags)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_filter_get_needed (a_gtkfilefilter: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
			ensure are_valid_gtk_file_filter_flags (Result)
		end

	gtk_file_filter_filter (a_gtkfilefilter, a_gtkfilefilterinfo: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

-- GtkFileFilterFunc ()

-- gboolean    (*GtkFileFilterFunc)            (const GtkFileFilterInfo *filter_info,
-- 															gpointer data);

-- The type of function that is used with custom filters, see gtk_file_filter_add_custom().
-- filter_info : 	a GtkFileFilterInfo that is filled according to the needed flags passed to gtk_file_filter_add_custom()
-- data : 	user data passed to gtk_file_filter_add_custom()
-- Returns : 	TRUE if the file should be displayed
end
