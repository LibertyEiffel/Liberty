-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_LOG_LEVEL_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
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
	default_create, set_flag_recursion
		do
			value := g_log_flag_recursion
		end

	set_flag_fatal
		do
			value := g_log_flag_fatal
		end

	set_level_error
		do
			value := g_log_level_error
		end

	set_level_critical
		do
			value := g_log_level_critical
		end

	set_level_warning
		do
			value := g_log_level_warning
		end

	set_level_message
		do
			value := g_log_level_message
		end

	set_level_info
		do
			value := g_log_level_info
		end

	set_level_debug
		do
			value := g_log_level_debug
		end

	set_level_mask
		do
			value := g_log_level_mask
		end


feature {ANY} -- Queries
	is_flag_recursion: BOOLEAN
		do
			Result := (value=g_log_flag_recursion)
		end

	is_flag_fatal: BOOLEAN
		do
			Result := (value=g_log_flag_fatal)
		end

	is_level_error: BOOLEAN
		do
			Result := (value=g_log_level_error)
		end

	is_level_critical: BOOLEAN
		do
			Result := (value=g_log_level_critical)
		end

	is_level_warning: BOOLEAN
		do
			Result := (value=g_log_level_warning)
		end

	is_level_message: BOOLEAN
		do
			Result := (value=g_log_level_message)
		end

	is_level_info: BOOLEAN
		do
			Result := (value=g_log_level_info)
		end

	is_level_debug: BOOLEAN
		do
			Result := (value=g_log_level_debug)
		end

	is_level_mask: BOOLEAN
		do
			Result := (value=g_log_level_mask)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_log_flag_recursion: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_FLAG_RECURSION"
		end

	g_log_flag_fatal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_FLAG_FATAL"
		end

	g_log_level_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_ERROR"
		end

	g_log_level_critical: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_CRITICAL"
		end

	g_log_level_warning: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_WARNING"
		end

	g_log_level_message: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_MESSAGE"
		end

	g_log_level_info: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_INFO"
		end

	g_log_level_debug: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_DEBUG"
		end

	g_log_level_mask: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_LOG_LEVEL_MASK"
		end


end

