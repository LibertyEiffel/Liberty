-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLTIPS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tooltips_data_get (a_widget: POINTER): POINTER is
 		-- gtk_tooltips_data_get (node at line 4898)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_data_get"
		}"
		end

	gtk_tooltips_force_window (a_tooltips: POINTER) is
 		-- gtk_tooltips_force_window (node at line 6655)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_force_window"
		}"
		end

	gtk_tooltips_get_type: NATURAL_32 is
 		-- gtk_tooltips_get_type (node at line 8818)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_get_type()"
		}"
		end

	gtk_tooltips_set_delay (a_tooltips: POINTER; a_delay: NATURAL_32) is
 		-- gtk_tooltips_set_delay (node at line 19538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_set_delay"
		}"
		end

	gtk_tooltips_set_tip (a_tooltips: POINTER; a_widget: POINTER; a_tip_text: POINTER; a_tip_private: POINTER) is
 		-- gtk_tooltips_set_tip (node at line 23966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_set_tip"
		}"
		end

	gtk_tooltips_new: POINTER is
 		-- gtk_tooltips_new (node at line 24468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_new()"
		}"
		end

	gtk_tooltips_disable (a_tooltips: POINTER) is
 		-- gtk_tooltips_disable (node at line 28258)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_disable"
		}"
		end

	gtk_tooltips_get_info_from_tip_window (a_tip_window: POINTER; a_tooltips: POINTER; a_current_widget: POINTER): INTEGER_32 is
 		-- gtk_tooltips_get_info_from_tip_window (node at line 31017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_get_info_from_tip_window"
		}"
		end

	gtk_tooltips_enable (a_tooltips: POINTER) is
 		-- gtk_tooltips_enable (node at line 32606)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tooltips_enable"
		}"
		end


end -- class GTKTOOLTIPS_EXTERNALS
