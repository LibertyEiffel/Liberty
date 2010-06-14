-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKUIMANAGER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_ui_manager_insert_action_group (a_self: POINTER; an_action_group: POINTER; a_pos: INTEGER_32) is
 		-- gtk_ui_manager_insert_action_group (node at line 167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_insert_action_group"
		}"
		end

	gtk_ui_manager_ensure_update (a_self: POINTER) is
 		-- gtk_ui_manager_ensure_update (node at line 2792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_ensure_update"
		}"
		end

	gtk_ui_manager_remove_ui (a_self: POINTER; a_merge_id: NATURAL_32) is
 		-- gtk_ui_manager_remove_ui (node at line 5668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_remove_ui"
		}"
		end

	gtk_ui_manager_remove_action_group (a_self: POINTER; an_action_group: POINTER) is
 		-- gtk_ui_manager_remove_action_group (node at line 5928)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_remove_action_group"
		}"
		end

	gtk_ui_manager_new: POINTER is
 		-- gtk_ui_manager_new (node at line 11812)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_new()"
		}"
		end

	gtk_ui_manager_get_ui (a_self: POINTER): POINTER is
 		-- gtk_ui_manager_get_ui (node at line 12043)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_ui"
		}"
		end

	gtk_ui_manager_add_ui_from_string (a_self: POINTER; a_buffer: POINTER; a_length: INTEGER_32; an_error: POINTER): NATURAL_32 is
 		-- gtk_ui_manager_add_ui_from_string (node at line 18849)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_add_ui_from_string"
		}"
		end

	gtk_ui_manager_get_type: NATURAL_32 is
 		-- gtk_ui_manager_get_type (node at line 18965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_type()"
		}"
		end

	gtk_ui_manager_get_toplevels (a_self: POINTER; a_types: INTEGER): POINTER is
 		-- gtk_ui_manager_get_toplevels (node at line 19081)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_toplevels"
		}"
		end

	gtk_ui_manager_get_accel_group (a_self: POINTER): POINTER is
 		-- gtk_ui_manager_get_accel_group (node at line 20486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_accel_group"
		}"
		end

	gtk_ui_manager_get_action (a_self: POINTER; a_path: POINTER): POINTER is
 		-- gtk_ui_manager_get_action (node at line 24130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_action"
		}"
		end

	gtk_ui_manager_get_action_groups (a_self: POINTER): POINTER is
 		-- gtk_ui_manager_get_action_groups (node at line 26441)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_action_groups"
		}"
		end

	gtk_ui_manager_add_ui (a_self: POINTER; a_merge_id: NATURAL_32; a_path: POINTER; a_name: POINTER; an_action: POINTER; a_type: INTEGER; a_top: INTEGER_32) is
 		-- gtk_ui_manager_add_ui (node at line 28378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_add_ui"
		}"
		end

	gtk_ui_manager_set_add_tearoffs (a_self: POINTER; an_add_tearoffs: INTEGER_32) is
 		-- gtk_ui_manager_set_add_tearoffs (node at line 31677)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_set_add_tearoffs"
		}"
		end

	gtk_ui_manager_new_merge_id (a_self: POINTER): NATURAL_32 is
 		-- gtk_ui_manager_new_merge_id (node at line 32376)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_new_merge_id"
		}"
		end

	gtk_ui_manager_add_ui_from_file (a_self: POINTER; a_filename: POINTER; an_error: POINTER): NATURAL_32 is
 		-- gtk_ui_manager_add_ui_from_file (node at line 32987)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_add_ui_from_file"
		}"
		end

	gtk_ui_manager_get_add_tearoffs (a_self: POINTER): INTEGER_32 is
 		-- gtk_ui_manager_get_add_tearoffs (node at line 35659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_add_tearoffs"
		}"
		end

	gtk_ui_manager_get_widget (a_self: POINTER; a_path: POINTER): POINTER is
 		-- gtk_ui_manager_get_widget (node at line 36611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_widget"
		}"
		end


end -- class GTKUIMANAGER_EXTERNALS
