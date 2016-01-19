-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOLORSEL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_color_selection_get_current_alpha (a_colorsel: POINTER): NATURAL_16 is
 		-- gtk_color_selection_get_current_alpha
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_current_alpha"
		}"
		end

	gtk_color_selection_get_current_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_get_current_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_current_color"
		}"
		end

	gtk_color_selection_get_has_opacity_control (a_colorsel: POINTER): INTEGER is
 		-- gtk_color_selection_get_has_opacity_control
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_has_opacity_control"
		}"
		end

	gtk_color_selection_get_has_palette (a_colorsel: POINTER): INTEGER is
 		-- gtk_color_selection_get_has_palette
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_has_palette"
		}"
		end

	gtk_color_selection_get_previous_alpha (a_colorsel: POINTER): NATURAL_16 is
 		-- gtk_color_selection_get_previous_alpha
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_previous_alpha"
		}"
		end

	gtk_color_selection_get_previous_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_get_previous_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_previous_color"
		}"
		end

	gtk_color_selection_get_type: like long_unsigned is
 		-- gtk_color_selection_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_type()"
		}"
		end

	gtk_color_selection_is_adjusting (a_colorsel: POINTER): INTEGER is
 		-- gtk_color_selection_is_adjusting
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_is_adjusting"
		}"
		end

	gtk_color_selection_new: POINTER is
 		-- gtk_color_selection_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_new()"
		}"
		end

	gtk_color_selection_palette_from_string (a_str: POINTER; a_colors: POINTER; a_n_colors: POINTER): INTEGER is
 		-- gtk_color_selection_palette_from_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_palette_from_string"
		}"
		end

	gtk_color_selection_palette_to_string (a_colors: POINTER; a_n_colors: INTEGER): POINTER is
 		-- gtk_color_selection_palette_to_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_palette_to_string"
		}"
		end

	gtk_color_selection_set_change_palette_with_screen_hook (a_func: POINTER): POINTER is
 		-- gtk_color_selection_set_change_palette_with_screen_hook
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_change_palette_with_screen_hook"
		}"
		end

	gtk_color_selection_set_current_alpha (a_colorsel: POINTER; an_alpha: NATURAL_16) is
 		-- gtk_color_selection_set_current_alpha
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_current_alpha"
		}"
		end

	gtk_color_selection_set_current_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_set_current_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_current_color"
		}"
		end

	gtk_color_selection_set_has_opacity_control (a_colorsel: POINTER; a_has_opacity: INTEGER) is
 		-- gtk_color_selection_set_has_opacity_control
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_has_opacity_control"
		}"
		end

	gtk_color_selection_set_has_palette (a_colorsel: POINTER; a_has_palette: INTEGER) is
 		-- gtk_color_selection_set_has_palette
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_has_palette"
		}"
		end

	gtk_color_selection_set_previous_alpha (a_colorsel: POINTER; an_alpha: NATURAL_16) is
 		-- gtk_color_selection_set_previous_alpha
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_previous_alpha"
		}"
		end

	gtk_color_selection_set_previous_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_set_previous_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_previous_color"
		}"
		end


end -- class GTKCOLORSEL_EXTERNALS
