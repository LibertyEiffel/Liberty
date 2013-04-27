-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKUIMANAGER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_ui_manager_add_ui (a_self: POINTER; a_merge_id: NATURAL; a_path: POINTER; a_name: POINTER; an_action: POINTER; a_type: INTEGER; a_top: INTEGER) is
 		-- gtk_ui_manager_add_ui
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_add_ui"
		}"
		end

	gtk_ui_manager_add_ui_from_file (a_self: POINTER; a_filename: POINTER; an_error: POINTER): NATURAL is
 		-- gtk_ui_manager_add_ui_from_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_add_ui_from_file"
		}"
		end

	gtk_ui_manager_add_ui_from_string (a_self: POINTER; a_buffer: POINTER; a_length: INTEGER; an_error: POINTER): NATURAL is
 		-- gtk_ui_manager_add_ui_from_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_add_ui_from_string"
		}"
		end

	gtk_ui_manager_ensure_update (a_self: POINTER) is
 		-- gtk_ui_manager_ensure_update
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_ensure_update"
		}"
		end

	gtk_ui_manager_get_accel_group (a_self: POINTER): POINTER is
 		-- gtk_ui_manager_get_accel_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_accel_group"
		}"
		end

	gtk_ui_manager_get_action (a_self: POINTER; a_path: POINTER): POINTER is
 		-- gtk_ui_manager_get_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_action"
		}"
		end

	gtk_ui_manager_get_action_groups (a_self: POINTER): POINTER is
 		-- gtk_ui_manager_get_action_groups
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_action_groups"
		}"
		end

	gtk_ui_manager_get_add_tearoffs (a_self: POINTER): INTEGER is
 		-- gtk_ui_manager_get_add_tearoffs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_add_tearoffs"
		}"
		end

	gtk_ui_manager_get_toplevels (a_self: POINTER; a_types: INTEGER): POINTER is
 		-- gtk_ui_manager_get_toplevels
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_toplevels"
		}"
		end

	gtk_ui_manager_get_type: like long_unsigned is
 		-- gtk_ui_manager_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_type()"
		}"
		end

	gtk_ui_manager_get_ui (a_self: POINTER): POINTER is
 		-- gtk_ui_manager_get_ui
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_ui"
		}"
		end

	gtk_ui_manager_get_widget (a_self: POINTER; a_path: POINTER): POINTER is
 		-- gtk_ui_manager_get_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_get_widget"
		}"
		end

	gtk_ui_manager_insert_action_group (a_self: POINTER; an_action_group: POINTER; a_pos: INTEGER) is
 		-- gtk_ui_manager_insert_action_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_insert_action_group"
		}"
		end

	gtk_ui_manager_new: POINTER is
 		-- gtk_ui_manager_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_new()"
		}"
		end

	gtk_ui_manager_new_merge_id (a_self: POINTER): NATURAL is
 		-- gtk_ui_manager_new_merge_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_new_merge_id"
		}"
		end

	gtk_ui_manager_remove_action_group (a_self: POINTER; an_action_group: POINTER) is
 		-- gtk_ui_manager_remove_action_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_remove_action_group"
		}"
		end

	gtk_ui_manager_remove_ui (a_self: POINTER; a_merge_id: NATURAL) is
 		-- gtk_ui_manager_remove_ui
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_remove_ui"
		}"
		end

	gtk_ui_manager_set_add_tearoffs (a_self: POINTER; an_add_tearoffs: INTEGER) is
 		-- gtk_ui_manager_set_add_tearoffs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ui_manager_set_add_tearoffs"
		}"
		end


end -- class GTKUIMANAGER_EXTERNALS
