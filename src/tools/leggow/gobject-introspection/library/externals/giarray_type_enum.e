-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIARRAY_TYPE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = array_low_level)  or else
				(a_value = byte_array_low_level)  or else
				(a_value = c_low_level)  or else
				(a_value = ptr_array_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_array is
		do
			value := array_low_level
		end

	set_byte_array is
		do
			value := byte_array_low_level
		end

	set_c is
		do
			value := c_low_level
		end

	set_ptr_array is
		do
			value := ptr_array_low_level
		end

feature {ANY} -- Queries
	is_array: BOOLEAN is
		do
			Result := (value=array_low_level)
		end

	is_byte_array: BOOLEAN is
		do
			Result := (value=byte_array_low_level)
		end

	is_c: BOOLEAN is
		do
			Result := (value=c_low_level)
		end

	is_ptr_array: BOOLEAN is
		do
			Result := (value=ptr_array_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_ARRAY_TYPE_ARRAY"
 			}"
 		end

	byte_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_ARRAY_TYPE_BYTE_ARRAY"
 			}"
 		end

	c_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_ARRAY_TYPE_C"
 			}"
 		end

	ptr_array_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_ARRAY_TYPE_PTR_ARRAY"
 			}"
 		end


end -- class GIARRAY_TYPE_ENUM
