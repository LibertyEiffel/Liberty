-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMOPCODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = llvmadd_low_level)  or else
				(a_value = llvmalloca_low_level)  or else
				(a_value = llvmand_low_level)  or else
				(a_value = llvmashr_low_level)  or else
				(a_value = llvmbit_cast_low_level)  or else
				(a_value = llvmbr_low_level)  or else
				(a_value = llvmcall_low_level)  or else
				(a_value = llvmextract_element_low_level)  or else
				(a_value = llvmextract_value_low_level)  or else
				(a_value = llvmfadd_low_level)  or else
				(a_value = llvmfcmp_low_level)  or else
				(a_value = llvmfdiv_low_level)  or else
				(a_value = llvmfmul_low_level)  or else
				(a_value = llvmfpext_low_level)  or else
				(a_value = llvmfpto_si_low_level)  or else
				(a_value = llvmfpto_ui_low_level)  or else
				(a_value = llvmfptrunc_low_level)  or else
				(a_value = llvmfrem_low_level)  or else
				(a_value = llvmfsub_low_level)  or else
				(a_value = llvmget_element_ptr_low_level)  or else
				(a_value = llvmicmp_low_level)  or else
				(a_value = llvmindirect_br_low_level)  or else
				(a_value = llvminsert_element_low_level)  or else
				(a_value = llvminsert_value_low_level)  or else
				(a_value = llvmint_to_ptr_low_level)  or else
				(a_value = llvminvoke_low_level)  or else
				(a_value = llvmload_low_level)  or else
				(a_value = llvmlshr_low_level)  or else
				(a_value = llvmmul_low_level)  or else
				(a_value = llvmor_low_level)  or else
				(a_value = llvmphi_low_level)  or else
				(a_value = llvmptr_to_int_low_level)  or else
				(a_value = llvmret_low_level)  or else
				(a_value = llvmsdiv_low_level)  or else
				(a_value = llvmselect_low_level)  or else
				(a_value = llvmsext_low_level)  or else
				(a_value = llvmshl_low_level)  or else
				(a_value = llvmshuffle_vector_low_level)  or else
				(a_value = llvmsito_fp_low_level)  or else
				(a_value = llvmsrem_low_level)  or else
				(a_value = llvmstore_low_level)  or else
				(a_value = llvmsub_low_level)  or else
				(a_value = llvmswitch_low_level)  or else
				(a_value = llvmtrunc_low_level)  or else
				(a_value = llvmudiv_low_level)  or else
				(a_value = llvmuito_fp_low_level)  or else
				(a_value = llvmunreachable_low_level)  or else
				(a_value = llvmunwind_low_level)  or else
				(a_value = llvmurem_low_level)  or else
				(a_value = llvmvaarg_low_level)  or else
				(a_value = llvmxor_low_level)  or else
				(a_value = llvmzext_low_level) )
		end

