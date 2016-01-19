-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_MESSAGE_HEADER_FIELD_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_dbus_message_header_field_destination_low_level)  or else
				(a_value = g_dbus_message_header_field_error_name_low_level)  or else
				(a_value = g_dbus_message_header_field_interface_low_level)  or else
				(a_value = g_dbus_message_header_field_invalid_low_level)  or else
				(a_value = g_dbus_message_header_field_member_low_level)  or else
				(a_value = g_dbus_message_header_field_num_unix_fds_low_level)  or else
				(a_value = g_dbus_message_header_field_path_low_level)  or else
				(a_value = g_dbus_message_header_field_reply_serial_low_level)  or else
				(a_value = g_dbus_message_header_field_sender_low_level)  or else
				(a_value = g_dbus_message_header_field_signature_low_level) )
		end

feature -- Setters
	default_create,
	set_g_dbus_message_header_field_destination is
		do
			value := g_dbus_message_header_field_destination_low_level
		end

	set_g_dbus_message_header_field_error_name is
		do
			value := g_dbus_message_header_field_error_name_low_level
		end

	set_g_dbus_message_header_field_interface is
		do
			value := g_dbus_message_header_field_interface_low_level
		end

	set_g_dbus_message_header_field_invalid is
		do
			value := g_dbus_message_header_field_invalid_low_level
		end

	set_g_dbus_message_header_field_member is
		do
			value := g_dbus_message_header_field_member_low_level
		end

	set_g_dbus_message_header_field_num_unix_fds is
		do
			value := g_dbus_message_header_field_num_unix_fds_low_level
		end

	set_g_dbus_message_header_field_path is
		do
			value := g_dbus_message_header_field_path_low_level
		end

	set_g_dbus_message_header_field_reply_serial is
		do
			value := g_dbus_message_header_field_reply_serial_low_level
		end

	set_g_dbus_message_header_field_sender is
		do
			value := g_dbus_message_header_field_sender_low_level
		end

	set_g_dbus_message_header_field_signature is
		do
			value := g_dbus_message_header_field_signature_low_level
		end

feature -- Queries
	is_g_dbus_message_header_field_destination: BOOLEAN is
		do
			Result := (value=g_dbus_message_header_field_destination_low_level)
		end

	is_g_dbus_message_header_field_error_name: BOOLEAN is
		do
			Result := (value=g_dbus_message_header_field_error_name_low_level)
		end

	is_g_dbus_message_header_field_interface: BOOLEAN is
		do
			Result := (value=g_dbus_message_header_field_interface_low_level)
		end

	is_g_dbus_message_header_field_invalid: BOOLEAN is
		do
			Result := (value=g_dbus_message_header_field_invalid_low_level)
		end

	is_g_dbus_message_header_field_member: BOOLEAN is
		do
			Result := (value=g_dbus_message_header_field_member_low_level)
		end

	is_g_dbus_message_header_field_num_unix_fds: BOOLEAN is
		do
			Result := (value=g_dbus_message_header_field_num_unix_fds_low_level)
		end

	is_g_dbus_message_header_field_path: BOOLEAN is
		do
			Result := (value=g_dbus_message_header_field_path_low_level)
		end

	is_g_dbus_message_header_field_reply_serial: BOOLEAN is
		do
			Result := (value=g_dbus_message_header_field_reply_serial_low_level)
		end

	is_g_dbus_message_header_field_sender: BOOLEAN is
		do
			Result := (value=g_dbus_message_header_field_sender_low_level)
		end

	is_g_dbus_message_header_field_signature: BOOLEAN is
		do
			Result := (value=g_dbus_message_header_field_signature_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_dbus_message_header_field_destination_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION"
 			}"
 		end

	g_dbus_message_header_field_error_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME"
 			}"
 		end

	g_dbus_message_header_field_interface_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE"
 			}"
 		end

	g_dbus_message_header_field_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_HEADER_FIELD_INVALID"
 			}"
 		end

	g_dbus_message_header_field_member_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_HEADER_FIELD_MEMBER"
 			}"
 		end

	g_dbus_message_header_field_num_unix_fds_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS"
 			}"
 		end

	g_dbus_message_header_field_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_HEADER_FIELD_PATH"
 			}"
 		end

	g_dbus_message_header_field_reply_serial_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL"
 			}"
 		end

	g_dbus_message_header_field_sender_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_HEADER_FIELD_SENDER"
 			}"
 		end

	g_dbus_message_header_field_signature_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE"
 			}"
 		end


end -- class GDBUS_MESSAGE_HEADER_FIELD_ENUM
