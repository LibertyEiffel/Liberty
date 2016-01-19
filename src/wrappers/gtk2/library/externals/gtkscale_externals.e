-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCALE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_scale_add_mark (a_scale: POINTER; a_value: REAL; a_position: INTEGER; a_markup: POINTER) is
 		-- gtk_scale_add_mark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_add_mark"
		}"
		end

	-- `hidden' function _gtk_scale_clear_layout skipped.
	gtk_scale_clear_marks (a_scale: POINTER) is
 		-- gtk_scale_clear_marks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_clear_marks"
		}"
		end

	-- `hidden' function _gtk_scale_format_value skipped.
	gtk_scale_get_digits (a_scale: POINTER): INTEGER is
 		-- gtk_scale_get_digits
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_digits"
		}"
		end

	gtk_scale_get_draw_value (a_scale: POINTER): INTEGER is
 		-- gtk_scale_get_draw_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_draw_value"
		}"
		end

	gtk_scale_get_layout (a_scale: POINTER): POINTER is
 		-- gtk_scale_get_layout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_layout"
		}"
		end

	gtk_scale_get_layout_offsets (a_scale: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gtk_scale_get_layout_offsets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_layout_offsets"
		}"
		end

	gtk_scale_get_type: like long_unsigned is
 		-- gtk_scale_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_type()"
		}"
		end

	gtk_scale_get_value_pos (a_scale: POINTER): INTEGER is
 		-- gtk_scale_get_value_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_value_pos"
		}"
		end

	-- `hidden' function _gtk_scale_get_value_size skipped.
	gtk_scale_set_digits (a_scale: POINTER; a_digits: INTEGER) is
 		-- gtk_scale_set_digits
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_set_digits"
		}"
		end

	gtk_scale_set_draw_value (a_scale: POINTER; a_draw_value: INTEGER) is
 		-- gtk_scale_set_draw_value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_set_draw_value"
		}"
		end

	gtk_scale_set_value_pos (a_scale: POINTER; a_pos: INTEGER) is
 		-- gtk_scale_set_value_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_set_value_pos"
		}"
		end


end -- class GTKSCALE_EXTERNALS
