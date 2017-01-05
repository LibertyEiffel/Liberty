class LLVM_VALUE
	-- LLVM Value Representation.

	-- This is a very important LLVM class. It is the anchestor of all values
	-- computed by a program that may be used as operands to other values.
	-- LLVM_VALUE is the parent of other important classes such as Instruction
	-- and Function. 
	
	-- A particular Value may be used many times in the LLVM representation for
	-- a program. For example, an incoming argument to a function (represented
	-- with an instance of the Argument class) is "used" by every instruction
	-- in the function that references the argument. To keep track of this
	-- relationship, the Value class keeps a list of all of the Users that is
	-- using it (the User class is a base class for all nodes in the LLVM graph
	-- that can refer to Values). This use list is how LLVM represents def-use
	-- information in the program, and is accessible through the use_* methods,
	-- shown below.

	-- Because LLVM is a typed representation, every LLVM Value is typed, and
	-- this Type is available through the getType() method. In addition, all
	-- LLVM values can be named. The "name" of the Value is a symbolic string
	-- printed in the LLVM code:

	-- %foo = add i32 1, 2

	-- The name of this instruction is "foo". NOTE that the name of any value
	-- may be missing (an empty string), so names should ONLY be used for
	-- debugging (making the source code easier to read, debugging printouts),
	-- they should not be used to keep track of values or map between them. For
	-- this purpose, use a std::map of pointers to the Value itself instead.

	-- One important aspect of LLVM is that there is no distinction between an
	-- SSA variable and the operation that produces it. Because of this, any
	-- reference to the value produced by an instruction (or the value
	-- available as an incoming argument, for example) is represented as a
	-- direct pointer to the instance of the class that represents this value.
	-- Although this may take some getting used to, it simplifies the
	-- representation and makes it easier to manipulate.

	-- All LLVM_VALUEs have a Type. Type is not a subclass of Value. All types
	-- can have a name and they should belong to some Module. Setting the name
	-- on the Value automatically updates the module's symbol table.

	-- Every value has a "use list" that keeps track of which other Values are
	-- using this Value. A Value can also have an arbitrary number of
	-- ValueHandle objects that watch it and listen to RAUW and Destroy events
	-- see llvm/Support/ValueHandle.h for details.
	

	-- Implementation notes: in order to avoid creation of duplicate wrappers
	-- for the same C++ object during program lifetime an LLVM_VALUE should be
	-- cached into various wrapper factories, one for each type actually used
	-- (functions, integers, floating point numbers and so on); this would be
	-- necessary if various heirs of LLVM_VALUE are also COLLECTIONs. For
	-- example each value knows which other values are using it, a function is
	-- made up of blocks and blocks are instructions grouped . Making all those
	-- classes a COLLECTION would require to satisfy various pre and
	-- post-conditions like "put(element: ITEM; i: INTEGER) ... ensure
	-- item(i)=element"; this postcontion is not satisfied if we create a new
	-- wrapper every time COLLECTION.item is invoked. Iterator based access
	-- instead does not have to satisfy this kind of postconditions, barring
	-- the need of potentially big dictionaries of LLVM_VALUEs. 

inherit 
	C_STRUCT
	C_OWNED
	LLVM_TYPE_FACTORY
insert
	CORE_EXTERNALS
create {WRAPPER, WRAPPER_HANDLER} from_external_pointer
feature {ANY} 
	type: LLVM_TYPE
		do
			Result:=type_wrapper(llvmtype_of(handle))
		end
	
	name: FIXED_STRING
		-- The name of the value.
	do
		create Result.from_external(llvmget_value_name(handle))
	end

	set_name (a_name: ABSTRACT_STRING)
		require a_name /= Void
		do
			llvmset_value_name(handle,a_name.to_external)
		end
		
	dump
		do
			llvmdump_value(handle)
		end

