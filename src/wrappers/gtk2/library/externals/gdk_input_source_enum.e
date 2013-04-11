-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_INPUT_SOURCE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = mouse_low_level)  or else
				(a_value = pen_low_level)  or else
				(a_value = eraser_low_level)  or else
				(a_value = cursor_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_mouse is
		do
			value := mouse_low_level
		end

	set_pen is
		do
			value := pen_low_level
		end

	set_eraser is
		do
			value := eraser_low_level
		end

	set_cursor is
		do
			value := cursor_low_level
		end

feature {ANY} -- Queries
	mouse: BOOLEAN is
		do
			Result := (value=mouse_low_level)
		end

	pen: BOOLEAN is
		do
			Result := (value=pen_low_level)
		end

	eraser: BOOLEAN is
		do
			Result := (value=eraser_low_level)
		end

	cursor: BOOLEAN is
		do
			Result := (value=cursor_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	mouse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SOURCE_MOUSE"
 			}"
 		end

	pen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SOURCE_PEN"
 			}"
 		end

	eraser_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SOURCE_ERASER"
 			}"
 		end

	cursor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SOURCE_CURSOR"
 			}"
 		end


end -- class GDK_INPUT_SOURCE_ENUM
