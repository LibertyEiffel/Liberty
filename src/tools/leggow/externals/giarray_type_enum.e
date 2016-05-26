-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIARRAY_TYPE_ENUM

-- Wrapper of enum GIArrayType defined in file /usr/include/gobject-introspection-1.0/gitypes.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = array_low_level)  or else
				(a_value = byte_array_low_level)  or else
				(a_value = c_low_level)  or else
				(a_value = ptr_array_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_array
               do
                       value := array_low_level
               end

	set_byte_array
               do
                       value := byte_array_low_level
               end

	set_c
               do
                       value := c_low_level
               end

	set_ptr_array
               do
                       value := ptr_array_low_level
               end

feature {ANY} -- Queries
       is_array: BOOLEAN
               do
                       Result := (value=array_low_level)
               end

       is_byte_array: BOOLEAN
               do
                       Result := (value=byte_array_low_level)
               end

       is_c: BOOLEAN
               do
                       Result := (value=c_low_level)
               end

       is_ptr_array: BOOLEAN
               do
                       Result := (value=ptr_array_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     array_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_ARRAY_TYPE_ARRAY"
                       }"
               end

     byte_array_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_ARRAY_TYPE_BYTE_ARRAY"
                       }"
               end

     c_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_ARRAY_TYPE_C"
                       }"
               end

     ptr_array_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_ARRAY_TYPE_PTR_ARRAY"
                       }"
               end


end -- class GIARRAY_TYPE_ENUM
