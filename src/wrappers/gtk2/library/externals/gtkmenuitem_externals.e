-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENUITEM_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_menu_item_activate (a_menu_item: POINTER) is
 		-- gtk_menu_item_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_activate"
		}"
		end

	gtk_menu_item_deselect (a_menu_item: POINTER) is
 		-- gtk_menu_item_deselect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_deselect"
		}"
		end

	gtk_menu_item_get_accel_path (a_menu_item: POINTER): POINTER is
 		-- gtk_menu_item_get_accel_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_accel_path"
		}"
		end

	gtk_menu_item_get_label (a_menu_item: POINTER): POINTER is
 		-- gtk_menu_item_get_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_label"
		}"
		end

	gtk_menu_item_get_right_justified (a_menu_item: POINTER): INTEGER is
 		-- gtk_menu_item_get_right_justified
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_right_justified"
		}"
		end

	gtk_menu_item_get_submenu (a_menu_item: POINTER): POINTER is
 		-- gtk_menu_item_get_submenu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_submenu"
		}"
		end

	gtk_menu_item_get_type: like long_unsigned is
 		-- gtk_menu_item_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_type()"
		}"
		end

	gtk_menu_item_get_use_underline (a_menu_item: POINTER): INTEGER is
 		-- gtk_menu_item_get_use_underline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_get_use_underline"
		}"
		end

	-- `hidden' function _gtk_menu_item_is_selectable skipped.
	gtk_menu_item_new: POINTER is
 		-- gtk_menu_item_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_new()"
		}"
		end

	gtk_menu_item_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_menu_item_new_with_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_new_with_label"
		}"
		end

	gtk_menu_item_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_menu_item_new_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_new_with_mnemonic"
		}"
		end

	-- `hidden' function _gtk_menu_item_popdown_submenu skipped.
	-- `hidden' function _gtk_menu_item_popup_submenu skipped.
	-- `hidden' function _gtk_menu_item_refresh_accel_path skipped.
	gtk_menu_item_select (a_menu_item: POINTER) is
 		-- gtk_menu_item_select
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_select"
		}"
		end

	gtk_menu_item_set_accel_path (a_menu_item: POINTER; an_accel_path: POINTER) is
 		-- gtk_menu_item_set_accel_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_set_accel_path"
		}"
		end

	gtk_menu_item_set_label (a_menu_item: POINTER; a_label: POINTER) is
 		-- gtk_menu_item_set_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_set_label"
		}"
		end

	gtk_menu_item_set_right_justified (a_menu_item: POINTER; a_right_justified: INTEGER) is
 		-- gtk_menu_item_set_right_justified
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_set_right_justified"
		}"
		end

	gtk_menu_item_set_submenu (a_menu_item: POINTER; a_submenu: POINTER) is
 		-- gtk_menu_item_set_submenu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_set_submenu"
		}"
		end

	gtk_menu_item_set_use_underline (a_menu_item: POINTER; a_setting: INTEGER) is
 		-- gtk_menu_item_set_use_underline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_set_use_underline"
		}"
		end

	gtk_menu_item_toggle_size_allocate (a_menu_item: POINTER; an_allocation: INTEGER) is
 		-- gtk_menu_item_toggle_size_allocate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_toggle_size_allocate"
		}"
		end

	gtk_menu_item_toggle_size_request (a_menu_item: POINTER; a_requisition: POINTER) is
 		-- gtk_menu_item_toggle_size_request
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_item_toggle_size_request"
		}"
		end


end -- class GTKMENUITEM_EXTERNALS
