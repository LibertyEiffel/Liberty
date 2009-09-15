-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class G_LOG_LEVEL_FLAGS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_log_flag_recursion | 
				g_log_flag_fatal | 
				g_log_level_error | 
				g_log_level_critical | 
				g_log_level_warning | 
				g_log_level_message | 
				g_log_level_info | 
				g_log_level_debug | 
				g_log_level_mask)).to_boolean
		end

feature -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_flag_recursion is
		
	do
		value := value.bit_or(g_log_flag_recursion)
	end

	unset_flag_recursion is
		
	do
		value := value.bit_xor(g_log_flag_recursion)
	end

	set_flag_fatal is
		
	do
		value := value.bit_or(g_log_flag_fatal)
	end

	unset_flag_fatal is
		
	do
		value := value.bit_xor(g_log_flag_fatal)
	end

	set_level_error is
		
	do
		value := value.bit_or(g_log_level_error)
	end

	unset_level_error is
		
	do
		value := value.bit_xor(g_log_level_error)
	end

	set_level_critical is
		
	do
		value := value.bit_or(g_log_level_critical)
	end

	unset_level_critical is
		
	do
		value := value.bit_xor(g_log_level_critical)
	end

	set_level_warning is
		
	do
		value := value.bit_or(g_log_level_warning)
	end

	unset_level_warning is
		
	do
		value := value.bit_xor(g_log_level_warning)
	end

	set_level_message is
		
	do
		value := value.bit_or(g_log_level_message)
	end

	unset_level_message is
		
	do
		value := value.bit_xor(g_log_level_message)
	end

	set_level_info is
		
	do
		value := value.bit_or(g_log_level_info)
	end

	unset_level_info is
		
	do
		value := value.bit_xor(g_log_level_info)
	end

	set_level_debug is
		
	do
		value := value.bit_or(g_log_level_debug)
	end

	unset_level_debug is
		
	do
		value := value.bit_xor(g_log_level_debug)
	end

	set_level_mask is
		
	do
		value := value.bit_or(g_log_level_mask)
	end

	unset_level_mask is
		
	do
		value := value.bit_xor(g_log_level_mask)
	end

feature -- Queries
	is_flag_recursion: BOOLEAN is
		
	do
		Result := (value & g_log_flag_recursion).to_boolean
	end

	is_flag_fatal: BOOLEAN is
		
	do
		Result := (value & g_log_flag_fatal).to_boolean
	end

	is_level_error: BOOLEAN is
		
	do
		Result := (value & g_log_level_error).to_boolean
	end

	is_level_critical: BOOLEAN is
		
	do
		Result := (value & g_log_level_critical).to_boolean
	end

	is_level_warning: BOOLEAN is
		
	do
		Result := (value & g_log_level_warning).to_boolean
	end

	is_level_message: BOOLEAN is
		
	do
		Result := (value & g_log_level_message).to_boolean
	end

	is_level_info: BOOLEAN is
		
	do
		Result := (value & g_log_level_info).to_boolean
	end

	is_level_debug: BOOLEAN is
		
	do
		Result := (value & g_log_level_debug).to_boolean
	end

	is_level_mask: BOOLEAN is
		
	do
		Result := (value & g_log_level_mask).to_boolean
	end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_log_flag_recursion: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_LOG_FLAG_RECURSION"
 			}"
 		end

	g_log_flag_fatal: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_LOG_FLAG_FATAL"
 			}"
 		end

	g_log_level_error: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_LOG_LEVEL_ERROR"
 			}"
 		end

	g_log_level_critical: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_LOG_LEVEL_CRITICAL"
 			}"
 		end

	g_log_level_warning: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_LOG_LEVEL_WARNING"
 			}"
 		end

	g_log_level_message: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_LOG_LEVEL_MESSAGE"
 			}"
 		end

	g_log_level_info: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_LOG_LEVEL_INFO"
 			}"
 		end

	g_log_level_debug: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_LOG_LEVEL_DEBUG"
 			}"
 		end

	g_log_level_mask: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_LOG_LEVEL_MASK"
 			}"
 		end

end

