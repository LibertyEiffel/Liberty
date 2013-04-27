-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOGGLEACTION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_toggle_action_get_active (an_action: POINTER): INTEGER is
 		-- gtk_toggle_action_get_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_get_active"
		}"
		end

	gtk_toggle_action_get_draw_as_radio (an_action: POINTER): INTEGER is
 		-- gtk_toggle_action_get_draw_as_radio
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_get_draw_as_radio"
		}"
		end

	gtk_toggle_action_get_type: like long_unsigned is
 		-- gtk_toggle_action_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_get_type()"
		}"
		end

	gtk_toggle_action_new (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_toggle_action_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_new"
		}"
		end

	gtk_toggle_action_set_active (an_action: POINTER; an_is_active: INTEGER) is
 		-- gtk_toggle_action_set_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_set_active"
		}"
		end

	gtk_toggle_action_set_draw_as_radio (an_action: POINTER; a_draw_as_radio: INTEGER) is
 		-- gtk_toggle_action_set_draw_as_radio
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_set_draw_as_radio"
		}"
		end

	gtk_toggle_action_toggled (an_action: POINTER) is
 		-- gtk_toggle_action_toggled
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_toggled"
		}"
		end


end -- class GTKTOGGLEACTION_EXTERNALS
