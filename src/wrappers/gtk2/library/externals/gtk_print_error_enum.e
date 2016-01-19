-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_print_error_general_low_level)  or else
				(a_value = gtk_print_error_internal_error_low_level)  or else
				(a_value = gtk_print_error_invalid_file_low_level)  or else
				(a_value = gtk_print_error_nomem_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_print_error_general is
		do
			value := gtk_print_error_general_low_level
		end

	set_gtk_print_error_internal_error is
		do
			value := gtk_print_error_internal_error_low_level
		end

	set_gtk_print_error_invalid_file is
		do
			value := gtk_print_error_invalid_file_low_level
		end

	set_gtk_print_error_nomem is
		do
			value := gtk_print_error_nomem_low_level
		end

feature -- Queries
	is_gtk_print_error_general: BOOLEAN is
		do
			Result := (value=gtk_print_error_general_low_level)
		end

	is_gtk_print_error_internal_error: BOOLEAN is
		do
			Result := (value=gtk_print_error_internal_error_low_level)
		end

	is_gtk_print_error_invalid_file: BOOLEAN is
		do
			Result := (value=gtk_print_error_invalid_file_low_level)
		end

	is_gtk_print_error_nomem: BOOLEAN is
		do
			Result := (value=gtk_print_error_nomem_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_print_error_general_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_ERROR_GENERAL"
 			}"
 		end

	gtk_print_error_internal_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_ERROR_INTERNAL_ERROR"
 			}"
 		end

	gtk_print_error_invalid_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_ERROR_INVALID_FILE"
 			}"
 		end

	gtk_print_error_nomem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_ERROR_NOMEM"
 			}"
 		end


end -- class GTK_PRINT_ERROR_ENUM
