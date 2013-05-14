-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_sum_levin_utrunc_workspace_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_set_size"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_set_i (a_structure: POINTER; a_value: like size_t) is
			-- Setter for i field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_set_i"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_set_terms_used (a_structure: POINTER; a_value: like size_t) is
			-- Setter for terms_used field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_set_terms_used"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_set_sum_plain (a_structure: POINTER; a_value: REAL) is
			-- Setter for sum_plain field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_set_sum_plain"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_set_q_num (a_structure: POINTER; a_value: POINTER) is
			-- Setter for q_num field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_set_q_num"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_set_q_den (a_structure: POINTER; a_value: POINTER) is
			-- Setter for q_den field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_set_q_den"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_set_dsum (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dsum field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_set_dsum"
		}"
		end

feature {} -- Low-level queries

	gsl_sum_levin_utrunc_workspace_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_get_size"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_get_i (a_structure: POINTER): like size_t is
			-- Query for i field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_get_i"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_get_terms_used (a_structure: POINTER): like size_t is
			-- Query for terms_used field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_get_terms_used"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_get_sum_plain (a_structure: POINTER): REAL is
			-- Query for sum_plain field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_get_sum_plain"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_get_q_num (a_structure: POINTER): POINTER is
			-- Query for q_num field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_get_q_num"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_get_q_den (a_structure: POINTER): POINTER is
			-- Query for q_den field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_get_q_den"
		}"
		end

	gsl_sum_levin_utrunc_workspace_struct_get_dsum (a_structure: POINTER): POINTER is
			-- Query for dsum field of GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_sum_levin_utrunc_workspace_struct_get_dsum"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_sum_levin_utrunc_workspace"
		}"
		end

end -- class GSL_SUM_LEVIN_UTRUNC_WORKSPACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

