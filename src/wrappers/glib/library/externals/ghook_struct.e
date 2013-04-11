-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GHOOK_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	ghook_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GHOOK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_set_data"
		}"
		end

	ghook_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of GHOOK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_set_next"
		}"
		end

	ghook_struct_set_prev (a_structure: POINTER; a_value: POINTER) is
			-- Setter for prev field of GHOOK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_set_prev"
		}"
		end

	ghook_struct_set_ref_count (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ref_count field of GHOOK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_set_ref_count"
		}"
		end

	ghook_struct_set_hook_id (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for hook_id field of GHOOK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_set_hook_id"
		}"
		end

	ghook_struct_set_flags (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for flags field of GHOOK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_set_flags"
		}"
		end

	ghook_struct_set_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for func field of GHOOK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_set_func"
		}"
		end

	ghook_struct_set_destroy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for destroy field of GHOOK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_set_destroy"
		}"
		end

feature {} -- Low-level queries

	ghook_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GHOOK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_get_data"
		}"
		end

	ghook_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of GHOOK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_get_next"
		}"
		end

	ghook_struct_get_prev (a_structure: POINTER): POINTER is
			-- Query for prev field of GHOOK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_get_prev"
		}"
		end

	ghook_struct_get_ref_count (a_structure: POINTER): NATURAL_32 is
			-- Query for ref_count field of GHOOK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_get_ref_count"
		}"
		end

	ghook_struct_get_hook_id (a_structure: POINTER): NATURAL_64 is
			-- Query for hook_id field of GHOOK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_get_hook_id"
		}"
		end

	ghook_struct_get_flags (a_structure: POINTER): NATURAL_32 is
			-- Query for flags field of GHOOK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_get_flags"
		}"
		end

	ghook_struct_get_func (a_structure: POINTER): POINTER is
			-- Query for func field of GHOOK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_get_func"
		}"
		end

	ghook_struct_get_destroy (a_structure: POINTER): POINTER is
			-- Query for destroy field of GHOOK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_struct_get_destroy"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GHook"
		}"
		end

end -- class GHOOK_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

