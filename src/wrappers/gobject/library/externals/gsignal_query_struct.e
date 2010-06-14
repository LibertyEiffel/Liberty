-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSIGNAL_QUERY_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gsignal_query_struct_set_signal_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for signal_id field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_set_signal_id"
		}"
		end

	gsignal_query_struct_set_signal_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for signal_name field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_set_signal_name"
		}"
		end

	gsignal_query_struct_set_itype (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for itype field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_set_itype"
		}"
		end

	gsignal_query_struct_set_signal_flags (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for signal_flags field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_set_signal_flags"
		}"
		end

	gsignal_query_struct_set_return_type (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for return_type field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_set_return_type"
		}"
		end

	gsignal_query_struct_set_n_params (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_params field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_set_n_params"
		}"
		end

	gsignal_query_struct_set_param_types (a_structure: POINTER; a_value: POINTER) is
			-- Setter for param_types field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_set_param_types"
		}"
		end

feature {} -- Low-level queries

	gsignal_query_struct_get_signal_id (a_structure: POINTER): NATURAL_32 is
			-- Query for signal_id field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_get_signal_id"
		}"
		end

	gsignal_query_struct_get_signal_name (a_structure: POINTER): POINTER is
			-- Query for signal_name field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_get_signal_name"
		}"
		end

	gsignal_query_struct_get_itype (a_structure: POINTER): NATURAL_32 is
			-- Query for itype field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_get_itype"
		}"
		end

	gsignal_query_struct_get_signal_flags (a_structure: POINTER): INTEGER is
			-- Query for signal_flags field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_get_signal_flags"
		}"
		end

	gsignal_query_struct_get_return_type (a_structure: POINTER): NATURAL_32 is
			-- Query for return_type field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_get_return_type"
		}"
		end

	gsignal_query_struct_get_n_params (a_structure: POINTER): NATURAL_32 is
			-- Query for n_params field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_get_n_params"
		}"
		end

	gsignal_query_struct_get_param_types (a_structure: POINTER): POINTER is
			-- Query for param_types field of GSIGNAL_QUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignal_query_struct_get_param_types"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GSignalQuery"
		}"
		end

end -- class GSIGNAL_QUERY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

