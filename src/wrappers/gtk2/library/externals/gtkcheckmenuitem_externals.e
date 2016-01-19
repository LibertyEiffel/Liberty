-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCHECKMENUITEM_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_check_menu_item_get_active (a_check_menu_item: POINTER): INTEGER is
 		-- gtk_check_menu_item_get_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_get_active"
		}"
		end

	gtk_check_menu_item_get_draw_as_radio (a_check_menu_item: POINTER): INTEGER is
 		-- gtk_check_menu_item_get_draw_as_radio
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_get_draw_as_radio"
		}"
		end

	gtk_check_menu_item_get_inconsistent (a_check_menu_item: POINTER): INTEGER is
 		-- gtk_check_menu_item_get_inconsistent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_get_inconsistent"
		}"
		end

	gtk_check_menu_item_get_type: like long_unsigned is
 		-- gtk_check_menu_item_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_get_type()"
		}"
		end

	gtk_check_menu_item_new: POINTER is
 		-- gtk_check_menu_item_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_new()"
		}"
		end

	gtk_check_menu_item_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_check_menu_item_new_with_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_new_with_label"
		}"
		end

	gtk_check_menu_item_new_with_mnemonic (a_label: POINTER): POINTER is
 		-- gtk_check_menu_item_new_with_mnemonic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_new_with_mnemonic"
		}"
		end

	gtk_check_menu_item_set_active (a_check_menu_item: POINTER; an_is_active: INTEGER) is
 		-- gtk_check_menu_item_set_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_set_active"
		}"
		end

	gtk_check_menu_item_set_draw_as_radio (a_check_menu_item: POINTER; a_draw_as_radio: INTEGER) is
 		-- gtk_check_menu_item_set_draw_as_radio
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_set_draw_as_radio"
		}"
		end

	gtk_check_menu_item_set_inconsistent (a_check_menu_item: POINTER; a_setting: INTEGER) is
 		-- gtk_check_menu_item_set_inconsistent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_set_inconsistent"
		}"
		end

	gtk_check_menu_item_toggled (a_check_menu_item: POINTER) is
 		-- gtk_check_menu_item_toggled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_toggled"
		}"
		end


end -- class GTKCHECKMENUITEM_EXTERNALS
