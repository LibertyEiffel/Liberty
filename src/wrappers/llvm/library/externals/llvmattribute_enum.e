-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMATTRIBUTE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (zext_attribute_low_level | 
				no_return_attribute_low_level | 
				in_reg_attribute_low_level | 
				struct_ret_attribute_low_level | 
				no_unwind_attribute_low_level | 
				no_alias_attribute_low_level | 
				by_val_attribute_low_level | 
				nest_attribute_low_level | 
				read_none_attribute_low_level | 
				read_only_attribute_low_level | 
				no_inline_attribute_low_level | 
				always_inline_attribute_low_level | 
				optimize_for_size_attribute_low_level | 
				stack_protect_attribute_low_level | 
				stack_protect_req_attribute_low_level | 
				no_capture_attribute_low_level | 
				no_red_zone_attribute_low_level | 
				no_implicit_float_attribute_low_level | 
				naked_attribute_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_zext_attribute is
		do
			value := value.bit_or(zext_attribute_low_level)
		end

	unset_zext_attribute is
		do
			value := value.bit_xor(zext_attribute_low_level)
		end

	set_no_return_attribute is
		do
			value := value.bit_or(no_return_attribute_low_level)
		end

	unset_no_return_attribute is
		do
			value := value.bit_xor(no_return_attribute_low_level)
		end

	set_in_reg_attribute is
		do
			value := value.bit_or(in_reg_attribute_low_level)
		end

	unset_in_reg_attribute is
		do
			value := value.bit_xor(in_reg_attribute_low_level)
		end

	set_struct_ret_attribute is
		do
			value := value.bit_or(struct_ret_attribute_low_level)
		end

	unset_struct_ret_attribute is
		do
			value := value.bit_xor(struct_ret_attribute_low_level)
		end

	set_no_unwind_attribute is
		do
			value := value.bit_or(no_unwind_attribute_low_level)
		end

	unset_no_unwind_attribute is
		do
			value := value.bit_xor(no_unwind_attribute_low_level)
		end

	set_no_alias_attribute is
		do
			value := value.bit_or(no_alias_attribute_low_level)
		end

	unset_no_alias_attribute is
		do
			value := value.bit_xor(no_alias_attribute_low_level)
		end

	set_by_val_attribute is
		do
			value := value.bit_or(by_val_attribute_low_level)
		end

	unset_by_val_attribute is
		do
			value := value.bit_xor(by_val_attribute_low_level)
		end

	set_nest_attribute is
		do
			value := value.bit_or(nest_attribute_low_level)
		end

	unset_nest_attribute is
		do
			value := value.bit_xor(nest_attribute_low_level)
		end

	set_read_none_attribute is
		do
			value := value.bit_or(read_none_attribute_low_level)
		end

	unset_read_none_attribute is
		do
			value := value.bit_xor(read_none_attribute_low_level)
		end

	set_read_only_attribute is
		do
			value := value.bit_or(read_only_attribute_low_level)
		end

	unset_read_only_attribute is
		do
			value := value.bit_xor(read_only_attribute_low_level)
		end

	set_no_inline_attribute is
		do
			value := value.bit_or(no_inline_attribute_low_level)
		end

	unset_no_inline_attribute is
		do
			value := value.bit_xor(no_inline_attribute_low_level)
		end

	set_always_inline_attribute is
		do
			value := value.bit_or(always_inline_attribute_low_level)
		end

	unset_always_inline_attribute is
		do
			value := value.bit_xor(always_inline_attribute_low_level)
		end

	set_optimize_for_size_attribute is
		do
			value := value.bit_or(optimize_for_size_attribute_low_level)
		end

	unset_optimize_for_size_attribute is
		do
			value := value.bit_xor(optimize_for_size_attribute_low_level)
		end

	set_stack_protect_attribute is
		do
			value := value.bit_or(stack_protect_attribute_low_level)
		end

	unset_stack_protect_attribute is
		do
			value := value.bit_xor(stack_protect_attribute_low_level)
		end

	set_stack_protect_req_attribute is
		do
			value := value.bit_or(stack_protect_req_attribute_low_level)
		end

	unset_stack_protect_req_attribute is
		do
			value := value.bit_xor(stack_protect_req_attribute_low_level)
		end

	set_no_capture_attribute is
		do
			value := value.bit_or(no_capture_attribute_low_level)
		end

	unset_no_capture_attribute is
		do
			value := value.bit_xor(no_capture_attribute_low_level)
		end

	set_no_red_zone_attribute is
		do
			value := value.bit_or(no_red_zone_attribute_low_level)
		end

	unset_no_red_zone_attribute is
		do
			value := value.bit_xor(no_red_zone_attribute_low_level)
		end

	set_no_implicit_float_attribute is
		do
			value := value.bit_or(no_implicit_float_attribute_low_level)
		end

	unset_no_implicit_float_attribute is
		do
			value := value.bit_xor(no_implicit_float_attribute_low_level)
		end

	set_naked_attribute is
		do
			value := value.bit_or(naked_attribute_low_level)
		end

	unset_naked_attribute is
		do
			value := value.bit_xor(naked_attribute_low_level)
		end

feature -- Queries
	is_zext_attribute: BOOLEAN is
		do
			Result := (value=zext_attribute_low_level)
		end

	is_no_return_attribute: BOOLEAN is
		do
			Result := (value=no_return_attribute_low_level)
		end

	is_in_reg_attribute: BOOLEAN is
		do
			Result := (value=in_reg_attribute_low_level)
		end

	is_struct_ret_attribute: BOOLEAN is
		do
			Result := (value=struct_ret_attribute_low_level)
		end

	is_no_unwind_attribute: BOOLEAN is
		do
			Result := (value=no_unwind_attribute_low_level)
		end

	is_no_alias_attribute: BOOLEAN is
		do
			Result := (value=no_alias_attribute_low_level)
		end

	is_by_val_attribute: BOOLEAN is
		do
			Result := (value=by_val_attribute_low_level)
		end

	is_nest_attribute: BOOLEAN is
		do
			Result := (value=nest_attribute_low_level)
		end

	is_read_none_attribute: BOOLEAN is
		do
			Result := (value=read_none_attribute_low_level)
		end

	is_read_only_attribute: BOOLEAN is
		do
			Result := (value=read_only_attribute_low_level)
		end

	is_no_inline_attribute: BOOLEAN is
		do
			Result := (value=no_inline_attribute_low_level)
		end

	is_always_inline_attribute: BOOLEAN is
		do
			Result := (value=always_inline_attribute_low_level)
		end

	is_optimize_for_size_attribute: BOOLEAN is
		do
			Result := (value=optimize_for_size_attribute_low_level)
		end

	is_stack_protect_attribute: BOOLEAN is
		do
			Result := (value=stack_protect_attribute_low_level)
		end

	is_stack_protect_req_attribute: BOOLEAN is
		do
			Result := (value=stack_protect_req_attribute_low_level)
		end

	is_no_capture_attribute: BOOLEAN is
		do
			Result := (value=no_capture_attribute_low_level)
		end

	is_no_red_zone_attribute: BOOLEAN is
		do
			Result := (value=no_red_zone_attribute_low_level)
		end

	is_no_implicit_float_attribute: BOOLEAN is
		do
			Result := (value=no_implicit_float_attribute_low_level)
		end

	is_naked_attribute: BOOLEAN is
		do
			Result := (value=naked_attribute_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	zext_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMZExtAttribute"
 			}"
 		end

	no_return_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoReturnAttribute"
 			}"
 		end

	in_reg_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMInRegAttribute"
 			}"
 		end

	struct_ret_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMStructRetAttribute"
 			}"
 		end

	no_unwind_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoUnwindAttribute"
 			}"
 		end

	no_alias_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoAliasAttribute"
 			}"
 		end

	by_val_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMByValAttribute"
 			}"
 		end

	nest_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNestAttribute"
 			}"
 		end

	read_none_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMReadNoneAttribute"
 			}"
 		end

	read_only_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMReadOnlyAttribute"
 			}"
 		end

	no_inline_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoInlineAttribute"
 			}"
 		end

	always_inline_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMAlwaysInlineAttribute"
 			}"
 		end

	optimize_for_size_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMOptimizeForSizeAttribute"
 			}"
 		end

	stack_protect_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMStackProtectAttribute"
 			}"
 		end

	stack_protect_req_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMStackProtectReqAttribute"
 			}"
 		end

	no_capture_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoCaptureAttribute"
 			}"
 		end

	no_red_zone_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoRedZoneAttribute"
 			}"
 		end

	no_implicit_float_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoImplicitFloatAttribute"
 			}"
 		end

	naked_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNakedAttribute"
 			}"
 		end


end -- class LLVMATTRIBUTE_ENUM
