-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOLORSEL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_color_selection_get_current_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_get_current_color (node at line 1852)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_current_color"
		}"
		end

	gtk_color_selection_set_has_opacity_control (a_colorsel: POINTER; a_has_opacity: INTEGER_32) is
 		-- gtk_color_selection_set_has_opacity_control (node at line 4042)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_has_opacity_control"
		}"
		end

	gtk_color_selection_get_has_opacity_control (a_colorsel: POINTER): INTEGER_32 is
 		-- gtk_color_selection_get_has_opacity_control (node at line 4345)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_has_opacity_control"
		}"
		end

	gtk_color_selection_get_previous_alpha (a_colorsel: POINTER): NATURAL_16 is
 		-- gtk_color_selection_get_previous_alpha (node at line 5141)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_previous_alpha"
		}"
		end

	gtk_color_selection_set_change_palette_with_screen_hook (a_func: POINTER): POINTER is
 		-- gtk_color_selection_set_change_palette_with_screen_hook (node at line 12944)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_change_palette_with_screen_hook"
		}"
		end

	gtk_color_selection_set_previous_alpha (a_colorsel: POINTER; an_alpha: NATURAL_16) is
 		-- gtk_color_selection_set_previous_alpha (node at line 14761)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_previous_alpha"
		}"
		end

	gtk_color_selection_get_type: NATURAL_64 is
 		-- gtk_color_selection_get_type (node at line 16843)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_type()"
		}"
		end

	gtk_color_selection_set_has_palette (a_colorsel: POINTER; a_has_palette: INTEGER_32) is
 		-- gtk_color_selection_set_has_palette (node at line 19346)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_has_palette"
		}"
		end

	gtk_color_selection_new: POINTER is
 		-- gtk_color_selection_new (node at line 21288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_new()"
		}"
		end

	gtk_color_selection_set_current_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_set_current_color (node at line 23238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_current_color"
		}"
		end

	gtk_color_selection_get_current_alpha (a_colorsel: POINTER): NATURAL_16 is
 		-- gtk_color_selection_get_current_alpha (node at line 24890)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_current_alpha"
		}"
		end

	gtk_color_selection_get_previous_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_get_previous_color (node at line 24917)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_previous_color"
		}"
		end

	gtk_color_selection_set_current_alpha (a_colorsel: POINTER; an_alpha: NATURAL_16) is
 		-- gtk_color_selection_set_current_alpha (node at line 31247)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_current_alpha"
		}"
		end

	gtk_color_selection_palette_to_string (a_colors: POINTER; a_n_colors: INTEGER_32): POINTER is
 		-- gtk_color_selection_palette_to_string (node at line 31630)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_palette_to_string"
		}"
		end

	gtk_color_selection_get_has_palette (a_colorsel: POINTER): INTEGER_32 is
 		-- gtk_color_selection_get_has_palette (node at line 33487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_get_has_palette"
		}"
		end

	gtk_color_selection_set_previous_color (a_colorsel: POINTER; a_color: POINTER) is
 		-- gtk_color_selection_set_previous_color (node at line 33996)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_set_previous_color"
		}"
		end

	gtk_color_selection_is_adjusting (a_colorsel: POINTER): INTEGER_32 is
 		-- gtk_color_selection_is_adjusting (node at line 34676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_is_adjusting"
		}"
		end

	gtk_color_selection_palette_from_string (a_str: POINTER; a_colors: POINTER; a_n_colors: POINTER): INTEGER_32 is
 		-- gtk_color_selection_palette_from_string (node at line 34799)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_palette_from_string"
		}"
		end


end -- class GTKCOLORSEL_EXTERNALS
