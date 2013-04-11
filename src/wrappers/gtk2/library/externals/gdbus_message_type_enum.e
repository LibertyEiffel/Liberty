-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_MESSAGE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = method_call_low_level)  or else
				(a_value = method_return_low_level)  or else
				(a_value = error_low_level)  or else
				(a_value = signal_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_method_call is
		do
			value := method_call_low_level
		end

	set_method_return is
		do
			value := method_return_low_level
		end

	set_error is
		do
			value := error_low_level
		end

	set_signal is
		do
			value := signal_low_level
		end

feature {ANY} -- Queries
	invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	method_call: BOOLEAN is
		do
			Result := (value=method_call_low_level)
		end

	method_return: BOOLEAN is
		do
			Result := (value=method_return_low_level)
		end

	error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

	signal: BOOLEAN is
		do
			Result := (value=signal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_TYPE_INVALID"
 			}"
 		end

	method_call_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_TYPE_METHOD_CALL"
 			}"
 		end

	method_return_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_TYPE_METHOD_RETURN"
 			}"
 		end

	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_TYPE_ERROR"
 			}"
 		end

	signal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_TYPE_SIGNAL"
 			}"
 		end


end -- class GDBUS_MESSAGE_TYPE_ENUM
