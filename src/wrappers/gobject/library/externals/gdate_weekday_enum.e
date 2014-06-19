-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDATE_WEEKDAY_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_date_bad_weekday_low_level)  or else
				(a_value = g_date_friday_low_level)  or else
				(a_value = g_date_monday_low_level)  or else
				(a_value = g_date_saturday_low_level)  or else
				(a_value = g_date_sunday_low_level)  or else
				(a_value = g_date_thursday_low_level)  or else
				(a_value = g_date_tuesday_low_level)  or else
				(a_value = g_date_wednesday_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_date_bad_weekday
		do
			value := g_date_bad_weekday_low_level
		end

	set_g_date_friday
		do
			value := g_date_friday_low_level
		end

	set_g_date_monday
		do
			value := g_date_monday_low_level
		end

	set_g_date_saturday
		do
			value := g_date_saturday_low_level
		end

	set_g_date_sunday
		do
			value := g_date_sunday_low_level
		end

	set_g_date_thursday
		do
			value := g_date_thursday_low_level
		end

	set_g_date_tuesday
		do
			value := g_date_tuesday_low_level
		end

	set_g_date_wednesday
		do
			value := g_date_wednesday_low_level
		end

feature {ANY} -- Queries
	is_g_date_bad_weekday: BOOLEAN
		do
			Result := (value=g_date_bad_weekday_low_level)
		end

	is_g_date_friday: BOOLEAN
		do
			Result := (value=g_date_friday_low_level)
		end

	is_g_date_monday: BOOLEAN
		do
			Result := (value=g_date_monday_low_level)
		end

	is_g_date_saturday: BOOLEAN
		do
			Result := (value=g_date_saturday_low_level)
		end

	is_g_date_sunday: BOOLEAN
		do
			Result := (value=g_date_sunday_low_level)
		end

	is_g_date_thursday: BOOLEAN
		do
			Result := (value=g_date_thursday_low_level)
		end

	is_g_date_tuesday: BOOLEAN
		do
			Result := (value=g_date_tuesday_low_level)
		end

	is_g_date_wednesday: BOOLEAN
		do
			Result := (value=g_date_wednesday_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_date_bad_weekday_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_BAD_WEEKDAY"
 			}"
 		end

	g_date_friday_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_FRIDAY"
 			}"
 		end

	g_date_monday_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_MONDAY"
 			}"
 		end

	g_date_saturday_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_SATURDAY"
 			}"
 		end

	g_date_sunday_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_SUNDAY"
 			}"
 		end

	g_date_thursday_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_THURSDAY"
 			}"
 		end

	g_date_tuesday_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_TUESDAY"
 			}"
 		end

	g_date_wednesday_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_WEDNESDAY"
 			}"
 		end


end -- class GDATE_WEEKDAY_ENUM
