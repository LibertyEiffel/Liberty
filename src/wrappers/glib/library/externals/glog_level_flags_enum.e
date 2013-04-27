-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GLOG_LEVEL_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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

feature -- Setters
	default_create,
	set_g_log_flag_fatal is
		do
			value := g_log_flag_fatal_low_level
		end

	set_g_log_flag_recursion is
		do
			value := g_log_flag_recursion_low_level
		end

	set_g_log_level_critical is
		do
			value := g_log_level_critical_low_level
		end

	set_g_log_level_debug is
		do
			value := g_log_level_debug_low_level
		end

	set_g_log_level_error is
		do
			value := g_log_level_error_low_level
		end

	set_g_log_level_info is
		do
			value := g_log_level_info_low_level
		end

	set_g_log_level_mask is
		do
			value := g_log_level_mask_low_level
		end

	set_g_log_level_message is
		do
			value := g_log_level_message_low_level
		end

	set_g_log_level_warning is
		do
			value := g_log_level_warning_low_level
		end

feature -- Queries
	is_g_log_flag_fatal: BOOLEAN is
		do
			Result := (value=g_log_flag_fatal_low_level)
		end

	is_g_log_flag_recursion: BOOLEAN is
		do
			Result := (value=g_log_flag_recursion_low_level)
		end

	is_g_log_level_critical: BOOLEAN is
		do
			Result := (value=g_log_level_critical_low_level)
		end

	is_g_log_level_debug: BOOLEAN is
		do
			Result := (value=g_log_level_debug_low_level)
		end

	is_g_log_level_error: BOOLEAN is
		do
			Result := (value=g_log_level_error_low_level)
		end

	is_g_log_level_info: BOOLEAN is
		do
			Result := (value=g_log_level_info_low_level)
		end

	is_g_log_level_mask: BOOLEAN is
		do
			Result := (value=g_log_level_mask_low_level)
		end

	is_g_log_level_message: BOOLEAN is
		do
			Result := (value=g_log_level_message_low_level)
		end

	is_g_log_level_warning: BOOLEAN is
		do
			Result := (value=g_log_level_warning_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_log_flag_fatal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_FLAG_FATAL"
 			}"
 		end

	g_log_flag_recursion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_FLAG_RECURSION"
 			}"
 		end

	g_log_level_critical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_CRITICAL"
 			}"
 		end

	g_log_level_debug_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_DEBUG"
 			}"
 		end

	g_log_level_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_ERROR"
 			}"
 		end

	g_log_level_info_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_INFO"
 			}"
 		end

	g_log_level_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_MASK"
 			}"
 		end

	g_log_level_message_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_MESSAGE"
 			}"
 		end

	g_log_level_warning_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_WARNING"
 			}"
 		end


end -- class GLOG_LEVEL_FLAGS_ENUM
