-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACTIONGROUP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_action_group_add_action (an_action_group: POINTER; an_action: POINTER) is
 		-- gtk_action_group_add_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_action"
		}"
		end

	gtk_action_group_add_action_with_accel (an_action_group: POINTER; an_action: POINTER; an_accelerator: POINTER) is
 		-- gtk_action_group_add_action_with_accel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_action_with_accel"
		}"
		end

	gtk_action_group_add_actions (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL; an_user_data: POINTER) is
 		-- gtk_action_group_add_actions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_actions"
		}"
		end

	gtk_action_group_add_actions_full (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_action_group_add_actions_full
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_actions_full"
		}"
		end

	gtk_action_group_add_radio_actions (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL; a_value: INTEGER; an_on_change: POINTER; an_user_data: POINTER) is
 		-- gtk_action_group_add_radio_actions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_radio_actions"
		}"
		end

	gtk_action_group_add_radio_actions_full (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL; a_value: INTEGER; an_on_change: POINTER; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_action_group_add_radio_actions_full
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_radio_actions_full"
		}"
		end

	gtk_action_group_add_toggle_actions (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL; an_user_data: POINTER) is
 		-- gtk_action_group_add_toggle_actions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_toggle_actions"
		}"
		end

	gtk_action_group_add_toggle_actions_full (an_action_group: POINTER; an_entries: POINTER; a_n_entries: NATURAL; an_user_data: POINTER; a_destroy: POINTER) is
 		-- gtk_action_group_add_toggle_actions_full
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_add_toggle_actions_full"
		}"
		end

	-- `hidden' function _gtk_action_group_emit_connect_proxy skipped.
	-- `hidden' function _gtk_action_group_emit_disconnect_proxy skipped.
	-- `hidden' function _gtk_action_group_emit_post_activate skipped.
	-- `hidden' function _gtk_action_group_emit_pre_activate skipped.
	gtk_action_group_get_action (an_action_group: POINTER; an_action_name: POINTER): POINTER is
 		-- gtk_action_group_get_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_get_action"
		}"
		end

	gtk_action_group_get_name (an_action_group: POINTER): POINTER is
 		-- gtk_action_group_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_get_name"
		}"
		end

	gtk_action_group_get_sensitive (an_action_group: POINTER): INTEGER is
 		-- gtk_action_group_get_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_get_sensitive"
		}"
		end

	gtk_action_group_get_type: like long_unsigned is
 		-- gtk_action_group_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_get_type()"
		}"
		end

	gtk_action_group_get_visible (an_action_group: POINTER): INTEGER is
 		-- gtk_action_group_get_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_get_visible"
		}"
		end

	gtk_action_group_list_actions (an_action_group: POINTER): POINTER is
 		-- gtk_action_group_list_actions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_list_actions"
		}"
		end

	gtk_action_group_new (a_name: POINTER): POINTER is
 		-- gtk_action_group_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_new"
		}"
		end

	gtk_action_group_remove_action (an_action_group: POINTER; an_action: POINTER) is
 		-- gtk_action_group_remove_action
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_remove_action"
		}"
		end

	gtk_action_group_set_sensitive (an_action_group: POINTER; a_sensitive: INTEGER) is
 		-- gtk_action_group_set_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_set_sensitive"
		}"
		end

	gtk_action_group_set_translate_func (an_action_group: POINTER; a_func: POINTER; a_data: POINTER; a_notify: POINTER) is
 		-- gtk_action_group_set_translate_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_set_translate_func"
		}"
		end

	gtk_action_group_set_translation_domain (an_action_group: POINTER; a_domain: POINTER) is
 		-- gtk_action_group_set_translation_domain
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_set_translation_domain"
		}"
		end

	gtk_action_group_set_visible (an_action_group: POINTER; a_visible: INTEGER) is
 		-- gtk_action_group_set_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_set_visible"
		}"
		end

	gtk_action_group_translate_string (an_action_group: POINTER; a_string: POINTER): POINTER is
 		-- gtk_action_group_translate_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_group_translate_string"
		}"
		end


end -- class GTKACTIONGROUP_EXTERNALS
