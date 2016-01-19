-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILECHOOSER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_chooser_add_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_file_chooser_add_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_add_filter"
		}"
		end

	gtk_file_chooser_add_shortcut_folder (a_chooser: POINTER; a_folder: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_file_chooser_add_shortcut_folder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_add_shortcut_folder"
		}"
		end

	gtk_file_chooser_add_shortcut_folder_uri (a_chooser: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_file_chooser_add_shortcut_folder_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_add_shortcut_folder_uri"
		}"
		end

	gtk_file_chooser_error_quark: NATURAL is
 		-- gtk_file_chooser_error_quark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_error_quark()"
		}"
		end

	gtk_file_chooser_get_action (a_chooser: POINTER): INTEGER is
 		-- gtk_file_chooser_get_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_action"
		}"
		end

	gtk_file_chooser_get_create_folders (a_chooser: POINTER): INTEGER is
 		-- gtk_file_chooser_get_create_folders
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_create_folders"
		}"
		end

	gtk_file_chooser_get_current_folder (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_current_folder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_current_folder"
		}"
		end

	gtk_file_chooser_get_current_folder_file (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_current_folder_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_current_folder_file"
		}"
		end

	gtk_file_chooser_get_current_folder_uri (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_current_folder_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_current_folder_uri"
		}"
		end

	gtk_file_chooser_get_do_overwrite_confirmation (a_chooser: POINTER): INTEGER is
 		-- gtk_file_chooser_get_do_overwrite_confirmation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_do_overwrite_confirmation"
		}"
		end

	gtk_file_chooser_get_extra_widget (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_extra_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_extra_widget"
		}"
		end

	gtk_file_chooser_get_file (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_file"
		}"
		end

	gtk_file_chooser_get_filename (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_filename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_filename"
		}"
		end

	gtk_file_chooser_get_filenames (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_filenames
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_filenames"
		}"
		end

	gtk_file_chooser_get_files (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_files
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_files"
		}"
		end

	gtk_file_chooser_get_filter (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_filter"
		}"
		end

	gtk_file_chooser_get_local_only (a_chooser: POINTER): INTEGER is
 		-- gtk_file_chooser_get_local_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_local_only"
		}"
		end

	gtk_file_chooser_get_preview_file (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_preview_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_preview_file"
		}"
		end

	gtk_file_chooser_get_preview_filename (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_preview_filename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_preview_filename"
		}"
		end

	gtk_file_chooser_get_preview_uri (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_preview_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_preview_uri"
		}"
		end

	gtk_file_chooser_get_preview_widget (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_preview_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_preview_widget"
		}"
		end

	gtk_file_chooser_get_preview_widget_active (a_chooser: POINTER): INTEGER is
 		-- gtk_file_chooser_get_preview_widget_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_preview_widget_active"
		}"
		end

	gtk_file_chooser_get_select_multiple (a_chooser: POINTER): INTEGER is
 		-- gtk_file_chooser_get_select_multiple
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_select_multiple"
		}"
		end

	gtk_file_chooser_get_show_hidden (a_chooser: POINTER): INTEGER is
 		-- gtk_file_chooser_get_show_hidden
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_show_hidden"
		}"
		end

	gtk_file_chooser_get_type: like long_unsigned is
 		-- gtk_file_chooser_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_type()"
		}"
		end

	gtk_file_chooser_get_uri (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_uri"
		}"
		end

	gtk_file_chooser_get_uris (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_uris
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_uris"
		}"
		end

	gtk_file_chooser_get_use_preview_label (a_chooser: POINTER): INTEGER is
 		-- gtk_file_chooser_get_use_preview_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_use_preview_label"
		}"
		end

	gtk_file_chooser_list_filters (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_list_filters
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_list_filters"
		}"
		end

	gtk_file_chooser_list_shortcut_folder_uris (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_list_shortcut_folder_uris
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_list_shortcut_folder_uris"
		}"
		end

	gtk_file_chooser_list_shortcut_folders (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_list_shortcut_folders
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_list_shortcut_folders"
		}"
		end

	gtk_file_chooser_remove_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_file_chooser_remove_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_remove_filter"
		}"
		end

	gtk_file_chooser_remove_shortcut_folder (a_chooser: POINTER; a_folder: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_file_chooser_remove_shortcut_folder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_remove_shortcut_folder"
		}"
		end

	gtk_file_chooser_remove_shortcut_folder_uri (a_chooser: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_file_chooser_remove_shortcut_folder_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_remove_shortcut_folder_uri"
		}"
		end

	gtk_file_chooser_select_all (a_chooser: POINTER) is
 		-- gtk_file_chooser_select_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_select_all"
		}"
		end

	gtk_file_chooser_select_file (a_chooser: POINTER; a_file: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_file_chooser_select_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_select_file"
		}"
		end

	gtk_file_chooser_select_filename (a_chooser: POINTER; a_filename: POINTER): INTEGER is
 		-- gtk_file_chooser_select_filename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_select_filename"
		}"
		end

	gtk_file_chooser_select_uri (a_chooser: POINTER; an_uri: POINTER): INTEGER is
 		-- gtk_file_chooser_select_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_select_uri"
		}"
		end

	gtk_file_chooser_set_action (a_chooser: POINTER; an_action: INTEGER) is
 		-- gtk_file_chooser_set_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_action"
		}"
		end

	gtk_file_chooser_set_create_folders (a_chooser: POINTER; a_create_folders: INTEGER) is
 		-- gtk_file_chooser_set_create_folders
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_create_folders"
		}"
		end

	gtk_file_chooser_set_current_folder (a_chooser: POINTER; a_filename: POINTER): INTEGER is
 		-- gtk_file_chooser_set_current_folder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_current_folder"
		}"
		end

	gtk_file_chooser_set_current_folder_file (a_chooser: POINTER; a_file: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_file_chooser_set_current_folder_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_current_folder_file"
		}"
		end

	gtk_file_chooser_set_current_folder_uri (a_chooser: POINTER; an_uri: POINTER): INTEGER is
 		-- gtk_file_chooser_set_current_folder_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_current_folder_uri"
		}"
		end

	gtk_file_chooser_set_current_name (a_chooser: POINTER; a_name: POINTER) is
 		-- gtk_file_chooser_set_current_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_current_name"
		}"
		end

	gtk_file_chooser_set_do_overwrite_confirmation (a_chooser: POINTER; a_do_overwrite_confirmation: INTEGER) is
 		-- gtk_file_chooser_set_do_overwrite_confirmation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_do_overwrite_confirmation"
		}"
		end

	gtk_file_chooser_set_extra_widget (a_chooser: POINTER; an_extra_widget: POINTER) is
 		-- gtk_file_chooser_set_extra_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_extra_widget"
		}"
		end

	gtk_file_chooser_set_file (a_chooser: POINTER; a_file: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_file_chooser_set_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_file"
		}"
		end

	gtk_file_chooser_set_filename (a_chooser: POINTER; a_filename: POINTER): INTEGER is
 		-- gtk_file_chooser_set_filename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_filename"
		}"
		end

	gtk_file_chooser_set_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_file_chooser_set_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_filter"
		}"
		end

	gtk_file_chooser_set_local_only (a_chooser: POINTER; a_local_only: INTEGER) is
 		-- gtk_file_chooser_set_local_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_local_only"
		}"
		end

	gtk_file_chooser_set_preview_widget (a_chooser: POINTER; a_preview_widget: POINTER) is
 		-- gtk_file_chooser_set_preview_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_preview_widget"
		}"
		end

	gtk_file_chooser_set_preview_widget_active (a_chooser: POINTER; an_active: INTEGER) is
 		-- gtk_file_chooser_set_preview_widget_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_preview_widget_active"
		}"
		end

	gtk_file_chooser_set_select_multiple (a_chooser: POINTER; a_select_multiple: INTEGER) is
 		-- gtk_file_chooser_set_select_multiple
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_select_multiple"
		}"
		end

	gtk_file_chooser_set_show_hidden (a_chooser: POINTER; a_show_hidden: INTEGER) is
 		-- gtk_file_chooser_set_show_hidden
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_show_hidden"
		}"
		end

	gtk_file_chooser_set_uri (a_chooser: POINTER; an_uri: POINTER): INTEGER is
 		-- gtk_file_chooser_set_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_uri"
		}"
		end

	gtk_file_chooser_set_use_preview_label (a_chooser: POINTER; an_use_label: INTEGER) is
 		-- gtk_file_chooser_set_use_preview_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_use_preview_label"
		}"
		end

	gtk_file_chooser_unselect_all (a_chooser: POINTER) is
 		-- gtk_file_chooser_unselect_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_unselect_all"
		}"
		end

	gtk_file_chooser_unselect_file (a_chooser: POINTER; a_file: POINTER) is
 		-- gtk_file_chooser_unselect_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_unselect_file"
		}"
		end

	gtk_file_chooser_unselect_filename (a_chooser: POINTER; a_filename: POINTER) is
 		-- gtk_file_chooser_unselect_filename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_unselect_filename"
		}"
		end

	gtk_file_chooser_unselect_uri (a_chooser: POINTER; an_uri: POINTER) is
 		-- gtk_file_chooser_unselect_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_unselect_uri"
		}"
		end


end -- class GTKFILECHOOSER_EXTERNALS
