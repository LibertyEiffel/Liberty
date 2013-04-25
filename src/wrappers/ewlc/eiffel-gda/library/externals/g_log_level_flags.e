-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_LOG_LEVEL_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_log_flag_recursion) or else 
				(a_value = g_log_flag_fatal) or else 
				(a_value = g_log_level_error) or else 
				(a_value = g_log_level_critical) or else 
				(a_value = g_log_level_warning) or else 
				(a_value = g_log_level_message) or else 
				(a_value = g_log_level_info) or else 
				(a_value = g_log_level_debug) or else 
				(a_value = g_log_level_mask))
		end


feature {ANY} -- Setters
	default_create, set_flag_recursion is
		do
			value := g_log_flag_recursion
		end

	set_flag_fatal is
		do
			value := g_log_flag_fatal
		end

	set_level_error is
		do
			value := g_log_level_error
		end

	set_level_critical is
		do
			value := g_log_level_critical
		end

	set_level_warning is
		do
			value := g_log_level_warning
		end

	set_level_message is
		do
			value := g_log_level_message
		end

	set_level_info is
		do
			value := g_log_level_info
		end

	set_level_debug is
		do
			value := g_log_level_debug
		end

	set_level_mask is
		do
			value := g_log_level_mask
		end


feature {ANY} -- Queries
	is_flag_recursion: BOOLEAN is
		do
			Result := (value=g_log_flag_recursion)
		end

	is_flag_fatal: BOOLEAN is
		do
			Result := (value=g_log_flag_fatal)
		end

	is_level_error: BOOLEAN is
		do
			Result := (value=g_log_level_error)
		end

	is_level_critical: BOOLEAN is
		do
			Result := (value=g_log_level_critical)
		end

	is_level_warning: BOOLEAN is
		do
			Result := (value=g_log_level_warning)
		end

	is_level_message: BOOLEAN is
		do
			Result := (value=g_log_level_message)
		end

	is_level_info: BOOLEAN is
		do
			Result := (value=g_log_level_info)
		end

	is_level_debug: BOOLEAN is
		do
			Result := (value=g_log_level_debug)
		end

	is_level_mask: BOOLEAN is
		do
			Result := (value=g_log_level_mask)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_log_flag_recursion: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_FLAG_RECURSION"
		end

	g_log_flag_fatal: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_FLAG_FATAL"
		end

	g_log_level_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_ERROR"
		end

	g_log_level_critical: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_CRITICAL"
		end

	g_log_level_warning: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_WARNING"
		end

	g_log_level_message: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_MESSAGE"
		end

	g_log_level_info: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_INFO"
		end

	g_log_level_debug: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_DEBUG"
		end

	g_log_level_mask: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_MASK"
		end


end

