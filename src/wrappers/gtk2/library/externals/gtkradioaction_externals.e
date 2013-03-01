-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRADIOACTION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_radio_action_get_current_value (an_action: POINTER): INTEGER_32 is
 		-- gtk_radio_action_get_current_value (node at line 5041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_get_current_value"
		}"
		end

	gtk_radio_action_get_type: NATURAL_64 is
 		-- gtk_radio_action_get_type (node at line 8353)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_get_type()"
		}"
		end

	gtk_radio_action_set_group (an_action: POINTER; a_group: POINTER) is
 		-- gtk_radio_action_set_group (node at line 8715)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_set_group"
		}"
		end

	gtk_radio_action_set_current_value (an_action: POINTER; a_current_value: INTEGER_32) is
 		-- gtk_radio_action_set_current_value (node at line 11930)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_set_current_value"
		}"
		end

	gtk_radio_action_new (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER; a_value: INTEGER_32): POINTER is
 		-- gtk_radio_action_new (node at line 30711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_new"
		}"
		end

	gtk_radio_action_get_group (an_action: POINTER): POINTER is
 		-- gtk_radio_action_get_group (node at line 39989)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_get_group"
		}"
		end


end -- class GTKRADIOACTION_EXTERNALS
