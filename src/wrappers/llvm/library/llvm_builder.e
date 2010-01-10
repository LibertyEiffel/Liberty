class LLVM_BUILDER
	-- An instruction builder representing a point within an LLVM_BASIC_BLOCK; it allows to build instructions using the C interface.

inherit C_STRUCT redefine default_create end 
insert CORE_EXTERNALS redefine default_create end 
creation in_context, default_create
feature -- Creation
	in_context (a_context: LLVM_CONTEXT) is
		-- Create an LLVM_BUILDER in `a_context'.
	require a_context/=Void
	do
		from_external_pointer(llvmcreate_builder_in_context(a_context.handle))
	end

	default_create is
		do
			from_external_pointer(llvmcreate_builder)
		end

feature -- Positioning
	set_position (a_block: LLVM_BASIC_BLOCK; an_instruction: LLVM_VALUE) is
		-- TODO: description
	require
		a_block/=Void
		an_instruction/=Void
	do
		llvmposition_builder(handle,a_block.handle,an_instruction.handle)
	end

	position_before (an_instruction: LLVM_INSTRUCTION) is
		-- Set Current position before `an_instruction'
	require an_instruction/=Void
	do
		llvmposition_builder_before(handle,an_instruction.handle)
	end
	
	position_at_end_of (a_block: LLVM_BASIC_BLOCK) is
		-- Set Current position at the end of `a_block'
	require a_block/=Void
	do
		llvmposition_builder_at_end(handle,a_block.handle)
	end

	insert_block: LLVM_BASIC_BLOCK is
	local p: POINTER
	do
		p := llvmget_insert_block(handle)
		if p.is_not_null then create Result.from_external_pointer(p) end
	end

	clear_insertion_position is
		do
			llvmclear_insertion_position(handle)
		end

	insert_instruction (an_instruction: LLVM_INSTRUCTION) is
	require an_instruction/=Void
	do
		llvminsert_into_builder(handle,an_instruction.handle)
	end

	insert_with_name (a_value: LLVM_VALUE; a_name: ABSTRACT_STRING) is
	require 
		a_value/=Void
		a_name/=Void
	do
		llvminsert_into_builder_with_name(handle,a_value.handle,a_name.to_external)
	end
feature {ANY} -- Terminators 
	return_void: LLVM_RETURN_INST is
		do
			create Result.from_external_pointer(llvmbuild_ret_void(handle))
		end
	
	return (a_value: LLVM_VALUE): LLVM_RETURN_INST is
		-- A "ret" instruction returing `a_value'
	require a_value/=Void
	do
		create Result.from_external_pointer(llvmbuild_ret(handle,a_value.handle))
	ensure Result/=Void
	end
	
	aggregate_return (some_values: COLLECTION[LLVM_VALUE]): LLVM_RETURN_INST is
		-- A "ret" instruction returning `some_values'.
	require some_values/=Void; not some_values.is_empty
	local sv: FAST_ARRAY[POINTER]; i: ITERATOR[LLVM_VALUE]
	do
		create sv.with_capacity(some_values.count)
		from i:=some_values.new_iterator; i.start 
		until i.is_off loop
			sv.add_last(i.item.handle); i.next
		end
		create Result.from_external_pointer
		(llvmbuild_aggregate_ret(handle,sv.to_external,some_values.count.to_natural_32))
	ensure Result/=Void
	end
	
	unconditional_branch (a_destination: LLVM_BASIC_BLOCK): LLVM_BRANCH_INST is
		-- An unconditional branch "br" instruction that transfer the control
		-- flow to a different basic block in the current function.
	require a_destination/=Void
	do
		create Result.from_external_pointer(llvmbuild_br(handle,a_destination.handle))
	ensure Result/=Void
	end

	conditional_branch (an_if: LLVM_VALUE; a_then, an_else: LLVM_BASIC_BLOCK): LLVM_BRANCH_INST is
		-- A conditional branch "br" instruction that will pass control flow to
		-- `a_then' if `an_if' evaluates to True, to `an_else' otherwise
	require 
		an_if/=Void
		a_then/=Void
		an_else/=Void
	do
		create Result.from_external_pointer (llvmbuild_cond_br
		(handle, an_if.handle, a_then.handle, an_else.handle))
	ensure Result/=Void
	end

	switch (a_value: LLVM_VALUE; an_else: LLVM_BASIC_BLOCK; a_number_of_cases: NATURAL_32): LLVM_SWITCH_INST is
		-- A 'switch' instruction, used to transfer control flow to one of
		-- several different places. It is a generalization of the 'br'
		-- instruction, allowing a branch to occur to one of many possible
		-- destinations. `an_else' is executed when `a_value' will not match
		-- one of the cases added later with `add_case' which must be exactly
		-- `a_number_of_cases'.
	require 
		a_value/=Void
		an_else/=Void
	do
		create Result.from_external_pointer
		(llvmbuild_switch(handle,a_value.handle,an_else.handle,a_number_of_cases))
	ensure Result/=Void
	end

	invoke (a_function: LLVM_FUNCTION_TYPE; some_arguments: COLLECTION[LLVM_VALUE]; a_then, a_catch: LLVM_BASIC_BLOCK; a_name: ABSTRACT_STRING): LLVM_INVOKE_INST is
		-- An "invoke" instruction. If parameterless `some_arguments' will be Void for a parameterless function. 
		-- TODO: specify the meaning of `a_then' and `a_catch'.
		require
			a_function/=Void
			a_then/=Void
			a_catch/=Void
			a_name/=Void
		local args: FAST_ARRAY[POINTER]; args_p: POINTER
		do
			if some_arguments/=Void and then not some_arguments.is_empty then
				args:=collection_to_c_array(some_arguments)
				args_p := args.to_external
			end
			create Result.from_external_pointer
			(llvmbuild_invoke(handle,a_function.handle,
			args_p,args.count.to_natural_32,
			a_then.handle,a_catch.handle, a_name.to_external))
		end
