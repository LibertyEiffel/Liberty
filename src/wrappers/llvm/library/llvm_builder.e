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
	return_void: LLVM_VALUE is
		do
			create Result.from_external_pointer(llvmbuild_ret_void(handle))
		end
	
	return (a_value: LLVM_VALUE): LLVM_VALUE is
		-- A "ret" instruction returing `a_value'
	require a_value/=Void
	do
		create Result.from_external_pointer(llvmbuild_ret(handle,a_value.handle))
	end

-- LLVMValueRef LLVMBuildAggregateRet(LLVMBuilderRef, LLVMValueRef *RetVals,
--                                    unsigned N);
-- LLVMValueRef LLVMBuildBr(LLVMBuilderRef, LLVMBasicBlockRef Dest);
-- LLVMValueRef LLVMBuildCondBr(LLVMBuilderRef, LLVMValueRef If,
--                              LLVMBasicBlockRef Then, LLVMBasicBlockRef Else);
-- LLVMValueRef LLVMBuildSwitch(LLVMBuilderRef, LLVMValueRef V,
--                              LLVMBasicBlockRef Else, unsigned NumCases);
-- LLVMValueRef LLVMBuildInvoke(LLVMBuilderRef, LLVMValueRef Fn,
--                              LLVMValueRef *Args, unsigned NumArgs,
--                              LLVMBasicBlockRef Then, LLVMBasicBlockRef Catch,
--                              const char *Name);

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
