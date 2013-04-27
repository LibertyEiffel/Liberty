-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTRASHSTACK_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gtrashstack_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of GTRASHSTACK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtrashstack_struct_set_next"
		}"
		end

feature {} -- Low-level queries

	gtrashstack_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of GTRASHSTACK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtrashstack_struct_get_next"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTrashStack"
		}"
		end

end -- class GTRASHSTACK_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

