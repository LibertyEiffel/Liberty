-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTIME_TYPE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = daylight_low_level)  or else
				(a_value = standard_low_level)  or else
				(a_value = universal_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_daylight is
		do
			value := daylight_low_level
		end

	set_standard is
		do
			value := standard_low_level
		end

	set_universal is
		do
			value := universal_low_level
		end

feature {ANY} -- Queries
	is_daylight: BOOLEAN is
		do
			Result := (value=daylight_low_level)
		end

	is_standard: BOOLEAN is
		do
			Result := (value=standard_low_level)
		end

	is_universal: BOOLEAN is
		do
			Result := (value=universal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	daylight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TIME_TYPE_DAYLIGHT"
 			}"
 		end

	standard_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TIME_TYPE_STANDARD"
 			}"
 		end

	universal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TIME_TYPE_UNIVERSAL"
 			}"
 		end


end -- class GTIME_TYPE_ENUM
