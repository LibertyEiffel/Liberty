-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKUNIT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_unit_inch_low_level)  or else
				(a_value = gtk_unit_mm_low_level)  or else
				(a_value = gtk_unit_pixel_low_level)  or else
				(a_value = gtk_unit_points_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_unit_inch is
		do
			value := gtk_unit_inch_low_level
		end

	set_gtk_unit_mm is
		do
			value := gtk_unit_mm_low_level
		end

	set_gtk_unit_pixel is
		do
			value := gtk_unit_pixel_low_level
		end

	set_gtk_unit_points is
		do
			value := gtk_unit_points_low_level
		end

feature {ANY} -- Queries
	is_gtk_unit_inch: BOOLEAN is
		do
			Result := (value=gtk_unit_inch_low_level)
		end

	is_gtk_unit_mm: BOOLEAN is
		do
			Result := (value=gtk_unit_mm_low_level)
		end

	is_gtk_unit_pixel: BOOLEAN is
		do
			Result := (value=gtk_unit_pixel_low_level)
		end

	is_gtk_unit_points: BOOLEAN is
		do
			Result := (value=gtk_unit_points_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_unit_inch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UNIT_INCH"
 			}"
 		end

	gtk_unit_mm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UNIT_MM"
 			}"
 		end

	gtk_unit_pixel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UNIT_PIXEL"
 			}"
 		end

	gtk_unit_points_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UNIT_POINTS"
 			}"
 		end


end -- class GTKUNIT_ENUM
