-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRADIOTOOLBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_radio_tool_button_new_from_widget (a_group: POINTER): POINTER is
 		-- gtk_radio_tool_button_new_from_widget (node at line 5535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_tool_button_new_from_widget"
		}"
		end

	gtk_radio_tool_button_new_with_stock_from_widget (a_group: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_radio_tool_button_new_with_stock_from_widget (node at line 9317)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_tool_button_new_with_stock_from_widget"
		}"
		end

	gtk_radio_tool_button_new (a_group: POINTER): POINTER is
 		-- gtk_radio_tool_button_new (node at line 13928)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_tool_button_new"
		}"
		end

	gtk_radio_tool_button_get_group (a_button: POINTER): POINTER is
 		-- gtk_radio_tool_button_get_group (node at line 18615)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_tool_button_get_group"
		}"
		end

	gtk_radio_tool_button_set_group (a_button: POINTER; a_group: POINTER) is
 		-- gtk_radio_tool_button_set_group (node at line 26070)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_tool_button_set_group"
		}"
		end

	gtk_radio_tool_button_new_from_stock (a_group: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_radio_tool_button_new_from_stock (node at line 29164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_tool_button_new_from_stock"
		}"
		end

	gtk_radio_tool_button_get_type: NATURAL_64 is
 		-- gtk_radio_tool_button_get_type (node at line 29310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_tool_button_get_type()"
		}"
		end


end -- class GTKRADIOTOOLBUTTON_EXTERNALS
