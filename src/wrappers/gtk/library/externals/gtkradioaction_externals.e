-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRADIOACTION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_radio_action_get_current_value (an_action: POINTER): INTEGER_32 is
 		-- gtk_radio_action_get_current_value (node at line 4803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_get_current_value"
		}"
		end

	gtk_radio_action_get_type: NATURAL_32 is
 		-- gtk_radio_action_get_type (node at line 7653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_get_type()"
		}"
		end

	gtk_radio_action_set_group (an_action: POINTER; a_group: POINTER) is
 		-- gtk_radio_action_set_group (node at line 8016)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_set_group"
		}"
		end

	gtk_radio_action_set_current_value (an_action: POINTER; a_current_value: INTEGER_32) is
 		-- gtk_radio_action_set_current_value (node at line 11001)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_set_current_value"
		}"
		end

	gtk_radio_action_new (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER; a_value: INTEGER_32): POINTER is
 		-- gtk_radio_action_new (node at line 27816)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_new"
		}"
		end

	gtk_radio_action_get_group (an_action: POINTER): POINTER is
 		-- gtk_radio_action_get_group (node at line 36341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_get_group"
		}"
		end


end -- class GTKRADIOACTION_EXTERNALS
