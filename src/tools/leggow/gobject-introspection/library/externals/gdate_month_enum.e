-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GDATE_MONTH_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = april_low_level)  or else
				(a_value = august_low_level)  or else
				(a_value = bad_month_low_level)  or else
				(a_value = december_low_level)  or else
				(a_value = february_low_level)  or else
				(a_value = january_low_level)  or else
				(a_value = july_low_level)  or else
				(a_value = june_low_level)  or else
				(a_value = march_low_level)  or else
				(a_value = may_low_level)  or else
				(a_value = november_low_level)  or else
				(a_value = october_low_level)  or else
				(a_value = september_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_april
               do
                       value := april_low_level
               end

	set_august
               do
                       value := august_low_level
               end

	set_bad_month
               do
                       value := bad_month_low_level
               end

	set_december
               do
                       value := december_low_level
               end

	set_february
               do
                       value := february_low_level
               end

	set_january
               do
                       value := january_low_level
               end

	set_july
               do
                       value := july_low_level
               end

	set_june
               do
                       value := june_low_level
               end

	set_march
               do
                       value := march_low_level
               end

	set_may
               do
                       value := may_low_level
               end

	set_november
               do
                       value := november_low_level
               end

	set_october
               do
                       value := october_low_level
               end

	set_september
               do
                       value := september_low_level
               end

feature {ANY} -- Queries
       is_april: BOOLEAN
               do
                       Result := (value=april_low_level)
               end

       is_august: BOOLEAN
               do
                       Result := (value=august_low_level)
               end

       is_bad_month: BOOLEAN
               do
                       Result := (value=bad_month_low_level)
               end

       is_december: BOOLEAN
               do
                       Result := (value=december_low_level)
               end

       is_february: BOOLEAN
               do
                       Result := (value=february_low_level)
               end

       is_january: BOOLEAN
               do
                       Result := (value=january_low_level)
               end

       is_july: BOOLEAN
               do
                       Result := (value=july_low_level)
               end

       is_june: BOOLEAN
               do
                       Result := (value=june_low_level)
               end

       is_march: BOOLEAN
               do
                       Result := (value=march_low_level)
               end

       is_may: BOOLEAN
               do
                       Result := (value=may_low_level)
               end

       is_november: BOOLEAN
               do
                       Result := (value=november_low_level)
               end

       is_october: BOOLEAN
               do
                       Result := (value=october_low_level)
               end

       is_september: BOOLEAN
               do
                       Result := (value=september_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     april_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_APRIL"
                       }"
               end

     august_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_AUGUST"
                       }"
               end

     bad_month_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_BAD_MONTH"
                       }"
               end

     december_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_DECEMBER"
                       }"
               end

     february_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_FEBRUARY"
                       }"
               end

     january_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_JANUARY"
                       }"
               end

     july_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_JULY"
                       }"
               end

     june_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_JUNE"
                       }"
               end

     march_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_MARCH"
                       }"
               end

     may_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_MAY"
                       }"
               end

     november_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_NOVEMBER"
                       }"
               end

     october_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_OCTOBER"
                       }"
               end

     september_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_SEPTEMBER"
                       }"
               end


end -- class GDATE_MONTH_ENUM
