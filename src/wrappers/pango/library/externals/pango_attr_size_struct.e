-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ATTR_SIZE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_attr_size_struct_set_size (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for size field of PANGO_ATTR_SIZE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_size_struct_set_size"
		}"
		end

	pango_attr_size_struct_set_absolute (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for absolute field of PANGO_ATTR_SIZE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_size_struct_set_absolute"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field attr.
	pango_attr_size_struct_get_size (a_structure: POINTER): INTEGER_32 is
			-- Query for size field of PANGO_ATTR_SIZE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_size_struct_get_size"
		}"
		end

	pango_attr_size_struct_get_absolute (a_structure: POINTER): NATURAL_32 is
			-- Query for absolute field of PANGO_ATTR_SIZE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_size_struct_get_absolute"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoAttrSize"
		}"
		end

end -- class PANGO_ATTR_SIZE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

