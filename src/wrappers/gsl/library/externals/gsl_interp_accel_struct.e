-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_INTERP_ACCEL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

	gsl_interp_accel_struct_set_cache (a_structure: POINTER; a_value: like size_t) is
			-- Setter for cache field of GSL_INTERP_ACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_accel_struct_set_cache"
		}"
		end

	gsl_interp_accel_struct_set_miss_count (a_structure: POINTER; a_value: like size_t) is
			-- Setter for miss_count field of GSL_INTERP_ACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_accel_struct_set_miss_count"
		}"
		end

	gsl_interp_accel_struct_set_hit_count (a_structure: POINTER; a_value: like size_t) is
			-- Setter for hit_count field of GSL_INTERP_ACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_accel_struct_set_hit_count"
		}"
		end

feature {} -- Low-level queries

	gsl_interp_accel_struct_get_cache (a_structure: POINTER): like size_t is
			-- Query for cache field of GSL_INTERP_ACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_accel_struct_get_cache"
		}"
		end

	gsl_interp_accel_struct_get_miss_count (a_structure: POINTER): like size_t is
			-- Query for miss_count field of GSL_INTERP_ACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_accel_struct_get_miss_count"
		}"
		end

	gsl_interp_accel_struct_get_hit_count (a_structure: POINTER): like size_t is
			-- Query for hit_count field of GSL_INTERP_ACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_interp_accel_struct_get_hit_count"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_gsl_interp_accel"
		}"
		end

end -- class GSL_INTERP_ACCEL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

