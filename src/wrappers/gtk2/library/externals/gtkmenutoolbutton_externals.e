-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENUTOOLBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_menu_tool_button_get_menu (a_button: POINTER): POINTER is
 		-- gtk_menu_tool_button_get_menu (node at line 673)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_get_menu"
		}"
		end

	gtk_menu_tool_button_new (an_icon_widget: POINTER; a_label: POINTER): POINTER is
 		-- gtk_menu_tool_button_new (node at line 2010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_new"
		}"
		end

	gtk_menu_tool_button_new_from_stock (a_stock_id: POINTER): POINTER is
 		-- gtk_menu_tool_button_new_from_stock (node at line 3981)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_new_from_stock"
		}"
		end

	gtk_menu_tool_button_set_menu (a_button: POINTER; a_menu: POINTER) is
 		-- gtk_menu_tool_button_set_menu (node at line 14948)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_set_menu"
		}"
		end

	gtk_menu_tool_button_set_arrow_tooltip_markup (a_button: POINTER; a_markup: POINTER) is
 		-- gtk_menu_tool_button_set_arrow_tooltip_markup (node at line 21261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_set_arrow_tooltip_markup"
		}"
		end

	gtk_menu_tool_button_get_type: NATURAL_64 is
 		-- gtk_menu_tool_button_get_type (node at line 22915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_get_type()"
		}"
		end

	gtk_menu_tool_button_set_arrow_tooltip_text (a_button: POINTER; a_text: POINTER) is
 		-- gtk_menu_tool_button_set_arrow_tooltip_text (node at line 34665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_set_arrow_tooltip_text"
		}"
		end


end -- class GTKMENUTOOLBUTTON_EXTERNALS
