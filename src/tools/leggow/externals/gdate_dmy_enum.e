-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GDATE_DMY_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = day_low_level)  or else
				(a_value = month_low_level)  or else
				(a_value = year_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_day
               do
                       value := day_low_level
               end

	set_month
               do
                       value := month_low_level
               end

	set_year
               do
                       value := year_low_level
               end

feature {ANY} -- Queries
       is_day: BOOLEAN
               do
                       Result := (value=day_low_level)
               end

       is_month: BOOLEAN
               do
                       Result := (value=month_low_level)
               end

       is_year: BOOLEAN
               do
                       Result := (value=year_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     day_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_DAY"
                       }"
               end

     month_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_MONTH"
                       }"
               end

     year_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_YEAR"
                       }"
               end


end -- class GDATE_DMY_ENUM
