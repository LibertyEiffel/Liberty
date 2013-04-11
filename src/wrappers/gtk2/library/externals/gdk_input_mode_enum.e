-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_INPUT_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = disabled_low_level)  or else
				(a_value = screen_low_level)  or else
				(a_value = window_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_disabled is
		do
			value := disabled_low_level
		end

	set_screen is
		do
			value := screen_low_level
		end

	set_window is
		do
			value := window_low_level
		end

feature {ANY} -- Queries
	disabled: BOOLEAN is
		do
			Result := (value=disabled_low_level)
		end

	screen: BOOLEAN is
		do
			Result := (value=screen_low_level)
		end

	window: BOOLEAN is
		do
			Result := (value=window_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	disabled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MODE_DISABLED"
 			}"
 		end

	screen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MODE_SCREEN"
 			}"
 		end

	window_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MODE_WINDOW"
 			}"
 		end


end -- class GDK_INPUT_MODE_ENUM
