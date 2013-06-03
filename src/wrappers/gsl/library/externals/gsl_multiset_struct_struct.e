-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_MULTISET_STRUCT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_multiset_struct_struct_set_n (a_structure: POINTER; a_value: like size_t) is
			-- Setter for n field of GSL_MULTISET_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_struct_struct_set_n"
		}"
		end

	gsl_multiset_struct_struct_set_k (a_structure: POINTER; a_value: like size_t) is
			-- Setter for k field of GSL_MULTISET_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_struct_struct_set_k"
		}"
		end

	gsl_multiset_struct_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GSL_MULTISET_STRUCT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_struct_struct_set_data"
		}"
		end

feature {} -- Low-level queries

	gsl_multiset_struct_struct_get_n (a_structure: POINTER): like size_t is
			-- Query for n field of GSL_MULTISET_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_struct_struct_get_n"
		}"
		end

	gsl_multiset_struct_struct_get_k (a_structure: POINTER): like size_t is
			-- Query for k field of GSL_MULTISET_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_struct_struct_get_k"
		}"
		end

	gsl_multiset_struct_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GSL_MULTISET_STRUCT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_multiset_struct_struct_get_data"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_multiset_struct"
		}"
		end

end -- class GSL_MULTISET_STRUCT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

