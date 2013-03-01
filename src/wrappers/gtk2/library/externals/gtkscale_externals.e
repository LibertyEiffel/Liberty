-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCALE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_scale_clear_layout skipped.
	gtk_scale_get_layout (a_scale: POINTER): POINTER is
 		-- gtk_scale_get_layout (node at line 8074)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_layout"
		}"
		end

	-- `hidden' function _gtk_scale_format_value skipped.
	-- `hidden' function _gtk_scale_get_value_size skipped.
	gtk_scale_get_value_pos (a_scale: POINTER): INTEGER is
 		-- gtk_scale_get_value_pos (node at line 10778)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_value_pos"
		}"
		end

	gtk_scale_get_layout_offsets (a_scale: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gtk_scale_get_layout_offsets (node at line 11027)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_layout_offsets"
		}"
		end

	gtk_scale_set_value_pos (a_scale: POINTER; a_pos: INTEGER) is
 		-- gtk_scale_set_value_pos (node at line 15216)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_set_value_pos"
		}"
		end

	gtk_scale_get_draw_value (a_scale: POINTER): INTEGER_32 is
 		-- gtk_scale_get_draw_value (node at line 16341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_draw_value"
		}"
		end

	gtk_scale_set_digits (a_scale: POINTER; a_digits: INTEGER_32) is
 		-- gtk_scale_set_digits (node at line 17679)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_set_digits"
		}"
		end

	gtk_scale_clear_marks (a_scale: POINTER) is
 		-- gtk_scale_clear_marks (node at line 19887)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_clear_marks"
		}"
		end

	gtk_scale_add_mark (a_scale: POINTER; a_value: REAL_64; a_position: INTEGER; a_markup: POINTER) is
 		-- gtk_scale_add_mark (node at line 21162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_add_mark"
		}"
		end

	gtk_scale_get_type: NATURAL_64 is
 		-- gtk_scale_get_type (node at line 31494)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_type()"
		}"
		end

	gtk_scale_get_digits (a_scale: POINTER): INTEGER_32 is
 		-- gtk_scale_get_digits (node at line 34837)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_get_digits"
		}"
		end

	gtk_scale_set_draw_value (a_scale: POINTER; a_draw_value: INTEGER_32) is
 		-- gtk_scale_set_draw_value (node at line 35273)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_set_draw_value"
		}"
		end


end -- class GTKSCALE_EXTERNALS
