-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_MESSAGE_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_dbus_message_type_error_low_level)  or else
				(a_value = g_dbus_message_type_invalid_low_level)  or else
				(a_value = g_dbus_message_type_method_call_low_level)  or else
				(a_value = g_dbus_message_type_method_return_low_level)  or else
				(a_value = g_dbus_message_type_signal_low_level) )
		end

feature -- Setters
	default_create,
	set_g_dbus_message_type_error is
		do
			value := g_dbus_message_type_error_low_level
		end

	set_g_dbus_message_type_invalid is
		do
			value := g_dbus_message_type_invalid_low_level
		end

	set_g_dbus_message_type_method_call is
		do
			value := g_dbus_message_type_method_call_low_level
		end

	set_g_dbus_message_type_method_return is
		do
			value := g_dbus_message_type_method_return_low_level
		end

	set_g_dbus_message_type_signal is
		do
			value := g_dbus_message_type_signal_low_level
		end

feature -- Queries
	is_g_dbus_message_type_error: BOOLEAN is
		do
			Result := (value=g_dbus_message_type_error_low_level)
		end

	is_g_dbus_message_type_invalid: BOOLEAN is
		do
			Result := (value=g_dbus_message_type_invalid_low_level)
		end

	is_g_dbus_message_type_method_call: BOOLEAN is
		do
			Result := (value=g_dbus_message_type_method_call_low_level)
		end

	is_g_dbus_message_type_method_return: BOOLEAN is
		do
			Result := (value=g_dbus_message_type_method_return_low_level)
		end

	is_g_dbus_message_type_signal: BOOLEAN is
		do
			Result := (value=g_dbus_message_type_signal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_dbus_message_type_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_TYPE_ERROR"
 			}"
 		end

	g_dbus_message_type_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_TYPE_INVALID"
 			}"
 		end

	g_dbus_message_type_method_call_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_TYPE_METHOD_CALL"
 			}"
 		end

	g_dbus_message_type_method_return_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_TYPE_METHOD_RETURN"
 			}"
 		end

	g_dbus_message_type_signal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_TYPE_SIGNAL"
 			}"
 		end


end -- class GDBUS_MESSAGE_TYPE_ENUM