feature {ANY} -- Type-related queries
	--is_alloca_inst: BOOLEAN do Result:=llvmis_aalloca_inst(handle).is_not_null end
	--is_allocation_inst: BOOLEAN do Result:=llvmis_aallocation_inst(handle).is_not_null end
	--is_argument: BOOLEAN do Result:=llvmis_aargument(handle).is_not_null end
	is_basic_block: BOOLEAN do Result:=llvmvalue_is_basic_block(handle).to_boolean end
	--is_binary_operator: BOOLEAN do Result:=llvmis_abinary_operator(handle).is_not_null end
	--is_bit_cast_inst: BOOLEAN do Result:=llvmis_abit_cast_inst(handle).is_not_null end
	--is_branch_inst: BOOLEAN do Result:=llvmis_abranch_inst(handle).is_not_null end
	--is_call_inst: BOOLEAN do Result:=llvmis_acall_inst(handle).is_not_null end
	--is_cast_inst: BOOLEAN do Result:=llvmis_acast_inst(handle).is_not_null end
	--is_cmp_inst: BOOLEAN do Result:=llvmis_acmp_inst(handle).is_not_null end
	--is_constant_value: BOOLEAN do Result:=llvmis_aconstant(handle).is_not_null end
	--is_constant_aggregate_zero: BOOLEAN do Result:=llvmis_aconstant_aggregate_zero(handle).is_not_null end
	--is_constant_array: BOOLEAN do Result:=llvmis_aconstant_array(handle).is_not_null end
	--is_constant_expr: BOOLEAN do Result:=llvmis_aconstant_expr(handle).is_not_null end
	is_constant_fp: BOOLEAN do Result:=llvmis_aconstant_fp(handle).is_not_null end
	is_constant_int: BOOLEAN do Result:=llvmis_aconstant_int(handle).is_not_null end
	is_constant_pointer_null: BOOLEAN do Result:=llvmis_aconstant_pointer_null(handle).is_not_null end
	is_constant_struct: BOOLEAN do Result:=llvmis_aconstant_struct(handle).is_not_null end
	is_constant_vector: BOOLEAN do Result:=llvmis_aconstant_vector(handle).is_not_null end
	--is_dbg_declare_inst: BOOLEAN do Result:=llvmis_adbg_declare_inst(handle).is_not_null end
	-- is_dbg_func_start_inst: BOOLEAN do Result:=llvmis_adbg_func_start_inst(handle).is_not_null end
	--is_dbg_info_intrinsic: BOOLEAN do Result:=llvmis_adbg_info_intrinsic(handle).is_not_null end
	--is_dbg_region_end_inst: BOOLEAN do Result:=llvmis_adbg_region_end_inst(handle).is_not_null end
	--is_dbg_region_start_inst: BOOLEAN do Result:=llvmis_adbg_region_start_inst(handle).is_not_null end
	--is_dbg_stop_point_inst: BOOLEAN do Result:=llvmis_adbg_stop_point_inst(handle).is_not_null end
	--is_ehselector_inst: BOOLEAN do Result:=llvmis_aehselector_inst(handle).is_not_null end
	--is_extract_element_inst: BOOLEAN do Result:=llvmis_aextract_element_inst(handle).is_not_null end
	--is_extract_value_inst: BOOLEAN do Result:=llvmis_aextract_value_inst(handle).is_not_null end
	--is_fcmp_inst: BOOLEAN do Result:=llvmis_afcmp_inst(handle).is_not_null end
	--is_fpext_inst: BOOLEAN do Result:=llvmis_afpext_inst(handle).is_not_null end
	--is_fpto_siinst: BOOLEAN do Result:=llvmis_afpto_siinst(handle).is_not_null end
	--is_fpto_uiinst: BOOLEAN do Result:=llvmis_afpto_uiinst(handle).is_not_null end
	--is_fptrunc_inst: BOOLEAN do Result:=llvmis_afptrunc_inst(handle).is_not_null end
	--is_free_inst: BOOLEAN do Result:=llvmis_afree_inst(handle).is_not_null end
	is_function: BOOLEAN do Result:=llvmis_afunction(handle).is_not_null end
	--is_get_element_ptr_inst: BOOLEAN do Result:=llvmis_aget_element_ptr_inst(handle).is_not_null end
	is_global_alias: BOOLEAN do Result:=llvmis_aglobal_alias(handle).is_not_null end
	is_global_value: BOOLEAN do Result:=llvmis_aglobal_value(handle).is_not_null end
	is_global_variable: BOOLEAN do Result:=llvmis_aglobal_variable(handle).is_not_null end
	--is_icmp_inst: BOOLEAN do Result:=llvmis_aicmp_inst(handle).is_not_null end
	--is_inline_asm: BOOLEAN do Result:=llvmis_ainline_asm(handle).is_not_null end
	--is_insert_element_inst: BOOLEAN do Result:=llvmis_ainsert_element_inst(handle).is_not_null end
	--is_insert_value_inst: BOOLEAN do Result:=llvmis_ainsert_value_inst(handle).is_not_null end
	--is_instruction: BOOLEAN do Result:=llvmis_ainstruction(handle).is_not_null end
	--is_int_to_ptr_inst: BOOLEAN do Result:=llvmis_aint_to_ptr_inst(handle).is_not_null end
	--is_intrinsic_inst: BOOLEAN do Result:=llvmis_aintrinsic_inst(handle).is_not_null end
	--is_invoke_inst: BOOLEAN do Result:=llvmis_ainvoke_inst(handle).is_not_null end
	--is_load_inst: BOOLEAN do Result:=llvmis_aload_inst(handle).is_not_null end
	----is_malloc_inst: BOOLEAN do Result:=llvmis_amalloc_inst(handle).is_not_null end
	--is_mem_cpy_inst: BOOLEAN do Result:=llvmis_amem_cpy_inst(handle).is_not_null end
	--is_mem_intrinsic: BOOLEAN do Result:=llvmis_amem_intrinsic(handle).is_not_null end
	--is_mem_move_inst: BOOLEAN do Result:=llvmis_amem_move_inst(handle).is_not_null end
	--is_mem_set_inst: BOOLEAN do Result:=llvmis_amem_set_inst(handle).is_not_null end
	--is_phinode: BOOLEAN do Result:=llvmis_aphinode(handle).is_not_null end
	--is_ptr_to_int_inst: BOOLEAN do Result:=llvmis_aptr_to_int_inst(handle).is_not_null end
	--is_return_inst: BOOLEAN do Result:=llvmis_areturn_inst(handle).is_not_null end
	--is_select_inst: BOOLEAN do Result:=llvmis_aselect_inst(handle).is_not_null end
	--is_sext_inst: BOOLEAN do Result:=llvmis_asext_inst(handle).is_not_null end
	--is_shuffle_vector_inst: BOOLEAN do Result:=llvmis_ashuffle_vector_inst(handle).is_not_null end
	--is_sito_fpinst: BOOLEAN do Result:=llvmis_asito_fpinst(handle).is_not_null end
	--is_store_inst: BOOLEAN do Result:=llvmis_astore_inst(handle).is_not_null end
	--is_switch_inst: BOOLEAN do Result:=llvmis_aswitch_inst(handle).is_not_null end
	--is_terminator_inst: BOOLEAN do Result:=llvmis_aterminator_inst(handle).is_not_null end
	--is_trunc_inst: BOOLEAN do Result:=llvmis_atrunc_inst(handle).is_not_null end
	--is_uito_fpinst: BOOLEAN do Result:=llvmis_auito_fpinst(handle).is_not_null end
	--is_unary_instruction: BOOLEAN do Result:=llvmis_aunary_instruction(handle).is_not_null end
	--is_undef_value: BOOLEAN do Result:=llvmis_aundef_value(handle).is_not_null end
	--is_unreachable_inst: BOOLEAN do Result:=llvmis_aunreachable_inst(handle).is_not_null end
	--is_unwind_inst: BOOLEAN do Result:=llvmis_aunwind_inst(handle).is_not_null end
	--is_user: BOOLEAN do Result:=llvmis_auser(handle).is_not_null end
	--is_vaarg_inst: BOOLEAN do Result:=llvmis_avaarg_inst(handle).is_not_null end
	--is_zext_inst: BOOLEAN do Result:=llvmis_azext_inst(handle).is_not_null end

