-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMARKUPCOLLECTTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
	set_g_markup_collect_boolean is
		do
			value := g_markup_collect_boolean_low_level
		end

	set_g_markup_collect_invalid is
		do
			value := g_markup_collect_invalid_low_level
		end

	set_g_markup_collect_optional is
		do
			value := g_markup_collect_optional_low_level
		end

	set_g_markup_collect_strdup is
		do
			value := g_markup_collect_strdup_low_level
		end

	set_g_markup_collect_string is
		do
			value := g_markup_collect_string_low_level
		end

	set_g_markup_collect_tristate is
		do
			value := g_markup_collect_tristate_low_level
		end

feature {ANY} -- Queries
	is_g_markup_collect_boolean: BOOLEAN is
		do
			Result := (value=g_markup_collect_boolean_low_level)
		end

	is_g_markup_collect_invalid: BOOLEAN is
		do
			Result := (value=g_markup_collect_invalid_low_level)
		end

	is_g_markup_collect_optional: BOOLEAN is
		do
			Result := (value=g_markup_collect_optional_low_level)
		end

	is_g_markup_collect_strdup: BOOLEAN is
		do
			Result := (value=g_markup_collect_strdup_low_level)
		end

	is_g_markup_collect_string: BOOLEAN is
		do
			Result := (value=g_markup_collect_string_low_level)
		end

	is_g_markup_collect_tristate: BOOLEAN is
		do
			Result := (value=g_markup_collect_tristate_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_markup_collect_boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_BOOLEAN"
 			}"
 		end

	g_markup_collect_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_INVALID"
 			}"
 		end

	g_markup_collect_optional_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_OPTIONAL"
 			}"
 		end

	g_markup_collect_strdup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_STRDUP"
 			}"
 		end

	g_markup_collect_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_STRING"
 			}"
 		end

	g_markup_collect_tristate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MARKUP_COLLECT_TRISTATE"
 			}"
 		end


end -- class GMARKUPCOLLECTTYPE_ENUM
