-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GAPP_INFO_CREATE_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_app_info_create_needs_terminal_low_level)  or else
				(a_value = g_app_info_create_none_low_level)  or else
				(a_value = g_app_info_create_supports_startup_notification_low_level)  or else
				(a_value = g_app_info_create_supports_uris_low_level) )
		end

feature -- Setters
	default_create,
	set_g_app_info_create_needs_terminal is
		do
			value := g_app_info_create_needs_terminal_low_level
		end

	set_g_app_info_create_none is
		do
			value := g_app_info_create_none_low_level
		end

	set_g_app_info_create_supports_startup_notification is
		do
			value := g_app_info_create_supports_startup_notification_low_level
		end

	set_g_app_info_create_supports_uris is
		do
			value := g_app_info_create_supports_uris_low_level
		end

feature -- Queries
	is_g_app_info_create_needs_terminal: BOOLEAN is
		do
			Result := (value=g_app_info_create_needs_terminal_low_level)
		end

	is_g_app_info_create_none: BOOLEAN is
		do
			Result := (value=g_app_info_create_none_low_level)
		end

	is_g_app_info_create_supports_startup_notification: BOOLEAN is
		do
			Result := (value=g_app_info_create_supports_startup_notification_low_level)
		end

	is_g_app_info_create_supports_uris: BOOLEAN is
		do
			Result := (value=g_app_info_create_supports_uris_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_app_info_create_needs_terminal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APP_INFO_CREATE_NEEDS_TERMINAL"
 			}"
 		end

	g_app_info_create_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APP_INFO_CREATE_NONE"
 			}"
 		end

	g_app_info_create_supports_startup_notification_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APP_INFO_CREATE_SUPPORTS_STARTUP_NOTIFICATION"
 			}"
 		end

	g_app_info_create_supports_uris_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APP_INFO_CREATE_SUPPORTS_URIS"
 			}"
 		end


end -- class GAPP_INFO_CREATE_FLAGS_ENUM
