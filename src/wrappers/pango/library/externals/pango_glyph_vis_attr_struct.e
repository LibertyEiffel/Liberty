-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_GLYPH_VIS_ATTR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_glyph_vis_attr_struct_set_is_cluster_start (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for is_cluster_start field of PANGO_GLYPH_VIS_ATTR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_vis_attr_struct_set_is_cluster_start"
		}"
		end

feature {} -- Low-level queries

	pango_glyph_vis_attr_struct_get_is_cluster_start (a_structure: POINTER): NATURAL_32 is
			-- Query for is_cluster_start field of PANGO_GLYPH_VIS_ATTR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_vis_attr_struct_get_is_cluster_start"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoGlyphVisAttr"
		}"
		end

end -- class PANGO_GLYPH_VIS_ATTR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

