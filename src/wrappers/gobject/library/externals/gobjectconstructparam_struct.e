-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GOBJECTCONSTRUCTPARAM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gobjectconstructparam_struct_set_pspec (a_structure: POINTER; a_value: POINTER) is
			-- Setter for pspec field of GOBJECTCONSTRUCTPARAM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gobjectconstructparam_struct_set_pspec"
		}"
		end

	gobjectconstructparam_struct_set_value (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value field of GOBJECTCONSTRUCTPARAM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gobjectconstructparam_struct_set_value"
		}"
		end

feature {} -- Low-level queries

	gobjectconstructparam_struct_get_pspec (a_structure: POINTER): POINTER is
			-- Query for pspec field of GOBJECTCONSTRUCTPARAM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gobjectconstructparam_struct_get_pspec"
		}"
		end

	gobjectconstructparam_struct_get_value (a_structure: POINTER): POINTER is
			-- Query for value field of GOBJECTCONSTRUCTPARAM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gobjectconstructparam_struct_get_value"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GObjectConstructParam"
		}"
		end

end -- class GOBJECTCONSTRUCTPARAM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

