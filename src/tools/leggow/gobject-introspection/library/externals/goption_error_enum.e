-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GOPTION_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bad_value_low_level)  or else
				(a_value = failed_low_level)  or else
				(a_value = unknown_option_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bad_value
               do
                       value := bad_value_low_level
               end

	set_failed
               do
                       value := failed_low_level
               end

	set_unknown_option
               do
                       value := unknown_option_low_level
               end

feature {ANY} -- Queries
       is_bad_value: BOOLEAN
               do
                       Result := (value=bad_value_low_level)
               end

       is_failed: BOOLEAN
               do
                       Result := (value=failed_low_level)
               end

       is_unknown_option: BOOLEAN
               do
                       Result := (value=unknown_option_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bad_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ERROR_BAD_VALUE"
                       }"
               end

     failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ERROR_FAILED"
                       }"
               end

     unknown_option_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_OPTION_ERROR_UNKNOWN_OPTION"
                       }"
               end


end -- class GOPTION_ERROR_ENUM
