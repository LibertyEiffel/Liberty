-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_COMPLEX_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_complex_struct_set_dat (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dat field of GSL_COMPLEX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_complex_struct_set_dat"
		}"
		end

feature {} -- Low-level queries

	gsl_complex_struct_get_dat (a_structure: POINTER): POINTER is
			-- Query for dat field of GSL_COMPLEX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_complex_struct_get_dat"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_complex"
		}"
		end

end -- class GSL_COMPLEX_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

