-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSL_EIGEN_SORT_T_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gsl_eigen_sort_abs_asc_low_level)  or else
				(a_value = gsl_eigen_sort_abs_desc_low_level)  or else
				(a_value = gsl_eigen_sort_val_asc_low_level)  or else
				(a_value = gsl_eigen_sort_val_desc_low_level) )
		end

feature -- Setters
	default_create,
	set_gsl_eigen_sort_abs_asc is
		do
			value := gsl_eigen_sort_abs_asc_low_level
		end

	set_gsl_eigen_sort_abs_desc is
		do
			value := gsl_eigen_sort_abs_desc_low_level
		end

	set_gsl_eigen_sort_val_asc is
		do
			value := gsl_eigen_sort_val_asc_low_level
		end

	set_gsl_eigen_sort_val_desc is
		do
			value := gsl_eigen_sort_val_desc_low_level
		end

feature -- Queries
	is_gsl_eigen_sort_abs_asc: BOOLEAN is
		do
			Result := (value=gsl_eigen_sort_abs_asc_low_level)
		end

	is_gsl_eigen_sort_abs_desc: BOOLEAN is
		do
			Result := (value=gsl_eigen_sort_abs_desc_low_level)
		end

	is_gsl_eigen_sort_val_asc: BOOLEAN is
		do
			Result := (value=gsl_eigen_sort_val_asc_low_level)
		end

	is_gsl_eigen_sort_val_desc: BOOLEAN is
		do
			Result := (value=gsl_eigen_sort_val_desc_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gsl_eigen_sort_abs_asc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GSL_EIGEN_SORT_ABS_ASC"
 			}"
 		end

	gsl_eigen_sort_abs_desc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GSL_EIGEN_SORT_ABS_DESC"
 			}"
 		end

	gsl_eigen_sort_val_asc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GSL_EIGEN_SORT_VAL_ASC"
 			}"
 		end

	gsl_eigen_sort_val_desc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GSL_EIGEN_SORT_VAL_DESC"
 			}"
 		end


end -- class GSL_EIGEN_SORT_T_ENUM
