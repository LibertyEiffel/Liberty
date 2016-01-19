-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENU_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_menu_attach (a_menu: POINTER; a_child: POINTER; a_left_attach: NATURAL; a_right_attach: NATURAL; a_top_attach: NATURAL; a_bottom_attach: NATURAL) is
 		-- gtk_menu_attach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_attach"
		}"
		end

	gtk_menu_attach_to_widget (a_menu: POINTER; an_attach_widget: POINTER; a_detacher: POINTER) is
 		-- gtk_menu_attach_to_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_attach_to_widget"
		}"
		end

	gtk_menu_detach (a_menu: POINTER) is
 		-- gtk_menu_detach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_detach"
		}"
		end

	gtk_menu_get_accel_group (a_menu: POINTER): POINTER is
 		-- gtk_menu_get_accel_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_accel_group"
		}"
		end

	gtk_menu_get_accel_path (a_menu: POINTER): POINTER is
 		-- gtk_menu_get_accel_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_accel_path"
		}"
		end

	gtk_menu_get_active (a_menu: POINTER): POINTER is
 		-- gtk_menu_get_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_active"
		}"
		end

	gtk_menu_get_attach_widget (a_menu: POINTER): POINTER is
 		-- gtk_menu_get_attach_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_attach_widget"
		}"
		end

	gtk_menu_get_for_attach_widget (a_widget: POINTER): POINTER is
 		-- gtk_menu_get_for_attach_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_for_attach_widget"
		}"
		end

	gtk_menu_get_monitor (a_menu: POINTER): INTEGER is
 		-- gtk_menu_get_monitor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_monitor"
		}"
		end

	gtk_menu_get_reserve_toggle_size (a_menu: POINTER): INTEGER is
 		-- gtk_menu_get_reserve_toggle_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_reserve_toggle_size"
		}"
		end

	gtk_menu_get_tearoff_state (a_menu: POINTER): INTEGER is
 		-- gtk_menu_get_tearoff_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_tearoff_state"
		}"
		end

	gtk_menu_get_title (a_menu: POINTER): POINTER is
 		-- gtk_menu_get_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_title"
		}"
		end

	gtk_menu_get_type: like long_unsigned is
 		-- gtk_menu_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_type()"
		}"
		end

	gtk_menu_new: POINTER is
 		-- gtk_menu_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_new()"
		}"
		end

	gtk_menu_popdown (a_menu: POINTER) is
 		-- gtk_menu_popdown
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_popdown"
		}"
		end

	gtk_menu_popup (a_menu: POINTER; a_parent_menu_shell: POINTER; a_parent_menu_item: POINTER; a_func: POINTER; a_data: POINTER; a_button: NATURAL; an_activate_time: NATURAL) is
 		-- gtk_menu_popup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_popup"
		}"
		end

	gtk_menu_reorder_child (a_menu: POINTER; a_child: POINTER; a_position: INTEGER) is
 		-- gtk_menu_reorder_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_reorder_child"
		}"
		end

	gtk_menu_reposition (a_menu: POINTER) is
 		-- gtk_menu_reposition
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_reposition"
		}"
		end

	gtk_menu_set_accel_group (a_menu: POINTER; an_accel_group: POINTER) is
 		-- gtk_menu_set_accel_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_accel_group"
		}"
		end

	gtk_menu_set_accel_path (a_menu: POINTER; an_accel_path: POINTER) is
 		-- gtk_menu_set_accel_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_accel_path"
		}"
		end

	gtk_menu_set_active (a_menu: POINTER; an_index: NATURAL) is
 		-- gtk_menu_set_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_active"
		}"
		end

	gtk_menu_set_monitor (a_menu: POINTER; a_monitor_num: INTEGER) is
 		-- gtk_menu_set_monitor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_monitor"
		}"
		end

	gtk_menu_set_reserve_toggle_size (a_menu: POINTER; a_reserve_toggle_size: INTEGER) is
 		-- gtk_menu_set_reserve_toggle_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_reserve_toggle_size"
		}"
		end

	gtk_menu_set_screen (a_menu: POINTER; a_screen: POINTER) is
 		-- gtk_menu_set_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_screen"
		}"
		end

	gtk_menu_set_tearoff_state (a_menu: POINTER; a_torn_off: INTEGER) is
 		-- gtk_menu_set_tearoff_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_tearoff_state"
		}"
		end

	gtk_menu_set_title (a_menu: POINTER; a_title: POINTER) is
 		-- gtk_menu_set_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_title"
		}"
		end


end -- class GTKMENU_EXTERNALS
