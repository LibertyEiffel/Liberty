-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TOOLBAR_CHILD_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = space_low_level)  or else
				(a_value = button_low_level)  or else
				(a_value = togglebutton_low_level)  or else
				(a_value = radiobutton_low_level)  or else
				(a_value = widget_low_level) )
		end

feature -- Setters
	default_create,
	set_space is
		do
			value := space_low_level
		end

	set_button is
		do
			value := button_low_level
		end

	set_togglebutton is
		do
			value := togglebutton_low_level
		end

	set_radiobutton is
		do
			value := radiobutton_low_level
		end

	set_widget is
		do
			value := widget_low_level
		end

feature -- Queries
	is_space: BOOLEAN is
		do
			Result := (value=space_low_level)
		end

	is_button: BOOLEAN is
		do
			Result := (value=button_low_level)
		end

	is_togglebutton: BOOLEAN is
		do
			Result := (value=togglebutton_low_level)
		end

	is_radiobutton: BOOLEAN is
		do
			Result := (value=radiobutton_low_level)
		end

	is_widget: BOOLEAN is
		do
			Result := (value=widget_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_CHILD_SPACE"
 			}"
 		end

	button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_CHILD_BUTTON"
 			}"
 		end

	togglebutton_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_CHILD_TOGGLEBUTTON"
 			}"
 		end

	radiobutton_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_CHILD_RADIOBUTTON"
 			}"
 		end

	widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOOLBAR_CHILD_WIDGET"
 			}"
 		end


end -- class GTK_TOOLBAR_CHILD_TYPE_ENUM
