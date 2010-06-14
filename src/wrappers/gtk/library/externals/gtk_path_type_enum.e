-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PATH_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = widget_low_level)  or else
				(a_value = widget_class_low_level)  or else
				(a_value = class_external_low_level) )
		end

feature -- Setters
	default_create,
	set_widget is
		do
			value := widget_low_level
		end

	set_widget_class is
		do
			value := widget_class_low_level
		end

	set_class_external is
		do
			value := class_external_low_level
		end

feature -- Queries
	is_widget: BOOLEAN is
		do
			Result := (value=widget_low_level)
		end

	is_widget_class: BOOLEAN is
		do
			Result := (value=widget_class_low_level)
		end

	is_class_external: BOOLEAN is
		do
			Result := (value=class_external_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_WIDGET"
 			}"
 		end

	widget_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_WIDGET_CLASS"
 			}"
 		end

	class_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_CLASS"
 			}"
 		end


end -- class GTK_PATH_TYPE_ENUM
