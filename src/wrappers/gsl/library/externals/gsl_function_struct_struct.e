-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_FUNCTION_STRUCT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_function_struct_struct_set_function (a_structure: POINTER; a_value: POINTER) is
			-- Setter for function field of GSL_FUNCTION_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_function_struct_struct_set_function"
		}"
		end

	gsl_function_struct_struct_set_params (a_structure: POINTER; a_value: POINTER) is
			-- Setter for params field of GSL_FUNCTION_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_function_struct_struct_set_params"
		}"
		end

feature {} -- Low-level queries

	gsl_function_struct_struct_get_function (a_structure: POINTER): POINTER is
			-- Query for function field of GSL_FUNCTION_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_function_struct_struct_get_function"
		}"
		end

	gsl_function_struct_struct_get_params (a_structure: POINTER): POINTER is
			-- Query for params field of GSL_FUNCTION_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_function_struct_struct_get_params"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_function_struct"
		}"
		end

end -- class GSL_FUNCTION_STRUCT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

