-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTMANAGER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_info_exists (an_info: POINTER): INTEGER is
 		-- gtk_recent_info_exists
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_exists"
		}"
		end

	gtk_recent_info_get_added (an_info: POINTER): like long is
 		-- gtk_recent_info_get_added
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_added"
		}"
		end

	gtk_recent_info_get_age (an_info: POINTER): INTEGER is
 		-- gtk_recent_info_get_age
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_age"
		}"
		end

	gtk_recent_info_get_application_info (an_info: POINTER; an_app_name: POINTER; an_app_exec: POINTER; a_count: POINTER; a_time: POINTER): INTEGER is
 		-- gtk_recent_info_get_application_info
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_application_info"
		}"
		end

	gtk_recent_info_get_applications (an_info: POINTER; a_length: POINTER): POINTER is
 		-- gtk_recent_info_get_applications
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_applications"
		}"
		end

	gtk_recent_info_get_description (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_description
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_description"
		}"
		end

	gtk_recent_info_get_display_name (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_display_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_display_name"
		}"
		end

	gtk_recent_info_get_groups (an_info: POINTER; a_length: POINTER): POINTER is
 		-- gtk_recent_info_get_groups
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_groups"
		}"
		end

	gtk_recent_info_get_icon (an_info: POINTER; a_size: INTEGER): POINTER is
 		-- gtk_recent_info_get_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_icon"
		}"
		end

	gtk_recent_info_get_mime_type (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_mime_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_mime_type"
		}"
		end

	gtk_recent_info_get_modified (an_info: POINTER): like long is
 		-- gtk_recent_info_get_modified
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_modified"
		}"
		end

	gtk_recent_info_get_private_hint (an_info: POINTER): INTEGER is
 		-- gtk_recent_info_get_private_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_private_hint"
		}"
		end

	gtk_recent_info_get_short_name (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_short_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_short_name"
		}"
		end

	gtk_recent_info_get_type: like long_unsigned is
 		-- gtk_recent_info_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_type()"
		}"
		end

	gtk_recent_info_get_uri (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_uri"
		}"
		end

	gtk_recent_info_get_uri_display (an_info: POINTER): POINTER is
 		-- gtk_recent_info_get_uri_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_uri_display"
		}"
		end

	gtk_recent_info_get_visited (an_info: POINTER): like long is
 		-- gtk_recent_info_get_visited
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_get_visited"
		}"
		end

	gtk_recent_info_has_application (an_info: POINTER; an_app_name: POINTER): INTEGER is
 		-- gtk_recent_info_has_application
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_has_application"
		}"
		end

	gtk_recent_info_has_group (an_info: POINTER; a_group_name: POINTER): INTEGER is
 		-- gtk_recent_info_has_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_has_group"
		}"
		end

	gtk_recent_info_is_local (an_info: POINTER): INTEGER is
 		-- gtk_recent_info_is_local
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_is_local"
		}"
		end

	gtk_recent_info_last_application (an_info: POINTER): POINTER is
 		-- gtk_recent_info_last_application
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_last_application"
		}"
		end

	gtk_recent_info_match (an_info_a: POINTER; an_info_b: POINTER): INTEGER is
 		-- gtk_recent_info_match
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_match"
		}"
		end

	gtk_recent_info_ref (an_info: POINTER): POINTER is
 		-- gtk_recent_info_ref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_ref"
		}"
		end

	gtk_recent_info_unref (an_info: POINTER) is
 		-- gtk_recent_info_unref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_info_unref"
		}"
		end

	gtk_recent_manager_add_full (a_manager: POINTER; an_uri: POINTER; a_recent_data: POINTER): INTEGER is
 		-- gtk_recent_manager_add_full
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_add_full"
		}"
		end

	gtk_recent_manager_add_item (a_manager: POINTER; an_uri: POINTER): INTEGER is
 		-- gtk_recent_manager_add_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_add_item"
		}"
		end

	gtk_recent_manager_error_quark: NATURAL is
 		-- gtk_recent_manager_error_quark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_error_quark()"
		}"
		end

	gtk_recent_manager_get_default: POINTER is
 		-- gtk_recent_manager_get_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_get_default()"
		}"
		end

	gtk_recent_manager_get_items (a_manager: POINTER): POINTER is
 		-- gtk_recent_manager_get_items
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_get_items"
		}"
		end

	gtk_recent_manager_get_limit (a_manager: POINTER): INTEGER is
 		-- gtk_recent_manager_get_limit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_get_limit"
		}"
		end

	gtk_recent_manager_get_type: like long_unsigned is
 		-- gtk_recent_manager_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_get_type()"
		}"
		end

	gtk_recent_manager_has_item (a_manager: POINTER; an_uri: POINTER): INTEGER is
 		-- gtk_recent_manager_has_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_has_item"
		}"
		end

	gtk_recent_manager_lookup_item (a_manager: POINTER; an_uri: POINTER; an_error: POINTER): POINTER is
 		-- gtk_recent_manager_lookup_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_lookup_item"
		}"
		end

	gtk_recent_manager_move_item (a_manager: POINTER; an_uri: POINTER; a_new_uri: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_recent_manager_move_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_move_item"
		}"
		end

	gtk_recent_manager_new: POINTER is
 		-- gtk_recent_manager_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_new()"
		}"
		end

	gtk_recent_manager_purge_items (a_manager: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_recent_manager_purge_items
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_purge_items"
		}"
		end

	gtk_recent_manager_remove_item (a_manager: POINTER; an_uri: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_recent_manager_remove_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_remove_item"
		}"
		end

	gtk_recent_manager_set_limit (a_manager: POINTER; a_limit: INTEGER) is
 		-- gtk_recent_manager_set_limit
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_manager_set_limit"
		}"
		end

	-- `hidden' function _gtk_recent_manager_sync skipped.

end -- class GTKRECENTMANAGER_EXTERNALS
