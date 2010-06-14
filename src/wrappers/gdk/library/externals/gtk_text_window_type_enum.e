-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TEXT_WINDOW_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = private_low_level)  or else
				(a_value = widget_low_level)  or else
				(a_value = text_low_level)  or else
				(a_value = left_low_level)  or else
				(a_value = right_low_level)  or else
				(a_value = top_low_level)  or else
				(a_value = bottom_low_level) )
		end

feature -- Setters
	default_create,
	set_private is
		do
			value := private_low_level
		end

	set_widget is
		do
			value := widget_low_level
		end

	set_text is
		do
			value := text_low_level
		end

	set_left is
		do
			value := left_low_level
		end

	set_right is
		do
			value := right_low_level
		end

	set_top is
		do
			value := top_low_level
		end

	set_bottom is
		do
			value := bottom_low_level
		end

feature -- Queries
	is_private: BOOLEAN is
		do
			Result := (value=private_low_level)
		end

	is_widget: BOOLEAN is
		do
			Result := (value=widget_low_level)
		end

	is_text: BOOLEAN is
		do
			Result := (value=text_low_level)
		end

	is_left: BOOLEAN is
		do
			Result := (value=left_low_level)
		end

	is_right: BOOLEAN is
		do
			Result := (value=right_low_level)
		end

	is_top: BOOLEAN is
		do
			Result := (value=top_low_level)
		end

	is_bottom: BOOLEAN is
		do
			Result := (value=bottom_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	private_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_PRIVATE"
 			}"
 		end

	widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_WIDGET"
 			}"
 		end

	text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_TEXT"
 			}"
 		end

	left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_LEFT"
 			}"
 		end

	right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_RIGHT"
 			}"
 		end

	top_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_TOP"
 			}"
 		end

	bottom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_BOTTOM"
 			}"
 		end


end -- class GTK_TEXT_WINDOW_TYPE_ENUM
