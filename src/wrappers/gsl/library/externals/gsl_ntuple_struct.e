-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_NTUPLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_ntuple_struct_set_file (a_structure: POINTER; a_value: POINTER) is
			-- Setter for file field of GSL_NTUPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_struct_set_file"
		}"
		end

	gsl_ntuple_struct_set_ntuple_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for ntuple_data field of GSL_NTUPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_struct_set_ntuple_data"
		}"
		end

	gsl_ntuple_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_NTUPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_struct_set_size"
		}"
		end

feature {} -- Low-level queries

	gsl_ntuple_struct_get_file (a_structure: POINTER): POINTER is
			-- Query for file field of GSL_NTUPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_struct_get_file"
		}"
		end

	gsl_ntuple_struct_get_ntuple_data (a_structure: POINTER): POINTER is
			-- Query for ntuple_data field of GSL_NTUPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_struct_get_ntuple_data"
		}"
		end

	gsl_ntuple_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_NTUPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ntuple_struct_get_size"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_ntuple"
		}"
		end

end -- class GSL_NTUPLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

