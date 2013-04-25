-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GOPTION_ARG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = string_low_level)  or else
				(a_value = int_low_level)  or else
				(a_value = callback_low_level)  or else
				(a_value = filename_low_level)  or else
				(a_value = string_array_low_level)  or else
				(a_value = filename_array_low_level)  or else
				(a_value = double_low_level)  or else
				(a_value = int64_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_string is
		do
			value := string_low_level
		end

	set_int is
		do
			value := int_low_level
		end

	set_callback is
		do
			value := callback_low_level
		end

	set_filename is
		do
			value := filename_low_level
		end

	set_string_array is
		do
			value := string_array_low_level
		end

	set_filename_array is
		do
			value := filename_array_low_level
		end

	set_double is
		do
			value := double_low_level
		end

	set_int64 is
		do
			value := int64_low_level
		end

feature {ANY} -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_string: BOOLEAN is
		do
			Result := (value=string_low_level)
		end

	is_int: BOOLEAN is
		do
			Result := (value=int_low_level)
		end

	is_callback: BOOLEAN is
		do
			Result := (value=callback_low_level)
		end

	is_filename: BOOLEAN is
		do
			Result := (value=filename_low_level)
		end

	is_string_array: BOOLEAN is
		do
			Result := (value=string_array_low_level)
		end

	is_filename_array: BOOLEAN is
		do
			Result := (value=filename_array_low_level)
		end

	is_double: BOOLEAN is
		do
			Result := (value=double_low_level)
		end

	is_int64: BOOLEAN is
		do
			Result := (value=int64_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_NONE"
 			}"
 		end

	string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_STRING"
 			}"
 		end

	int_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_INT"
 			}"
 		end

	callback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_CALLBACK"
 			}"
 		end

	filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_FILENAME"
 			}"
 		end

	string_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_STRING_ARRAY"
 			}"
 		end

	filename_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_FILENAME_ARRAY"
 			}"
 		end

	double_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_DOUBLE"
 			}"
 		end

	int64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ARG_INT64"
 			}"
 		end


end -- class GOPTION_ARG_ENUM
