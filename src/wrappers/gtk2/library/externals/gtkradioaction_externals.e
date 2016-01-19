-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRADIOACTION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_radio_action_get_current_value (an_action: POINTER): INTEGER is
 		-- gtk_radio_action_get_current_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_get_current_value"
		}"
		end

	gtk_radio_action_get_group (an_action: POINTER): POINTER is
 		-- gtk_radio_action_get_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_get_group"
		}"
		end

	gtk_radio_action_get_type: like long_unsigned is
 		-- gtk_radio_action_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_get_type()"
		}"
		end

	gtk_radio_action_new (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER; a_value: INTEGER): POINTER is
 		-- gtk_radio_action_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_new"
		}"
		end

	gtk_radio_action_set_current_value (an_action: POINTER; a_current_value: INTEGER) is
 		-- gtk_radio_action_set_current_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_set_current_value"
		}"
		end

	gtk_radio_action_set_group (an_action: POINTER; a_group: POINTER) is
 		-- gtk_radio_action_set_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_radio_action_set_group"
		}"
		end


end -- class GTKRADIOACTION_EXTERNALS
