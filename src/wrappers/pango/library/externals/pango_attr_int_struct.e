-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ATTR_INT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_attr_int_struct_set_value (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for value field of PANGO_ATTR_INT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_int_struct_set_value"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field attr.
	pango_attr_int_struct_get_value (a_structure: POINTER): INTEGER_32 is
			-- Query for value field of PANGO_ATTR_INT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_int_struct_get_value"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoAttrInt"
		}"
		end

end -- class PANGO_ATTR_INT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

