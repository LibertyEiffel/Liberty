-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_GLYPH_INFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_glyph_info_struct_set_glyph (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for glyph field of PANGO_GLYPH_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_info_struct_set_glyph"
		}"
		end

feature {} -- Low-level queries

	pango_glyph_info_struct_get_glyph (a_structure: POINTER): NATURAL_32 is
			-- Query for glyph field of PANGO_GLYPH_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_info_struct_get_glyph"
		}"
		end

	-- Unwrappable field geometry.
	-- Unwrappable field attr.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoGlyphInfo"
		}"
		end

end -- class PANGO_GLYPH_INFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

