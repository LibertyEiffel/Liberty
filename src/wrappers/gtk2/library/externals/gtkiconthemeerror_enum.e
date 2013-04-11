-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKICONTHEMEERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_icon_theme_failed_low_level)  or else
				(a_value = gtk_icon_theme_not_found_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_icon_theme_failed is
		do
			value := gtk_icon_theme_failed_low_level
		end

	set_gtk_icon_theme_not_found is
		do
			value := gtk_icon_theme_not_found_low_level
		end

feature {ANY} -- Queries
	is_gtk_icon_theme_failed: BOOLEAN is
		do
			Result := (value=gtk_icon_theme_failed_low_level)
		end

	is_gtk_icon_theme_not_found: BOOLEAN is
		do
			Result := (value=gtk_icon_theme_not_found_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_icon_theme_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_THEME_FAILED"
 			}"
 		end

	gtk_icon_theme_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_THEME_NOT_FOUND"
 			}"
 		end


end -- class GTKICONTHEMEERROR_ENUM
