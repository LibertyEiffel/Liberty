-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDRIVESTARTSTOPTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_drive_start_stop_type_multidisk_low_level)  or else
				(a_value = g_drive_start_stop_type_network_low_level)  or else
				(a_value = g_drive_start_stop_type_password_low_level)  or else
				(a_value = g_drive_start_stop_type_shutdown_low_level)  or else
				(a_value = g_drive_start_stop_type_unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_drive_start_stop_type_multidisk is
		do
			value := g_drive_start_stop_type_multidisk_low_level
		end

	set_g_drive_start_stop_type_network is
		do
			value := g_drive_start_stop_type_network_low_level
		end

	set_g_drive_start_stop_type_password is
		do
			value := g_drive_start_stop_type_password_low_level
		end

	set_g_drive_start_stop_type_shutdown is
		do
			value := g_drive_start_stop_type_shutdown_low_level
		end

	set_g_drive_start_stop_type_unknown is
		do
			value := g_drive_start_stop_type_unknown_low_level
		end

feature {ANY} -- Queries
	is_g_drive_start_stop_type_multidisk: BOOLEAN is
		do
			Result := (value=g_drive_start_stop_type_multidisk_low_level)
		end

	is_g_drive_start_stop_type_network: BOOLEAN is
		do
			Result := (value=g_drive_start_stop_type_network_low_level)
		end

	is_g_drive_start_stop_type_password: BOOLEAN is
		do
			Result := (value=g_drive_start_stop_type_password_low_level)
		end

	is_g_drive_start_stop_type_shutdown: BOOLEAN is
		do
			Result := (value=g_drive_start_stop_type_shutdown_low_level)
		end

	is_g_drive_start_stop_type_unknown: BOOLEAN is
		do
			Result := (value=g_drive_start_stop_type_unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_drive_start_stop_type_multidisk_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DRIVE_START_STOP_TYPE_MULTIDISK"
 			}"
 		end

	g_drive_start_stop_type_network_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DRIVE_START_STOP_TYPE_NETWORK"
 			}"
 		end

	g_drive_start_stop_type_password_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DRIVE_START_STOP_TYPE_PASSWORD"
 			}"
 		end

	g_drive_start_stop_type_shutdown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DRIVE_START_STOP_TYPE_SHUTDOWN"
 			}"
 		end

	g_drive_start_stop_type_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DRIVE_START_STOP_TYPE_UNKNOWN"
 			}"
 		end


end -- class GDRIVESTARTSTOPTYPE_ENUM
