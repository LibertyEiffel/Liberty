-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GVARIANT_CLASS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = array_low_level)  or else
				(a_value = boolean_low_level)  or else
				(a_value = byte_low_level)  or else
				(a_value = dict_entry_low_level)  or else
				(a_value = double_low_level)  or else
				(a_value = handle_low_level)  or else
				(a_value = int16_low_level)  or else
				(a_value = int32_low_level)  or else
				(a_value = int64_low_level)  or else
				(a_value = maybe_low_level)  or else
				(a_value = object_path_low_level)  or else
				(a_value = signature_low_level)  or else
				(a_value = string_low_level)  or else
				(a_value = tuple_low_level)  or else
				(a_value = uint16_low_level)  or else
				(a_value = uint32_low_level)  or else
				(a_value = uint64_low_level)  or else
				(a_value = variant_external_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_array
               do
                       value := array_low_level
               end

	set_boolean
               do
                       value := boolean_low_level
               end

	set_byte
               do
                       value := byte_low_level
               end

	set_dict_entry
               do
                       value := dict_entry_low_level
               end

	set_double
               do
                       value := double_low_level
               end

	set_handle
               do
                       value := handle_low_level
               end

	set_int16
               do
                       value := int16_low_level
               end

	set_int32
               do
                       value := int32_low_level
               end

	set_int64
               do
                       value := int64_low_level
               end

	set_maybe
               do
                       value := maybe_low_level
               end

	set_object_path
               do
                       value := object_path_low_level
               end

	set_signature
               do
                       value := signature_low_level
               end

	set_string
               do
                       value := string_low_level
               end

	set_tuple
               do
                       value := tuple_low_level
               end

	set_uint16
               do
                       value := uint16_low_level
               end

	set_uint32
               do
                       value := uint32_low_level
               end

	set_uint64
               do
                       value := uint64_low_level
               end

	set_variant_external
               do
                       value := variant_external_low_level
               end

feature {ANY} -- Queries
       is_array: BOOLEAN
               do
                       Result := (value=array_low_level)
               end

       is_boolean: BOOLEAN
               do
                       Result := (value=boolean_low_level)
               end

       is_byte: BOOLEAN
               do
                       Result := (value=byte_low_level)
               end

       is_dict_entry: BOOLEAN
               do
                       Result := (value=dict_entry_low_level)
               end

       is_double: BOOLEAN
               do
                       Result := (value=double_low_level)
               end

       is_handle: BOOLEAN
               do
                       Result := (value=handle_low_level)
               end

       is_int16: BOOLEAN
               do
                       Result := (value=int16_low_level)
               end

       is_int32: BOOLEAN
               do
                       Result := (value=int32_low_level)
               end

       is_int64: BOOLEAN
               do
                       Result := (value=int64_low_level)
               end

       is_maybe: BOOLEAN
               do
                       Result := (value=maybe_low_level)
               end

       is_object_path: BOOLEAN
               do
                       Result := (value=object_path_low_level)
               end

       is_signature: BOOLEAN
               do
                       Result := (value=signature_low_level)
               end

       is_string: BOOLEAN
               do
                       Result := (value=string_low_level)
               end

       is_tuple: BOOLEAN
               do
                       Result := (value=tuple_low_level)
               end

       is_uint16: BOOLEAN
               do
                       Result := (value=uint16_low_level)
               end

       is_uint32: BOOLEAN
               do
                       Result := (value=uint32_low_level)
               end

       is_uint64: BOOLEAN
               do
                       Result := (value=uint64_low_level)
               end

       is_variant_external: BOOLEAN
               do
                       Result := (value=variant_external_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     array_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_ARRAY"
                       }"
               end

     boolean_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_BOOLEAN"
                       }"
               end

     byte_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_BYTE"
                       }"
               end

     dict_entry_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_DICT_ENTRY"
                       }"
               end

     double_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_DOUBLE"
                       }"
               end

     handle_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_HANDLE"
                       }"
               end

     int16_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_INT16"
                       }"
               end

     int32_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_INT32"
                       }"
               end

     int64_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_INT64"
                       }"
               end

     maybe_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_MAYBE"
                       }"
               end

     object_path_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_OBJECT_PATH"
                       }"
               end

     signature_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_SIGNATURE"
                       }"
               end

     string_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_STRING"
                       }"
               end

     tuple_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_TUPLE"
                       }"
               end

     uint16_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_UINT16"
                       }"
               end

     uint32_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_UINT32"
                       }"
               end

     uint64_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_UINT64"
                       }"
               end

     variant_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_VARIANT_CLASS_VARIANT"
                       }"
               end


end -- class GVARIANT_CLASS_ENUM
