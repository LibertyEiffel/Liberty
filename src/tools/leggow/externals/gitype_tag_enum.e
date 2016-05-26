-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GITYPE_TAG_ENUM

-- Wrapper of enum GITypeTag defined in file /usr/include/gobject-introspection-1.0/gitypes.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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
	set_array
               do
                       value := array_low_level
               end

	set_boolean
               do
                       value := boolean_low_level
               end

	set_double
               do
                       value := double_low_level
               end

	set_error
               do
                       value := error_low_level
               end

	set_filename
               do
                       value := filename_low_level
               end

	set_float
               do
                       value := float_low_level
               end

	set_ghash
               do
                       value := ghash_low_level
               end

	set_glist
               do
                       value := glist_low_level
               end

	set_gslist
               do
                       value := gslist_low_level
               end

	set_gtype
               do
                       value := gtype_low_level
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

	set_int8
               do
                       value := int8_low_level
               end

	set_interface
               do
                       value := interface_low_level
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

	set_uint8
               do
                       value := uint8_low_level
               end

	set_unichar
               do
                       value := unichar_low_level
               end

	set_utf8
               do
                       value := utf8_low_level
               end

	set_void
               do
                       value := void_low_level
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

       is_double: BOOLEAN
               do
                       Result := (value=double_low_level)
               end

       is_error: BOOLEAN
               do
                       Result := (value=error_low_level)
               end

       is_filename: BOOLEAN
               do
                       Result := (value=filename_low_level)
               end

       is_float: BOOLEAN
               do
                       Result := (value=float_low_level)
               end

       is_ghash: BOOLEAN
               do
                       Result := (value=ghash_low_level)
               end

       is_glist: BOOLEAN
               do
                       Result := (value=glist_low_level)
               end

       is_gslist: BOOLEAN
               do
                       Result := (value=gslist_low_level)
               end

       is_gtype: BOOLEAN
               do
                       Result := (value=gtype_low_level)
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

       is_int8: BOOLEAN
               do
                       Result := (value=int8_low_level)
               end

       is_interface: BOOLEAN
               do
                       Result := (value=interface_low_level)
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

       is_uint8: BOOLEAN
               do
                       Result := (value=uint8_low_level)
               end

       is_unichar: BOOLEAN
               do
                       Result := (value=unichar_low_level)
               end

       is_utf8: BOOLEAN
               do
                       Result := (value=utf8_low_level)
               end

       is_void: BOOLEAN
               do
                       Result := (value=void_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     array_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_ARRAY"
                       }"
               end

     boolean_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_BOOLEAN"
                       }"
               end

     double_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_DOUBLE"
                       }"
               end

     error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_ERROR"
                       }"
               end

     filename_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_FILENAME"
                       }"
               end

     float_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_FLOAT"
                       }"
               end

     ghash_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_GHASH"
                       }"
               end

     glist_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_GLIST"
                       }"
               end

     gslist_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_GSLIST"
                       }"
               end

     gtype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_GTYPE"
                       }"
               end

     int16_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_INT16"
                       }"
               end

     int32_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_INT32"
                       }"
               end

     int64_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_INT64"
                       }"
               end

     int8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_INT8"
                       }"
               end

     interface_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_INTERFACE"
                       }"
               end

     uint16_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_UINT16"
                       }"
               end

     uint32_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_UINT32"
                       }"
               end

     uint64_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_UINT64"
                       }"
               end

     uint8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_UINT8"
                       }"
               end

     unichar_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_UNICHAR"
                       }"
               end

     utf8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_UTF8"
                       }"
               end

     void_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_TYPE_TAG_VOID"
                       }"
               end


end -- class GITYPE_TAG_ENUM
