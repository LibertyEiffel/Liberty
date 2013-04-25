-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMARKUP_COLLECT_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = string_low_level)  or else
				(a_value = strdup_low_level)  or else
				(a_value = boolean_low_level)  or else
				(a_value = tristate_low_level)  or else
				(a_value = optional_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_string is
		do
			value := string_low_level
		end

	set_strdup is
		do
			value := strdup_low_level
		end

	set_boolean is
		do
			value := boolean_low_level
		end

	set_tristate is
		do
			value := tristate_low_level
		end

	set_optional is
		do
			value := optional_low_level
		end

feature {ANY} -- Queries
	is_invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	is_string: BOOLEAN is
		do
			Result := (value=string_low_level)
		end

	is_strdup: BOOLEAN is
		do
			Result := (value=strdup_low_level)
		end

	is_boolean: BOOLEAN is
		do
			Result := (value=boolean_low_level)
		end

	is_tristate: BOOLEAN is
		do
			Result := (value=tristate_low_level)
		end

	is_optional: BOOLEAN is
		do
			Result := (value=optional_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_INVALID"
 			}"
 		end

	string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_STRING"
 			}"
 		end

	strdup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_STRDUP"
 			}"
 		end

	boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_BOOLEAN"
 			}"
 		end

	tristate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_TRISTATE"
 			}"
 		end

	optional_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_OPTIONAL"
 			}"
 		end


end -- class GMARKUP_COLLECT_TYPE_ENUM
