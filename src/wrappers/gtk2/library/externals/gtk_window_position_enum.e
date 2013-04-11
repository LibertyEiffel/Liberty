-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_WINDOW_POSITION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = center_low_level)  or else
				(a_value = mouse_low_level)  or else
				(a_value = center_always_low_level)  or else
				(a_value = center_on_parent_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_center is
		do
			value := center_low_level
		end

	set_mouse is
		do
			value := mouse_low_level
		end

	set_center_always is
		do
			value := center_always_low_level
		end

	set_center_on_parent is
		do
			value := center_on_parent_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	center: BOOLEAN is
		do
			Result := (value=center_low_level)
		end

	mouse: BOOLEAN is
		do
			Result := (value=mouse_low_level)
		end

	center_always: BOOLEAN is
		do
			Result := (value=center_always_low_level)
		end

	center_on_parent: BOOLEAN is
		do
			Result := (value=center_on_parent_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WIN_POS_NONE"
 			}"
 		end

	center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WIN_POS_CENTER"
 			}"
 		end

	mouse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WIN_POS_MOUSE"
 			}"
 		end

	center_always_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WIN_POS_CENTER_ALWAYS"
 			}"
 		end

	center_on_parent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WIN_POS_CENTER_ON_PARENT"
 			}"
 		end


end -- class GTK_WINDOW_POSITION_ENUM
