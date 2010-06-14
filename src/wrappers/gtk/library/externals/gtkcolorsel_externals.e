-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOLORSEL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_color_selection_get_previous_alpha (a_colorsel: POINTER): NATURAL_16 is
 		-- gtk_color_selection_get_previous_alpha (node at line 1190)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_previous_alpha"
		}"
		end

	gtk_color_selection_get_current_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_get_current_color (node at line 1980)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_current_color"
		}"
		end

	gtk_color_selection_set_has_opacity_control (a_colorsel: POINTER; a_has_opacity: INTEGER_32) is
 		-- gtk_color_selection_set_has_opacity_control (node at line 3874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_has_opacity_control"
		}"
		end

	gtk_color_selection_get_has_opacity_control (a_colorsel: POINTER): INTEGER_32 is
 		-- gtk_color_selection_get_has_opacity_control (node at line 4165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_has_opacity_control"
		}"
		end

	gtk_color_selection_set_current_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_set_current_color (node at line 8091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_current_color"
		}"
		end

	gtk_color_selection_set_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_set_color (node at line 9555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_color"
		}"
		end

	gtk_color_selection_set_previous_alpha (a_colorsel: POINTER; an_alpha: NATURAL_16) is
 		-- gtk_color_selection_set_previous_alpha (node at line 13699)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_previous_alpha"
		}"
		end

	gtk_color_selection_get_type: NATURAL_32 is
 		-- gtk_color_selection_get_type (node at line 15538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_type()"
		}"
		end

	gtk_color_selection_get_previous_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_get_previous_color (node at line 17431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_previous_color"
		}"
		end

	gtk_color_selection_set_has_palette (a_colorsel: POINTER; a_has_palette: INTEGER_32) is
 		-- gtk_color_selection_set_has_palette (node at line 17648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_has_palette"
		}"
		end

	gtk_color_selection_new: POINTER is
 		-- gtk_color_selection_new (node at line 19398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_new()"
		}"
		end

	gtk_color_selection_get_current_alpha (a_colorsel: POINTER): NATURAL_16 is
 		-- gtk_color_selection_get_current_alpha (node at line 22599)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_current_alpha"
		}"
		end

	gtk_color_selection_palette_from_string (a_str: POINTER; a_colors: POINTER; a_n_colors: POINTER): INTEGER_32 is
 		-- gtk_color_selection_palette_from_string (node at line 23297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_palette_from_string"
		}"
		end

	gtk_color_selection_set_update_policy (a_colorsel: POINTER; a_policy: INTEGER) is
 		-- gtk_color_selection_set_update_policy (node at line 23404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_update_policy"
		}"
		end

	gtk_color_selection_set_current_alpha (a_colorsel: POINTER; an_alpha: NATURAL_16) is
 		-- gtk_color_selection_set_current_alpha (node at line 28206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_current_alpha"
		}"
		end

	gtk_color_selection_palette_to_string (a_colors: POINTER; a_n_colors: INTEGER_32): POINTER is
 		-- gtk_color_selection_palette_to_string (node at line 28591)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_palette_to_string"
		}"
		end

	gtk_color_selection_set_change_palette_hook (a_func: POINTER): POINTER is
 		-- gtk_color_selection_set_change_palette_hook (node at line 29366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_change_palette_hook"
		}"
		end

	gtk_color_selection_get_has_palette (a_colorsel: POINTER): INTEGER_32 is
 		-- gtk_color_selection_get_has_palette (node at line 30339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_has_palette"
		}"
		end

	gtk_color_selection_set_previous_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_set_previous_color (node at line 30766)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_previous_color"
		}"
		end

	gtk_color_selection_is_adjusting (a_colorsel: POINTER): INTEGER_32 is
 		-- gtk_color_selection_is_adjusting (node at line 31351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_is_adjusting"
		}"
		end

	gtk_color_selection_set_change_palette_with_screen_hook (a_func: POINTER): POINTER is
 		-- gtk_color_selection_set_change_palette_with_screen_hook (node at line 32114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_change_palette_with_screen_hook"
		}"
		end

	gtk_color_selection_get_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_get_color (node at line 34590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_color"
		}"
		end


end -- class GTKCOLORSEL_EXTERNALS
