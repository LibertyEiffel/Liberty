-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_DATE_WEEKDAY
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_date_bad_weekday) or else 
				(a_value = g_date_monday) or else 
				(a_value = g_date_tuesday) or else 
				(a_value = g_date_wednesday) or else 
				(a_value = g_date_thursday) or else 
				(a_value = g_date_friday) or else 
				(a_value = g_date_saturday) or else 
				(a_value = g_date_sunday))
		end


feature {ANY} -- Setters
	default_create, set_bad_weekday is
		do
			value := g_date_bad_weekday
		end

	set_monday is
		do
			value := g_date_monday
		end

	set_tuesday is
		do
			value := g_date_tuesday
		end

	set_wednesday is
		do
			value := g_date_wednesday
		end

	set_thursday is
		do
			value := g_date_thursday
		end

	set_friday is
		do
			value := g_date_friday
		end

	set_saturday is
		do
			value := g_date_saturday
		end

	set_sunday is
		do
			value := g_date_sunday
		end


feature {ANY} -- Queries
	is_bad_weekday: BOOLEAN is
		do
			Result := (value=g_date_bad_weekday)
		end

	is_monday: BOOLEAN is
		do
			Result := (value=g_date_monday)
		end

	is_tuesday: BOOLEAN is
		do
			Result := (value=g_date_tuesday)
		end

	is_wednesday: BOOLEAN is
		do
			Result := (value=g_date_wednesday)
		end

	is_thursday: BOOLEAN is
		do
			Result := (value=g_date_thursday)
		end

	is_friday: BOOLEAN is
		do
			Result := (value=g_date_friday)
		end

	is_saturday: BOOLEAN is
		do
			Result := (value=g_date_saturday)
		end

	is_sunday: BOOLEAN is
		do
			Result := (value=g_date_sunday)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_date_bad_weekday: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_BAD_WEEKDAY"
		end

	g_date_monday: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_MONDAY"
		end

	g_date_tuesday: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_TUESDAY"
		end

	g_date_wednesday: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_WEDNESDAY"
		end

	g_date_thursday: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_THURSDAY"
		end

	g_date_friday: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_FRIDAY"
		end

	g_date_saturday: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_SATURDAY"
		end

	g_date_sunday: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_SUNDAY"
		end


end

