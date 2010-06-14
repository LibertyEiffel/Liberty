-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENUITEM_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_menu_item_get_label (a_menu_item: POINTER): POINTER is
 		-- gtk_menu_item_get_label (node at line 1800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_label"
		}"
		end

	gtk_menu_item_get_submenu (a_menu_item: POINTER): POINTER is
 		-- gtk_menu_item_get_submenu (node at line 5423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_submenu"
		}"
		end

	gtk_menu_item_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_menu_item_new_with_mnemonic (node at line 6030)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_new_with_mnemonic"
		}"
		end

	gtk_menu_item_get_right_justified (a_menu_item: POINTER): INTEGER_32 is
 		-- gtk_menu_item_get_right_justified (node at line 6739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_right_justified"
		}"
		end

	gtk_menu_item_select (a_menu_item: POINTER) is
 		-- gtk_menu_item_select (node at line 10444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_select"
		}"
		end

	gtk_menu_item_toggle_size_allocate (a_menu_item: POINTER; an_allocation: INTEGER_32) is
 		-- gtk_menu_item_toggle_size_allocate (node at line 10748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_toggle_size_allocate"
		}"
		end

	gtk_menu_item_set_label (a_menu_item: POINTER; a_label: POINTER) is
 		-- gtk_menu_item_set_label (node at line 11245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_set_label"
		}"
		end

	gtk_menu_item_set_submenu (a_menu_item: POINTER; a_submenu: POINTER) is
 		-- gtk_menu_item_set_submenu (node at line 12015)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_set_submenu"
		}"
		end

	gtk_menu_item_activate (a_menu_item: POINTER) is
 		-- gtk_menu_item_activate (node at line 13645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_activate"
		}"
		end

	gtk_menu_item_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_menu_item_new_with_label (node at line 14391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_new_with_label"
		}"
		end

	gtk_menu_item_set_accel_path (a_menu_item: POINTER; an_accel_path: POINTER) is
 		-- gtk_menu_item_set_accel_path (node at line 15329)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_set_accel_path"
		}"
		end

	gtk_menu_item_remove_submenu (a_menu_item: POINTER) is
 		-- gtk_menu_item_remove_submenu (node at line 15390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_remove_submenu"
		}"
		end

	gtk_menu_item_get_use_underline (a_menu_item: POINTER): INTEGER_32 is
 		-- gtk_menu_item_get_use_underline (node at line 15492)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_use_underline"
		}"
		end

	gtk_menu_item_deselect (a_menu_item: POINTER) is
 		-- gtk_menu_item_deselect (node at line 16440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_deselect"
		}"
		end

	gtk_menu_item_get_accel_path (a_menu_item: POINTER): POINTER is
 		-- gtk_menu_item_get_accel_path (node at line 16934)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_accel_path"
		}"
		end

	gtk_menu_item_toggle_size_request (a_menu_item: POINTER; a_requisition: POINTER) is
 		-- gtk_menu_item_toggle_size_request (node at line 17656)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_toggle_size_request"
		}"
		end

	-- `hidden' function _gtk_menu_item_is_selectable skipped.
	gtk_menu_item_get_type: NATURAL_32 is
 		-- gtk_menu_item_get_type (node at line 17937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_type()"
		}"
		end

	-- `hidden' function _gtk_menu_item_popup_submenu skipped.
	-- `hidden' function _gtk_menu_item_refresh_accel_path skipped.
	-- `hidden' function _gtk_menu_item_popdown_submenu skipped.
	gtk_menu_item_set_right_justified (a_menu_item: POINTER; a_right_justified: INTEGER_32) is
 		-- gtk_menu_item_set_right_justified (node at line 22094)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_set_right_justified"
		}"
		end

	gtk_menu_item_set_use_underline (a_menu_item: POINTER; a_setting: INTEGER_32) is
 		-- gtk_menu_item_set_use_underline (node at line 28323)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_set_use_underline"
		}"
		end

	gtk_menu_item_new: POINTER is
 		-- gtk_menu_item_new (node at line 30406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_new()"
		}"
		end


end -- class GTKMENUITEM_EXTERNALS
