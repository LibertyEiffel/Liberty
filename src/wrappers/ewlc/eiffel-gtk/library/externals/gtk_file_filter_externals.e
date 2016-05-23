note
	description: "External calls for GTK_FILE_FILTER"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_FILTER_EXTERNALS

inherit ANY undefine is_equal, copy end

insert GTK_FILE_FILTER_FLAGS

feature {} -- External calls

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
		require are_valid_file_filter_flags (some_flags)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_filter_get_needed (a_gtkfilefilter: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
			ensure are_valid_file_filter_flags (Result)
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
