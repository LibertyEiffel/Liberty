-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_CONNECTION_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = authentication_client_low_level)  or else
				(a_value = authentication_server_low_level)  or else
				(a_value = authentication_allow_anonymous_low_level)  or else
				(a_value = message_bus_connection_low_level)  or else
				(a_value = delay_message_processing_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_authentication_client is
		do
			value := authentication_client_low_level
		end

	set_authentication_server is
		do
			value := authentication_server_low_level
		end

	set_authentication_allow_anonymous is
		do
			value := authentication_allow_anonymous_low_level
		end

	set_message_bus_connection is
		do
			value := message_bus_connection_low_level
		end

	set_delay_message_processing is
		do
			value := delay_message_processing_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	authentication_client: BOOLEAN is
		do
			Result := (value=authentication_client_low_level)
		end

	authentication_server: BOOLEAN is
		do
			Result := (value=authentication_server_low_level)
		end

	authentication_allow_anonymous: BOOLEAN is
		do
			Result := (value=authentication_allow_anonymous_low_level)
		end

	message_bus_connection: BOOLEAN is
		do
			Result := (value=message_bus_connection_low_level)
		end

	delay_message_processing: BOOLEAN is
		do
			Result := (value=delay_message_processing_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_NONE"
 			}"
 		end

	authentication_client_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT"
 			}"
 		end

	authentication_server_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER"
 			}"
 		end

	authentication_allow_anonymous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS"
 			}"
 		end

	message_bus_connection_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION"
 			}"
 		end

	delay_message_processing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING"
 			}"
 		end


end -- class GDBUS_CONNECTION_FLAGS_ENUM
