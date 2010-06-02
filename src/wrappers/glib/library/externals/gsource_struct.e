-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSOURCE_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	gsource_struct_set_callback_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for callback_data field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_callback_data"
		}"
		end

	gsource_struct_set_callback_funcs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for callback_funcs field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_callback_funcs"
		}"
		end

	gsource_struct_set_source_funcs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for source_funcs field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_source_funcs"
		}"
		end

	gsource_struct_set_ref_count (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ref_count field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_ref_count"
		}"
		end

	gsource_struct_set_context (a_structure: POINTER; a_value: POINTER) is
			-- Setter for context field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_context"
		}"
		end

	gsource_struct_set_priority (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for priority field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_priority"
		}"
		end

	gsource_struct_set_flags (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for flags field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_flags"
		}"
		end

	gsource_struct_set_source_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for source_id field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_source_id"
		}"
		end

	gsource_struct_set_poll_fds (a_structure: POINTER; a_value: POINTER) is
			-- Setter for poll_fds field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_poll_fds"
		}"
		end

	gsource_struct_set_prev (a_structure: POINTER; a_value: POINTER) is
			-- Setter for prev field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_prev"
		}"
		end

	gsource_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_next"
		}"
		end

	gsource_struct_set_reserved1 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for reserved1 field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_reserved1"
		}"
		end

	gsource_struct_set_reserved2 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for reserved2 field of GSOURCE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_set_reserved2"
		}"
		end

feature {} -- Low-level queries

	gsource_struct_get_callback_data (a_structure: POINTER): POINTER is
			-- Query for callback_data field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_callback_data"
		}"
		end

	gsource_struct_get_callback_funcs (a_structure: POINTER): POINTER is
			-- Query for callback_funcs field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_callback_funcs"
		}"
		end

	gsource_struct_get_source_funcs (a_structure: POINTER): POINTER is
			-- Query for source_funcs field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_source_funcs"
		}"
		end

	gsource_struct_get_ref_count (a_structure: POINTER): NATURAL_32 is
			-- Query for ref_count field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_ref_count"
		}"
		end

	gsource_struct_get_context (a_structure: POINTER): POINTER is
			-- Query for context field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_context"
		}"
		end

	gsource_struct_get_priority (a_structure: POINTER): INTEGER_32 is
			-- Query for priority field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_priority"
		}"
		end

	gsource_struct_get_flags (a_structure: POINTER): NATURAL_32 is
			-- Query for flags field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_flags"
		}"
		end

	gsource_struct_get_source_id (a_structure: POINTER): NATURAL_32 is
			-- Query for source_id field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_source_id"
		}"
		end

	gsource_struct_get_poll_fds (a_structure: POINTER): POINTER is
			-- Query for poll_fds field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_poll_fds"
		}"
		end

	gsource_struct_get_prev (a_structure: POINTER): POINTER is
			-- Query for prev field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_prev"
		}"
		end

	gsource_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_next"
		}"
		end

	gsource_struct_get_reserved1 (a_structure: POINTER): POINTER is
			-- Query for reserved1 field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_reserved1"
		}"
		end

	gsource_struct_get_reserved2 (a_structure: POINTER): POINTER is
			-- Query for reserved2 field of GSOURCE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsource_struct_get_reserved2"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GSource"
		}"
		end

end -- class GSOURCE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

