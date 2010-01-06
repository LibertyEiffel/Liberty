class LLVM_BASIC_BLOCK
	-- LLVM Basic Block Representation.

	-- This represents a single basic block in LLVM. A basic
	-- block is simply a container of instructions that
	-- execute sequentially. Basic blocks are Values because
	-- they are referenced by instructions such as branches
	-- and switch tables.

	-- The type of a BasicBlock is "Type::LabelTy" because
	-- the basic block represents a label to which a branch
	-- can jump.

	-- well formed basic block is formed of a list of
	-- non-terminating instructions followed by a single
	-- TerminatorInst instruction. TerminatorInst's may not
	-- occur in the middle of basic blocks, and must
	-- terminate the blocks. The BasicBlock class allows
	-- malformed basic blocks to occur because it may be
	-- useful in the intermediate stage of constructing or
	-- modifying a program. However, the verifier will ensure
	-- that basic blocks are "well formed".
inherit LLVM_VALUE
insert 	LLVM_VALUE_FACTORY 
creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer
feature 
	
feature	
	-- TODO: "as_value: LLVM_VALUE is -- Current basic block as a value do LLVMValueRef LLVMBasicBlockAsValue(LLVMBasicBlockRef BB);:w" and

	parent: LLVM_VALUE is
		--- The value that contains Current block
		do
			Result:=value_wrapper_or_void(llvmget_basic_block_parent(handle))
		end

	next: LLVM_BASIC_BLOCK is
		-- The block after Current. May be Void
	local p: POINTER
	do
		p:=llvmget_next_basic_block(handle)
		if p.is_not_null then 
			create Result.from_external_pointer(p)
		end
	end

	previous: LLVM_BASIC_BLOCK is
		-- The block before Current. May be Void
	local p: POINTER
	do
		p:= llvmget_previous_basic_block(handle)
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end
-- LLVMBasicBlockRef LLVMAppendBasicBlockInContext(LLVMContextRef C,
--                                                 LLVMValueRef Fn,
--                                                 const char *Name);
-- LLVMBasicBlockRef LLVMInsertBasicBlockInContext(LLVMContextRef C,
--                                                 LLVMBasicBlockRef BB,
--                                                 const char *Name);
-- 
-- LLVMBasicBlockRef LLVMAppendBasicBlock(LLVMValueRef Fn, const char *Name);
-- LLVMBasicBlockRef LLVMInsertBasicBlock(LLVMBasicBlockRef InsertBeforeBB,
--                                        const char *Name);
-- void LLVMDeleteBasicBlock(LLVMBasicBlockRef BB);

	new_iterator: ITERATOR[LLVM_INSTRUCTION] is
		do
			create {ITERATOR_OVER_INSTRUCTIONS} Result.from_block(Current)
		ensure Result/=Void
		end
end -- class LLVM_BASIC_BLOCK

-- Copyright 2009 Paolo Redaelli, partially derived from LLVM documentation
