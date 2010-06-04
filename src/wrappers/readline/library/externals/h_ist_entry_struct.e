-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class H_IST_ENTRY_STRUCT

inherit ANY undefine is_equal, copy end

insert READLINE_TYPES
feature {} -- Low-level setters

	h_ist_entry_struct_set_line (a_structure: POINTER; a_value: POINTER) is
			-- Setter for line field of H_IST_ENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_ist_entry_struct_set_line"
		}"
		end

	h_ist_entry_struct_set_timestamp (a_structure: POINTER; a_value: POINTER) is
			-- Setter for timestamp field of H_IST_ENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_ist_entry_struct_set_timestamp"
		}"
		end

	h_ist_entry_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of H_IST_ENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_ist_entry_struct_set_data"
		}"
		end

feature {} -- Low-level queries

	h_ist_entry_struct_get_line (a_structure: POINTER): POINTER is
			-- Query for line field of H_IST_ENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_ist_entry_struct_get_line"
		}"
		end

	h_ist_entry_struct_get_timestamp (a_structure: POINTER): POINTER is
			-- Query for timestamp field of H_IST_ENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_ist_entry_struct_get_timestamp"
		}"
		end

	h_ist_entry_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of H_IST_ENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "h_ist_entry_struct_get_data"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__hist_entry"
		}"
		end

end -- class H_IST_ENTRY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

