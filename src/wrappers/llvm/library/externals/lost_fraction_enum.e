-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LOST_FRACTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = exactly_zero_low_level)  or else
				(a_value = less_than_half_low_level)  or else
				(a_value = exactly_half_low_level)  or else
				(a_value = more_than_half_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_exactly_zero is
		do
			value := exactly_zero_low_level
		end

	set_less_than_half is
		do
			value := less_than_half_low_level
		end

	set_exactly_half is
		do
			value := exactly_half_low_level
		end

	set_more_than_half is
		do
			value := more_than_half_low_level
		end

feature {ANY} -- Queries
	exactly_zero: BOOLEAN is
		do
			Result := (value=exactly_zero_low_level)
		end

	less_than_half: BOOLEAN is
		do
			Result := (value=less_than_half_low_level)
		end

	exactly_half: BOOLEAN is
		do
			Result := (value=exactly_half_low_level)
		end

	more_than_half: BOOLEAN is
		do
			Result := (value=more_than_half_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	exactly_zero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfExactlyZero"
 			}"
 		end

	less_than_half_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfLessThanHalf"
 			}"
 		end

	exactly_half_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfExactlyHalf"
 			}"
 		end

	more_than_half_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "lfMoreThanHalf"
 			}"
 		end


end -- class LOST_FRACTION_ENUM
