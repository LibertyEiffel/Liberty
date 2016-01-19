-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_FILE_CHOOSER_CONFIRMATION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_file_chooser_confirmation_accept_filename_low_level)  or else
				(a_value = gtk_file_chooser_confirmation_confirm_low_level)  or else
				(a_value = gtk_file_chooser_confirmation_select_again_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_file_chooser_confirmation_accept_filename is
		do
			value := gtk_file_chooser_confirmation_accept_filename_low_level
		end

	set_gtk_file_chooser_confirmation_confirm is
		do
			value := gtk_file_chooser_confirmation_confirm_low_level
		end

	set_gtk_file_chooser_confirmation_select_again is
		do
			value := gtk_file_chooser_confirmation_select_again_low_level
		end

feature -- Queries
	is_gtk_file_chooser_confirmation_accept_filename: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_confirmation_accept_filename_low_level)
		end

	is_gtk_file_chooser_confirmation_confirm: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_confirmation_confirm_low_level)
		end

	is_gtk_file_chooser_confirmation_select_again: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_confirmation_select_again_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_file_chooser_confirmation_accept_filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_CONFIRMATION_ACCEPT_FILENAME"
 			}"
 		end

	gtk_file_chooser_confirmation_confirm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_CONFIRMATION_CONFIRM"
 			}"
 		end

	gtk_file_chooser_confirmation_select_again_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_CONFIRMATION_SELECT_AGAIN"
 			}"
 		end


end -- class GTK_FILE_CHOOSER_CONFIRMATION_ENUM
