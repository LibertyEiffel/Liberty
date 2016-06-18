-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FLOAT_ROUND_STYLE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = indeterminate_low_level)  or else
				(a_value = to_nearest_low_level)  or else
				(a_value = toward_infinity_low_level)  or else
				(a_value = toward_neg_infinity_low_level)  or else
				(a_value = toward_zero_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_indeterminate
		do
			value := indeterminate_low_level
		end

	set_to_nearest
		do
			value := to_nearest_low_level
		end

	set_toward_infinity
		do
			value := toward_infinity_low_level
		end

	set_toward_neg_infinity
		do
			value := toward_neg_infinity_low_level
		end

	set_toward_zero
		do
			value := toward_zero_low_level
		end

feature {ANY} -- Queries
	is_indeterminate: BOOLEAN
		do
			Result := (value=indeterminate_low_level)
		end

	is_to_nearest: BOOLEAN
		do
			Result := (value=to_nearest_low_level)
		end

	is_toward_infinity: BOOLEAN
		do
			Result := (value=toward_infinity_low_level)
		end

	is_toward_neg_infinity: BOOLEAN
		do
			Result := (value=toward_neg_infinity_low_level)
		end

	is_toward_zero: BOOLEAN
		do
			Result := (value=toward_zero_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	indeterminate_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "round_indeterminate"
 			}"
 		end

	to_nearest_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "round_to_nearest"
 			}"
 		end

	toward_infinity_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "round_toward_infinity"
 			}"
 		end

	toward_neg_infinity_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "round_toward_neg_infinity"
 			}"
 		end

	toward_zero_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "round_toward_zero"
 			}"
 		end


end -- class FLOAT_ROUND_STYLE_ENUM
