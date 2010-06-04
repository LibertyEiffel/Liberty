-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class H_ISTORY_STATE_STRUCT

inherit ANY undefine is_equal, copy end

insert READLINE_TYPES
feature {} -- Low-level setters

	h_istory_state_struct_set_entries (a_structure: POINTER; a_value: POINTER) is
			-- Setter for entries field of H_ISTORY_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_istory_state_struct_set_entries"
		}"
		end

	h_istory_state_struct_set_offset (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for offset field of H_ISTORY_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_istory_state_struct_set_offset"
		}"
		end

	h_istory_state_struct_set_length (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for length field of H_ISTORY_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_istory_state_struct_set_length"
		}"
		end

	h_istory_state_struct_set_size (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for size field of H_ISTORY_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_istory_state_struct_set_size"
		}"
		end

	h_istory_state_struct_set_flags (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for flags field of H_ISTORY_STATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_istory_state_struct_set_flags"
		}"
		end

feature {} -- Low-level queries

	h_istory_state_struct_get_entries (a_structure: POINTER): POINTER is
			-- Query for entries field of H_ISTORY_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_istory_state_struct_get_entries"
		}"
		end

	h_istory_state_struct_get_offset (a_structure: POINTER): INTEGER_32 is
			-- Query for offset field of H_ISTORY_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_istory_state_struct_get_offset"
		}"
		end

	h_istory_state_struct_get_length (a_structure: POINTER): INTEGER_32 is
			-- Query for length field of H_ISTORY_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_istory_state_struct_get_length"
		}"
		end

	h_istory_state_struct_get_size (a_structure: POINTER): INTEGER_32 is
			-- Query for size field of H_ISTORY_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_istory_state_struct_get_size"
		}"
		end

	h_istory_state_struct_get_flags (a_structure: POINTER): INTEGER_32 is
			-- Query for flags field of H_ISTORY_STATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_istory_state_struct_get_flags"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__hist_state"
		}"
		end

end -- class H_ISTORY_STATE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

