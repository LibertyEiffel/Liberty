-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LOST_FRACTION_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = exactly_half_low_level)  or else
				(a_value = exactly_zero_low_level)  or else
				(a_value = less_than_half_low_level)  or else
				(a_value = more_than_half_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_exactly_half
		do
			value := exactly_half_low_level
		end

	set_exactly_zero
		do
			value := exactly_zero_low_level
		end

	set_less_than_half
		do
			value := less_than_half_low_level
		end

	set_more_than_half
		do
			value := more_than_half_low_level
		end

feature {ANY} -- Queries
	is_exactly_half: BOOLEAN
		do
			Result := (value=exactly_half_low_level)
		end

	is_exactly_zero: BOOLEAN
		do
			Result := (value=exactly_zero_low_level)
		end

	is_less_than_half: BOOLEAN
		do
			Result := (value=less_than_half_low_level)
		end

	is_more_than_half: BOOLEAN
		do
			Result := (value=more_than_half_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	exactly_half_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfExactlyHalf"
 			}"
 		end

	exactly_zero_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfExactlyZero"
 			}"
 		end

	less_than_half_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfLessThanHalf"
 			}"
 		end

	more_than_half_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfMoreThanHalf"
 			}"
 		end


end -- class LOST_FRACTION_ENUM
