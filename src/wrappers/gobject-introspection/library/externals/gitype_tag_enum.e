-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GITYPE_TAG_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gi_type_tag_array_low_level)  or else
				(a_value = gi_type_tag_boolean_low_level)  or else
				(a_value = gi_type_tag_double_low_level)  or else
				(a_value = gi_type_tag_error_low_level)  or else
				(a_value = gi_type_tag_filename_low_level)  or else
				(a_value = gi_type_tag_float_low_level)  or else
				(a_value = gi_type_tag_ghash_low_level)  or else
				(a_value = gi_type_tag_glist_low_level)  or else
				(a_value = gi_type_tag_gslist_low_level)  or else
				(a_value = gi_type_tag_gtype_low_level)  or else
				(a_value = gi_type_tag_int16_low_level)  or else
				(a_value = gi_type_tag_int32_low_level)  or else
				(a_value = gi_type_tag_int64_low_level)  or else
				(a_value = gi_type_tag_int8_low_level)  or else
				(a_value = gi_type_tag_interface_low_level)  or else
				(a_value = gi_type_tag_uint16_low_level)  or else
				(a_value = gi_type_tag_uint32_low_level)  or else
				(a_value = gi_type_tag_uint64_low_level)  or else
				(a_value = gi_type_tag_uint8_low_level)  or else
				(a_value = gi_type_tag_unichar_low_level)  or else
				(a_value = gi_type_tag_utf8_low_level)  or else
				(a_value = gi_type_tag_void_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gi_type_tag_array is
		do
			value := gi_type_tag_array_low_level
		end

	set_gi_type_tag_boolean is
		do
			value := gi_type_tag_boolean_low_level
		end

	set_gi_type_tag_double is
		do
			value := gi_type_tag_double_low_level
		end

	set_gi_type_tag_error is
		do
			value := gi_type_tag_error_low_level
		end

	set_gi_type_tag_filename is
		do
			value := gi_type_tag_filename_low_level
		end

	set_gi_type_tag_float is
		do
			value := gi_type_tag_float_low_level
		end

	set_gi_type_tag_ghash is
		do
			value := gi_type_tag_ghash_low_level
		end

	set_gi_type_tag_glist is
		do
			value := gi_type_tag_glist_low_level
		end

	set_gi_type_tag_gslist is
		do
			value := gi_type_tag_gslist_low_level
		end

	set_gi_type_tag_gtype is
		do
			value := gi_type_tag_gtype_low_level
		end

	set_gi_type_tag_int16 is
		do
			value := gi_type_tag_int16_low_level
		end

	set_gi_type_tag_int32 is
		do
			value := gi_type_tag_int32_low_level
		end

	set_gi_type_tag_int64 is
		do
			value := gi_type_tag_int64_low_level
		end

	set_gi_type_tag_int8 is
		do
			value := gi_type_tag_int8_low_level
		end

	set_gi_type_tag_interface is
		do
			value := gi_type_tag_interface_low_level
		end

	set_gi_type_tag_uint16 is
		do
			value := gi_type_tag_uint16_low_level
		end

	set_gi_type_tag_uint32 is
		do
			value := gi_type_tag_uint32_low_level
		end

	set_gi_type_tag_uint64 is
		do
			value := gi_type_tag_uint64_low_level
		end

	set_gi_type_tag_uint8 is
		do
			value := gi_type_tag_uint8_low_level
		end

	set_gi_type_tag_unichar is
		do
			value := gi_type_tag_unichar_low_level
		end

	set_gi_type_tag_utf8 is
		do
			value := gi_type_tag_utf8_low_level
		end

	set_gi_type_tag_void is
		do
			value := gi_type_tag_void_low_level
		end

feature {ANY} -- Queries
	is_gi_type_tag_array: BOOLEAN is
		do
			Result := (value=gi_type_tag_array_low_level)
		end

	is_gi_type_tag_boolean: BOOLEAN is
		do
			Result := (value=gi_type_tag_boolean_low_level)
		end

	is_gi_type_tag_double: BOOLEAN is
		do
			Result := (value=gi_type_tag_double_low_level)
		end

	is_gi_type_tag_error: BOOLEAN is
		do
			Result := (value=gi_type_tag_error_low_level)
		end

	is_gi_type_tag_filename: BOOLEAN is
		do
			Result := (value=gi_type_tag_filename_low_level)
		end

	is_gi_type_tag_float: BOOLEAN is
		do
			Result := (value=gi_type_tag_float_low_level)
		end

	is_gi_type_tag_ghash: BOOLEAN is
		do
			Result := (value=gi_type_tag_ghash_low_level)
		end

	is_gi_type_tag_glist: BOOLEAN is
		do
			Result := (value=gi_type_tag_glist_low_level)
		end

	is_gi_type_tag_gslist: BOOLEAN is
		do
			Result := (value=gi_type_tag_gslist_low_level)
		end

	is_gi_type_tag_gtype: BOOLEAN is
		do
			Result := (value=gi_type_tag_gtype_low_level)
		end

	is_gi_type_tag_int16: BOOLEAN is
		do
			Result := (value=gi_type_tag_int16_low_level)
		end

	is_gi_type_tag_int32: BOOLEAN is
		do
			Result := (value=gi_type_tag_int32_low_level)
		end

	is_gi_type_tag_int64: BOOLEAN is
		do
			Result := (value=gi_type_tag_int64_low_level)
		end

	is_gi_type_tag_int8: BOOLEAN is
		do
			Result := (value=gi_type_tag_int8_low_level)
		end

	is_gi_type_tag_interface: BOOLEAN is
		do
			Result := (value=gi_type_tag_interface_low_level)
		end

	is_gi_type_tag_uint16: BOOLEAN is
		do
			Result := (value=gi_type_tag_uint16_low_level)
		end

	is_gi_type_tag_uint32: BOOLEAN is
		do
			Result := (value=gi_type_tag_uint32_low_level)
		end

	is_gi_type_tag_uint64: BOOLEAN is
		do
			Result := (value=gi_type_tag_uint64_low_level)
		end

	is_gi_type_tag_uint8: BOOLEAN is
		do
			Result := (value=gi_type_tag_uint8_low_level)
		end

	is_gi_type_tag_unichar: BOOLEAN is
		do
			Result := (value=gi_type_tag_unichar_low_level)
		end

	is_gi_type_tag_utf8: BOOLEAN is
		do
			Result := (value=gi_type_tag_utf8_low_level)
		end

	is_gi_type_tag_void: BOOLEAN is
		do
			Result := (value=gi_type_tag_void_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gi_type_tag_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_ARRAY"
 			}"
 		end

	gi_type_tag_boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_BOOLEAN"
 			}"
 		end

	gi_type_tag_double_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_DOUBLE"
 			}"
 		end

	gi_type_tag_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_ERROR"
 			}"
 		end

	gi_type_tag_filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_FILENAME"
 			}"
 		end

	gi_type_tag_float_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_FLOAT"
 			}"
 		end

	gi_type_tag_ghash_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_GHASH"
 			}"
 		end

	gi_type_tag_glist_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_GLIST"
 			}"
 		end

	gi_type_tag_gslist_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_GSLIST"
 			}"
 		end

	gi_type_tag_gtype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_GTYPE"
 			}"
 		end

	gi_type_tag_int16_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_INT16"
 			}"
 		end

	gi_type_tag_int32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_INT32"
 			}"
 		end

	gi_type_tag_int64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_INT64"
 			}"
 		end

	gi_type_tag_int8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_INT8"
 			}"
 		end

	gi_type_tag_interface_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_INTERFACE"
 			}"
 		end

	gi_type_tag_uint16_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UINT16"
 			}"
 		end

	gi_type_tag_uint32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UINT32"
 			}"
 		end

	gi_type_tag_uint64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UINT64"
 			}"
 		end

	gi_type_tag_uint8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UINT8"
 			}"
 		end

	gi_type_tag_unichar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UNICHAR"
 			}"
 		end

	gi_type_tag_utf8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UTF8"
 			}"
 		end

	gi_type_tag_void_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_VOID"
 			}"
 		end


end -- class GITYPE_TAG_ENUM
