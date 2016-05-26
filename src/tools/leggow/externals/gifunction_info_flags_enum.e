-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIFUNCTION_INFO_FLAGS_ENUM

-- Wrapper of enum GIFunctionInfoFlags defined in file /usr/include/gobject-introspection-1.0/gitypes.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (is_constructor_low_level | 
				is_getter_low_level | 
				is_method_low_level | 
				is_setter_low_level | 
				throws_low_level | 
				wraps_vfunc_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_is_constructor
               do
                       value := value.bit_or(is_constructor_low_level)
               end

	unset_is_constructor
               do
                       value := value.bit_xor(is_constructor_low_level)
               end

	set_is_getter
               do
                       value := value.bit_or(is_getter_low_level)
               end

	unset_is_getter
               do
                       value := value.bit_xor(is_getter_low_level)
               end

	set_is_method
               do
                       value := value.bit_or(is_method_low_level)
               end

	unset_is_method
               do
                       value := value.bit_xor(is_method_low_level)
               end

	set_is_setter
               do
                       value := value.bit_or(is_setter_low_level)
               end

	unset_is_setter
               do
                       value := value.bit_xor(is_setter_low_level)
               end

	set_throws
               do
                       value := value.bit_or(throws_low_level)
               end

	unset_throws
               do
                       value := value.bit_xor(throws_low_level)
               end

	set_wraps_vfunc
               do
                       value := value.bit_or(wraps_vfunc_low_level)
               end

	unset_wraps_vfunc
               do
                       value := value.bit_xor(wraps_vfunc_low_level)
               end

feature {ANY} -- Queries
       is_is_constructor: BOOLEAN
               do
                       Result := (value=is_constructor_low_level)
               end

       is_is_getter: BOOLEAN
               do
                       Result := (value=is_getter_low_level)
               end

       is_is_method: BOOLEAN
               do
                       Result := (value=is_method_low_level)
               end

       is_is_setter: BOOLEAN
               do
                       Result := (value=is_setter_low_level)
               end

       is_throws: BOOLEAN
               do
                       Result := (value=throws_low_level)
               end

       is_wraps_vfunc: BOOLEAN
               do
                       Result := (value=wraps_vfunc_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     is_constructor_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_FUNCTION_IS_CONSTRUCTOR"
                       }"
               end

     is_getter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_FUNCTION_IS_GETTER"
                       }"
               end

     is_method_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_FUNCTION_IS_METHOD"
                       }"
               end

     is_setter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_FUNCTION_IS_SETTER"
                       }"
               end

     throws_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_FUNCTION_THROWS"
                       }"
               end

     wraps_vfunc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_FUNCTION_WRAPS_VFUNC"
                       }"
               end


end -- class GIFUNCTION_INFO_FLAGS_ENUM
