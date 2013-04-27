-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKPATHPRIORITYTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_path_prio_application_low_level)  or else
				(a_value = gtk_path_prio_gtk_low_level)  or else
				(a_value = gtk_path_prio_highest_low_level)  or else
				(a_value = gtk_path_prio_lowest_low_level)  or else
				(a_value = gtk_path_prio_rc_low_level)  or else
				(a_value = gtk_path_prio_theme_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_path_prio_application is
		do
			value := gtk_path_prio_application_low_level
		end

	set_gtk_path_prio_gtk is
		do
			value := gtk_path_prio_gtk_low_level
		end

	set_gtk_path_prio_highest is
		do
			value := gtk_path_prio_highest_low_level
		end

	set_gtk_path_prio_lowest is
		do
			value := gtk_path_prio_lowest_low_level
		end

	set_gtk_path_prio_rc is
		do
			value := gtk_path_prio_rc_low_level
		end

	set_gtk_path_prio_theme is
		do
			value := gtk_path_prio_theme_low_level
		end

feature {ANY} -- Queries
	is_gtk_path_prio_application: BOOLEAN is
		do
			Result := (value=gtk_path_prio_application_low_level)
		end

	is_gtk_path_prio_gtk: BOOLEAN is
		do
			Result := (value=gtk_path_prio_gtk_low_level)
		end

	is_gtk_path_prio_highest: BOOLEAN is
		do
			Result := (value=gtk_path_prio_highest_low_level)
		end

	is_gtk_path_prio_lowest: BOOLEAN is
		do
			Result := (value=gtk_path_prio_lowest_low_level)
		end

	is_gtk_path_prio_rc: BOOLEAN is
		do
			Result := (value=gtk_path_prio_rc_low_level)
		end

	is_gtk_path_prio_theme: BOOLEAN is
		do
			Result := (value=gtk_path_prio_theme_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_path_prio_application_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_APPLICATION"
 			}"
 		end

	gtk_path_prio_gtk_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_GTK"
 			}"
 		end

	gtk_path_prio_highest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_HIGHEST"
 			}"
 		end

	gtk_path_prio_lowest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_LOWEST"
 			}"
 		end

	gtk_path_prio_rc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_RC"
 			}"
 		end

	gtk_path_prio_theme_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_PRIO_THEME"
 			}"
 		end


end -- class GTKPATHPRIORITYTYPE_ENUM
