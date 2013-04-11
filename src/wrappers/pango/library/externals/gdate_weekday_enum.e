-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDATE_WEEKDAY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = bad_weekday_low_level)  or else
				(a_value = monday_low_level)  or else
				(a_value = tuesday_low_level)  or else
				(a_value = wednesday_low_level)  or else
				(a_value = thursday_low_level)  or else
				(a_value = friday_low_level)  or else
				(a_value = saturday_low_level)  or else
				(a_value = sunday_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bad_weekday is
		do
			value := bad_weekday_low_level
		end

	set_monday is
		do
			value := monday_low_level
		end

	set_tuesday is
		do
			value := tuesday_low_level
		end

	set_wednesday is
		do
			value := wednesday_low_level
		end

	set_thursday is
		do
			value := thursday_low_level
		end

	set_friday is
		do
			value := friday_low_level
		end

	set_saturday is
		do
			value := saturday_low_level
		end

	set_sunday is
		do
			value := sunday_low_level
		end

feature {ANY} -- Queries
	is_bad_weekday: BOOLEAN is
		do
			Result := (value=bad_weekday_low_level)
		end

	is_monday: BOOLEAN is
		do
			Result := (value=monday_low_level)
		end

	is_tuesday: BOOLEAN is
		do
			Result := (value=tuesday_low_level)
		end

	is_wednesday: BOOLEAN is
		do
			Result := (value=wednesday_low_level)
		end

	is_thursday: BOOLEAN is
		do
			Result := (value=thursday_low_level)
		end

	is_friday: BOOLEAN is
		do
			Result := (value=friday_low_level)
		end

	is_saturday: BOOLEAN is
		do
			Result := (value=saturday_low_level)
		end

	is_sunday: BOOLEAN is
		do
			Result := (value=sunday_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	bad_weekday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_BAD_WEEKDAY"
 			}"
 		end

	monday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_MONDAY"
 			}"
 		end

	tuesday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_TUESDAY"
 			}"
 		end

	wednesday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_WEDNESDAY"
 			}"
 		end

	thursday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_THURSDAY"
 			}"
 		end

	friday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_FRIDAY"
 			}"
 		end

	saturday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_SATURDAY"
 			}"
 		end

	sunday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_SUNDAY"
 			}"
 		end


end -- class GDATE_WEEKDAY_ENUM
