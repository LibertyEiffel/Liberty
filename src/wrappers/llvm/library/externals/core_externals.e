-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CORE_EXTERNALS


insert ANY undefine is_equal, copy end

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
 		-- LLVMSetTailCall (node at line 40)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetTailCall"
		}"
		end

	llvmis_abasic_block (a_val: POINTER): POINTER is
 		-- LLVMIsABasicBlock (node at line 55)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABasicBlock"
		}"
		end

	llvmis_aglobal_alias (a_val: POINTER): POINTER is
 		-- LLVMIsAGlobalAlias (node at line 67)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGlobalAlias"
		}"
		end

	llvmbuild_udiv (an_argument_l98_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildUDiv (node at line 97)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildUDiv"
		}"
		end

	llvmget_named_global (a_m: POINTER; a_name: POINTER): POINTER is
 		-- LLVMGetNamedGlobal (node at line 147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNamedGlobal"
		}"
		end

	llvmis_acall_inst (a_val: POINTER): POINTER is
 		-- LLVMIsACallInst (node at line 151)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsACallInst"
		}"
		end

	llvmunion_type_in_context (a_c: POINTER; an_element_types: POINTER; an_element_count: NATURAL_32): POINTER is
 		-- LLVMUnionTypeInContext (node at line 163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMUnionTypeInContext"
		}"
		end

	llvmbuild_load (an_argument_l169_c7: POINTER; a_pointer_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildLoad (node at line 168)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildLoad"
		}"
		end

	llvmis_aconstant_pointer_null (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantPointerNull (node at line 188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantPointerNull"
		}"
		end

	llvmis_afpto_uiinst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPToUIInst (node at line 208)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPToUIInst"
		}"
		end

	llvmcreate_memory_buffer_with_contents_of_file (a_path: POINTER; an_out_mem_buf: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMCreateMemoryBufferWithContentsOfFile (node at line 250)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateMemoryBufferWithContentsOfFile"
		}"
		end

	llvmis_asito_fpinst (a_val: POINTER): POINTER is
 		-- LLVMIsASIToFPInst (node at line 390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASIToFPInst"
		}"
		end

	llvmis_atrunc_inst (a_val: POINTER): POINTER is
 		-- LLVMIsATruncInst (node at line 429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsATruncInst"
		}"
		end

	llvmbuild_nswmul (an_argument_l451_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNSWMul (node at line 450)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNSWMul"
		}"
		end

	llvmis_thread_local (a_global_var: POINTER): INTEGER_32 is
 		-- LLVMIsThreadLocal (node at line 472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsThreadLocal"
		}"
		end

	llvmis_packed_struct (a_struct_ty: POINTER): INTEGER_32 is
 		-- LLVMIsPackedStruct (node at line 484)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsPackedStruct"
		}"
		end

	llvmget_element_type (a_ty: POINTER): POINTER is
 		-- LLVMGetElementType (node at line 487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetElementType"
		}"
		end

	llvmis_abit_cast_inst (a_val: POINTER): POINTER is
 		-- LLVMIsABitCastInst (node at line 498)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABitCastInst"
		}"
		end

	llvmconst_sdiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstSDiv (node at line 508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSDiv"
		}"
		end

	llvmbuild_unwind (an_argument_l522_c7: POINTER): POINTER is
 		-- LLVMBuildUnwind (node at line 521)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildUnwind"
		}"
		end

	llvmvalue_as_basic_block (a_val: POINTER): POINTER is
 		-- LLVMValueAsBasicBlock (node at line 562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMValueAsBasicBlock"
		}"
		end

	llvmconst_extract_element (a_vector_constant: POINTER; an_index_constant: POINTER): POINTER is
 		-- LLVMConstExtractElement (node at line 585)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstExtractElement"
		}"
		end

	llvmget_array_length (an_array_ty: POINTER): NATURAL_32 is
 		-- LLVMGetArrayLength (node at line 619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetArrayLength"
		}"
		end

	llvmfp128type: POINTER is
 		-- LLVMFP128Type (node at line 625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFP128Type()"
		}"
		end

	llvmadd_type_name (a_m: POINTER; a_name: POINTER; a_ty: POINTER): INTEGER_32 is
 		-- LLVMAddTypeName (node at line 637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddTypeName"
		}"
		end

	llvmconst_int_of_string_and_size (an_int_ty: POINTER; a_text: POINTER; a_slen: NATURAL_32; a_radix: CHARACTER): POINTER is
 		-- LLVMConstIntOfStringAndSize (node at line 659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntOfStringAndSize"
		}"
		end

	llvmconst_sub (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstSub (node at line 682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSub"
		}"
		end

	llvmconst_real_of_string_and_size (a_real_ty: POINTER; a_text: POINTER; a_slen: NATURAL_32): POINTER is
 		-- LLVMConstRealOfStringAndSize (node at line 695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstRealOfStringAndSize"
		}"
		end

	llvmreplace_all_uses_with (an_old_val: POINTER; a_new_val: POINTER) is
 		-- LLVMReplaceAllUsesWith (node at line 709)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMReplaceAllUsesWith"
		}"
		end

	llvmbuild_zext (an_argument_l714_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildZExt (node at line 713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildZExt"
		}"
		end

	llvmcreate_pass_manager: POINTER is
 		-- LLVMCreatePassManager (node at line 719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreatePassManager()"
		}"
		end

	llvmopaque_type: POINTER is
 		-- LLVMOpaqueType (node at line 750)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMOpaqueType()"
		}"
		end

	llvmset_visibility (a_global: POINTER; a_viz: INTEGER) is
 		-- LLVMSetVisibility (node at line 775)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetVisibility"
		}"
		end

	llvmconst_ptr_to_int (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstPtrToInt (node at line 783)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstPtrToInt"
		}"
		end

	llvmbuild_zext_or_bit_cast (an_argument_l847_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildZExtOrBitCast (node at line 846)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildZExtOrBitCast"
		}"
		end

	llvmconst_int_cast (a_constant_val: POINTER; a_to_type: POINTER; an_is_signed: INTEGER_32): POINTER is
 		-- LLVMConstIntCast (node at line 857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntCast"
		}"
		end

	llvmbuild_sito_fp (an_argument_l866_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSIToFP (node at line 865)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSIToFP"
		}"
		end

	llvmget_basic_blocks (a_fn: POINTER; a_basic_blocks: POINTER) is
 		-- LLVMGetBasicBlocks (node at line 900)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBasicBlocks"
		}"
		end

	llvmis_aconstant_struct (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantStruct (node at line 932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantStruct"
		}"
		end

	llvmcreate_module_provider_for_existing_module (a_m: POINTER): POINTER is
 		-- LLVMCreateModuleProviderForExistingModule (node at line 935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateModuleProviderForExistingModule"
		}"
		end

	llvmconst_fneg (a_constant_val: POINTER): POINTER is
 		-- LLVMConstFNeg (node at line 951)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFNeg"
		}"
		end

	llvmbuild_extract_element (an_argument_l966_c7: POINTER; a_vec_val: POINTER; an_index: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildExtractElement (node at line 965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildExtractElement"
		}"
		end

	llvmget_value_name (a_val: POINTER): POINTER is
 		-- LLVMGetValueName (node at line 1000)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetValueName"
		}"
		end

	llvminsert_into_builder (a_builder: POINTER; an_instr: POINTER) is
 		-- LLVMInsertIntoBuilder (node at line 1032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertIntoBuilder"
		}"
		end

	llvmvoid_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMVoidTypeInContext (node at line 1039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVoidTypeInContext"
		}"
		end

	llvmis_aterminator_inst (a_val: POINTER): POINTER is
 		-- LLVMIsATerminatorInst (node at line 1085)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsATerminatorInst"
		}"
		end

	llvmbuild_invoke (an_argument_l1090_c7: POINTER; a_fn: POINTER; an_args: POINTER; a_num_args: NATURAL_32; a_then_external: POINTER; a_catch: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildInvoke (node at line 1089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInvoke"
		}"
		end

	llvmadd_global (a_m: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAddGlobal (node at line 1136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddGlobal"
		}"
		end

	llvmget_function_attr (a_fn: POINTER): INTEGER is
 		-- LLVMGetFunctionAttr (node at line 1149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFunctionAttr"
		}"
		end

	llvmset_section (a_global: POINTER; a_section: POINTER) is
 		-- LLVMSetSection (node at line 1158)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetSection"
		}"
		end

	llvmx86fp80type: POINTER is
 		-- LLVMX86FP80Type (node at line 1172)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMX86FP80Type()"
		}"
		end

	llvmget_previous_basic_block (a_bb: POINTER): POINTER is
 		-- LLVMGetPreviousBasicBlock (node at line 1227)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousBasicBlock"
		}"
		end

	llvmconst_icmp (a_predicate: INTEGER; a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstICmp (node at line 1255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstICmp"
		}"
		end

	llvmget_union_element_types (an_union_ty: POINTER; a_dest: POINTER) is
 		-- LLVMGetUnionElementTypes (node at line 1283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetUnionElementTypes"
		}"
		end

	llvmis_auser (a_val: POINTER): POINTER is
 		-- LLVMIsAUser (node at line 1290)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUser"
		}"
		end

	llvmget_previous_function (a_fn: POINTER): POINTER is
 		-- LLVMGetPreviousFunction (node at line 1318)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousFunction"
		}"
		end

	llvmconst_extract_value (an_agg_constant: POINTER; an_idx_list: POINTER; a_num_idx: NATURAL_32): POINTER is
 		-- LLVMConstExtractValue (node at line 1333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstExtractValue"
		}"
		end

	llvmis_abranch_inst (a_val: POINTER): POINTER is
 		-- LLVMIsABranchInst (node at line 1349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABranchInst"
		}"
		end

	llvmadd_case (a_switch: POINTER; an_on_val: POINTER; a_dest: POINTER) is
 		-- LLVMAddCase (node at line 1355)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddCase"
		}"
		end

	llvmis_aint_to_ptr_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAIntToPtrInst (node at line 1367)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAIntToPtrInst"
		}"
		end

	llvmconst_union (a_ty: POINTER; a_val: POINTER): POINTER is
 		-- LLVMConstUnion (node at line 1429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstUnion"
		}"
		end

	llvmbuild_array_malloc (an_argument_l1456_c7: POINTER; a_ty: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildArrayMalloc (node at line 1455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildArrayMalloc"
		}"
		end

	llvmconst_trunc_or_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstTruncOrBitCast (node at line 1467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstTruncOrBitCast"
		}"
		end

	llvmis_aconstant (a_val: POINTER): POINTER is
 		-- LLVMIsAConstant (node at line 1509)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstant"
		}"
		end

	llvmbuild_extract_value (an_argument_l1525_c7: POINTER; an_agg_val: POINTER; an_index: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildExtractValue (node at line 1524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildExtractValue"
		}"
		end

	llvmsize_of (a_ty: POINTER): POINTER is
 		-- LLVMSizeOf (node at line 1542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSizeOf"
		}"
		end

	llvminsert_basic_block (an_insert_before_bb: POINTER; a_name: POINTER): POINTER is
 		-- LLVMInsertBasicBlock (node at line 1551)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertBasicBlock"
		}"
		end

	llvmbuild_global_string (a_b: POINTER; a_str: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildGlobalString (node at line 1571)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildGlobalString"
		}"
		end

	llvmint64type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt64TypeInContext (node at line 1590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt64TypeInContext"
		}"
		end

	llvmint64type: POINTER is
 		-- LLVMInt64Type (node at line 1603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt64Type()"
		}"
		end

	llvmconst_pointer_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstPointerCast (node at line 1617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstPointerCast"
		}"
		end

	llvmset_current_debug_location (a_builder: POINTER; a_l: POINTER) is
 		-- LLVMSetCurrentDebugLocation (node at line 1645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetCurrentDebugLocation"
		}"
		end

	llvmget_previous_param (an_arg: POINTER): POINTER is
 		-- LLVMGetPreviousParam (node at line 1676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousParam"
		}"
		end

	llvminsert_into_builder_with_name (a_builder: POINTER; an_instr: POINTER; a_name: POINTER) is
 		-- LLVMInsertIntoBuilderWithName (node at line 1682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertIntoBuilderWithName"
		}"
		end

	llvmset_alignment (a_global: POINTER; a_bytes: NATURAL_32) is
 		-- LLVMSetAlignment (node at line 1691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetAlignment"
		}"
		end

	llvmbuild_ret (an_argument_l1696_c7: POINTER; a_v: POINTER): POINTER is
 		-- LLVMBuildRet (node at line 1695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildRet"
		}"
		end

	llvmfunction_type (a_return_type: POINTER; a_param_types: POINTER; a_param_count: NATURAL_32; an_is_var_arg: INTEGER_32): POINTER is
 		-- LLVMFunctionType (node at line 1712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFunctionType"
		}"
		end

	llvmbuild_fcmp (an_argument_l1719_c7: POINTER; an_op: INTEGER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFCmp (node at line 1718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFCmp"
		}"
		end

	llvmbuild_trunc_or_bit_cast (an_argument_l1726_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildTruncOrBitCast (node at line 1725)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildTruncOrBitCast"
		}"
		end

	llvmadd_function_attr (a_fn: POINTER; a_pa: INTEGER) is
 		-- LLVMAddFunctionAttr (node at line 1743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddFunctionAttr"
		}"
		end

	llvmdispose_module (a_m: POINTER) is
 		-- LLVMDisposeModule (node at line 1771)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeModule"
		}"
		end

	llvmget_basic_block_parent (a_bb: POINTER): POINTER is
 		-- LLVMGetBasicBlockParent (node at line 1791)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBasicBlockParent"
		}"
		end

	llvmget_alignment (a_global: POINTER): NATURAL_32 is
 		-- LLVMGetAlignment (node at line 1798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetAlignment"
		}"
		end

	llvmconst_fptrunc (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPTrunc (node at line 1801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPTrunc"
		}"
		end

	llvmconst_sext (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstSExt (node at line 1808)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSExt"
		}"
		end

	llvmis_global_constant (a_global_var: POINTER): INTEGER_32 is
 		-- LLVMIsGlobalConstant (node at line 1876)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsGlobalConstant"
		}"
		end

	llvmadd_function (a_m: POINTER; a_name: POINTER; a_function_ty: POINTER): POINTER is
 		-- LLVMAddFunction (node at line 1879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddFunction"
		}"
		end

	llvmresolve_type_handle (a_type_handle: POINTER): POINTER is
 		-- LLVMResolveTypeHandle (node at line 1888)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMResolveTypeHandle"
		}"
		end

	llvmget_type_kind (a_ty: POINTER): INTEGER is
 		-- LLVMGetTypeKind (node at line 1929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTypeKind"
		}"
		end

	llvmget_user (an_u: POINTER): POINTER is
 		-- LLVMGetUser (node at line 1962)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetUser"
		}"
		end

	llvmbuild_lshr (an_argument_l2003_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildLShr (node at line 2002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildLShr"
		}"
		end

	llvmbuild_frem (an_argument_l2019_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFRem (node at line 2018)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFRem"
		}"
		end

	llvmis_ainstruction (a_val: POINTER): POINTER is
 		-- LLVMIsAInstruction (node at line 2034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInstruction"
		}"
		end

	llvmbuild_store (an_argument_l2050_c7: POINTER; a_val: POINTER; a_ptr: POINTER): POINTER is
 		-- LLVMBuildStore (node at line 2049)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildStore"
		}"
		end

	llvmdelete_function (a_fn: POINTER) is
 		-- LLVMDeleteFunction (node at line 2064)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteFunction"
		}"
		end

	llvmconst_mul (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstMul (node at line 2067)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstMul"
		}"
		end

	llvmget_next_function (a_fn: POINTER): POINTER is
 		-- LLVMGetNextFunction (node at line 2130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextFunction"
		}"
		end

	llvmbuild_urem (an_argument_l2156_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildURem (node at line 2155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildURem"
		}"
		end

	llvmbuild_aggregate_ret (an_argument_l2166_c7: POINTER; a_ret_vals: POINTER; a_n: NATURAL_32): POINTER is
 		-- LLVMBuildAggregateRet (node at line 2165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAggregateRet"
		}"
		end

	llvmget_instruction_call_conv (an_instr: POINTER): NATURAL_32 is
 		-- LLVMGetInstructionCallConv (node at line 2192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInstructionCallConv"
		}"
		end

	llvmrun_function_pass_manager (a_fpm: POINTER; a_f: POINTER): INTEGER_32 is
 		-- LLVMRunFunctionPassManager (node at line 2200)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunFunctionPassManager"
		}"
		end

	llvmbuild_shl (an_argument_l2208_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildShl (node at line 2207)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildShl"
		}"
		end

	llvmget_entry_basic_block (a_fn: POINTER): POINTER is
 		-- LLVMGetEntryBasicBlock (node at line 2276)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetEntryBasicBlock"
		}"
		end

	llvmremove_attribute (an_arg: POINTER; a_pa: INTEGER) is
 		-- LLVMRemoveAttribute (node at line 2283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveAttribute"
		}"
		end

	llvmppcfp128type_in_context (a_c: POINTER): POINTER is
 		-- LLVMPPCFP128TypeInContext (node at line 2287)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPPCFP128TypeInContext"
		}"
		end

	llvmis_aphinode (a_val: POINTER): POINTER is
 		-- LLVMIsAPHINode (node at line 2318)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAPHINode"
		}"
		end

	llvmget_next_instruction (an_inst: POINTER): POINTER is
 		-- LLVMGetNextInstruction (node at line 2350)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextInstruction"
		}"
		end

	llvmconst_real_of_string (a_real_ty: POINTER; a_text: POINTER): POINTER is
 		-- LLVMConstRealOfString (node at line 2361)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstRealOfString"
		}"
		end

	llvmconst_fpext (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPExt (node at line 2365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPExt"
		}"
		end

	llvmget_next_global (a_global_var: POINTER): POINTER is
 		-- LLVMGetNextGlobal (node at line 2374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextGlobal"
		}"
		end

	llvmmdnode_in_context (a_c: POINTER; a_vals: POINTER; a_count: NATURAL_32): POINTER is
 		-- LLVMMDNodeInContext (node at line 2392)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMMDNodeInContext"
		}"
		end

	llvmbuild_sub (an_argument_l2405_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSub (node at line 2404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSub"
		}"
		end

	llvmint_type_in_context (a_c: POINTER; a_num_bits: NATURAL_32): POINTER is
 		-- LLVMIntTypeInContext (node at line 2444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIntTypeInContext"
		}"
		end

	llvmbuild_insert_element (an_argument_l2452_c7: POINTER; a_vec_val: POINTER; an_elt_val: POINTER; an_index: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildInsertElement (node at line 2451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInsertElement"
		}"
		end

	llvmbuild_shuffle_vector (an_argument_l2460_c7: POINTER; a_v1: POINTER; a_v2: POINTER; a_mask: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildShuffleVector (node at line 2459)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildShuffleVector"
		}"
		end

	llvmcontext_create: POINTER is
 		-- LLVMContextCreate (node at line 2466)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMContextCreate()"
		}"
		end

	llvmset_linkage (a_global: POINTER; a_linkage: INTEGER) is
 		-- LLVMSetLinkage (node at line 2489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetLinkage"
		}"
		end

	llvmadd_destination (an_indirect_br: POINTER; a_dest: POINTER) is
 		-- LLVMAddDestination (node at line 2503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddDestination"
		}"
		end

	llvmconst_fadd (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFAdd (node at line 2566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFAdd"
		}"
		end

	llvmcreate_type_handle (a_potentially_abstract_ty: POINTER): POINTER is
 		-- LLVMCreateTypeHandle (node at line 2579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateTypeHandle"
		}"
		end

	llvmconst_int_to_ptr (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstIntToPtr (node at line 2590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntToPtr"
		}"
		end

	llvmadd_incoming (a_phi_node: POINTER; an_incoming_values: POINTER; an_incoming_blocks: POINTER; a_count: NATURAL_32) is
 		-- LLVMAddIncoming (node at line 2601)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddIncoming"
		}"
		end

	llvmdelete_global (a_global_var: POINTER) is
 		-- LLVMDeleteGlobal (node at line 2608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteGlobal"
		}"
		end

	llvmconst_urem (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstURem (node at line 2631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstURem"
		}"
		end

	llvmbuild_int_cast (an_argument_l2641_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIntCast (node at line 2640)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIntCast"
		}"
		end

	llvmmodule_create_with_name_in_context (a_module_id: POINTER; a_c: POINTER): POINTER is
 		-- LLVMModuleCreateWithNameInContext (node at line 2663)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMModuleCreateWithNameInContext"
		}"
		end

	llvmget_intrinsic_id (a_fn: POINTER): NATURAL_32 is
 		-- LLVMGetIntrinsicID (node at line 2667)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIntrinsicID"
		}"
		end

	llvmconst_gep (a_constant_val: POINTER; a_constant_indices: POINTER; a_num_indices: NATURAL_32): POINTER is
 		-- LLVMConstGEP (node at line 2707)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstGEP"
		}"
		end

	llvmget_next_basic_block (a_bb: POINTER): POINTER is
 		-- LLVMGetNextBasicBlock (node at line 2723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextBasicBlock"
		}"
		end

	llvmint_type (a_num_bits: NATURAL_32): POINTER is
 		-- LLVMIntType (node at line 2727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIntType"
		}"
		end

	llvmconst_nuwsub (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNUWSub (node at line 2740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNUWSub"
		}"
		end

	llvmget_last_function (a_m: POINTER): POINTER is
 		-- LLVMGetLastFunction (node at line 2747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastFunction"
		}"
		end

	llvmis_aintrinsic_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAIntrinsicInst (node at line 2761)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAIntrinsicInst"
		}"
		end

	llvmis_amem_cpy_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAMemCpyInst (node at line 2867)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemCpyInst"
		}"
		end

	llvmis_azext_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAZExtInst (node at line 2870)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAZExtInst"
		}"
		end

	llvmrun_pass_manager (a_pm: POINTER; a_m: POINTER): INTEGER_32 is
 		-- LLVMRunPassManager (node at line 2881)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunPassManager"
		}"
		end

	llvmconst_neg (a_constant_val: POINTER): POINTER is
 		-- LLVMConstNeg (node at line 2919)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNeg"
		}"
		end

	llvmconst_zext_or_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstZExtOrBitCast (node at line 2925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstZExtOrBitCast"
		}"
		end

	llvmvalue_is_basic_block (a_val: POINTER): INTEGER_32 is
 		-- LLVMValueIsBasicBlock (node at line 2937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMValueIsBasicBlock"
		}"
		end

	llvmconst_insert_value (an_agg_constant: POINTER; an_element_value_constant: POINTER; an_idx_list: POINTER; a_num_idx: NATURAL_32): POINTER is
 		-- LLVMConstInsertValue (node at line 2948)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInsertValue"
		}"
		end

	llvmdispose_pass_manager (a_pm: POINTER) is
 		-- LLVMDisposePassManager (node at line 2960)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposePassManager"
		}"
		end

	llvmconst_fpto_si (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPToSI (node at line 2970)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPToSI"
		}"
		end

	llvmconst_fpto_ui (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPToUI (node at line 2992)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPToUI"
		}"
		end

	llvmdispose_message (a_message: POINTER) is
 		-- LLVMDisposeMessage (node at line 3013)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeMessage"
		}"
		end

	llvmbuild_bit_cast (an_argument_l3025_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildBitCast (node at line 3024)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildBitCast"
		}"
		end

	llvmis_aicmp_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAICmpInst (node at line 3037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAICmpInst"
		}"
		end

	llvmremove_function_attr (a_fn: POINTER; a_pa: INTEGER) is
 		-- LLVMRemoveFunctionAttr (node at line 3061)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveFunctionAttr"
		}"
		end

	llvmconst_not (a_constant_val: POINTER): POINTER is
 		-- LLVMConstNot (node at line 3085)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNot"
		}"
		end

	llvmdelete_basic_block (a_bb: POINTER) is
 		-- LLVMDeleteBasicBlock (node at line 3109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteBasicBlock"
		}"
		end

	llvmint16type: POINTER is
 		-- LLVMInt16Type (node at line 3117)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt16Type()"
		}"
		end

	llvmset_data_layout (a_m: POINTER; a_triple: POINTER) is
 		-- LLVMSetDataLayout (node at line 3118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetDataLayout"
		}"
		end

	llvmconst_real (a_real_ty: POINTER; a_n: REAL_64): POINTER is
 		-- LLVMConstReal (node at line 3126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstReal"
		}"
		end

	llvmget_vector_size (a_vector_ty: POINTER): NATURAL_32 is
 		-- LLVMGetVectorSize (node at line 3130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetVectorSize"
		}"
		end

	llvmis_afptrunc_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPTruncInst (node at line 3150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPTruncInst"
		}"
		end

	llvmcount_param_types (a_function_ty: POINTER): NATURAL_32 is
 		-- LLVMCountParamTypes (node at line 3162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountParamTypes"
		}"
		end

	llvmis_aget_element_ptr_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAGetElementPtrInst (node at line 3165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGetElementPtrInst"
		}"
		end

	llvmget_mdkind_id (a_name: POINTER; a_slen: NATURAL_32): NATURAL_32 is
 		-- LLVMGetMDKindID (node at line 3191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetMDKindID"
		}"
		end

	llvmis_aconstant_array (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantArray (node at line 3212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantArray"
		}"
		end

	llvmis_tail_call (a_call_inst: POINTER): INTEGER_32 is
 		-- LLVMIsTailCall (node at line 3225)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsTailCall"
		}"
		end

	llvmget_last_global (a_m: POINTER): POINTER is
 		-- LLVMGetLastGlobal (node at line 3228)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastGlobal"
		}"
		end

	llvmadd_global_in_address_space (a_m: POINTER; a_ty: POINTER; a_name: POINTER; an_address_space: NATURAL_32): POINTER is
 		-- LLVMAddGlobalInAddressSpace (node at line 3231)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddGlobalInAddressSpace"
		}"
		end

	llvmadd_instr_attribute (an_instr: POINTER; an_index: NATURAL_32; an_argument_l3251_c7: INTEGER) is
 		-- LLVMAddInstrAttribute (node at line 3248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddInstrAttribute"
		}"
		end

	llvmconst_trunc (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstTrunc (node at line 3253)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstTrunc"
		}"
		end

	llvmis_aselect_inst (a_val: POINTER): POINTER is
 		-- LLVMIsASelectInst (node at line 3272)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASelectInst"
		}"
		end

	llvmis_amem_move_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAMemMoveInst (node at line 3276)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemMoveInst"
		}"
		end

	llvmfloat_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMFloatTypeInContext (node at line 3279)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFloatTypeInContext"
		}"
		end

	llvmint16type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt16TypeInContext (node at line 3282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt16TypeInContext"
		}"
		end

	llvmmdnode (a_vals: POINTER; a_count: NATURAL_32): POINTER is
 		-- LLVMMDNode (node at line 3285)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMMDNode"
		}"
		end

	llvmis_astore_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAStoreInst (node at line 3298)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAStoreInst"
		}"
		end

	llvmconst_nswsub (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNSWSub (node at line 3304)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNSWSub"
		}"
		end

	llvmconst_struct (a_constant_vals: POINTER; a_count: NATURAL_32; a_packed: INTEGER_32): POINTER is
 		-- LLVMConstStruct (node at line 3308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstStruct"
		}"
		end

	llvmget_first_instruction (a_bb: POINTER): POINTER is
 		-- LLVMGetFirstInstruction (node at line 3320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstInstruction"
		}"
		end

	llvmset_target (a_m: POINTER; a_triple: POINTER) is
 		-- LLVMSetTarget (node at line 3324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetTarget"
		}"
		end

	llvminsert_basic_block_in_context (a_c: POINTER; a_bb: POINTER; a_name: POINTER): POINTER is
 		-- LLVMInsertBasicBlockInContext (node at line 3348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertBasicBlockInContext"
		}"
		end

	llvmconst_or (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstOr (node at line 3356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstOr"
		}"
		end

	llvmconst_udiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstUDiv (node at line 3360)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstUDiv"
		}"
		end

	llvmbuild_in_bounds_gep (a_b: POINTER; a_pointer: POINTER; an_indices: POINTER; a_num_indices: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildInBoundsGEP (node at line 3364)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInBoundsGEP"
		}"
		end

	llvmis_ainvoke_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAInvokeInst (node at line 3377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInvokeInst"
		}"
		end

	llvmbuild_fsub (an_argument_l3381_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFSub (node at line 3380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFSub"
		}"
		end

	llvmis_amem_set_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAMemSetInst (node at line 3386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemSetInst"
		}"
		end

	llvmarray_type (an_element_type: POINTER; an_element_count: NATURAL_32): POINTER is
 		-- LLVMArrayType (node at line 3394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMArrayType"
		}"
		end

	llvmget_first_basic_block (a_fn: POINTER): POINTER is
 		-- LLVMGetFirstBasicBlock (node at line 3413)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstBasicBlock"
		}"
		end

	llvmbuild_nuwsub (an_argument_l3422_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNUWSub (node at line 3421)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNUWSub"
		}"
		end

	llvmcreate_builder: POINTER is
 		-- LLVMCreateBuilder (node at line 3438)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateBuilder()"
		}"
		end

	llvmset_instruction_call_conv (an_instr: POINTER; a_cc: NATURAL_32) is
 		-- LLVMSetInstructionCallConv (node at line 3467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInstructionCallConv"
		}"
		end

	llvmbuild_ptr_to_int (an_argument_l3477_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPtrToInt (node at line 3476)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPtrToInt"
		}"
		end

	llvmclear_insertion_position (a_builder: POINTER) is
 		-- LLVMClearInsertionPosition (node at line 3561)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMClearInsertionPosition"
		}"
		end

	llvmget_insert_block (a_builder: POINTER): POINTER is
 		-- LLVMGetInsertBlock (node at line 3581)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInsertBlock"
		}"
		end

	llvmbuild_fpto_si (an_argument_l3608_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPToSI (node at line 3607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPToSI"
		}"
		end

	llvmtype_of (a_val: POINTER): POINTER is
 		-- LLVMTypeOf (node at line 3621)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMTypeOf"
		}"
		end

	llvmget_last_instruction (a_bb: POINTER): POINTER is
 		-- LLVMGetLastInstruction (node at line 3637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastInstruction"
		}"
		end

	llvmbuild_fpto_ui (an_argument_l3660_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPToUI (node at line 3659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPToUI"
		}"
		end

	llvmmdstring_in_context (a_c: POINTER; a_str: POINTER; a_slen: NATURAL_32): POINTER is
 		-- LLVMMDStringInContext (node at line 3670)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMMDStringInContext"
		}"
		end

	llvmget_data_layout (a_m: POINTER): POINTER is
 		-- LLVMGetDataLayout (node at line 4427)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetDataLayout"
		}"
		end

	llvmbuild_mul (an_argument_l4514_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildMul (node at line 4513)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildMul"
		}"
		end

	llvmdispose_builder (a_builder: POINTER) is
 		-- LLVMDisposeBuilder (node at line 4525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeBuilder"
		}"
		end

	llvmconst_fpcast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPCast (node at line 4538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPCast"
		}"
		end

	llvmconst_zext (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstZExt (node at line 4542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstZExt"
		}"
		end

	llvmstruct_type (an_element_types: POINTER; an_element_count: NATURAL_32; a_packed: INTEGER_32): POINTER is
 		-- LLVMStructType (node at line 4556)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStructType"
		}"
		end

	llvmbuild_uito_fp (an_argument_l4580_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildUIToFP (node at line 4579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildUIToFP"
		}"
		end

	llvmget_operand (a_val: POINTER; an_index: NATURAL_32): POINTER is
 		-- LLVMGetOperand (node at line 4589)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetOperand"
		}"
		end

	llvmget_global_context: POINTER is
 		-- LLVMGetGlobalContext (node at line 4593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetGlobalContext()"
		}"
		end

	llvmget_first_param (a_fn: POINTER): POINTER is
 		-- LLVMGetFirstParam (node at line 4598)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstParam"
		}"
		end

	llvmget_param_parent (an_inst: POINTER): POINTER is
 		-- LLVMGetParamParent (node at line 4621)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParamParent"
		}"
		end

	llvmget_param_types (a_function_ty: POINTER; a_dest: POINTER) is
 		-- LLVMGetParamTypes (node at line 4645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParamTypes"
		}"
		end

	llvmdispose_module_provider (a_m: POINTER) is
 		-- LLVMDisposeModuleProvider (node at line 4657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeModuleProvider"
		}"
		end

	llvmbuild_nswsub (an_argument_l4690_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNSWSub (node at line 4689)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNSWSub"
		}"
		end

	llvmbuild_ashr (an_argument_l4704_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAShr (node at line 4703)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAShr"
		}"
		end

	llvmalign_of (a_ty: POINTER): POINTER is
 		-- LLVMAlignOf (node at line 4709)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAlignOf"
		}"
		end

	llvmconst_uito_fp (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstUIToFP (node at line 4727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstUIToFP"
		}"
		end

	llvmget_instruction_parent (an_inst: POINTER): POINTER is
 		-- LLVMGetInstructionParent (node at line 4754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInstructionParent"
		}"
		end

	llvmlabel_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMLabelTypeInContext (node at line 4761)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMLabelTypeInContext"
		}"
		end

	llvminitialize_function_pass_manager (a_fpm: POINTER): INTEGER_32 is
 		-- LLVMInitializeFunctionPassManager (node at line 4782)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeFunctionPassManager"
		}"
		end

	llvmget_used_value (an_u: POINTER): POINTER is
 		-- LLVMGetUsedValue (node at line 4785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetUsedValue"
		}"
		end

	llvmmodule_create_with_name (a_module_id: POINTER): POINTER is
 		-- LLVMModuleCreateWithName (node at line 4788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMModuleCreateWithName"
		}"
		end

	llvmget_last_param (a_fn: POINTER): POINTER is
 		-- LLVMGetLastParam (node at line 4797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastParam"
		}"
		end

	llvmconst_nuwmul (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNUWMul (node at line 4814)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNUWMul"
		}"
		end

	llvmis_aptr_to_int_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAPtrToIntInst (node at line 4828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAPtrToIntInst"
		}"
		end

	llvmint32type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt32TypeInContext (node at line 4918)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt32TypeInContext"
		}"
		end

	llvmcreate_memory_buffer_with_stdin (an_out_mem_buf: POINTER; an_out_message: POINTER): INTEGER_32 is
 		-- LLVMCreateMemoryBufferWithSTDIN (node at line 4937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateMemoryBufferWithSTDIN"
		}"
		end

	llvmget_previous_global (a_global_var: POINTER): POINTER is
 		-- LLVMGetPreviousGlobal (node at line 4941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousGlobal"
		}"
		end

	llvmget_current_debug_location (a_builder: POINTER): POINTER is
 		-- LLVMGetCurrentDebugLocation (node at line 4956)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetCurrentDebugLocation"
		}"
		end

	llvmconst_inline_asm (a_ty: POINTER; an_asm_string: POINTER; a_constraints: POINTER; a_has_side_effects: INTEGER_32; an_is_align_stack: INTEGER_32): POINTER is
 		-- LLVMConstInlineAsm (node at line 4970)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInlineAsm"
		}"
		end

	llvmget_int_type_width (an_integer_ty: POINTER): NATURAL_32 is
 		-- LLVMGetIntTypeWidth (node at line 5009)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIntTypeWidth"
		}"
		end

	llvmset_gc (a_fn: POINTER; a_name: POINTER) is
 		-- LLVMSetGC (node at line 5022)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetGC"
		}"
		end

	llvmget_visibility (a_global: POINTER): INTEGER is
 		-- LLVMGetVisibility (node at line 5045)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetVisibility"
		}"
		end

	llvmcreate_function_pass_manager_for_module (a_m: POINTER): POINTER is
 		-- LLVMCreateFunctionPassManagerForModule (node at line 5111)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateFunctionPassManagerForModule"
		}"
		end

	llvmbuild_fpext (an_argument_l5133_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPExt (node at line 5132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPExt"
		}"
		end

	llvmcount_union_element_types (an_union_ty: POINTER): NATURAL_32 is
 		-- LLVMCountUnionElementTypes (node at line 5138)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountUnionElementTypes"
		}"
		end

	llvmbuild_fpcast (an_argument_l5147_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPCast (node at line 5146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPCast"
		}"
		end

	llvmdouble_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMDoubleTypeInContext (node at line 5156)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDoubleTypeInContext"
		}"
		end

	llvmbuild_srem (an_argument_l5212_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSRem (node at line 5211)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSRem"
		}"
		end

	llvmis_acast_inst (a_val: POINTER): POINTER is
 		-- LLVMIsACastInst (node at line 5217)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsACastInst"
		}"
		end

	llvmconst_insert_element (a_vector_constant: POINTER; an_element_value_constant: POINTER; an_index_constant: POINTER): POINTER is
 		-- LLVMConstInsertElement (node at line 5245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInsertElement"
		}"
		end

	llvmis_aglobal_variable (a_val: POINTER): POINTER is
 		-- LLVMIsAGlobalVariable (node at line 5250)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGlobalVariable"
		}"
		end

	llvmconst_shuffle_vector (a_vector_aconstant: POINTER; a_vector_bconstant: POINTER; a_mask_constant: POINTER): POINTER is
 		-- LLVMConstShuffleVector (node at line 5253)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstShuffleVector"
		}"
		end

	llvmbuild_indirect_br (a_b: POINTER; an_addr: POINTER; a_num_dests: NATURAL_32): POINTER is
 		-- LLVMBuildIndirectBr (node at line 5258)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIndirectBr"
		}"
		end

	llvmconst_add (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstAdd (node at line 5274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAdd"
		}"
		end

	llvmstruct_type_in_context (a_c: POINTER; an_element_types: POINTER; an_element_count: NATURAL_32; a_packed: INTEGER_32): POINTER is
 		-- LLVMStructTypeInContext (node at line 5278)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStructTypeInContext"
		}"
		end

	llvmbuild_neg (an_argument_l5290_c7: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNeg (node at line 5289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNeg"
		}"
		end

	llvmget_function_call_conv (a_fn: POINTER): NATURAL_32 is
 		-- LLVMGetFunctionCallConv (node at line 5322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFunctionCallConv"
		}"
		end

	llvmget_first_global (a_m: POINTER): POINTER is
 		-- LLVMGetFirstGlobal (node at line 5335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstGlobal"
		}"
		end

	llvmconst_all_ones (a_ty: POINTER): POINTER is
 		-- LLVMConstAllOnes (node at line 5338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAllOnes"
		}"
		end

	llvmposition_builder_before (a_builder: POINTER; an_instr: POINTER) is
 		-- LLVMPositionBuilderBefore (node at line 5345)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPositionBuilderBefore"
		}"
		end

	llvmbuild_insert_value (an_argument_l5356_c7: POINTER; an_agg_val: POINTER; an_elt_val: POINTER; an_index: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildInsertValue (node at line 5355)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInsertValue"
		}"
		end

	llvmis_avaarg_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAVAArgInst (node at line 5371)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAVAArgInst"
		}"
		end

	llvmconst_nswmul (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNSWMul (node at line 5384)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNSWMul"
		}"
		end

	llvmbuild_fmul (an_argument_l5433_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFMul (node at line 5432)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFMul"
		}"
		end

	llvmconst_and (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstAnd (node at line 5439)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAnd"
		}"
		end

	llvmdump_value (a_val: POINTER) is
 		-- LLVMDumpValue (node at line 5443)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDumpValue"
		}"
		end

	llvmbuild_malloc (an_argument_l5447_c7: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildMalloc (node at line 5446)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildMalloc"
		}"
		end

	llvmcount_struct_element_types (a_struct_ty: POINTER): NATURAL_32 is
 		-- LLVMCountStructElementTypes (node at line 5456)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountStructElementTypes"
		}"
		end

	llvmbuild_nuwmul (an_argument_l5468_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNUWMul (node at line 5467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNUWMul"
		}"
		end

	llvmunion_type (an_element_types: POINTER; an_element_count: NATURAL_32): POINTER is
 		-- LLVMUnionType (node at line 5478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMUnionType"
		}"
		end

	llvmget_incoming_value (a_phi_node: POINTER; an_index: NATURAL_32): POINTER is
 		-- LLVMGetIncomingValue (node at line 5485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIncomingValue"
		}"
		end

	llvmis_aundef_value (a_val: POINTER): POINTER is
 		-- LLVMIsAUndefValue (node at line 5525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUndefValue"
		}"
		end

	llvmis_areturn_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAReturnInst (node at line 5538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAReturnInst"
		}"
		end

	llvmconst_exact_sdiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstExactSDiv (node at line 5541)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstExactSDiv"
		}"
		end

	llvmconst_fcmp (a_predicate: INTEGER; a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFCmp (node at line 5551)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFCmp"
		}"
		end

	llvmis_aargument (a_val: POINTER): POINTER is
 		-- LLVMIsAArgument (node at line 5600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAArgument"
		}"
		end

	llvmget_global_parent (a_global: POINTER): POINTER is
 		-- LLVMGetGlobalParent (node at line 5603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetGlobalParent"
		}"
		end

	llvmget_next_param (an_arg: POINTER): POINTER is
 		-- LLVMGetNextParam (node at line 5631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextParam"
		}"
		end

	llvmbuild_switch (an_argument_l5653_c7: POINTER; a_v: POINTER; an_else_external: POINTER; a_num_cases: NATURAL_32): POINTER is
 		-- LLVMBuildSwitch (node at line 5652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSwitch"
		}"
		end

	llvmconst_nuwneg (a_constant_val: POINTER): POINTER is
 		-- LLVMConstNUWNeg (node at line 5659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNUWNeg"
		}"
		end

	llvmint32type: POINTER is
 		-- LLVMInt32Type (node at line 5669)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt32Type()"
		}"
		end

	llvmis_constant (a_val: POINTER): INTEGER_32 is
 		-- LLVMIsConstant (node at line 5675)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsConstant"
		}"
		end

	llvmis_ainsert_element_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAInsertElementInst (node at line 5697)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInsertElementInst"
		}"
		end

	llvmlabel_type: POINTER is
 		-- LLVMLabelType (node at line 5705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMLabelType()"
		}"
		end

	llvmvoid_type: POINTER is
 		-- LLVMVoidType (node at line 5710)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVoidType()"
		}"
		end

	llvmbuild_free (an_argument_l5748_c7: POINTER; a_pointer_val: POINTER): POINTER is
 		-- LLVMBuildFree (node at line 5747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFree"
		}"
		end

	llvmis_function_var_arg (a_function_ty: POINTER): INTEGER_32 is
 		-- LLVMIsFunctionVarArg (node at line 5751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsFunctionVarArg"
		}"
		end

	llvmbuild_sext_or_bit_cast (an_argument_l5756_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSExtOrBitCast (node at line 5755)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSExtOrBitCast"
		}"
		end

	llvmget_metadata (a_val: POINTER; a_kind_id: NATURAL_32): POINTER is
 		-- LLVMGetMetadata (node at line 5829)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetMetadata"
		}"
		end

	llvmget_mdkind_idin_context (a_c: POINTER; a_name: POINTER; a_slen: NATURAL_32): NATURAL_32 is
 		-- LLVMGetMDKindIDInContext (node at line 5833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetMDKindIDInContext"
		}"
		end

	llvmget_param (a_fn: POINTER; an_index: NATURAL_32): POINTER is
 		-- LLVMGetParam (node at line 5839)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParam"
		}"
		end

	llvmcreate_builder_in_context (a_c: POINTER): POINTER is
 		-- LLVMCreateBuilderInContext (node at line 5851)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateBuilderInContext"
		}"
		end

	llvmconst_frem (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFRem (node at line 5854)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFRem"
		}"
		end

	llvmget_type_by_name (a_m: POINTER; a_name: POINTER): POINTER is
 		-- LLVMGetTypeByName (node at line 5897)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTypeByName"
		}"
		end

	llvmget_undef (a_ty: POINTER): POINTER is
 		-- LLVMGetUndef (node at line 5934)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetUndef"
		}"
		end

	llvmbuild_sdiv (an_argument_l5948_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSDiv (node at line 5947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSDiv"
		}"
		end

	llvmfinalize_function_pass_manager (a_fpm: POINTER): INTEGER_32 is
 		-- LLVMFinalizeFunctionPassManager (node at line 5960)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFinalizeFunctionPassManager"
		}"
		end

	llvmconst_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstBitCast (node at line 5969)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstBitCast"
		}"
		end

	llvmdump_module (a_m: POINTER) is
 		-- LLVMDumpModule (node at line 5973)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDumpModule"
		}"
		end

	llvmis_aextract_element_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAExtractElementInst (node at line 5979)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAExtractElementInst"
		}"
		end

	llvmfp128type_in_context (a_c: POINTER): POINTER is
 		-- LLVMFP128TypeInContext (node at line 5982)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFP128TypeInContext"
		}"
		end

	llvmget_initializer (a_global_var: POINTER): POINTER is
 		-- LLVMGetInitializer (node at line 5997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInitializer"
		}"
		end

	llvmis_aconstant_vector (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantVector (node at line 6003)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantVector"
		}"
		end

	llvmbuild_int_to_ptr (an_argument_l6032_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIntToPtr (node at line 6031)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIntToPtr"
		}"
		end

	llvmbuild_not (an_argument_l6043_c7: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNot (node at line 6042)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNot"
		}"
		end

	llvmbuild_trunc (an_argument_l6065_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildTrunc (node at line 6064)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildTrunc"
		}"
		end

	llvmget_incoming_block (a_phi_node: POINTER; an_index: NATURAL_32): POINTER is
 		-- LLVMGetIncomingBlock (node at line 6071)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIncomingBlock"
		}"
		end

	llvmconst_select (a_constant_condition: POINTER; a_constant_if_true: POINTER; a_constant_if_false: POINTER): POINTER is
 		-- LLVMConstSelect (node at line 6075)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSelect"
		}"
		end

	llvmbuild_br (an_argument_l6089_c7: POINTER; a_dest: POINTER): POINTER is
 		-- LLVMBuildBr (node at line 6088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildBr"
		}"
		end

	llvmcount_basic_blocks (a_fn: POINTER): NATURAL_32 is
 		-- LLVMCountBasicBlocks (node at line 6125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountBasicBlocks"
		}"
		end

	llvmbuild_fdiv (an_argument_l6150_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFDiv (node at line 6149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFDiv"
		}"
		end

	llvmconst_int (an_int_ty: POINTER; a_n: NATURAL_64; a_sign_extend: INTEGER_32): POINTER is
 		-- LLVMConstInt (node at line 6173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInt"
		}"
		end

	llvmconst_nswneg (a_constant_val: POINTER): POINTER is
 		-- LLVMConstNSWNeg (node at line 6178)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNSWNeg"
		}"
		end

	llvmbuild_array_alloca (an_argument_l6189_c7: POINTER; a_ty: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildArrayAlloca (node at line 6188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildArrayAlloca"
		}"
		end

	llvmbuild_fneg (an_argument_l6203_c7: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFNeg (node at line 6202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFNeg"
		}"
		end

	llvmbuild_bin_op (a_b: POINTER; an_op: INTEGER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildBinOp (node at line 6225)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildBinOp"
		}"
		end

	llvmis_acmp_inst (a_val: POINTER): POINTER is
 		-- LLVMIsACmpInst (node at line 6251)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsACmpInst"
		}"
		end

	llvmbuild_or (an_argument_l6255_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildOr (node at line 6254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildOr"
		}"
		end

	llvmbuild_nuwneg (a_b: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNUWNeg (node at line 6269)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNUWNeg"
		}"
		end

	llvmis_aunwind_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAUnwindInst (node at line 6285)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUnwindInst"
		}"
		end

	llvmrefine_type (an_abstract_ty: POINTER; a_concrete_ty: POINTER) is
 		-- LLVMRefineType (node at line 6298)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRefineType"
		}"
		end

	llvmget_previous_instruction (an_inst: POINTER): POINTER is
 		-- LLVMGetPreviousInstruction (node at line 6313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousInstruction"
		}"
		end

	llvmbuild_ptr_diff (an_argument_l6332_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPtrDiff (node at line 6331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPtrDiff"
		}"
		end

	llvmint8type: POINTER is
 		-- LLVMInt8Type (node at line 6341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt8Type()"
		}"
		end

	llvmopaque_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMOpaqueTypeInContext (node at line 6363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMOpaqueTypeInContext"
		}"
		end

	llvmget_first_use (a_val: POINTER): POINTER is
 		-- LLVMGetFirstUse (node at line 6380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstUse"
		}"
		end

	llvmconst_sito_fp (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstSIToFP (node at line 6398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSIToFP"
		}"
		end

	llvmget_first_function (a_m: POINTER): POINTER is
 		-- LLVMGetFirstFunction (node at line 6418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstFunction"
		}"
		end

	llvmdispose_type_handle (a_type_handle: POINTER) is
 		-- LLVMDisposeTypeHandle (node at line 6424)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeTypeHandle"
		}"
		end

	llvmis_null (a_val: POINTER): INTEGER_32 is
 		-- LLVMIsNull (node at line 6459)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsNull"
		}"
		end

	llvmis_aglobal_value (a_val: POINTER): POINTER is
 		-- LLVMIsAGlobalValue (node at line 6464)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGlobalValue"
		}"
		end

	llvmbuild_vaarg (an_argument_l6481_c7: POINTER; a_list: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildVAArg (node at line 6480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildVAArg"
		}"
		end

	llvmset_inst_debug_location (a_builder: POINTER; an_inst: POINTER) is
 		-- LLVMSetInstDebugLocation (node at line 6486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInstDebugLocation"
		}"
		end

	llvmbasic_block_as_value (a_bb: POINTER): POINTER is
 		-- LLVMBasicBlockAsValue (node at line 6499)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBasicBlockAsValue"
		}"
		end

	llvmconst_fdiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFDiv (node at line 6510)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFDiv"
		}"
		end

	llvmconst_in_bounds_gep (a_constant_val: POINTER; a_constant_indices: POINTER; a_num_indices: NATURAL_32): POINTER is
 		-- LLVMConstInBoundsGEP (node at line 6556)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInBoundsGEP"
		}"
		end

	llvmbuild_icmp (an_argument_l6562_c7: POINTER; an_op: INTEGER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildICmp (node at line 6561)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildICmp"
		}"
		end

	llvmcreate_function_pass_manager (a_mp: POINTER): POINTER is
 		-- LLVMCreateFunctionPassManager (node at line 6568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateFunctionPassManager"
		}"
		end

	llvmconst_xor (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstXor (node at line 6583)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstXor"
		}"
		end

	llvmget_struct_element_types (a_struct_ty: POINTER; a_dest: POINTER) is
 		-- LLVMGetStructElementTypes (node at line 6638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetStructElementTypes"
		}"
		end

	llvmis_adbg_declare_inst (a_val: POINTER): POINTER is
 		-- LLVMIsADbgDeclareInst (node at line 6648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsADbgDeclareInst"
		}"
		end

	llvmset_instr_param_alignment (an_instr: POINTER; an_index: NATURAL_32; an_align: NATURAL_32) is
 		-- LLVMSetInstrParamAlignment (node at line 6654)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInstrParamAlignment"
		}"
		end

	llvmbuild_select (an_argument_l6665_c7: POINTER; an_if_external: POINTER; a_then_external: POINTER; an_else_external: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSelect (node at line 6664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSelect"
		}"
		end

	llvmblock_address (a_f: POINTER; a_bb: POINTER): POINTER is
 		-- LLVMBlockAddress (node at line 6675)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBlockAddress"
		}"
		end

	llvmconst_string (a_str: POINTER; a_length: NATURAL_32; a_dont_null_terminate: INTEGER_32): POINTER is
 		-- LLVMConstString (node at line 6728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstString"
		}"
		end

	llvmbuild_global_string_ptr (a_b: POINTER; a_str: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildGlobalStringPtr (node at line 6744)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildGlobalStringPtr"
		}"
		end

	llvmbuild_cond_br (an_argument_l6771_c7: POINTER; an_if_external: POINTER; a_then_external: POINTER; an_else_external: POINTER): POINTER is
 		-- LLVMBuildCondBr (node at line 6770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildCondBr"
		}"
		end

	llvmint8type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt8TypeInContext (node at line 6800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt8TypeInContext"
		}"
		end

	llvmbuild_call (an_argument_l6854_c7: POINTER; a_fn: POINTER; an_args: POINTER; a_num_args: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildCall (node at line 6853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildCall"
		}"
		end

	llvmset_value_name (a_val: POINTER; a_name: POINTER) is
 		-- LLVMSetValueName (node at line 6868)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetValueName"
		}"
		end

	llvmdouble_type: POINTER is
 		-- LLVMDoubleType (node at line 6898)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDoubleType()"
		}"
		end

	llvmconst_vector (a_scalar_constant_vals: POINTER; a_size: NATURAL_32): POINTER is
 		-- LLVMConstVector (node at line 6911)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstVector"
		}"
		end

	llvmbuild_add (an_argument_l6921_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAdd (node at line 6920)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAdd"
		}"
		end

	llvmbuild_cast (a_b: POINTER; an_op: INTEGER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildCast (node at line 6956)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildCast"
		}"
		end

	llvmppcfp128type: POINTER is
 		-- LLVMPPCFP128Type (node at line 6974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPPCFP128Type()"
		}"
		end

	llvmconst_array (an_element_ty: POINTER; a_constant_vals: POINTER; a_length: NATURAL_32): POINTER is
 		-- LLVMConstArray (node at line 6988)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstArray"
		}"
		end

	llvmis_afcmp_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAFCmpInst (node at line 6996)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFCmpInst"
		}"
		end

	llvmis_ainline_asm (a_val: POINTER): POINTER is
 		-- LLVMIsAInlineAsm (node at line 7036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInlineAsm"
		}"
		end

	llvmset_param_alignment (an_arg: POINTER; an_align: NATURAL_32) is
 		-- LLVMSetParamAlignment (node at line 7039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetParamAlignment"
		}"
		end

	llvmbuild_and (an_argument_l7063_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAnd (node at line 7062)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAnd"
		}"
		end

	llvmconst_shl (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstShl (node at line 7078)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstShl"
		}"
		end

	llvmget_linkage (a_global: POINTER): INTEGER is
 		-- LLVMGetLinkage (node at line 7085)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLinkage"
		}"
		end

	llvmconst_fsub (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFSub (node at line 7088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFSub"
		}"
		end

	llvmadd_attribute (an_arg: POINTER; a_pa: INTEGER) is
 		-- LLVMAddAttribute (node at line 7134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddAttribute"
		}"
		end

	llvmbuild_sext (an_argument_l7162_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSExt (node at line 7161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSExt"
		}"
		end

	llvmset_thread_local (a_global_var: POINTER; an_is_thread_local: INTEGER_32) is
 		-- LLVMSetThreadLocal (node at line 7172)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetThreadLocal"
		}"
		end

	llvmget_pointer_address_space (a_pointer_ty: POINTER): NATURAL_32 is
 		-- LLVMGetPointerAddressSpace (node at line 7179)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPointerAddressSpace"
		}"
		end

	llvmis_aunary_instruction (a_val: POINTER): POINTER is
 		-- LLVMIsAUnaryInstruction (node at line 7210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUnaryInstruction"
		}"
		end

	llvmis_aconstant_fp (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantFP (node at line 7225)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantFP"
		}"
		end

	llvmdispose_memory_buffer (a_mem_buf: POINTER) is
 		-- LLVMDisposeMemoryBuffer (node at line 7228)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeMemoryBuffer"
		}"
		end

	llvmpointer_type (an_element_type: POINTER; an_address_space: NATURAL_32): POINTER is
 		-- LLVMPointerType (node at line 7237)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPointerType"
		}"
		end

	llvmconst_nuwadd (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNUWAdd (node at line 7249)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNUWAdd"
		}"
		end

	llvmbuild_gep (a_b: POINTER; a_pointer: POINTER; an_indices: POINTER; a_num_indices: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildGEP (node at line 7298)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildGEP"
		}"
		end

	llvmget_type_context (a_ty: POINTER): POINTER is
 		-- LLVMGetTypeContext (node at line 7324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTypeContext"
		}"
		end

	llvmbuild_is_not_null (an_argument_l7348_c7: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIsNotNull (node at line 7347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIsNotNull"
		}"
		end

	llvmbuild_ret_void (an_argument_l7373_c7: POINTER): POINTER is
 		-- LLVMBuildRetVoid (node at line 7372)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildRetVoid"
		}"
		end

	llvmis_aextract_value_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAExtractValueInst (node at line 7375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAExtractValueInst"
		}"
		end

	llvmcontext_dispose (a_c: POINTER) is
 		-- LLVMContextDispose (node at line 7393)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMContextDispose"
		}"
		end

	llvmbuild_phi (an_argument_l7404_c7: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPhi (node at line 7403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPhi"
		}"
		end

	llvmconst_lshr (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstLShr (node at line 7437)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstLShr"
		}"
		end

	llvmis_abinary_operator (a_val: POINTER): POINTER is
 		-- LLVMIsABinaryOperator (node at line 7452)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABinaryOperator"
		}"
		end

	llvmis_amem_intrinsic (a_val: POINTER): POINTER is
 		-- LLVMIsAMemIntrinsic (node at line 7455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemIntrinsic"
		}"
		end

	llvmis_afunction (a_val: POINTER): POINTER is
 		-- LLVMIsAFunction (node at line 7461)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFunction"
		}"
		end

	llvmset_global_constant (a_global_var: POINTER; an_is_constant: INTEGER_32) is
 		-- LLVMSetGlobalConstant (node at line 7467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetGlobalConstant"
		}"
		end

	llvmbuild_pointer_cast (an_argument_l7472_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPointerCast (node at line 7471)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPointerCast"
		}"
		end

	llvmconst_int_get_sext_value (a_constant_val: POINTER): INTEGER_64 is
 		-- LLVMConstIntGetSExtValue (node at line 7502)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntGetSExtValue"
		}"
		end

	llvmis_aunreachable_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAUnreachableInst (node at line 7505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUnreachableInst"
		}"
		end

	llvmis_adbg_info_intrinsic (a_val: POINTER): POINTER is
 		-- LLVMIsADbgInfoIntrinsic (node at line 7540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsADbgInfoIntrinsic"
		}"
		end

	llvmfloat_type: POINTER is
 		-- LLVMFloatType (node at line 7565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFloatType()"
		}"
		end

	llvmget_last_basic_block (a_fn: POINTER): POINTER is
 		-- LLVMGetLastBasicBlock (node at line 7575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastBasicBlock"
		}"
		end

	llvmis_ainsert_value_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAInsertValueInst (node at line 7578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInsertValueInst"
		}"
		end

	llvmconst_null (a_ty: POINTER): POINTER is
 		-- LLVMConstNull (node at line 7595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNull"
		}"
		end

	llvmconst_pointer_null (a_ty: POINTER): POINTER is
 		-- LLVMConstPointerNull (node at line 7601)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstPointerNull"
		}"
		end

	llvmis_aload_inst (a_val: POINTER): POINTER is
 		-- LLVMIsALoadInst (node at line 7632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsALoadInst"
		}"
		end

	llvmx86fp80type_in_context (a_c: POINTER): POINTER is
 		-- LLVMX86FP80TypeInContext (node at line 7678)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMX86FP80TypeInContext"
		}"
		end

	llvmposition_builder_at_end (a_builder: POINTER; a_block: POINTER) is
 		-- LLVMPositionBuilderAtEnd (node at line 7695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPositionBuilderAtEnd"
		}"
		end

	llvmconst_ashr (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstAShr (node at line 7700)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAShr"
		}"
		end

	llvmis_aalloca_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAAllocaInst (node at line 7733)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAAllocaInst"
		}"
		end

	llvmconst_sext_or_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstSExtOrBitCast (node at line 7736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSExtOrBitCast"
		}"
		end

	llvmappend_basic_block (a_fn: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAppendBasicBlock (node at line 7760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAppendBasicBlock"
		}"
		end

	llvmis_auito_fpinst (a_val: POINTER): POINTER is
 		-- LLVMIsAUIToFPInst (node at line 7769)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUIToFPInst"
		}"
		end

	llvmget_next_use (an_u: POINTER): POINTER is
 		-- LLVMGetNextUse (node at line 7772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextUse"
		}"
		end

	llvmconst_nswadd (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNSWAdd (node at line 7801)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNSWAdd"
		}"
		end

	llvmhas_metadata (a_val: POINTER): INTEGER_32 is
 		-- LLVMHasMetadata (node at line 7817)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMHasMetadata"
		}"
		end

	llvmbuild_nuwadd (an_argument_l7881_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNUWAdd (node at line 7880)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNUWAdd"
		}"
		end

	llvmis_declaration (a_global: POINTER): INTEGER_32 is
 		-- LLVMIsDeclaration (node at line 7895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsDeclaration"
		}"
		end

	llvmbuild_struct_gep (a_b: POINTER; a_pointer: POINTER; an_idx: NATURAL_32; a_name: POINTER): POINTER is
 		-- LLVMBuildStructGEP (node at line 7899)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildStructGEP"
		}"
		end

	llvmconst_string_in_context (a_c: POINTER; a_str: POINTER; a_length: NATURAL_32; a_dont_null_terminate: INTEGER_32): POINTER is
 		-- LLVMConstStringInContext (node at line 7908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstStringInContext"
		}"
		end

	llvmis_afpext_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPExtInst (node at line 7922)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPExtInst"
		}"
		end

	llvmbuild_nswneg (a_b: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNSWNeg (node at line 7925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNSWNeg"
		}"
		end

	llvmbuild_fadd (an_argument_l7936_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFAdd (node at line 7935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFAdd"
		}"
		end

	llvmis_aehselector_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAEHSelectorInst (node at line 7955)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAEHSelectorInst"
		}"
		end

	llvmposition_builder (a_builder: POINTER; a_block: POINTER; an_instr: POINTER) is
 		-- LLVMPositionBuilder (node at line 7958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPositionBuilder"
		}"
		end

	llvmmdstring (a_str: POINTER; a_slen: NATURAL_32): POINTER is
 		-- LLVMMDString (node at line 7963)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMMDString"
		}"
		end

	llvmbuild_fptrunc (an_argument_l7999_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPTrunc (node at line 7998)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPTrunc"
		}"
		end

	llvmget_attribute (an_arg: POINTER): INTEGER is
 		-- LLVMGetAttribute (node at line 8004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetAttribute"
		}"
		end

	llvmis_afpto_siinst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPToSIInst (node at line 8007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPToSIInst"
		}"
		end

	llvmcount_incoming (a_phi_node: POINTER): NATURAL_32 is
 		-- LLVMCountIncoming (node at line 8032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountIncoming"
		}"
		end

	llvmappend_basic_block_in_context (a_c: POINTER; a_fn: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAppendBasicBlockInContext (node at line 8054)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAppendBasicBlockInContext"
		}"
		end

	llvmint1type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt1TypeInContext (node at line 8059)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt1TypeInContext"
		}"
		end

	llvmget_target (a_m: POINTER): POINTER is
 		-- LLVMGetTarget (node at line 8083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTarget"
		}"
		end

	llvmget_named_function (a_m: POINTER; a_name: POINTER): POINTER is
 		-- LLVMGetNamedFunction (node at line 8112)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNamedFunction"
		}"
		end

	llvmdelete_type_name (a_m: POINTER; a_name: POINTER) is
 		-- LLVMDeleteTypeName (node at line 8120)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteTypeName"
		}"
		end

	llvmis_undef (a_val: POINTER): INTEGER_32 is
 		-- LLVMIsUndef (node at line 8124)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsUndef"
		}"
		end

	llvmadd_alias (a_m: POINTER; a_ty: POINTER; an_aliasee: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAddAlias (node at line 8136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddAlias"
		}"
		end

	llvmset_initializer (a_global_var: POINTER; a_constant_val: POINTER) is
 		-- LLVMSetInitializer (node at line 8142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInitializer"
		}"
		end

	llvmget_section (a_global: POINTER): POINTER is
 		-- LLVMGetSection (node at line 8188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetSection"
		}"
		end

	llvmconst_int_of_string (an_int_ty: POINTER; a_text: POINTER; a_radix: CHARACTER): POINTER is
 		-- LLVMConstIntOfString (node at line 8220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntOfString"
		}"
		end

	llvmbuild_exact_sdiv (an_argument_l8237_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildExactSDiv (node at line 8236)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildExactSDiv"
		}"
		end

	llvmcount_params (a_fn: POINTER): NATURAL_32 is
 		-- LLVMCountParams (node at line 8254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountParams"
		}"
		end

	llvmset_function_call_conv (a_fn: POINTER; a_cc: NATURAL_32) is
 		-- LLVMSetFunctionCallConv (node at line 8264)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetFunctionCallConv"
		}"
		end

	llvmbuild_xor (an_argument_l8270_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildXor (node at line 8269)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildXor"
		}"
		end

	llvmconst_srem (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstSRem (node at line 8286)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSRem"
		}"
		end

	llvmint1type: POINTER is
 		-- LLVMInt1Type (node at line 8300)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt1Type()"
		}"
		end

	llvmvector_type (an_element_type: POINTER; an_element_count: NATURAL_32): POINTER is
 		-- LLVMVectorType (node at line 8308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVectorType"
		}"
		end

	llvmset_metadata (a_val: POINTER; a_kind_id: NATURAL_32; a_node: POINTER) is
 		-- LLVMSetMetadata (node at line 8315)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetMetadata"
		}"
		end

	llvmget_params (a_fn: POINTER; a_params: POINTER) is
 		-- LLVMGetParams (node at line 8327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParams"
		}"
		end

	llvmconst_int_get_zext_value (a_constant_val: POINTER): NATURAL_64 is
 		-- LLVMConstIntGetZExtValue (node at line 8331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntGetZExtValue"
		}"
		end

	llvmis_aconstant_int (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantInt (node at line 8349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantInt"
		}"
		end

	llvmget_const_opcode (a_constant_val: POINTER): INTEGER is
 		-- LLVMGetConstOpcode (node at line 8352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetConstOpcode"
		}"
		end

	llvmis_aconstant_aggregate_zero (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantAggregateZero (node at line 8379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantAggregateZero"
		}"
		end

	llvmget_gc (a_fn: POINTER): POINTER is
 		-- LLVMGetGC (node at line 8382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetGC"
		}"
		end

	llvmis_aswitch_inst (a_val: POINTER): POINTER is
 		-- LLVMIsASwitchInst (node at line 8431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASwitchInst"
		}"
		end

	llvmis_aconstant_expr (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantExpr (node at line 8438)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantExpr"
		}"
		end

	llvmis_asext_inst (a_val: POINTER): POINTER is
 		-- LLVMIsASExtInst (node at line 8449)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASExtInst"
		}"
		end

	llvmget_return_type (a_function_ty: POINTER): POINTER is
 		-- LLVMGetReturnType (node at line 8466)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetReturnType"
		}"
		end

	llvmbuild_is_null (an_argument_l8486_c7: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIsNull (node at line 8485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIsNull"
		}"
		end

	llvmconst_fmul (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFMul (node at line 8490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFMul"
		}"
		end

	llvmbuild_nswadd (an_argument_l8504_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNSWAdd (node at line 8503)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNSWAdd"
		}"
		end

	llvmbuild_alloca (an_argument_l8524_c7: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAlloca (node at line 8523)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAlloca"
		}"
		end

	llvmis_ashuffle_vector_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAShuffleVectorInst (node at line 8546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAShuffleVectorInst"
		}"
		end

	llvmremove_instr_attribute (an_instr: POINTER; an_index: NATURAL_32; an_argument_l8552_c7: INTEGER) is
 		-- LLVMRemoveInstrAttribute (node at line 8549)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveInstrAttribute"
		}"
		end

	llvmconst_struct_in_context (a_c: POINTER; a_constant_vals: POINTER; a_count: NATURAL_32; a_packed: INTEGER_32): POINTER is
 		-- LLVMConstStructInContext (node at line 8559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstStructInContext"
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
	-- function unwrap in namespace llvm skipped.

end -- class CORE_EXTERNALS
