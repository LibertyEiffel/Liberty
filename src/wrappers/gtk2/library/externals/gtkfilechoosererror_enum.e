-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKFILECHOOSERERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_file_chooser_error_already_exists_low_level)  or else
				(a_value = gtk_file_chooser_error_bad_filename_low_level)  or else
				(a_value = gtk_file_chooser_error_incomplete_hostname_low_level)  or else
				(a_value = gtk_file_chooser_error_nonexistent_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_file_chooser_error_already_exists is
		do
			value := gtk_file_chooser_error_already_exists_low_level
		end

	set_gtk_file_chooser_error_bad_filename is
		do
			value := gtk_file_chooser_error_bad_filename_low_level
		end

	set_gtk_file_chooser_error_incomplete_hostname is
		do
			value := gtk_file_chooser_error_incomplete_hostname_low_level
		end

	set_gtk_file_chooser_error_nonexistent is
		do
			value := gtk_file_chooser_error_nonexistent_low_level
		end

feature {ANY} -- Queries
	is_gtk_file_chooser_error_already_exists: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_error_already_exists_low_level)
		end

	is_gtk_file_chooser_error_bad_filename: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_error_bad_filename_low_level)
		end

	is_gtk_file_chooser_error_incomplete_hostname: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_error_incomplete_hostname_low_level)
		end

	is_gtk_file_chooser_error_nonexistent: BOOLEAN is
		do
			Result := (value=gtk_file_chooser_error_nonexistent_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_file_chooser_error_already_exists_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS"
 			}"
 		end

	gtk_file_chooser_error_bad_filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ERROR_BAD_FILENAME"
 			}"
 		end

	gtk_file_chooser_error_incomplete_hostname_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME"
 			}"
 		end

	gtk_file_chooser_error_nonexistent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ERROR_NONEXISTENT"
 			}"
 		end


end -- class GTKFILECHOOSERERROR_ENUM