feature -- Setters
	default_create,
	set_llvmadd is
		do
			value := llvmadd_low_level
		end

	set_llvmalloca is
		do
			value := llvmalloca_low_level
		end

	set_llvmand is
		do
			value := llvmand_low_level
		end

	set_llvmashr is
		do
			value := llvmashr_low_level
		end

	set_llvmbit_cast is
		do
			value := llvmbit_cast_low_level
		end

	set_llvmbr is
		do
			value := llvmbr_low_level
		end

	set_llvmcall is
		do
			value := llvmcall_low_level
		end

	set_llvmextract_element is
		do
			value := llvmextract_element_low_level
		end

	set_llvmextract_value is
		do
			value := llvmextract_value_low_level
		end

	set_llvmfadd is
		do
			value := llvmfadd_low_level
		end

	set_llvmfcmp is
		do
			value := llvmfcmp_low_level
		end

	set_llvmfdiv is
		do
			value := llvmfdiv_low_level
		end

	set_llvmfmul is
		do
			value := llvmfmul_low_level
		end

	set_llvmfpext is
		do
			value := llvmfpext_low_level
		end

	set_llvmfpto_si is
		do
			value := llvmfpto_si_low_level
		end

	set_llvmfpto_ui is
		do
			value := llvmfpto_ui_low_level
		end

	set_llvmfptrunc is
		do
			value := llvmfptrunc_low_level
		end

	set_llvmfrem is
		do
			value := llvmfrem_low_level
		end

	set_llvmfsub is
		do
			value := llvmfsub_low_level
		end

	set_llvmget_element_ptr is
		do
			value := llvmget_element_ptr_low_level
		end

	set_llvmicmp is
		do
			value := llvmicmp_low_level
		end

	set_llvmindirect_br is
		do
			value := llvmindirect_br_low_level
		end

	set_llvminsert_element is
		do
			value := llvminsert_element_low_level
		end

	set_llvminsert_value is
		do
			value := llvminsert_value_low_level
		end

	set_llvmint_to_ptr is
		do
			value := llvmint_to_ptr_low_level
		end

	set_llvminvoke is
		do
			value := llvminvoke_low_level
		end

	set_llvmload is
		do
			value := llvmload_low_level
		end

	set_llvmlshr is
		do
			value := llvmlshr_low_level
		end

	set_llvmmul is
		do
			value := llvmmul_low_level
		end

	set_llvmor is
		do
			value := llvmor_low_level
		end

	set_llvmphi is
		do
			value := llvmphi_low_level
		end

	set_llvmptr_to_int is
		do
			value := llvmptr_to_int_low_level
		end

	set_llvmret is
		do
			value := llvmret_low_level
		end

	set_llvmsdiv is
		do
			value := llvmsdiv_low_level
		end

	set_llvmselect is
		do
			value := llvmselect_low_level
		end

	set_llvmsext is
		do
			value := llvmsext_low_level
		end

	set_llvmshl is
		do
			value := llvmshl_low_level
		end

	set_llvmshuffle_vector is
		do
			value := llvmshuffle_vector_low_level
		end

	set_llvmsito_fp is
		do
			value := llvmsito_fp_low_level
		end

	set_llvmsrem is
		do
			value := llvmsrem_low_level
		end

	set_llvmstore is
		do
			value := llvmstore_low_level
		end

	set_llvmsub is
		do
			value := llvmsub_low_level
		end

	set_llvmswitch is
		do
			value := llvmswitch_low_level
		end

	set_llvmtrunc is
		do
			value := llvmtrunc_low_level
		end

	set_llvmudiv is
		do
			value := llvmudiv_low_level
		end

	set_llvmuito_fp is
		do
			value := llvmuito_fp_low_level
		end

	set_llvmunreachable is
		do
			value := llvmunreachable_low_level
		end

	set_llvmunwind is
		do
			value := llvmunwind_low_level
		end

	set_llvmurem is
		do
			value := llvmurem_low_level
		end

	set_llvmvaarg is
		do
			value := llvmvaarg_low_level
		end

	set_llvmxor is
		do
			value := llvmxor_low_level
		end

	set_llvmzext is
		do
			value := llvmzext_low_level
		end

