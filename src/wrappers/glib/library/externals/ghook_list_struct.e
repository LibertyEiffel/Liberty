-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GHOOK_LIST_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	ghook_list_struct_set_seq_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for seq_id field of GHOOK_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_set_seq_id"
		}"
		end

	ghook_list_struct_set_hook_size (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for hook_size field of GHOOK_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_set_hook_size"
		}"
		end

	ghook_list_struct_set_is_setup (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for is_setup field of GHOOK_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_set_is_setup"
		}"
		end

	ghook_list_struct_set_hooks (a_structure: POINTER; a_value: POINTER) is
			-- Setter for hooks field of GHOOK_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_set_hooks"
		}"
		end

	ghook_list_struct_set_dummy3 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dummy3 field of GHOOK_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_set_dummy3"
		}"
		end

	ghook_list_struct_set_finalize_hook (a_structure: POINTER; a_value: POINTER) is
			-- Setter for finalize_hook field of GHOOK_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_set_finalize_hook"
		}"
		end

	ghook_list_struct_set_dummy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dummy field of GHOOK_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_set_dummy"
		}"
		end

feature {} -- Low-level queries

	ghook_list_struct_get_seq_id (a_structure: POINTER): NATURAL_32 is
			-- Query for seq_id field of GHOOK_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_get_seq_id"
		}"
		end

	ghook_list_struct_get_hook_size (a_structure: POINTER): NATURAL_32 is
			-- Query for hook_size field of GHOOK_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_get_hook_size"
		}"
		end

	ghook_list_struct_get_is_setup (a_structure: POINTER): NATURAL_32 is
			-- Query for is_setup field of GHOOK_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_get_is_setup"
		}"
		end

	ghook_list_struct_get_hooks (a_structure: POINTER): POINTER is
			-- Query for hooks field of GHOOK_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_get_hooks"
		}"
		end

	ghook_list_struct_get_dummy3 (a_structure: POINTER): POINTER is
			-- Query for dummy3 field of GHOOK_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_get_dummy3"
		}"
		end

	ghook_list_struct_get_finalize_hook (a_structure: POINTER): POINTER is
			-- Query for finalize_hook field of GHOOK_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_get_finalize_hook"
		}"
		end

	ghook_list_struct_get_dummy (a_structure: POINTER): POINTER is
			-- Query for dummy field of GHOOK_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ghook_list_struct_get_dummy"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GHookList"
		}"
		end

end -- class GHOOK_LIST_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

