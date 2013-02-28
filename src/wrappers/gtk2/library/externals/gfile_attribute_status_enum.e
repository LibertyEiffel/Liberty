-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_ATTRIBUTE_STATUS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = unset_low_level)  or else
				(a_value = set_low_level)  or else
				(a_value = error_setting_low_level) )
		end

feature -- Setters
	default_create,
	set_unset is
		do
			value := unset_low_level
		end

	set_set is
		do
			value := set_low_level
		end

	set_error_setting is
		do
			value := error_setting_low_level
		end

feature -- Queries
	unset: BOOLEAN is
		do
			Result := (value=unset_low_level)
		end

	set: BOOLEAN is
		do
			Result := (value=set_low_level)
		end

	error_setting: BOOLEAN is
		do
			Result := (value=error_setting_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	unset_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_STATUS_UNSET"
 			}"
 		end

	set_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_STATUS_SET"
 			}"
 		end

	error_setting_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_STATUS_ERROR_SETTING"
 			}"
 		end


end -- class GFILE_ATTRIBUTE_STATUS_ENUM
