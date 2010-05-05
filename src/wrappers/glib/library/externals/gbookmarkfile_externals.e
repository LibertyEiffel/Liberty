-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GBOOKMARKFILE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_bookmark_file_get_title (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): POINTER is
 		-- g_bookmark_file_get_title (node at line 302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_title"
		}"
		end

	g_bookmark_file_set_is_private (a_bookmark: POINTER; an_uri: POINTER; an_is_private: INTEGER_32) is
 		-- g_bookmark_file_set_is_private (node at line 474)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_set_is_private"
		}"
		end

	g_bookmark_file_get_applications (a_bookmark: POINTER; an_uri: POINTER; a_length: POINTER; an_error: POINTER): POINTER is
 		-- g_bookmark_file_get_applications (node at line 559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_applications"
		}"
		end

	g_bookmark_file_get_description (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): POINTER is
 		-- g_bookmark_file_get_description (node at line 578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_description"
		}"
		end

	g_bookmark_file_has_group (a_bookmark: POINTER; an_uri: POINTER; a_group: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_has_group (node at line 694)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_has_group"
		}"
		end

	g_bookmark_file_to_data (a_bookmark: POINTER; a_length: POINTER; an_error: POINTER): POINTER is
 		-- g_bookmark_file_to_data (node at line 1084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_to_data"
		}"
		end

	g_bookmark_file_add_application (a_bookmark: POINTER; an_uri: POINTER; a_name: POINTER; an_exec: POINTER) is
 		-- g_bookmark_file_add_application (node at line 1103)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_add_application"
		}"
		end

	g_bookmark_file_set_title (a_bookmark: POINTER; an_uri: POINTER; a_title: POINTER) is
 		-- g_bookmark_file_set_title (node at line 1406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_set_title"
		}"
		end

	g_bookmark_file_set_app_info (a_bookmark: POINTER; an_uri: POINTER; a_name: POINTER; an_exec: POINTER; a_count: INTEGER_32; a_stamp: INTEGER_32; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_set_app_info (node at line 1593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_set_app_info"
		}"
		end

	g_bookmark_file_set_description (a_bookmark: POINTER; an_uri: POINTER; a_description: POINTER) is
 		-- g_bookmark_file_set_description (node at line 1735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_set_description"
		}"
		end

	g_bookmark_file_to_file (a_bookmark: POINTER; a_filename: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_to_file (node at line 2095)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_to_file"
		}"
		end

	g_bookmark_file_get_modified (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_get_modified (node at line 2152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_modified"
		}"
		end

	g_bookmark_file_get_app_info (a_bookmark: POINTER; an_uri: POINTER; a_name: POINTER; an_exec: POINTER; a_count: POINTER; a_stamp: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_get_app_info (node at line 2324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_app_info"
		}"
		end

	g_bookmark_file_set_added (a_bookmark: POINTER; an_uri: POINTER; an_added: INTEGER_32) is
 		-- g_bookmark_file_set_added (node at line 2735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_set_added"
		}"
		end

	g_bookmark_file_get_icon (a_bookmark: POINTER; an_uri: POINTER; a_href: POINTER; a_mime_type: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_get_icon (node at line 3024)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_icon"
		}"
		end

	g_bookmark_file_has_item (a_bookmark: POINTER; an_uri: POINTER): INTEGER_32 is
 		-- g_bookmark_file_has_item (node at line 3048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_has_item"
		}"
		end

	g_bookmark_file_get_added (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_get_added (node at line 3233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_added"
		}"
		end

	g_bookmark_file_free (a_bookmark: POINTER) is
 		-- g_bookmark_file_free (node at line 3290)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_free"
		}"
		end

	g_bookmark_file_remove_item (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_remove_item (node at line 3308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_remove_item"
		}"
		end

	g_bookmark_file_get_groups (a_bookmark: POINTER; an_uri: POINTER; a_length: POINTER; an_error: POINTER): POINTER is
 		-- g_bookmark_file_get_groups (node at line 3313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_groups"
		}"
		end

	g_bookmark_file_get_is_private (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_get_is_private (node at line 3386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_is_private"
		}"
		end

	g_bookmark_file_set_mime_type (a_bookmark: POINTER; an_uri: POINTER; a_mime_type: POINTER) is
 		-- g_bookmark_file_set_mime_type (node at line 3619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_set_mime_type"
		}"
		end

	g_bookmark_file_error_quark: NATURAL_32 is
 		-- g_bookmark_file_error_quark (node at line 3875)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_error_quark()"
		}"
		end

	g_bookmark_file_get_visited (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_get_visited (node at line 4275)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_visited"
		}"
		end

	g_bookmark_file_set_modified (a_bookmark: POINTER; an_uri: POINTER; a_modified: INTEGER_32) is
 		-- g_bookmark_file_set_modified (node at line 4427)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_set_modified"
		}"
		end

	g_bookmark_file_load_from_file (a_bookmark: POINTER; a_filename: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_load_from_file (node at line 4517)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_load_from_file"
		}"
		end

	g_bookmark_file_get_mime_type (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): POINTER is
 		-- g_bookmark_file_get_mime_type (node at line 4535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_mime_type"
		}"
		end

	g_bookmark_file_has_application (a_bookmark: POINTER; an_uri: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_has_application (node at line 5179)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_has_application"
		}"
		end

	g_bookmark_file_load_from_data (a_bookmark: POINTER; a_data: POINTER; a_length: NATURAL_32; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_load_from_data (node at line 5277)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_load_from_data"
		}"
		end

	g_bookmark_file_set_groups (a_bookmark: POINTER; an_uri: POINTER; a_groups: POINTER; a_length: NATURAL_32) is
 		-- g_bookmark_file_set_groups (node at line 5685)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_set_groups"
		}"
		end

	g_bookmark_file_load_from_data_dirs (a_bookmark: POINTER; a_file: POINTER; a_full_path: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_load_from_data_dirs (node at line 5758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_load_from_data_dirs"
		}"
		end

	g_bookmark_file_set_visited (a_bookmark: POINTER; an_uri: POINTER; a_visited: INTEGER_32) is
 		-- g_bookmark_file_set_visited (node at line 5889)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_set_visited"
		}"
		end

	g_bookmark_file_remove_group (a_bookmark: POINTER; an_uri: POINTER; a_group: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_remove_group (node at line 5964)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_remove_group"
		}"
		end

	g_bookmark_file_set_icon (a_bookmark: POINTER; an_uri: POINTER; a_href: POINTER; a_mime_type: POINTER) is
 		-- g_bookmark_file_set_icon (node at line 6017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_set_icon"
		}"
		end

	g_bookmark_file_get_uris (a_bookmark: POINTER; a_length: POINTER): POINTER is
 		-- g_bookmark_file_get_uris (node at line 6408)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_uris"
		}"
		end

	g_bookmark_file_remove_application (a_bookmark: POINTER; an_uri: POINTER; a_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_remove_application (node at line 6412)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_remove_application"
		}"
		end

	g_bookmark_file_get_size (a_bookmark: POINTER): INTEGER_32 is
 		-- g_bookmark_file_get_size (node at line 6475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_get_size"
		}"
		end

	g_bookmark_file_move_item (a_bookmark: POINTER; an_old_uri: POINTER; a_new_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_bookmark_file_move_item (node at line 6874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_move_item"
		}"
		end

	g_bookmark_file_new: POINTER is
 		-- g_bookmark_file_new (node at line 6896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_new()"
		}"
		end

	g_bookmark_file_add_group (a_bookmark: POINTER; an_uri: POINTER; a_group: POINTER) is
 		-- g_bookmark_file_add_group (node at line 6929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bookmark_file_add_group"
		}"
		end


end -- class GBOOKMARKFILE_EXTERNALS
