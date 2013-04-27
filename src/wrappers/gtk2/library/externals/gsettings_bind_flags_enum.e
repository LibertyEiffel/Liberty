-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSETTINGS_BIND_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_settings_bind_default_low_level)  or else
				(a_value = g_settings_bind_get_low_level)  or else
				(a_value = g_settings_bind_get_no_changes_low_level)  or else
				(a_value = g_settings_bind_invert_boolean_low_level)  or else
				(a_value = g_settings_bind_no_sensitivity_low_level)  or else
				(a_value = g_settings_bind_set_low_level) )
		end

feature -- Setters
	default_create,
	set_g_settings_bind_default is
		do
			value := g_settings_bind_default_low_level
		end

	set_g_settings_bind_get is
		do
			value := g_settings_bind_get_low_level
		end

	set_g_settings_bind_get_no_changes is
		do
			value := g_settings_bind_get_no_changes_low_level
		end

	set_g_settings_bind_invert_boolean is
		do
			value := g_settings_bind_invert_boolean_low_level
		end

	set_g_settings_bind_no_sensitivity is
		do
			value := g_settings_bind_no_sensitivity_low_level
		end

	set_g_settings_bind_set is
		do
			value := g_settings_bind_set_low_level
		end

feature -- Queries
	is_g_settings_bind_default: BOOLEAN is
		do
			Result := (value=g_settings_bind_default_low_level)
		end

	is_g_settings_bind_get: BOOLEAN is
		do
			Result := (value=g_settings_bind_get_low_level)
		end

	is_g_settings_bind_get_no_changes: BOOLEAN is
		do
			Result := (value=g_settings_bind_get_no_changes_low_level)
		end

	is_g_settings_bind_invert_boolean: BOOLEAN is
		do
			Result := (value=g_settings_bind_invert_boolean_low_level)
		end

	is_g_settings_bind_no_sensitivity: BOOLEAN is
		do
			Result := (value=g_settings_bind_no_sensitivity_low_level)
		end

	is_g_settings_bind_set: BOOLEAN is
		do
			Result := (value=g_settings_bind_set_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_settings_bind_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_DEFAULT"
 			}"
 		end

	g_settings_bind_get_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_GET"
 			}"
 		end

	g_settings_bind_get_no_changes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_GET_NO_CHANGES"
 			}"
 		end

	g_settings_bind_invert_boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_INVERT_BOOLEAN"
 			}"
 		end

	g_settings_bind_no_sensitivity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_NO_SENSITIVITY"
 			}"
 		end

	g_settings_bind_set_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_SET"
 			}"
 		end


end -- class GSETTINGS_BIND_FLAGS_ENUM
