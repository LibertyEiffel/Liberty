-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDRIVE_START_STOP_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = unknown_low_level)  or else
				(a_value = shutdown_low_level)  or else
				(a_value = network_low_level)  or else
				(a_value = multidisk_low_level)  or else
				(a_value = password_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_unknown is
		do
			value := unknown_low_level
		end

	set_shutdown is
		do
			value := shutdown_low_level
		end

	set_network is
		do
			value := network_low_level
		end

	set_multidisk is
		do
			value := multidisk_low_level
		end

	set_password is
		do
			value := password_low_level
		end

feature {ANY} -- Queries
	unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

	shutdown: BOOLEAN is
		do
			Result := (value=shutdown_low_level)
		end

	network: BOOLEAN is
		do
			Result := (value=network_low_level)
		end

	multidisk: BOOLEAN is
		do
			Result := (value=multidisk_low_level)
		end

	password: BOOLEAN is
		do
			Result := (value=password_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DRIVE_START_STOP_TYPE_UNKNOWN"
 			}"
 		end

	shutdown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DRIVE_START_STOP_TYPE_SHUTDOWN"
 			}"
 		end

	network_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DRIVE_START_STOP_TYPE_NETWORK"
 			}"
 		end

	multidisk_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DRIVE_START_STOP_TYPE_MULTIDISK"
 			}"
 		end

	password_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DRIVE_START_STOP_TYPE_PASSWORD"
 			}"
 		end


end -- class GDRIVE_START_STOP_TYPE_ENUM
