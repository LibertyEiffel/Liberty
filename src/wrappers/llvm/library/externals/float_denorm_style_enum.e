-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FLOAT_DENORM_STYLE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = denorm_absent_low_level)  or else
				(a_value = denorm_indeterminate_low_level)  or else
				(a_value = denorm_present_low_level) )
		end

feature -- Setters
	default_create,
	set_denorm_absent is
		do
			value := denorm_absent_low_level
		end

	set_denorm_indeterminate is
		do
			value := denorm_indeterminate_low_level
		end

	set_denorm_present is
		do
			value := denorm_present_low_level
		end

feature -- Queries
	is_denorm_absent: BOOLEAN is
		do
			Result := (value=denorm_absent_low_level)
		end

	is_denorm_indeterminate: BOOLEAN is
		do
			Result := (value=denorm_indeterminate_low_level)
		end

	is_denorm_present: BOOLEAN is
		do
			Result := (value=denorm_present_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	denorm_absent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "denorm_absent"
 			}"
 		end

	denorm_indeterminate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "denorm_indeterminate"
 			}"
 		end

	denorm_present_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "denorm_present"
 			}"
 		end


end -- class FLOAT_DENORM_STYLE_ENUM
