-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GCOND_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gcond_struct_set_p (a_structure: POINTER; a_value: POINTER) is
			-- Setter for p field of GCOND_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gcond_struct_set_p"
		}"
		end

	gcond_struct_set_i (a_structure: POINTER; a_value: POINTER) is
			-- Setter for i field of GCOND_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gcond_struct_set_i"
		}"
		end

feature {} -- Low-level queries

	gcond_struct_get_p (a_structure: POINTER): POINTER is
			-- Query for p field of GCOND_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gcond_struct_get_p"
		}"
		end

	gcond_struct_get_i (a_structure: POINTER): POINTER is
			-- Query for i field of GCOND_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gcond_struct_get_i"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GCond"
		}"
		end

end -- class GCOND_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

