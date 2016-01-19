-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_ATTRIBUTE_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_file_attribute_type_boolean_low_level)  or else
				(a_value = g_file_attribute_type_byte_string_low_level)  or else
				(a_value = g_file_attribute_type_int32_low_level)  or else
				(a_value = g_file_attribute_type_int64_low_level)  or else
				(a_value = g_file_attribute_type_invalid_low_level)  or else
				(a_value = g_file_attribute_type_object_low_level)  or else
				(a_value = g_file_attribute_type_string_low_level)  or else
				(a_value = g_file_attribute_type_stringv_low_level)  or else
				(a_value = g_file_attribute_type_uint32_low_level)  or else
				(a_value = g_file_attribute_type_uint64_low_level) )
		end

feature -- Setters
	default_create,
	set_g_file_attribute_type_boolean is
		do
			value := g_file_attribute_type_boolean_low_level
		end

	set_g_file_attribute_type_byte_string is
		do
			value := g_file_attribute_type_byte_string_low_level
		end

	set_g_file_attribute_type_int32 is
		do
			value := g_file_attribute_type_int32_low_level
		end

	set_g_file_attribute_type_int64 is
		do
			value := g_file_attribute_type_int64_low_level
		end

	set_g_file_attribute_type_invalid is
		do
			value := g_file_attribute_type_invalid_low_level
		end

	set_g_file_attribute_type_object is
		do
			value := g_file_attribute_type_object_low_level
		end

	set_g_file_attribute_type_string is
		do
			value := g_file_attribute_type_string_low_level
		end

	set_g_file_attribute_type_stringv is
		do
			value := g_file_attribute_type_stringv_low_level
		end

	set_g_file_attribute_type_uint32 is
		do
			value := g_file_attribute_type_uint32_low_level
		end

	set_g_file_attribute_type_uint64 is
		do
			value := g_file_attribute_type_uint64_low_level
		end

feature -- Queries
	is_g_file_attribute_type_boolean: BOOLEAN is
		do
			Result := (value=g_file_attribute_type_boolean_low_level)
		end

	is_g_file_attribute_type_byte_string: BOOLEAN is
		do
			Result := (value=g_file_attribute_type_byte_string_low_level)
		end

	is_g_file_attribute_type_int32: BOOLEAN is
		do
			Result := (value=g_file_attribute_type_int32_low_level)
		end

	is_g_file_attribute_type_int64: BOOLEAN is
		do
			Result := (value=g_file_attribute_type_int64_low_level)
		end

	is_g_file_attribute_type_invalid: BOOLEAN is
		do
			Result := (value=g_file_attribute_type_invalid_low_level)
		end

	is_g_file_attribute_type_object: BOOLEAN is
		do
			Result := (value=g_file_attribute_type_object_low_level)
		end

	is_g_file_attribute_type_string: BOOLEAN is
		do
			Result := (value=g_file_attribute_type_string_low_level)
		end

	is_g_file_attribute_type_stringv: BOOLEAN is
		do
			Result := (value=g_file_attribute_type_stringv_low_level)
		end

	is_g_file_attribute_type_uint32: BOOLEAN is
		do
			Result := (value=g_file_attribute_type_uint32_low_level)
		end

	is_g_file_attribute_type_uint64: BOOLEAN is
		do
			Result := (value=g_file_attribute_type_uint64_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_attribute_type_boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_TYPE_BOOLEAN"
 			}"
 		end

	g_file_attribute_type_byte_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_TYPE_BYTE_STRING"
 			}"
 		end

	g_file_attribute_type_int32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_TYPE_INT32"
 			}"
 		end

	g_file_attribute_type_int64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_TYPE_INT64"
 			}"
 		end

	g_file_attribute_type_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_TYPE_INVALID"
 			}"
 		end

	g_file_attribute_type_object_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_TYPE_OBJECT"
 			}"
 		end

	g_file_attribute_type_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_TYPE_STRING"
 			}"
 		end

	g_file_attribute_type_stringv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_TYPE_STRINGV"
 			}"
 		end

	g_file_attribute_type_uint32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_TYPE_UINT32"
 			}"
 		end

	g_file_attribute_type_uint64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ATTRIBUTE_TYPE_UINT64"
 			}"
 		end


end -- class GFILE_ATTRIBUTE_TYPE_ENUM
