-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_GLYPH_ITEM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_glyph_item_struct_set_item (a_structure: POINTER; a_value: POINTER) is
			-- Setter for item field of PANGO_GLYPH_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_struct_set_item"
		}"
		end

	pango_glyph_item_struct_set_glyphs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for glyphs field of PANGO_GLYPH_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_struct_set_glyphs"
		}"
		end

feature {} -- Low-level queries

	pango_glyph_item_struct_get_item (a_structure: POINTER): POINTER is
			-- Query for item field of PANGO_GLYPH_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_struct_get_item"
		}"
		end

	pango_glyph_item_struct_get_glyphs (a_structure: POINTER): POINTER is
			-- Query for glyphs field of PANGO_GLYPH_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_struct_get_glyphs"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoGlyphItem"
		}"
		end

end -- class PANGO_GLYPH_ITEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

