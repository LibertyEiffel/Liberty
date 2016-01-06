-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GSHELL_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bad_quoting_low_level)  or else
				(a_value = empty_string_low_level)  or else
				(a_value = failed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bad_quoting
               do
                       value := bad_quoting_low_level
               end

	set_empty_string
               do
                       value := empty_string_low_level
               end

	set_failed
               do
                       value := failed_low_level
               end

feature {ANY} -- Queries
       is_bad_quoting: BOOLEAN
               do
                       Result := (value=bad_quoting_low_level)
               end

       is_empty_string: BOOLEAN
               do
                       Result := (value=empty_string_low_level)
               end

       is_failed: BOOLEAN
               do
                       Result := (value=failed_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bad_quoting_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SHELL_ERROR_BAD_QUOTING"
                       }"
               end

     empty_string_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SHELL_ERROR_EMPTY_STRING"
                       }"
               end

     failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SHELL_ERROR_FAILED"
                       }"
               end


end -- class GSHELL_ERROR_ENUM
