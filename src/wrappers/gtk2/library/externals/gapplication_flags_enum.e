-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GAPPLICATION_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_application_flags_none_low_level)  or else
				(a_value = g_application_handles_command_line_low_level)  or else
				(a_value = g_application_handles_open_low_level)  or else
				(a_value = g_application_is_launcher_low_level)  or else
				(a_value = g_application_is_service_low_level)  or else
				(a_value = g_application_non_unique_low_level)  or else
				(a_value = g_application_send_environment_low_level) )
		end

feature -- Setters
	default_create,
	set_g_application_flags_none is
		do
			value := g_application_flags_none_low_level
		end

	set_g_application_handles_command_line is
		do
			value := g_application_handles_command_line_low_level
		end

	set_g_application_handles_open is
		do
			value := g_application_handles_open_low_level
		end

	set_g_application_is_launcher is
		do
			value := g_application_is_launcher_low_level
		end

	set_g_application_is_service is
		do
			value := g_application_is_service_low_level
		end

	set_g_application_non_unique is
		do
			value := g_application_non_unique_low_level
		end

	set_g_application_send_environment is
		do
			value := g_application_send_environment_low_level
		end

feature -- Queries
	is_g_application_flags_none: BOOLEAN is
		do
			Result := (value=g_application_flags_none_low_level)
		end

	is_g_application_handles_command_line: BOOLEAN is
		do
			Result := (value=g_application_handles_command_line_low_level)
		end

	is_g_application_handles_open: BOOLEAN is
		do
			Result := (value=g_application_handles_open_low_level)
		end

	is_g_application_is_launcher: BOOLEAN is
		do
			Result := (value=g_application_is_launcher_low_level)
		end

	is_g_application_is_service: BOOLEAN is
		do
			Result := (value=g_application_is_service_low_level)
		end

	is_g_application_non_unique: BOOLEAN is
		do
			Result := (value=g_application_non_unique_low_level)
		end

	is_g_application_send_environment: BOOLEAN is
		do
			Result := (value=g_application_send_environment_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_application_flags_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APPLICATION_FLAGS_NONE"
 			}"
 		end

	g_application_handles_command_line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APPLICATION_HANDLES_COMMAND_LINE"
 			}"
 		end

	g_application_handles_open_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APPLICATION_HANDLES_OPEN"
 			}"
 		end

	g_application_is_launcher_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APPLICATION_IS_LAUNCHER"
 			}"
 		end

	g_application_is_service_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APPLICATION_IS_SERVICE"
 			}"
 		end

	g_application_non_unique_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APPLICATION_NON_UNIQUE"
 			}"
 		end

	g_application_send_environment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_APPLICATION_SEND_ENVIRONMENT"
 			}"
 		end


end -- class GAPPLICATION_FLAGS_ENUM
