-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GOPTION_ARG_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = callback_low_level)  or else
				(a_value = double_low_level)  or else
				(a_value = filename_low_level)  or else
				(a_value = filename_array_low_level)  or else
				(a_value = int_low_level)  or else
				(a_value = int64_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = string_low_level)  or else
				(a_value = string_array_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_callback
               do
                       value := callback_low_level
               end

	set_double
               do
                       value := double_low_level
               end

	set_filename
               do
                       value := filename_low_level
               end

	set_filename_array
               do
                       value := filename_array_low_level
               end

	set_int
               do
                       value := int_low_level
               end

	set_int64
               do
                       value := int64_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_string
               do
                       value := string_low_level
               end

	set_string_array
               do
                       value := string_array_low_level
               end

feature {ANY} -- Queries
       is_callback: BOOLEAN
               do
                       Result := (value=callback_low_level)
               end

       is_double: BOOLEAN
               do
                       Result := (value=double_low_level)
               end

       is_filename: BOOLEAN
               do
                       Result := (value=filename_low_level)
               end

       is_filename_array: BOOLEAN
               do
                       Result := (value=filename_array_low_level)
               end

       is_int: BOOLEAN
               do
                       Result := (value=int_low_level)
               end

       is_int64: BOOLEAN
               do
                       Result := (value=int64_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_string: BOOLEAN
               do
                       Result := (value=string_low_level)
               end

       is_string_array: BOOLEAN
               do
                       Result := (value=string_array_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     callback_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ARG_CALLBACK"
                       }"
               end

     double_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ARG_DOUBLE"
                       }"
               end

     filename_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ARG_FILENAME"
                       }"
               end

     filename_array_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ARG_FILENAME_ARRAY"
                       }"
               end

     int_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ARG_INT"
                       }"
               end

     int64_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ARG_INT64"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ARG_NONE"
                       }"
               end

     string_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ARG_STRING"
                       }"
               end

     string_array_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ARG_STRING_ARRAY"
                       }"
               end


end -- class GOPTION_ARG_ENUM
