-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKRGBDITHER_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_rgb_dither_max_low_level)  or else
				(a_value = gdk_rgb_dither_none_low_level)  or else
				(a_value = gdk_rgb_dither_normal_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_rgb_dither_max is
		do
			value := gdk_rgb_dither_max_low_level
		end

	set_gdk_rgb_dither_none is
		do
			value := gdk_rgb_dither_none_low_level
		end

	set_gdk_rgb_dither_normal is
		do
			value := gdk_rgb_dither_normal_low_level
		end

feature {ANY} -- Queries
	is_gdk_rgb_dither_max: BOOLEAN is
		do
			Result := (value=gdk_rgb_dither_max_low_level)
		end

	is_gdk_rgb_dither_none: BOOLEAN is
		do
			Result := (value=gdk_rgb_dither_none_low_level)
		end

	is_gdk_rgb_dither_normal: BOOLEAN is
		do
			Result := (value=gdk_rgb_dither_normal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_rgb_dither_max_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RGB_DITHER_MAX"
 			}"
 		end

	gdk_rgb_dither_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RGB_DITHER_NONE"
 			}"
 		end

	gdk_rgb_dither_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RGB_DITHER_NORMAL"
 			}"
 		end


end -- class GDKRGBDITHER_ENUM
