-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMARKUP_COLLECT_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_markup_collect_boolean_low_level)  or else
				(a_value = g_markup_collect_invalid_low_level)  or else
				(a_value = g_markup_collect_optional_low_level)  or else
				(a_value = g_markup_collect_strdup_low_level)  or else
				(a_value = g_markup_collect_string_low_level)  or else
				(a_value = g_markup_collect_tristate_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_markup_collect_boolean
		do
			value := g_markup_collect_boolean_low_level
		end

	set_g_markup_collect_invalid
		do
			value := g_markup_collect_invalid_low_level
		end

	set_g_markup_collect_optional
		do
			value := g_markup_collect_optional_low_level
		end

	set_g_markup_collect_strdup
		do
			value := g_markup_collect_strdup_low_level
		end

	set_g_markup_collect_string
		do
			value := g_markup_collect_string_low_level
		end

	set_g_markup_collect_tristate
		do
			value := g_markup_collect_tristate_low_level
		end

feature {ANY} -- Queries
	is_g_markup_collect_boolean: BOOLEAN
		do
			Result := (value=g_markup_collect_boolean_low_level)
		end

	is_g_markup_collect_invalid: BOOLEAN
		do
			Result := (value=g_markup_collect_invalid_low_level)
		end

	is_g_markup_collect_optional: BOOLEAN
		do
			Result := (value=g_markup_collect_optional_low_level)
		end

	is_g_markup_collect_strdup: BOOLEAN
		do
			Result := (value=g_markup_collect_strdup_low_level)
		end

	is_g_markup_collect_string: BOOLEAN
		do
			Result := (value=g_markup_collect_string_low_level)
		end

	is_g_markup_collect_tristate: BOOLEAN
		do
			Result := (value=g_markup_collect_tristate_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_markup_collect_boolean_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_BOOLEAN"
 			}"
 		end

	g_markup_collect_invalid_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_INVALID"
 			}"
 		end

	g_markup_collect_optional_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_OPTIONAL"
 			}"
 		end

	g_markup_collect_strdup_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_STRDUP"
 			}"
 		end

	g_markup_collect_string_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_STRING"
 			}"
 		end

	g_markup_collect_tristate_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_TRISTATE"
 			}"
 		end


end -- class GMARKUP_COLLECT_TYPE_ENUM
