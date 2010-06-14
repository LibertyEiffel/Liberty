-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCALE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_scale_clear_layout skipped.
	gtk_scale_get_layout (a_scale: POINTER): POINTER is
 		-- gtk_scale_get_layout (node at line 7391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_layout"
		}"
		end

	gtk_scale_clear_marks (a_scale: POINTER) is
 		-- gtk_scale_clear_marks (node at line 8432)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_clear_marks"
		}"
		end

	-- `hidden' function _gtk_scale_format_value skipped.
	-- `hidden' function _gtk_scale_get_value_size skipped.
	gtk_scale_get_value_pos (a_scale: POINTER): INTEGER is
 		-- gtk_scale_get_value_pos (node at line 10015)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_value_pos"
		}"
		end

	gtk_scale_get_layout_offsets (a_scale: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gtk_scale_get_layout_offsets (node at line 10238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_layout_offsets"
		}"
		end

	gtk_scale_set_value_pos (a_scale: POINTER; a_pos: INTEGER) is
 		-- gtk_scale_set_value_pos (node at line 14079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_set_value_pos"
		}"
		end

	gtk_scale_set_digits (a_scale: POINTER; a_digits: INTEGER_32) is
 		-- gtk_scale_set_digits (node at line 16240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_set_digits"
		}"
		end

	gtk_scale_add_mark (a_scale: POINTER; a_value: REAL_64; a_position: INTEGER; a_markup: POINTER) is
 		-- gtk_scale_add_mark (node at line 19301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_add_mark"
		}"
		end

	gtk_scale_get_draw_value (a_scale: POINTER): INTEGER_32 is
 		-- gtk_scale_get_draw_value (node at line 26574)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_draw_value"
		}"
		end

	gtk_scale_get_type: NATURAL_32 is
 		-- gtk_scale_get_type (node at line 28497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_type()"
		}"
		end

	gtk_scale_get_digits (a_scale: POINTER): INTEGER_32 is
 		-- gtk_scale_get_digits (node at line 31500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_digits"
		}"
		end

	gtk_scale_set_draw_value (a_scale: POINTER; a_draw_value: INTEGER_32) is
 		-- gtk_scale_set_draw_value (node at line 31909)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_set_draw_value"
		}"
		end


end -- class GTKSCALE_EXTERNALS
