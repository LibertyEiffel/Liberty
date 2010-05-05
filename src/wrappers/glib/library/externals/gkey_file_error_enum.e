-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GKEY_FILE_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = unknown__encoding_low_level)  or else
				(a_value = not__found_low_level)  or else
				(a_value = key__not__found_low_level)  or else
				(a_value = group__not__found_low_level)  or else
				(a_value = invalid__value_low_level) )
		end

feature -- Setters
	default_create,
	set_unknown__encoding is
		do
			value := unknown__encoding_low_level
		end

	set_not__found is
		do
			value := not__found_low_level
		end

	set_key__not__found is
		do
			value := key__not__found_low_level
		end

	set_group__not__found is
		do
			value := group__not__found_low_level
		end

	set_invalid__value is
		do
			value := invalid__value_low_level
		end

feature -- Queries
	is_unknown__encoding: BOOLEAN is
		do
			Result := (value=unknown__encoding_low_level)
		end

	is_not__found: BOOLEAN is
		do
			Result := (value=not__found_low_level)
		end

	is_key__not__found: BOOLEAN is
		do
			Result := (value=key__not__found_low_level)
		end

	is_group__not__found: BOOLEAN is
		do
			Result := (value=group__not__found_low_level)
		end

	is_invalid__value: BOOLEAN is
		do
			Result := (value=invalid__value_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	unknown__encoding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_UNKNOWN_ENCODING"
 			}"
 		end

	not__found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_NOT_FOUND"
 			}"
 		end

	key__not__found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_KEY_NOT_FOUND"
 			}"
 		end

	group__not__found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_GROUP_NOT_FOUND"
 			}"
 		end

	invalid__value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_KEY_FILE_ERROR_INVALID_VALUE"
 			}"
 		end


end -- class GKEY_FILE_ERROR_ENUM
