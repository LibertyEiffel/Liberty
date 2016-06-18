-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMATTRIBUTE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = alignment_low_level)  or else
				(a_value = always_inline_attribute_low_level)  or else
				(a_value = by_val_attribute_low_level)  or else
				(a_value = in_reg_attribute_low_level)  or else
				(a_value = inline_hint_attribute_low_level)  or else
				(a_value = naked_attribute_low_level)  or else
				(a_value = nest_attribute_low_level)  or else
				(a_value = no_alias_attribute_low_level)  or else
				(a_value = no_capture_attribute_low_level)  or else
				(a_value = no_implicit_float_attribute_low_level)  or else
				(a_value = no_inline_attribute_low_level)  or else
				(a_value = no_red_zone_attribute_low_level)  or else
				(a_value = no_return_attribute_low_level)  or else
				(a_value = no_unwind_attribute_low_level)  or else
				(a_value = non_lazy_bind_low_level)  or else
				(a_value = optimize_for_size_attribute_low_level)  or else
				(a_value = read_none_attribute_low_level)  or else
				(a_value = read_only_attribute_low_level)  or else
				(a_value = returns_twice_low_level)  or else
				(a_value = sext_attribute_low_level)  or else
				(a_value = stack_alignment_low_level)  or else
				(a_value = stack_protect_attribute_low_level)  or else
				(a_value = stack_protect_req_attribute_low_level)  or else
				(a_value = struct_ret_attribute_low_level)  or else
				(a_value = uwtable_low_level)  or else
				(a_value = zext_attribute_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_alignment
		do
			value := alignment_low_level
		end

	set_always_inline_attribute
		do
			value := always_inline_attribute_low_level
		end

	set_by_val_attribute
		do
			value := by_val_attribute_low_level
		end

	set_in_reg_attribute
		do
			value := in_reg_attribute_low_level
		end

	set_inline_hint_attribute
		do
			value := inline_hint_attribute_low_level
		end

	set_naked_attribute
		do
			value := naked_attribute_low_level
		end

	set_nest_attribute
		do
			value := nest_attribute_low_level
		end

	set_no_alias_attribute
		do
			value := no_alias_attribute_low_level
		end

	set_no_capture_attribute
		do
			value := no_capture_attribute_low_level
		end

	set_no_implicit_float_attribute
		do
			value := no_implicit_float_attribute_low_level
		end

	set_no_inline_attribute
		do
			value := no_inline_attribute_low_level
		end

	set_no_red_zone_attribute
		do
			value := no_red_zone_attribute_low_level
		end

	set_no_return_attribute
		do
			value := no_return_attribute_low_level
		end

	set_no_unwind_attribute
		do
			value := no_unwind_attribute_low_level
		end

	set_non_lazy_bind
		do
			value := non_lazy_bind_low_level
		end

	set_optimize_for_size_attribute
		do
			value := optimize_for_size_attribute_low_level
		end

	set_read_none_attribute
		do
			value := read_none_attribute_low_level
		end

	set_read_only_attribute
		do
			value := read_only_attribute_low_level
		end

	set_returns_twice
		do
			value := returns_twice_low_level
		end

	set_sext_attribute
		do
			value := sext_attribute_low_level
		end

	set_stack_alignment
		do
			value := stack_alignment_low_level
		end

	set_stack_protect_attribute
		do
			value := stack_protect_attribute_low_level
		end

	set_stack_protect_req_attribute
		do
			value := stack_protect_req_attribute_low_level
		end

	set_struct_ret_attribute
		do
			value := struct_ret_attribute_low_level
		end

	set_uwtable
		do
			value := uwtable_low_level
		end

	set_zext_attribute
		do
			value := zext_attribute_low_level
		end

feature {ANY} -- Queries
	is_alignment: BOOLEAN
		do
			Result := (value=alignment_low_level)
		end

	is_always_inline_attribute: BOOLEAN
		do
			Result := (value=always_inline_attribute_low_level)
		end

	is_by_val_attribute: BOOLEAN
		do
			Result := (value=by_val_attribute_low_level)
		end

	is_in_reg_attribute: BOOLEAN
		do
			Result := (value=in_reg_attribute_low_level)
		end

	is_inline_hint_attribute: BOOLEAN
		do
			Result := (value=inline_hint_attribute_low_level)
		end

	is_naked_attribute: BOOLEAN
		do
			Result := (value=naked_attribute_low_level)
		end

	is_nest_attribute: BOOLEAN
		do
			Result := (value=nest_attribute_low_level)
		end

	is_no_alias_attribute: BOOLEAN
		do
			Result := (value=no_alias_attribute_low_level)
		end

	is_no_capture_attribute: BOOLEAN
		do
			Result := (value=no_capture_attribute_low_level)
		end

	is_no_implicit_float_attribute: BOOLEAN
		do
			Result := (value=no_implicit_float_attribute_low_level)
		end

	is_no_inline_attribute: BOOLEAN
		do
			Result := (value=no_inline_attribute_low_level)
		end

	is_no_red_zone_attribute: BOOLEAN
		do
			Result := (value=no_red_zone_attribute_low_level)
		end

	is_no_return_attribute: BOOLEAN
		do
			Result := (value=no_return_attribute_low_level)
		end

	is_no_unwind_attribute: BOOLEAN
		do
			Result := (value=no_unwind_attribute_low_level)
		end

	is_non_lazy_bind: BOOLEAN
		do
			Result := (value=non_lazy_bind_low_level)
		end

	is_optimize_for_size_attribute: BOOLEAN
		do
			Result := (value=optimize_for_size_attribute_low_level)
		end

	is_read_none_attribute: BOOLEAN
		do
			Result := (value=read_none_attribute_low_level)
		end

	is_read_only_attribute: BOOLEAN
		do
			Result := (value=read_only_attribute_low_level)
		end

	is_returns_twice: BOOLEAN
		do
			Result := (value=returns_twice_low_level)
		end

	is_sext_attribute: BOOLEAN
		do
			Result := (value=sext_attribute_low_level)
		end

	is_stack_alignment: BOOLEAN
		do
			Result := (value=stack_alignment_low_level)
		end

	is_stack_protect_attribute: BOOLEAN
		do
			Result := (value=stack_protect_attribute_low_level)
		end

	is_stack_protect_req_attribute: BOOLEAN
		do
			Result := (value=stack_protect_req_attribute_low_level)
		end

	is_struct_ret_attribute: BOOLEAN
		do
			Result := (value=struct_ret_attribute_low_level)
		end

	is_uwtable: BOOLEAN
		do
			Result := (value=uwtable_low_level)
		end

	is_zext_attribute: BOOLEAN
		do
			Result := (value=zext_attribute_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	alignment_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAlignment"
 			}"
 		end

	always_inline_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAlwaysInlineAttribute"
 			}"
 		end

	by_val_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMByValAttribute"
 			}"
 		end

	in_reg_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInRegAttribute"
 			}"
 		end

	inline_hint_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInlineHintAttribute"
 			}"
 		end

	naked_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNakedAttribute"
 			}"
 		end

	nest_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNestAttribute"
 			}"
 		end

	no_alias_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoAliasAttribute"
 			}"
 		end

	no_capture_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoCaptureAttribute"
 			}"
 		end

	no_implicit_float_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoImplicitFloatAttribute"
 			}"
 		end

	no_inline_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoInlineAttribute"
 			}"
 		end

	no_red_zone_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoRedZoneAttribute"
 			}"
 		end

	no_return_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoReturnAttribute"
 			}"
 		end

	no_unwind_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoUnwindAttribute"
 			}"
 		end

	non_lazy_bind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNonLazyBind"
 			}"
 		end

	optimize_for_size_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMOptimizeForSizeAttribute"
 			}"
 		end

	read_none_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMReadNoneAttribute"
 			}"
 		end

	read_only_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMReadOnlyAttribute"
 			}"
 		end

	returns_twice_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMReturnsTwice"
 			}"
 		end

	sext_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSExtAttribute"
 			}"
 		end

	stack_alignment_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStackAlignment"
 			}"
 		end

	stack_protect_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStackProtectAttribute"
 			}"
 		end

	stack_protect_req_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStackProtectReqAttribute"
 			}"
 		end

	struct_ret_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStructRetAttribute"
 			}"
 		end

	uwtable_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUWTable"
 			}"
 		end

	zext_attribute_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMZExtAttribute"
 			}"
 		end


end -- class LLVMATTRIBUTE_ENUM
