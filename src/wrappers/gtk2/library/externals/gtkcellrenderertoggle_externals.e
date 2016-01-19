-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERTOGGLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_toggle_get_activatable (a_toggle: POINTER): INTEGER is
 		-- gtk_cell_renderer_toggle_get_activatable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_get_activatable"
		}"
		end

	gtk_cell_renderer_toggle_get_active (a_toggle: POINTER): INTEGER is
 		-- gtk_cell_renderer_toggle_get_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_get_active"
		}"
		end

	gtk_cell_renderer_toggle_get_radio (a_toggle: POINTER): INTEGER is
 		-- gtk_cell_renderer_toggle_get_radio
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_get_radio"
		}"
		end

	gtk_cell_renderer_toggle_get_type: like long_unsigned is
 		-- gtk_cell_renderer_toggle_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_get_type()"
		}"
		end

	gtk_cell_renderer_toggle_new: POINTER is
 		-- gtk_cell_renderer_toggle_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_new()"
		}"
		end

	gtk_cell_renderer_toggle_set_activatable (a_toggle: POINTER; a_setting: INTEGER) is
 		-- gtk_cell_renderer_toggle_set_activatable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_set_activatable"
		}"
		end

	gtk_cell_renderer_toggle_set_active (a_toggle: POINTER; a_setting: INTEGER) is
 		-- gtk_cell_renderer_toggle_set_active
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_set_active"
		}"
		end

	gtk_cell_renderer_toggle_set_radio (a_toggle: POINTER; a_radio: INTEGER) is
 		-- gtk_cell_renderer_toggle_set_radio
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_toggle_set_radio"
		}"
		end


end -- class GTKCELLRENDERERTOGGLE_EXTERNALS
