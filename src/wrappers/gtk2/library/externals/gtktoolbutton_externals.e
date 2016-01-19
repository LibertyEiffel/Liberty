-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_tool_button_get_button skipped.
	gtk_tool_button_get_icon_name (a_button: POINTER): POINTER is
 		-- gtk_tool_button_get_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_icon_name"
		}"
		end

	gtk_tool_button_get_icon_widget (a_button: POINTER): POINTER is
 		-- gtk_tool_button_get_icon_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_icon_widget"
		}"
		end

	gtk_tool_button_get_label (a_button: POINTER): POINTER is
 		-- gtk_tool_button_get_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_label"
		}"
		end

	gtk_tool_button_get_label_widget (a_button: POINTER): POINTER is
 		-- gtk_tool_button_get_label_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_label_widget"
		}"
		end

	gtk_tool_button_get_stock_id (a_button: POINTER): POINTER is
 		-- gtk_tool_button_get_stock_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_stock_id"
		}"
		end

	gtk_tool_button_get_type: like long_unsigned is
 		-- gtk_tool_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_type()"
		}"
		end

	gtk_tool_button_get_use_underline (a_button: POINTER): INTEGER is
 		-- gtk_tool_button_get_use_underline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_use_underline"
		}"
		end

	gtk_tool_button_new (an_icon_widget: POINTER; a_label: POINTER): POINTER is
 		-- gtk_tool_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_new"
		}"
		end

	gtk_tool_button_new_from_stock (a_stock_id: POINTER): POINTER is
 		-- gtk_tool_button_new_from_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_new_from_stock"
		}"
		end

	gtk_tool_button_set_icon_name (a_button: POINTER; an_icon_name: POINTER) is
 		-- gtk_tool_button_set_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_icon_name"
		}"
		end

	gtk_tool_button_set_icon_widget (a_button: POINTER; an_icon_widget: POINTER) is
 		-- gtk_tool_button_set_icon_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_icon_widget"
		}"
		end

	gtk_tool_button_set_label (a_button: POINTER; a_label: POINTER) is
 		-- gtk_tool_button_set_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_label"
		}"
		end

	gtk_tool_button_set_label_widget (a_button: POINTER; a_label_widget: POINTER) is
 		-- gtk_tool_button_set_label_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_label_widget"
		}"
		end

	gtk_tool_button_set_stock_id (a_button: POINTER; a_stock_id: POINTER) is
 		-- gtk_tool_button_set_stock_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_stock_id"
		}"
		end

	gtk_tool_button_set_use_underline (a_button: POINTER; an_use_underline: INTEGER) is
 		-- gtk_tool_button_set_use_underline
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_use_underline"
		}"
		end


end -- class GTKTOOLBUTTON_EXTERNALS
