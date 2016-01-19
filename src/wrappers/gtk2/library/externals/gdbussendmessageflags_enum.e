-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUSSENDMESSAGEFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_dbus_send_message_flags_none_low_level)  or else
				(a_value = g_dbus_send_message_flags_preserve_serial_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_dbus_send_message_flags_none is
		do
			value := g_dbus_send_message_flags_none_low_level
		end

	set_g_dbus_send_message_flags_preserve_serial is
		do
			value := g_dbus_send_message_flags_preserve_serial_low_level
		end

feature {ANY} -- Queries
	is_g_dbus_send_message_flags_none: BOOLEAN is
		do
			Result := (value=g_dbus_send_message_flags_none_low_level)
		end

	is_g_dbus_send_message_flags_preserve_serial: BOOLEAN is
		do
			Result := (value=g_dbus_send_message_flags_preserve_serial_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_dbus_send_message_flags_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SEND_MESSAGE_FLAGS_NONE"
 			}"
 		end

	g_dbus_send_message_flags_preserve_serial_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL"
 			}"
 		end


end -- class GDBUSSENDMESSAGEFLAGS_ENUM
