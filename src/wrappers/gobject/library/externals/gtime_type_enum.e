-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTIME_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_time_type_daylight_low_level)  or else
				(a_value = g_time_type_standard_low_level)  or else
				(a_value = g_time_type_universal_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_time_type_daylight
		do
			value := g_time_type_daylight_low_level
		end

	set_g_time_type_standard
		do
			value := g_time_type_standard_low_level
		end

	set_g_time_type_universal
		do
			value := g_time_type_universal_low_level
		end

feature {ANY} -- Queries
	is_g_time_type_daylight: BOOLEAN
		do
			Result := (value=g_time_type_daylight_low_level)
		end

	is_g_time_type_standard: BOOLEAN
		do
			Result := (value=g_time_type_standard_low_level)
		end

	is_g_time_type_universal: BOOLEAN
		do
			Result := (value=g_time_type_universal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_time_type_daylight_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TIME_TYPE_DAYLIGHT"
 			}"
 		end

	g_time_type_standard_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TIME_TYPE_STANDARD"
 			}"
 		end

	g_time_type_universal_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TIME_TYPE_UNIVERSAL"
 			}"
 		end


end -- class GTIME_TYPE_ENUM
