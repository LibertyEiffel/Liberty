-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_FILE_CHOOSER_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = nonexistent_low_level)  or else
				(a_value = bad_filename_low_level)  or else
				(a_value = already_exists_low_level)  or else
				(a_value = incomplete_hostname_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_nonexistent is
		do
			value := nonexistent_low_level
		end

	set_bad_filename is
		do
			value := bad_filename_low_level
		end

	set_already_exists is
		do
			value := already_exists_low_level
		end

	set_incomplete_hostname is
		do
			value := incomplete_hostname_low_level
		end

feature {ANY} -- Queries
	nonexistent: BOOLEAN is
		do
			Result := (value=nonexistent_low_level)
		end

	bad_filename: BOOLEAN is
		do
			Result := (value=bad_filename_low_level)
		end

	already_exists: BOOLEAN is
		do
			Result := (value=already_exists_low_level)
		end

	incomplete_hostname: BOOLEAN is
		do
			Result := (value=incomplete_hostname_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	nonexistent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ERROR_NONEXISTENT"
 			}"
 		end

	bad_filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ERROR_BAD_FILENAME"
 			}"
 		end

	already_exists_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS"
 			}"
 		end

	incomplete_hostname_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME"
 			}"
 		end


end -- class GTK_FILE_CHOOSER_ERROR_ENUM
