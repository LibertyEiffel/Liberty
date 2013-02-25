-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_GLYPH_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_glyph_string_get_width (a_glyphs: POINTER): INTEGER_32 is
 		-- pango_glyph_string_get_width (node at line 289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_get_width"
		}"
		end

	pango_glyph_string_extents (a_glyphs: POINTER; a_font: POINTER; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_glyph_string_extents (node at line 1034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_extents"
		}"
		end

	pango_glyph_string_extents_range (a_glyphs: POINTER; a_start: INTEGER_32; an_end_external: INTEGER_32; a_font: POINTER; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_glyph_string_extents_range (node at line 1632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_extents_range"
		}"
		end

	pango_glyph_string_x_to_index (a_glyphs: POINTER; a_text: POINTER; a_length: INTEGER_32; an_analysis: POINTER; a_x_pos: INTEGER_32; an_index: POINTER; a_trailing: POINTER) is
 		-- pango_glyph_string_x_to_index (node at line 1732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_x_to_index"
		}"
		end

	pango_shape (a_text: POINTER; a_length: INTEGER_32; an_analysis: POINTER; a_glyphs: POINTER) is
 		-- pango_shape (node at line 1856)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_shape"
		}"
		end

	pango_glyph_string_index_to_x (a_glyphs: POINTER; a_text: POINTER; a_length: INTEGER_32; an_analysis: POINTER; an_index: INTEGER_32; a_trailing: INTEGER_32; a_x_pos: POINTER) is
 		-- pango_glyph_string_index_to_x (node at line 3181)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_index_to_x"
		}"
		end

	pango_reorder_items (a_logical_items: POINTER): POINTER is
 		-- pango_reorder_items (node at line 4480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_reorder_items"
		}"
		end

	pango_glyph_string_new: POINTER is
 		-- pango_glyph_string_new (node at line 6917)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_new()"
		}"
		end

	pango_glyph_string_free (a_string: POINTER) is
 		-- pango_glyph_string_free (node at line 7157)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_free"
		}"
		end

	pango_glyph_string_get_logical_widths (a_glyphs: POINTER; a_text: POINTER; a_length: INTEGER_32; an_embedding_level: INTEGER_32; a_logical_widths: POINTER) is
 		-- pango_glyph_string_get_logical_widths (node at line 8672)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_get_logical_widths"
		}"
		end

	pango_glyph_string_copy (a_string: POINTER): POINTER is
 		-- pango_glyph_string_copy (node at line 8797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_copy"
		}"
		end

	pango_glyph_string_get_type: NATURAL_64 is
 		-- pango_glyph_string_get_type (node at line 9046)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_get_type()"
		}"
		end

	pango_glyph_string_set_size (a_string: POINTER; a_new_len: INTEGER_32) is
 		-- pango_glyph_string_set_size (node at line 10178)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_set_size"
		}"
		end


end -- class PANGO_GLYPH_EXTERNALS
