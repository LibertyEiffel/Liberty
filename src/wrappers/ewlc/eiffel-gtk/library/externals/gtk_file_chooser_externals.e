note
	description: "External calls for GTK_FILE_CHOOSER"
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_FILE_CHOOSER_EXTERNALS

inherit
	ANY undefine is_equal, copy end
	GTK_FILE_CHOOSER_CONFIRMATION
	GTK_FILE_CHOOSER_ERROR
	GTK_FILE_CHOOSER_ACTION

feature {} -- External calls

	-- GQuark      gtk_file_chooser_error_quark    (void) is
	-- external "C use <gtk/gtk.h>"
	-- end

	gtk_file_chooser_set_action (a_chooser: POINTER; a_gtkfilechooseraction: INTEGER)
		require is_valid_gtk_file_chooser_action (a_gtkfilechooseraction)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_action (a_chooser: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		ensure is_valid_gtk_file_chooser_action (Result)
		end
	
	gtk_file_chooser_set_local_only (a_chooser: POINTER; local_only: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_local_only (a_chooser: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_select_multiple (a_chooser: POINTER; select_multiple: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_select_multiple (a_chooser: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_show_hidden (a_chooser: POINTER; show_hidden: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_show_hidden (a_chooser: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_do_overwrite_confirmation (a_chooser: POINTER; do_overwrite_confirmation: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_do_overwrite_confirmation (a_chooser: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_current_name (a_chooser, a_name: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_filename (a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_filename (a_chooser, a_filename: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_select_filename (a_chooser, a_filename: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_unselect_filename (a_chooser, a_filename: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_select_all (a_chooser: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_unselect_all (a_chooser: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_filenames  (a_chooser: POINTER): POINTER
			-- GSList *
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_current_folder (a_chooser, a_filename: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_current_folder (a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_uri (a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_uri (a_chooser, an_uri: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_select_uri (a_chooser, an_uri: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_unselect_uri (a_chooser, an_uri: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_uris (a_chooser: POINTER): POINTER
			-- GSList*     
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_current_folder_uri (a_chooser, an_uri: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_current_folder_uri (a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_preview_widget (a_chooser, a_preview_widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_preview_widget (a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_preview_widget_active (a_chooser: POINTER; active: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_preview_widget_active (a_chooser: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_use_preview_label (a_chooser: POINTER; use_label: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_use_preview_label (a_chooser: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_preview_filename (a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_get_preview_uri(a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_extra_widget (a_chooser, an_extra_widget: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_get_extra_widget(a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_add_filter (a_chooser a_gtkfilefilter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_remove_filter  (a_chooser, a_gtkfilefilter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_list_filters   (a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_filter (a_chooser, a_filter: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_filter  (a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_add_shortcut_folder(a_chooser, a_folder, a_gerror: POINTER): INTEGER
			-- Note a_gerror is "GError **error"
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_remove_shortcut_folder(a_chooser, a_folder, a_gerror: POINTER): INTEGER
			-- Note a_gerror is "GError **error"
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_list_shortcut_folders(a_chooser: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_add_shortcut_folder_uri(a_chooser, an_uri, a_gerror: POINTER): INTEGER
			-- Note a_gerror is "GError **error"
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_remove_shortcut_folder_uri(a_chooser, an_uri, a_gerror: POINTER): INTEGER
			-- Note a_gerror is "GError **error"
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_list_shortcut_folder_uris(a_chooser: POINTER): POINTER
			-- Note a_gerror is "GError **error"
		external "C use <gtk/gtk.h>"
		end
end
