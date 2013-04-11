-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKINPUTSOURCE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_source_cursor_low_level)  or else
				(a_value = gdk_source_eraser_low_level)  or else
				(a_value = gdk_source_mouse_low_level)  or else
				(a_value = gdk_source_pen_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_source_cursor is
		do
			value := gdk_source_cursor_low_level
		end

	set_gdk_source_eraser is
		do
			value := gdk_source_eraser_low_level
		end

	set_gdk_source_mouse is
		do
			value := gdk_source_mouse_low_level
		end

	set_gdk_source_pen is
		do
			value := gdk_source_pen_low_level
		end

feature {ANY} -- Queries
	is_gdk_source_cursor: BOOLEAN is
		do
			Result := (value=gdk_source_cursor_low_level)
		end

	is_gdk_source_eraser: BOOLEAN is
		do
			Result := (value=gdk_source_eraser_low_level)
		end

	is_gdk_source_mouse: BOOLEAN is
		do
			Result := (value=gdk_source_mouse_low_level)
		end

	is_gdk_source_pen: BOOLEAN is
		do
			Result := (value=gdk_source_pen_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_source_cursor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SOURCE_CURSOR"
 			}"
 		end

	gdk_source_eraser_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SOURCE_ERASER"
 			}"
 		end

	gdk_source_mouse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SOURCE_MOUSE"
 			}"
 		end

	gdk_source_pen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SOURCE_PEN"
 			}"
 		end


end -- class GDKINPUTSOURCE_ENUM
