-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_COLORSPACE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_colorspace_rgb_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_colorspace_rgb is
		do
			value := gdk_colorspace_rgb_low_level
		end

feature -- Queries
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


end -- class GDK_COLORSPACE_ENUM
