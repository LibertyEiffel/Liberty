-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENUTOOLBUTTON_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_menu_tool_button_new (an_icon_widget: POINTER; a_label: POINTER): POINTER is
 		-- gtk_menu_tool_button_new (node at line 2110)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_new"
		}"
		end

	gtk_menu_tool_button_new_from_stock (a_stock_id: POINTER): POINTER is
 		-- gtk_menu_tool_button_new_from_stock (node at line 3826)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_new_from_stock"
		}"
		end

	gtk_menu_tool_button_set_arrow_tooltip (a_button: POINTER; a_tooltips: POINTER; a_tip_text: POINTER; a_tip_private: POINTER) is
 		-- gtk_menu_tool_button_set_arrow_tooltip (node at line 6421)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_set_arrow_tooltip"
		}"
		end

	gtk_menu_tool_button_set_menu (a_button: POINTER; a_menu: POINTER) is
 		-- gtk_menu_tool_button_set_menu (node at line 13889)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_set_menu"
		}"
		end

	gtk_menu_tool_button_get_type: NATURAL_32 is
 		-- gtk_menu_tool_button_get_type (node at line 15688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_get_type()"
		}"
		end

	gtk_menu_tool_button_set_arrow_tooltip_markup (a_button: POINTER; a_markup: POINTER) is
 		-- gtk_menu_tool_button_set_arrow_tooltip_markup (node at line 19381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_set_arrow_tooltip_markup"
		}"
		end

	gtk_menu_tool_button_set_arrow_tooltip_text (a_button: POINTER; a_text: POINTER) is
 		-- gtk_menu_tool_button_set_arrow_tooltip_text (node at line 31337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_set_arrow_tooltip_text"
		}"
		end

	gtk_menu_tool_button_get_menu (a_button: POINTER): POINTER is
 		-- gtk_menu_tool_button_get_menu (node at line 33869)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_get_menu"
		}"
		end


end -- class GTKMENUTOOLBUTTON_EXTERNALS
