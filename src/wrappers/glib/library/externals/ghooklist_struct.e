-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GHOOKLIST_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	ghooklist_struct_set_seq_id (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for seq_id field of GHOOKLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_set_seq_id"
		}"
		end

	ghooklist_struct_set_hook_size (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for hook_size field of GHOOKLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_set_hook_size"
		}"
		end

	ghooklist_struct_set_is_setup (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for is_setup field of GHOOKLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_set_is_setup"
		}"
		end

	ghooklist_struct_set_hooks (a_structure: POINTER; a_value: POINTER) is
			-- Setter for hooks field of GHOOKLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_set_hooks"
		}"
		end

	ghooklist_struct_set_dummy3 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dummy3 field of GHOOKLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_set_dummy3"
		}"
		end

	ghooklist_struct_set_finalize_hook (a_structure: POINTER; a_value: POINTER) is
			-- Setter for finalize_hook field of GHOOKLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_set_finalize_hook"
		}"
		end

	ghooklist_struct_set_dummy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dummy field of GHOOKLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_set_dummy"
		}"
		end

feature {} -- Low-level queries

	ghooklist_struct_get_seq_id (a_structure: POINTER): NATURAL_64 is
			-- Query for seq_id field of GHOOKLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_get_seq_id"
		}"
		end

	ghooklist_struct_get_hook_size (a_structure: POINTER): NATURAL_32 is
			-- Query for hook_size field of GHOOKLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_get_hook_size"
		}"
		end

	ghooklist_struct_get_is_setup (a_structure: POINTER): NATURAL_32 is
			-- Query for is_setup field of GHOOKLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_get_is_setup"
		}"
		end

	ghooklist_struct_get_hooks (a_structure: POINTER): POINTER is
			-- Query for hooks field of GHOOKLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_get_hooks"
		}"
		end

	ghooklist_struct_get_dummy3 (a_structure: POINTER): POINTER is
			-- Query for dummy3 field of GHOOKLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_get_dummy3"
		}"
		end

	ghooklist_struct_get_finalize_hook (a_structure: POINTER): POINTER is
			-- Query for finalize_hook field of GHOOKLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_get_finalize_hook"
		}"
		end

	ghooklist_struct_get_dummy (a_structure: POINTER): POINTER is
			-- Query for dummy field of GHOOKLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghooklist_struct_get_dummy"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GHookList"
		}"
		end

end -- class GHOOKLIST_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

