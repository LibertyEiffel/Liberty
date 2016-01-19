-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_CONNECTION_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_dbus_connection_flags_authentication_allow_anonymous_low_level)  or else
				(a_value = g_dbus_connection_flags_authentication_client_low_level)  or else
				(a_value = g_dbus_connection_flags_authentication_server_low_level)  or else
				(a_value = g_dbus_connection_flags_delay_message_processing_low_level)  or else
				(a_value = g_dbus_connection_flags_message_bus_connection_low_level)  or else
				(a_value = g_dbus_connection_flags_none_low_level) )
		end

feature -- Setters
	default_create,
	set_g_dbus_connection_flags_authentication_allow_anonymous is
		do
			value := g_dbus_connection_flags_authentication_allow_anonymous_low_level
		end

	set_g_dbus_connection_flags_authentication_client is
		do
			value := g_dbus_connection_flags_authentication_client_low_level
		end

	set_g_dbus_connection_flags_authentication_server is
		do
			value := g_dbus_connection_flags_authentication_server_low_level
		end

	set_g_dbus_connection_flags_delay_message_processing is
		do
			value := g_dbus_connection_flags_delay_message_processing_low_level
		end

	set_g_dbus_connection_flags_message_bus_connection is
		do
			value := g_dbus_connection_flags_message_bus_connection_low_level
		end

	set_g_dbus_connection_flags_none is
		do
			value := g_dbus_connection_flags_none_low_level
		end

feature -- Queries
	is_g_dbus_connection_flags_authentication_allow_anonymous: BOOLEAN is
		do
			Result := (value=g_dbus_connection_flags_authentication_allow_anonymous_low_level)
		end

	is_g_dbus_connection_flags_authentication_client: BOOLEAN is
		do
			Result := (value=g_dbus_connection_flags_authentication_client_low_level)
		end

	is_g_dbus_connection_flags_authentication_server: BOOLEAN is
		do
			Result := (value=g_dbus_connection_flags_authentication_server_low_level)
		end

	is_g_dbus_connection_flags_delay_message_processing: BOOLEAN is
		do
			Result := (value=g_dbus_connection_flags_delay_message_processing_low_level)
		end

	is_g_dbus_connection_flags_message_bus_connection: BOOLEAN is
		do
			Result := (value=g_dbus_connection_flags_message_bus_connection_low_level)
		end

	is_g_dbus_connection_flags_none: BOOLEAN is
		do
			Result := (value=g_dbus_connection_flags_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_dbus_connection_flags_authentication_allow_anonymous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS"
 			}"
 		end

	g_dbus_connection_flags_authentication_client_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT"
 			}"
 		end

	g_dbus_connection_flags_authentication_server_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER"
 			}"
 		end

	g_dbus_connection_flags_delay_message_processing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING"
 			}"
 		end

	g_dbus_connection_flags_message_bus_connection_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION"
 			}"
 		end

	g_dbus_connection_flags_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_NONE"
 			}"
 		end


end -- class GDBUS_CONNECTION_FLAGS_ENUM
