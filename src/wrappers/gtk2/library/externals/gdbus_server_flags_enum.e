-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_SERVER_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = run_in_thread_low_level)  or else
				(a_value = authentication_allow_anonymous_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_run_in_thread is
		do
			value := run_in_thread_low_level
		end

	set_authentication_allow_anonymous is
		do
			value := authentication_allow_anonymous_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	run_in_thread: BOOLEAN is
		do
			Result := (value=run_in_thread_low_level)
		end

	authentication_allow_anonymous: BOOLEAN is
		do
			Result := (value=authentication_allow_anonymous_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SERVER_FLAGS_NONE"
 			}"
 		end

	run_in_thread_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SERVER_FLAGS_RUN_IN_THREAD"
 			}"
 		end

	authentication_allow_anonymous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SERVER_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS"
 			}"
 		end


end -- class GDBUS_SERVER_FLAGS_ENUM
