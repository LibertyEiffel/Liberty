-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_AXIS_USE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_axis_ignore_low_level)  or else
				(a_value = gdk_axis_last_low_level)  or else
				(a_value = gdk_axis_pressure_low_level)  or else
				(a_value = gdk_axis_wheel_low_level)  or else
				(a_value = gdk_axis_x_low_level)  or else
				(a_value = gdk_axis_xtilt_low_level)  or else
				(a_value = gdk_axis_y_low_level)  or else
				(a_value = gdk_axis_ytilt_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_axis_ignore is
		do
			value := gdk_axis_ignore_low_level
		end

	set_gdk_axis_last is
		do
			value := gdk_axis_last_low_level
		end

	set_gdk_axis_pressure is
		do
			value := gdk_axis_pressure_low_level
		end

	set_gdk_axis_wheel is
		do
			value := gdk_axis_wheel_low_level
		end

	set_gdk_axis_x is
		do
			value := gdk_axis_x_low_level
		end

	set_gdk_axis_xtilt is
		do
			value := gdk_axis_xtilt_low_level
		end

	set_gdk_axis_y is
		do
			value := gdk_axis_y_low_level
		end

	set_gdk_axis_ytilt is
		do
			value := gdk_axis_ytilt_low_level
		end

feature -- Queries
	is_gdk_axis_ignore: BOOLEAN is
		do
			Result := (value=gdk_axis_ignore_low_level)
		end

	is_gdk_axis_last: BOOLEAN is
		do
			Result := (value=gdk_axis_last_low_level)
		end

	is_gdk_axis_pressure: BOOLEAN is
		do
			Result := (value=gdk_axis_pressure_low_level)
		end

	is_gdk_axis_wheel: BOOLEAN is
		do
			Result := (value=gdk_axis_wheel_low_level)
		end

	is_gdk_axis_x: BOOLEAN is
		do
			Result := (value=gdk_axis_x_low_level)
		end

	is_gdk_axis_xtilt: BOOLEAN is
		do
			Result := (value=gdk_axis_xtilt_low_level)
		end

	is_gdk_axis_y: BOOLEAN is
		do
			Result := (value=gdk_axis_y_low_level)
		end

	is_gdk_axis_ytilt: BOOLEAN is
		do
			Result := (value=gdk_axis_ytilt_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_axis_ignore_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AXIS_IGNORE"
 			}"
 		end

	gdk_axis_last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AXIS_LAST"
 			}"
 		end

	gdk_axis_pressure_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AXIS_PRESSURE"
 			}"
 		end

	gdk_axis_wheel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AXIS_WHEEL"
 			}"
 		end

	gdk_axis_x_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AXIS_X"
 			}"
 		end

	gdk_axis_xtilt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AXIS_XTILT"
 			}"
 		end

	gdk_axis_y_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AXIS_Y"
 			}"
 		end

	gdk_axis_ytilt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_AXIS_YTILT"
 			}"
 		end


end -- class GDK_AXIS_USE_ENUM
