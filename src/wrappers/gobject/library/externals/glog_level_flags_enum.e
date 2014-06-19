-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GLOG_LEVEL_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_log_flag_fatal_low_level)  or else
				(a_value = g_log_flag_recursion_low_level)  or else
				(a_value = g_log_level_critical_low_level)  or else
				(a_value = g_log_level_debug_low_level)  or else
				(a_value = g_log_level_error_low_level)  or else
				(a_value = g_log_level_info_low_level)  or else
				(a_value = g_log_level_mask_low_level)  or else
				(a_value = g_log_level_message_low_level)  or else
				(a_value = g_log_level_warning_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_log_flag_fatal
		do
			value := g_log_flag_fatal_low_level
		end

	set_g_log_flag_recursion
		do
			value := g_log_flag_recursion_low_level
		end

	set_g_log_level_critical
		do
			value := g_log_level_critical_low_level
		end

	set_g_log_level_debug
		do
			value := g_log_level_debug_low_level
		end

	set_g_log_level_error
		do
			value := g_log_level_error_low_level
		end

	set_g_log_level_info
		do
			value := g_log_level_info_low_level
		end

	set_g_log_level_mask
		do
			value := g_log_level_mask_low_level
		end

	set_g_log_level_message
		do
			value := g_log_level_message_low_level
		end

	set_g_log_level_warning
		do
			value := g_log_level_warning_low_level
		end

feature {ANY} -- Queries
	is_g_log_flag_fatal: BOOLEAN
		do
			Result := (value=g_log_flag_fatal_low_level)
		end

	is_g_log_flag_recursion: BOOLEAN
		do
			Result := (value=g_log_flag_recursion_low_level)
		end

	is_g_log_level_critical: BOOLEAN
		do
			Result := (value=g_log_level_critical_low_level)
		end

	is_g_log_level_debug: BOOLEAN
		do
			Result := (value=g_log_level_debug_low_level)
		end

	is_g_log_level_error: BOOLEAN
		do
			Result := (value=g_log_level_error_low_level)
		end

	is_g_log_level_info: BOOLEAN
		do
			Result := (value=g_log_level_info_low_level)
		end

	is_g_log_level_mask: BOOLEAN
		do
			Result := (value=g_log_level_mask_low_level)
		end

	is_g_log_level_message: BOOLEAN
		do
			Result := (value=g_log_level_message_low_level)
		end

	is_g_log_level_warning: BOOLEAN
		do
			Result := (value=g_log_level_warning_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_log_flag_fatal_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_FLAG_FATAL"
 			}"
 		end

	g_log_flag_recursion_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_FLAG_RECURSION"
 			}"
 		end

	g_log_level_critical_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_CRITICAL"
 			}"
 		end

	g_log_level_debug_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_DEBUG"
 			}"
 		end

	g_log_level_error_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_ERROR"
 			}"
 		end

	g_log_level_info_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_INFO"
 			}"
 		end

	g_log_level_mask_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_MASK"
 			}"
 		end

	g_log_level_message_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_MESSAGE"
 			}"
 		end

	g_log_level_warning_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_WARNING"
 			}"
 		end


end -- class GLOG_LEVEL_FLAGS_ENUM
