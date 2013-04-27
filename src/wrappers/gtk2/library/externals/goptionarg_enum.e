-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GOPTIONARG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_option_arg_callback_low_level)  or else
				(a_value = g_option_arg_double_low_level)  or else
				(a_value = g_option_arg_filename_low_level)  or else
				(a_value = g_option_arg_filename_array_low_level)  or else
				(a_value = g_option_arg_int_low_level)  or else
				(a_value = g_option_arg_int64_low_level)  or else
				(a_value = g_option_arg_none_low_level)  or else
				(a_value = g_option_arg_string_low_level)  or else
				(a_value = g_option_arg_string_array_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_option_arg_callback is
		do
			value := g_option_arg_callback_low_level
		end

	set_g_option_arg_double is
		do
			value := g_option_arg_double_low_level
		end

	set_g_option_arg_filename is
		do
			value := g_option_arg_filename_low_level
		end

	set_g_option_arg_filename_array is
		do
			value := g_option_arg_filename_array_low_level
		end

	set_g_option_arg_int is
		do
			value := g_option_arg_int_low_level
		end

	set_g_option_arg_int64 is
		do
			value := g_option_arg_int64_low_level
		end

	set_g_option_arg_none is
		do
			value := g_option_arg_none_low_level
		end

	set_g_option_arg_string is
		do
			value := g_option_arg_string_low_level
		end

	set_g_option_arg_string_array is
		do
			value := g_option_arg_string_array_low_level
		end

feature {ANY} -- Queries
	is_g_option_arg_callback: BOOLEAN is
		do
			Result := (value=g_option_arg_callback_low_level)
		end

	is_g_option_arg_double: BOOLEAN is
		do
			Result := (value=g_option_arg_double_low_level)
		end

	is_g_option_arg_filename: BOOLEAN is
		do
			Result := (value=g_option_arg_filename_low_level)
		end

	is_g_option_arg_filename_array: BOOLEAN is
		do
			Result := (value=g_option_arg_filename_array_low_level)
		end

	is_g_option_arg_int: BOOLEAN is
		do
			Result := (value=g_option_arg_int_low_level)
		end

	is_g_option_arg_int64: BOOLEAN is
		do
			Result := (value=g_option_arg_int64_low_level)
		end

	is_g_option_arg_none: BOOLEAN is
		do
			Result := (value=g_option_arg_none_low_level)
		end

	is_g_option_arg_string: BOOLEAN is
		do
			Result := (value=g_option_arg_string_low_level)
		end

	is_g_option_arg_string_array: BOOLEAN is
		do
			Result := (value=g_option_arg_string_array_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_option_arg_callback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_CALLBACK"
 			}"
 		end

	g_option_arg_double_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_DOUBLE"
 			}"
 		end

	g_option_arg_filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_FILENAME"
 			}"
 		end

	g_option_arg_filename_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_FILENAME_ARRAY"
 			}"
 		end

	g_option_arg_int_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_INT"
 			}"
 		end

	g_option_arg_int64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_INT64"
 			}"
 		end

	g_option_arg_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_NONE"
 			}"
 		end

	g_option_arg_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_STRING"
 			}"
 		end

	g_option_arg_string_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_STRING_ARRAY"
 			}"
 		end


end -- class GOPTIONARG_ENUM
