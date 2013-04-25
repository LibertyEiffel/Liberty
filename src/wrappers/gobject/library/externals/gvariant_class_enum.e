-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GVARIANT_CLASS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_variant_class_array_low_level)  or else
				(a_value = g_variant_class_boolean_low_level)  or else
				(a_value = g_variant_class_byte_low_level)  or else
				(a_value = g_variant_class_dict_entry_low_level)  or else
				(a_value = g_variant_class_double_low_level)  or else
				(a_value = g_variant_class_handle_low_level)  or else
				(a_value = g_variant_class_int16_low_level)  or else
				(a_value = g_variant_class_int32_low_level)  or else
				(a_value = g_variant_class_int64_low_level)  or else
				(a_value = g_variant_class_maybe_low_level)  or else
				(a_value = g_variant_class_object_path_low_level)  or else
				(a_value = g_variant_class_signature_low_level)  or else
				(a_value = g_variant_class_string_low_level)  or else
				(a_value = g_variant_class_tuple_low_level)  or else
				(a_value = g_variant_class_uint16_low_level)  or else
				(a_value = g_variant_class_uint32_low_level)  or else
				(a_value = g_variant_class_uint64_low_level)  or else
				(a_value = g_variant_class_variant_low_level) )
		end

feature -- Setters
	default_create,
	set_g_variant_class_array is
		do
			value := g_variant_class_array_low_level
		end

	set_g_variant_class_boolean is
		do
			value := g_variant_class_boolean_low_level
		end

	set_g_variant_class_byte is
		do
			value := g_variant_class_byte_low_level
		end

	set_g_variant_class_dict_entry is
		do
			value := g_variant_class_dict_entry_low_level
		end

	set_g_variant_class_double is
		do
			value := g_variant_class_double_low_level
		end

	set_g_variant_class_handle is
		do
			value := g_variant_class_handle_low_level
		end

	set_g_variant_class_int16 is
		do
			value := g_variant_class_int16_low_level
		end

	set_g_variant_class_int32 is
		do
			value := g_variant_class_int32_low_level
		end

	set_g_variant_class_int64 is
		do
			value := g_variant_class_int64_low_level
		end

	set_g_variant_class_maybe is
		do
			value := g_variant_class_maybe_low_level
		end

	set_g_variant_class_object_path is
		do
			value := g_variant_class_object_path_low_level
		end

	set_g_variant_class_signature is
		do
			value := g_variant_class_signature_low_level
		end

	set_g_variant_class_string is
		do
			value := g_variant_class_string_low_level
		end

	set_g_variant_class_tuple is
		do
			value := g_variant_class_tuple_low_level
		end

	set_g_variant_class_uint16 is
		do
			value := g_variant_class_uint16_low_level
		end

	set_g_variant_class_uint32 is
		do
			value := g_variant_class_uint32_low_level
		end

	set_g_variant_class_uint64 is
		do
			value := g_variant_class_uint64_low_level
		end

	set_g_variant_class_variant is
		do
			value := g_variant_class_variant_low_level
		end

feature -- Queries
	is_g_variant_class_array: BOOLEAN is
		do
			Result := (value=g_variant_class_array_low_level)
		end

	is_g_variant_class_boolean: BOOLEAN is
		do
			Result := (value=g_variant_class_boolean_low_level)
		end

	is_g_variant_class_byte: BOOLEAN is
		do
			Result := (value=g_variant_class_byte_low_level)
		end

	is_g_variant_class_dict_entry: BOOLEAN is
		do
			Result := (value=g_variant_class_dict_entry_low_level)
		end

	is_g_variant_class_double: BOOLEAN is
		do
			Result := (value=g_variant_class_double_low_level)
		end

	is_g_variant_class_handle: BOOLEAN is
		do
			Result := (value=g_variant_class_handle_low_level)
		end

	is_g_variant_class_int16: BOOLEAN is
		do
			Result := (value=g_variant_class_int16_low_level)
		end

	is_g_variant_class_int32: BOOLEAN is
		do
			Result := (value=g_variant_class_int32_low_level)
		end

	is_g_variant_class_int64: BOOLEAN is
		do
			Result := (value=g_variant_class_int64_low_level)
		end

	is_g_variant_class_maybe: BOOLEAN is
		do
			Result := (value=g_variant_class_maybe_low_level)
		end

	is_g_variant_class_object_path: BOOLEAN is
		do
			Result := (value=g_variant_class_object_path_low_level)
		end

	is_g_variant_class_signature: BOOLEAN is
		do
			Result := (value=g_variant_class_signature_low_level)
		end

	is_g_variant_class_string: BOOLEAN is
		do
			Result := (value=g_variant_class_string_low_level)
		end

	is_g_variant_class_tuple: BOOLEAN is
		do
			Result := (value=g_variant_class_tuple_low_level)
		end

	is_g_variant_class_uint16: BOOLEAN is
		do
			Result := (value=g_variant_class_uint16_low_level)
		end

	is_g_variant_class_uint32: BOOLEAN is
		do
			Result := (value=g_variant_class_uint32_low_level)
		end

	is_g_variant_class_uint64: BOOLEAN is
		do
			Result := (value=g_variant_class_uint64_low_level)
		end

	is_g_variant_class_variant: BOOLEAN is
		do
			Result := (value=g_variant_class_variant_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_variant_class_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_ARRAY"
 			}"
 		end

	g_variant_class_boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_BOOLEAN"
 			}"
 		end

	g_variant_class_byte_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_BYTE"
 			}"
 		end

	g_variant_class_dict_entry_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_DICT_ENTRY"
 			}"
 		end

	g_variant_class_double_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_DOUBLE"
 			}"
 		end

	g_variant_class_handle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_HANDLE"
 			}"
 		end

	g_variant_class_int16_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_INT16"
 			}"
 		end

	g_variant_class_int32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_INT32"
 			}"
 		end

	g_variant_class_int64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_INT64"
 			}"
 		end

	g_variant_class_maybe_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_MAYBE"
 			}"
 		end

	g_variant_class_object_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_OBJECT_PATH"
 			}"
 		end

	g_variant_class_signature_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_SIGNATURE"
 			}"
 		end

	g_variant_class_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_STRING"
 			}"
 		end

	g_variant_class_tuple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_TUPLE"
 			}"
 		end

	g_variant_class_uint16_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_UINT16"
 			}"
 		end

	g_variant_class_uint32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_UINT32"
 			}"
 		end

	g_variant_class_uint64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_UINT64"
 			}"
 		end

	g_variant_class_variant_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_VARIANT"
 			}"
 		end


end -- class GVARIANT_CLASS_ENUM
