-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDATE_MONTH_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_date_april_low_level)  or else
				(a_value = g_date_august_low_level)  or else
				(a_value = g_date_bad_month_low_level)  or else
				(a_value = g_date_december_low_level)  or else
				(a_value = g_date_february_low_level)  or else
				(a_value = g_date_january_low_level)  or else
				(a_value = g_date_july_low_level)  or else
				(a_value = g_date_june_low_level)  or else
				(a_value = g_date_march_low_level)  or else
				(a_value = g_date_may_low_level)  or else
				(a_value = g_date_november_low_level)  or else
				(a_value = g_date_october_low_level)  or else
				(a_value = g_date_september_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_date_april
		do
			value := g_date_april_low_level
		end

	set_g_date_august
		do
			value := g_date_august_low_level
		end

	set_g_date_bad_month
		do
			value := g_date_bad_month_low_level
		end

	set_g_date_december
		do
			value := g_date_december_low_level
		end

	set_g_date_february
		do
			value := g_date_february_low_level
		end

	set_g_date_january
		do
			value := g_date_january_low_level
		end

	set_g_date_july
		do
			value := g_date_july_low_level
		end

	set_g_date_june
		do
			value := g_date_june_low_level
		end

	set_g_date_march
		do
			value := g_date_march_low_level
		end

	set_g_date_may
		do
			value := g_date_may_low_level
		end

	set_g_date_november
		do
			value := g_date_november_low_level
		end

	set_g_date_october
		do
			value := g_date_october_low_level
		end

	set_g_date_september
		do
			value := g_date_september_low_level
		end

feature {ANY} -- Queries
	is_g_date_april: BOOLEAN
		do
			Result := (value=g_date_april_low_level)
		end

	is_g_date_august: BOOLEAN
		do
			Result := (value=g_date_august_low_level)
		end

	is_g_date_bad_month: BOOLEAN
		do
			Result := (value=g_date_bad_month_low_level)
		end

	is_g_date_december: BOOLEAN
		do
			Result := (value=g_date_december_low_level)
		end

	is_g_date_february: BOOLEAN
		do
			Result := (value=g_date_february_low_level)
		end

	is_g_date_january: BOOLEAN
		do
			Result := (value=g_date_january_low_level)
		end

	is_g_date_july: BOOLEAN
		do
			Result := (value=g_date_july_low_level)
		end

	is_g_date_june: BOOLEAN
		do
			Result := (value=g_date_june_low_level)
		end

	is_g_date_march: BOOLEAN
		do
			Result := (value=g_date_march_low_level)
		end

	is_g_date_may: BOOLEAN
		do
			Result := (value=g_date_may_low_level)
		end

	is_g_date_november: BOOLEAN
		do
			Result := (value=g_date_november_low_level)
		end

	is_g_date_october: BOOLEAN
		do
			Result := (value=g_date_october_low_level)
		end

	is_g_date_september: BOOLEAN
		do
			Result := (value=g_date_september_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_date_april_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_APRIL"
 			}"
 		end

	g_date_august_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_AUGUST"
 			}"
 		end

	g_date_bad_month_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_BAD_MONTH"
 			}"
 		end

	g_date_december_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_DECEMBER"
 			}"
 		end

	g_date_february_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_FEBRUARY"
 			}"
 		end

	g_date_january_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_JANUARY"
 			}"
 		end

	g_date_july_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_JULY"
 			}"
 		end

	g_date_june_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_JUNE"
 			}"
 		end

	g_date_march_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_MARCH"
 			}"
 		end

	g_date_may_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_MAY"
 			}"
 		end

	g_date_november_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_NOVEMBER"
 			}"
 		end

	g_date_october_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_OCTOBER"
 			}"
 		end

	g_date_september_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_SEPTEMBER"
 			}"
 		end


end -- class GDATE_MONTH_ENUM
