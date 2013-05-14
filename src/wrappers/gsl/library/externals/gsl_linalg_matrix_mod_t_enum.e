-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSL_LINALG_MATRIX_MOD_T_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gsl_linalg_mod_conjugate_low_level)  or else
				(a_value = gsl_linalg_mod_none_low_level)  or else
				(a_value = gsl_linalg_mod_transpose_low_level) )
		end

feature -- Setters
	default_create,
	set_gsl_linalg_mod_conjugate is
		do
			value := gsl_linalg_mod_conjugate_low_level
		end

	set_gsl_linalg_mod_none is
		do
			value := gsl_linalg_mod_none_low_level
		end

	set_gsl_linalg_mod_transpose is
		do
			value := gsl_linalg_mod_transpose_low_level
		end

feature -- Queries
	is_gsl_linalg_mod_conjugate: BOOLEAN is
		do
			Result := (value=gsl_linalg_mod_conjugate_low_level)
		end

	is_gsl_linalg_mod_none: BOOLEAN is
		do
			Result := (value=gsl_linalg_mod_none_low_level)
		end

	is_gsl_linalg_mod_transpose: BOOLEAN is
		do
			Result := (value=gsl_linalg_mod_transpose_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gsl_linalg_mod_conjugate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GSL_LINALG_MOD_CONJUGATE"
 			}"
 		end

	gsl_linalg_mod_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GSL_LINALG_MOD_NONE"
 			}"
 		end

	gsl_linalg_mod_transpose_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GSL_LINALG_MOD_TRANSPOSE"
 			}"
 		end


end -- class GSL_LINALG_MATRIX_MOD_T_ENUM
