-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_GLYPH_STRING_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_glyph_string_struct_set_num_glyphs (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for num_glyphs field of PANGO_GLYPH_STRING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_struct_set_num_glyphs"
		}"
		end

	pango_glyph_string_struct_set_glyphs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for glyphs field of PANGO_GLYPH_STRING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_struct_set_glyphs"
		}"
		end

	pango_glyph_string_struct_set_log_clusters (a_structure: POINTER; a_value: POINTER) is
			-- Setter for log_clusters field of PANGO_GLYPH_STRING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_struct_set_log_clusters"
		}"
		end

	pango_glyph_string_struct_set_space (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for space field of PANGO_GLYPH_STRING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_struct_set_space"
		}"
		end

feature {} -- Low-level queries

	pango_glyph_string_struct_get_num_glyphs (a_structure: POINTER): INTEGER_32 is
			-- Query for num_glyphs field of PANGO_GLYPH_STRING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_struct_get_num_glyphs"
		}"
		end

	pango_glyph_string_struct_get_glyphs (a_structure: POINTER): POINTER is
			-- Query for glyphs field of PANGO_GLYPH_STRING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_struct_get_glyphs"
		}"
		end

	pango_glyph_string_struct_get_log_clusters (a_structure: POINTER): POINTER is
			-- Query for log_clusters field of PANGO_GLYPH_STRING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_struct_get_log_clusters"
		}"
		end

	pango_glyph_string_struct_get_space (a_structure: POINTER): INTEGER_32 is
			-- Query for space field of PANGO_GLYPH_STRING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_string_struct_get_space"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoGlyphString"
		}"
		end

end -- class PANGO_GLYPH_STRING_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

