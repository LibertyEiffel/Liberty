indexing
	description: "External calls for GTK_FILE_CHOOSER"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_CHOOSER_EXTERNALS
inherit
	GTK_FILE_CHOOSER_CONFIRMATION
	GTK_FILE_CHOOSER_ERROR
	GTK_FILE_CHOOSER_ACTION
feature {NONE} -- External calls

	-- GQuark      gtk_file_chooser_error_quark    (void) is
	-- external "C use <gtk/gtk.h>"
	-- end

	gtk_file_chooser_set_action (a_chooser: POINTER; a_gtkfilechooseraction: INTEGER) is
		require is_valid_gtk_file_chooser_action (a_gtkfilechooseraction)
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_action (a_chooser: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		ensure is_valid_gtk_file_chooser_action (Result)
		end
	
	gtk_file_chooser_set_local_only (a_chooser: POINTER; local_only: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_local_only (a_chooser: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_select_multiple (a_chooser: POINTER; select_multiple: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_select_multiple (a_chooser: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_show_hidden (a_chooser: POINTER; show_hidden: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_show_hidden (a_chooser: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_do_overwrite_confirmation (a_chooser: POINTER; do_overwrite_confirmation: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_do_overwrite_confirmation (a_chooser: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_current_name (a_chooser, a_name: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_filename (a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_filename (a_chooser, a_filename: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_select_filename (a_chooser, a_filename: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_unselect_filename (a_chooser, a_filename: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_select_all (a_chooser: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_unselect_all (a_chooser: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_filenames  (a_chooser: POINTER): POINTER is
			-- GSList *
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_current_folder (a_chooser, a_filename: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_current_folder (a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_uri (a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_uri (a_chooser, an_uri: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_select_uri (a_chooser, an_uri: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_unselect_uri (a_chooser, an_uri: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_uris (a_chooser: POINTER): POINTER is
			-- GSList*     
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_current_folder_uri (a_chooser, an_uri: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_current_folder_uri (a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_preview_widget (a_chooser, a_preview_widget: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_preview_widget (a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_preview_widget_active (a_chooser: POINTER; active: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_preview_widget_active (a_chooser: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_use_preview_label (a_chooser: POINTER; use_label: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_use_preview_label (a_chooser: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_preview_filename (a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_get_preview_uri(a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_extra_widget (a_chooser, an_extra_widget: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_get_extra_widget(a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_add_filter (a_chooser a_gtkfilefilter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_remove_filter  (a_chooser, a_gtkfilefilter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_list_filters   (a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_set_filter (a_chooser, a_filter: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_get_filter  (a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_add_shortcut_folder(a_chooser, a_folder, a_gerror: POINTER): INTEGER is
			-- Note a_gerror is "GError **error"
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_remove_shortcut_folder(a_chooser, a_folder, a_gerror: POINTER): INTEGER is
			-- Note a_gerror is "GError **error"
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_list_shortcut_folders(a_chooser: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_add_shortcut_folder_uri(a_chooser, an_uri, a_gerror: POINTER): INTEGER is
			-- Note a_gerror is "GError **error"
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_remove_shortcut_folder_uri(a_chooser, an_uri, a_gerror: POINTER): INTEGER is
			-- Note a_gerror is "GError **error"
		external "C use <gtk/gtk.h>"
		end
	
	gtk_file_chooser_list_shortcut_folder_uris(a_chooser: POINTER): POINTER is
			-- Note a_gerror is "GError **error"
		external "C use <gtk/gtk.h>"
		end
end
