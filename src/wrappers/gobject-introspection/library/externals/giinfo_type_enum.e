-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIINFO_TYPE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
	set_arg is
		do
			value := arg_low_level
		end

	set_boxed is
		do
			value := boxed_low_level
		end

	set_callback is
		do
			value := callback_low_level
		end

	set_constant is
		do
			value := constant_low_level
		end

	set_enum is
		do
			value := enum_low_level
		end

	set_field is
		do
			value := field_low_level
		end

	set_flags is
		do
			value := flags_low_level
		end

	set_function is
		do
			value := function_low_level
		end

	set_interface is
		do
			value := interface_low_level
		end

	set_invalid is
		do
			value := invalid_low_level
		end

	set_invalid_0 is
		do
			value := invalid_0_low_level
		end

	set_object is
		do
			value := object_low_level
		end

	set_property is
		do
			value := property_low_level
		end

	set_signal is
		do
			value := signal_low_level
		end

	set_struct is
		do
			value := struct_low_level
		end

	set_type is
		do
			value := type_low_level
		end

	set_union is
		do
			value := union_low_level
		end

	set_unresolved is
		do
			value := unresolved_low_level
		end

	set_value is
		do
			value := value_low_level
		end

	set_vfunc is
		do
			value := vfunc_low_level
		end

feature {ANY} -- Queries
	is_arg: BOOLEAN is
		do
			Result := (value=arg_low_level)
		end

	is_boxed: BOOLEAN is
		do
			Result := (value=boxed_low_level)
		end

	is_callback: BOOLEAN is
		do
			Result := (value=callback_low_level)
		end

	is_constant: BOOLEAN is
		do
			Result := (value=constant_low_level)
		end

	is_enum: BOOLEAN is
		do
			Result := (value=enum_low_level)
		end

	is_field: BOOLEAN is
		do
			Result := (value=field_low_level)
		end

	is_flags: BOOLEAN is
		do
			Result := (value=flags_low_level)
		end

	is_function: BOOLEAN is
		do
			Result := (value=function_low_level)
		end

	is_interface: BOOLEAN is
		do
			Result := (value=interface_low_level)
		end

	is_invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	is_invalid_0: BOOLEAN is
		do
			Result := (value=invalid_0_low_level)
		end

	is_object: BOOLEAN is
		do
			Result := (value=object_low_level)
		end

	is_property: BOOLEAN is
		do
			Result := (value=property_low_level)
		end

	is_signal: BOOLEAN is
		do
			Result := (value=signal_low_level)
		end

	is_struct: BOOLEAN is
		do
			Result := (value=struct_low_level)
		end

	is_type: BOOLEAN is
		do
			Result := (value=type_low_level)
		end

	is_union: BOOLEAN is
		do
			Result := (value=union_low_level)
		end

	is_unresolved: BOOLEAN is
		do
			Result := (value=unresolved_low_level)
		end

	is_value: BOOLEAN is
		do
			Result := (value=value_low_level)
		end

	is_vfunc: BOOLEAN is
		do
			Result := (value=vfunc_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	arg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_ARG"
 			}"
 		end

	boxed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_BOXED"
 			}"
 		end

	callback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_CALLBACK"
 			}"
 		end

	constant_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_CONSTANT"
 			}"
 		end

	enum_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_ENUM"
 			}"
 		end

	field_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_FIELD"
 			}"
 		end

	flags_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_FLAGS"
 			}"
 		end

	function_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_FUNCTION"
 			}"
 		end

	interface_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_INTERFACE"
 			}"
 		end

	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_INVALID"
 			}"
 		end

	invalid_0_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_INVALID_0"
 			}"
 		end

	object_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_OBJECT"
 			}"
 		end

	property_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_PROPERTY"
 			}"
 		end

	signal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_SIGNAL"
 			}"
 		end

	struct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_STRUCT"
 			}"
 		end

	type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_TYPE"
 			}"
 		end

	union_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_UNION"
 			}"
 		end

	unresolved_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_UNRESOLVED"
 			}"
 		end

	value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_VALUE"
 			}"
 		end

	vfunc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_VFUNC"
 			}"
 		end


end -- class GIINFO_TYPE_ENUM
