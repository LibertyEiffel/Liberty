-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKUIMANAGER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_ui_manager_ensure_update (a_self: POINTER) is
 		-- gtk_ui_manager_ensure_update (node at line 2756)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_ensure_update"
		}"
		end

	gtk_ui_manager_remove_ui (a_self: POINTER; a_merge_id: NATURAL_32) is
 		-- gtk_ui_manager_remove_ui (node at line 5946)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_remove_ui"
		}"
		end

	gtk_ui_manager_remove_action_group (a_self: POINTER; an_action_group: POINTER) is
 		-- gtk_ui_manager_remove_action_group (node at line 6258)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_remove_action_group"
		}"
		end

	gtk_ui_manager_add_ui_from_file (a_self: POINTER; a_filename: POINTER; an_error: POINTER): NATURAL_32 is
 		-- gtk_ui_manager_add_ui_from_file (node at line 7919)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_add_ui_from_file"
		}"
		end

	gtk_ui_manager_get_ui (a_self: POINTER): POINTER is
 		-- gtk_ui_manager_get_ui (node at line 9090)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_ui"
		}"
		end

	gtk_ui_manager_insert_action_group (a_self: POINTER; an_action_group: POINTER; a_pos: INTEGER_32) is
 		-- gtk_ui_manager_insert_action_group (node at line 10068)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_insert_action_group"
		}"
		end

	gtk_ui_manager_add_ui (a_self: POINTER; a_merge_id: NATURAL_32; a_path: POINTER; a_name: POINTER; an_action: POINTER; a_type: INTEGER; a_top: INTEGER_32) is
 		-- gtk_ui_manager_add_ui (node at line 12480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_add_ui"
		}"
		end

	gtk_ui_manager_new: POINTER is
 		-- gtk_ui_manager_new (node at line 12854)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_new()"
		}"
		end

	gtk_ui_manager_add_ui_from_string (a_self: POINTER; a_buffer: POINTER; a_length: INTEGER_64; an_error: POINTER): NATURAL_32 is
 		-- gtk_ui_manager_add_ui_from_string (node at line 20575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_add_ui_from_string"
		}"
		end

	gtk_ui_manager_get_type: NATURAL_64 is
 		-- gtk_ui_manager_get_type (node at line 20705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_type()"
		}"
		end

	gtk_ui_manager_get_accel_group (a_self: POINTER): POINTER is
 		-- gtk_ui_manager_get_accel_group (node at line 22592)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_accel_group"
		}"
		end

	gtk_ui_manager_get_action (a_self: POINTER; a_path: POINTER): POINTER is
 		-- gtk_ui_manager_get_action (node at line 26654)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_action"
		}"
		end

	gtk_ui_manager_get_toplevels (a_self: POINTER; a_types: INTEGER): POINTER is
 		-- gtk_ui_manager_get_toplevels (node at line 27169)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_toplevels"
		}"
		end

	gtk_ui_manager_set_add_tearoffs (a_self: POINTER; an_add_tearoffs: INTEGER_32) is
 		-- gtk_ui_manager_set_add_tearoffs (node at line 35052)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_set_add_tearoffs"
		}"
		end

	gtk_ui_manager_new_merge_id (a_self: POINTER): NATURAL_32 is
 		-- gtk_ui_manager_new_merge_id (node at line 35755)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_new_merge_id"
		}"
		end

	gtk_ui_manager_get_action_groups (a_self: POINTER): POINTER is
 		-- gtk_ui_manager_get_action_groups (node at line 36648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_action_groups"
		}"
		end

	gtk_ui_manager_get_widget (a_self: POINTER; a_path: POINTER): POINTER is
 		-- gtk_ui_manager_get_widget (node at line 40279)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_widget"
		}"
		end

	gtk_ui_manager_get_add_tearoffs (a_self: POINTER): INTEGER_32 is
 		-- gtk_ui_manager_get_add_tearoffs (node at line 40489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_add_tearoffs"
		}"
		end


end -- class GTKUIMANAGER_EXTERNALS
