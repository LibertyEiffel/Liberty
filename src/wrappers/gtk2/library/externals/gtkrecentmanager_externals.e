-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTMANAGER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_info_get_uri (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_uri (node at line 444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_uri"
		}"
		end

	gtk_recent_info_get_short_name (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_short_name (node at line 872)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_short_name"
		}"
		end

	gtk_recent_manager_add_full (a_manager: POINTER; an_uri: POINTER; a_recent_data: POINTER): INTEGER_32 is
 		-- gtk_recent_manager_add_full (node at line 1422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_add_full"
		}"
		end

	gtk_recent_manager_get_limit (a_manager: POINTER): INTEGER_32 is
 		-- gtk_recent_manager_get_limit (node at line 1671)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_get_limit"
		}"
		end

	gtk_recent_manager_get_type: NATURAL_64 is
 		-- gtk_recent_manager_get_type (node at line 2031)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_get_type()"
		}"
		end

	gtk_recent_info_get_mime_type (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_mime_type (node at line 2668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_mime_type"
		}"
		end

	gtk_recent_info_get_icon (an_info: POINTER; a_size: INTEGER_32): POINTER is
 		-- gtk_recent_info_get_icon (node at line 3230)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_icon"
		}"
		end

	gtk_recent_info_ref (an_info: POINTER): POINTER is
 		-- gtk_recent_info_ref (node at line 3441)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_ref"
		}"
		end

	gtk_recent_info_get_private_hint (an_info: POINTER): INTEGER_32 is
 		-- gtk_recent_info_get_private_hint (node at line 4554)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_private_hint"
		}"
		end

	gtk_recent_info_get_added (an_info: POINTER): INTEGER_64 is
 		-- gtk_recent_info_get_added (node at line 7302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_added"
		}"
		end

	gtk_recent_manager_get_items (a_manager: POINTER): POINTER is
 		-- gtk_recent_manager_get_items (node at line 7356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_get_items"
		}"
		end

	gtk_recent_info_get_display_name (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_display_name (node at line 8327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_display_name"
		}"
		end

	gtk_recent_manager_get_default: POINTER is
 		-- gtk_recent_manager_get_default (node at line 8515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_get_default()"
		}"
		end

	gtk_recent_manager_new: POINTER is
 		-- gtk_recent_manager_new (node at line 10696)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_new()"
		}"
		end

	gtk_recent_manager_purge_items (a_manager: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_recent_manager_purge_items (node at line 11454)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_purge_items"
		}"
		end

	gtk_recent_info_has_application (an_info: POINTER; an_app_name: POINTER): INTEGER_32 is
 		-- gtk_recent_info_has_application (node at line 11513)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_has_application"
		}"
		end

	gtk_recent_manager_remove_item (a_manager: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_recent_manager_remove_item (node at line 14189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_remove_item"
		}"
		end

	gtk_recent_info_get_age (an_info: POINTER): INTEGER_32 is
 		-- gtk_recent_info_get_age (node at line 14746)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_age"
		}"
		end

	gtk_recent_info_get_applications (an_info: POINTER; a_length: POINTER): POINTER is
 		-- gtk_recent_info_get_applications (node at line 17257)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_applications"
		}"
		end

	gtk_recent_manager_has_item (a_manager: POINTER; an_uri: POINTER): INTEGER_32 is
 		-- gtk_recent_manager_has_item (node at line 17651)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_has_item"
		}"
		end

	gtk_recent_info_match (an_info_a: POINTER; an_info_b: POINTER): INTEGER_32 is
 		-- gtk_recent_info_match (node at line 17668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_match"
		}"
		end

	gtk_recent_info_get_application_info (an_info: POINTER; an_app_name: POINTER; an_app_exec: POINTER; a_count: POINTER; a_time: POINTER): INTEGER_32 is
 		-- gtk_recent_info_get_application_info (node at line 17798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_application_info"
		}"
		end

	gtk_recent_manager_add_item (a_manager: POINTER; an_uri: POINTER): INTEGER_32 is
 		-- gtk_recent_manager_add_item (node at line 18378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_add_item"
		}"
		end

	gtk_recent_manager_move_item (a_manager: POINTER; an_uri: POINTER; a_new_uri: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_recent_manager_move_item (node at line 18888)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_move_item"
		}"
		end

	gtk_recent_info_exists (an_info: POINTER): INTEGER_32 is
 		-- gtk_recent_info_exists (node at line 19556)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_exists"
		}"
		end

	gtk_recent_info_get_groups (an_info: POINTER; a_length: POINTER): POINTER is
 		-- gtk_recent_info_get_groups (node at line 22727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_groups"
		}"
		end

	gtk_recent_manager_error_quark: NATURAL_32 is
 		-- gtk_recent_manager_error_quark (node at line 22811)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_error_quark()"
		}"
		end

	gtk_recent_info_get_visited (an_info: POINTER): INTEGER_64 is
 		-- gtk_recent_info_get_visited (node at line 23469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_visited"
		}"
		end

	gtk_recent_manager_lookup_item (a_manager: POINTER; an_uri: POINTER; an_error: POINTER): POINTER is
 		-- gtk_recent_manager_lookup_item (node at line 28133)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_lookup_item"
		}"
		end

	gtk_recent_info_get_modified (an_info: POINTER): INTEGER_64 is
 		-- gtk_recent_info_get_modified (node at line 31515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_modified"
		}"
		end

	gtk_recent_info_is_local (an_info: POINTER): INTEGER_32 is
 		-- gtk_recent_info_is_local (node at line 32583)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_is_local"
		}"
		end

	gtk_recent_info_unref (an_info: POINTER) is
 		-- gtk_recent_info_unref (node at line 33311)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_unref"
		}"
		end

	gtk_recent_info_get_description (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_description (node at line 33552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_description"
		}"
		end

	gtk_recent_info_has_group (an_info: POINTER; a_group_name: POINTER): INTEGER_32 is
 		-- gtk_recent_info_has_group (node at line 34819)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_has_group"
		}"
		end

	gtk_recent_manager_set_limit (a_manager: POINTER; a_limit: INTEGER_32) is
 		-- gtk_recent_manager_set_limit (node at line 36871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_set_limit"
		}"
		end

	gtk_recent_info_get_type: NATURAL_64 is
 		-- gtk_recent_info_get_type (node at line 37408)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_type()"
		}"
		end

	gtk_recent_info_get_uri_display (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_uri_display (node at line 37934)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_uri_display"
		}"
		end

	gtk_recent_info_last_application (an_info: POINTER): POINTER is
 		-- gtk_recent_info_last_application (node at line 38755)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_last_application"
		}"
		end

	-- `hidden' function _gtk_recent_manager_sync skipped.

end -- class GTKRECENTMANAGER_EXTERNALS
