-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class U_NDO_LIST_STRUCT

inherit ANY undefine is_equal, copy end

insert READLINE_TYPES
feature {} -- Low-level setters

	u_ndo_list_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of U_NDO_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "u_ndo_list_struct_set_next"
		}"
		end

	u_ndo_list_struct_set_start (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for start field of U_NDO_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "u_ndo_list_struct_set_start"
		}"
		end

	u_ndo_list_struct_set_end_external (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for end field of U_NDO_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "u_ndo_list_struct_set_end_external"
		}"
		end

	u_ndo_list_struct_set_text (a_structure: POINTER; a_value: POINTER) is
			-- Setter for text field of U_NDO_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "u_ndo_list_struct_set_text"
		}"
		end

	u_ndo_list_struct_set_what (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for what field of U_NDO_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "u_ndo_list_struct_set_what"
		}"
		end

feature {} -- Low-level queries

	u_ndo_list_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of U_NDO_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "u_ndo_list_struct_get_next"
		}"
		end

	u_ndo_list_struct_get_start (a_structure: POINTER): INTEGER_32 is
			-- Query for start field of U_NDO_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "u_ndo_list_struct_get_start"
		}"
		end

	u_ndo_list_struct_get_end_external (a_structure: POINTER): INTEGER_32 is
			-- Query for end field of U_NDO_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "u_ndo_list_struct_get_end_external"
		}"
		end

	u_ndo_list_struct_get_text (a_structure: POINTER): POINTER is
			-- Query for text field of U_NDO_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "u_ndo_list_struct_get_text"
		}"
		end

	u_ndo_list_struct_get_what (a_structure: POINTER): INTEGER is
			-- Query for what field of U_NDO_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "u_ndo_list_struct_get_what"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_undo_list"
		}"
		end

end -- class U_NDO_LIST_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

