-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_RENDERER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_renderer_get_matrix (a_renderer: POINTER): POINTER is
 		-- pango_renderer_get_matrix (node at line 699)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_get_matrix"
		}"
		end

	pango_renderer_get_type: NATURAL_64 is
 		-- pango_renderer_get_type (node at line 1102)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_get_type()"
		}"
		end

	pango_renderer_deactivate (a_renderer: POINTER) is
 		-- pango_renderer_deactivate (node at line 1252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_deactivate"
		}"
		end

	pango_renderer_set_matrix (a_renderer: POINTER; a_matrix: POINTER) is
 		-- pango_renderer_set_matrix (node at line 1693)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_set_matrix"
		}"
		end

	pango_renderer_draw_layout_line (a_renderer: POINTER; a_line: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- pango_renderer_draw_layout_line (node at line 1874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_draw_layout_line"
		}"
		end

	pango_renderer_draw_glyph_item (a_renderer: POINTER; a_text: POINTER; a_glyph_item: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- pango_renderer_draw_glyph_item (node at line 2064)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_draw_glyph_item"
		}"
		end

	pango_renderer_draw_rectangle (a_renderer: POINTER; a_part: INTEGER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- pango_renderer_draw_rectangle (node at line 2133)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_draw_rectangle"
		}"
		end

	pango_renderer_draw_layout (a_renderer: POINTER; a_layout: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- pango_renderer_draw_layout (node at line 2268)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_draw_layout"
		}"
		end

	pango_renderer_draw_error_underline (a_renderer: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- pango_renderer_draw_error_underline (node at line 5356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_draw_error_underline"
		}"
		end

	pango_renderer_set_color (a_renderer: POINTER; a_part: INTEGER; a_color: POINTER) is
 		-- pango_renderer_set_color (node at line 5943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_set_color"
		}"
		end

	pango_renderer_activate (a_renderer: POINTER) is
 		-- pango_renderer_activate (node at line 7093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_activate"
		}"
		end

	pango_renderer_get_color (a_renderer: POINTER; a_part: INTEGER): POINTER is
 		-- pango_renderer_get_color (node at line 7542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_get_color"
		}"
		end

	pango_renderer_draw_glyph (a_renderer: POINTER; a_font: POINTER; a_glyph: NATURAL_32; a_x: REAL_64; a_y: REAL_64) is
 		-- pango_renderer_draw_glyph (node at line 7558)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_draw_glyph"
		}"
		end

	pango_renderer_draw_glyphs (a_renderer: POINTER; a_font: POINTER; a_glyphs: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- pango_renderer_draw_glyphs (node at line 8369)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_draw_glyphs"
		}"
		end

	pango_renderer_draw_trapezoid (a_renderer: POINTER; a_part: INTEGER; a_y1: REAL_64; a_x11: REAL_64; a_x21: REAL_64; a_y2: REAL_64; a_x12: REAL_64; a_x22: REAL_64) is
 		-- pango_renderer_draw_trapezoid (node at line 8706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_draw_trapezoid"
		}"
		end

	pango_renderer_part_changed (a_renderer: POINTER; a_part: INTEGER) is
 		-- pango_renderer_part_changed (node at line 9155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_part_changed"
		}"
		end

	pango_renderer_get_layout_line (a_renderer: POINTER): POINTER is
 		-- pango_renderer_get_layout_line (node at line 10366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_get_layout_line"
		}"
		end

	pango_renderer_get_layout (a_renderer: POINTER): POINTER is
 		-- pango_renderer_get_layout (node at line 10721)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_get_layout"
		}"
		end


end -- class PANGO_RENDERER_EXTERNALS
