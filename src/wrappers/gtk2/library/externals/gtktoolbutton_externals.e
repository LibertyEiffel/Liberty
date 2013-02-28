-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tool_button_set_icon_widget (a_button: POINTER; an_icon_widget: POINTER) is
 		-- gtk_tool_button_set_icon_widget (node at line 2752)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_icon_widget"
		}"
		end

	gtk_tool_button_get_type: NATURAL_64 is
 		-- gtk_tool_button_get_type (node at line 3999)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_type()"
		}"
		end

	gtk_tool_button_new (an_icon_widget: POINTER; a_label: POINTER): POINTER is
 		-- gtk_tool_button_new (node at line 6245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_new"
		}"
		end

	gtk_tool_button_get_use_underline (a_button: POINTER): INTEGER_32 is
 		-- gtk_tool_button_get_use_underline (node at line 13085)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_use_underline"
		}"
		end

	gtk_tool_button_set_label (a_button: POINTER; a_label: POINTER) is
 		-- gtk_tool_button_set_label (node at line 14507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_label"
		}"
		end

	gtk_tool_button_get_icon_widget (a_button: POINTER): POINTER is
 		-- gtk_tool_button_get_icon_widget (node at line 15323)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_icon_widget"
		}"
		end

	gtk_tool_button_set_stock_id (a_button: POINTER; a_stock_id: POINTER) is
 		-- gtk_tool_button_set_stock_id (node at line 16250)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_stock_id"
		}"
		end

	gtk_tool_button_get_stock_id (a_button: POINTER): POINTER is
 		-- gtk_tool_button_get_stock_id (node at line 17484)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_stock_id"
		}"
		end

	gtk_tool_button_set_icon_name (a_button: POINTER; an_icon_name: POINTER) is
 		-- gtk_tool_button_set_icon_name (node at line 21515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_icon_name"
		}"
		end

	gtk_tool_button_new_from_stock (a_stock_id: POINTER): POINTER is
 		-- gtk_tool_button_new_from_stock (node at line 24720)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_new_from_stock"
		}"
		end

	gtk_tool_button_get_icon_name (a_button: POINTER): POINTER is
 		-- gtk_tool_button_get_icon_name (node at line 25197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_icon_name"
		}"
		end

	gtk_tool_button_get_label (a_button: POINTER): POINTER is
 		-- gtk_tool_button_get_label (node at line 30213)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_label"
		}"
		end

	gtk_tool_button_set_label_widget (a_button: POINTER; a_label_widget: POINTER) is
 		-- gtk_tool_button_set_label_widget (node at line 31062)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_label_widget"
		}"
		end

	-- `hidden' function _gtk_tool_button_get_button skipped.
	gtk_tool_button_get_label_widget (a_button: POINTER): POINTER is
 		-- gtk_tool_button_get_label_widget (node at line 35108)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_get_label_widget"
		}"
		end

	gtk_tool_button_set_use_underline (a_button: POINTER; an_use_underline: INTEGER_32) is
 		-- gtk_tool_button_set_use_underline (node at line 39401)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_set_use_underline"
		}"
		end


end -- class GTKTOOLBUTTON_EXTERNALS
