-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GBOOKMARKFILE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_bookmark_file_add_application (a_bookmark: POINTER; an_uri: POINTER; a_name: POINTER; an_exec: POINTER) 
               -- g_bookmark_file_add_application
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_add_application"
               }"
               end

	g_bookmark_file_add_group (a_bookmark: POINTER; an_uri: POINTER; a_group: POINTER) 
               -- g_bookmark_file_add_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_add_group"
               }"
               end

	g_bookmark_file_error_quark: NATURAL 
               -- g_bookmark_file_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_error_quark"
               }"
               end

	g_bookmark_file_free (a_bookmark: POINTER) 
               -- g_bookmark_file_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_free"
               }"
               end

	g_bookmark_file_get_added (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): like long 
               -- g_bookmark_file_get_added
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_added"
               }"
               end

	g_bookmark_file_get_app_info (a_bookmark: POINTER; an_uri: POINTER; a_name: POINTER; an_exec: POINTER; a_count: POINTER; a_stamp: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_get_app_info
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_app_info"
               }"
               end

	g_bookmark_file_get_applications (a_bookmark: POINTER; an_uri: POINTER; a_length: POINTER; an_error: POINTER): POINTER 
               -- g_bookmark_file_get_applications
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_applications"
               }"
               end

	g_bookmark_file_get_description (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): POINTER 
               -- g_bookmark_file_get_description
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_description"
               }"
               end

	g_bookmark_file_get_groups (a_bookmark: POINTER; an_uri: POINTER; a_length: POINTER; an_error: POINTER): POINTER 
               -- g_bookmark_file_get_groups
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_groups"
               }"
               end

	g_bookmark_file_get_icon (a_bookmark: POINTER; an_uri: POINTER; a_href: POINTER; a_mime_type: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_get_icon
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_icon"
               }"
               end

	g_bookmark_file_get_is_private (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_get_is_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_is_private"
               }"
               end

	g_bookmark_file_get_mime_type (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): POINTER 
               -- g_bookmark_file_get_mime_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_mime_type"
               }"
               end

	g_bookmark_file_get_modified (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): like long 
               -- g_bookmark_file_get_modified
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_modified"
               }"
               end

	g_bookmark_file_get_size (a_bookmark: POINTER): INTEGER 
               -- g_bookmark_file_get_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_size"
               }"
               end

	g_bookmark_file_get_title (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): POINTER 
               -- g_bookmark_file_get_title
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_title"
               }"
               end

	g_bookmark_file_get_uris (a_bookmark: POINTER; a_length: POINTER): POINTER 
               -- g_bookmark_file_get_uris
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_uris"
               }"
               end

	g_bookmark_file_get_visited (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): like long 
               -- g_bookmark_file_get_visited
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_get_visited"
               }"
               end

	g_bookmark_file_has_application (a_bookmark: POINTER; an_uri: POINTER; a_name: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_has_application
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_has_application"
               }"
               end

	g_bookmark_file_has_group (a_bookmark: POINTER; an_uri: POINTER; a_group: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_has_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_has_group"
               }"
               end

	g_bookmark_file_has_item (a_bookmark: POINTER; an_uri: POINTER): INTEGER 
               -- g_bookmark_file_has_item
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_has_item"
               }"
               end

	g_bookmark_file_load_from_data (a_bookmark: POINTER; a_data: POINTER; a_length: like long_unsigned; an_error: POINTER): INTEGER 
               -- g_bookmark_file_load_from_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_load_from_data"
               }"
               end

	g_bookmark_file_load_from_data_dirs (a_bookmark: POINTER; a_file: POINTER; a_full_path: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_load_from_data_dirs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_load_from_data_dirs"
               }"
               end

	g_bookmark_file_load_from_file (a_bookmark: POINTER; a_filename: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_load_from_file
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_load_from_file"
               }"
               end

	g_bookmark_file_move_item (a_bookmark: POINTER; an_old_uri: POINTER; a_new_uri: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_move_item
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_move_item"
               }"
               end

	g_bookmark_file_new: POINTER 
               -- g_bookmark_file_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_new"
               }"
               end

	g_bookmark_file_remove_application (a_bookmark: POINTER; an_uri: POINTER; a_name: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_remove_application
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_remove_application"
               }"
               end

	g_bookmark_file_remove_group (a_bookmark: POINTER; an_uri: POINTER; a_group: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_remove_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_remove_group"
               }"
               end

	g_bookmark_file_remove_item (a_bookmark: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_remove_item
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_remove_item"
               }"
               end

	g_bookmark_file_set_added (a_bookmark: POINTER; an_uri: POINTER; an_added: like long) 
               -- g_bookmark_file_set_added
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_set_added"
               }"
               end

	g_bookmark_file_set_app_info (a_bookmark: POINTER; an_uri: POINTER; a_name: POINTER; an_exec: POINTER; a_count: INTEGER; a_stamp: like long; an_error: POINTER): INTEGER 
               -- g_bookmark_file_set_app_info
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_set_app_info"
               }"
               end

	g_bookmark_file_set_description (a_bookmark: POINTER; an_uri: POINTER; a_description: POINTER) 
               -- g_bookmark_file_set_description
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_set_description"
               }"
               end

	g_bookmark_file_set_groups (a_bookmark: POINTER; an_uri: POINTER; a_groups: POINTER; a_length: like long_unsigned) 
               -- g_bookmark_file_set_groups
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_set_groups"
               }"
               end

	g_bookmark_file_set_icon (a_bookmark: POINTER; an_uri: POINTER; a_href: POINTER; a_mime_type: POINTER) 
               -- g_bookmark_file_set_icon
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_set_icon"
               }"
               end

	g_bookmark_file_set_is_private (a_bookmark: POINTER; an_uri: POINTER; an_is_private: INTEGER) 
               -- g_bookmark_file_set_is_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_set_is_private"
               }"
               end

	g_bookmark_file_set_mime_type (a_bookmark: POINTER; an_uri: POINTER; a_mime_type: POINTER) 
               -- g_bookmark_file_set_mime_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_set_mime_type"
               }"
               end

	g_bookmark_file_set_modified (a_bookmark: POINTER; an_uri: POINTER; a_modified: like long) 
               -- g_bookmark_file_set_modified
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_set_modified"
               }"
               end

	g_bookmark_file_set_title (a_bookmark: POINTER; an_uri: POINTER; a_title: POINTER) 
               -- g_bookmark_file_set_title
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_set_title"
               }"
               end

	g_bookmark_file_set_visited (a_bookmark: POINTER; an_uri: POINTER; a_visited: like long) 
               -- g_bookmark_file_set_visited
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_set_visited"
               }"
               end

	g_bookmark_file_to_data (a_bookmark: POINTER; a_length: POINTER; an_error: POINTER): POINTER 
               -- g_bookmark_file_to_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_to_data"
               }"
               end

	g_bookmark_file_to_file (a_bookmark: POINTER; a_filename: POINTER; an_error: POINTER): INTEGER 
               -- g_bookmark_file_to_file
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bookmark_file_to_file"
               }"
               end


end -- class GBOOKMARKFILE_EXTERNALS
