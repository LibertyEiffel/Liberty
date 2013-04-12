-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIINFO_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gi_info_type_arg_low_level)  or else
				(a_value = gi_info_type_boxed_low_level)  or else
				(a_value = gi_info_type_callback_low_level)  or else
				(a_value = gi_info_type_constant_low_level)  or else
				(a_value = gi_info_type_enum_low_level)  or else
				(a_value = gi_info_type_field_low_level)  or else
				(a_value = gi_info_type_flags_low_level)  or else
				(a_value = gi_info_type_function_low_level)  or else
				(a_value = gi_info_type_interface_low_level)  or else
				(a_value = gi_info_type_invalid_low_level)  or else
				(a_value = gi_info_type_invalid_0_low_level)  or else
				(a_value = gi_info_type_object_low_level)  or else
				(a_value = gi_info_type_property_low_level)  or else
				(a_value = gi_info_type_signal_low_level)  or else
				(a_value = gi_info_type_struct_low_level)  or else
				(a_value = gi_info_type_type_low_level)  or else
				(a_value = gi_info_type_union_low_level)  or else
				(a_value = gi_info_type_unresolved_low_level)  or else
				(a_value = gi_info_type_value_low_level)  or else
				(a_value = gi_info_type_vfunc_low_level) )
		end

feature -- Setters
	default_create,
	set_gi_info_type_arg is
		do
			value := gi_info_type_arg_low_level
		end

	set_gi_info_type_boxed is
		do
			value := gi_info_type_boxed_low_level
		end

	set_gi_info_type_callback is
		do
			value := gi_info_type_callback_low_level
		end

	set_gi_info_type_constant is
		do
			value := gi_info_type_constant_low_level
		end

	set_gi_info_type_enum is
		do
			value := gi_info_type_enum_low_level
		end

	set_gi_info_type_field is
		do
			value := gi_info_type_field_low_level
		end

	set_gi_info_type_flags is
		do
			value := gi_info_type_flags_low_level
		end

	set_gi_info_type_function is
		do
			value := gi_info_type_function_low_level
		end

	set_gi_info_type_interface is
		do
			value := gi_info_type_interface_low_level
		end

	set_gi_info_type_invalid is
		do
			value := gi_info_type_invalid_low_level
		end

	set_gi_info_type_invalid_0 is
		do
			value := gi_info_type_invalid_0_low_level
		end

	set_gi_info_type_object is
		do
			value := gi_info_type_object_low_level
		end

	set_gi_info_type_property is
		do
			value := gi_info_type_property_low_level
		end

	set_gi_info_type_signal is
		do
			value := gi_info_type_signal_low_level
		end

	set_gi_info_type_struct is
		do
			value := gi_info_type_struct_low_level
		end

	set_gi_info_type_type is
		do
			value := gi_info_type_type_low_level
		end

	set_gi_info_type_union is
		do
			value := gi_info_type_union_low_level
		end

	set_gi_info_type_unresolved is
		do
			value := gi_info_type_unresolved_low_level
		end

	set_gi_info_type_value is
		do
			value := gi_info_type_value_low_level
		end

	set_gi_info_type_vfunc is
		do
			value := gi_info_type_vfunc_low_level
		end

feature -- Queries
	is_gi_info_type_arg: BOOLEAN is
		do
			Result := (value=gi_info_type_arg_low_level)
		end

	is_gi_info_type_boxed: BOOLEAN is
		do
			Result := (value=gi_info_type_boxed_low_level)
		end

	is_gi_info_type_callback: BOOLEAN is
		do
			Result := (value=gi_info_type_callback_low_level)
		end

	is_gi_info_type_constant: BOOLEAN is
		do
			Result := (value=gi_info_type_constant_low_level)
		end

	is_gi_info_type_enum: BOOLEAN is
		do
			Result := (value=gi_info_type_enum_low_level)
		end

	is_gi_info_type_field: BOOLEAN is
		do
			Result := (value=gi_info_type_field_low_level)
		end

	is_gi_info_type_flags: BOOLEAN is
		do
			Result := (value=gi_info_type_flags_low_level)
		end

	is_gi_info_type_function: BOOLEAN is
		do
			Result := (value=gi_info_type_function_low_level)
		end

	is_gi_info_type_interface: BOOLEAN is
		do
			Result := (value=gi_info_type_interface_low_level)
		end

	is_gi_info_type_invalid: BOOLEAN is
		do
			Result := (value=gi_info_type_invalid_low_level)
		end

	is_gi_info_type_invalid_0: BOOLEAN is
		do
			Result := (value=gi_info_type_invalid_0_low_level)
		end

	is_gi_info_type_object: BOOLEAN is
		do
			Result := (value=gi_info_type_object_low_level)
		end

	is_gi_info_type_property: BOOLEAN is
		do
			Result := (value=gi_info_type_property_low_level)
		end

	is_gi_info_type_signal: BOOLEAN is
		do
			Result := (value=gi_info_type_signal_low_level)
		end

	is_gi_info_type_struct: BOOLEAN is
		do
			Result := (value=gi_info_type_struct_low_level)
		end

	is_gi_info_type_type: BOOLEAN is
		do
			Result := (value=gi_info_type_type_low_level)
		end

	is_gi_info_type_union: BOOLEAN is
		do
			Result := (value=gi_info_type_union_low_level)
		end

	is_gi_info_type_unresolved: BOOLEAN is
		do
			Result := (value=gi_info_type_unresolved_low_level)
		end

	is_gi_info_type_value: BOOLEAN is
		do
			Result := (value=gi_info_type_value_low_level)
		end

	is_gi_info_type_vfunc: BOOLEAN is
		do
			Result := (value=gi_info_type_vfunc_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gi_info_type_arg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_ARG"
 			}"
 		end

	gi_info_type_boxed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_BOXED"
 			}"
 		end

	gi_info_type_callback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_CALLBACK"
 			}"
 		end

	gi_info_type_constant_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_CONSTANT"
 			}"
 		end

	gi_info_type_enum_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_ENUM"
 			}"
 		end

	gi_info_type_field_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_FIELD"
 			}"
 		end

	gi_info_type_flags_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_FLAGS"
 			}"
 		end

	gi_info_type_function_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_FUNCTION"
 			}"
 		end

	gi_info_type_interface_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_INTERFACE"
 			}"
 		end

	gi_info_type_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_INVALID"
 			}"
 		end

	gi_info_type_invalid_0_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_INVALID_0"
 			}"
 		end

	gi_info_type_object_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_OBJECT"
 			}"
 		end

	gi_info_type_property_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_PROPERTY"
 			}"
 		end

	gi_info_type_signal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_SIGNAL"
 			}"
 		end

	gi_info_type_struct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_STRUCT"
 			}"
 		end

	gi_info_type_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_TYPE"
 			}"
 		end

	gi_info_type_union_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_UNION"
 			}"
 		end

	gi_info_type_unresolved_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_UNRESOLVED"
 			}"
 		end

	gi_info_type_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_VALUE"
 			}"
 		end

	gi_info_type_vfunc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_INFO_TYPE_VFUNC"
 			}"
 		end


end -- class GIINFO_TYPE_ENUM
