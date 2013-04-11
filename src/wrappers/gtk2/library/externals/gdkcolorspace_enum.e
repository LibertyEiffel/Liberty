-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKCOLORSPACE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_colorspace_rgb_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_colorspace_rgb is
		do
			value := gdk_colorspace_rgb_low_level
		end

feature {ANY} -- Queries
	is_gdk_colorspace_rgb: BOOLEAN is
		do
			Result := (value=gdk_colorspace_rgb_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_colorspace_rgb_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_COLORSPACE_RGB"
 			}"
 		end


end -- class GDKCOLORSPACE_ENUM
