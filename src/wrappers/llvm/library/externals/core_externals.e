-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CORE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	llvmbuild_unreachable (an_argument_l26_c7: POINTER): POINTER is
 		-- LLVMBuildUnreachable (node at line 25)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildUnreachable"
		}"
		end

	llvmset_tail_call (a_call_inst: POINTER; an_is_tail_call: INTEGER_32) is
 		-- LLVMSetTailCall (node at line 37)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetTailCall"
		}"
		end

	llvmis_abasic_block (a_val: POINTER): POINTER is
 		-- LLVMIsABasicBlock (node at line 46)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABasicBlock"
		}"
		end

	llvmis_aglobal_alias (a_val: POINTER): POINTER is
 		-- LLVMIsAGlobalAlias (node at line 55)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGlobalAlias"
		}"
		end

	llvmbuild_udiv (an_argument_l86_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildUDiv (node at line 85)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildUDiv"
		}"
		end

	llvmget_named_global (a_m: POINTER; a_name: POINTER): POINTER is
 		-- LLVMGetNamedGlobal (node at line 135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNamedGlobal"
		}"
		end

	llvmis_acall_inst (a_val: POINTER): POINTER is
 		-- LLVMIsACallInst (node at line 139)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsACallInst"
		}"
		end

	llvmbuild_load (an_argument_l152_c7: POINTER; a_pointer_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildLoad (node at line 151)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildLoad"
		}"
		end

	llvmis_aconstant_pointer_null (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantPointerNull (node at line 169)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantPointerNull"
		}"
		end

	llvmis_afpto_uiinst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPToUIInst (node at line 185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPToUIInst"
		}"
		end

	llvmcreate_memory_buffer_with_contents_of_file (a_path: POINTER; an_out_mem_buf: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMCreateMemoryBufferWithContentsOfFile (node at line 224)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateMemoryBufferWithContentsOfFile"
		}"
		end

	llvmis_asito_fpinst (a_val: POINTER): POINTER is
 		-- LLVMIsASIToFPInst (node at line 305)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASIToFPInst"
		}"
		end

	llvmis_atrunc_inst (a_val: POINTER): POINTER is
 		-- LLVMIsATruncInst (node at line 366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsATruncInst"
		}"
		end

	llvmis_thread_local (a_global_var: POINTER): INTEGER_32 is
 		-- LLVMIsThreadLocal (node at line 398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsThreadLocal"
		}"
		end

	llvmis_packed_struct (a_struct_ty: POINTER): INTEGER_32 is
 		-- LLVMIsPackedStruct (node at line 410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsPackedStruct"
		}"
		end

	llvmget_element_type (a_ty: POINTER): POINTER is
 		-- LLVMGetElementType (node at line 413)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetElementType"
		}"
		end

	llvmis_abit_cast_inst (a_val: POINTER): POINTER is
 		-- LLVMIsABitCastInst (node at line 424)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABitCastInst"
		}"
		end

	llvmconst_sdiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstSDiv (node at line 434)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSDiv"
		}"
		end

	llvmbuild_unwind (an_argument_l448_c7: POINTER): POINTER is
 		-- LLVMBuildUnwind (node at line 447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildUnwind"
		}"
		end

	llvmvalue_as_basic_block (a_val: POINTER): POINTER is
 		-- LLVMValueAsBasicBlock (node at line 484)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMValueAsBasicBlock"
		}"
		end

	llvmconst_extract_element (a_vector_constant: POINTER; an_index_constant: POINTER): POINTER is
 		-- LLVMConstExtractElement (node at line 503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstExtractElement"
		}"
		end

	llvmget_array_length (an_array_ty: POINTER): NATURAL_32 is
 		-- LLVMGetArrayLength (node at line 534)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetArrayLength"
		}"
		end

	llvmfp_128type: POINTER is
 		-- LLVMFP128Type (node at line 539)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFP128Type()"
		}"
		end

	llvmadd_type_name (a_m: POINTER; a_name: POINTER; a_ty: POINTER): INTEGER_32 is
 		-- LLVMAddTypeName (node at line 551)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddTypeName"
		}"
		end

	llvmconst_int_of_string_and_size (an_int_ty: POINTER; a_text: POINTER; a_slen: NATURAL_32; a_radix: CHARACTER): POINTER is
 		-- LLVMConstIntOfStringAndSize (node at line 573)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntOfStringAndSize"
		}"
		end

	llvmconst_sub (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstSub (node at line 595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSub"
		}"
		end

	llvmconst_real_of_string_and_size (a_real_ty: POINTER; a_text: POINTER; a_slen: NATURAL_32): POINTER is
 		-- LLVMConstRealOfStringAndSize (node at line 608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstRealOfStringAndSize"
		}"
		end

	llvmbuild_zext (an_argument_l623_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildZExt (node at line 622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildZExt"
		}"
		end

	llvmcreate_pass_manager: POINTER is
 		-- LLVMCreatePassManager (node at line 628)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreatePassManager()"
		}"
		end

	llvmopaque_type: POINTER is
 		-- LLVMOpaqueType (node at line 639)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMOpaqueType()"
		}"
		end

	llvmset_visibility (a_global: POINTER; a_viz: INTEGER) is
 		-- LLVMSetVisibility (node at line 657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetVisibility"
		}"
		end

	llvmconst_ptr_to_int (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstPtrToInt (node at line 665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstPtrToInt"
		}"
		end

	llvmbuild_zext_or_bit_cast (an_argument_l728_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildZExtOrBitCast (node at line 727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildZExtOrBitCast"
		}"
		end

	llvmdelete_type_name (a_m: POINTER; a_name: POINTER) is
 		-- LLVMDeleteTypeName (node at line 733)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteTypeName"
		}"
		end

	llvmconst_int_cast (a_constant_val: POINTER; a_to_type: POINTER; an_issigned: NATURAL_32): POINTER is
 		-- LLVMConstIntCast (node at line 737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntCast"
		}"
		end

	llvmbuild_sito_fp (an_argument_l746_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSIToFP (node at line 745)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSIToFP"
		}"
		end

	llvmget_basic_blocks (a_fn: POINTER; a_basic_blocks: POINTER) is
 		-- LLVMGetBasicBlocks (node at line 780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBasicBlocks"
		}"
		end

	llvmis_aconstant_struct (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantStruct (node at line 808)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantStruct"
		}"
		end

	llvmcreate_module_provider_for_existing_module (a_m: POINTER): POINTER is
 		-- LLVMCreateModuleProviderForExistingModule (node at line 811)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateModuleProviderForExistingModule"
		}"
		end

	llvmconst_fneg (a_constant_val: POINTER): POINTER is
 		-- LLVMConstFNeg (node at line 827)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFNeg"
		}"
		end

	llvmbuild_extract_element (an_argument_l841_c7: POINTER; a_vec_val: POINTER; an_index: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildExtractElement (node at line 840)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildExtractElement"
		}"
		end

	llvmget_value_name (a_val: POINTER): POINTER is
 		-- LLVMGetValueName (node at line 875)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetValueName"
		}"
		end

	llvminsert_into_builder (a_builder: POINTER; an_instr: POINTER) is
 		-- LLVMInsertIntoBuilder (node at line 905)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertIntoBuilder"
		}"
		end

	llvmvoid_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMVoidTypeInContext (node at line 917)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVoidTypeInContext"
		}"
		end

	llvmconst_sito_fp (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstSIToFP (node at line 924)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSIToFP"
		}"
		end

	llvmis_aterminator_inst (a_val: POINTER): POINTER is
 		-- LLVMIsATerminatorInst (node at line 968)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsATerminatorInst"
		}"
		end

	llvmbuild_invoke (an_argument_l972_c7: POINTER; a_fn: POINTER; an_args: POINTER; a_num_args: NATURAL_32; a_then_external: POINTER; a_catch: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildInvoke (node at line 971)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInvoke"
		}"
		end

	llvmadd_global (a_m: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAddGlobal (node at line 1018)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddGlobal"
		}"
		end

	llvmset_section (a_global: POINTER; a_section: POINTER) is
 		-- LLVMSetSection (node at line 1032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetSection"
		}"
		end

	llvmx_86fp_80type: POINTER is
 		-- LLVMX86FP80Type (node at line 1046)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMX86FP80Type()"
		}"
		end

	llvmget_previous_basic_block (a_bb: POINTER): POINTER is
 		-- LLVMGetPreviousBasicBlock (node at line 1100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousBasicBlock"
		}"
		end

	llvmconst_icmp (a_predicate: INTEGER; a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstICmp (node at line 1127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstICmp"
		}"
		end

	llvmcount_struct_element_types (a_struct_ty: POINTER): NATURAL_32 is
 		-- LLVMCountStructElementTypes (node at line 1159)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountStructElementTypes"
		}"
		end

	llvmget_previous_function (a_fn: POINTER): POINTER is
 		-- LLVMGetPreviousFunction (node at line 1190)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousFunction"
		}"
		end

	llvmconst_extract_value (an_agg_constant: POINTER; an_idx_list: POINTER; a_num_idx: NATURAL_32): POINTER is
 		-- LLVMConstExtractValue (node at line 1205)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstExtractValue"
		}"
		end

	llvmis_abranch_inst (a_val: POINTER): POINTER is
 		-- LLVMIsABranchInst (node at line 1220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABranchInst"
		}"
		end

	llvmadd_case (a_switch: POINTER; an_on_val: POINTER; a_dest: POINTER) is
 		-- LLVMAddCase (node at line 1226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddCase"
		}"
		end

	llvmis_aint_to_ptr_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAIntToPtrInst (node at line 1237)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAIntToPtrInst"
		}"
		end

	llvmbuild_array_malloc (an_argument_l1320_c7: POINTER; a_ty: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildArrayMalloc (node at line 1319)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildArrayMalloc"
		}"
		end

	llvmconst_trunc_or_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstTruncOrBitCast (node at line 1331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstTruncOrBitCast"
		}"
		end

	llvmis_aconstant (a_val: POINTER): POINTER is
 		-- LLVMIsAConstant (node at line 1372)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstant"
		}"
		end

	llvmbuild_extract_value (an_argument_l1387_c7: POINTER; an_agg_val: POINTER; an_index: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildExtractValue (node at line 1386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildExtractValue"
		}"
		end

	llvmsize_of (a_ty: POINTER): POINTER is
 		-- LLVMSizeOf (node at line 1404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSizeOf"
		}"
		end

	llvminsert_basic_block (an_insert_before_bb: POINTER; a_name: POINTER): POINTER is
 		-- LLVMInsertBasicBlock (node at line 1413)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertBasicBlock"
		}"
		end

	llvmbuild_global_string (a_b: POINTER; a_str: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildGlobalString (node at line 1426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildGlobalString"
		}"
		end

	llvmint_64type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt64TypeInContext (node at line 1445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt64TypeInContext"
		}"
		end

	llvmint_64type: POINTER is
 		-- LLVMInt64Type (node at line 1458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt64Type()"
		}"
		end

	llvmconst_pointer_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstPointerCast (node at line 1469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstPointerCast"
		}"
		end

	llvmis_adbg_region_end_inst (a_val: POINTER): POINTER is
 		-- LLVMIsADbgRegionEndInst (node at line 1501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsADbgRegionEndInst"
		}"
		end

	llvmget_previous_param (an_arg: POINTER): POINTER is
 		-- LLVMGetPreviousParam (node at line 1528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousParam"
		}"
		end

	llvmset_alignment (a_global: POINTER; a_bytes: NATURAL_32) is
 		-- LLVMSetAlignment (node at line 1540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetAlignment"
		}"
		end

	llvmbuild_ret (an_argument_l1545_c7: POINTER; a_v: POINTER): POINTER is
 		-- LLVMBuildRet (node at line 1544)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildRet"
		}"
		end

	llvmfunction_type (a_return_type: POINTER; a_param_types: POINTER; a_param_count: NATURAL_32; an_is_var_arg: INTEGER_32): POINTER is
 		-- LLVMFunctionType (node at line 1562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFunctionType"
		}"
		end

	llvmbuild_fcmp (an_argument_l1569_c7: POINTER; an_op: INTEGER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFCmp (node at line 1568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFCmp"
		}"
		end

	llvmbuild_trunc_or_bit_cast (an_argument_l1576_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildTruncOrBitCast (node at line 1575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildTruncOrBitCast"
		}"
		end

	llvmadd_function_attr (a_fn: POINTER; a_pa: INTEGER) is
 		-- LLVMAddFunctionAttr (node at line 1591)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddFunctionAttr"
		}"
		end

	llvmdispose_module (a_m: POINTER) is
 		-- LLVMDisposeModule (node at line 1622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeModule"
		}"
		end

	llvmget_basic_block_parent (a_bb: POINTER): POINTER is
 		-- LLVMGetBasicBlockParent (node at line 1645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBasicBlockParent"
		}"
		end

	llvmconst_fptrunc (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPTrunc (node at line 1652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPTrunc"
		}"
		end

	llvmconst_sext (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstSExt (node at line 1659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSExt"
		}"
		end

	llvmis_global_constant (a_global_var: POINTER): INTEGER_32 is
 		-- LLVMIsGlobalConstant (node at line 1727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsGlobalConstant"
		}"
		end

	llvmadd_function (a_m: POINTER; a_name: POINTER; a_function_ty: POINTER): POINTER is
 		-- LLVMAddFunction (node at line 1730)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddFunction"
		}"
		end

	llvmresolve_type_handle (a_type_handle: POINTER): POINTER is
 		-- LLVMResolveTypeHandle (node at line 1739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMResolveTypeHandle"
		}"
		end

	llvmget_type_kind (a_ty: POINTER): INTEGER is
 		-- LLVMGetTypeKind (node at line 1780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTypeKind"
		}"
		end

	llvmbuild_lshr (an_argument_l1849_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildLShr (node at line 1848)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildLShr"
		}"
		end

	llvmbuild_frem (an_argument_l1865_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFRem (node at line 1864)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFRem"
		}"
		end

	llvmis_ainstruction (a_val: POINTER): POINTER is
 		-- LLVMIsAInstruction (node at line 1880)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInstruction"
		}"
		end

	llvmbuild_store (an_argument_l1896_c7: POINTER; a_val: POINTER; a_ptr: POINTER): POINTER is
 		-- LLVMBuildStore (node at line 1895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildStore"
		}"
		end

	llvmdelete_function (a_fn: POINTER) is
 		-- LLVMDeleteFunction (node at line 1906)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteFunction"
		}"
		end

	llvmconst_mul (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstMul (node at line 1909)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstMul"
		}"
		end

	llvmget_next_function (a_fn: POINTER): POINTER is
 		-- LLVMGetNextFunction (node at line 1973)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextFunction"
		}"
		end

	llvmbuild_urem (an_argument_l2001_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildURem (node at line 2000)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildURem"
		}"
		end

	llvmbuild_aggregate_ret (an_argument_l2011_c7: POINTER; a_ret_vals: POINTER; a_n: NATURAL_32): POINTER is
 		-- LLVMBuildAggregateRet (node at line 2010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAggregateRet"
		}"
		end

	llvmget_instruction_call_conv (an_instr: POINTER): NATURAL_32 is
 		-- LLVMGetInstructionCallConv (node at line 2036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInstructionCallConv"
		}"
		end

	llvmrun_function_pass_manager (a_fpm: POINTER; a_f: POINTER): INTEGER_32 is
 		-- LLVMRunFunctionPassManager (node at line 2044)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunFunctionPassManager"
		}"
		end

	llvmbuild_shl (an_argument_l2052_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildShl (node at line 2051)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildShl"
		}"
		end

	llvmis_aextract_value_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAExtractValueInst (node at line 2095)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAExtractValueInst"
		}"
		end

	llvmget_entry_basic_block (a_fn: POINTER): POINTER is
 		-- LLVMGetEntryBasicBlock (node at line 2123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetEntryBasicBlock"
		}"
		end

	llvmremove_attribute (an_arg: POINTER; a_pa: INTEGER) is
 		-- LLVMRemoveAttribute (node at line 2126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveAttribute"
		}"
		end

	llvmppcfp_128type_in_context (a_c: POINTER): POINTER is
 		-- LLVMPPCFP128TypeInContext (node at line 2130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPPCFP128TypeInContext"
		}"
		end

	llvmis_aphinode (a_val: POINTER): POINTER is
 		-- LLVMIsAPHINode (node at line 2161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAPHINode"
		}"
		end

	llvmconst_real_of_string (a_real_ty: POINTER; a_text: POINTER): POINTER is
 		-- LLVMConstRealOfString (node at line 2196)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstRealOfString"
		}"
		end

	llvmconst_fpext (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPExt (node at line 2200)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPExt"
		}"
		end

	llvmget_next_global (a_global_var: POINTER): POINTER is
 		-- LLVMGetNextGlobal (node at line 2209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextGlobal"
		}"
		end

	llvmbuild_sub (an_argument_l2235_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSub (node at line 2234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSub"
		}"
		end

	llvmint_type_in_context (a_c: POINTER; a_num_bits: NATURAL_32): POINTER is
 		-- LLVMIntTypeInContext (node at line 2277)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIntTypeInContext"
		}"
		end

	llvmbuild_insert_element (an_argument_l2285_c7: POINTER; a_vec_val: POINTER; an_elt_val: POINTER; an_index: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildInsertElement (node at line 2284)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInsertElement"
		}"
		end

	llvmbuild_shuffle_vector (an_argument_l2293_c7: POINTER; a_v_1: POINTER; a_v_2: POINTER; a_mask: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildShuffleVector (node at line 2292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildShuffleVector"
		}"
		end

	llvmconst_fadd (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFAdd (node at line 2382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFAdd"
		}"
		end

	llvmcreate_type_handle (a_potentially_abstract_ty: POINTER): POINTER is
 		-- LLVMCreateTypeHandle (node at line 2394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateTypeHandle"
		}"
		end

	llvmconst_int_to_ptr (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstIntToPtr (node at line 2405)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntToPtr"
		}"
		end

	llvmadd_incoming (a_phi_node: POINTER; an_incoming_values: POINTER; an_incoming_blocks: POINTER; a_count: NATURAL_32) is
 		-- LLVMAddIncoming (node at line 2416)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddIncoming"
		}"
		end

	llvmdelete_global (a_global_var: POINTER) is
 		-- LLVMDeleteGlobal (node at line 2423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteGlobal"
		}"
		end

	llvmconst_urem (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstURem (node at line 2446)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstURem"
		}"
		end

	llvmbuild_int_cast (an_argument_l2454_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIntCast (node at line 2453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIntCast"
		}"
		end

	llvmmodule_create_with_name_in_context (a_module_id: POINTER; a_c: POINTER): POINTER is
 		-- LLVMModuleCreateWithNameInContext (node at line 2473)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMModuleCreateWithNameInContext"
		}"
		end

	llvmget_intrinsic_id (a_fn: POINTER): NATURAL_32 is
 		-- LLVMGetIntrinsicID (node at line 2477)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIntrinsicID"
		}"
		end

	llvmis_aconstant_array (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantArray (node at line 2496)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantArray"
		}"
		end

	llvmget_next_basic_block (a_bb: POINTER): POINTER is
 		-- LLVMGetNextBasicBlock (node at line 2532)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextBasicBlock"
		}"
		end

	llvmint_type (a_num_bits: NATURAL_32): POINTER is
 		-- LLVMIntType (node at line 2535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIntType"
		}"
		end

	llvmget_last_function (a_m: POINTER): POINTER is
 		-- LLVMGetLastFunction (node at line 2545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastFunction"
		}"
		end

	llvmis_aintrinsic_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAIntrinsicInst (node at line 2559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAIntrinsicInst"
		}"
		end

	llvmis_amem_cpy_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAMemCpyInst (node at line 2635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemCpyInst"
		}"
		end

	llvmis_azext_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAZExtInst (node at line 2638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAZExtInst"
		}"
		end

	llvmrun_pass_manager (a_pm: POINTER; a_m: POINTER): INTEGER_32 is
 		-- LLVMRunPassManager (node at line 2649)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunPassManager"
		}"
		end

	llvmconst_neg (a_constant_val: POINTER): POINTER is
 		-- LLVMConstNeg (node at line 2687)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNeg"
		}"
		end

	llvmconst_zext_or_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstZExtOrBitCast (node at line 2693)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstZExtOrBitCast"
		}"
		end

	llvmcontext_create: POINTER is
 		-- LLVMContextCreate (node at line 2698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMContextCreate()"
		}"
		end

	llvmvalue_is_basic_block (a_val: POINTER): INTEGER_32 is
 		-- LLVMValueIsBasicBlock (node at line 2706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMValueIsBasicBlock"
		}"
		end

	llvmconst_insert_value (an_agg_constant: POINTER; an_element_value_constant: POINTER; an_idx_list: POINTER; a_num_idx: NATURAL_32): POINTER is
 		-- LLVMConstInsertValue (node at line 2716)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInsertValue"
		}"
		end

	llvmdispose_pass_manager (a_pm: POINTER) is
 		-- LLVMDisposePassManager (node at line 2728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposePassManager"
		}"
		end

	llvmconst_fpto_si (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPToSI (node at line 2738)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPToSI"
		}"
		end

	llvmconst_fpto_ui (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPToUI (node at line 2756)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPToUI"
		}"
		end

	llvmdispose_message (a_message: POINTER) is
 		-- LLVMDisposeMessage (node at line 2769)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeMessage"
		}"
		end

	llvmbuild_bit_cast (an_argument_l2781_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildBitCast (node at line 2780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildBitCast"
		}"
		end

	llvmremove_function_attr (a_fn: POINTER; a_pa: INTEGER) is
 		-- LLVMRemoveFunctionAttr (node at line 2813)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveFunctionAttr"
		}"
		end

	llvmint_16type: POINTER is
 		-- LLVMInt16Type (node at line 2819)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt16Type()"
		}"
		end

	llvmconst_not (a_constant_val: POINTER): POINTER is
 		-- LLVMConstNot (node at line 2829)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNot"
		}"
		end

	llvmdelete_basic_block (a_bb: POINTER) is
 		-- LLVMDeleteBasicBlock (node at line 2853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteBasicBlock"
		}"
		end

	llvmset_data_layout (a_m: POINTER; a_triple: POINTER) is
 		-- LLVMSetDataLayout (node at line 2861)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetDataLayout"
		}"
		end

	llvmconst_real (a_real_ty: POINTER; a_n: REAL_64): POINTER is
 		-- LLVMConstReal (node at line 2869)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstReal"
		}"
		end

	llvmget_vector_size (a_vector_ty: POINTER): NATURAL_32 is
 		-- LLVMGetVectorSize (node at line 2874)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetVectorSize"
		}"
		end

	llvmis_afptrunc_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPTruncInst (node at line 2895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPTruncInst"
		}"
		end

	llvmconst_struct (a_constant_vals: POINTER; a_count: NATURAL_32; a_packed: INTEGER_32): POINTER is
 		-- LLVMConstStruct (node at line 2900)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstStruct"
		}"
		end

	llvmis_aget_element_ptr_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAGetElementPtrInst (node at line 2954)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGetElementPtrInst"
		}"
		end

	llvmis_tail_call (a_call_inst: POINTER): INTEGER_32 is
 		-- LLVMIsTailCall (node at line 3006)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsTailCall"
		}"
		end

	llvmget_last_global (a_m: POINTER): POINTER is
 		-- LLVMGetLastGlobal (node at line 3009)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastGlobal"
		}"
		end

	llvmadd_instr_attribute (an_instr: POINTER; an_index: NATURAL_32; an_argument_l3020_c7: INTEGER) is
 		-- LLVMAddInstrAttribute (node at line 3017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddInstrAttribute"
		}"
		end

	llvmconst_trunc (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstTrunc (node at line 3022)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstTrunc"
		}"
		end

	llvminsert_into_builder_with_name (a_builder: POINTER; an_instr: POINTER; a_name: POINTER) is
 		-- LLVMInsertIntoBuilderWithName (node at line 3038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertIntoBuilderWithName"
		}"
		end

	llvmis_aselect_inst (a_val: POINTER): POINTER is
 		-- LLVMIsASelectInst (node at line 3043)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASelectInst"
		}"
		end

	llvmis_amem_move_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAMemMoveInst (node at line 3047)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemMoveInst"
		}"
		end

	llvmfloat_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMFloatTypeInContext (node at line 3050)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFloatTypeInContext"
		}"
		end

	llvmint_16type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt16TypeInContext (node at line 3053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt16TypeInContext"
		}"
		end

	llvmis_amalloc_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAMallocInst (node at line 3073)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMallocInst"
		}"
		end

	llvmget_first_instruction (a_bb: POINTER): POINTER is
 		-- LLVMGetFirstInstruction (node at line 3079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstInstruction"
		}"
		end

	llvmset_target (a_m: POINTER; a_triple: POINTER) is
 		-- LLVMSetTarget (node at line 3082)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetTarget"
		}"
		end

	llvminsert_basic_block_in_context (a_c: POINTER; a_bb: POINTER; a_name: POINTER): POINTER is
 		-- LLVMInsertBasicBlockInContext (node at line 3106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertBasicBlockInContext"
		}"
		end

	llvmconst_or (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstOr (node at line 3111)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstOr"
		}"
		end

	llvmconst_udiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstUDiv (node at line 3115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstUDiv"
		}"
		end

	llvmbuild_in_bounds_gep (a_b: POINTER; a_pointer: POINTER; an_indices: POINTER; a_num_indices: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildInBoundsGEP (node at line 3119)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInBoundsGEP"
		}"
		end

	llvmis_ainvoke_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAInvokeInst (node at line 3132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInvokeInst"
		}"
		end

	llvmbuild_fsub (an_argument_l3136_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFSub (node at line 3135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFSub"
		}"
		end

	llvmis_amem_set_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAMemSetInst (node at line 3141)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemSetInst"
		}"
		end

	llvmarray_type (an_element_type: POINTER; an_element_count: NATURAL_32): POINTER is
 		-- LLVMArrayType (node at line 3146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMArrayType"
		}"
		end

	llvmget_first_basic_block (a_fn: POINTER): POINTER is
 		-- LLVMGetFirstBasicBlock (node at line 3159)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstBasicBlock"
		}"
		end

	llvmcreate_builder: POINTER is
 		-- LLVMCreateBuilder (node at line 3178)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateBuilder()"
		}"
		end

	llvmset_instruction_call_conv (an_instr: POINTER; a_cc: NATURAL_32) is
 		-- LLVMSetInstructionCallConv (node at line 3207)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInstructionCallConv"
		}"
		end

	llvmbuild_ptr_to_int (an_argument_l3217_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPtrToInt (node at line 3216)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPtrToInt"
		}"
		end

	llvmclear_insertion_position (a_builder: POINTER) is
 		-- LLVMClearInsertionPosition (node at line 3303)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMClearInsertionPosition"
		}"
		end

	llvmget_insert_block (a_builder: POINTER): POINTER is
 		-- LLVMGetInsertBlock (node at line 3325)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInsertBlock"
		}"
		end

	llvmbuild_fpto_si (an_argument_l3352_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPToSI (node at line 3351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPToSI"
		}"
		end

	llvmtype_of (a_val: POINTER): POINTER is
 		-- LLVMTypeOf (node at line 3365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMTypeOf"
		}"
		end

	llvmget_last_instruction (a_bb: POINTER): POINTER is
 		-- LLVMGetLastInstruction (node at line 3381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastInstruction"
		}"
		end

	llvmbuild_fpto_ui (an_argument_l3760_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPToUI (node at line 3759)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPToUI"
		}"
		end

	llvmx_86fp_80type_in_context (a_c: POINTER): POINTER is
 		-- LLVMX86FP80TypeInContext (node at line 4120)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMX86FP80TypeInContext"
		}"
		end

	llvmget_data_layout (a_m: POINTER): POINTER is
 		-- LLVMGetDataLayout (node at line 4167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetDataLayout"
		}"
		end

	llvmbuild_mul (an_argument_l4277_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildMul (node at line 4276)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildMul"
		}"
		end

	llvmdispose_builder (a_builder: POINTER) is
 		-- LLVMDisposeBuilder (node at line 4286)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeBuilder"
		}"
		end

	llvmconst_fpcast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPCast (node at line 4300)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPCast"
		}"
		end

	llvmconst_zext (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstZExt (node at line 4304)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstZExt"
		}"
		end

	llvmstruct_type (an_element_types: POINTER; an_element_count: NATURAL_32; a_packed: INTEGER_32): POINTER is
 		-- LLVMStructType (node at line 4318)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStructType"
		}"
		end

	llvmbuild_uito_fp (an_argument_l4332_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildUIToFP (node at line 4331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildUIToFP"
		}"
		end

	llvmget_global_context: POINTER is
 		-- LLVMGetGlobalContext (node at line 4341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetGlobalContext()"
		}"
		end

	llvmget_first_param (a_fn: POINTER): POINTER is
 		-- LLVMGetFirstParam (node at line 4346)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstParam"
		}"
		end

	llvmget_param_parent (an_inst: POINTER): POINTER is
 		-- LLVMGetParamParent (node at line 4365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParamParent"
		}"
		end

	llvmis_adbg_stop_point_inst (a_val: POINTER): POINTER is
 		-- LLVMIsADbgStopPointInst (node at line 4369)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsADbgStopPointInst"
		}"
		end

	llvmget_param_types (a_function_ty: POINTER; a_dest: POINTER) is
 		-- LLVMGetParamTypes (node at line 4391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParamTypes"
		}"
		end

	llvmdispose_module_provider (a_mp: POINTER) is
 		-- LLVMDisposeModuleProvider (node at line 4399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeModuleProvider"
		}"
		end

	llvmbuild_ashr (an_argument_l4442_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAShr (node at line 4441)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAShr"
		}"
		end

	llvmalign_of (a_ty: POINTER): POINTER is
 		-- LLVMAlignOf (node at line 4447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAlignOf"
		}"
		end

	llvmconst_uito_fp (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstUIToFP (node at line 4465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstUIToFP"
		}"
		end

	llvmget_instruction_parent (an_inst: POINTER): POINTER is
 		-- LLVMGetInstructionParent (node at line 4491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInstructionParent"
		}"
		end

	llvmlabel_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMLabelTypeInContext (node at line 4498)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMLabelTypeInContext"
		}"
		end

	llvminitialize_function_pass_manager (a_fpm: POINTER): INTEGER_32 is
 		-- LLVMInitializeFunctionPassManager (node at line 4515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeFunctionPassManager"
		}"
		end

	llvmmodule_create_with_name (a_module_id: POINTER): POINTER is
 		-- LLVMModuleCreateWithName (node at line 4518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMModuleCreateWithName"
		}"
		end

	llvmget_last_param (a_fn: POINTER): POINTER is
 		-- LLVMGetLastParam (node at line 4527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastParam"
		}"
		end

	llvmis_aptr_to_int_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAPtrToIntInst (node at line 4554)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAPtrToIntInst"
		}"
		end

	llvmis_adbg_func_start_inst (a_val: POINTER): POINTER is
 		-- LLVMIsADbgFuncStartInst (node at line 4557)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsADbgFuncStartInst"
		}"
		end

	llvmget_next_instruction (an_inst: POINTER): POINTER is
 		-- LLVMGetNextInstruction (node at line 4579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextInstruction"
		}"
		end

	llvmint_32type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt32TypeInContext (node at line 4645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt32TypeInContext"
		}"
		end

	llvmis_aicmp_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAICmpInst (node at line 4658)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAICmpInst"
		}"
		end

	llvmcreate_memory_buffer_with_stdin (an_out_mem_buf: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMCreateMemoryBufferWithSTDIN (node at line 4672)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateMemoryBufferWithSTDIN"
		}"
		end

	llvmget_previous_global (a_global_var: POINTER): POINTER is
 		-- LLVMGetPreviousGlobal (node at line 4676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousGlobal"
		}"
		end

	llvmconst_inline_asm (a_ty: POINTER; an_asm_string: POINTER; a_constraints: POINTER; a_has_side_effects: INTEGER_32): POINTER is
 		-- LLVMConstInlineAsm (node at line 4697)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInlineAsm"
		}"
		end

	llvmget_int_type_width (an_integer_ty: POINTER): NATURAL_32 is
 		-- LLVMGetIntTypeWidth (node at line 4732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIntTypeWidth"
		}"
		end

	llvmset_gc (a_fn: POINTER; a_name: POINTER) is
 		-- LLVMSetGC (node at line 4745)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetGC"
		}"
		end

	llvmget_visibility (a_global: POINTER): INTEGER is
 		-- LLVMGetVisibility (node at line 4771)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetVisibility"
		}"
		end

	llvmbuild_gep (a_b: POINTER; a_pointer: POINTER; an_indices: POINTER; a_num_indices: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildGEP (node at line 4793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildGEP"
		}"
		end

	llvmbuild_fpext (an_argument_l4854_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPExt (node at line 4853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPExt"
		}"
		end

	llvmbuild_fpcast (an_argument_l4865_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPCast (node at line 4864)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPCast"
		}"
		end

	llvmdouble_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMDoubleTypeInContext (node at line 4881)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDoubleTypeInContext"
		}"
		end

	llvmbuild_srem (an_argument_l4931_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSRem (node at line 4930)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSRem"
		}"
		end

	llvmis_acast_inst (a_val: POINTER): POINTER is
 		-- LLVMIsACastInst (node at line 4937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsACastInst"
		}"
		end

	llvmconst_insert_element (a_vector_constant: POINTER; an_element_value_constant: POINTER; an_index_constant: POINTER): POINTER is
 		-- LLVMConstInsertElement (node at line 4965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInsertElement"
		}"
		end

	llvmis_aglobal_variable (a_val: POINTER): POINTER is
 		-- LLVMIsAGlobalVariable (node at line 4970)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGlobalVariable"
		}"
		end

	llvmconst_shuffle_vector (a_vector_aconstant: POINTER; a_vector_bconstant: POINTER; a_mask_constant: POINTER): POINTER is
 		-- LLVMConstShuffleVector (node at line 4973)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstShuffleVector"
		}"
		end

	llvmconst_add (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstAdd (node at line 4989)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAdd"
		}"
		end

	llvmstruct_type_in_context (a_c: POINTER; an_element_types: POINTER; an_element_count: NATURAL_32; a_packed: INTEGER_32): POINTER is
 		-- LLVMStructTypeInContext (node at line 4993)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStructTypeInContext"
		}"
		end

	llvmbuild_neg (an_argument_l5005_c7: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNeg (node at line 5004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNeg"
		}"
		end

	llvmget_function_call_conv (a_fn: POINTER): NATURAL_32 is
 		-- LLVMGetFunctionCallConv (node at line 5043)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFunctionCallConv"
		}"
		end

	llvmget_first_global (a_m: POINTER): POINTER is
 		-- LLVMGetFirstGlobal (node at line 5059)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstGlobal"
		}"
		end

	llvmconst_all_ones (a_ty: POINTER): POINTER is
 		-- LLVMConstAllOnes (node at line 5062)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAllOnes"
		}"
		end

	llvmposition_builder_before (a_builder: POINTER; an_instr: POINTER) is
 		-- LLVMPositionBuilderBefore (node at line 5069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPositionBuilderBefore"
		}"
		end

	llvmbuild_insert_value (an_argument_l5080_c7: POINTER; an_agg_val: POINTER; an_elt_val: POINTER; an_index: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildInsertValue (node at line 5079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInsertValue"
		}"
		end

	llvmis_avaarg_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAVAArgInst (node at line 5091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAVAArgInst"
		}"
		end

	llvmbuild_fmul (an_argument_l5132_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFMul (node at line 5131)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFMul"
		}"
		end

	llvmconst_and (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstAnd (node at line 5138)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAnd"
		}"
		end

	llvmdump_value (a_val: POINTER) is
 		-- LLVMDumpValue (node at line 5142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDumpValue"
		}"
		end

	llvmbuild_malloc (an_argument_l5146_c7: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildMalloc (node at line 5145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildMalloc"
		}"
		end

	llvmget_incoming_value (a_phi_node: POINTER; an_index: NATURAL_32): POINTER is
 		-- LLVMGetIncomingValue (node at line 5171)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIncomingValue"
		}"
		end

	llvmis_aundef_value (a_val: POINTER): POINTER is
 		-- LLVMIsAUndefValue (node at line 5211)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUndefValue"
		}"
		end

	llvmis_areturn_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAReturnInst (node at line 5224)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAReturnInst"
		}"
		end

	llvmconst_exact_sdiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstExactSDiv (node at line 5227)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstExactSDiv"
		}"
		end

	llvmconst_fcmp (a_predicate: INTEGER; a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFCmp (node at line 5237)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFCmp"
		}"
		end

	llvmis_aargument (a_val: POINTER): POINTER is
 		-- LLVMIsAArgument (node at line 5286)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAArgument"
		}"
		end

	llvmget_global_parent (a_global: POINTER): POINTER is
 		-- LLVMGetGlobalParent (node at line 5289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetGlobalParent"
		}"
		end

	llvmget_next_param (an_arg: POINTER): POINTER is
 		-- LLVMGetNextParam (node at line 5310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextParam"
		}"
		end

	llvmbuild_switch (an_argument_l5332_c7: POINTER; a_v: POINTER; an_else_external: POINTER; a_num_cases: NATURAL_32): POINTER is
 		-- LLVMBuildSwitch (node at line 5331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSwitch"
		}"
		end

	llvmint_32type: POINTER is
 		-- LLVMInt32Type (node at line 5345)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt32Type()"
		}"
		end

	llvmis_constant (a_val: POINTER): INTEGER_32 is
 		-- LLVMIsConstant (node at line 5351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsConstant"
		}"
		end

	llvmis_ainsert_element_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAInsertElementInst (node at line 5367)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInsertElementInst"
		}"
		end

	llvmvoid_type: POINTER is
 		-- LLVMVoidType (node at line 5374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVoidType()"
		}"
		end

	llvmget_alignment (a_global: POINTER): NATURAL_32 is
 		-- LLVMGetAlignment (node at line 5385)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetAlignment"
		}"
		end

	llvmbuild_free (an_argument_l5410_c7: POINTER; a_pointer_val: POINTER): POINTER is
 		-- LLVMBuildFree (node at line 5409)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFree"
		}"
		end

	llvmis_function_var_arg (a_function_ty: POINTER): INTEGER_32 is
 		-- LLVMIsFunctionVarArg (node at line 5413)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsFunctionVarArg"
		}"
		end

	llvmbuild_sext_or_bit_cast (an_argument_l5417_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSExtOrBitCast (node at line 5416)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSExtOrBitCast"
		}"
		end

	llvmis_astore_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAStoreInst (node at line 5479)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAStoreInst"
		}"
		end

	llvmget_param (a_fn: POINTER; an_index: NATURAL_32): POINTER is
 		-- LLVMGetParam (node at line 5491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParam"
		}"
		end

	llvmcreate_builder_in_context (a_c: POINTER): POINTER is
 		-- LLVMCreateBuilderInContext (node at line 5503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateBuilderInContext"
		}"
		end

	llvmconst_frem (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFRem (node at line 5506)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFRem"
		}"
		end

	llvmget_type_by_name (a_m: POINTER; a_name: POINTER): POINTER is
 		-- LLVMGetTypeByName (node at line 5548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTypeByName"
		}"
		end

	llvmget_undef (a_ty: POINTER): POINTER is
 		-- LLVMGetUndef (node at line 5585)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetUndef"
		}"
		end

	llvmis_aallocation_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAAllocationInst (node at line 5598)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAAllocationInst"
		}"
		end

	llvmbuild_sdiv (an_argument_l5602_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSDiv (node at line 5601)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSDiv"
		}"
		end

	llvmconst_array (an_element_ty: POINTER; a_constant_vals: POINTER; a_length: NATURAL_32): POINTER is
 		-- LLVMConstArray (node at line 5610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstArray"
		}"
		end

	llvmfinalize_function_pass_manager (a_fpm: POINTER): INTEGER_32 is
 		-- LLVMFinalizeFunctionPassManager (node at line 5616)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFinalizeFunctionPassManager"
		}"
		end

	llvmcontext_dispose (a_c: POINTER) is
 		-- LLVMContextDispose (node at line 5619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMContextDispose"
		}"
		end

	llvmdump_module (a_m: POINTER) is
 		-- LLVMDumpModule (node at line 5628)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDumpModule"
		}"
		end

	llvmis_aextract_element_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAExtractElementInst (node at line 5634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAExtractElementInst"
		}"
		end

	llvmfp_128type_in_context (a_c: POINTER): POINTER is
 		-- LLVMFP128TypeInContext (node at line 5637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFP128TypeInContext"
		}"
		end

	llvmget_initializer (a_global_var: POINTER): POINTER is
 		-- LLVMGetInitializer (node at line 5651)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInitializer"
		}"
		end

	llvmis_aconstant_vector (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantVector (node at line 5657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantVector"
		}"
		end

	llvmbuild_int_to_ptr (an_argument_l5679_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIntToPtr (node at line 5678)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIntToPtr"
		}"
		end

	llvmbuild_trunc (an_argument_l5707_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildTrunc (node at line 5706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildTrunc"
		}"
		end

	llvmget_incoming_block (a_phi_node: POINTER; an_index: NATURAL_32): POINTER is
 		-- LLVMGetIncomingBlock (node at line 5713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIncomingBlock"
		}"
		end

	llvmconst_select (a_constant_condition: POINTER; a_constant_if_true: POINTER; a_constant_if_false: POINTER): POINTER is
 		-- LLVMConstSelect (node at line 5717)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSelect"
		}"
		end

	llvmbuild_br (an_argument_l5731_c7: POINTER; a_dest: POINTER): POINTER is
 		-- LLVMBuildBr (node at line 5730)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildBr"
		}"
		end

	llvmcount_basic_blocks (a_fn: POINTER): NATURAL_32 is
 		-- LLVMCountBasicBlocks (node at line 5767)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountBasicBlocks"
		}"
		end

	llvmbuild_fdiv (an_argument_l5795_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFDiv (node at line 5794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFDiv"
		}"
		end

	llvmconst_int (an_int_ty: POINTER; a_n: NATURAL_64; a_sign_extend: INTEGER_32): POINTER is
 		-- LLVMConstInt (node at line 5818)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInt"
		}"
		end

	llvmbuild_array_alloca (an_argument_l5831_c7: POINTER; a_ty: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildArrayAlloca (node at line 5830)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildArrayAlloca"
		}"
		end

	llvmis_acmp_inst (a_val: POINTER): POINTER is
 		-- LLVMIsACmpInst (node at line 5882)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsACmpInst"
		}"
		end

	llvmbuild_or (an_argument_l5886_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildOr (node at line 5885)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildOr"
		}"
		end

	llvmis_aunwind_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAUnwindInst (node at line 5907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUnwindInst"
		}"
		end

	llvmrefine_type (an_abstract_ty: POINTER; a_concrete_ty: POINTER) is
 		-- LLVMRefineType (node at line 5920)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRefineType"
		}"
		end

	llvmget_previous_instruction (an_inst: POINTER): POINTER is
 		-- LLVMGetPreviousInstruction (node at line 5935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousInstruction"
		}"
		end

	llvmbuild_ptr_diff (an_argument_l5954_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPtrDiff (node at line 5953)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPtrDiff"
		}"
		end

	llvmint_8type: POINTER is
 		-- LLVMInt8Type (node at line 5963)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt8Type()"
		}"
		end

	llvmopaque_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMOpaqueTypeInContext (node at line 5987)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMOpaqueTypeInContext"
		}"
		end

	llvmget_first_function (a_m: POINTER): POINTER is
 		-- LLVMGetFirstFunction (node at line 6032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstFunction"
		}"
		end

	llvmdispose_type_handle (a_type_handle: POINTER) is
 		-- LLVMDisposeTypeHandle (node at line 6038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeTypeHandle"
		}"
		end

	llvmis_null (a_val: POINTER): INTEGER_32 is
 		-- LLVMIsNull (node at line 6074)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsNull"
		}"
		end

	llvmis_aglobal_value (a_val: POINTER): POINTER is
 		-- LLVMIsAGlobalValue (node at line 6078)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGlobalValue"
		}"
		end

	llvmbuild_vaarg (an_argument_l6090_c7: POINTER; a_list: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildVAArg (node at line 6089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildVAArg"
		}"
		end

	llvmbasic_block_as_value (a_bb: POINTER): POINTER is
 		-- LLVMBasicBlockAsValue (node at line 6104)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBasicBlockAsValue"
		}"
		end

	llvmconst_fdiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFDiv (node at line 6115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFDiv"
		}"
		end

	llvmbuild_not (an_argument_l6153_c7: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNot (node at line 6152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNot"
		}"
		end

	llvmconst_in_bounds_gep (a_constant_val: POINTER; a_constant_indices: POINTER; a_num_indices: NATURAL_32): POINTER is
 		-- LLVMConstInBoundsGEP (node at line 6162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInBoundsGEP"
		}"
		end

	llvmbuild_icmp (an_argument_l6168_c7: POINTER; an_op: INTEGER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildICmp (node at line 6167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildICmp"
		}"
		end

	llvmcreate_function_pass_manager (a_mp: POINTER): POINTER is
 		-- LLVMCreateFunctionPassManager (node at line 6174)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateFunctionPassManager"
		}"
		end

	llvmconst_xor (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstXor (node at line 6189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstXor"
		}"
		end

	llvmget_struct_element_types (a_struct_ty: POINTER; a_dest: POINTER) is
 		-- LLVMGetStructElementTypes (node at line 6244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetStructElementTypes"
		}"
		end

	llvmis_adbg_declare_inst (a_val: POINTER): POINTER is
 		-- LLVMIsADbgDeclareInst (node at line 6248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsADbgDeclareInst"
		}"
		end

	llvmset_instr_param_alignment (an_instr: POINTER; an_index: NATURAL_32; an_align: NATURAL_32) is
 		-- LLVMSetInstrParamAlignment (node at line 6251)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInstrParamAlignment"
		}"
		end

	llvmbuild_select (an_argument_l6262_c7: POINTER; an_if_external: POINTER; a_then_external: POINTER; an_else_external: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSelect (node at line 6261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSelect"
		}"
		end

	llvmconst_string (a_str: POINTER; a_length: NATURAL_32; a_dont_null_terminate: INTEGER_32): POINTER is
 		-- LLVMConstString (node at line 6319)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstString"
		}"
		end

	llvmbuild_global_string_ptr (a_b: POINTER; a_str: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildGlobalStringPtr (node at line 6331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildGlobalStringPtr"
		}"
		end

	llvmbuild_cond_br (an_argument_l6354_c7: POINTER; an_if_external: POINTER; a_then_external: POINTER; an_else_external: POINTER): POINTER is
 		-- LLVMBuildCondBr (node at line 6353)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildCondBr"
		}"
		end

	llvmis_auser (a_val: POINTER): POINTER is
 		-- LLVMIsAUser (node at line 6377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUser"
		}"
		end

	llvmbuild_call (an_argument_l6434_c7: POINTER; a_fn: POINTER; an_args: POINTER; a_num_args: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildCall (node at line 6433)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildCall"
		}"
		end

	llvmset_value_name (a_val: POINTER; a_name: POINTER) is
 		-- LLVMSetValueName (node at line 6448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetValueName"
		}"
		end

	llvmdouble_type: POINTER is
 		-- LLVMDoubleType (node at line 6477)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDoubleType()"
		}"
		end

	llvmconst_vector (a_scalar_constant_vals: POINTER; a_size: NATURAL_32): POINTER is
 		-- LLVMConstVector (node at line 6490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstVector"
		}"
		end

	llvmbuild_add (an_argument_l6500_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAdd (node at line 6499)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAdd"
		}"
		end

	llvmppcfp_128type: POINTER is
 		-- LLVMPPCFP128Type (node at line 6543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPPCFP128Type()"
		}"
		end

	llvmis_afcmp_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAFCmpInst (node at line 6555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFCmpInst"
		}"
		end

	llvmis_ainline_asm (a_val: POINTER): POINTER is
 		-- LLVMIsAInlineAsm (node at line 6595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInlineAsm"
		}"
		end

	llvmset_param_alignment (an_arg: POINTER; an_align: NATURAL_32) is
 		-- LLVMSetParamAlignment (node at line 6601)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetParamAlignment"
		}"
		end

	llvmbuild_and (an_argument_l6620_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAnd (node at line 6619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAnd"
		}"
		end

	llvmconst_shl (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstShl (node at line 6653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstShl"
		}"
		end

	llvmget_linkage (a_global: POINTER): INTEGER is
 		-- LLVMGetLinkage (node at line 6660)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLinkage"
		}"
		end

	llvmconst_fsub (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFSub (node at line 6663)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFSub"
		}"
		end

	llvmadd_attribute (an_arg: POINTER; a_pa: INTEGER) is
 		-- LLVMAddAttribute (node at line 6709)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddAttribute"
		}"
		end

	llvmbuild_sext (an_argument_l6731_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSExt (node at line 6730)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSExt"
		}"
		end

	llvmset_thread_local (a_global_var: POINTER; an_is_thread_local: INTEGER_32) is
 		-- LLVMSetThreadLocal (node at line 6741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetThreadLocal"
		}"
		end

	llvmget_pointer_address_space (a_pointer_ty: POINTER): NATURAL_32 is
 		-- LLVMGetPointerAddressSpace (node at line 6748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPointerAddressSpace"
		}"
		end

	llvmis_afree_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAFreeInst (node at line 6759)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFreeInst"
		}"
		end

	llvmis_aunary_instruction (a_val: POINTER): POINTER is
 		-- LLVMIsAUnaryInstruction (node at line 6782)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUnaryInstruction"
		}"
		end

	llvmis_aconstant_fp (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantFP (node at line 6797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantFP"
		}"
		end

	llvmdispose_memory_buffer (a_mem_buf: POINTER) is
 		-- LLVMDisposeMemoryBuffer (node at line 6800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeMemoryBuffer"
		}"
		end

	llvmpointer_type (an_element_type: POINTER; an_address_space: NATURAL_32): POINTER is
 		-- LLVMPointerType (node at line 6809)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPointerType"
		}"
		end

	llvmconst_int_of_string (an_int_ty: POINTER; a_text: POINTER; a_radix: CHARACTER): POINTER is
 		-- LLVMConstIntOfString (node at line 6820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntOfString"
		}"
		end

	llvmget_type_context (a_ty: POINTER): POINTER is
 		-- LLVMGetTypeContext (node at line 6893)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTypeContext"
		}"
		end

	llvmbuild_is_not_null (an_argument_l6916_c7: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIsNotNull (node at line 6915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIsNotNull"
		}"
		end

	llvmbuild_ret_void (an_argument_l6942_c7: POINTER): POINTER is
 		-- LLVMBuildRetVoid (node at line 6941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildRetVoid"
		}"
		end

	llvmbuild_phi (an_argument_l6960_c7: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPhi (node at line 6959)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPhi"
		}"
		end

	llvmconst_lshr (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstLShr (node at line 6989)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstLShr"
		}"
		end

	llvmis_abinary_operator (a_val: POINTER): POINTER is
 		-- LLVMIsABinaryOperator (node at line 7001)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABinaryOperator"
		}"
		end

	llvmis_amem_intrinsic (a_val: POINTER): POINTER is
 		-- LLVMIsAMemIntrinsic (node at line 7004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemIntrinsic"
		}"
		end

	llvmis_afunction (a_val: POINTER): POINTER is
 		-- LLVMIsAFunction (node at line 7010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFunction"
		}"
		end

	llvmset_global_constant (a_global_var: POINTER; an_is_constant: INTEGER_32) is
 		-- LLVMSetGlobalConstant (node at line 7016)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetGlobalConstant"
		}"
		end

	llvmbuild_pointer_cast (an_argument_l7021_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPointerCast (node at line 7020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPointerCast"
		}"
		end

	llvmis_aunreachable_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAUnreachableInst (node at line 7044)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUnreachableInst"
		}"
		end

	llvmconst_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstBitCast (node at line 7075)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstBitCast"
		}"
		end

	llvmis_adbg_info_intrinsic (a_val: POINTER): POINTER is
 		-- LLVMIsADbgInfoIntrinsic (node at line 7080)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsADbgInfoIntrinsic"
		}"
		end

	llvmfloat_type: POINTER is
 		-- LLVMFloatType (node at line 7099)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFloatType()"
		}"
		end

	llvmget_last_basic_block (a_fn: POINTER): POINTER is
 		-- LLVMGetLastBasicBlock (node at line 7109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastBasicBlock"
		}"
		end

	llvmis_ainsert_value_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAInsertValueInst (node at line 7112)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInsertValueInst"
		}"
		end

	llvmconst_null (a_ty: POINTER): POINTER is
 		-- LLVMConstNull (node at line 7130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNull"
		}"
		end

	llvmconst_pointer_null (a_ty: POINTER): POINTER is
 		-- LLVMConstPointerNull (node at line 7136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstPointerNull"
		}"
		end

	llvmis_aload_inst (a_val: POINTER): POINTER is
 		-- LLVMIsALoadInst (node at line 7168)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsALoadInst"
		}"
		end

	llvmposition_builder_at_end (a_builder: POINTER; a_block: POINTER) is
 		-- LLVMPositionBuilderAtEnd (node at line 7225)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPositionBuilderAtEnd"
		}"
		end

	llvmconst_ashr (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstAShr (node at line 7231)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAShr"
		}"
		end

	llvmis_aalloca_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAAllocaInst (node at line 7264)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAAllocaInst"
		}"
		end

	llvmconst_sext_or_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstSExtOrBitCast (node at line 7267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSExtOrBitCast"
		}"
		end

	llvmint_8type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt8TypeInContext (node at line 7271)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt8TypeInContext"
		}"
		end

	llvmappend_basic_block (a_fn: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAppendBasicBlock (node at line 7293)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAppendBasicBlock"
		}"
		end

	llvmis_auito_fpinst (a_val: POINTER): POINTER is
 		-- LLVMIsAUIToFPInst (node at line 7301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUIToFPInst"
		}"
		end

	llvmconst_nswadd (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNSWAdd (node at line 7328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNSWAdd"
		}"
		end

	llvmconst_gep (a_constant_val: POINTER; a_constant_indices: POINTER; a_num_indices: NATURAL_32): POINTER is
 		-- LLVMConstGEP (node at line 7387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstGEP"
		}"
		end

	llvmis_declaration (a_global: POINTER): INTEGER_32 is
 		-- LLVMIsDeclaration (node at line 7401)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsDeclaration"
		}"
		end

	llvmbuild_struct_gep (a_b: POINTER; a_pointer: POINTER; an_idx: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildStructGEP (node at line 7404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildStructGEP"
		}"
		end

	llvmconst_string_in_context (a_c: POINTER; a_str: POINTER; a_length: NATURAL_32; a_dont_null_terminate: INTEGER_32): POINTER is
 		-- LLVMConstStringInContext (node at line 7417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstStringInContext"
		}"
		end

	llvmis_afpext_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPExtInst (node at line 7431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPExtInst"
		}"
		end

	llvmbuild_fadd (an_argument_l7444_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFAdd (node at line 7443)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFAdd"
		}"
		end

	llvmis_aehselector_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAEHSelectorInst (node at line 7461)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAEHSelectorInst"
		}"
		end

	llvmposition_builder (a_builder: POINTER; a_block: POINTER; an_instr: POINTER) is
 		-- LLVMPositionBuilder (node at line 7464)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPositionBuilder"
		}"
		end

	llvmbuild_fptrunc (an_argument_l7501_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPTrunc (node at line 7500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPTrunc"
		}"
		end

	llvmlabel_type: POINTER is
 		-- LLVMLabelType (node at line 7506)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMLabelType()"
		}"
		end

	llvmis_adbg_region_start_inst (a_val: POINTER): POINTER is
 		-- LLVMIsADbgRegionStartInst (node at line 7507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsADbgRegionStartInst"
		}"
		end

	llvmis_afpto_siinst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPToSIInst (node at line 7510)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPToSIInst"
		}"
		end

	llvmcount_incoming (a_phi_node: POINTER): NATURAL_32 is
 		-- LLVMCountIncoming (node at line 7535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountIncoming"
		}"
		end

	llvmappend_basic_block_in_context (a_c: POINTER; a_fn: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAppendBasicBlockInContext (node at line 7560)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAppendBasicBlockInContext"
		}"
		end

	llvmint_1type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt1TypeInContext (node at line 7565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt1TypeInContext"
		}"
		end

	llvmget_target (a_m: POINTER): POINTER is
 		-- LLVMGetTarget (node at line 7579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTarget"
		}"
		end

	llvmget_named_function (a_m: POINTER; a_name: POINTER): POINTER is
 		-- LLVMGetNamedFunction (node at line 7608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNamedFunction"
		}"
		end

	llvmis_undef (a_val: POINTER): INTEGER_32 is
 		-- LLVMIsUndef (node at line 7616)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsUndef"
		}"
		end

	llvmadd_alias (a_m: POINTER; a_ty: POINTER; an_aliasee: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAddAlias (node at line 7627)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddAlias"
		}"
		end

	llvmset_initializer (a_global_var: POINTER; a_constant_val: POINTER) is
 		-- LLVMSetInitializer (node at line 7633)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInitializer"
		}"
		end

	llvmget_section (a_global: POINTER): POINTER is
 		-- LLVMGetSection (node at line 7679)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetSection"
		}"
		end

	llvmbuild_exact_sdiv (an_argument_l7723_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildExactSDiv (node at line 7722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildExactSDiv"
		}"
		end

	llvmcount_params (a_fn: POINTER): NATURAL_32 is
 		-- LLVMCountParams (node at line 7740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountParams"
		}"
		end

	llvmset_function_call_conv (a_fn: POINTER; a_cc: NATURAL_32) is
 		-- LLVMSetFunctionCallConv (node at line 7750)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetFunctionCallConv"
		}"
		end

	llvmbuild_xor (an_argument_l7755_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildXor (node at line 7754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildXor"
		}"
		end

	llvmconst_srem (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstSRem (node at line 7767)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSRem"
		}"
		end

	llvmint_1type: POINTER is
 		-- LLVMInt1Type (node at line 7776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt1Type()"
		}"
		end

	llvmvector_type (an_element_type: POINTER; an_element_count: NATURAL_32): POINTER is
 		-- LLVMVectorType (node at line 7784)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVectorType"
		}"
		end

	llvmget_params (a_fn: POINTER; a_params: POINTER) is
 		-- LLVMGetParams (node at line 7803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParams"
		}"
		end

	llvmis_aconstant_int (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantInt (node at line 7830)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantInt"
		}"
		end

	llvmis_aconstant_aggregate_zero (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantAggregateZero (node at line 7857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantAggregateZero"
		}"
		end

	llvmget_gc (a_fn: POINTER): POINTER is
 		-- LLVMGetGC (node at line 7860)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetGC"
		}"
		end

	llvmset_linkage (a_global: POINTER; a_linkage: INTEGER) is
 		-- LLVMSetLinkage (node at line 7883)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetLinkage"
		}"
		end

	llvmis_aswitch_inst (a_val: POINTER): POINTER is
 		-- LLVMIsASwitchInst (node at line 7911)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASwitchInst"
		}"
		end

	llvmis_aconstant_expr (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantExpr (node at line 7918)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantExpr"
		}"
		end

	llvmis_asext_inst (a_val: POINTER): POINTER is
 		-- LLVMIsASExtInst (node at line 7929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASExtInst"
		}"
		end

	llvmget_return_type (a_function_ty: POINTER): POINTER is
 		-- LLVMGetReturnType (node at line 7946)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetReturnType"
		}"
		end

	llvmbuild_is_null (an_argument_l7966_c7: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIsNull (node at line 7965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIsNull"
		}"
		end

	llvmconst_fmul (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFMul (node at line 7970)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFMul"
		}"
		end

	llvmbuild_nswadd (an_argument_l7984_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNSWAdd (node at line 7983)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNSWAdd"
		}"
		end

	llvmbuild_alloca (an_argument_l8003_c7: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAlloca (node at line 8002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAlloca"
		}"
		end

	llvmis_ashuffle_vector_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAShuffleVectorInst (node at line 8025)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAShuffleVectorInst"
		}"
		end

	llvmremove_instr_attribute (an_instr: POINTER; an_index: NATURAL_32; an_argument_l8031_c7: INTEGER) is
 		-- LLVMRemoveInstrAttribute (node at line 8028)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveInstrAttribute"
		}"
		end

	llvmconst_struct_in_context (a_c: POINTER; a_constant_vals: POINTER; a_count: NATURAL_32; a_packed: INTEGER_32): POINTER is
 		-- LLVMConstStructInContext (node at line 8038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstStructInContext"
		}"
		end

	llvmcount_param_types (a_function_ty: POINTER): NATURAL_32 is
 		-- LLVMCountParamTypes (node at line 8044)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountParamTypes"
		}"
		end

	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function wrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.
	-- function unwrap in namespace llvm skipped.

end -- class CORE_EXTERNALS
