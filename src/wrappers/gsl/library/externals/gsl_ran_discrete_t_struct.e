-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_RAN_DISCRETE_T_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_ran_discrete_t_struct_set_k (a_structure: POINTER; a_value: like size_t) is
			-- Setter for K field of GSL_RAN_DISCRETE_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_discrete_t_struct_set_k"
		}"
		end

	gsl_ran_discrete_t_struct_set_a (a_structure: POINTER; a_value: POINTER) is
			-- Setter for A field of GSL_RAN_DISCRETE_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_discrete_t_struct_set_a"
		}"
		end

	gsl_ran_discrete_t_struct_set_f (a_structure: POINTER; a_value: POINTER) is
			-- Setter for F field of GSL_RAN_DISCRETE_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_discrete_t_struct_set_f"
		}"
		end

feature {} -- Low-level queries

	gsl_ran_discrete_t_struct_get_k (a_structure: POINTER): like size_t is
			-- Query for K field of GSL_RAN_DISCRETE_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_discrete_t_struct_get_k"
		}"
		end

	gsl_ran_discrete_t_struct_get_a (a_structure: POINTER): POINTER is
			-- Query for A field of GSL_RAN_DISCRETE_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_discrete_t_struct_get_a"
		}"
		end

	gsl_ran_discrete_t_struct_get_f (a_structure: POINTER): POINTER is
			-- Query for F field of GSL_RAN_DISCRETE_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_ran_discrete_t_struct_get_f"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_ran_discrete_t"
		}"
		end

end -- class GSL_RAN_DISCRETE_T_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

