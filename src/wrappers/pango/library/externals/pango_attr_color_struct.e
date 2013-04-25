-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ATTR_COLOR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field attr.
	-- Unwrappable field color.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoAttrColor"
		}"
		end

end -- class PANGO_ATTR_COLOR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

