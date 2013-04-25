-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ATTR_FLOAT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_attr_float_struct_set_value (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for value field of PANGO_ATTR_FLOAT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_float_struct_set_value"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field attr.
	pango_attr_float_struct_get_value (a_structure: POINTER): REAL_64 is
			-- Query for value field of PANGO_ATTR_FLOAT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_float_struct_get_value"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoAttrFloat"
		}"
		end

end -- class PANGO_ATTR_FLOAT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

