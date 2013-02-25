-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_UNIT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = pixel_low_level)  or else
				(a_value = points_low_level)  or else
				(a_value = inch_low_level)  or else
				(a_value = mm_low_level) )
		end

feature -- Setters
	default_create,
	set_pixel is
		do
			value := pixel_low_level
		end

	set_points is
		do
			value := points_low_level
		end

	set_inch is
		do
			value := inch_low_level
		end

	set_mm is
		do
			value := mm_low_level
		end

feature -- Queries
	pixel: BOOLEAN is
		do
			Result := (value=pixel_low_level)
		end

	points: BOOLEAN is
		do
			Result := (value=points_low_level)
		end

	inch: BOOLEAN is
		do
			Result := (value=inch_low_level)
		end

	mm: BOOLEAN is
		do
			Result := (value=mm_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pixel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UNIT_PIXEL"
 			}"
 		end

	points_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UNIT_POINTS"
 			}"
 		end

	inch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UNIT_INCH"
 			}"
 		end

	mm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UNIT_MM"
 			}"
 		end


end -- class GTK_UNIT_ENUM
