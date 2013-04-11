-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GLOG_LEVEL_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = flag_recursion_low_level)  or else
				(a_value = flag_fatal_low_level)  or else
				(a_value = level_error_low_level)  or else
				(a_value = level_critical_low_level)  or else
				(a_value = level_warning_low_level)  or else
				(a_value = level_message_low_level)  or else
				(a_value = level_info_low_level)  or else
				(a_value = level_debug_low_level)  or else
				(a_value = level_mask_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_flag_recursion is
		do
			value := flag_recursion_low_level
		end

	set_flag_fatal is
		do
			value := flag_fatal_low_level
		end

	set_level_error is
		do
			value := level_error_low_level
		end

	set_level_critical is
		do
			value := level_critical_low_level
		end

	set_level_warning is
		do
			value := level_warning_low_level
		end

	set_level_message is
		do
			value := level_message_low_level
		end

	set_level_info is
		do
			value := level_info_low_level
		end

	set_level_debug is
		do
			value := level_debug_low_level
		end

	set_level_mask is
		do
			value := level_mask_low_level
		end

feature {ANY} -- Queries
	is_flag_recursion: BOOLEAN is
		do
			Result := (value=flag_recursion_low_level)
		end

	is_flag_fatal: BOOLEAN is
		do
			Result := (value=flag_fatal_low_level)
		end

	is_level_error: BOOLEAN is
		do
			Result := (value=level_error_low_level)
		end

	is_level_critical: BOOLEAN is
		do
			Result := (value=level_critical_low_level)
		end

	is_level_warning: BOOLEAN is
		do
			Result := (value=level_warning_low_level)
		end

	is_level_message: BOOLEAN is
		do
			Result := (value=level_message_low_level)
		end

	is_level_info: BOOLEAN is
		do
			Result := (value=level_info_low_level)
		end

	is_level_debug: BOOLEAN is
		do
			Result := (value=level_debug_low_level)
		end

	is_level_mask: BOOLEAN is
		do
			Result := (value=level_mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	flag_recursion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_FLAG_RECURSION"
 			}"
 		end

	flag_fatal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_FLAG_FATAL"
 			}"
 		end

	level_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_ERROR"
 			}"
 		end

	level_critical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_CRITICAL"
 			}"
 		end

	level_warning_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_WARNING"
 			}"
 		end

	level_message_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_MESSAGE"
 			}"
 		end

	level_info_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_INFO"
 			}"
 		end

	level_debug_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_DEBUG"
 			}"
 		end

	level_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_MASK"
 			}"
 		end


end -- class GLOG_LEVEL_FLAGS_ENUM
