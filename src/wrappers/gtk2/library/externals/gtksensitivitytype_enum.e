-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKSENSITIVITYTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_sensitivity_auto_low_level)  or else
				(a_value = gtk_sensitivity_off_low_level)  or else
				(a_value = gtk_sensitivity_on_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_sensitivity_auto is
		do
			value := gtk_sensitivity_auto_low_level
		end

	set_gtk_sensitivity_off is
		do
			value := gtk_sensitivity_off_low_level
		end

	set_gtk_sensitivity_on is
		do
			value := gtk_sensitivity_on_low_level
		end

feature {ANY} -- Queries
	is_gtk_sensitivity_auto: BOOLEAN is
		do
			Result := (value=gtk_sensitivity_auto_low_level)
		end

	is_gtk_sensitivity_off: BOOLEAN is
		do
			Result := (value=gtk_sensitivity_off_low_level)
		end

	is_gtk_sensitivity_on: BOOLEAN is
		do
			Result := (value=gtk_sensitivity_on_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_sensitivity_auto_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SENSITIVITY_AUTO"
 			}"
 		end

	gtk_sensitivity_off_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SENSITIVITY_OFF"
 			}"
 		end

	gtk_sensitivity_on_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SENSITIVITY_ON"
 			}"
 		end


end -- class GTKSENSITIVITYTYPE_ENUM
