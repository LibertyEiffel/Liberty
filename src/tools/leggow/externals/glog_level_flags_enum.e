-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GLOG_LEVEL_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = flag_fatal_low_level)  or else
				(a_value = flag_recursion_low_level)  or else
				(a_value = level_critical_low_level)  or else
				(a_value = level_debug_low_level)  or else
				(a_value = level_error_low_level)  or else
				(a_value = level_info_low_level)  or else
				(a_value = level_mask_low_level)  or else
				(a_value = level_message_low_level)  or else
				(a_value = level_warning_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_flag_fatal
               do
                       value := flag_fatal_low_level
               end

	set_flag_recursion
               do
                       value := flag_recursion_low_level
               end

	set_level_critical
               do
                       value := level_critical_low_level
               end

	set_level_debug
               do
                       value := level_debug_low_level
               end

	set_level_error
               do
                       value := level_error_low_level
               end

	set_level_info
               do
                       value := level_info_low_level
               end

	set_level_mask
               do
                       value := level_mask_low_level
               end

	set_level_message
               do
                       value := level_message_low_level
               end

	set_level_warning
               do
                       value := level_warning_low_level
               end

feature {ANY} -- Queries
       is_flag_fatal: BOOLEAN
               do
                       Result := (value=flag_fatal_low_level)
               end

       is_flag_recursion: BOOLEAN
               do
                       Result := (value=flag_recursion_low_level)
               end

       is_level_critical: BOOLEAN
               do
                       Result := (value=level_critical_low_level)
               end

       is_level_debug: BOOLEAN
               do
                       Result := (value=level_debug_low_level)
               end

       is_level_error: BOOLEAN
               do
                       Result := (value=level_error_low_level)
               end

       is_level_info: BOOLEAN
               do
                       Result := (value=level_info_low_level)
               end

       is_level_mask: BOOLEAN
               do
                       Result := (value=level_mask_low_level)
               end

       is_level_message: BOOLEAN
               do
                       Result := (value=level_message_low_level)
               end

       is_level_warning: BOOLEAN
               do
                       Result := (value=level_warning_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     flag_fatal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_LOG_FLAG_FATAL"
                       }"
               end

     flag_recursion_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_LOG_FLAG_RECURSION"
                       }"
               end

     level_critical_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_LOG_LEVEL_CRITICAL"
                       }"
               end

     level_debug_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_LOG_LEVEL_DEBUG"
                       }"
               end

     level_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_LOG_LEVEL_ERROR"
                       }"
               end

     level_info_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_LOG_LEVEL_INFO"
                       }"
               end

     level_mask_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_LOG_LEVEL_MASK"
                       }"
               end

     level_message_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_LOG_LEVEL_MESSAGE"
                       }"
               end

     level_warning_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_LOG_LEVEL_WARNING"
                       }"
               end


end -- class GLOG_LEVEL_FLAGS_ENUM
