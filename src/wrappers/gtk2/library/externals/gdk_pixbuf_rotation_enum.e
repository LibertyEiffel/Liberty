-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_PIXBUF_ROTATION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_pixbuf_rotate_clockwise_low_level)  or else
				(a_value = gdk_pixbuf_rotate_counterclockwise_low_level)  or else
				(a_value = gdk_pixbuf_rotate_none_low_level)  or else
				(a_value = gdk_pixbuf_rotate_upsidedown_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_pixbuf_rotate_clockwise is
		do
			value := gdk_pixbuf_rotate_clockwise_low_level
		end

	set_gdk_pixbuf_rotate_counterclockwise is
		do
			value := gdk_pixbuf_rotate_counterclockwise_low_level
		end

	set_gdk_pixbuf_rotate_none is
		do
			value := gdk_pixbuf_rotate_none_low_level
		end

	set_gdk_pixbuf_rotate_upsidedown is
		do
			value := gdk_pixbuf_rotate_upsidedown_low_level
		end

feature -- Queries
	is_gdk_pixbuf_rotate_clockwise: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_rotate_clockwise_low_level)
		end

	is_gdk_pixbuf_rotate_counterclockwise: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_rotate_counterclockwise_low_level)
		end

	is_gdk_pixbuf_rotate_none: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_rotate_none_low_level)
		end

	is_gdk_pixbuf_rotate_upsidedown: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_rotate_upsidedown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_pixbuf_rotate_clockwise_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ROTATE_CLOCKWISE"
 			}"
 		end

	gdk_pixbuf_rotate_counterclockwise_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ROTATE_COUNTERCLOCKWISE"
 			}"
 		end

	gdk_pixbuf_rotate_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ROTATE_NONE"
 			}"
 		end

	gdk_pixbuf_rotate_upsidedown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ROTATE_UPSIDEDOWN"
 			}"
 		end


end -- class GDK_PIXBUF_ROTATION_ENUM
