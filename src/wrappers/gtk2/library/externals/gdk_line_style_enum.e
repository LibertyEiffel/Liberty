-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_LINE_STYLE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_line_double_dash_low_level)  or else
				(a_value = gdk_line_on_off_dash_low_level)  or else
				(a_value = gdk_line_solid_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_line_double_dash is
		do
			value := gdk_line_double_dash_low_level
		end

	set_gdk_line_on_off_dash is
		do
			value := gdk_line_on_off_dash_low_level
		end

	set_gdk_line_solid is
		do
			value := gdk_line_solid_low_level
		end

feature -- Queries
	is_gdk_line_double_dash: BOOLEAN is
		do
			Result := (value=gdk_line_double_dash_low_level)
		end

	is_gdk_line_on_off_dash: BOOLEAN is
		do
			Result := (value=gdk_line_on_off_dash_low_level)
		end

	is_gdk_line_solid: BOOLEAN is
		do
			Result := (value=gdk_line_solid_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_line_double_dash_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LINE_DOUBLE_DASH"
 			}"
 		end

	gdk_line_on_off_dash_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LINE_ON_OFF_DASH"
 			}"
 		end

	gdk_line_solid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LINE_SOLID"
 			}"
 		end


end -- class GDK_LINE_STYLE_ENUM
