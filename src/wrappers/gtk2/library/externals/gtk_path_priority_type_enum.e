-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PATH_PRIORITY_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = lowest_low_level)  or else
				(a_value = gtk_low_level)  or else
				(a_value = application_low_level)  or else
				(a_value = theme_low_level)  or else
				(a_value = rc_low_level)  or else
				(a_value = highest_low_level) )
		end

feature -- Setters
	default_create,
	set_lowest is
		do
			value := lowest_low_level
		end

	set_gtk is
		do
			value := gtk_low_level
		end

	set_application is
		do
			value := application_low_level
		end

	set_theme is
		do
			value := theme_low_level
		end

	set_rc is
		do
			value := rc_low_level
		end

	set_highest is
		do
			value := highest_low_level
		end

feature -- Queries
	lowest: BOOLEAN is
		do
			Result := (value=lowest_low_level)
		end

	gtk: BOOLEAN is
		do
			Result := (value=gtk_low_level)
		end

	application: BOOLEAN is
		do
			Result := (value=application_low_level)
		end

	theme: BOOLEAN is
		do
			Result := (value=theme_low_level)
		end

	rc: BOOLEAN is
		do
			Result := (value=rc_low_level)
		end

	highest: BOOLEAN is
		do
			Result := (value=highest_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	lowest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_LOWEST"
 			}"
 		end

	gtk_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_GTK"
 			}"
 		end

	application_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_APPLICATION"
 			}"
 		end

	theme_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_THEME"
 			}"
 		end

	rc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_RC"
 			}"
 		end

	highest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_HIGHEST"
 			}"
 		end


end -- class GTK_PATH_PRIORITY_TYPE_ENUM
