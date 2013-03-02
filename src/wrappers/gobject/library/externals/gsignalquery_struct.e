-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSIGNALQUERY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gsignalquery_struct_set_signal_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for signal_id field of GSIGNALQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_set_signal_id"
		}"
		end

	gsignalquery_struct_set_signal_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for signal_name field of GSIGNALQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_set_signal_name"
		}"
		end

	gsignalquery_struct_set_itype (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for itype field of GSIGNALQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_set_itype"
		}"
		end

	gsignalquery_struct_set_signal_flags (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for signal_flags field of GSIGNALQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_set_signal_flags"
		}"
		end

	gsignalquery_struct_set_return_type (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for return_type field of GSIGNALQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_set_return_type"
		}"
		end

	gsignalquery_struct_set_n_params (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_params field of GSIGNALQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_set_n_params"
		}"
		end

	gsignalquery_struct_set_param_types (a_structure: POINTER; a_value: POINTER) is
			-- Setter for param_types field of GSIGNALQUERY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_set_param_types"
		}"
		end

feature {} -- Low-level queries

	gsignalquery_struct_get_signal_id (a_structure: POINTER): NATURAL_32 is
			-- Query for signal_id field of GSIGNALQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_get_signal_id"
		}"
		end

	gsignalquery_struct_get_signal_name (a_structure: POINTER): POINTER is
			-- Query for signal_name field of GSIGNALQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_get_signal_name"
		}"
		end

	gsignalquery_struct_get_itype (a_structure: POINTER): NATURAL_64 is
			-- Query for itype field of GSIGNALQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_get_itype"
		}"
		end

	gsignalquery_struct_get_signal_flags (a_structure: POINTER): INTEGER is
			-- Query for signal_flags field of GSIGNALQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_get_signal_flags"
		}"
		end

	gsignalquery_struct_get_return_type (a_structure: POINTER): NATURAL_64 is
			-- Query for return_type field of GSIGNALQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_get_return_type"
		}"
		end

	gsignalquery_struct_get_n_params (a_structure: POINTER): NATURAL_32 is
			-- Query for n_params field of GSIGNALQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_get_n_params"
		}"
		end

	gsignalquery_struct_get_param_types (a_structure: POINTER): POINTER is
			-- Query for param_types field of GSIGNALQUERY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalquery_struct_get_param_types"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GSignalQuery"
		}"
		end

end -- class GSIGNALQUERY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

