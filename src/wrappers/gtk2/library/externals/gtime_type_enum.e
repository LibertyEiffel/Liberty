-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTIME_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = standard_low_level)  or else
				(a_value = daylight_low_level)  or else
				(a_value = universal_low_level) )
		end

feature -- Setters
	default_create,
	set_standard is
		do
			value := standard_low_level
		end

	set_daylight is
		do
			value := daylight_low_level
		end

	set_universal is
		do
			value := universal_low_level
		end

feature -- Queries
	standard: BOOLEAN is
		do
			Result := (value=standard_low_level)
		end

	daylight: BOOLEAN is
		do
			Result := (value=daylight_low_level)
		end

	universal: BOOLEAN is
		do
			Result := (value=universal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	standard_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TIME_TYPE_STANDARD"
 			}"
 		end

	daylight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TIME_TYPE_DAYLIGHT"
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
