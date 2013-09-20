-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CORE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	llvmadd_alias (a_m: POINTER; a_ty: POINTER; an_aliasee: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAddAlias
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddAlias"
		}"
		end

	llvmadd_attribute (an_arg: POINTER; a_pa: INTEGER) is
 		-- LLVMAddAttribute
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddAttribute"
		}"
		end

	llvmadd_case (a_switch: POINTER; an_on_val: POINTER; a_dest: POINTER) is
 		-- LLVMAddCase
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddCase"
		}"
		end

	llvmadd_clause (a_landing_pad: POINTER; a_clause_val: POINTER) is
 		-- LLVMAddClause
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddClause"
		}"
		end

	llvmadd_destination (an_indirect_br: POINTER; a_dest: POINTER) is
 		-- LLVMAddDestination
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddDestination"
		}"
		end

	llvmadd_function (a_m: POINTER; a_name: POINTER; a_function_ty: POINTER): POINTER is
 		-- LLVMAddFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddFunction"
		}"
		end

	llvmadd_function_attr (a_fn: POINTER; a_pa: INTEGER) is
 		-- LLVMAddFunctionAttr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddFunctionAttr"
		}"
		end

	llvmadd_global (a_m: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAddGlobal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddGlobal"
		}"
		end

	llvmadd_global_in_address_space (a_m: POINTER; a_ty: POINTER; a_name: POINTER; an_address_space: NATURAL): POINTER is
 		-- LLVMAddGlobalInAddressSpace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddGlobalInAddressSpace"
		}"
		end

	llvmadd_incoming (a_phi_node: POINTER; an_incoming_values: POINTER; an_incoming_blocks: POINTER; a_count: NATURAL) is
 		-- LLVMAddIncoming
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddIncoming"
		}"
		end

	llvmadd_instr_attribute (an_instr: POINTER; an_index: NATURAL; an_argument_l3370_c7: INTEGER) is
 		-- LLVMAddInstrAttribute
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddInstrAttribute"
		}"
		end

	llvmadd_named_metadata_operand (a_m: POINTER; a_name: POINTER; a_val: POINTER) is
 		-- LLVMAddNamedMetadataOperand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAddNamedMetadataOperand"
		}"
		end

	llvmalign_of (a_ty: POINTER): POINTER is
 		-- LLVMAlignOf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAlignOf"
		}"
		end

	llvmappend_basic_block (a_fn: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAppendBasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAppendBasicBlock"
		}"
		end

	llvmappend_basic_block_in_context (a_c: POINTER; a_fn: POINTER; a_name: POINTER): POINTER is
 		-- LLVMAppendBasicBlockInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMAppendBasicBlockInContext"
		}"
		end

	llvmarray_type (an_element_type: POINTER; an_element_count: NATURAL): POINTER is
 		-- LLVMArrayType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMArrayType"
		}"
		end

	llvmbasic_block_as_value (a_bb: POINTER): POINTER is
 		-- LLVMBasicBlockAsValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBasicBlockAsValue"
		}"
		end

	llvmblock_address (a_f: POINTER; a_bb: POINTER): POINTER is
 		-- LLVMBlockAddress
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBlockAddress"
		}"
		end

	llvmbuild_add (an_argument_l6825_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAdd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAdd"
		}"
		end

	llvmbuild_aggregate_ret (an_argument_l6221_c7: POINTER; a_ret_vals: POINTER; a_n: NATURAL): POINTER is
 		-- LLVMBuildAggregateRet
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAggregateRet"
		}"
		end

	llvmbuild_alloca (an_argument_l8543_c7: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAlloca
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAlloca"
		}"
		end

	llvmbuild_and (an_argument_l6977_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAnd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAnd"
		}"
		end

	llvmbuild_array_alloca (an_argument_l3570_c7: POINTER; a_ty: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildArrayAlloca
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildArrayAlloca"
		}"
		end

	llvmbuild_array_malloc (an_argument_l1507_c7: POINTER; a_ty: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildArrayMalloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildArrayMalloc"
		}"
		end

	llvmbuild_ashr (an_argument_l4263_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildAShr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildAShr"
		}"
		end

	llvmbuild_bin_op (a_b: POINTER; an_op: INTEGER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildBinOp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildBinOp"
		}"
		end

	llvmbuild_bit_cast (an_argument_l3123_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildBitCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildBitCast"
		}"
		end

	llvmbuild_br (an_argument_l5681_c7: POINTER; a_dest: POINTER): POINTER is
 		-- LLVMBuildBr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildBr"
		}"
		end

	llvmbuild_call (an_argument_l8406_c7: POINTER; a_fn: POINTER; an_args: POINTER; a_num_args: NATURAL; a_name: POINTER): POINTER is
 		-- LLVMBuildCall
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildCall"
		}"
		end

	llvmbuild_cast (a_b: POINTER; an_op: INTEGER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildCast"
		}"
		end

	llvmbuild_cond_br (an_argument_l6446_c7: POINTER; an_if_external: POINTER; a_then_external: POINTER; an_else_external: POINTER): POINTER is
 		-- LLVMBuildCondBr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildCondBr"
		}"
		end

	llvmbuild_exact_sdiv (an_argument_l8209_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildExactSDiv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildExactSDiv"
		}"
		end

	llvmbuild_extract_element (an_argument_l1019_c7: POINTER; a_vec_val: POINTER; an_index: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildExtractElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildExtractElement"
		}"
		end

	llvmbuild_extract_value (an_argument_l1566_c7: POINTER; an_agg_val: POINTER; an_index: NATURAL; a_name: POINTER): POINTER is
 		-- LLVMBuildExtractValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildExtractValue"
		}"
		end

	llvmbuild_fadd (an_argument_l7890_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFAdd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFAdd"
		}"
		end

	llvmbuild_fcmp (an_argument_l1770_c7: POINTER; an_op: INTEGER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFCmp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFCmp"
		}"
		end

	llvmbuild_fdiv (an_argument_l2807_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFDiv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFDiv"
		}"
		end

	llvmbuild_fmul (an_argument_l5013_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFMul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFMul"
		}"
		end

	llvmbuild_fneg (an_argument_l5821_c7: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFNeg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFNeg"
		}"
		end

	llvmbuild_fpcast (an_argument_l4699_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPCast"
		}"
		end

	llvmbuild_fpext (an_argument_l4688_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPExt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPExt"
		}"
		end

	llvmbuild_fpto_si (an_argument_l3710_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPToSI
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPToSI"
		}"
		end

	llvmbuild_fpto_ui (an_argument_l3753_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPToUI
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPToUI"
		}"
		end

	llvmbuild_fptrunc (an_argument_l7968_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFPTrunc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFPTrunc"
		}"
		end

	llvmbuild_free (an_argument_l5318_c7: POINTER; a_pointer_val: POINTER): POINTER is
 		-- LLVMBuildFree
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFree"
		}"
		end

	llvmbuild_frem (an_argument_l2037_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFRem
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFRem"
		}"
		end

	llvmbuild_fsub (an_argument_l3497_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildFSub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildFSub"
		}"
		end

	llvmbuild_gep (a_b: POINTER; a_pointer: POINTER; an_indices: POINTER; a_num_indices: NATURAL; a_name: POINTER): POINTER is
 		-- LLVMBuildGEP
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildGEP"
		}"
		end

	llvmbuild_global_string (a_b: POINTER; a_str: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildGlobalString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildGlobalString"
		}"
		end

	llvmbuild_global_string_ptr (a_b: POINTER; a_str: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildGlobalStringPtr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildGlobalStringPtr"
		}"
		end

	llvmbuild_icmp (an_argument_l6195_c7: POINTER; an_op: INTEGER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildICmp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildICmp"
		}"
		end

	llvmbuild_in_bounds_gep (a_b: POINTER; a_pointer: POINTER; an_indices: POINTER; a_num_indices: NATURAL; a_name: POINTER): POINTER is
 		-- LLVMBuildInBoundsGEP
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInBoundsGEP"
		}"
		end

	llvmbuild_indirect_br (a_b: POINTER; an_addr: POINTER; a_num_dests: NATURAL): POINTER is
 		-- LLVMBuildIndirectBr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIndirectBr"
		}"
		end

	llvmbuild_insert_element (an_argument_l2503_c7: POINTER; a_vec_val: POINTER; an_elt_val: POINTER; an_index: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildInsertElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInsertElement"
		}"
		end

	llvmbuild_insert_value (an_argument_l4932_c7: POINTER; an_agg_val: POINTER; an_elt_val: POINTER; an_index: NATURAL; a_name: POINTER): POINTER is
 		-- LLVMBuildInsertValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInsertValue"
		}"
		end

	llvmbuild_int_cast (an_argument_l2710_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIntCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIntCast"
		}"
		end

	llvmbuild_int_to_ptr (an_argument_l5630_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIntToPtr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIntToPtr"
		}"
		end

	llvmbuild_invoke (an_argument_l1140_c7: POINTER; a_fn: POINTER; an_args: POINTER; a_num_args: NATURAL; a_then_external: POINTER; a_catch: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildInvoke
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildInvoke"
		}"
		end

	llvmbuild_is_not_null (an_argument_l1446_c7: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIsNotNull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIsNotNull"
		}"
		end

	llvmbuild_is_null (an_argument_l8506_c7: POINTER; a_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildIsNull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildIsNull"
		}"
		end

	llvmbuild_landing_pad (a_b: POINTER; a_ty: POINTER; a_pers_fn: POINTER; a_num_clauses: NATURAL; a_name: POINTER): POINTER is
 		-- LLVMBuildLandingPad
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildLandingPad"
		}"
		end

	llvmbuild_load (an_argument_l2351_c7: POINTER; a_pointer_val: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildLoad
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildLoad"
		}"
		end

	llvmbuild_lshr (an_argument_l7012_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildLShr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildLShr"
		}"
		end

	llvmbuild_malloc (an_argument_l5032_c7: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildMalloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildMalloc"
		}"
		end

	llvmbuild_mul (an_argument_l4067_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildMul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildMul"
		}"
		end

	llvmbuild_neg (an_argument_l4866_c7: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNeg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNeg"
		}"
		end

	llvmbuild_not (an_argument_l5027_c7: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNot"
		}"
		end

	llvmbuild_nswadd (an_argument_l8524_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNSWAdd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNSWAdd"
		}"
		end

	llvmbuild_nswmul (an_argument_l495_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNSWMul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNSWMul"
		}"
		end

	llvmbuild_nswneg (a_b: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNSWNeg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNSWNeg"
		}"
		end

	llvmbuild_nswsub (an_argument_l4249_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNSWSub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNSWSub"
		}"
		end

	llvmbuild_nuwadd (an_argument_l7834_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNUWAdd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNUWAdd"
		}"
		end

	llvmbuild_nuwmul (an_argument_l5055_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNUWMul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNUWMul"
		}"
		end

	llvmbuild_nuwneg (a_b: POINTER; a_v: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNUWNeg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNUWNeg"
		}"
		end

	llvmbuild_nuwsub (an_argument_l3552_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildNUWSub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildNUWSub"
		}"
		end

	llvmbuild_or (an_argument_l5873_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildOr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildOr"
		}"
		end

	llvmbuild_phi (an_argument_l7348_c7: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPhi
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPhi"
		}"
		end

	llvmbuild_pointer_cast (an_argument_l7420_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPointerCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPointerCast"
		}"
		end

	llvmbuild_ptr_diff (an_argument_l5661_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPtrDiff
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPtrDiff"
		}"
		end

	llvmbuild_ptr_to_int (an_argument_l3620_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildPtrToInt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildPtrToInt"
		}"
		end

	llvmbuild_resume (a_b: POINTER; an_exn: POINTER): POINTER is
 		-- LLVMBuildResume
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildResume"
		}"
		end

	llvmbuild_ret (an_argument_l1753_c7: POINTER; a_v: POINTER): POINTER is
 		-- LLVMBuildRet
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildRet"
		}"
		end

	llvmbuild_ret_void (an_argument_l7308_c7: POINTER): POINTER is
 		-- LLVMBuildRetVoid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildRetVoid"
		}"
		end

	llvmbuild_sdiv (an_argument_l5542_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSDiv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSDiv"
		}"
		end

	llvmbuild_select (an_argument_l6311_c7: POINTER; an_if_external: POINTER; a_then_external: POINTER; an_else_external: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSelect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSelect"
		}"
		end

	llvmbuild_sext (an_argument_l7103_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSExt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSExt"
		}"
		end

	llvmbuild_sext_or_bit_cast (an_argument_l5326_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSExtOrBitCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSExtOrBitCast"
		}"
		end

	llvmbuild_shl (an_argument_l2234_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildShl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildShl"
		}"
		end

	llvmbuild_shuffle_vector (an_argument_l2514_c7: POINTER; a_v1: POINTER; a_v2: POINTER; a_mask: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildShuffleVector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildShuffleVector"
		}"
		end

	llvmbuild_sito_fp (an_argument_l6942_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSIToFP
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSIToFP"
		}"
		end

	llvmbuild_srem (an_argument_l4772_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSRem
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSRem"
		}"
		end

	llvmbuild_store (an_argument_l2078_c7: POINTER; a_val: POINTER; a_ptr: POINTER): POINTER is
 		-- LLVMBuildStore
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildStore"
		}"
		end

	llvmbuild_struct_gep (a_b: POINTER; a_pointer: POINTER; an_idx: NATURAL; a_name: POINTER): POINTER is
 		-- LLVMBuildStructGEP
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildStructGEP"
		}"
		end

	llvmbuild_sub (an_argument_l2443_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildSub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSub"
		}"
		end

	llvmbuild_switch (an_argument_l7988_c7: POINTER; a_v: POINTER; an_else_external: POINTER; a_num_cases: NATURAL): POINTER is
 		-- LLVMBuildSwitch
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildSwitch"
		}"
		end

	llvmbuild_trunc (an_argument_l5651_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildTrunc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildTrunc"
		}"
		end

	llvmbuild_trunc_or_bit_cast (an_argument_l1777_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildTruncOrBitCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildTruncOrBitCast"
		}"
		end

	llvmbuild_udiv (an_argument_l103_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildUDiv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildUDiv"
		}"
		end

	llvmbuild_uito_fp (an_argument_l4130_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildUIToFP
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildUIToFP"
		}"
		end

	llvmbuild_unreachable (an_argument_l475_c7: POINTER): POINTER is
 		-- LLVMBuildUnreachable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildUnreachable"
		}"
		end

	llvmbuild_urem (an_argument_l4993_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildURem
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildURem"
		}"
		end

	llvmbuild_vaarg (an_argument_l6093_c7: POINTER; a_list: POINTER; a_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildVAArg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildVAArg"
		}"
		end

	llvmbuild_xor (an_argument_l8245_c7: POINTER; a_lhs: POINTER; a_rhs: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildXor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildXor"
		}"
		end

	llvmbuild_zext (an_argument_l798_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildZExt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildZExt"
		}"
		end

	llvmbuild_zext_or_bit_cast (an_argument_l933_c7: POINTER; a_val: POINTER; a_dest_ty: POINTER; a_name: POINTER): POINTER is
 		-- LLVMBuildZExtOrBitCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMBuildZExtOrBitCast"
		}"
		end

	llvmclear_insertion_position (a_builder: POINTER) is
 		-- LLVMClearInsertionPosition
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMClearInsertionPosition"
		}"
		end

	llvmconst_add (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstAdd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAdd"
		}"
		end

	llvmconst_all_ones (a_ty: POINTER): POINTER is
 		-- LLVMConstAllOnes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAllOnes"
		}"
		end

	llvmconst_and (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstAnd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAnd"
		}"
		end

	llvmconst_array (an_element_ty: POINTER; a_constant_vals: POINTER; a_length: NATURAL): POINTER is
 		-- LLVMConstArray
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstArray"
		}"
		end

	llvmconst_ashr (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstAShr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstAShr"
		}"
		end

	llvmconst_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstBitCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstBitCast"
		}"
		end

	llvmconst_exact_sdiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstExactSDiv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstExactSDiv"
		}"
		end

	llvmconst_extract_element (a_vector_constant: POINTER; an_index_constant: POINTER): POINTER is
 		-- LLVMConstExtractElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstExtractElement"
		}"
		end

	llvmconst_extract_value (an_agg_constant: POINTER; an_idx_list: POINTER; a_num_idx: NATURAL): POINTER is
 		-- LLVMConstExtractValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstExtractValue"
		}"
		end

	llvmconst_fadd (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFAdd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFAdd"
		}"
		end

	llvmconst_fcmp (a_predicate: INTEGER; a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFCmp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFCmp"
		}"
		end

	llvmconst_fdiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFDiv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFDiv"
		}"
		end

	llvmconst_fmul (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFMul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFMul"
		}"
		end

	llvmconst_fneg (a_constant_val: POINTER): POINTER is
 		-- LLVMConstFNeg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFNeg"
		}"
		end

	llvmconst_fpcast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPCast"
		}"
		end

	llvmconst_fpext (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPExt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPExt"
		}"
		end

	llvmconst_fpto_si (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPToSI
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPToSI"
		}"
		end

	llvmconst_fpto_ui (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPToUI
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPToUI"
		}"
		end

	llvmconst_fptrunc (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstFPTrunc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFPTrunc"
		}"
		end

	llvmconst_frem (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFRem
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFRem"
		}"
		end

	llvmconst_fsub (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstFSub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstFSub"
		}"
		end

	llvmconst_gep (a_constant_val: POINTER; a_constant_indices: POINTER; a_num_indices: NATURAL): POINTER is
 		-- LLVMConstGEP
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstGEP"
		}"
		end

	llvmconst_icmp (a_predicate: INTEGER; a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstICmp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstICmp"
		}"
		end

	llvmconst_in_bounds_gep (a_constant_val: POINTER; a_constant_indices: POINTER; a_num_indices: NATURAL): POINTER is
 		-- LLVMConstInBoundsGEP
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInBoundsGEP"
		}"
		end

	llvmconst_inline_asm (a_ty: POINTER; an_asm_string: POINTER; a_constraints: POINTER; a_has_side_effects: INTEGER; an_is_align_stack: INTEGER): POINTER is
 		-- LLVMConstInlineAsm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInlineAsm"
		}"
		end

	llvmconst_insert_element (a_vector_constant: POINTER; an_element_value_constant: POINTER; an_index_constant: POINTER): POINTER is
 		-- LLVMConstInsertElement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInsertElement"
		}"
		end

	llvmconst_insert_value (an_agg_constant: POINTER; an_element_value_constant: POINTER; an_idx_list: POINTER; a_num_idx: NATURAL): POINTER is
 		-- LLVMConstInsertValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInsertValue"
		}"
		end

	llvmconst_int (an_int_ty: POINTER; a_n: NATURAL_64; a_sign_extend: INTEGER): POINTER is
 		-- LLVMConstInt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstInt"
		}"
		end

	llvmconst_int_cast (a_constant_val: POINTER; a_to_type: POINTER; an_is_signed: INTEGER): POINTER is
 		-- LLVMConstIntCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntCast"
		}"
		end

	llvmconst_int_get_sext_value (a_constant_val: POINTER): INTEGER_64 is
 		-- LLVMConstIntGetSExtValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntGetSExtValue"
		}"
		end

	llvmconst_int_get_zext_value (a_constant_val: POINTER): NATURAL_64 is
 		-- LLVMConstIntGetZExtValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntGetZExtValue"
		}"
		end

	llvmconst_int_of_arbitrary_precision (an_int_ty: POINTER; a_num_words: NATURAL; a_words: POINTER): POINTER is
 		-- LLVMConstIntOfArbitraryPrecision
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntOfArbitraryPrecision"
		}"
		end

	llvmconst_int_of_string (an_int_ty: POINTER; a_text: POINTER; a_radix: like uint8_t): POINTER is
 		-- LLVMConstIntOfString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntOfString"
		}"
		end

	llvmconst_int_of_string_and_size (an_int_ty: POINTER; a_text: POINTER; a_slen: NATURAL; a_radix: like uint8_t): POINTER is
 		-- LLVMConstIntOfStringAndSize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntOfStringAndSize"
		}"
		end

	llvmconst_int_to_ptr (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstIntToPtr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstIntToPtr"
		}"
		end

	llvmconst_lshr (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstLShr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstLShr"
		}"
		end

	llvmconst_mul (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstMul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstMul"
		}"
		end

	llvmconst_named_struct (a_struct_ty: POINTER; a_constant_vals: POINTER; a_count: NATURAL): POINTER is
 		-- LLVMConstNamedStruct
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNamedStruct"
		}"
		end

	llvmconst_neg (a_constant_val: POINTER): POINTER is
 		-- LLVMConstNeg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNeg"
		}"
		end

	llvmconst_not (a_constant_val: POINTER): POINTER is
 		-- LLVMConstNot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNot"
		}"
		end

	llvmconst_nswadd (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNSWAdd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNSWAdd"
		}"
		end

	llvmconst_nswmul (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNSWMul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNSWMul"
		}"
		end

	llvmconst_nswneg (a_constant_val: POINTER): POINTER is
 		-- LLVMConstNSWNeg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNSWNeg"
		}"
		end

	llvmconst_nswsub (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNSWSub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNSWSub"
		}"
		end

	llvmconst_null (a_ty: POINTER): POINTER is
 		-- LLVMConstNull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNull"
		}"
		end

	llvmconst_nuwadd (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNUWAdd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNUWAdd"
		}"
		end

	llvmconst_nuwmul (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNUWMul
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNUWMul"
		}"
		end

	llvmconst_nuwneg (a_constant_val: POINTER): POINTER is
 		-- LLVMConstNUWNeg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNUWNeg"
		}"
		end

	llvmconst_nuwsub (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstNUWSub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstNUWSub"
		}"
		end

	llvmconst_or (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstOr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstOr"
		}"
		end

	llvmconst_pointer_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstPointerCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstPointerCast"
		}"
		end

	llvmconst_pointer_null (a_ty: POINTER): POINTER is
 		-- LLVMConstPointerNull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstPointerNull"
		}"
		end

	llvmconst_ptr_to_int (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstPtrToInt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstPtrToInt"
		}"
		end

	llvmconst_real (a_real_ty: POINTER; a_n: REAL): POINTER is
 		-- LLVMConstReal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstReal"
		}"
		end

	llvmconst_real_of_string (a_real_ty: POINTER; a_text: POINTER): POINTER is
 		-- LLVMConstRealOfString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstRealOfString"
		}"
		end

	llvmconst_real_of_string_and_size (a_real_ty: POINTER; a_text: POINTER; a_slen: NATURAL): POINTER is
 		-- LLVMConstRealOfStringAndSize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstRealOfStringAndSize"
		}"
		end

	llvmconst_sdiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstSDiv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSDiv"
		}"
		end

	llvmconst_select (a_constant_condition: POINTER; a_constant_if_true: POINTER; a_constant_if_false: POINTER): POINTER is
 		-- LLVMConstSelect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSelect"
		}"
		end

	llvmconst_sext (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstSExt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSExt"
		}"
		end

	llvmconst_sext_or_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstSExtOrBitCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSExtOrBitCast"
		}"
		end

	llvmconst_shl (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstShl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstShl"
		}"
		end

	llvmconst_shuffle_vector (a_vector_aconstant: POINTER; a_vector_bconstant: POINTER; a_mask_constant: POINTER): POINTER is
 		-- LLVMConstShuffleVector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstShuffleVector"
		}"
		end

	llvmconst_sito_fp (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstSIToFP
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSIToFP"
		}"
		end

	llvmconst_srem (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstSRem
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSRem"
		}"
		end

	llvmconst_string (a_str: POINTER; a_length: NATURAL; a_dont_null_terminate: INTEGER): POINTER is
 		-- LLVMConstString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstString"
		}"
		end

	llvmconst_string_in_context (a_c: POINTER; a_str: POINTER; a_length: NATURAL; a_dont_null_terminate: INTEGER): POINTER is
 		-- LLVMConstStringInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstStringInContext"
		}"
		end

	llvmconst_struct (a_constant_vals: POINTER; a_count: NATURAL; a_packed: INTEGER): POINTER is
 		-- LLVMConstStruct
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstStruct"
		}"
		end

	llvmconst_struct_in_context (a_c: POINTER; a_constant_vals: POINTER; a_count: NATURAL; a_packed: INTEGER): POINTER is
 		-- LLVMConstStructInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstStructInContext"
		}"
		end

	llvmconst_sub (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstSub
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstSub"
		}"
		end

	llvmconst_trunc (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstTrunc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstTrunc"
		}"
		end

	llvmconst_trunc_or_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstTruncOrBitCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstTruncOrBitCast"
		}"
		end

	llvmconst_udiv (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstUDiv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstUDiv"
		}"
		end

	llvmconst_uito_fp (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstUIToFP
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstUIToFP"
		}"
		end

	llvmconst_urem (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstURem
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstURem"
		}"
		end

	llvmconst_vector (a_scalar_constant_vals: POINTER; a_size: NATURAL): POINTER is
 		-- LLVMConstVector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstVector"
		}"
		end

	llvmconst_xor (a_lhsconstant: POINTER; a_rhsconstant: POINTER): POINTER is
 		-- LLVMConstXor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstXor"
		}"
		end

	llvmconst_zext (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstZExt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstZExt"
		}"
		end

	llvmconst_zext_or_bit_cast (a_constant_val: POINTER; a_to_type: POINTER): POINTER is
 		-- LLVMConstZExtOrBitCast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMConstZExtOrBitCast"
		}"
		end

	llvmcontext_create: POINTER is
 		-- LLVMContextCreate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMContextCreate()"
		}"
		end

	llvmcontext_dispose (a_c: POINTER) is
 		-- LLVMContextDispose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMContextDispose"
		}"
		end

	llvmcount_basic_blocks (a_fn: POINTER): NATURAL is
 		-- LLVMCountBasicBlocks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountBasicBlocks"
		}"
		end

	llvmcount_incoming (a_phi_node: POINTER): NATURAL is
 		-- LLVMCountIncoming
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountIncoming"
		}"
		end

	llvmcount_param_types (a_function_ty: POINTER): NATURAL is
 		-- LLVMCountParamTypes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountParamTypes"
		}"
		end

	llvmcount_params (a_fn: POINTER): NATURAL is
 		-- LLVMCountParams
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountParams"
		}"
		end

	llvmcount_struct_element_types (a_struct_ty: POINTER): NATURAL is
 		-- LLVMCountStructElementTypes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCountStructElementTypes"
		}"
		end

	llvmcreate_builder: POINTER is
 		-- LLVMCreateBuilder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateBuilder()"
		}"
		end

	llvmcreate_builder_in_context (a_c: POINTER): POINTER is
 		-- LLVMCreateBuilderInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateBuilderInContext"
		}"
		end

	llvmcreate_function_pass_manager (a_mp: POINTER): POINTER is
 		-- LLVMCreateFunctionPassManager
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateFunctionPassManager"
		}"
		end

	llvmcreate_function_pass_manager_for_module (a_m: POINTER): POINTER is
 		-- LLVMCreateFunctionPassManagerForModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateFunctionPassManagerForModule"
		}"
		end

	llvmcreate_memory_buffer_with_contents_of_file (a_path: POINTER; an_out_mem_buf: POINTER; an_out_message: POINTER): INTEGER is
 		-- LLVMCreateMemoryBufferWithContentsOfFile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateMemoryBufferWithContentsOfFile"
		}"
		end

	llvmcreate_memory_buffer_with_stdin (an_out_mem_buf: POINTER; an_out_message: POINTER): INTEGER is
 		-- LLVMCreateMemoryBufferWithSTDIN
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateMemoryBufferWithSTDIN"
		}"
		end

	llvmcreate_module_provider_for_existing_module (a_m: POINTER): POINTER is
 		-- LLVMCreateModuleProviderForExistingModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreateModuleProviderForExistingModule"
		}"
		end

	llvmcreate_pass_manager: POINTER is
 		-- LLVMCreatePassManager
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMCreatePassManager()"
		}"
		end

	llvmdelete_basic_block (a_bb: POINTER) is
 		-- LLVMDeleteBasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteBasicBlock"
		}"
		end

	llvmdelete_function (a_fn: POINTER) is
 		-- LLVMDeleteFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteFunction"
		}"
		end

	llvmdelete_global (a_global_var: POINTER) is
 		-- LLVMDeleteGlobal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDeleteGlobal"
		}"
		end

	llvmdispose_builder (a_builder: POINTER) is
 		-- LLVMDisposeBuilder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeBuilder"
		}"
		end

	llvmdispose_memory_buffer (a_mem_buf: POINTER) is
 		-- LLVMDisposeMemoryBuffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeMemoryBuffer"
		}"
		end

	llvmdispose_message (a_message: POINTER) is
 		-- LLVMDisposeMessage
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeMessage"
		}"
		end

	llvmdispose_module (a_m: POINTER) is
 		-- LLVMDisposeModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeModule"
		}"
		end

	llvmdispose_module_provider (a_m: POINTER) is
 		-- LLVMDisposeModuleProvider
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposeModuleProvider"
		}"
		end

	llvmdispose_pass_manager (a_pm: POINTER) is
 		-- LLVMDisposePassManager
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDisposePassManager"
		}"
		end

	llvmdouble_type: POINTER is
 		-- LLVMDoubleType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDoubleType()"
		}"
		end

	llvmdouble_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMDoubleTypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDoubleTypeInContext"
		}"
		end

	llvmdump_module (a_m: POINTER) is
 		-- LLVMDumpModule
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDumpModule"
		}"
		end

	llvmdump_value (a_val: POINTER) is
 		-- LLVMDumpValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMDumpValue"
		}"
		end

	llvmfinalize_function_pass_manager (a_fpm: POINTER): INTEGER is
 		-- LLVMFinalizeFunctionPassManager
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFinalizeFunctionPassManager"
		}"
		end

	llvmfloat_type: POINTER is
 		-- LLVMFloatType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFloatType()"
		}"
		end

	llvmfloat_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMFloatTypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFloatTypeInContext"
		}"
		end

	llvmfp128type: POINTER is
 		-- LLVMFP128Type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFP128Type()"
		}"
		end

	llvmfp128type_in_context (a_c: POINTER): POINTER is
 		-- LLVMFP128TypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFP128TypeInContext"
		}"
		end

	llvmfunction_type (a_return_type: POINTER; a_param_types: POINTER; a_param_count: NATURAL; an_is_var_arg: INTEGER): POINTER is
 		-- LLVMFunctionType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMFunctionType"
		}"
		end

	llvmget_alignment (a_global: POINTER): NATURAL is
 		-- LLVMGetAlignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetAlignment"
		}"
		end

	llvmget_array_length (an_array_ty: POINTER): NATURAL is
 		-- LLVMGetArrayLength
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetArrayLength"
		}"
		end

	llvmget_attribute (an_arg: POINTER): INTEGER is
 		-- LLVMGetAttribute
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetAttribute"
		}"
		end

	llvmget_basic_block_parent (a_bb: POINTER): POINTER is
 		-- LLVMGetBasicBlockParent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBasicBlockParent"
		}"
		end

	llvmget_basic_block_terminator (a_bb: POINTER): POINTER is
 		-- LLVMGetBasicBlockTerminator
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBasicBlockTerminator"
		}"
		end

	llvmget_basic_blocks (a_fn: POINTER; a_basic_blocks: POINTER) is
 		-- LLVMGetBasicBlocks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetBasicBlocks"
		}"
		end

	llvmget_const_opcode (a_constant_val: POINTER): INTEGER is
 		-- LLVMGetConstOpcode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetConstOpcode"
		}"
		end

	llvmget_current_debug_location (a_builder: POINTER): POINTER is
 		-- LLVMGetCurrentDebugLocation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetCurrentDebugLocation"
		}"
		end

	llvmget_data_layout (a_m: POINTER): POINTER is
 		-- LLVMGetDataLayout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetDataLayout"
		}"
		end

	llvmget_element_type (a_ty: POINTER): POINTER is
 		-- LLVMGetElementType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetElementType"
		}"
		end

	llvmget_entry_basic_block (a_fn: POINTER): POINTER is
 		-- LLVMGetEntryBasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetEntryBasicBlock"
		}"
		end

	llvmget_first_basic_block (a_fn: POINTER): POINTER is
 		-- LLVMGetFirstBasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstBasicBlock"
		}"
		end

	llvmget_first_function (a_m: POINTER): POINTER is
 		-- LLVMGetFirstFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstFunction"
		}"
		end

	llvmget_first_global (a_m: POINTER): POINTER is
 		-- LLVMGetFirstGlobal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstGlobal"
		}"
		end

	llvmget_first_instruction (a_bb: POINTER): POINTER is
 		-- LLVMGetFirstInstruction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstInstruction"
		}"
		end

	llvmget_first_param (a_fn: POINTER): POINTER is
 		-- LLVMGetFirstParam
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstParam"
		}"
		end

	llvmget_first_use (a_val: POINTER): POINTER is
 		-- LLVMGetFirstUse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFirstUse"
		}"
		end

	llvmget_function_attr (a_fn: POINTER): INTEGER is
 		-- LLVMGetFunctionAttr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFunctionAttr"
		}"
		end

	llvmget_function_call_conv (a_fn: POINTER): NATURAL is
 		-- LLVMGetFunctionCallConv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetFunctionCallConv"
		}"
		end

	llvmget_gc (a_fn: POINTER): POINTER is
 		-- LLVMGetGC
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetGC"
		}"
		end

	llvmget_global_context: POINTER is
 		-- LLVMGetGlobalContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetGlobalContext()"
		}"
		end

	llvmget_global_parent (a_global: POINTER): POINTER is
 		-- LLVMGetGlobalParent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetGlobalParent"
		}"
		end

	llvmget_global_pass_registry: POINTER is
 		-- LLVMGetGlobalPassRegistry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetGlobalPassRegistry()"
		}"
		end

	llvmget_icmp_predicate (an_inst: POINTER): INTEGER is
 		-- LLVMGetICmpPredicate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetICmpPredicate"
		}"
		end

	llvmget_incoming_block (a_phi_node: POINTER; an_index: NATURAL): POINTER is
 		-- LLVMGetIncomingBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIncomingBlock"
		}"
		end

	llvmget_incoming_value (a_phi_node: POINTER; an_index: NATURAL): POINTER is
 		-- LLVMGetIncomingValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIncomingValue"
		}"
		end

	llvmget_initializer (a_global_var: POINTER): POINTER is
 		-- LLVMGetInitializer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInitializer"
		}"
		end

	llvmget_insert_block (a_builder: POINTER): POINTER is
 		-- LLVMGetInsertBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInsertBlock"
		}"
		end

	llvmget_instruction_call_conv (an_instr: POINTER): NATURAL is
 		-- LLVMGetInstructionCallConv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInstructionCallConv"
		}"
		end

	llvmget_instruction_opcode (an_inst: POINTER): INTEGER is
 		-- LLVMGetInstructionOpcode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInstructionOpcode"
		}"
		end

	llvmget_instruction_parent (an_inst: POINTER): POINTER is
 		-- LLVMGetInstructionParent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetInstructionParent"
		}"
		end

	llvmget_int_type_width (an_integer_ty: POINTER): NATURAL is
 		-- LLVMGetIntTypeWidth
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIntTypeWidth"
		}"
		end

	llvmget_intrinsic_id (a_fn: POINTER): NATURAL is
 		-- LLVMGetIntrinsicID
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetIntrinsicID"
		}"
		end

	llvmget_last_basic_block (a_fn: POINTER): POINTER is
 		-- LLVMGetLastBasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastBasicBlock"
		}"
		end

	llvmget_last_function (a_m: POINTER): POINTER is
 		-- LLVMGetLastFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastFunction"
		}"
		end

	llvmget_last_global (a_m: POINTER): POINTER is
 		-- LLVMGetLastGlobal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastGlobal"
		}"
		end

	llvmget_last_instruction (a_bb: POINTER): POINTER is
 		-- LLVMGetLastInstruction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastInstruction"
		}"
		end

	llvmget_last_param (a_fn: POINTER): POINTER is
 		-- LLVMGetLastParam
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLastParam"
		}"
		end

	llvmget_linkage (a_global: POINTER): INTEGER is
 		-- LLVMGetLinkage
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetLinkage"
		}"
		end

	llvmget_mdkind_id (a_name: POINTER; a_slen: NATURAL): NATURAL is
 		-- LLVMGetMDKindID
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetMDKindID"
		}"
		end

	llvmget_mdkind_idin_context (a_c: POINTER; a_name: POINTER; a_slen: NATURAL): NATURAL is
 		-- LLVMGetMDKindIDInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetMDKindIDInContext"
		}"
		end

	llvmget_mdstring (a_v: POINTER; a_len: POINTER): POINTER is
 		-- LLVMGetMDString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetMDString"
		}"
		end

	llvmget_metadata (a_val: POINTER; a_kind_id: NATURAL): POINTER is
 		-- LLVMGetMetadata
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetMetadata"
		}"
		end

	llvmget_module_context (a_m: POINTER): POINTER is
 		-- LLVMGetModuleContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetModuleContext"
		}"
		end

	llvmget_named_function (a_m: POINTER; a_name: POINTER): POINTER is
 		-- LLVMGetNamedFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNamedFunction"
		}"
		end

	llvmget_named_global (a_m: POINTER; a_name: POINTER): POINTER is
 		-- LLVMGetNamedGlobal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNamedGlobal"
		}"
		end

	llvmget_named_metadata_num_operands (a_m: POINTER; a_name: POINTER): NATURAL is
 		-- LLVMGetNamedMetadataNumOperands
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNamedMetadataNumOperands"
		}"
		end

	llvmget_named_metadata_operands (a_m: POINTER; a_name: POINTER; a_dest: POINTER) is
 		-- LLVMGetNamedMetadataOperands
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNamedMetadataOperands"
		}"
		end

	llvmget_next_basic_block (a_bb: POINTER): POINTER is
 		-- LLVMGetNextBasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextBasicBlock"
		}"
		end

	llvmget_next_function (a_fn: POINTER): POINTER is
 		-- LLVMGetNextFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextFunction"
		}"
		end

	llvmget_next_global (a_global_var: POINTER): POINTER is
 		-- LLVMGetNextGlobal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextGlobal"
		}"
		end

	llvmget_next_instruction (an_inst: POINTER): POINTER is
 		-- LLVMGetNextInstruction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextInstruction"
		}"
		end

	llvmget_next_param (an_arg: POINTER): POINTER is
 		-- LLVMGetNextParam
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextParam"
		}"
		end

	llvmget_next_use (an_u: POINTER): POINTER is
 		-- LLVMGetNextUse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNextUse"
		}"
		end

	llvmget_num_operands (a_val: POINTER): INTEGER is
 		-- LLVMGetNumOperands
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetNumOperands"
		}"
		end

	llvmget_operand (a_val: POINTER; an_index: NATURAL): POINTER is
 		-- LLVMGetOperand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetOperand"
		}"
		end

	llvmget_param (a_fn: POINTER; an_index: NATURAL): POINTER is
 		-- LLVMGetParam
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParam"
		}"
		end

	llvmget_param_parent (an_inst: POINTER): POINTER is
 		-- LLVMGetParamParent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParamParent"
		}"
		end

	llvmget_param_types (a_function_ty: POINTER; a_dest: POINTER) is
 		-- LLVMGetParamTypes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParamTypes"
		}"
		end

	llvmget_params (a_fn: POINTER; a_params: POINTER) is
 		-- LLVMGetParams
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetParams"
		}"
		end

	llvmget_pointer_address_space (a_pointer_ty: POINTER): NATURAL is
 		-- LLVMGetPointerAddressSpace
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPointerAddressSpace"
		}"
		end

	llvmget_previous_basic_block (a_bb: POINTER): POINTER is
 		-- LLVMGetPreviousBasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousBasicBlock"
		}"
		end

	llvmget_previous_function (a_fn: POINTER): POINTER is
 		-- LLVMGetPreviousFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousFunction"
		}"
		end

	llvmget_previous_global (a_global_var: POINTER): POINTER is
 		-- LLVMGetPreviousGlobal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousGlobal"
		}"
		end

	llvmget_previous_instruction (an_inst: POINTER): POINTER is
 		-- LLVMGetPreviousInstruction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousInstruction"
		}"
		end

	llvmget_previous_param (an_arg: POINTER): POINTER is
 		-- LLVMGetPreviousParam
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetPreviousParam"
		}"
		end

	llvmget_return_type (a_function_ty: POINTER): POINTER is
 		-- LLVMGetReturnType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetReturnType"
		}"
		end

	llvmget_section (a_global: POINTER): POINTER is
 		-- LLVMGetSection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetSection"
		}"
		end

	llvmget_struct_element_types (a_struct_ty: POINTER; a_dest: POINTER) is
 		-- LLVMGetStructElementTypes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetStructElementTypes"
		}"
		end

	llvmget_struct_name (a_ty: POINTER): POINTER is
 		-- LLVMGetStructName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetStructName"
		}"
		end

	llvmget_switch_default_dest (a_switch_instr: POINTER): POINTER is
 		-- LLVMGetSwitchDefaultDest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetSwitchDefaultDest"
		}"
		end

	llvmget_target (a_m: POINTER): POINTER is
 		-- LLVMGetTarget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTarget"
		}"
		end

	llvmget_type_by_name (a_m: POINTER; a_name: POINTER): POINTER is
 		-- LLVMGetTypeByName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTypeByName"
		}"
		end

	llvmget_type_context (a_ty: POINTER): POINTER is
 		-- LLVMGetTypeContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTypeContext"
		}"
		end

	llvmget_type_kind (a_ty: POINTER): INTEGER is
 		-- LLVMGetTypeKind
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetTypeKind"
		}"
		end

	llvmget_undef (a_ty: POINTER): POINTER is
 		-- LLVMGetUndef
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetUndef"
		}"
		end

	llvmget_used_value (an_u: POINTER): POINTER is
 		-- LLVMGetUsedValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetUsedValue"
		}"
		end

	llvmget_user (an_u: POINTER): POINTER is
 		-- LLVMGetUser
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetUser"
		}"
		end

	llvmget_value_name (a_val: POINTER): POINTER is
 		-- LLVMGetValueName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetValueName"
		}"
		end

	llvmget_vector_size (a_vector_ty: POINTER): NATURAL is
 		-- LLVMGetVectorSize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetVectorSize"
		}"
		end

	llvmget_visibility (a_global: POINTER): INTEGER is
 		-- LLVMGetVisibility
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetVisibility"
		}"
		end

	llvmget_volatile (a_memory_access_inst: POINTER): INTEGER is
 		-- LLVMGetVolatile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMGetVolatile"
		}"
		end

	llvmhalf_type: POINTER is
 		-- LLVMHalfType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMHalfType()"
		}"
		end

	llvmhalf_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMHalfTypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMHalfTypeInContext"
		}"
		end

	llvmhas_metadata (a_val: POINTER): INTEGER is
 		-- LLVMHasMetadata
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMHasMetadata"
		}"
		end

	llvminitialize_core (a_r: POINTER) is
 		-- LLVMInitializeCore
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeCore"
		}"
		end

	llvminitialize_function_pass_manager (a_fpm: POINTER): INTEGER is
 		-- LLVMInitializeFunctionPassManager
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInitializeFunctionPassManager"
		}"
		end

	llvminsert_basic_block (an_insert_before_bb: POINTER; a_name: POINTER): POINTER is
 		-- LLVMInsertBasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertBasicBlock"
		}"
		end

	llvminsert_basic_block_in_context (a_c: POINTER; a_bb: POINTER; a_name: POINTER): POINTER is
 		-- LLVMInsertBasicBlockInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertBasicBlockInContext"
		}"
		end

	llvminsert_into_builder (a_builder: POINTER; an_instr: POINTER) is
 		-- LLVMInsertIntoBuilder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertIntoBuilder"
		}"
		end

	llvminsert_into_builder_with_name (a_builder: POINTER; an_instr: POINTER; a_name: POINTER) is
 		-- LLVMInsertIntoBuilderWithName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInsertIntoBuilderWithName"
		}"
		end

	llvminstruction_erase_from_parent (an_inst: POINTER) is
 		-- LLVMInstructionEraseFromParent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInstructionEraseFromParent"
		}"
		end

	llvmint16type: POINTER is
 		-- LLVMInt16Type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt16Type()"
		}"
		end

	llvmint16type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt16TypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt16TypeInContext"
		}"
		end

	llvmint1type: POINTER is
 		-- LLVMInt1Type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt1Type()"
		}"
		end

	llvmint1type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt1TypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt1TypeInContext"
		}"
		end

	llvmint32type: POINTER is
 		-- LLVMInt32Type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt32Type()"
		}"
		end

	llvmint32type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt32TypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt32TypeInContext"
		}"
		end

	llvmint64type: POINTER is
 		-- LLVMInt64Type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt64Type()"
		}"
		end

	llvmint64type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt64TypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt64TypeInContext"
		}"
		end

	llvmint8type: POINTER is
 		-- LLVMInt8Type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt8Type()"
		}"
		end

	llvmint8type_in_context (a_c: POINTER): POINTER is
 		-- LLVMInt8TypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMInt8TypeInContext"
		}"
		end

	llvmint_type (a_num_bits: NATURAL): POINTER is
 		-- LLVMIntType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIntType"
		}"
		end

	llvmint_type_in_context (a_c: POINTER; a_num_bits: NATURAL): POINTER is
 		-- LLVMIntTypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIntTypeInContext"
		}"
		end

	llvmis_aalloca_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAAllocaInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAAllocaInst"
		}"
		end

	llvmis_aargument (a_val: POINTER): POINTER is
 		-- LLVMIsAArgument
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAArgument"
		}"
		end

	llvmis_abasic_block (a_val: POINTER): POINTER is
 		-- LLVMIsABasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABasicBlock"
		}"
		end

	llvmis_abinary_operator (a_val: POINTER): POINTER is
 		-- LLVMIsABinaryOperator
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABinaryOperator"
		}"
		end

	llvmis_abit_cast_inst (a_val: POINTER): POINTER is
 		-- LLVMIsABitCastInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABitCastInst"
		}"
		end

	llvmis_ablock_address (a_val: POINTER): POINTER is
 		-- LLVMIsABlockAddress
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABlockAddress"
		}"
		end

	llvmis_abranch_inst (a_val: POINTER): POINTER is
 		-- LLVMIsABranchInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsABranchInst"
		}"
		end

	llvmis_acall_inst (a_val: POINTER): POINTER is
 		-- LLVMIsACallInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsACallInst"
		}"
		end

	llvmis_acast_inst (a_val: POINTER): POINTER is
 		-- LLVMIsACastInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsACastInst"
		}"
		end

	llvmis_acmp_inst (a_val: POINTER): POINTER is
 		-- LLVMIsACmpInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsACmpInst"
		}"
		end

	llvmis_aconstant (a_val: POINTER): POINTER is
 		-- LLVMIsAConstant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstant"
		}"
		end

	llvmis_aconstant_aggregate_zero (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantAggregateZero
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantAggregateZero"
		}"
		end

	llvmis_aconstant_array (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantArray
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantArray"
		}"
		end

	llvmis_aconstant_expr (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantExpr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantExpr"
		}"
		end

	llvmis_aconstant_fp (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantFP
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantFP"
		}"
		end

	llvmis_aconstant_int (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantInt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantInt"
		}"
		end

	llvmis_aconstant_pointer_null (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantPointerNull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantPointerNull"
		}"
		end

	llvmis_aconstant_struct (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantStruct
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantStruct"
		}"
		end

	llvmis_aconstant_vector (a_val: POINTER): POINTER is
 		-- LLVMIsAConstantVector
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAConstantVector"
		}"
		end

	llvmis_adbg_declare_inst (a_val: POINTER): POINTER is
 		-- LLVMIsADbgDeclareInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsADbgDeclareInst"
		}"
		end

	llvmis_adbg_info_intrinsic (a_val: POINTER): POINTER is
 		-- LLVMIsADbgInfoIntrinsic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsADbgInfoIntrinsic"
		}"
		end

	llvmis_aextract_element_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAExtractElementInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAExtractElementInst"
		}"
		end

	llvmis_aextract_value_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAExtractValueInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAExtractValueInst"
		}"
		end

	llvmis_afcmp_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAFCmpInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFCmpInst"
		}"
		end

	llvmis_afpext_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPExtInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPExtInst"
		}"
		end

	llvmis_afpto_siinst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPToSIInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPToSIInst"
		}"
		end

	llvmis_afpto_uiinst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPToUIInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPToUIInst"
		}"
		end

	llvmis_afptrunc_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAFPTruncInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFPTruncInst"
		}"
		end

	llvmis_afunction (a_val: POINTER): POINTER is
 		-- LLVMIsAFunction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAFunction"
		}"
		end

	llvmis_aget_element_ptr_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAGetElementPtrInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGetElementPtrInst"
		}"
		end

	llvmis_aglobal_alias (a_val: POINTER): POINTER is
 		-- LLVMIsAGlobalAlias
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGlobalAlias"
		}"
		end

	llvmis_aglobal_value (a_val: POINTER): POINTER is
 		-- LLVMIsAGlobalValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGlobalValue"
		}"
		end

	llvmis_aglobal_variable (a_val: POINTER): POINTER is
 		-- LLVMIsAGlobalVariable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAGlobalVariable"
		}"
		end

	llvmis_aicmp_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAICmpInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAICmpInst"
		}"
		end

	llvmis_aindirect_br_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAIndirectBrInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAIndirectBrInst"
		}"
		end

	llvmis_ainline_asm (a_val: POINTER): POINTER is
 		-- LLVMIsAInlineAsm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInlineAsm"
		}"
		end

	llvmis_ainsert_element_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAInsertElementInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInsertElementInst"
		}"
		end

	llvmis_ainsert_value_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAInsertValueInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInsertValueInst"
		}"
		end

	llvmis_ainstruction (a_val: POINTER): POINTER is
 		-- LLVMIsAInstruction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInstruction"
		}"
		end

	llvmis_aint_to_ptr_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAIntToPtrInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAIntToPtrInst"
		}"
		end

	llvmis_aintrinsic_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAIntrinsicInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAIntrinsicInst"
		}"
		end

	llvmis_ainvoke_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAInvokeInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAInvokeInst"
		}"
		end

	llvmis_alanding_pad_inst (a_val: POINTER): POINTER is
 		-- LLVMIsALandingPadInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsALandingPadInst"
		}"
		end

	llvmis_aload_inst (a_val: POINTER): POINTER is
 		-- LLVMIsALoadInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsALoadInst"
		}"
		end

	llvmis_amdnode (a_val: POINTER): POINTER is
 		-- LLVMIsAMDNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMDNode"
		}"
		end

	llvmis_amdstring (a_val: POINTER): POINTER is
 		-- LLVMIsAMDString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMDString"
		}"
		end

	llvmis_amem_cpy_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAMemCpyInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemCpyInst"
		}"
		end

	llvmis_amem_intrinsic (a_val: POINTER): POINTER is
 		-- LLVMIsAMemIntrinsic
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemIntrinsic"
		}"
		end

	llvmis_amem_move_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAMemMoveInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemMoveInst"
		}"
		end

	llvmis_amem_set_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAMemSetInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAMemSetInst"
		}"
		end

	llvmis_aphinode (a_val: POINTER): POINTER is
 		-- LLVMIsAPHINode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAPHINode"
		}"
		end

	llvmis_aptr_to_int_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAPtrToIntInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAPtrToIntInst"
		}"
		end

	llvmis_aresume_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAResumeInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAResumeInst"
		}"
		end

	llvmis_areturn_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAReturnInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAReturnInst"
		}"
		end

	llvmis_aselect_inst (a_val: POINTER): POINTER is
 		-- LLVMIsASelectInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASelectInst"
		}"
		end

	llvmis_asext_inst (a_val: POINTER): POINTER is
 		-- LLVMIsASExtInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASExtInst"
		}"
		end

	llvmis_ashuffle_vector_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAShuffleVectorInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAShuffleVectorInst"
		}"
		end

	llvmis_asito_fpinst (a_val: POINTER): POINTER is
 		-- LLVMIsASIToFPInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASIToFPInst"
		}"
		end

	llvmis_astore_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAStoreInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAStoreInst"
		}"
		end

	llvmis_aswitch_inst (a_val: POINTER): POINTER is
 		-- LLVMIsASwitchInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsASwitchInst"
		}"
		end

	llvmis_aterminator_inst (a_val: POINTER): POINTER is
 		-- LLVMIsATerminatorInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsATerminatorInst"
		}"
		end

	llvmis_atrunc_inst (a_val: POINTER): POINTER is
 		-- LLVMIsATruncInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsATruncInst"
		}"
		end

	llvmis_auito_fpinst (a_val: POINTER): POINTER is
 		-- LLVMIsAUIToFPInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUIToFPInst"
		}"
		end

	llvmis_aunary_instruction (a_val: POINTER): POINTER is
 		-- LLVMIsAUnaryInstruction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUnaryInstruction"
		}"
		end

	llvmis_aundef_value (a_val: POINTER): POINTER is
 		-- LLVMIsAUndefValue
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUndefValue"
		}"
		end

	llvmis_aunreachable_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAUnreachableInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUnreachableInst"
		}"
		end

	llvmis_auser (a_val: POINTER): POINTER is
 		-- LLVMIsAUser
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAUser"
		}"
		end

	llvmis_avaarg_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAVAArgInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAVAArgInst"
		}"
		end

	llvmis_azext_inst (a_val: POINTER): POINTER is
 		-- LLVMIsAZExtInst
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsAZExtInst"
		}"
		end

	llvmis_constant (a_val: POINTER): INTEGER is
 		-- LLVMIsConstant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsConstant"
		}"
		end

	llvmis_declaration (a_global: POINTER): INTEGER is
 		-- LLVMIsDeclaration
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsDeclaration"
		}"
		end

	llvmis_function_var_arg (a_function_ty: POINTER): INTEGER is
 		-- LLVMIsFunctionVarArg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsFunctionVarArg"
		}"
		end

	llvmis_global_constant (a_global_var: POINTER): INTEGER is
 		-- LLVMIsGlobalConstant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsGlobalConstant"
		}"
		end

	llvmis_null (a_val: POINTER): INTEGER is
 		-- LLVMIsNull
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsNull"
		}"
		end

	llvmis_opaque_struct (a_struct_ty: POINTER): INTEGER is
 		-- LLVMIsOpaqueStruct
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsOpaqueStruct"
		}"
		end

	llvmis_packed_struct (a_struct_ty: POINTER): INTEGER is
 		-- LLVMIsPackedStruct
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsPackedStruct"
		}"
		end

	llvmis_tail_call (a_call_inst: POINTER): INTEGER is
 		-- LLVMIsTailCall
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsTailCall"
		}"
		end

	llvmis_thread_local (a_global_var: POINTER): INTEGER is
 		-- LLVMIsThreadLocal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsThreadLocal"
		}"
		end

	llvmis_undef (a_val: POINTER): INTEGER is
 		-- LLVMIsUndef
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMIsUndef"
		}"
		end

	llvmlabel_type: POINTER is
 		-- LLVMLabelType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMLabelType()"
		}"
		end

	llvmlabel_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMLabelTypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMLabelTypeInContext"
		}"
		end

	llvmmdnode (a_vals: POINTER; a_count: NATURAL): POINTER is
 		-- LLVMMDNode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMMDNode"
		}"
		end

	llvmmdnode_in_context (a_c: POINTER; a_vals: POINTER; a_count: NATURAL): POINTER is
 		-- LLVMMDNodeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMMDNodeInContext"
		}"
		end

	llvmmdstring (a_str: POINTER; a_slen: NATURAL): POINTER is
 		-- LLVMMDString
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMMDString"
		}"
		end

	llvmmdstring_in_context (a_c: POINTER; a_str: POINTER; a_slen: NATURAL): POINTER is
 		-- LLVMMDStringInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMMDStringInContext"
		}"
		end

	llvmmodule_create_with_name (a_module_id: POINTER): POINTER is
 		-- LLVMModuleCreateWithName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMModuleCreateWithName"
		}"
		end

	llvmmodule_create_with_name_in_context (a_module_id: POINTER; a_c: POINTER): POINTER is
 		-- LLVMModuleCreateWithNameInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMModuleCreateWithNameInContext"
		}"
		end

	llvmmove_basic_block_after (a_bb: POINTER; a_move_pos: POINTER) is
 		-- LLVMMoveBasicBlockAfter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMMoveBasicBlockAfter"
		}"
		end

	llvmmove_basic_block_before (a_bb: POINTER; a_move_pos: POINTER) is
 		-- LLVMMoveBasicBlockBefore
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMMoveBasicBlockBefore"
		}"
		end

	llvmpointer_type (an_element_type: POINTER; an_address_space: NATURAL): POINTER is
 		-- LLVMPointerType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPointerType"
		}"
		end

	llvmposition_builder (a_builder: POINTER; a_block: POINTER; an_instr: POINTER) is
 		-- LLVMPositionBuilder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPositionBuilder"
		}"
		end

	llvmposition_builder_at_end (a_builder: POINTER; a_block: POINTER) is
 		-- LLVMPositionBuilderAtEnd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPositionBuilderAtEnd"
		}"
		end

	llvmposition_builder_before (a_builder: POINTER; an_instr: POINTER) is
 		-- LLVMPositionBuilderBefore
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPositionBuilderBefore"
		}"
		end

	llvmppcfp128type: POINTER is
 		-- LLVMPPCFP128Type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPPCFP128Type()"
		}"
		end

	llvmppcfp128type_in_context (a_c: POINTER): POINTER is
 		-- LLVMPPCFP128TypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMPPCFP128TypeInContext"
		}"
		end

	llvmremove_attribute (an_arg: POINTER; a_pa: INTEGER) is
 		-- LLVMRemoveAttribute
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveAttribute"
		}"
		end

	llvmremove_basic_block_from_parent (a_bb: POINTER) is
 		-- LLVMRemoveBasicBlockFromParent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveBasicBlockFromParent"
		}"
		end

	llvmremove_function_attr (a_fn: POINTER; a_pa: INTEGER) is
 		-- LLVMRemoveFunctionAttr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveFunctionAttr"
		}"
		end

	llvmremove_instr_attribute (an_instr: POINTER; an_index: NATURAL; an_argument_l8576_c7: INTEGER) is
 		-- LLVMRemoveInstrAttribute
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRemoveInstrAttribute"
		}"
		end

	llvmreplace_all_uses_with (an_old_val: POINTER; a_new_val: POINTER) is
 		-- LLVMReplaceAllUsesWith
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMReplaceAllUsesWith"
		}"
		end

	llvmrun_function_pass_manager (a_fpm: POINTER; a_f: POINTER): INTEGER is
 		-- LLVMRunFunctionPassManager
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunFunctionPassManager"
		}"
		end

	llvmrun_pass_manager (a_pm: POINTER; a_m: POINTER): INTEGER is
 		-- LLVMRunPassManager
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMRunPassManager"
		}"
		end

	llvmset_alignment (a_global: POINTER; a_bytes: NATURAL) is
 		-- LLVMSetAlignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetAlignment"
		}"
		end

	llvmset_cleanup (a_landing_pad: POINTER; a_val: INTEGER) is
 		-- LLVMSetCleanup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetCleanup"
		}"
		end

	llvmset_current_debug_location (a_builder: POINTER; a_l: POINTER) is
 		-- LLVMSetCurrentDebugLocation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetCurrentDebugLocation"
		}"
		end

	llvmset_data_layout (a_m: POINTER; a_triple: POINTER) is
 		-- LLVMSetDataLayout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetDataLayout"
		}"
		end

	llvmset_function_call_conv (a_fn: POINTER; a_cc: NATURAL) is
 		-- LLVMSetFunctionCallConv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetFunctionCallConv"
		}"
		end

	llvmset_gc (a_fn: POINTER; a_name: POINTER) is
 		-- LLVMSetGC
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetGC"
		}"
		end

	llvmset_global_constant (a_global_var: POINTER; an_is_constant: INTEGER) is
 		-- LLVMSetGlobalConstant
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetGlobalConstant"
		}"
		end

	llvmset_initializer (a_global_var: POINTER; a_constant_val: POINTER) is
 		-- LLVMSetInitializer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInitializer"
		}"
		end

	llvmset_inst_debug_location (a_builder: POINTER; an_inst: POINTER) is
 		-- LLVMSetInstDebugLocation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInstDebugLocation"
		}"
		end

	llvmset_instr_param_alignment (an_instr: POINTER; an_index: NATURAL; an_align: NATURAL) is
 		-- LLVMSetInstrParamAlignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInstrParamAlignment"
		}"
		end

	llvmset_instruction_call_conv (an_instr: POINTER; a_cc: NATURAL) is
 		-- LLVMSetInstructionCallConv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetInstructionCallConv"
		}"
		end

	llvmset_linkage (a_global: POINTER; a_linkage: INTEGER) is
 		-- LLVMSetLinkage
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetLinkage"
		}"
		end

	llvmset_metadata (a_val: POINTER; a_kind_id: NATURAL; a_node: POINTER) is
 		-- LLVMSetMetadata
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetMetadata"
		}"
		end

	llvmset_module_inline_asm (a_m: POINTER; an_asm: POINTER) is
 		-- LLVMSetModuleInlineAsm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetModuleInlineAsm"
		}"
		end

	llvmset_operand (an_user: POINTER; an_index: NATURAL; a_val: POINTER) is
 		-- LLVMSetOperand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetOperand"
		}"
		end

	llvmset_param_alignment (an_arg: POINTER; an_align: NATURAL) is
 		-- LLVMSetParamAlignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetParamAlignment"
		}"
		end

	llvmset_section (a_global: POINTER; a_section: POINTER) is
 		-- LLVMSetSection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetSection"
		}"
		end

	llvmset_tail_call (a_call_inst: POINTER; an_is_tail_call: INTEGER) is
 		-- LLVMSetTailCall
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetTailCall"
		}"
		end

	llvmset_target (a_m: POINTER; a_triple: POINTER) is
 		-- LLVMSetTarget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetTarget"
		}"
		end

	llvmset_thread_local (a_global_var: POINTER; an_is_thread_local: INTEGER) is
 		-- LLVMSetThreadLocal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetThreadLocal"
		}"
		end

	llvmset_value_name (a_val: POINTER; a_name: POINTER) is
 		-- LLVMSetValueName
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetValueName"
		}"
		end

	llvmset_visibility (a_global: POINTER; a_viz: INTEGER) is
 		-- LLVMSetVisibility
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetVisibility"
		}"
		end

	llvmset_volatile (a_memory_access_inst: POINTER; an_is_volatile: INTEGER) is
 		-- LLVMSetVolatile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSetVolatile"
		}"
		end

	llvmsize_of (a_ty: POINTER): POINTER is
 		-- LLVMSizeOf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMSizeOf"
		}"
		end

	llvmstruct_create_named (a_c: POINTER; a_name: POINTER): POINTER is
 		-- LLVMStructCreateNamed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStructCreateNamed"
		}"
		end

	llvmstruct_set_body (a_struct_ty: POINTER; an_element_types: POINTER; an_element_count: NATURAL; a_packed: INTEGER) is
 		-- LLVMStructSetBody
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStructSetBody"
		}"
		end

	llvmstruct_type (an_element_types: POINTER; an_element_count: NATURAL; a_packed: INTEGER): POINTER is
 		-- LLVMStructType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStructType"
		}"
		end

	llvmstruct_type_in_context (a_c: POINTER; an_element_types: POINTER; an_element_count: NATURAL; a_packed: INTEGER): POINTER is
 		-- LLVMStructTypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMStructTypeInContext"
		}"
		end

	llvmtype_is_sized (a_ty: POINTER): INTEGER is
 		-- LLVMTypeIsSized
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMTypeIsSized"
		}"
		end

	llvmtype_of (a_val: POINTER): POINTER is
 		-- LLVMTypeOf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMTypeOf"
		}"
		end

	llvmvalue_as_basic_block (a_val: POINTER): POINTER is
 		-- LLVMValueAsBasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMValueAsBasicBlock"
		}"
		end

	llvmvalue_is_basic_block (a_val: POINTER): INTEGER is
 		-- LLVMValueIsBasicBlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMValueIsBasicBlock"
		}"
		end

	llvmvector_type (an_element_type: POINTER; an_element_count: NATURAL): POINTER is
 		-- LLVMVectorType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVectorType"
		}"
		end

	llvmvoid_type: POINTER is
 		-- LLVMVoidType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVoidType()"
		}"
		end

	llvmvoid_type_in_context (a_c: POINTER): POINTER is
 		-- LLVMVoidTypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMVoidTypeInContext"
		}"
		end

	llvmx86fp80type: POINTER is
 		-- LLVMX86FP80Type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMX86FP80Type()"
		}"
		end

	llvmx86fp80type_in_context (a_c: POINTER): POINTER is
 		-- LLVMX86FP80TypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMX86FP80TypeInContext"
		}"
		end

	llvmx86mmxtype: POINTER is
 		-- LLVMX86MMXType
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMX86MMXType()"
		}"
		end

	llvmx86mmxtype_in_context (a_c: POINTER): POINTER is
 		-- LLVMX86MMXTypeInContext
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "LLVMX86MMXTypeInContext"
		}"
		end

	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function unwrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.
	-- function wrap in unwrapped namespace llvm skipped.

end -- class CORE_EXTERNALS
