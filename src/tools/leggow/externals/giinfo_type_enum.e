-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIINFO_TYPE_ENUM

-- Wrapper of enum GIInfoType defined in file /usr/include/gobject-introspection-1.0/gitypes.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = arg_low_level)  or else
				(a_value = boxed_low_level)  or else
				(a_value = callback_low_level)  or else
				(a_value = constant_low_level)  or else
				(a_value = enum_low_level)  or else
				(a_value = field_low_level)  or else
				(a_value = flags_low_level)  or else
				(a_value = function_low_level)  or else
				(a_value = interface_low_level)  or else
				(a_value = invalid_low_level)  or else
				(a_value = invalid_0_low_level)  or else
				(a_value = object_low_level)  or else
				(a_value = property_low_level)  or else
				(a_value = signal_low_level)  or else
				(a_value = struct_low_level)  or else
				(a_value = type_low_level)  or else
				(a_value = union_low_level)  or else
				(a_value = unresolved_low_level)  or else
				(a_value = value_low_level)  or else
				(a_value = vfunc_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_arg
               do
                       value := arg_low_level
               end

	set_boxed
               do
                       value := boxed_low_level
               end

	set_callback
               do
                       value := callback_low_level
               end

	set_constant
               do
                       value := constant_low_level
               end

	set_enum
               do
                       value := enum_low_level
               end

	set_field
               do
                       value := field_low_level
               end

	set_flags
               do
                       value := flags_low_level
               end

	set_function
               do
                       value := function_low_level
               end

	set_interface
               do
                       value := interface_low_level
               end

	set_invalid
               do
                       value := invalid_low_level
               end

	set_invalid_0
               do
                       value := invalid_0_low_level
               end

	set_object
               do
                       value := object_low_level
               end

	set_property
               do
                       value := property_low_level
               end

	set_signal
               do
                       value := signal_low_level
               end

	set_struct
               do
                       value := struct_low_level
               end

	set_type
               do
                       value := type_low_level
               end

	set_union
               do
                       value := union_low_level
               end

	set_unresolved
               do
                       value := unresolved_low_level
               end

	set_value
               do
                       value := value_low_level
               end

	set_vfunc
               do
                       value := vfunc_low_level
               end

feature {ANY} -- Queries
       is_arg: BOOLEAN
               do
                       Result := (value=arg_low_level)
               end

       is_boxed: BOOLEAN
               do
                       Result := (value=boxed_low_level)
               end

       is_callback: BOOLEAN
               do
                       Result := (value=callback_low_level)
               end

       is_constant: BOOLEAN
               do
                       Result := (value=constant_low_level)
               end

       is_enum: BOOLEAN
               do
                       Result := (value=enum_low_level)
               end

       is_field: BOOLEAN
               do
                       Result := (value=field_low_level)
               end

       is_flags: BOOLEAN
               do
                       Result := (value=flags_low_level)
               end

       is_function: BOOLEAN
               do
                       Result := (value=function_low_level)
               end

       is_interface: BOOLEAN
               do
                       Result := (value=interface_low_level)
               end

       is_invalid: BOOLEAN
               do
                       Result := (value=invalid_low_level)
               end

       is_invalid_0: BOOLEAN
               do
                       Result := (value=invalid_0_low_level)
               end

       is_object: BOOLEAN
               do
                       Result := (value=object_low_level)
               end

       is_property: BOOLEAN
               do
                       Result := (value=property_low_level)
               end

       is_signal: BOOLEAN
               do
                       Result := (value=signal_low_level)
               end

       is_struct: BOOLEAN
               do
                       Result := (value=struct_low_level)
               end

       is_type: BOOLEAN
               do
                       Result := (value=type_low_level)
               end

       is_union: BOOLEAN
               do
                       Result := (value=union_low_level)
               end

       is_unresolved: BOOLEAN
               do
                       Result := (value=unresolved_low_level)
               end

       is_value: BOOLEAN
               do
                       Result := (value=value_low_level)
               end

       is_vfunc: BOOLEAN
               do
                       Result := (value=vfunc_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     arg_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_ARG"
                       }"
               end

     boxed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_BOXED"
                       }"
               end

     callback_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_CALLBACK"
                       }"
               end

     constant_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_CONSTANT"
                       }"
               end

     enum_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_ENUM"
                       }"
               end

     field_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_FIELD"
                       }"
               end

     flags_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_FLAGS"
                       }"
               end

     function_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_FUNCTION"
                       }"
               end

     interface_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_INTERFACE"
                       }"
               end

     invalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_INVALID"
                       }"
               end

     invalid_0_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_INVALID_0"
                       }"
               end

     object_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_OBJECT"
                       }"
               end

     property_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_PROPERTY"
                       }"
               end

     signal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_SIGNAL"
                       }"
               end

     struct_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_STRUCT"
                       }"
               end

     type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_TYPE"
                       }"
               end

     union_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_UNION"
                       }"
               end

     unresolved_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_UNRESOLVED"
                       }"
               end

     value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_VALUE"
                       }"
               end

     vfunc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_INFO_TYPE_VFUNC"
                       }"
               end


end -- class GIINFO_TYPE_ENUM
