-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GITYPE_TAG_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = array_low_level)  or else
				(a_value = boolean_low_level)  or else
				(a_value = double_low_level)  or else
				(a_value = error_low_level)  or else
				(a_value = filename_low_level)  or else
				(a_value = float_low_level)  or else
				(a_value = ghash_low_level)  or else
				(a_value = glist_low_level)  or else
				(a_value = gslist_low_level)  or else
				(a_value = gtype_low_level)  or else
				(a_value = int16_low_level)  or else
				(a_value = int32_low_level)  or else
				(a_value = int64_low_level)  or else
				(a_value = int8_low_level)  or else
				(a_value = interface_low_level)  or else
				(a_value = uint16_low_level)  or else
				(a_value = uint32_low_level)  or else
				(a_value = uint64_low_level)  or else
				(a_value = uint8_low_level)  or else
				(a_value = unichar_low_level)  or else
				(a_value = utf8_low_level)  or else
				(a_value = void_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_array is
		do
			value := array_low_level
		end

	set_boolean is
		do
			value := boolean_low_level
		end

	set_double is
		do
			value := double_low_level
		end

	set_error is
		do
			value := error_low_level
		end

	set_filename is
		do
			value := filename_low_level
		end

	set_float is
		do
			value := float_low_level
		end

	set_ghash is
		do
			value := ghash_low_level
		end

	set_glist is
		do
			value := glist_low_level
		end

	set_gslist is
		do
			value := gslist_low_level
		end

	set_gtype is
		do
			value := gtype_low_level
		end

	set_int16 is
		do
			value := int16_low_level
		end

	set_int32 is
		do
			value := int32_low_level
		end

	set_int64 is
		do
			value := int64_low_level
		end

	set_int8 is
		do
			value := int8_low_level
		end

	set_interface is
		do
			value := interface_low_level
		end

	set_uint16 is
		do
			value := uint16_low_level
		end

	set_uint32 is
		do
			value := uint32_low_level
		end

	set_uint64 is
		do
			value := uint64_low_level
		end

	set_uint8 is
		do
			value := uint8_low_level
		end

	set_unichar is
		do
			value := unichar_low_level
		end

	set_utf8 is
		do
			value := utf8_low_level
		end

	set_void is
		do
			value := void_low_level
		end

feature {ANY} -- Queries
	is_array: BOOLEAN is
		do
			Result := (value=array_low_level)
		end

	is_boolean: BOOLEAN is
		do
			Result := (value=boolean_low_level)
		end

	is_double: BOOLEAN is
		do
			Result := (value=double_low_level)
		end

	is_error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

	is_filename: BOOLEAN is
		do
			Result := (value=filename_low_level)
		end

	is_float: BOOLEAN is
		do
			Result := (value=float_low_level)
		end

	is_ghash: BOOLEAN is
		do
			Result := (value=ghash_low_level)
		end

	is_glist: BOOLEAN is
		do
			Result := (value=glist_low_level)
		end

	is_gslist: BOOLEAN is
		do
			Result := (value=gslist_low_level)
		end

	is_gtype: BOOLEAN is
		do
			Result := (value=gtype_low_level)
		end

	is_int16: BOOLEAN is
		do
			Result := (value=int16_low_level)
		end

	is_int32: BOOLEAN is
		do
			Result := (value=int32_low_level)
		end

	is_int64: BOOLEAN is
		do
			Result := (value=int64_low_level)
		end

	is_int8: BOOLEAN is
		do
			Result := (value=int8_low_level)
		end

	is_interface: BOOLEAN is
		do
			Result := (value=interface_low_level)
		end

	is_uint16: BOOLEAN is
		do
			Result := (value=uint16_low_level)
		end

	is_uint32: BOOLEAN is
		do
			Result := (value=uint32_low_level)
		end

	is_uint64: BOOLEAN is
		do
			Result := (value=uint64_low_level)
		end

	is_uint8: BOOLEAN is
		do
			Result := (value=uint8_low_level)
		end

	is_unichar: BOOLEAN is
		do
			Result := (value=unichar_low_level)
		end

	is_utf8: BOOLEAN is
		do
			Result := (value=utf8_low_level)
		end

	is_void: BOOLEAN is
		do
			Result := (value=void_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_ARRAY"
 			}"
 		end

	boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_BOOLEAN"
 			}"
 		end

	double_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_DOUBLE"
 			}"
 		end

	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_ERROR"
 			}"
 		end

	filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_FILENAME"
 			}"
 		end

	float_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_FLOAT"
 			}"
 		end

	ghash_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_GHASH"
 			}"
 		end

	glist_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_GLIST"
 			}"
 		end

	gslist_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_GSLIST"
 			}"
 		end

	gtype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_GTYPE"
 			}"
 		end

	int16_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_INT16"
 			}"
 		end

	int32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_INT32"
 			}"
 		end

	int64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_INT64"
 			}"
 		end

	int8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_INT8"
 			}"
 		end

	interface_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_INTERFACE"
 			}"
 		end

	uint16_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UINT16"
 			}"
 		end

	uint32_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UINT32"
 			}"
 		end

	uint64_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UINT64"
 			}"
 		end

	uint8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UINT8"
 			}"
 		end

	unichar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UNICHAR"
 			}"
 		end

	utf8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_UTF8"
 			}"
 		end

	void_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_TYPE_TAG_VOID"
 			}"
 		end


end -- class GITYPE_TAG_ENUM
