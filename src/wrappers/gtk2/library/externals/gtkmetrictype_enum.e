-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKMETRICTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_centimeters_low_level)  or else
				(a_value = gtk_inches_low_level)  or else
				(a_value = gtk_pixels_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_centimeters is
		do
			value := gtk_centimeters_low_level
		end

	set_gtk_inches is
		do
			value := gtk_inches_low_level
		end

	set_gtk_pixels is
		do
			value := gtk_pixels_low_level
		end

feature {ANY} -- Queries
	is_gtk_centimeters: BOOLEAN is
		do
			Result := (value=gtk_centimeters_low_level)
		end

	is_gtk_inches: BOOLEAN is
		do
			Result := (value=gtk_inches_low_level)
		end

	is_gtk_pixels: BOOLEAN is
		do
			Result := (value=gtk_pixels_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_centimeters_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CENTIMETERS"
 			}"
 		end

	gtk_inches_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_INCHES"
 			}"
 		end

	gtk_pixels_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PIXELS"
 			}"
 		end


end -- class GTKMETRICTYPE_ENUM
