-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENU_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_menu_detach (a_menu: POINTER) is
 		-- gtk_menu_detach (node at line 1814)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_detach"
		}"
		end

	gtk_menu_popup (a_menu: POINTER; a_parent_menu_shell: POINTER; a_parent_menu_item: POINTER; a_func: POINTER; a_data: POINTER; a_button: NATURAL_32; an_activate_time: NATURAL_32) is
 		-- gtk_menu_popup (node at line 2145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_popup"
		}"
		end

	gtk_menu_get_monitor (a_menu: POINTER): INTEGER_32 is
 		-- gtk_menu_get_monitor (node at line 2867)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_monitor"
		}"
		end

	gtk_menu_get_accel_path (a_menu: POINTER): POINTER is
 		-- gtk_menu_get_accel_path (node at line 4432)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_accel_path"
		}"
		end

	gtk_menu_set_active (a_menu: POINTER; an_index: NATURAL_32) is
 		-- gtk_menu_set_active (node at line 8786)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_active"
		}"
		end

	gtk_menu_set_monitor (a_menu: POINTER; a_monitor_num: INTEGER_32) is
 		-- gtk_menu_set_monitor (node at line 9605)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_monitor"
		}"
		end

	gtk_menu_get_accel_group (a_menu: POINTER): POINTER is
 		-- gtk_menu_get_accel_group (node at line 10313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_accel_group"
		}"
		end

	gtk_menu_new: POINTER is
 		-- gtk_menu_new (node at line 13638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_new()"
		}"
		end

	gtk_menu_get_active (a_menu: POINTER): POINTER is
 		-- gtk_menu_get_active (node at line 15193)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_active"
		}"
		end

	gtk_menu_set_tearoff_state (a_menu: POINTER; a_torn_off: INTEGER_32) is
 		-- gtk_menu_set_tearoff_state (node at line 15311)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_tearoff_state"
		}"
		end

	gtk_menu_get_for_attach_widget (a_widget: POINTER): POINTER is
 		-- gtk_menu_get_for_attach_widget (node at line 15775)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_for_attach_widget"
		}"
		end

	gtk_menu_attach (a_menu: POINTER; a_child: POINTER; a_left_attach: NATURAL_32; a_right_attach: NATURAL_32; a_top_attach: NATURAL_32; a_bottom_attach: NATURAL_32) is
 		-- gtk_menu_attach (node at line 17722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_attach"
		}"
		end

	gtk_menu_set_accel_path (a_menu: POINTER; an_accel_path: POINTER) is
 		-- gtk_menu_set_accel_path (node at line 18097)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_accel_path"
		}"
		end

	gtk_menu_reposition (a_menu: POINTER) is
 		-- gtk_menu_reposition (node at line 18448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_reposition"
		}"
		end

	gtk_menu_get_title (a_menu: POINTER): POINTER is
 		-- gtk_menu_get_title (node at line 23168)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_title"
		}"
		end

	gtk_menu_get_attach_widget (a_menu: POINTER): POINTER is
 		-- gtk_menu_get_attach_widget (node at line 23380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_attach_widget"
		}"
		end

	gtk_menu_popdown (a_menu: POINTER) is
 		-- gtk_menu_popdown (node at line 23385)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_popdown"
		}"
		end

	gtk_menu_get_tearoff_state (a_menu: POINTER): INTEGER_32 is
 		-- gtk_menu_get_tearoff_state (node at line 25316)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_tearoff_state"
		}"
		end

	gtk_menu_set_screen (a_menu: POINTER; a_screen: POINTER) is
 		-- gtk_menu_set_screen (node at line 26451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_screen"
		}"
		end

	gtk_menu_attach_to_widget (a_menu: POINTER; an_attach_widget: POINTER; a_detacher: POINTER) is
 		-- gtk_menu_attach_to_widget (node at line 27909)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_attach_to_widget"
		}"
		end

	gtk_menu_get_type: NATURAL_32 is
 		-- gtk_menu_get_type (node at line 30950)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_type()"
		}"
		end

	gtk_menu_set_title (a_menu: POINTER; a_title: POINTER) is
 		-- gtk_menu_set_title (node at line 31812)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_title"
		}"
		end

	gtk_menu_get_reserve_toggle_size (a_menu: POINTER): INTEGER_32 is
 		-- gtk_menu_get_reserve_toggle_size (node at line 33004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_get_reserve_toggle_size"
		}"
		end

	gtk_menu_set_reserve_toggle_size (a_menu: POINTER; a_reserve_toggle_size: INTEGER_32) is
 		-- gtk_menu_set_reserve_toggle_size (node at line 33911)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_reserve_toggle_size"
		}"
		end

	gtk_menu_set_accel_group (a_menu: POINTER; an_accel_group: POINTER) is
 		-- gtk_menu_set_accel_group (node at line 34323)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_set_accel_group"
		}"
		end

	gtk_menu_reorder_child (a_menu: POINTER; a_child: POINTER; a_position: INTEGER_32) is
 		-- gtk_menu_reorder_child (node at line 36557)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_reorder_child"
		}"
		end


end -- class GTKMENU_EXTERNALS
