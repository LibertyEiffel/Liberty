-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOGGLEACTION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_toggle_action_get_active (an_action: POINTER): INTEGER_32 is
 		-- gtk_toggle_action_get_active (node at line 7858)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_get_active"
		}"
		end

	gtk_toggle_action_get_draw_as_radio (an_action: POINTER): INTEGER_32 is
 		-- gtk_toggle_action_get_draw_as_radio (node at line 10064)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_get_draw_as_radio"
		}"
		end

	gtk_toggle_action_set_active (an_action: POINTER; an_is_active: INTEGER_32) is
 		-- gtk_toggle_action_set_active (node at line 11737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_set_active"
		}"
		end

	gtk_toggle_action_get_type: NATURAL_64 is
 		-- gtk_toggle_action_get_type (node at line 12835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_get_type()"
		}"
		end

	gtk_toggle_action_toggled (an_action: POINTER) is
 		-- gtk_toggle_action_toggled (node at line 14341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_toggled"
		}"
		end

	gtk_toggle_action_set_draw_as_radio (an_action: POINTER; a_draw_as_radio: INTEGER_32) is
 		-- gtk_toggle_action_set_draw_as_radio (node at line 16517)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_set_draw_as_radio"
		}"
		end

	gtk_toggle_action_new (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_toggle_action_new (node at line 34573)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toggle_action_new"
		}"
		end


end -- class GTKTOGGLEACTION_EXTERNALS
