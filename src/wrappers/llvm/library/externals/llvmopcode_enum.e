-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMOPCODE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = add_low_level)  or else
				(a_value = alloca_low_level)  or else
				(a_value = and_external_low_level)  or else
				(a_value = ashr_low_level)  or else
				(a_value = atomic_cmp_xchg_low_level)  or else
				(a_value = atomic_rmw_low_level)  or else
				(a_value = bit_cast_low_level)  or else
				(a_value = br_low_level)  or else
				(a_value = call_low_level)  or else
				(a_value = extract_element_low_level)  or else
				(a_value = extract_value_low_level)  or else
				(a_value = fadd_low_level)  or else
				(a_value = fcmp_low_level)  or else
				(a_value = fdiv_low_level)  or else
				(a_value = fence_low_level)  or else
				(a_value = fmul_low_level)  or else
				(a_value = fpext_low_level)  or else
				(a_value = fpto_si_low_level)  or else
				(a_value = fpto_ui_low_level)  or else
				(a_value = fptrunc_low_level)  or else
				(a_value = frem_low_level)  or else
				(a_value = fsub_low_level)  or else
				(a_value = get_element_ptr_low_level)  or else
				(a_value = icmp_low_level)  or else
				(a_value = indirect_br_low_level)  or else
				(a_value = insert_element_low_level)  or else
				(a_value = insert_value_low_level)  or else
				(a_value = int_to_ptr_low_level)  or else
				(a_value = invoke_low_level)  or else
				(a_value = landing_pad_low_level)  or else
				(a_value = load_low_level)  or else
				(a_value = lshr_low_level)  or else
				(a_value = mul_low_level)  or else
				(a_value = or_external_low_level)  or else
				(a_value = phi_low_level)  or else
				(a_value = ptr_to_int_low_level)  or else
				(a_value = resume_low_level)  or else
				(a_value = ret_low_level)  or else
				(a_value = sdiv_low_level)  or else
				(a_value = select_external_low_level)  or else
				(a_value = sext_low_level)  or else
				(a_value = shl_low_level)  or else
				(a_value = shuffle_vector_low_level)  or else
				(a_value = sito_fp_low_level)  or else
				(a_value = srem_low_level)  or else
				(a_value = store_low_level)  or else
				(a_value = sub_low_level)  or else
				(a_value = switch_low_level)  or else
				(a_value = trunc_low_level)  or else
				(a_value = udiv_low_level)  or else
				(a_value = uito_fp_low_level)  or else
				(a_value = unreachable_low_level)  or else
				(a_value = urem_low_level)  or else
				(a_value = user_op1_low_level)  or else
				(a_value = user_op2_low_level)  or else
				(a_value = vaarg_low_level)  or else
				(a_value = xor_external_low_level)  or else
				(a_value = zext_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_add
		do
			value := add_low_level
		end

	set_alloca
		do
			value := alloca_low_level
		end

	set_and_external
		do
			value := and_external_low_level
		end

	set_ashr
		do
			value := ashr_low_level
		end

	set_atomic_cmp_xchg
		do
			value := atomic_cmp_xchg_low_level
		end

	set_atomic_rmw
		do
			value := atomic_rmw_low_level
		end

	set_bit_cast
		do
			value := bit_cast_low_level
		end

	set_br
		do
			value := br_low_level
		end

	set_call
		do
			value := call_low_level
		end

	set_extract_element
		do
			value := extract_element_low_level
		end

	set_extract_value
		do
			value := extract_value_low_level
		end

	set_fadd
		do
			value := fadd_low_level
		end

	set_fcmp
		do
			value := fcmp_low_level
		end

	set_fdiv
		do
			value := fdiv_low_level
		end

	set_fence
		do
			value := fence_low_level
		end

	set_fmul
		do
			value := fmul_low_level
		end

	set_fpext
		do
			value := fpext_low_level
		end

	set_fpto_si
		do
			value := fpto_si_low_level
		end

	set_fpto_ui
		do
			value := fpto_ui_low_level
		end

	set_fptrunc
		do
			value := fptrunc_low_level
		end

	set_frem
		do
			value := frem_low_level
		end

	set_fsub
		do
			value := fsub_low_level
		end

	set_get_element_ptr
		do
			value := get_element_ptr_low_level
		end

	set_icmp
		do
			value := icmp_low_level
		end

	set_indirect_br
		do
			value := indirect_br_low_level
		end

	set_insert_element
		do
			value := insert_element_low_level
		end

	set_insert_value
		do
			value := insert_value_low_level
		end

	set_int_to_ptr
		do
			value := int_to_ptr_low_level
		end

	set_invoke
		do
			value := invoke_low_level
		end

	set_landing_pad
		do
			value := landing_pad_low_level
		end

	set_load
		do
			value := load_low_level
		end

	set_lshr
		do
			value := lshr_low_level
		end

	set_mul
		do
			value := mul_low_level
		end

	set_or_external
		do
			value := or_external_low_level
		end

	set_phi
		do
			value := phi_low_level
		end

	set_ptr_to_int
		do
			value := ptr_to_int_low_level
		end

	set_resume
		do
			value := resume_low_level
		end

	set_ret
		do
			value := ret_low_level
		end

	set_sdiv
		do
			value := sdiv_low_level
		end

	set_select_external
		do
			value := select_external_low_level
		end

	set_sext
		do
			value := sext_low_level
		end

	set_shl
		do
			value := shl_low_level
		end

	set_shuffle_vector
		do
			value := shuffle_vector_low_level
		end

	set_sito_fp
		do
			value := sito_fp_low_level
		end

	set_srem
		do
			value := srem_low_level
		end

	set_store
		do
			value := store_low_level
		end

	set_sub
		do
			value := sub_low_level
		end

	set_switch
		do
			value := switch_low_level
		end

	set_trunc
		do
			value := trunc_low_level
		end

	set_udiv
		do
			value := udiv_low_level
		end

	set_uito_fp
		do
			value := uito_fp_low_level
		end

	set_unreachable
		do
			value := unreachable_low_level
		end

	set_urem
		do
			value := urem_low_level
		end

	set_user_op1
		do
			value := user_op1_low_level
		end

	set_user_op2
		do
			value := user_op2_low_level
		end

	set_vaarg
		do
			value := vaarg_low_level
		end

	set_xor_external
		do
			value := xor_external_low_level
		end

	set_zext
		do
			value := zext_low_level
		end

feature {ANY} -- Queries
	is_add: BOOLEAN
		do
			Result := (value=add_low_level)
		end

	is_alloca: BOOLEAN
		do
			Result := (value=alloca_low_level)
		end

	is_and_external: BOOLEAN
		do
			Result := (value=and_external_low_level)
		end

	is_ashr: BOOLEAN
		do
			Result := (value=ashr_low_level)
		end

	is_atomic_cmp_xchg: BOOLEAN
		do
			Result := (value=atomic_cmp_xchg_low_level)
		end

	is_atomic_rmw: BOOLEAN
		do
			Result := (value=atomic_rmw_low_level)
		end

	is_bit_cast: BOOLEAN
		do
			Result := (value=bit_cast_low_level)
		end

	is_br: BOOLEAN
		do
			Result := (value=br_low_level)
		end

	is_call: BOOLEAN
		do
			Result := (value=call_low_level)
		end

	is_extract_element: BOOLEAN
		do
			Result := (value=extract_element_low_level)
		end

	is_extract_value: BOOLEAN
		do
			Result := (value=extract_value_low_level)
		end

	is_fadd: BOOLEAN
		do
			Result := (value=fadd_low_level)
		end

	is_fcmp: BOOLEAN
		do
			Result := (value=fcmp_low_level)
		end

	is_fdiv: BOOLEAN
		do
			Result := (value=fdiv_low_level)
		end

	is_fence: BOOLEAN
		do
			Result := (value=fence_low_level)
		end

	is_fmul: BOOLEAN
		do
			Result := (value=fmul_low_level)
		end

	is_fpext: BOOLEAN
		do
			Result := (value=fpext_low_level)
		end

	is_fpto_si: BOOLEAN
		do
			Result := (value=fpto_si_low_level)
		end

	is_fpto_ui: BOOLEAN
		do
			Result := (value=fpto_ui_low_level)
		end

	is_fptrunc: BOOLEAN
		do
			Result := (value=fptrunc_low_level)
		end

	is_frem: BOOLEAN
		do
			Result := (value=frem_low_level)
		end

	is_fsub: BOOLEAN
		do
			Result := (value=fsub_low_level)
		end

	is_get_element_ptr: BOOLEAN
		do
			Result := (value=get_element_ptr_low_level)
		end

	is_icmp: BOOLEAN
		do
			Result := (value=icmp_low_level)
		end

	is_indirect_br: BOOLEAN
		do
			Result := (value=indirect_br_low_level)
		end

	is_insert_element: BOOLEAN
		do
			Result := (value=insert_element_low_level)
		end

	is_insert_value: BOOLEAN
		do
			Result := (value=insert_value_low_level)
		end

	is_int_to_ptr: BOOLEAN
		do
			Result := (value=int_to_ptr_low_level)
		end

	is_invoke: BOOLEAN
		do
			Result := (value=invoke_low_level)
		end

	is_landing_pad: BOOLEAN
		do
			Result := (value=landing_pad_low_level)
		end

	is_load: BOOLEAN
		do
			Result := (value=load_low_level)
		end

	is_lshr: BOOLEAN
		do
			Result := (value=lshr_low_level)
		end

	is_mul: BOOLEAN
		do
			Result := (value=mul_low_level)
		end

	is_or_external: BOOLEAN
		do
			Result := (value=or_external_low_level)
		end

	is_phi: BOOLEAN
		do
			Result := (value=phi_low_level)
		end

	is_ptr_to_int: BOOLEAN
		do
			Result := (value=ptr_to_int_low_level)
		end

	is_resume: BOOLEAN
		do
			Result := (value=resume_low_level)
		end

	is_ret: BOOLEAN
		do
			Result := (value=ret_low_level)
		end

	is_sdiv: BOOLEAN
		do
			Result := (value=sdiv_low_level)
		end

	is_select_external: BOOLEAN
		do
			Result := (value=select_external_low_level)
		end

	is_sext: BOOLEAN
		do
			Result := (value=sext_low_level)
		end

	is_shl: BOOLEAN
		do
			Result := (value=shl_low_level)
		end

	is_shuffle_vector: BOOLEAN
		do
			Result := (value=shuffle_vector_low_level)
		end

	is_sito_fp: BOOLEAN
		do
			Result := (value=sito_fp_low_level)
		end

	is_srem: BOOLEAN
		do
			Result := (value=srem_low_level)
		end

	is_store: BOOLEAN
		do
			Result := (value=store_low_level)
		end

	is_sub: BOOLEAN
		do
			Result := (value=sub_low_level)
		end

	is_switch: BOOLEAN
		do
			Result := (value=switch_low_level)
		end

	is_trunc: BOOLEAN
		do
			Result := (value=trunc_low_level)
		end

	is_udiv: BOOLEAN
		do
			Result := (value=udiv_low_level)
		end

	is_uito_fp: BOOLEAN
		do
			Result := (value=uito_fp_low_level)
		end

	is_unreachable: BOOLEAN
		do
			Result := (value=unreachable_low_level)
		end

	is_urem: BOOLEAN
		do
			Result := (value=urem_low_level)
		end

	is_user_op1: BOOLEAN
		do
			Result := (value=user_op1_low_level)
		end

	is_user_op2: BOOLEAN
		do
			Result := (value=user_op2_low_level)
		end

	is_vaarg: BOOLEAN
		do
			Result := (value=vaarg_low_level)
		end

	is_xor_external: BOOLEAN
		do
			Result := (value=xor_external_low_level)
		end

	is_zext: BOOLEAN
		do
			Result := (value=zext_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	add_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAdd"
 			}"
 		end

	alloca_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAlloca"
 			}"
 		end

	and_external_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAnd"
 			}"
 		end

	ashr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAShr"
 			}"
 		end

	atomic_cmp_xchg_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAtomicCmpXchg"
 			}"
 		end

	atomic_rmw_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAtomicRMW"
 			}"
 		end

	bit_cast_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMBitCast"
 			}"
 		end

	br_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMBr"
 			}"
 		end

	call_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMCall"
 			}"
 		end

	extract_element_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMExtractElement"
 			}"
 		end

	extract_value_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMExtractValue"
 			}"
 		end

	fadd_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFAdd"
 			}"
 		end

	fcmp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFCmp"
 			}"
 		end

	fdiv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFDiv"
 			}"
 		end

	fence_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFence"
 			}"
 		end

	fmul_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFMul"
 			}"
 		end

	fpext_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFPExt"
 			}"
 		end

	fpto_si_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFPToSI"
 			}"
 		end

	fpto_ui_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFPToUI"
 			}"
 		end

	fptrunc_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFPTrunc"
 			}"
 		end

	frem_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFRem"
 			}"
 		end

	fsub_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFSub"
 			}"
 		end

	get_element_ptr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMGetElementPtr"
 			}"
 		end

	icmp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMICmp"
 			}"
 		end

	indirect_br_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIndirectBr"
 			}"
 		end

	insert_element_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInsertElement"
 			}"
 		end

	insert_value_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInsertValue"
 			}"
 		end

	int_to_ptr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntToPtr"
 			}"
 		end

	invoke_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInvoke"
 			}"
 		end

	landing_pad_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLandingPad"
 			}"
 		end

	load_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLoad"
 			}"
 		end

	lshr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLShr"
 			}"
 		end

	mul_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMMul"
 			}"
 		end

	or_external_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMOr"
 			}"
 		end

	phi_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPHI"
 			}"
 		end

	ptr_to_int_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPtrToInt"
 			}"
 		end

	resume_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMResume"
 			}"
 		end

	ret_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRet"
 			}"
 		end

	sdiv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSDiv"
 			}"
 		end

	select_external_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSelect"
 			}"
 		end

	sext_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSExt"
 			}"
 		end

	shl_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMShl"
 			}"
 		end

	shuffle_vector_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMShuffleVector"
 			}"
 		end

	sito_fp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSIToFP"
 			}"
 		end

	srem_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSRem"
 			}"
 		end

	store_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStore"
 			}"
 		end

	sub_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSub"
 			}"
 		end

	switch_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSwitch"
 			}"
 		end

	trunc_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMTrunc"
 			}"
 		end

	udiv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUDiv"
 			}"
 		end

	uito_fp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUIToFP"
 			}"
 		end

	unreachable_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUnreachable"
 			}"
 		end

	urem_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMURem"
 			}"
 		end

	user_op1_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUserOp1"
 			}"
 		end

	user_op2_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUserOp2"
 			}"
 		end

	vaarg_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMVAArg"
 			}"
 		end

	xor_external_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMXor"
 			}"
 		end

	zext_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMZExt"
 			}"
 		end


end -- class LLVMOPCODE_ENUM
