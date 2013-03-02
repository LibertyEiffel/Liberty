-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSIGNALINVOCATIONHINT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gsignalinvocationhint_struct_set_signal_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for signal_id field of GSIGNALINVOCATIONHINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalinvocationhint_struct_set_signal_id"
		}"
		end

	gsignalinvocationhint_struct_set_detail (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for detail field of GSIGNALINVOCATIONHINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalinvocationhint_struct_set_detail"
		}"
		end

	gsignalinvocationhint_struct_set_run_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for run_type field of GSIGNALINVOCATIONHINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalinvocationhint_struct_set_run_type"
		}"
		end

feature {} -- Low-level queries

	gsignalinvocationhint_struct_get_signal_id (a_structure: POINTER): NATURAL_32 is
			-- Query for signal_id field of GSIGNALINVOCATIONHINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalinvocationhint_struct_get_signal_id"
		}"
		end

	gsignalinvocationhint_struct_get_detail (a_structure: POINTER): NATURAL_32 is
			-- Query for detail field of GSIGNALINVOCATIONHINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalinvocationhint_struct_get_detail"
		}"
		end

	gsignalinvocationhint_struct_get_run_type (a_structure: POINTER): INTEGER is
			-- Query for run_type field of GSIGNALINVOCATIONHINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsignalinvocationhint_struct_get_run_type"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GSignalInvocationHint"
		}"
		end

end -- class GSIGNALINVOCATIONHINT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

