-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GBOOKMARK_FILE_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid__uri_low_level)  or else
				(a_value = app__not__registered_low_level)  or else
				(a_value = uri__not__found_low_level)  or else
				(a_value = read_low_level)  or else
				(a_value = unknown__encoding_low_level)  or else
				(a_value = write_low_level)  or else
				(a_value = file__not__found_low_level) )
		end

feature -- Setters
	default_create,
	set_invalid__uri is
		do
			value := invalid__uri_low_level
		end

	set_app__not__registered is
		do
			value := app__not__registered_low_level
		end

	set_uri__not__found is
		do
			value := uri__not__found_low_level
		end

	set_read is
		do
			value := read_low_level
		end

	set_unknown__encoding is
		do
			value := unknown__encoding_low_level
		end

	set_write is
		do
			value := write_low_level
		end

	set_file__not__found is
		do
			value := file__not__found_low_level
		end

feature -- Queries
	is_invalid__uri: BOOLEAN is
		do
			Result := (value=invalid__uri_low_level)
		end

	is_app__not__registered: BOOLEAN is
		do
			Result := (value=app__not__registered_low_level)
		end

	is_uri__not__found: BOOLEAN is
		do
			Result := (value=uri__not__found_low_level)
		end

	is_read: BOOLEAN is
		do
			Result := (value=read_low_level)
		end

	is_unknown__encoding: BOOLEAN is
		do
			Result := (value=unknown__encoding_low_level)
		end

	is_write: BOOLEAN is
		do
			Result := (value=write_low_level)
		end

	is_file__not__found: BOOLEAN is
		do
			Result := (value=file__not__found_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid__uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_INVALID_URI"
 			}"
 		end

	app__not__registered_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED"
 			}"
 		end

	uri__not__found_low_level: INTEGER is
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

	unknown__encoding_low_level: INTEGER is
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

	file__not__found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND"
 			}"
 		end


end -- class GBOOKMARK_FILE_ERROR_ENUM
