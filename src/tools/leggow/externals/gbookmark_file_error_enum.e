-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GBOOKMARK_FILE_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = app_not_registered_low_level)  or else
				(a_value = file_not_found_low_level)  or else
				(a_value = invalid_uri_low_level)  or else
				(a_value = invalid_value_low_level)  or else
				(a_value = read_low_level)  or else
				(a_value = unknown_encoding_low_level)  or else
				(a_value = uri_not_found_low_level)  or else
				(a_value = write_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_app_not_registered
               do
                       value := app_not_registered_low_level
               end

	set_file_not_found
               do
                       value := file_not_found_low_level
               end

	set_invalid_uri
               do
                       value := invalid_uri_low_level
               end

	set_invalid_value
               do
                       value := invalid_value_low_level
               end

	set_read
               do
                       value := read_low_level
               end

	set_unknown_encoding
               do
                       value := unknown_encoding_low_level
               end

	set_uri_not_found
               do
                       value := uri_not_found_low_level
               end

	set_write
               do
                       value := write_low_level
               end

feature {ANY} -- Queries
       is_app_not_registered: BOOLEAN
               do
                       Result := (value=app_not_registered_low_level)
               end

       is_file_not_found: BOOLEAN
               do
                       Result := (value=file_not_found_low_level)
               end

       is_invalid_uri: BOOLEAN
               do
                       Result := (value=invalid_uri_low_level)
               end

       is_invalid_value: BOOLEAN
               do
                       Result := (value=invalid_value_low_level)
               end

       is_read: BOOLEAN
               do
                       Result := (value=read_low_level)
               end

       is_unknown_encoding: BOOLEAN
               do
                       Result := (value=unknown_encoding_low_level)
               end

       is_uri_not_found: BOOLEAN
               do
                       Result := (value=uri_not_found_low_level)
               end

       is_write: BOOLEAN
               do
                       Result := (value=write_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     app_not_registered_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED"
                       }"
               end

     file_not_found_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND"
                       }"
               end

     invalid_uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_BOOKMARK_FILE_ERROR_INVALID_URI"
                       }"
               end

     invalid_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_BOOKMARK_FILE_ERROR_INVALID_VALUE"
                       }"
               end

     read_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_BOOKMARK_FILE_ERROR_READ"
                       }"
               end

     unknown_encoding_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING"
                       }"
               end

     uri_not_found_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND"
                       }"
               end

     write_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_BOOKMARK_FILE_ERROR_WRITE"
                       }"
               end


end -- class GBOOKMARK_FILE_ERROR_ENUM