feature -- Queries
	is_llvmadd: BOOLEAN is
		do
			Result := (value=llvmadd_low_level)
		end

	is_llvmalloca: BOOLEAN is
		do
			Result := (value=llvmalloca_low_level)
		end

	is_llvmand: BOOLEAN is
		do
			Result := (value=llvmand_low_level)
		end

	is_llvmashr: BOOLEAN is
		do
			Result := (value=llvmashr_low_level)
		end

	is_llvmbit_cast: BOOLEAN is
		do
			Result := (value=llvmbit_cast_low_level)
		end

	is_llvmbr: BOOLEAN is
		do
			Result := (value=llvmbr_low_level)
		end

	is_llvmcall: BOOLEAN is
		do
			Result := (value=llvmcall_low_level)
		end

	is_llvmextract_element: BOOLEAN is
		do
			Result := (value=llvmextract_element_low_level)
		end

	is_llvmextract_value: BOOLEAN is
		do
			Result := (value=llvmextract_value_low_level)
		end

	is_llvmfadd: BOOLEAN is
		do
			Result := (value=llvmfadd_low_level)
		end

	is_llvmfcmp: BOOLEAN is
		do
			Result := (value=llvmfcmp_low_level)
		end

	is_llvmfdiv: BOOLEAN is
		do
			Result := (value=llvmfdiv_low_level)
		end

	is_llvmfmul: BOOLEAN is
		do
			Result := (value=llvmfmul_low_level)
		end

	is_llvmfpext: BOOLEAN is
		do
			Result := (value=llvmfpext_low_level)
		end

	is_llvmfpto_si: BOOLEAN is
		do
			Result := (value=llvmfpto_si_low_level)
		end

	is_llvmfpto_ui: BOOLEAN is
		do
			Result := (value=llvmfpto_ui_low_level)
		end

	is_llvmfptrunc: BOOLEAN is
		do
			Result := (value=llvmfptrunc_low_level)
		end

	is_llvmfrem: BOOLEAN is
		do
			Result := (value=llvmfrem_low_level)
		end

	is_llvmfsub: BOOLEAN is
		do
			Result := (value=llvmfsub_low_level)
		end

	is_llvmget_element_ptr: BOOLEAN is
		do
			Result := (value=llvmget_element_ptr_low_level)
		end

	is_llvmicmp: BOOLEAN is
		do
			Result := (value=llvmicmp_low_level)
		end

	is_llvmindirect_br: BOOLEAN is
		do
			Result := (value=llvmindirect_br_low_level)
		end

	is_llvminsert_element: BOOLEAN is
		do
			Result := (value=llvminsert_element_low_level)
		end

	is_llvminsert_value: BOOLEAN is
		do
			Result := (value=llvminsert_value_low_level)
		end

	is_llvmint_to_ptr: BOOLEAN is
		do
			Result := (value=llvmint_to_ptr_low_level)
		end

	is_llvminvoke: BOOLEAN is
		do
			Result := (value=llvminvoke_low_level)
		end

	is_llvmload: BOOLEAN is
		do
			Result := (value=llvmload_low_level)
		end

	is_llvmlshr: BOOLEAN is
		do
			Result := (value=llvmlshr_low_level)
		end

	is_llvmmul: BOOLEAN is
		do
			Result := (value=llvmmul_low_level)
		end

	is_llvmor: BOOLEAN is
		do
			Result := (value=llvmor_low_level)
		end

	is_llvmphi: BOOLEAN is
		do
			Result := (value=llvmphi_low_level)
		end

	is_llvmptr_to_int: BOOLEAN is
		do
			Result := (value=llvmptr_to_int_low_level)
		end

	is_llvmret: BOOLEAN is
		do
			Result := (value=llvmret_low_level)
		end

	is_llvmsdiv: BOOLEAN is
		do
			Result := (value=llvmsdiv_low_level)
		end

	is_llvmselect: BOOLEAN is
		do
			Result := (value=llvmselect_low_level)
		end

	is_llvmsext: BOOLEAN is
		do
			Result := (value=llvmsext_low_level)
		end

	is_llvmshl: BOOLEAN is
		do
			Result := (value=llvmshl_low_level)
		end

	is_llvmshuffle_vector: BOOLEAN is
		do
			Result := (value=llvmshuffle_vector_low_level)
		end

	is_llvmsito_fp: BOOLEAN is
		do
			Result := (value=llvmsito_fp_low_level)
		end

	is_llvmsrem: BOOLEAN is
		do
			Result := (value=llvmsrem_low_level)
		end

	is_llvmstore: BOOLEAN is
		do
			Result := (value=llvmstore_low_level)
		end

	is_llvmsub: BOOLEAN is
		do
			Result := (value=llvmsub_low_level)
		end

	is_llvmswitch: BOOLEAN is
		do
			Result := (value=llvmswitch_low_level)
		end

	is_llvmtrunc: BOOLEAN is
		do
			Result := (value=llvmtrunc_low_level)
		end

	is_llvmudiv: BOOLEAN is
		do
			Result := (value=llvmudiv_low_level)
		end

	is_llvmuito_fp: BOOLEAN is
		do
			Result := (value=llvmuito_fp_low_level)
		end

	is_llvmunreachable: BOOLEAN is
		do
			Result := (value=llvmunreachable_low_level)
		end

	is_llvmunwind: BOOLEAN is
		do
			Result := (value=llvmunwind_low_level)
		end

	is_llvmurem: BOOLEAN is
		do
			Result := (value=llvmurem_low_level)
		end

	is_llvmvaarg: BOOLEAN is
		do
			Result := (value=llvmvaarg_low_level)
		end

	is_llvmxor: BOOLEAN is
		do
			Result := (value=llvmxor_low_level)
		end

	is_llvmzext: BOOLEAN is
		do
			Result := (value=llvmzext_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmadd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAdd"
 			}"
 		end

	llvmalloca_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAlloca"
 			}"
 		end

	llvmand_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAnd"
 			}"
 		end

	llvmashr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAShr"
 			}"
 		end

	llvmbit_cast_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMBitCast"
 			}"
 		end

	llvmbr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMBr"
 			}"
 		end

	llvmcall_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMCall"
 			}"
 		end

	llvmextract_element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMExtractElement"
 			}"
 		end

	llvmextract_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMExtractValue"
 			}"
 		end

	llvmfadd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFAdd"
 			}"
 		end

	llvmfcmp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFCmp"
 			}"
 		end

	llvmfdiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFDiv"
 			}"
 		end

	llvmfmul_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFMul"
 			}"
 		end

	llvmfpext_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFPExt"
 			}"
 		end

	llvmfpto_si_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFPToSI"
 			}"
 		end

	llvmfpto_ui_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFPToUI"
 			}"
 		end

	llvmfptrunc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFPTrunc"
 			}"
 		end

	llvmfrem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFRem"
 			}"
 		end

	llvmfsub_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFSub"
 			}"
 		end

	llvmget_element_ptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMGetElementPtr"
 			}"
 		end

	llvmicmp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMICmp"
 			}"
 		end

	llvmindirect_br_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIndirectBr"
 			}"
 		end

	llvminsert_element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInsertElement"
 			}"
 		end

	llvminsert_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInsertValue"
 			}"
 		end

	llvmint_to_ptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntToPtr"
 			}"
 		end

	llvminvoke_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInvoke"
 			}"
 		end

	llvmload_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLoad"
 			}"
 		end

	llvmlshr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLShr"
 			}"
 		end

	llvmmul_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMMul"
 			}"
 		end

	llvmor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMOr"
 			}"
 		end

	llvmphi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPHI"
 			}"
 		end

	llvmptr_to_int_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPtrToInt"
 			}"
 		end

	llvmret_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRet"
 			}"
 		end

	llvmsdiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSDiv"
 			}"
 		end

	llvmselect_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSelect"
 			}"
 		end

	llvmsext_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSExt"
 			}"
 		end

	llvmshl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMShl"
 			}"
 		end

	llvmshuffle_vector_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMShuffleVector"
 			}"
 		end

	llvmsito_fp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSIToFP"
 			}"
 		end

	llvmsrem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSRem"
 			}"
 		end

	llvmstore_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStore"
 			}"
 		end

	llvmsub_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSub"
 			}"
 		end

	llvmswitch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMSwitch"
 			}"
 		end

	llvmtrunc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMTrunc"
 			}"
 		end

	llvmudiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUDiv"
 			}"
 		end

	llvmuito_fp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUIToFP"
 			}"
 		end

	llvmunreachable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUnreachable"
 			}"
 		end

	llvmunwind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUnwind"
 			}"
 		end

	llvmurem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMURem"
 			}"
 		end

	llvmvaarg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMVAArg"
 			}"
 		end

	llvmxor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMXor"
 			}"
 		end

	llvmzext_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMZExt"
 			}"
 		end


end -- class LLVMOPCODE_ENUM
