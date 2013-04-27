-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_SCROLL_DIRECTION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_scroll_down_low_level)  or else
				(a_value = gdk_scroll_left_low_level)  or else
				(a_value = gdk_scroll_right_low_level)  or else
				(a_value = gdk_scroll_up_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_scroll_down is
		do
			value := gdk_scroll_down_low_level
		end

	set_gdk_scroll_left is
		do
			value := gdk_scroll_left_low_level
		end

	set_gdk_scroll_right is
		do
			value := gdk_scroll_right_low_level
		end

	set_gdk_scroll_up is
		do
			value := gdk_scroll_up_low_level
		end

feature -- Queries
	is_gdk_scroll_down: BOOLEAN is
		do
			Result := (value=gdk_scroll_down_low_level)
		end

	is_gdk_scroll_left: BOOLEAN is
		do
			Result := (value=gdk_scroll_left_low_level)
		end

	is_gdk_scroll_right: BOOLEAN is
		do
			Result := (value=gdk_scroll_right_low_level)
		end

	is_gdk_scroll_up: BOOLEAN is
		do
			Result := (value=gdk_scroll_up_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_scroll_down_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SCROLL_DOWN"
 			}"
 		end

	gdk_scroll_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SCROLL_LEFT"
 			}"
 		end

	gdk_scroll_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SCROLL_RIGHT"
 			}"
 		end

	gdk_scroll_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SCROLL_UP"
 			}"
 		end


end -- class GDK_SCROLL_DIRECTION_ENUM
