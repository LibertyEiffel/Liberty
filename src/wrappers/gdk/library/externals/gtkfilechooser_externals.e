-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILECHOOSER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_file_chooser_select_all (a_chooser: POINTER) is
 		-- gtk_file_chooser_select_all (node at line 24)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_select_all"
		}"
		end

	gtk_file_chooser_get_action (a_chooser: POINTER): INTEGER is
 		-- gtk_file_chooser_get_action (node at line 152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_action"
		}"
		end

	gtk_file_chooser_get_type: NATURAL_32 is
 		-- gtk_file_chooser_get_type (node at line 727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_type()"
		}"
		end

	gtk_file_chooser_select_filename (a_chooser: POINTER; a_filename: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_select_filename (node at line 999)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_select_filename"
		}"
		end

	gtk_file_chooser_remove_shortcut_folder_uri (a_chooser: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_remove_shortcut_folder_uri (node at line 2258)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_remove_shortcut_folder_uri"
		}"
		end

	gtk_file_chooser_set_preview_widget (a_chooser: POINTER; a_preview_widget: POINTER) is
 		-- gtk_file_chooser_set_preview_widget (node at line 2682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_preview_widget"
		}"
		end

	gtk_file_chooser_get_create_folders (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_get_create_folders (node at line 4302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_create_folders"
		}"
		end

	gtk_file_chooser_get_preview_file (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_preview_file (node at line 5048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_preview_file"
		}"
		end

	gtk_file_chooser_set_file (a_chooser: POINTER; a_file: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_set_file (node at line 5101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_file"
		}"
		end

	gtk_file_chooser_get_uris (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_uris (node at line 5145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_uris"
		}"
		end

	gtk_file_chooser_unselect_uri (a_chooser: POINTER; an_uri: POINTER) is
 		-- gtk_file_chooser_unselect_uri (node at line 5838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_unselect_uri"
		}"
		end

	gtk_file_chooser_get_local_only (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_get_local_only (node at line 6076)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_local_only"
		}"
		end

	gtk_file_chooser_add_shortcut_folder (a_chooser: POINTER; a_folder: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_add_shortcut_folder (node at line 7427)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_add_shortcut_folder"
		}"
		end

	gtk_file_chooser_set_uri (a_chooser: POINTER; an_uri: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_set_uri (node at line 7786)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_uri"
		}"
		end

	gtk_file_chooser_add_shortcut_folder_uri (a_chooser: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_add_shortcut_folder_uri (node at line 9659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_add_shortcut_folder_uri"
		}"
		end

	gtk_file_chooser_set_local_only (a_chooser: POINTER; a_local_only: INTEGER_32) is
 		-- gtk_file_chooser_set_local_only (node at line 11935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_local_only"
		}"
		end

	gtk_file_chooser_get_filter (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_filter (node at line 12113)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_filter"
		}"
		end

	gtk_file_chooser_set_create_folders (a_chooser: POINTER; a_create_folders: INTEGER_32) is
 		-- gtk_file_chooser_set_create_folders (node at line 12996)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_create_folders"
		}"
		end

	gtk_file_chooser_set_show_hidden (a_chooser: POINTER; a_show_hidden: INTEGER_32) is
 		-- gtk_file_chooser_set_show_hidden (node at line 14287)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_show_hidden"
		}"
		end

	gtk_file_chooser_list_shortcut_folder_uris (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_list_shortcut_folder_uris (node at line 14337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_list_shortcut_folder_uris"
		}"
		end

	gtk_file_chooser_add_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_file_chooser_add_filter (node at line 14632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_add_filter"
		}"
		end

	gtk_file_chooser_select_uri (a_chooser: POINTER; an_uri: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_select_uri (node at line 15240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_select_uri"
		}"
		end

	gtk_file_chooser_list_filters (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_list_filters (node at line 18069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_list_filters"
		}"
		end

	gtk_file_chooser_get_do_overwrite_confirmation (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_get_do_overwrite_confirmation (node at line 20048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_do_overwrite_confirmation"
		}"
		end

	gtk_file_chooser_get_current_folder_file (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_current_folder_file (node at line 21207)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_current_folder_file"
		}"
		end

	gtk_file_chooser_set_filename (a_chooser: POINTER; a_filename: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_set_filename (node at line 21229)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_filename"
		}"
		end

	gtk_file_chooser_set_extra_widget (a_chooser: POINTER; an_extra_widget: POINTER) is
 		-- gtk_file_chooser_set_extra_widget (node at line 21828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_extra_widget"
		}"
		end

	gtk_file_chooser_list_shortcut_folders (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_list_shortcut_folders (node at line 22167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_list_shortcut_folders"
		}"
		end

	gtk_file_chooser_get_filename (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_filename (node at line 22275)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_filename"
		}"
		end

	gtk_file_chooser_set_action (a_chooser: POINTER; an_action: INTEGER) is
 		-- gtk_file_chooser_set_action (node at line 22926)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_action"
		}"
		end

	gtk_file_chooser_remove_shortcut_folder (a_chooser: POINTER; a_folder: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_remove_shortcut_folder (node at line 23444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_remove_shortcut_folder"
		}"
		end

	gtk_file_chooser_get_preview_uri (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_preview_uri (node at line 24024)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_preview_uri"
		}"
		end

	gtk_file_chooser_get_current_folder (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_current_folder (node at line 24258)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_current_folder"
		}"
		end

	gtk_file_chooser_unselect_all (a_chooser: POINTER) is
 		-- gtk_file_chooser_unselect_all (node at line 24295)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_unselect_all"
		}"
		end

	gtk_file_chooser_get_preview_filename (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_preview_filename (node at line 25613)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_preview_filename"
		}"
		end

	gtk_file_chooser_get_file (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_file (node at line 25655)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_file"
		}"
		end

	gtk_file_chooser_get_extra_widget (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_extra_widget (node at line 25961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_extra_widget"
		}"
		end

	gtk_file_chooser_get_current_folder_uri (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_current_folder_uri (node at line 25983)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_current_folder_uri"
		}"
		end

	gtk_file_chooser_get_show_hidden (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_get_show_hidden (node at line 26955)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_show_hidden"
		}"
		end

	gtk_file_chooser_set_current_folder (a_chooser: POINTER; a_filename: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_set_current_folder (node at line 27034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_current_folder"
		}"
		end

	gtk_file_chooser_get_uri (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_uri (node at line 27789)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_uri"
		}"
		end

	gtk_file_chooser_set_current_folder_uri (a_chooser: POINTER; an_uri: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_set_current_folder_uri (node at line 28226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_current_folder_uri"
		}"
		end

	gtk_file_chooser_get_files (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_files (node at line 28366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_files"
		}"
		end

	gtk_file_chooser_set_preview_widget_active (a_chooser: POINTER; an_active: INTEGER_32) is
 		-- gtk_file_chooser_set_preview_widget_active (node at line 28503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_preview_widget_active"
		}"
		end

	gtk_file_chooser_select_file (a_chooser: POINTER; a_file: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_select_file (node at line 29143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_select_file"
		}"
		end

	gtk_file_chooser_unselect_file (a_chooser: POINTER; a_file: POINTER) is
 		-- gtk_file_chooser_unselect_file (node at line 30245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_unselect_file"
		}"
		end

	gtk_file_chooser_set_current_folder_file (a_chooser: POINTER; a_file: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_set_current_folder_file (node at line 31144)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_current_folder_file"
		}"
		end

	gtk_file_chooser_get_use_preview_label (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_get_use_preview_label (node at line 31996)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_use_preview_label"
		}"
		end

	gtk_file_chooser_get_preview_widget (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_preview_widget (node at line 32245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_preview_widget"
		}"
		end

	gtk_file_chooser_get_select_multiple (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_get_select_multiple (node at line 32447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_select_multiple"
		}"
		end

	gtk_file_chooser_unselect_filename (a_chooser: POINTER; a_filename: POINTER) is
 		-- gtk_file_chooser_unselect_filename (node at line 32679)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_unselect_filename"
		}"
		end

	gtk_file_chooser_set_select_multiple (a_chooser: POINTER; a_select_multiple: INTEGER_32) is
 		-- gtk_file_chooser_set_select_multiple (node at line 33367)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_select_multiple"
		}"
		end

	gtk_file_chooser_set_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_file_chooser_set_filter (node at line 33527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_filter"
		}"
		end

	gtk_file_chooser_set_do_overwrite_confirmation (a_chooser: POINTER; a_do_overwrite_confirmation: INTEGER_32) is
 		-- gtk_file_chooser_set_do_overwrite_confirmation (node at line 34526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_do_overwrite_confirmation"
		}"
		end

	gtk_file_chooser_set_current_name (a_chooser: POINTER; a_name: POINTER) is
 		-- gtk_file_chooser_set_current_name (node at line 35041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_current_name"
		}"
		end

	gtk_file_chooser_set_use_preview_label (a_chooser: POINTER; an_use_label: INTEGER_32) is
 		-- gtk_file_chooser_set_use_preview_label (node at line 36049)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_set_use_preview_label"
		}"
		end

	gtk_file_chooser_get_filenames (a_chooser: POINTER): POINTER is
 		-- gtk_file_chooser_get_filenames (node at line 36638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_filenames"
		}"
		end

	gtk_file_chooser_get_preview_widget_active (a_chooser: POINTER): INTEGER_32 is
 		-- gtk_file_chooser_get_preview_widget_active (node at line 36947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_get_preview_widget_active"
		}"
		end

	gtk_file_chooser_remove_filter (a_chooser: POINTER; a_filter: POINTER) is
 		-- gtk_file_chooser_remove_filter (node at line 37044)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_remove_filter"
		}"
		end

	gtk_file_chooser_error_quark: NATURAL_32 is
 		-- gtk_file_chooser_error_quark (node at line 37133)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_chooser_error_quark()"
		}"
		end


end -- class GTKFILECHOOSER_EXTERNALS
