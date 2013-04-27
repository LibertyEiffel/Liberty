-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMENUTOOLBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_menu_tool_button_get_menu (a_button: POINTER): POINTER is
 		-- gtk_menu_tool_button_get_menu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_get_menu"
		}"
		end

	gtk_menu_tool_button_get_type: like long_unsigned is
 		-- gtk_menu_tool_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_get_type()"
		}"
		end

	gtk_menu_tool_button_new (an_icon_widget: POINTER; a_label: POINTER): POINTER is
 		-- gtk_menu_tool_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_new"
		}"
		end

	gtk_menu_tool_button_new_from_stock (a_stock_id: POINTER): POINTER is
 		-- gtk_menu_tool_button_new_from_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_new_from_stock"
		}"
		end

	gtk_menu_tool_button_set_arrow_tooltip_markup (a_button: POINTER; a_markup: POINTER) is
 		-- gtk_menu_tool_button_set_arrow_tooltip_markup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_set_arrow_tooltip_markup"
		}"
		end

	gtk_menu_tool_button_set_arrow_tooltip_text (a_button: POINTER; a_text: POINTER) is
 		-- gtk_menu_tool_button_set_arrow_tooltip_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_set_arrow_tooltip_text"
		}"
		end

	gtk_menu_tool_button_set_menu (a_button: POINTER; a_menu: POINTER) is
 		-- gtk_menu_tool_button_set_menu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_menu_tool_button_set_menu"
		}"
		end


end -- class GTKMENUTOOLBUTTON_EXTERNALS
