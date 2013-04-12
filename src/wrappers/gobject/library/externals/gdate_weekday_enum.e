-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDATE_WEEKDAY_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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

feature -- Setters
	default_create,
	set_g_date_bad_weekday is
		do
			value := g_date_bad_weekday_low_level
		end

	set_g_date_friday is
		do
			value := g_date_friday_low_level
		end

	set_g_date_monday is
		do
			value := g_date_monday_low_level
		end

	set_g_date_saturday is
		do
			value := g_date_saturday_low_level
		end

	set_g_date_sunday is
		do
			value := g_date_sunday_low_level
		end

	set_g_date_thursday is
		do
			value := g_date_thursday_low_level
		end

	set_g_date_tuesday is
		do
			value := g_date_tuesday_low_level
		end

	set_g_date_wednesday is
		do
			value := g_date_wednesday_low_level
		end

feature -- Queries
	is_g_date_bad_weekday: BOOLEAN is
		do
			Result := (value=g_date_bad_weekday_low_level)
		end

	is_g_date_friday: BOOLEAN is
		do
			Result := (value=g_date_friday_low_level)
		end

	is_g_date_monday: BOOLEAN is
		do
			Result := (value=g_date_monday_low_level)
		end

	is_g_date_saturday: BOOLEAN is
		do
			Result := (value=g_date_saturday_low_level)
		end

	is_g_date_sunday: BOOLEAN is
		do
			Result := (value=g_date_sunday_low_level)
		end

	is_g_date_thursday: BOOLEAN is
		do
			Result := (value=g_date_thursday_low_level)
		end

	is_g_date_tuesday: BOOLEAN is
		do
			Result := (value=g_date_tuesday_low_level)
		end

	is_g_date_wednesday: BOOLEAN is
		do
			Result := (value=g_date_wednesday_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_date_bad_weekday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_BAD_WEEKDAY"
 			}"
 		end

	g_date_friday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_FRIDAY"
 			}"
 		end

	g_date_monday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_MONDAY"
 			}"
 		end

	g_date_saturday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_SATURDAY"
 			}"
 		end

	g_date_sunday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_SUNDAY"
 			}"
 		end

	g_date_thursday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_THURSDAY"
 			}"
 		end

	g_date_tuesday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_TUESDAY"
 			}"
 		end

	g_date_wednesday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_WEDNESDAY"
 			}"
 		end


end -- class GDATE_WEEKDAY_ENUM
