-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMATTRIBUTE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = llvmalignment_low_level)  or else
				(a_value = llvmalways_inline_attribute_low_level)  or else
				(a_value = llvmby_val_attribute_low_level)  or else
				(a_value = llvmin_reg_attribute_low_level)  or else
				(a_value = llvminline_hint_attribute_low_level)  or else
				(a_value = llvmnaked_attribute_low_level)  or else
				(a_value = llvmnest_attribute_low_level)  or else
				(a_value = llvmno_alias_attribute_low_level)  or else
				(a_value = llvmno_capture_attribute_low_level)  or else
				(a_value = llvmno_implicit_float_attribute_low_level)  or else
				(a_value = llvmno_inline_attribute_low_level)  or else
				(a_value = llvmno_red_zone_attribute_low_level)  or else
				(a_value = llvmno_return_attribute_low_level)  or else
				(a_value = llvmno_unwind_attribute_low_level)  or else
				(a_value = llvmoptimize_for_size_attribute_low_level)  or else
				(a_value = llvmread_none_attribute_low_level)  or else
				(a_value = llvmread_only_attribute_low_level)  or else
				(a_value = llvmsext_attribute_low_level)  or else
				(a_value = llvmstack_alignment_low_level)  or else
				(a_value = llvmstack_protect_attribute_low_level)  or else
				(a_value = llvmstack_protect_req_attribute_low_level)  or else
				(a_value = llvmstruct_ret_attribute_low_level)  or else
				(a_value = llvmzext_attribute_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_llvmalignment is
		do
			value := llvmalignment_low_level
		end

	set_llvmalways_inline_attribute is
		do
			value := llvmalways_inline_attribute_low_level
		end

	set_llvmby_val_attribute is
		do
			value := llvmby_val_attribute_low_level
		end

	set_llvmin_reg_attribute is
		do
			value := llvmin_reg_attribute_low_level
		end

	set_llvminline_hint_attribute is
		do
			value := llvminline_hint_attribute_low_level
		end

	set_llvmnaked_attribute is
		do
			value := llvmnaked_attribute_low_level
		end

	set_llvmnest_attribute is
		do
			value := llvmnest_attribute_low_level
		end

	set_llvmno_alias_attribute is
		do
			value := llvmno_alias_attribute_low_level
		end

	set_llvmno_capture_attribute is
		do
			value := llvmno_capture_attribute_low_level
		end

	set_llvmno_implicit_float_attribute is
		do
			value := llvmno_implicit_float_attribute_low_level
		end

	set_llvmno_inline_attribute is
		do
			value := llvmno_inline_attribute_low_level
		end

	set_llvmno_red_zone_attribute is
		do
			value := llvmno_red_zone_attribute_low_level
		end

	set_llvmno_return_attribute is
		do
			value := llvmno_return_attribute_low_level
		end

	set_llvmno_unwind_attribute is
		do
			value := llvmno_unwind_attribute_low_level
		end

	set_llvmoptimize_for_size_attribute is
		do
			value := llvmoptimize_for_size_attribute_low_level
		end

	set_llvmread_none_attribute is
		do
			value := llvmread_none_attribute_low_level
		end

	set_llvmread_only_attribute is
		do
			value := llvmread_only_attribute_low_level
		end

	set_llvmsext_attribute is
		do
			value := llvmsext_attribute_low_level
		end

	set_llvmstack_alignment is
		do
			value := llvmstack_alignment_low_level
		end

	set_llvmstack_protect_attribute is
		do
			value := llvmstack_protect_attribute_low_level
		end

	set_llvmstack_protect_req_attribute is
		do
			value := llvmstack_protect_req_attribute_low_level
		end

	set_llvmstruct_ret_attribute is
		do
			value := llvmstruct_ret_attribute_low_level
		end

	set_llvmzext_attribute is
		do
			value := llvmzext_attribute_low_level
		end

feature {ANY} -- Queries
	is_llvmalignment: BOOLEAN is
		do
			Result := (value=llvmalignment_low_level)
		end

	is_llvmalways_inline_attribute: BOOLEAN is
		do
			Result := (value=llvmalways_inline_attribute_low_level)
		end

	is_llvmby_val_attribute: BOOLEAN is
		do
			Result := (value=llvmby_val_attribute_low_level)
		end

	is_llvmin_reg_attribute: BOOLEAN is
		do
			Result := (value=llvmin_reg_attribute_low_level)
		end

	is_llvminline_hint_attribute: BOOLEAN is
		do
			Result := (value=llvminline_hint_attribute_low_level)
		end

	is_llvmnaked_attribute: BOOLEAN is
		do
			Result := (value=llvmnaked_attribute_low_level)
		end

	is_llvmnest_attribute: BOOLEAN is
		do
			Result := (value=llvmnest_attribute_low_level)
		end

	is_llvmno_alias_attribute: BOOLEAN is
		do
			Result := (value=llvmno_alias_attribute_low_level)
		end

	is_llvmno_capture_attribute: BOOLEAN is
		do
			Result := (value=llvmno_capture_attribute_low_level)
		end

	is_llvmno_implicit_float_attribute: BOOLEAN is
		do
			Result := (value=llvmno_implicit_float_attribute_low_level)
		end

	is_llvmno_inline_attribute: BOOLEAN is
		do
			Result := (value=llvmno_inline_attribute_low_level)
		end

	is_llvmno_red_zone_attribute: BOOLEAN is
		do
			Result := (value=llvmno_red_zone_attribute_low_level)
		end

	is_llvmno_return_attribute: BOOLEAN is
		do
			Result := (value=llvmno_return_attribute_low_level)
		end

	is_llvmno_unwind_attribute: BOOLEAN is
		do
			Result := (value=llvmno_unwind_attribute_low_level)
		end

	is_llvmoptimize_for_size_attribute: BOOLEAN is
		do
			Result := (value=llvmoptimize_for_size_attribute_low_level)
		end

	is_llvmread_none_attribute: BOOLEAN is
		do
			Result := (value=llvmread_none_attribute_low_level)
		end

	is_llvmread_only_attribute: BOOLEAN is
		do
			Result := (value=llvmread_only_attribute_low_level)
		end

	is_llvmsext_attribute: BOOLEAN is
		do
			Result := (value=llvmsext_attribute_low_level)
		end

	is_llvmstack_alignment: BOOLEAN is
		do
			Result := (value=llvmstack_alignment_low_level)
		end

	is_llvmstack_protect_attribute: BOOLEAN is
		do
			Result := (value=llvmstack_protect_attribute_low_level)
		end

	is_llvmstack_protect_req_attribute: BOOLEAN is
		do
			Result := (value=llvmstack_protect_req_attribute_low_level)
		end

	is_llvmstruct_ret_attribute: BOOLEAN is
		do
			Result := (value=llvmstruct_ret_attribute_low_level)
		end

	is_llvmzext_attribute: BOOLEAN is
		do
			Result := (value=llvmzext_attribute_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmalignment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAlignment"
 			}"
 		end

	llvmalways_inline_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAlwaysInlineAttribute"
 			}"
 		end

	llvmby_val_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMByValAttribute"
 			}"
 		end

	llvmin_reg_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInRegAttribute"
 			}"
 		end

	llvminline_hint_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInlineHintAttribute"
 			}"
 		end

	llvmnaked_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNakedAttribute"
 			}"
 		end

	llvmnest_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNestAttribute"
 			}"
 		end

	llvmno_alias_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoAliasAttribute"
 			}"
 		end

	llvmno_capture_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoCaptureAttribute"
 			}"
 		end

	llvmno_implicit_float_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoImplicitFloatAttribute"
 			}"
 		end

	llvmno_inline_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoInlineAttribute"
 			}"
 		end

	llvmno_red_zone_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoRedZoneAttribute"
 			}"
 		end

	llvmno_return_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoReturnAttribute"
 			}"
 		end

	llvmno_unwind_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMNoUnwindAttribute"
 			}"
 		end

	llvmoptimize_for_size_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMOptimizeForSizeAttribute"
 			}"
 		end

	llvmread_none_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMReadNoneAttribute"
 			}"
 		end

	llvmread_only_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMReadOnlyAttribute"
 			}"
 		end

	llvmsext_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSExtAttribute"
 			}"
 		end

	llvmstack_alignment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStackAlignment"
 			}"
 		end

	llvmstack_protect_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStackProtectAttribute"
 			}"
 		end

	llvmstack_protect_req_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStackProtectReqAttribute"
 			}"
 		end

	llvmstruct_ret_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStructRetAttribute"
 			}"
 		end

	llvmzext_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMZExtAttribute"
 			}"
 		end


end -- class LLVMATTRIBUTE_ENUM
