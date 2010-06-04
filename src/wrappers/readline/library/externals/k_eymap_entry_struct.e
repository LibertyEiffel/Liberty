-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class K_EYMAP_ENTRY_STRUCT

inherit ANY undefine is_equal, copy end

insert READLINE_TYPES
feature {} -- Low-level setters

	k_eymap_entry_struct_set_type (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for type field of K_EYMAP_ENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "k_eymap_entry_struct_set_type"
		}"
		end

	k_eymap_entry_struct_set_function (a_structure: POINTER; a_value: POINTER) is
			-- Setter for function field of K_EYMAP_ENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "k_eymap_entry_struct_set_function"
		}"
		end

feature {} -- Low-level queries

	k_eymap_entry_struct_get_type (a_structure: POINTER): CHARACTER is
			-- Query for type field of K_EYMAP_ENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "k_eymap_entry_struct_get_type"
		}"
		end

	k_eymap_entry_struct_get_function (a_structure: POINTER): POINTER is
			-- Query for function field of K_EYMAP_ENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "k_eymap_entry_struct_get_function"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__keymap_entry"
		}"
		end

end -- class K_EYMAP_ENTRY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