-- LLVMValueRef LLVMBuildUnwind(LLVMBuilderRef);
-- LLVMValueRef LLVMBuildUnreachable(LLVMBuilderRef);

feature {ANY} -- Arithmetic
	add (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- Create an `add' instruction with `a_name' summing `a_left' and `a_right'.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		do
			create Result.from_external_pointer
			(llvmbuild_add(handle,a_left.handle, a_right.handle, a_name.to_external))
		ensure Result/=Void
		end

-- LLVMValueRef LLVMBuildAdd(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                           const char *Name);
-- LLVMValueRef LLVMBuildNSWAdd(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                              const char *Name);
-- LLVMValueRef LLVMBuildFAdd(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildSub(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                           const char *Name);
-- LLVMValueRef LLVMBuildFSub(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
	mul (a_left, a_right: LLVM_VALUE; a_name: ABSTRACT_STRING): LLVM_VALUE is
		-- Create an `mul' instruction with `a_name' multiplying `a_left' and `a_right'.
	require 
		a_left/=Void
		a_right/=Void
		a_name/=Void
		do
			create Result.from_external_pointer
			(llvmbuild_mul(handle,a_left.handle, a_right.handle, a_name.to_external))
		ensure Result/=Void
		end

-- LLVMValueRef LLVMBuildMul(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                           const char *Name);
-- LLVMValueRef LLVMBuildFMul(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildUDiv(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildSDiv(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildExactSDiv(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                                 const char *Name);
-- LLVMValueRef LLVMBuildFDiv(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildURem(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildSRem(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildFRem(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildShl(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildLShr(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildAShr(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildAnd(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                           const char *Name);
-- LLVMValueRef LLVMBuildOr(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                           const char *Name);
-- LLVMValueRef LLVMBuildXor(LLVMBuilderRef, LLVMValueRef LHS, LLVMValueRef RHS,
--                           const char *Name);
-- LLVMValueRef LLVMBuildNeg(LLVMBuilderRef, LLVMValueRef V, const char *Name);
-- LLVMValueRef LLVMBuildNot(LLVMBuilderRef, LLVMValueRef V, const char *Name);
-- 
feature {ANY} -- Memory
-- LLVMValueRef LLVMBuildMalloc(LLVMBuilderRef, LLVMTypeRef Ty, const char *Name);
-- LLVMValueRef LLVMBuildArrayMalloc(LLVMBuilderRef, LLVMTypeRef Ty,
--                                   LLVMValueRef Val, const char *Name);
-- LLVMValueRef LLVMBuildAlloca(LLVMBuilderRef, LLVMTypeRef Ty, const char *Name);
-- LLVMValueRef LLVMBuildArrayAlloca(LLVMBuilderRef, LLVMTypeRef Ty,
--                                   LLVMValueRef Val, const char *Name);
-- LLVMValueRef LLVMBuildFree(LLVMBuilderRef, LLVMValueRef PointerVal);
-- LLVMValueRef LLVMBuildLoad(LLVMBuilderRef, LLVMValueRef PointerVal,
--                            const char *Name);
-- LLVMValueRef LLVMBuildStore(LLVMBuilderRef, LLVMValueRef Val, LLVMValueRef Ptr);
-- LLVMValueRef LLVMBuildGEP(LLVMBuilderRef B, LLVMValueRef Pointer,
--                           LLVMValueRef *Indices, unsigned NumIndices,
--                           const char *Name);
-- LLVMValueRef LLVMBuildInBoundsGEP(LLVMBuilderRef B, LLVMValueRef Pointer,
--                                   LLVMValueRef *Indices, unsigned NumIndices,
--                                   const char *Name);
-- LLVMValueRef LLVMBuildStructGEP(LLVMBuilderRef B, LLVMValueRef Pointer,
--                                 unsigned Idx, const char *Name);
-- LLVMValueRef LLVMBuildGlobalString(LLVMBuilderRef B, const char *Str,
--                                    const char *Name);
-- LLVMValueRef LLVMBuildGlobalStringPtr(LLVMBuilderRef B, const char *Str,
--                                       const char *Name);
-- 
feature -- Casts
-- LLVMValueRef LLVMBuildTrunc(LLVMBuilderRef, LLVMValueRef Val,
--                             LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildZExt(LLVMBuilderRef, LLVMValueRef Val,
--                            LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildSExt(LLVMBuilderRef, LLVMValueRef Val,
--                            LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildFPToUI(LLVMBuilderRef, LLVMValueRef Val,
--                              LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildFPToSI(LLVMBuilderRef, LLVMValueRef Val,
--                              LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildUIToFP(LLVMBuilderRef, LLVMValueRef Val,
--                              LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildSIToFP(LLVMBuilderRef, LLVMValueRef Val,
--                              LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildFPTrunc(LLVMBuilderRef, LLVMValueRef Val,
--                               LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildFPExt(LLVMBuilderRef, LLVMValueRef Val,
--                             LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildPtrToInt(LLVMBuilderRef, LLVMValueRef Val,
--                                LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildIntToPtr(LLVMBuilderRef, LLVMValueRef Val,
--                                LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildBitCast(LLVMBuilderRef, LLVMValueRef Val,
--                               LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildZExtOrBitCast(LLVMBuilderRef, LLVMValueRef Val,
--                                     LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildSExtOrBitCast(LLVMBuilderRef, LLVMValueRef Val,
--                                     LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildTruncOrBitCast(LLVMBuilderRef, LLVMValueRef Val,
--                                      LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildPointerCast(LLVMBuilderRef, LLVMValueRef Val,
--                                   LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildIntCast(LLVMBuilderRef, LLVMValueRef Val,
--                               LLVMTypeRef DestTy, const char *Name);
-- LLVMValueRef LLVMBuildFPCast(LLVMBuilderRef, LLVMValueRef Val,
--                              LLVMTypeRef DestTy, const char *Name);
-- 
feature -- Comparisons
-- LLVMValueRef LLVMBuildICmp(LLVMBuilderRef, LLVMIntPredicate Op,
--                            LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- LLVMValueRef LLVMBuildFCmp(LLVMBuilderRef, LLVMRealPredicate Op,
--                            LLVMValueRef LHS, LLVMValueRef RHS,
--                            const char *Name);
-- 
feature -- Miscellaneous instructions
-- LLVMValueRef LLVMBuildPhi(LLVMBuilderRef, LLVMTypeRef Ty, const char *Name);
-- LLVMValueRef LLVMBuildCall(LLVMBuilderRef, LLVMValueRef Fn,
--                            LLVMValueRef *Args, unsigned NumArgs,
--                            const char *Name);
-- LLVMValueRef LLVMBuildSelect(LLVMBuilderRef, LLVMValueRef If,
--                              LLVMValueRef Then, LLVMValueRef Else,
--                              const char *Name);
-- LLVMValueRef LLVMBuildVAArg(LLVMBuilderRef, LLVMValueRef List, LLVMTypeRef Ty,
--                             const char *Name);
-- LLVMValueRef LLVMBuildExtractElement(LLVMBuilderRef, LLVMValueRef VecVal,
--                                      LLVMValueRef Index, const char *Name);
-- LLVMValueRef LLVMBuildInsertElement(LLVMBuilderRef, LLVMValueRef VecVal,
--                                     LLVMValueRef EltVal, LLVMValueRef Index,
--                                     const char *Name);
-- LLVMValueRef LLVMBuildShuffleVector(LLVMBuilderRef, LLVMValueRef V1,
--                                     LLVMValueRef V2, LLVMValueRef Mask,
--                                     const char *Name);
-- LLVMValueRef LLVMBuildExtractValue(LLVMBuilderRef, LLVMValueRef AggVal,
--                                    unsigned Index, const char *Name);
-- LLVMValueRef LLVMBuildInsertValue(LLVMBuilderRef, LLVMValueRef AggVal,
--                                   LLVMValueRef EltVal, unsigned Index,
--                                   const char *Name);
-- 
-- LLVMValueRef LLVMBuildIsNull(LLVMBuilderRef, LLVMValueRef Val,
--                              const char *Name);
-- LLVMValueRef LLVMBuildIsNotNull(LLVMBuilderRef, LLVMValueRef Val,
--                                 const char *Name);
-- LLVMValueRef LLVMBuildPtrDiff(LLVMBuilderRef, LLVMValueRef LHS,
--                               LLVMValueRef RHS, const char *Name);
-- 
-- 
feature {} 
	struct_size: INTEGER is
		do
			not_yet_implemented
		end

	dispose is 
		do
			llvmdispose_builder(handle)
		end

end -- class LLVM_BUILDER	
