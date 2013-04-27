-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RECENT_CHOOSER_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_recent_chooser_error_invalid_uri_low_level)  or else
				(a_value = gtk_recent_chooser_error_not_found_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_recent_chooser_error_invalid_uri is
		do
			value := gtk_recent_chooser_error_invalid_uri_low_level
		end

	set_gtk_recent_chooser_error_not_found is
		do
			value := gtk_recent_chooser_error_not_found_low_level
		end

feature -- Queries
	is_gtk_recent_chooser_error_invalid_uri: BOOLEAN is
		do
			Result := (value=gtk_recent_chooser_error_invalid_uri_low_level)
		end

	is_gtk_recent_chooser_error_not_found: BOOLEAN is
		do
			Result := (value=gtk_recent_chooser_error_not_found_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_recent_chooser_error_invalid_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_CHOOSER_ERROR_INVALID_URI"
 			}"
 		end

	gtk_recent_chooser_error_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_CHOOSER_ERROR_NOT_FOUND"
 			}"
 		end


end -- class GTK_RECENT_CHOOSER_ERROR_ENUM
