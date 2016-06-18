-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_DATE_MONTH
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_date_bad_month) or else 
				(a_value = g_date_january) or else 
				(a_value = g_date_february) or else 
				(a_value = g_date_march) or else 
				(a_value = g_date_april) or else 
				(a_value = g_date_may) or else 
				(a_value = g_date_june) or else 
				(a_value = g_date_july) or else 
				(a_value = g_date_august) or else 
				(a_value = g_date_september) or else 
				(a_value = g_date_october) or else 
				(a_value = g_date_november) or else 
				(a_value = g_date_december))
		end


feature {ANY} -- Setters
	default_create, set_bad_month
		do
			value := g_date_bad_month
		end

	set_january
		do
			value := g_date_january
		end

	set_february
		do
			value := g_date_february
		end

	set_march
		do
			value := g_date_march
		end

	set_april
		do
			value := g_date_april
		end

	set_may
		do
			value := g_date_may
		end

	set_june
		do
			value := g_date_june
		end

	set_july
		do
			value := g_date_july
		end

	set_august
		do
			value := g_date_august
		end

	set_september
		do
			value := g_date_september
		end

	set_october
		do
			value := g_date_october
		end

	set_november
		do
			value := g_date_november
		end

	set_december
		do
			value := g_date_december
		end


feature {ANY} -- Queries
	is_bad_month: BOOLEAN
		do
			Result := (value=g_date_bad_month)
		end

	is_january: BOOLEAN
		do
			Result := (value=g_date_january)
		end

	is_february: BOOLEAN
		do
			Result := (value=g_date_february)
		end

	is_march: BOOLEAN
		do
			Result := (value=g_date_march)
		end

	is_april: BOOLEAN
		do
			Result := (value=g_date_april)
		end

	is_may: BOOLEAN
		do
			Result := (value=g_date_may)
		end

	is_june: BOOLEAN
		do
			Result := (value=g_date_june)
		end

	is_july: BOOLEAN
		do
			Result := (value=g_date_july)
		end

	is_august: BOOLEAN
		do
			Result := (value=g_date_august)
		end

	is_september: BOOLEAN
		do
			Result := (value=g_date_september)
		end

	is_october: BOOLEAN
		do
			Result := (value=g_date_october)
		end

	is_november: BOOLEAN
		do
			Result := (value=g_date_november)
		end

	is_december: BOOLEAN
		do
			Result := (value=g_date_december)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_date_bad_month: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_BAD_MONTH"
		end

	g_date_january: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_JANUARY"
		end

	g_date_february: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_FEBRUARY"
		end

	g_date_march: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_MARCH"
		end

	g_date_april: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_APRIL"
		end

	g_date_may: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_MAY"
		end

	g_date_june: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_JUNE"
		end

	g_date_july: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_JULY"
		end

	g_date_august: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_AUGUST"
		end

	g_date_september: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_SEPTEMBER"
		end

	g_date_october: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_OCTOBER"
		end

	g_date_november: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_NOVEMBER"
		end

	g_date_december: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_DATE_DECEMBER"
		end


end

