-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSETTINGS_BIND_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = default_external_low_level)  or else
				(a_value = get_low_level)  or else
				(a_value = set_low_level)  or else
				(a_value = no_sensitivity_low_level)  or else
				(a_value = get_no_changes_low_level)  or else
				(a_value = invert_boolean_low_level) )
		end

feature -- Setters
	default_create,
	set_default_external is
		do
			value := default_external_low_level
		end

	set_get is
		do
			value := get_low_level
		end

	set_set is
		do
			value := set_low_level
		end

	set_no_sensitivity is
		do
			value := no_sensitivity_low_level
		end

	set_get_no_changes is
		do
			value := get_no_changes_low_level
		end

	set_invert_boolean is
		do
			value := invert_boolean_low_level
		end

feature -- Queries
	default_external: BOOLEAN is
		do
			Result := (value=default_external_low_level)
		end

	get: BOOLEAN is
		do
			Result := (value=get_low_level)
		end

	set: BOOLEAN is
		do
			Result := (value=set_low_level)
		end

	no_sensitivity: BOOLEAN is
		do
			Result := (value=no_sensitivity_low_level)
		end

	get_no_changes: BOOLEAN is
		do
			Result := (value=get_no_changes_low_level)
		end

	invert_boolean: BOOLEAN is
		do
			Result := (value=invert_boolean_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	default_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_DEFAULT"
 			}"
 		end

	get_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_GET"
 			}"
 		end

	set_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_SET"
 			}"
 		end

	no_sensitivity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_NO_SENSITIVITY"
 			}"
 		end

	get_no_changes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_GET_NO_CHANGES"
 			}"
 		end

	invert_boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SETTINGS_BIND_INVERT_BOOLEAN"
 			}"
 		end


end -- class GSETTINGS_BIND_FLAGS_ENUM
