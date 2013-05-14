-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSL_INTEGRATION_QAWO_ENUM_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gsl_integ_cosine_low_level)  or else
				(a_value = gsl_integ_sine_low_level) )
		end

feature -- Setters
	default_create,
	set_gsl_integ_cosine is
		do
			value := gsl_integ_cosine_low_level
		end

	set_gsl_integ_sine is
		do
			value := gsl_integ_sine_low_level
		end

feature -- Queries
	is_gsl_integ_cosine: BOOLEAN is
		do
			Result := (value=gsl_integ_cosine_low_level)
		end

	is_gsl_integ_sine: BOOLEAN is
		do
			Result := (value=gsl_integ_sine_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gsl_integ_cosine_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GSL_INTEG_COSINE"
 			}"
 		end

	gsl_integ_sine_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GSL_INTEG_SINE"
 			}"
 		end


end -- class GSL_INTEGRATION_QAWO_ENUM_ENUM