feature {ANY} -- Convertions into specific values.

	as_basic_block: LLVM_BASIC_BLOCK
	require is_basic_block
	do
		create Result.from_external_pointer(llvmis_abasic_block(handle))
		-- Also implementable with
		-- create Result.from_external_pointer(llvmvalue_as_basic_block(handle))
		ensure Result/=Void
	end

	as_global_alias: LLVM_GLOBAL_ALIAS
	require is_global_alias
	do
		create Result.from_external_pointer(llvmis_aglobal_alias(handle))
		ensure Result/=Void
	end

--	as_call_inst: call_inst is
--	require is_call_inst
--	do
--		create Result.from_external_pointer(llvmis_acall_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_constant_pointer_null: constant_pointer_null is
--	require is_constant_pointer_null
--	do
--		create Result.from_external_pointer(llvmis_aconstant_pointer_null(handle))
--		ensure Result/=Void
--	end
--
--	as_fpto_uiinst: fpto_uiinst is
--	require is_fpto_uiinst
--	do
--		create Result.from_external_pointer(llvmis_afpto_uiinst(handle))
--		ensure Result/=Void
--	end
--
--	as_sito_fpinst: sito_fpinst is
--	require is_sito_fpinst
--	do
--		create Result.from_external_pointer(llvmis_asito_fpinst(handle))
--		ensure Result/=Void
--	end
--
--	as_trunc_inst: trunc_inst is
--	require is_trunc_inst
--	do
--		create Result.from_external_pointer(llvmis_atrunc_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_bit_cast_inst: bit_cast_inst is
--	require is_bit_cast_inst
--	do
--		create Result.from_external_pointer(llvmis_abit_cast_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_constant_struct: constant_struct is
--	require is_constant_struct
--	do
--		create Result.from_external_pointer(llvmis_aconstant_struct(handle))
--		ensure Result/=Void
--	end
--
--	as_terminator_inst: terminator_inst is
--	require is_terminator_inst
--	do
--		create Result.from_external_pointer(llvmis_aterminator_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_branch_inst: branch_inst is
--	require is_branch_inst
--	do
--		create Result.from_external_pointer(llvmis_abranch_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_int_to_ptr_inst: int_to_ptr_inst is
--	require is_int_to_ptr_inst
--	do
--		create Result.from_external_pointer(llvmis_aint_to_ptr_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_constant: constant is
--	require is_constant
--	do
--		create Result.from_external_pointer(llvmis_aconstant(handle))
--		ensure Result/=Void
--	end
--
--	as_dbg_region_end_inst: dbg_region_end_inst is
--	require is_dbg_region_end_inst
--	do
--		create Result.from_external_pointer(llvmis_adbg_region_end_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_instruction: instruction is
--	require is_instruction
--	do
--		create Result.from_external_pointer(llvmis_ainstruction(handle))
--		ensure Result/=Void
--	end
--
--	as_user: user is
--	require is_user
--	do
--		create Result.from_external_pointer(llvmis_auser(handle))
--		ensure Result/=Void
--	end
--
--	as_phinode: phinode is
--	require is_phinode
--	do
--		create Result.from_external_pointer(llvmis_aphinode(handle))
--		ensure Result/=Void
--	end
--
--	as_fptrunc_inst: fptrunc_inst is
--	require is_fptrunc_inst
--	do
--		create Result.from_external_pointer(llvmis_afptrunc_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_constant_array: constant_array is
--	require is_constant_array
--	do
--		create Result.from_external_pointer(llvmis_aconstant_array(handle))
--		ensure Result/=Void
--	end
--
--	as_intrinsic_inst: intrinsic_inst is
--	require is_intrinsic_inst
--	do
--		create Result.from_external_pointer(llvmis_aintrinsic_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_mem_cpy_inst: mem_cpy_inst is
--	require is_mem_cpy_inst
--	do
--		create Result.from_external_pointer(llvmis_amem_cpy_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_zext_inst: zext_inst is
--	require is_zext_inst
--	do
--		create Result.from_external_pointer(llvmis_azext_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_get_element_ptr_inst: get_element_ptr_inst is
--	require is_get_element_ptr_inst
--	do
--		create Result.from_external_pointer(llvmis_aget_element_ptr_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_select_inst: select_inst is
--	require is_select_inst
--	do
--		create Result.from_external_pointer(llvmis_aselect_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_mem_move_inst: mem_move_inst is
--	require is_mem_move_inst
--	do
--		create Result.from_external_pointer(llvmis_amem_move_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_invoke_inst: invoke_inst is
--	require is_invoke_inst
--	do
--		create Result.from_external_pointer(llvmis_ainvoke_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_mem_set_inst: mem_set_inst is
--	require is_mem_set_inst
--	do
--		create Result.from_external_pointer(llvmis_amem_set_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_dbg_stop_point_inst: dbg_stop_point_inst is
--	require is_dbg_stop_point_inst
--	do
--		create Result.from_external_pointer(llvmis_adbg_stop_point_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_ptr_to_int_inst: ptr_to_int_inst is
--	require is_ptr_to_int_inst
--	do
--		create Result.from_external_pointer(llvmis_aptr_to_int_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_dbg_func_start_inst: dbg_func_start_inst is
--	require is_dbg_func_start_inst
--	do
--		create Result.from_external_pointer(llvmis_adbg_func_start_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_icmp_inst: icmp_inst is
--	require is_icmp_inst
--	do
--		create Result.from_external_pointer(llvmis_aicmp_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_cast_inst: cast_inst is
--	require is_cast_inst
--	do
--		create Result.from_external_pointer(llvmis_acast_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_global_variable: global_variable is
--	require is_global_variable
--	do
--		create Result.from_external_pointer(llvmis_aglobal_variable(handle))
--		ensure Result/=Void
--	end
--
--	as_vaarg_inst: vaarg_inst is
--	require is_vaarg_inst
--	do
--		create Result.from_external_pointer(llvmis_avaarg_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_undef_value: undef_value is
--	require is_undef_value
--	do
--		create Result.from_external_pointer(llvmis_aundef_value(handle))
--		ensure Result/=Void
--	end
--
--	as_return_inst: return_inst is
--	require is_return_inst
--	do
--		create Result.from_external_pointer(llvmis_areturn_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_argument: argument is
--	require is_argument
--	do
--		create Result.from_external_pointer(llvmis_aargument(handle))
--		ensure Result/=Void
--	end
--
--	as_insert_element_inst: insert_element_inst is
--	require is_insert_element_inst
--	do
--		create Result.from_external_pointer(llvmis_ainsert_element_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_store_inst: store_inst is
--	require is_store_inst
--	do
--		create Result.from_external_pointer(llvmis_astore_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_allocation_inst: allocation_inst is
--	require is_allocation_inst
--	do
--		create Result.from_external_pointer(llvmis_aallocation_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_extract_element_inst: extract_element_inst is
--	require is_extract_element_inst
--	do
--		create Result.from_external_pointer(llvmis_aextract_element_inst(handle))
--		ensure Result/=Void
--	end
--
	as_constant_vector: LLVM_CONSTANT_VECTOR
	require is_constant_vector
	do
		create Result.from_external_pointer(llvmis_aconstant_vector(handle))
		ensure Result/=Void
	end

--	as_cmp_inst: cmp_inst is
--	require is_cmp_inst
--	do
--		create Result.from_external_pointer(llvmis_acmp_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_unwind_inst: unwind_inst is
--	require is_unwind_inst
--	do
--		create Result.from_external_pointer(llvmis_aunwind_inst(handle))
--		ensure Result/=Void
--	end
--
-- 	as_global_value: LLVM_GLOBAL_VALUE is
-- 	require is_global_value
-- 	do
-- 		create Result.from_external_pointer(llvmis_aglobal_value(handle))
-- 		ensure Result/=Void
-- 	end

--	as_malloc_inst: malloc_inst is
--	require is_malloc_inst
--	do
--		create Result.from_external_pointer(llvmis_amalloc_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_dbg_declare_inst: dbg_declare_inst is
--	require is_dbg_declare_inst
--	do
--		create Result.from_external_pointer(llvmis_adbg_declare_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_fcmp_inst: fcmp_inst is
--	require is_fcmp_inst
--	do
--		create Result.from_external_pointer(llvmis_afcmp_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_inline_asm: inline_asm is
--	require is_inline_asm
--	do
--		create Result.from_external_pointer(llvmis_ainline_asm(handle))
--		ensure Result/=Void
--	end
--
--	as_free_inst: free_inst is
--	require is_free_inst
--	do
--		create Result.from_external_pointer(llvmis_afree_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_unary_instruction: unary_instruction is
--	require is_unary_instruction
--	do
--		create Result.from_external_pointer(llvmis_aunary_instruction(handle))
--		ensure Result/=Void
--	end
--
--	as_constant_fp: constant_fp is
--	require is_constant_fp
--	do
--		create Result.from_external_pointer(llvmis_aconstant_fp(handle))
--		ensure Result/=Void
--	end
--
--	as_extract_value_inst: extract_value_inst is
--	require is_extract_value_inst
--	do
--		create Result.from_external_pointer(llvmis_aextract_value_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_binary_operator: binary_operator is
--	require is_binary_operator
--	do
--		create Result.from_external_pointer(llvmis_abinary_operator(handle))
--		ensure Result/=Void
--	end
--
--	as_mem_intrinsic: mem_intrinsic is
--	require is_mem_intrinsic
--	do
--		create Result.from_external_pointer(llvmis_amem_intrinsic(handle))
--		ensure Result/=Void
--	end
--
	as_function: LLVM_FUNCTION
	require is_function
	do
		create Result.from_external_pointer(llvmis_afunction(handle))
		ensure Result/=Void
	end

--	as_unreachable_inst: unreachable_inst is
--	require is_unreachable_inst
--	do
--		create Result.from_external_pointer(llvmis_aunreachable_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_dbg_info_intrinsic: dbg_info_intrinsic is
--	require is_dbg_info_intrinsic
--	do
--		create Result.from_external_pointer(llvmis_adbg_info_intrinsic(handle))
--		ensure Result/=Void
--	end
--
--	as_insert_value_inst: insert_value_inst is
--	require is_insert_value_inst
--	do
--		create Result.from_external_pointer(llvmis_ainsert_value_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_load_inst: load_inst is
--	require is_load_inst
--	do
--		create Result.from_external_pointer(llvmis_aload_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_alloca_inst: alloca_inst is
--	require is_alloca_inst
--	do
--		create Result.from_external_pointer(llvmis_aalloca_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_uito_fpinst: uito_fpinst is
--	require is_uito_fpinst
--	do
--		create Result.from_external_pointer(llvmis_auito_fpinst(handle))
--		ensure Result/=Void
--	end
--
--	as_fpext_inst: fpext_inst is
--	require is_fpext_inst
--	do
--		create Result.from_external_pointer(llvmis_afpext_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_ehselector_inst: ehselector_inst is
--	require is_ehselector_inst
--	do
--		create Result.from_external_pointer(llvmis_aehselector_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_dbg_region_start_inst: dbg_region_start_inst is
--	require is_dbg_region_start_inst
--	do
--		create Result.from_external_pointer(llvmis_adbg_region_start_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_fpto_siinst: fpto_siinst is
--	require is_fpto_siinst
--	do
--		create Result.from_external_pointer(llvmis_afpto_siinst(handle))
--		ensure Result/=Void
--	end
--
--	as_constant_int: constant_int is
--	require is_constant_int
--	do
--		create Result.from_external_pointer(llvmis_aconstant_int(handle))
--		ensure Result/=Void
--	end
--
--	as_constant_aggregate_zero: constant_aggregate_zero is
--	require is_constant_aggregate_zero
--	do
--		create Result.from_external_pointer(llvmis_aconstant_aggregate_zero(handle))
--		ensure Result/=Void
--	end
--
--	as_switch_inst: switch_inst is
--	require is_switch_inst
--	do
--		create Result.from_external_pointer(llvmis_aswitch_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_constant_expr: constant_expr is
--	require is_constant_expr
--	do
--		create Result.from_external_pointer(llvmis_aconstant_expr(handle))
--		ensure Result/=Void
--	end
--
--	as_sext_inst: sext_inst is
--	require is_sext_inst
--	do
--		create Result.from_external_pointer(llvmis_asext_inst(handle))
--		ensure Result/=Void
--	end
--
--	as_shuffle_vector_inst: shuffle_vector_inst is
--	require is_shuffle_vector_inst
--	do
--		create Result.from_external_pointer(llvmis_ashuffle_vector_inst(handle))
--		ensure Result/=Void
--	end
--

feature {ANY} -- TODO: Important Public Members of the Value class
-- Value::use_iterator - Typedef for iterator over the use-list
-- Value::use_const_iterator - Typedef for const_iterator over the use-list
-- unsigned use_size() - Returns the number of users of the value.
-- bool use_empty() - Returns true if there are no users.
-- use_iterator use_begin() - Get an iterator to the start of the use-list.
-- use_iterator use_end() - Get an iterator to the end of the use-list.
-- User *use_back() - Returns the last element in the list.
-- These methods are the interface to access the def-use information in LLVM. As with all other iterators in LLVM, the naming conventions follow the conventions defined by the STL.
-- 
-- Type *getType() const
-- This method returns the Type of the Value.
-- 
-- bool hasName() const
-- std::string getName() const
-- void setName(const std::string &Name)
-- This family of methods is used to access and assign a name to a Value, be aware of the precaution above.
-- 
-- void replaceAllUsesWith(Value *V)
-- This method traverses the use list of a Value changing all Users of the current value to refer to "V" instead. For example, if you detect that an instruction always produces a constant value (for example through constant folding), you can replace all uses of the instruction with the constant like this:
-- 
-- Inst->replaceAllUsesWith(ConstVal);
-- 

feature {WRAPPER, WRAPPER_HANDLER}
	struct_size: like size_t
		-- LLVM_VALUE wraps a polymorphic C++ class; temporarly this query
		-- always fails; it should not hamper proper usage, since it is used
		-- only to allocate memory during object copying with the standard
		-- feature.
	require implemented: False
		do
			not_yet_implemented -- or mostly unuseful
		end

	end -- class LLVM_VALUE

-- Copyright (C) 2009-2017: Paolo Redaelli

-- This file is part of LLVM wrappers for Liberty Eiffel.
--
-- This library is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--

