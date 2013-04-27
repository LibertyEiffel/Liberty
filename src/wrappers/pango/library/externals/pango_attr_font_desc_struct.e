-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ATTR_FONT_DESC_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_attr_font_desc_struct_set_desc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for desc field of PANGO_ATTR_FONT_DESC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_font_desc_struct_set_desc"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field attr.
	pango_attr_font_desc_struct_get_desc (a_structure: POINTER): POINTER is
			-- Query for desc field of PANGO_ATTR_FONT_DESC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_font_desc_struct_get_desc"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoAttrFontDesc"
		}"
		end

end -- class PANGO_ATTR_FONT_DESC_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

