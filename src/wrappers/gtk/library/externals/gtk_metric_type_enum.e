-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_METRIC_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = pixels_low_level)  or else
				(a_value = inches_low_level)  or else
				(a_value = centimeters_low_level) )
		end

feature -- Setters
	default_create,
	set_pixels is
		do
			value := pixels_low_level
		end

	set_inches is
		do
			value := inches_low_level
		end

	set_centimeters is
		do
			value := centimeters_low_level
		end

feature -- Queries
	is_pixels: BOOLEAN is
		do
			Result := (value=pixels_low_level)
		end

	is_inches: BOOLEAN is
		do
			Result := (value=inches_low_level)
		end

	is_centimeters: BOOLEAN is
		do
			Result := (value=centimeters_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pixels_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PIXELS"
 			}"
 		end

	inches_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_INCHES"
 			}"
 		end

	centimeters_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CENTIMETERS"
 			}"
 		end


end -- class GTK_METRIC_TYPE_ENUM
