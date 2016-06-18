-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FLOAT_DENORM_STYLE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = absent_low_level)  or else
				(a_value = indeterminate_low_level)  or else
				(a_value = present_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_absent
		do
			value := absent_low_level
		end

	set_indeterminate
		do
			value := indeterminate_low_level
		end

	set_present
		do
			value := present_low_level
		end

feature {ANY} -- Queries
	is_absent: BOOLEAN
		do
			Result := (value=absent_low_level)
		end

	is_indeterminate: BOOLEAN
		do
			Result := (value=indeterminate_low_level)
		end

	is_present: BOOLEAN
		do
			Result := (value=present_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	absent_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "denorm_absent"
 			}"
 		end

	indeterminate_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "denorm_indeterminate"
 			}"
 		end

	present_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "denorm_present"
 			}"
 		end


end -- class FLOAT_DENORM_STYLE_ENUM
