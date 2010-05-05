-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GLOG_LEVEL_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = flag__recursion_low_level)  or else
				(a_value = level__error_low_level)  or else
				(a_value = level__critical_low_level)  or else
				(a_value = level__warning_low_level)  or else
				(a_value = level__message_low_level)  or else
				(a_value = level__info_low_level)  or else
				(a_value = level__debug_low_level)  or else
				(a_value = level__mask_low_level) )
		end

feature -- Setters
	default_create,
	set_flag__recursion is
		do
			value := flag__recursion_low_level
		end

	set_level__error is
		do
			value := level__error_low_level
		end

	set_level__critical is
		do
			value := level__critical_low_level
		end

	set_level__warning is
		do
			value := level__warning_low_level
		end

	set_level__message is
		do
			value := level__message_low_level
		end

	set_level__info is
		do
			value := level__info_low_level
		end

	set_level__debug is
		do
			value := level__debug_low_level
		end

	set_level__mask is
		do
			value := level__mask_low_level
		end

feature -- Queries
	is_flag__recursion: BOOLEAN is
		do
			Result := (value=flag__recursion_low_level)
		end

	is_level__error: BOOLEAN is
		do
			Result := (value=level__error_low_level)
		end

	is_level__critical: BOOLEAN is
		do
			Result := (value=level__critical_low_level)
		end

	is_level__warning: BOOLEAN is
		do
			Result := (value=level__warning_low_level)
		end

	is_level__message: BOOLEAN is
		do
			Result := (value=level__message_low_level)
		end

	is_level__info: BOOLEAN is
		do
			Result := (value=level__info_low_level)
		end

	is_level__debug: BOOLEAN is
		do
			Result := (value=level__debug_low_level)
		end

	is_level__mask: BOOLEAN is
		do
			Result := (value=level__mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	flag__recursion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_FLAG_RECURSION"
 			}"
 		end

	level__error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_ERROR"
 			}"
 		end

	level__critical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_CRITICAL"
 			}"
 		end

	level__warning_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_WARNING"
 			}"
 		end

	level__message_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_MESSAGE"
 			}"
 		end

	level__info_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_INFO"
 			}"
 		end

	level__debug_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_DEBUG"
 			}"
 		end

	level__mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LOG_LEVEL_MASK"
 			}"
 		end


end -- class GLOG_LEVEL_FLAGS_ENUM
