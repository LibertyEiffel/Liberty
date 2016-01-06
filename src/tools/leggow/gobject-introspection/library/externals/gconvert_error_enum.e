-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GCONVERT_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bad_uri_low_level)  or else
				(a_value = failed_low_level)  or else
				(a_value = illegal_sequence_low_level)  or else
				(a_value = no_conversion_low_level)  or else
				(a_value = no_memory_low_level)  or else
				(a_value = not_absolute_path_low_level)  or else
				(a_value = partial_input_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bad_uri
               do
                       value := bad_uri_low_level
               end

	set_failed
               do
                       value := failed_low_level
               end

	set_illegal_sequence
               do
                       value := illegal_sequence_low_level
               end

	set_no_conversion
               do
                       value := no_conversion_low_level
               end

	set_no_memory
               do
                       value := no_memory_low_level
               end

	set_not_absolute_path
               do
                       value := not_absolute_path_low_level
               end

	set_partial_input
               do
                       value := partial_input_low_level
               end

feature {ANY} -- Queries
       is_bad_uri: BOOLEAN
               do
                       Result := (value=bad_uri_low_level)
               end

       is_failed: BOOLEAN
               do
                       Result := (value=failed_low_level)
               end

       is_illegal_sequence: BOOLEAN
               do
                       Result := (value=illegal_sequence_low_level)
               end

       is_no_conversion: BOOLEAN
               do
                       Result := (value=no_conversion_low_level)
               end

       is_no_memory: BOOLEAN
               do
                       Result := (value=no_memory_low_level)
               end

       is_not_absolute_path: BOOLEAN
               do
                       Result := (value=not_absolute_path_low_level)
               end

       is_partial_input: BOOLEAN
               do
                       Result := (value=partial_input_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bad_uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CONVERT_ERROR_BAD_URI"
                       }"
               end

     failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CONVERT_ERROR_FAILED"
                       }"
               end

     illegal_sequence_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CONVERT_ERROR_ILLEGAL_SEQUENCE"
                       }"
               end

     no_conversion_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CONVERT_ERROR_NO_CONVERSION"
                       }"
               end

     no_memory_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CONVERT_ERROR_NO_MEMORY"
                       }"
               end

     not_absolute_path_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CONVERT_ERROR_NOT_ABSOLUTE_PATH"
                       }"
               end

     partial_input_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CONVERT_ERROR_PARTIAL_INPUT"
                       }"
               end


end -- class GCONVERT_ERROR_ENUM
