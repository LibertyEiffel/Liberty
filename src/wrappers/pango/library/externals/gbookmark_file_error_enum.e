-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GBOOKMARK_FILE_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_uri_low_level)  or else
				(a_value = invalid_value_low_level)  or else
				(a_value = app_not_registered_low_level)  or else
				(a_value = uri_not_found_low_level)  or else
				(a_value = read_low_level)  or else
				(a_value = unknown_encoding_low_level)  or else
				(a_value = write_low_level)  or else
				(a_value = file_not_found_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_invalid_uri is
		do
			value := invalid_uri_low_level
		end

	set_invalid_value is
		do
			value := invalid_value_low_level
		end

	set_app_not_registered is
		do
			value := app_not_registered_low_level
		end

	set_uri_not_found is
		do
			value := uri_not_found_low_level
		end

	set_read is
		do
			value := read_low_level
		end

	set_unknown_encoding is
		do
			value := unknown_encoding_low_level
		end

	set_write is
		do
			value := write_low_level
		end

	set_file_not_found is
		do
			value := file_not_found_low_level
		end

feature {ANY} -- Queries
	is_invalid_uri: BOOLEAN is
		do
			Result := (value=invalid_uri_low_level)
		end

	is_invalid_value: BOOLEAN is
		do
			Result := (value=invalid_value_low_level)
		end

	is_app_not_registered: BOOLEAN is
		do
			Result := (value=app_not_registered_low_level)
		end

	is_uri_not_found: BOOLEAN is
		do
			Result := (value=uri_not_found_low_level)
		end

	is_read: BOOLEAN is
		do
			Result := (value=read_low_level)
		end

	is_unknown_encoding: BOOLEAN is
		do
			Result := (value=unknown_encoding_low_level)
		end

	is_write: BOOLEAN is
		do
			Result := (value=write_low_level)
		end

	is_file_not_found: BOOLEAN is
		do
			Result := (value=file_not_found_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_INVALID_URI"
 			}"
 		end

	invalid_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_INVALID_VALUE"
 			}"
 		end

	app_not_registered_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED"
 			}"
 		end

	uri_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND"
 			}"
 		end

	read_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_READ"
 			}"
 		end

	unknown_encoding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING"
 			}"
 		end

	write_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_WRITE"
 			}"
 		end

	file_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND"
 			}"
 		end


end -- class GBOOKMARK_FILE_ERROR_ENUM
