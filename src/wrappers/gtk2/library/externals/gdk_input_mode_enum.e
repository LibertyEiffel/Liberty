-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_INPUT_MODE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_mode_disabled_low_level)  or else
				(a_value = gdk_mode_screen_low_level)  or else
				(a_value = gdk_mode_window_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_mode_disabled is
		do
			value := gdk_mode_disabled_low_level
		end

	set_gdk_mode_screen is
		do
			value := gdk_mode_screen_low_level
		end

	set_gdk_mode_window is
		do
			value := gdk_mode_window_low_level
		end

feature -- Queries
	is_gdk_mode_disabled: BOOLEAN is
		do
			Result := (value=gdk_mode_disabled_low_level)
		end

	is_gdk_mode_screen: BOOLEAN is
		do
			Result := (value=gdk_mode_screen_low_level)
		end

	is_gdk_mode_window: BOOLEAN is
		do
			Result := (value=gdk_mode_window_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_mode_disabled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MODE_DISABLED"
 			}"
 		end

	gdk_mode_screen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MODE_SCREEN"
 			}"
 		end

	gdk_mode_window_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MODE_WINDOW"
 			}"
 		end


end -- class GDK_INPUT_MODE_ENUM
