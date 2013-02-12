-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class HISTORY_STATE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	READLINE_TYPES
feature {} -- Low-level setters

	history_state_struct_set_entries (a_structure: POINTER; a_value: POINTER) is
			-- Setter for entries field of HISTORY_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_state_struct_set_entries"
		}"
		end

	history_state_struct_set_offset (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for offset field of HISTORY_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_state_struct_set_offset"
		}"
		end

	history_state_struct_set_length (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for length field of HISTORY_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_state_struct_set_length"
		}"
		end

	history_state_struct_set_size (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for size field of HISTORY_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_state_struct_set_size"
		}"
		end

	history_state_struct_set_flags (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for flags field of HISTORY_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_state_struct_set_flags"
		}"
		end

feature {} -- Low-level queries

	history_state_struct_get_entries (a_structure: POINTER): POINTER is
			-- Query for entries field of HISTORY_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_state_struct_get_entries"
		}"
		end

	history_state_struct_get_offset (a_structure: POINTER): INTEGER_32 is
			-- Query for offset field of HISTORY_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_state_struct_get_offset"
		}"
		end

	history_state_struct_get_length (a_structure: POINTER): INTEGER_32 is
			-- Query for length field of HISTORY_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_state_struct_get_length"
		}"
		end

	history_state_struct_get_size (a_structure: POINTER): INTEGER_32 is
			-- Query for size field of HISTORY_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_state_struct_get_size"
		}"
		end

	history_state_struct_get_flags (a_structure: POINTER): INTEGER_32 is
			-- Query for flags field of HISTORY_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "history_state_struct_get_flags"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__hist_state"
		}"
		end

end -- class HISTORY_STATE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

