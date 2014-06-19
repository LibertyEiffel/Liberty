-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GVARIANT_CLASS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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

feature {ANY} -- Setters
	default_create,
	set_g_variant_class_array
		do
			value := g_variant_class_array_low_level
		end

	set_g_variant_class_boolean
		do
			value := g_variant_class_boolean_low_level
		end

	set_g_variant_class_byte
		do
			value := g_variant_class_byte_low_level
		end

	set_g_variant_class_dict_entry
		do
			value := g_variant_class_dict_entry_low_level
		end

	set_g_variant_class_double
		do
			value := g_variant_class_double_low_level
		end

	set_g_variant_class_handle
		do
			value := g_variant_class_handle_low_level
		end

	set_g_variant_class_int16
		do
			value := g_variant_class_int16_low_level
		end

	set_g_variant_class_int32
		do
			value := g_variant_class_int32_low_level
		end

	set_g_variant_class_int64
		do
			value := g_variant_class_int64_low_level
		end

	set_g_variant_class_maybe
		do
			value := g_variant_class_maybe_low_level
		end

	set_g_variant_class_object_path
		do
			value := g_variant_class_object_path_low_level
		end

	set_g_variant_class_signature
		do
			value := g_variant_class_signature_low_level
		end

	set_g_variant_class_string
		do
			value := g_variant_class_string_low_level
		end

	set_g_variant_class_tuple
		do
			value := g_variant_class_tuple_low_level
		end

	set_g_variant_class_uint16
		do
			value := g_variant_class_uint16_low_level
		end

	set_g_variant_class_uint32
		do
			value := g_variant_class_uint32_low_level
		end

	set_g_variant_class_uint64
		do
			value := g_variant_class_uint64_low_level
		end

	set_g_variant_class_variant
		do
			value := g_variant_class_variant_low_level
		end

feature {ANY} -- Queries
	is_g_variant_class_array: BOOLEAN
		do
			Result := (value=g_variant_class_array_low_level)
		end

	is_g_variant_class_boolean: BOOLEAN
		do
			Result := (value=g_variant_class_boolean_low_level)
		end

	is_g_variant_class_byte: BOOLEAN
		do
			Result := (value=g_variant_class_byte_low_level)
		end

	is_g_variant_class_dict_entry: BOOLEAN
		do
			Result := (value=g_variant_class_dict_entry_low_level)
		end

	is_g_variant_class_double: BOOLEAN
		do
			Result := (value=g_variant_class_double_low_level)
		end

	is_g_variant_class_handle: BOOLEAN
		do
			Result := (value=g_variant_class_handle_low_level)
		end

	is_g_variant_class_int16: BOOLEAN
		do
			Result := (value=g_variant_class_int16_low_level)
		end

	is_g_variant_class_int32: BOOLEAN
		do
			Result := (value=g_variant_class_int32_low_level)
		end

	is_g_variant_class_int64: BOOLEAN
		do
			Result := (value=g_variant_class_int64_low_level)
		end

	is_g_variant_class_maybe: BOOLEAN
		do
			Result := (value=g_variant_class_maybe_low_level)
		end

	is_g_variant_class_object_path: BOOLEAN
		do
			Result := (value=g_variant_class_object_path_low_level)
		end

	is_g_variant_class_signature: BOOLEAN
		do
			Result := (value=g_variant_class_signature_low_level)
		end

	is_g_variant_class_string: BOOLEAN
		do
			Result := (value=g_variant_class_string_low_level)
		end

	is_g_variant_class_tuple: BOOLEAN
		do
			Result := (value=g_variant_class_tuple_low_level)
		end

	is_g_variant_class_uint16: BOOLEAN
		do
			Result := (value=g_variant_class_uint16_low_level)
		end

	is_g_variant_class_uint32: BOOLEAN
		do
			Result := (value=g_variant_class_uint32_low_level)
		end

	is_g_variant_class_uint64: BOOLEAN
		do
			Result := (value=g_variant_class_uint64_low_level)
		end

	is_g_variant_class_variant: BOOLEAN
		do
			Result := (value=g_variant_class_variant_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_variant_class_array_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_ARRAY"
 			}"
 		end

	g_variant_class_boolean_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_BOOLEAN"
 			}"
 		end

	g_variant_class_byte_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_BYTE"
 			}"
 		end

	g_variant_class_dict_entry_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_DICT_ENTRY"
 			}"
 		end

	g_variant_class_double_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_DOUBLE"
 			}"
 		end

	g_variant_class_handle_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_HANDLE"
 			}"
 		end

	g_variant_class_int16_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_INT16"
 			}"
 		end

	g_variant_class_int32_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_INT32"
 			}"
 		end

	g_variant_class_int64_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_INT64"
 			}"
 		end

	g_variant_class_maybe_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_MAYBE"
 			}"
 		end

	g_variant_class_object_path_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_OBJECT_PATH"
 			}"
 		end

	g_variant_class_signature_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_SIGNATURE"
 			}"
 		end

	g_variant_class_string_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_STRING"
 			}"
 		end

	g_variant_class_tuple_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_TUPLE"
 			}"
 		end

	g_variant_class_uint16_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_UINT16"
 			}"
 		end

	g_variant_class_uint32_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_UINT32"
 			}"
 		end

	g_variant_class_uint64_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_UINT64"
 			}"
 		end

	g_variant_class_variant_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_VARIANT"
 			}"
 		end


end -- class GVARIANT_CLASS_ENUM
