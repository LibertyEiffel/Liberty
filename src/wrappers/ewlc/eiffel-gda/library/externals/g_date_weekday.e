-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_DATE_WEEKDAY
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
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
	default_create, set_bad_weekday
		do
			value := g_date_bad_weekday
		end

	set_monday
		do
			value := g_date_monday
		end

	set_tuesday
		do
			value := g_date_tuesday
		end

	set_wednesday
		do
			value := g_date_wednesday
		end

	set_thursday
		do
			value := g_date_thursday
		end

	set_friday
		do
			value := g_date_friday
		end

	set_saturday
		do
			value := g_date_saturday
		end

	set_sunday
		do
			value := g_date_sunday
		end


feature {ANY} -- Queries
	is_bad_weekday: BOOLEAN
		do
			Result := (value=g_date_bad_weekday)
		end

	is_monday: BOOLEAN
		do
			Result := (value=g_date_monday)
		end

	is_tuesday: BOOLEAN
		do
			Result := (value=g_date_tuesday)
		end

	is_wednesday: BOOLEAN
		do
			Result := (value=g_date_wednesday)
		end

	is_thursday: BOOLEAN
		do
			Result := (value=g_date_thursday)
		end

	is_friday: BOOLEAN
		do
			Result := (value=g_date_friday)
		end

	is_saturday: BOOLEAN
		do
			Result := (value=g_date_saturday)
		end

	is_sunday: BOOLEAN
		do
			Result := (value=g_date_sunday)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_date_bad_weekday: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_BAD_WEEKDAY"
		end

	g_date_monday: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_MONDAY"
		end

	g_date_tuesday: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_TUESDAY"
		end

	g_date_wednesday: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_WEDNESDAY"
		end

	g_date_thursday: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_THURSDAY"
		end

	g_date_friday: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_FRIDAY"
		end

	g_date_saturday: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_SATURDAY"
		end

	g_date_sunday: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_SUNDAY"
		end


end

