-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_MESSAGE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ne_low_level)  or else
				(a_value = reply_expected_low_level)  or else
				(a_value = auto_start_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_ne is
		do
			value := ne_low_level
		end

	set_reply_expected is
		do
			value := reply_expected_low_level
		end

	set_auto_start is
		do
			value := auto_start_low_level
		end

feature {ANY} -- Queries
	ne: BOOLEAN is
		do
			Result := (value=ne_low_level)
		end

	reply_expected: BOOLEAN is
		do
			Result := (value=reply_expected_low_level)
		end

	auto_start: BOOLEAN is
		do
			Result := (value=auto_start_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ne_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_FLAGS_NONE"
 			}"
 		end

	reply_expected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_FLAGS_NO_REPLY_EXPECTED"
 			}"
 		end

	auto_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_MESSAGE_FLAGS_NO_AUTO_START"
 			}"
 		end


end -- class GDBUS_MESSAGE_FLAGS_ENUM
