-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSL_FFT_DIRECTION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = backward_low_level)  or else
				(a_value = forward_low_level)  or else
				(a_value = gsl_fft_backward_low_level)  or else
				(a_value = gsl_fft_forward_low_level) )
		end

feature -- Setters
	default_create,
	set_backward is
		do
			value := backward_low_level
		end

	set_forward is
		do
			value := forward_low_level
		end

	set_gsl_fft_backward is
		do
			value := gsl_fft_backward_low_level
		end

	set_gsl_fft_forward is
		do
			value := gsl_fft_forward_low_level
		end

feature -- Queries
	is_backward: BOOLEAN is
		do
			Result := (value=backward_low_level)
		end

	is_forward: BOOLEAN is
		do
			Result := (value=forward_low_level)
		end

	is_gsl_fft_backward: BOOLEAN is
		do
			Result := (value=gsl_fft_backward_low_level)
		end

	is_gsl_fft_forward: BOOLEAN is
		do
			Result := (value=gsl_fft_forward_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "backward"
 			}"
 		end

	forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "forward"
 			}"
 		end

	gsl_fft_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "gsl_fft_backward"
 			}"
 		end

	gsl_fft_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "gsl_fft_forward"
 			}"
 		end


end -- class GSL_FFT_DIRECTION_ENUM
