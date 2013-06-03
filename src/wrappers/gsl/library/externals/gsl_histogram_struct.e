-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_HISTOGRAM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_histogram_struct_set_n (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n field of GSL_HISTOGRAM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_struct_set_n"
		}"
		end

	gsl_histogram_struct_set_range (a_structure: POINTER; a_value: POINTER) is
			-- Setter for range field of GSL_HISTOGRAM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_struct_set_range"
		}"
		end

	gsl_histogram_struct_set_bin (a_structure: POINTER; a_value: POINTER) is
			-- Setter for bin field of GSL_HISTOGRAM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_struct_set_bin"
		}"
		end

feature {} -- Low-level queries

	gsl_histogram_struct_get_n (a_structure: POINTER): like size_t is
			-- Query for n field of GSL_HISTOGRAM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_struct_get_n"
		}"
		end

	gsl_histogram_struct_get_range (a_structure: POINTER): POINTER is
			-- Query for range field of GSL_HISTOGRAM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_struct_get_range"
		}"
		end

	gsl_histogram_struct_get_bin (a_structure: POINTER): POINTER is
			-- Query for bin field of GSL_HISTOGRAM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_histogram_struct_get_bin"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_histogram"
		}"
		end

end -- class GSL_HISTOGRAM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

