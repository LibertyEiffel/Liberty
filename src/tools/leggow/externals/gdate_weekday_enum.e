-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GDATE_WEEKDAY_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bad_weekday_low_level)  or else
				(a_value = friday_low_level)  or else
				(a_value = monday_low_level)  or else
				(a_value = saturday_low_level)  or else
				(a_value = sunday_low_level)  or else
				(a_value = thursday_low_level)  or else
				(a_value = tuesday_low_level)  or else
				(a_value = wednesday_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bad_weekday
               do
                       value := bad_weekday_low_level
               end

	set_friday
               do
                       value := friday_low_level
               end

	set_monday
               do
                       value := monday_low_level
               end

	set_saturday
               do
                       value := saturday_low_level
               end

	set_sunday
               do
                       value := sunday_low_level
               end

	set_thursday
               do
                       value := thursday_low_level
               end

	set_tuesday
               do
                       value := tuesday_low_level
               end

	set_wednesday
               do
                       value := wednesday_low_level
               end

feature {ANY} -- Queries
       is_bad_weekday: BOOLEAN
               do
                       Result := (value=bad_weekday_low_level)
               end

       is_friday: BOOLEAN
               do
                       Result := (value=friday_low_level)
               end

       is_monday: BOOLEAN
               do
                       Result := (value=monday_low_level)
               end

       is_saturday: BOOLEAN
               do
                       Result := (value=saturday_low_level)
               end

       is_sunday: BOOLEAN
               do
                       Result := (value=sunday_low_level)
               end

       is_thursday: BOOLEAN
               do
                       Result := (value=thursday_low_level)
               end

       is_tuesday: BOOLEAN
               do
                       Result := (value=tuesday_low_level)
               end

       is_wednesday: BOOLEAN
               do
                       Result := (value=wednesday_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bad_weekday_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_BAD_WEEKDAY"
                       }"
               end

     friday_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_FRIDAY"
                       }"
               end

     monday_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_MONDAY"
                       }"
               end

     saturday_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_SATURDAY"
                       }"
               end

     sunday_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_SUNDAY"
                       }"
               end

     thursday_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_THURSDAY"
                       }"
               end

     tuesday_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_TUESDAY"
                       }"
               end

     wednesday_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_DATE_WEDNESDAY"
                       }"
               end


end -- class GDATE_WEEKDAY_ENUM
