deferred class LLVM_VALUE_FACTORY
	-- A factory of values

inherit WRAPPER_FACTORY[LLVM_VALUE]
insert CORE_EXTERNALS undefine fill_tagged_out_memory end 
feature 
	wrapper (p: POINTER): LLVM_VALUE is
		local res: POINTER
		do
			-- TODO: currently partially implemented in a horrible way: it's an
			-- O(n) with n the number of effective classes inheriting from
			-- LLVM_VALUE. Accessing the enum ValueTy would allow for better
			-- implementation.
			res := llvmis_abasic_block(p)
			if res.is_not_null then create {LLVM_BASIC_BLOCK} Result.from_external_pointer(res)
				-- elseif llvmis_aglobal_alias(p).to_boolean then create {IS_AGLOBAL_ALIAS} Result.from_external_pointer(p)
				-- elseif llvmis_acall_inst(p).to_boolean then create {IS_ACALL_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aconstant_pointer_null(p).to_boolean then create {IS_ACONSTANT_POINTER_NULL} Result.from_external_pointer(p)
				-- elseif llvmis_afpto_uiinst(p).to_boolean then create {IS_AFPTO_UIINST} Result.from_external_pointer(p)
				-- elseif llvmis_asito_fpinst(p).to_boolean then create {IS_ASITO_FPINST} Result.from_external_pointer(p)
				-- elseif llvmis_atrunc_inst(p).to_boolean then create {IS_ATRUNC_INST} Result.from_external_pointer(p)
				-- elseif llvmis_abit_cast_inst(p).to_boolean then create {IS_ABIT_CAST_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aconstant_struct(p).to_boolean then create {IS_ACONSTANT_STRUCT} Result.from_external_pointer(p)
				-- elseif llvmis_aterminator_inst(p).to_boolean then create {IS_ATERMINATOR_INST} Result.from_external_pointer(p)
				-- elseif llvmis_abranch_inst(p).to_boolean then create {IS_ABRANCH_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aint_to_ptr_inst(p).to_boolean then create {IS_AINT_TO_PTR_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aconstant(p).to_boolean then create {IS_ACONSTANT} Result.from_external_pointer(p)
				-- elseif llvmis_adbg_region_end_inst(p).to_boolean then create {IS_ADBG_REGION_END_INST} Result.from_external_pointer(p)
				-- elseif llvmis_ainstruction(p).to_boolean then create {IS_AINSTRUCTION} Result.from_external_pointer(p)
				-- elseif llvmis_auser(p).to_boolean then create {IS_AUSER} Result.from_external_pointer(p)
				-- elseif llvmis_aphinode(p).to_boolean then create {IS_APHINODE} Result.from_external_pointer(p)
				-- elseif llvmis_afptrunc_inst(p).to_boolean then create {IS_AFPTRUNC_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aconstant_array(p).to_boolean then create {IS_ACONSTANT_ARRAY} Result.from_external_pointer(p)
				-- elseif llvmis_aintrinsic_inst(p).to_boolean then create {IS_AINTRINSIC_INST} Result.from_external_pointer(p)
				-- elseif llvmis_amem_cpy_inst(p).to_boolean then create {IS_AMEM_CPY_INST} Result.from_external_pointer(p)
				-- elseif llvmis_azext_inst(p).to_boolean then create {IS_AZEXT_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aget_element_ptr_inst(p).to_boolean then create {IS_AGET_ELEMENT_PTR_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aselect_inst(p).to_boolean then create {IS_ASELECT_INST} Result.from_external_pointer(p)
				-- elseif llvmis_amem_move_inst(p).to_boolean then create {IS_AMEM_MOVE_INST} Result.from_external_pointer(p)
				-- elseif llvmis_ainvoke_inst(p).to_boolean then create {IS_AINVOKE_INST} Result.from_external_pointer(p)
				-- elseif llvmis_amem_set_inst(p).to_boolean then create {IS_AMEM_SET_INST} Result.from_external_pointer(p)
				-- elseif llvmis_adbg_stop_point_inst(p).to_boolean then create {IS_ADBG_STOP_POINT_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aptr_to_int_inst(p).to_boolean then create {IS_APTR_TO_INT_INST} Result.from_external_pointer(p)
				-- elseif llvmis_adbg_func_start_inst(p).to_boolean then create {IS_ADBG_FUNC_START_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aicmp_inst(p).to_boolean then create {IS_AICMP_INST} Result.from_external_pointer(p)
				-- elseif llvmis_acast_inst(p).to_boolean then create {IS_ACAST_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aglobal_variable(p).to_boolean then create {IS_AGLOBAL_VARIABLE} Result.from_external_pointer(p)
				-- elseif llvmis_avaarg_inst(p).to_boolean then create {IS_AVAARG_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aundef_value(p).to_boolean then create {IS_AUNDEF_VALUE} Result.from_external_pointer(p)
				-- elseif llvmis_areturn_inst(p).to_boolean then create {IS_ARETURN_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aargument(p).to_boolean then create {IS_AARGUMENT} Result.from_external_pointer(p)
				-- elseif llvmis_ainsert_element_inst(p).to_boolean then create {IS_AINSERT_ELEMENT_INST} Result.from_external_pointer(p)
				-- elseif llvmis_astore_inst(p).to_boolean then create {IS_ASTORE_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aallocation_inst(p).to_boolean then create {IS_AALLOCATION_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aextract_element_inst(p).to_boolean then create {IS_AEXTRACT_ELEMENT_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aconstant_vector(p).to_boolean then create {IS_ACONSTANT_VECTOR} Result.from_external_pointer(p)
				-- elseif llvmis_acmp_inst(p).to_boolean then create {IS_ACMP_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aunwind_inst(p).to_boolean then create {IS_AUNWIND_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aglobal_value(p).to_boolean then create {IS_AGLOBAL_VALUE} Result.from_external_pointer(p)
				-- elseif llvmis_amalloc_inst(p).to_boolean then create {IS_AMALLOC_INST} Result.from_external_pointer(p)
				-- elseif llvmis_adbg_declare_inst(p).to_boolean then create {IS_ADBG_DECLARE_INST} Result.from_external_pointer(p)
				-- elseif llvmis_afcmp_inst(p).to_boolean then create {IS_AFCMP_INST} Result.from_external_pointer(p)
				-- elseif llvmis_ainline_asm(p).to_boolean then create {IS_AINLINE_ASM} Result.from_external_pointer(p)
				-- elseif llvmis_afree_inst(p).to_boolean then create {IS_AFREE_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aunary_instruction(p).to_boolean then create {IS_AUNARY_INSTRUCTION} Result.from_external_pointer(p)
				-- elseif llvmis_aconstant_fp(p).to_boolean then create {IS_ACONSTANT_FP} Result.from_external_pointer(p)
				-- elseif llvmis_aextract_value_inst(p).to_boolean then create {IS_AEXTRACT_VALUE_INST} Result.from_external_pointer(p)
				-- elseif llvmis_abinary_operator(p).to_boolean then create {IS_ABINARY_OPERATOR} Result.from_external_pointer(p)
				-- elseif llvmis_amem_intrinsic(p).to_boolean then create {IS_AMEM_INTRINSIC} Result.from_external_pointer(p)
				-- elseif llvmis_afunction(p).to_boolean then create {IS_AFUNCTION} Result.from_external_pointer(p)
				-- elseif llvmis_aunreachable_inst(p).to_boolean then create {IS_AUNREACHABLE_INST} Result.from_external_pointer(p)
				-- elseif llvmis_adbg_info_intrinsic(p).to_boolean then create {IS_ADBG_INFO_INTRINSIC} Result.from_external_pointer(p)
				-- elseif llvmis_ainsert_value_inst(p).to_boolean then create {IS_AINSERT_VALUE_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aload_inst(p).to_boolean then create {IS_ALOAD_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aalloca_inst(p).to_boolean then create {IS_AALLOCA_INST} Result.from_external_pointer(p)
				-- elseif llvmis_auito_fpinst(p).to_boolean then create {IS_AUITO_FPINST} Result.from_external_pointer(p)
				-- elseif llvmis_afpext_inst(p).to_boolean then create {IS_AFPEXT_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aehselector_inst(p).to_boolean then create {IS_AEHSELECTOR_INST} Result.from_external_pointer(p)
				-- elseif llvmis_adbg_region_start_inst(p).to_boolean then create {IS_ADBG_REGION_START_INST} Result.from_external_pointer(p)
				-- elseif llvmis_afpto_siinst(p).to_boolean then create {IS_AFPTO_SIINST} Result.from_external_pointer(p)
				-- elseif llvmis_aconstant_int(p).to_boolean then create {IS_ACONSTANT_INT} Result.from_external_pointer(p)
				-- elseif llvmis_aconstant_aggregate_zero(p).to_boolean then create {IS_ACONSTANT_AGGREGATE_ZERO} Result.from_external_pointer(p)
				-- elseif llvmis_aswitch_inst(p).to_boolean then create {IS_ASWITCH_INST} Result.from_external_pointer(p)
				-- elseif llvmis_aconstant_expr(p).to_boolean then create {IS_ACONSTANT_EXPR} Result.from_external_pointer(p)
				-- elseif llvmis_asext_inst(p).to_boolean then create {IS_ASEXT_INST} Result.from_external_pointer(p)
				-- elseif llvmis_ashuffle_vector_inst(p).to_boolean then create {IS_ASHUFFLE_VECTOR_INST} Result.from_external_pointer(p)
			end
		end
end -- class LLVM_VALUE_FACTORY

-- Copyright 2009 Paolo Redaelli
