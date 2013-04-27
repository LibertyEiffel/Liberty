-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOGGLETOOLBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_toggle_tool_button_get_active (a_button: POINTER): INTEGER is
 		-- gtk_toggle_tool_button_get_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_tool_button_get_active"
		}"
		end

	gtk_toggle_tool_button_get_type: like long_unsigned is
 		-- gtk_toggle_tool_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_tool_button_get_type()"
		}"
		end

	gtk_toggle_tool_button_new: POINTER is
 		-- gtk_toggle_tool_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_tool_button_new()"
		}"
		end

	gtk_toggle_tool_button_new_from_stock (a_stock_id: POINTER): POINTER is
 		-- gtk_toggle_tool_button_new_from_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_tool_button_new_from_stock"
		}"
		end

	gtk_toggle_tool_button_set_active (a_button: POINTER; an_is_active: INTEGER) is
 		-- gtk_toggle_tool_button_set_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_tool_button_set_active"
		}"
		end


end -- class GTKTOGGLETOOLBUTTON_EXTERNALS
