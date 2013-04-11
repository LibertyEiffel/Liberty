-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDATEMONTH_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
	set_g_date_april is
		do
			value := g_date_april_low_level
		end

	set_g_date_august is
		do
			value := g_date_august_low_level
		end

	set_g_date_bad_month is
		do
			value := g_date_bad_month_low_level
		end

	set_g_date_december is
		do
			value := g_date_december_low_level
		end

	set_g_date_february is
		do
			value := g_date_february_low_level
		end

	set_g_date_january is
		do
			value := g_date_january_low_level
		end

	set_g_date_july is
		do
			value := g_date_july_low_level
		end

	set_g_date_june is
		do
			value := g_date_june_low_level
		end

	set_g_date_march is
		do
			value := g_date_march_low_level
		end

	set_g_date_may is
		do
			value := g_date_may_low_level
		end

	set_g_date_november is
		do
			value := g_date_november_low_level
		end

	set_g_date_october is
		do
			value := g_date_october_low_level
		end

	set_g_date_september is
		do
			value := g_date_september_low_level
		end

feature {ANY} -- Queries
	is_g_date_april: BOOLEAN is
		do
			Result := (value=g_date_april_low_level)
		end

	is_g_date_august: BOOLEAN is
		do
			Result := (value=g_date_august_low_level)
		end

	is_g_date_bad_month: BOOLEAN is
		do
			Result := (value=g_date_bad_month_low_level)
		end

	is_g_date_december: BOOLEAN is
		do
			Result := (value=g_date_december_low_level)
		end

	is_g_date_february: BOOLEAN is
		do
			Result := (value=g_date_february_low_level)
		end

	is_g_date_january: BOOLEAN is
		do
			Result := (value=g_date_january_low_level)
		end

	is_g_date_july: BOOLEAN is
		do
			Result := (value=g_date_july_low_level)
		end

	is_g_date_june: BOOLEAN is
		do
			Result := (value=g_date_june_low_level)
		end

	is_g_date_march: BOOLEAN is
		do
			Result := (value=g_date_march_low_level)
		end

	is_g_date_may: BOOLEAN is
		do
			Result := (value=g_date_may_low_level)
		end

	is_g_date_november: BOOLEAN is
		do
			Result := (value=g_date_november_low_level)
		end

	is_g_date_october: BOOLEAN is
		do
			Result := (value=g_date_october_low_level)
		end

	is_g_date_september: BOOLEAN is
		do
			Result := (value=g_date_september_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_date_april_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_APRIL"
 			}"
 		end

	g_date_august_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_AUGUST"
 			}"
 		end

	g_date_bad_month_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_BAD_MONTH"
 			}"
 		end

	g_date_december_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_DECEMBER"
 			}"
 		end

	g_date_february_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_FEBRUARY"
 			}"
 		end

	g_date_january_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_JANUARY"
 			}"
 		end

	g_date_july_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_JULY"
 			}"
 		end

	g_date_june_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_JUNE"
 			}"
 		end

	g_date_march_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_MARCH"
 			}"
 		end

	g_date_may_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_MAY"
 			}"
 		end

	g_date_november_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_NOVEMBER"
 			}"
 		end

	g_date_october_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_OCTOBER"
 			}"
 		end

	g_date_september_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_SEPTEMBER"
 			}"
 		end


end -- class GDATEMONTH_ENUM
