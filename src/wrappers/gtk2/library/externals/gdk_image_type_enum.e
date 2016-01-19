-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_IMAGE_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_image_fastest_low_level)  or else
				(a_value = gdk_image_normal_low_level)  or else
				(a_value = gdk_image_shared_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_image_fastest is
		do
			value := gdk_image_fastest_low_level
		end

	set_gdk_image_normal is
		do
			value := gdk_image_normal_low_level
		end

	set_gdk_image_shared is
		do
			value := gdk_image_shared_low_level
		end

feature -- Queries
	is_gdk_image_fastest: BOOLEAN is
		do
			Result := (value=gdk_image_fastest_low_level)
		end

	is_gdk_image_normal: BOOLEAN is
		do
			Result := (value=gdk_image_normal_low_level)
		end

	is_gdk_image_shared: BOOLEAN is
		do
			Result := (value=gdk_image_shared_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_image_fastest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_IMAGE_FASTEST"
 			}"
 		end

	gdk_image_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_IMAGE_NORMAL"
 			}"
 		end

	gdk_image_shared_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_IMAGE_SHARED"
 			}"
 		end


end -- class GDK_IMAGE_TYPE_ENUM
