-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FLOAT_ROUND_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = round_indeterminate_low_level)  or else
				(a_value = round_to_nearest_low_level)  or else
				(a_value = round_toward_infinity_low_level)  or else
				(a_value = round_toward_neg_infinity_low_level)  or else
				(a_value = round_toward_zero_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_round_indeterminate is
		do
			value := round_indeterminate_low_level
		end

	set_round_to_nearest is
		do
			value := round_to_nearest_low_level
		end

	set_round_toward_infinity is
		do
			value := round_toward_infinity_low_level
		end

	set_round_toward_neg_infinity is
		do
			value := round_toward_neg_infinity_low_level
		end

	set_round_toward_zero is
		do
			value := round_toward_zero_low_level
		end

feature {ANY} -- Queries
	is_round_indeterminate: BOOLEAN is
		do
			Result := (value=round_indeterminate_low_level)
		end

	is_round_to_nearest: BOOLEAN is
		do
			Result := (value=round_to_nearest_low_level)
		end

	is_round_toward_infinity: BOOLEAN is
		do
			Result := (value=round_toward_infinity_low_level)
		end

	is_round_toward_neg_infinity: BOOLEAN is
		do
			Result := (value=round_toward_neg_infinity_low_level)
		end

	is_round_toward_zero: BOOLEAN is
		do
			Result := (value=round_toward_zero_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	round_indeterminate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "round_indeterminate"
 			}"
 		end

	round_to_nearest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "round_to_nearest"
 			}"
 		end

	round_toward_infinity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "round_toward_infinity"
 			}"
 		end

	round_toward_neg_infinity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "round_toward_neg_infinity"
 			}"
 		end

	round_toward_zero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "round_toward_zero"
 			}"
 		end


end -- class FLOAT_ROUND_STYLE_ENUM
