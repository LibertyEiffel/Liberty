-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LOSTFRACTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = lf_exactly_half_low_level)  or else
				(a_value = lf_exactly_zero_low_level)  or else
				(a_value = lf_less_than_half_low_level)  or else
				(a_value = lf_more_than_half_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_lf_exactly_half is
		do
			value := lf_exactly_half_low_level
		end

	set_lf_exactly_zero is
		do
			value := lf_exactly_zero_low_level
		end

	set_lf_less_than_half is
		do
			value := lf_less_than_half_low_level
		end

	set_lf_more_than_half is
		do
			value := lf_more_than_half_low_level
		end

feature {ANY} -- Queries
	is_lf_exactly_half: BOOLEAN is
		do
			Result := (value=lf_exactly_half_low_level)
		end

	is_lf_exactly_zero: BOOLEAN is
		do
			Result := (value=lf_exactly_zero_low_level)
		end

	is_lf_less_than_half: BOOLEAN is
		do
			Result := (value=lf_less_than_half_low_level)
		end

	is_lf_more_than_half: BOOLEAN is
		do
			Result := (value=lf_more_than_half_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	lf_exactly_half_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfExactlyHalf"
 			}"
 		end

	lf_exactly_zero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfExactlyZero"
 			}"
 		end

	lf_less_than_half_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfLessThanHalf"
 			}"
 		end

	lf_more_than_half_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfMoreThanHalf"
 			}"
 		end


end -- class LOSTFRACTION_ENUM
