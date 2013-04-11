-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GAPP_INFO_CREATE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = needs_terminal_low_level)  or else
				(a_value = supports_uris_low_level)  or else
				(a_value = supports_startup_notification_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_needs_terminal is
		do
			value := needs_terminal_low_level
		end

	set_supports_uris is
		do
			value := supports_uris_low_level
		end

	set_supports_startup_notification is
		do
			value := supports_startup_notification_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	needs_terminal: BOOLEAN is
		do
			Result := (value=needs_terminal_low_level)
		end

	supports_uris: BOOLEAN is
		do
			Result := (value=supports_uris_low_level)
		end

	supports_startup_notification: BOOLEAN is
		do
			Result := (value=supports_startup_notification_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APP_INFO_CREATE_NONE"
 			}"
 		end

	needs_terminal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APP_INFO_CREATE_NEEDS_TERMINAL"
 			}"
 		end

	supports_uris_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APP_INFO_CREATE_SUPPORTS_URIS"
 			}"
 		end

	supports_startup_notification_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APP_INFO_CREATE_SUPPORTS_STARTUP_NOTIFICATION"
 			}"
 		end


end -- class GAPP_INFO_CREATE_FLAGS_ENUM
