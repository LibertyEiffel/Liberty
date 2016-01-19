-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GVARIANTBUILDER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gvariantbuilder_struct_set_x (a_structure: POINTER; a_value: POINTER) is
			-- Setter for x field of GVARIANTBUILDER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gvariantbuilder_struct_set_x"
		}"
		end

feature {} -- Low-level queries

	gvariantbuilder_struct_get_x (a_structure: POINTER): POINTER is
			-- Query for x field of GVARIANTBUILDER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gvariantbuilder_struct_get_x"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GVariantBuilder"
		}"
		end

end -- class GVARIANTBUILDER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

