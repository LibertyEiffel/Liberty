-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GVARIANT_CLASS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = boolean_low_level)  or else
				(a_value = byte_low_level)  or else
				(a_value = int16_low_level)  or else
				(a_value = uint16_low_level)  or else
				(a_value = int32_low_level)  or else
				(a_value = uint32_low_level)  or else
				(a_value = int64_low_level)  or else
				(a_value = uint64_low_level)  or else
				(a_value = handle_low_level)  or else
				(a_value = double_low_level)  or else
				(a_value = string_low_level)  or else
				(a_value = object_path_low_level)  or else
				(a_value = signature_low_level)  or else
				(a_value = variant_external_low_level)  or else
				(a_value = maybe_low_level)  or else
				(a_value = array_low_level)  or else
				(a_value = tuple_low_level)  or else
				(a_value = dict_entry_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_boolean is
		do
			value := boolean_low_level
		end

	set_byte is
		do
			value := byte_low_level
		end

	set_int16 is
		do
			value := int16_low_level
		end

	set_uint16 is
		do
			value := uint16_low_level
		end

	set_int32 is
		do
			value := int32_low_level
		end

	set_uint32 is
		do
			value := uint32_low_level
		end

	set_int64 is
		do
			value := int64_low_level
		end

	set_uint64 is
		do
			value := uint64_low_level
		end

	set_handle is
		do
			value := handle_low_level
		end

	set_double is
		do
			value := double_low_level
		end

	set_string is
		do
			value := string_low_level
		end

	set_object_path is
		do
			value := object_path_low_level
		end

	set_signature is
		do
			value := signature_low_level
		end

	set_variant_external is
		do
			value := variant_external_low_level
		end

	set_maybe is
		do
			value := maybe_low_level
		end

	set_array is
		do
			value := array_low_level
		end

	set_tuple is
		do
			value := tuple_low_level
		end

	set_dict_entry is
		do
			value := dict_entry_low_level
		end

feature {ANY} -- Queries
	is_boolean: BOOLEAN is
		do
			Result := (value=boolean_low_level)
		end

	is_byte: BOOLEAN is
		do
			Result := (value=byte_low_level)
		end

	is_int16: BOOLEAN is
		do
			Result := (value=int16_low_level)
		end

	is_uint16: BOOLEAN is
		do
			Result := (value=uint16_low_level)
		end

	is_int32: BOOLEAN is
		do
			Result := (value=int32_low_level)
		end

	is_uint32: BOOLEAN is
		do
			Result := (value=uint32_low_level)
		end

	is_int64: BOOLEAN is
		do
			Result := (value=int64_low_level)
		end

	is_uint64: BOOLEAN is
		do
			Result := (value=uint64_low_level)
		end

	is_handle: BOOLEAN is
		do
			Result := (value=handle_low_level)
		end

	is_double: BOOLEAN is
		do
			Result := (value=double_low_level)
		end

	is_string: BOOLEAN is
		do
			Result := (value=string_low_level)
		end

	is_object_path: BOOLEAN is
		do
			Result := (value=object_path_low_level)
		end

	is_signature: BOOLEAN is
		do
			Result := (value=signature_low_level)
		end

	is_variant_external: BOOLEAN is
		do
			Result := (value=variant_external_low_level)
		end

	is_maybe: BOOLEAN is
		do
			Result := (value=maybe_low_level)
		end

	is_array: BOOLEAN is
		do
			Result := (value=array_low_level)
		end

	is_tuple: BOOLEAN is
		do
			Result := (value=tuple_low_level)
		end

	is_dict_entry: BOOLEAN is
		do
			Result := (value=dict_entry_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_BOOLEAN"
 			}"
 		end

	byte_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_BYTE"
 			}"
 		end

	int16_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_INT16"
 			}"
 		end

	uint16_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_UINT16"
 			}"
 		end

	int32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_INT32"
 			}"
 		end

	uint32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_UINT32"
 			}"
 		end

	int64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_INT64"
 			}"
 		end

	uint64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_UINT64"
 			}"
 		end

	handle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_HANDLE"
 			}"
 		end

	double_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_DOUBLE"
 			}"
 		end

	string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_STRING"
 			}"
 		end

	object_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_OBJECT_PATH"
 			}"
 		end

	signature_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_SIGNATURE"
 			}"
 		end

	variant_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_VARIANT"
 			}"
 		end

	maybe_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_MAYBE"
 			}"
 		end

	array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_ARRAY"
 			}"
 		end

	tuple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_TUPLE"
 			}"
 		end

	dict_entry_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_VARIANT_CLASS_DICT_ENTRY"
 			}"
 		end


end -- class GVARIANT_CLASS_ENUM
