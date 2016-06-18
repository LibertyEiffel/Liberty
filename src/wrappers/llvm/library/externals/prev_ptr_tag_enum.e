-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PREV_PTR_TAG_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = full_stop_tag_low_level)  or else
				(a_value = one_digit_tag_low_level)  or else
				(a_value = stop_tag_low_level)  or else
				(a_value = zero_digit_tag_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_full_stop_tag
		do
			value := full_stop_tag_low_level
		end

	set_one_digit_tag
		do
			value := one_digit_tag_low_level
		end

	set_stop_tag
		do
			value := stop_tag_low_level
		end

	set_zero_digit_tag
		do
			value := zero_digit_tag_low_level
		end

feature {ANY} -- Queries
	is_full_stop_tag: BOOLEAN
		do
			Result := (value=full_stop_tag_low_level)
		end

	is_one_digit_tag: BOOLEAN
		do
			Result := (value=one_digit_tag_low_level)
		end

	is_stop_tag: BOOLEAN
		do
			Result := (value=stop_tag_low_level)
		end

	is_zero_digit_tag: BOOLEAN
		do
			Result := (value=zero_digit_tag_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	full_stop_tag_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "fullStopTag"
 			}"
 		end

	one_digit_tag_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "oneDigitTag"
 			}"
 		end

	stop_tag_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "stopTag"
 			}"
 		end

	zero_digit_tag_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "zeroDigitTag"
 			}"
 		end


end -- class PREV_PTR_TAG_ENUM
