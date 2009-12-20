class LLVM_BUILDER
	-- An instruction builder representing a point within an LLVM_BASIC_BLOCK; it allows to build instructions using the C interface.

inherit C_STRUCT
insert CORE_EXTERNALS
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
	do
		Result:=wrapper_or_void(llvmget_insert_block(handle))
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
-- void LLVMInsertIntoBuilderWithName(LLVMBuilderRef Builder, LLVMValueRef Instr,
--                                    const char *Name);

-- 
-- /* Terminators */
-- LLVMValueRef LLVMBuildRetVoid(LLVMBuilderRef);
-- LLVMValueRef LLVMBuildRet(LLVMBuilderRef, LLVMValueRef V);
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
