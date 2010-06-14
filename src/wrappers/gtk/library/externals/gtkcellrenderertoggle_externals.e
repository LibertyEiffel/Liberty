-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERTOGGLE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_toggle_set_radio (a_toggle: POINTER; a_radio: INTEGER_32) is
 		-- gtk_cell_renderer_toggle_set_radio (node at line 3843)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_set_radio"
		}"
		end

	gtk_cell_renderer_toggle_set_activatable (a_toggle: POINTER; a_setting: INTEGER_32) is
 		-- gtk_cell_renderer_toggle_set_activatable (node at line 14565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_set_activatable"
		}"
		end

	gtk_cell_renderer_toggle_set_active (a_toggle: POINTER; a_setting: INTEGER_32) is
 		-- gtk_cell_renderer_toggle_set_active (node at line 22656)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_set_active"
		}"
		end

	gtk_cell_renderer_toggle_new: POINTER is
 		-- gtk_cell_renderer_toggle_new (node at line 23738)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_new()"
		}"
		end

	gtk_cell_renderer_toggle_get_activatable (a_toggle: POINTER): INTEGER_32 is
 		-- gtk_cell_renderer_toggle_get_activatable (node at line 27226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_get_activatable"
		}"
		end

	gtk_cell_renderer_toggle_get_radio (a_toggle: POINTER): INTEGER_32 is
 		-- gtk_cell_renderer_toggle_get_radio (node at line 32750)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_get_radio"
		}"
		end

	gtk_cell_renderer_toggle_get_active (a_toggle: POINTER): INTEGER_32 is
 		-- gtk_cell_renderer_toggle_get_active (node at line 35066)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_get_active"
		}"
		end

	gtk_cell_renderer_toggle_get_type: NATURAL_32 is
 		-- gtk_cell_renderer_toggle_get_type (node at line 36048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_get_type()"
		}"
		end


end -- class GTKCELLRENDERERTOGGLE_EXTERNALS
