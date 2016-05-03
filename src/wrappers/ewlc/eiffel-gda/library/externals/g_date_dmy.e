-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_DATE_DMY
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_date_day) or else 
				(a_value = g_date_month) or else 
				(a_value = g_date_year))
		end


feature {ANY} -- Setters
	default_create, set_g_date_day is
		do
			value := g_date_day
		end

	set_g_date_month is
		do
			value := g_date_month
		end

	set_g_date_year is
		do
			value := g_date_year
		end


feature {ANY} -- Queries
	is_g_date_day: BOOLEAN is
		do
			Result := (value=g_date_day)
		end

	is_g_date_month: BOOLEAN is
		do
			Result := (value=g_date_month)
		end

	is_g_date_year: BOOLEAN is
		do
			Result := (value=g_date_year)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_date_day: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_DAY"
		end

	g_date_month: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_MONTH"
		end

	g_date_year: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_YEAR"
		end


end

