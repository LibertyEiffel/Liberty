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
		rename 
			wrapper as value, 
			wrapper_or_void as value_or_void 
		end
creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer
feature	
	-- TODO: "as_value: LLVM_VALUE is -- Current basic block as a value do LLVMValueRef LLVMBasicBlockAsValue(LLVMBasicBlockRef BB);:w" and

	parent: LLVM_VALUE is
		local p: POINTER
		do
			p:=llvmget_basic_block_parent(handle)
			if p.is_not_null then Result:=value(p) end
		end

-- unsigned LLVMCountBasicBlocks(LLVMValueRef Fn);
-- void LLVMGetBasicBlocks(LLVMValueRef Fn, LLVMBasicBlockRef *BasicBlocks);
-- LLVMBasicBlockRef LLVMGetFirstBasicBlock(LLVMValueRef Fn);
-- LLVMBasicBlockRef LLVMGetLastBasicBlock(LLVMValueRef Fn);
-- LLVMBasicBlockRef LLVMGetNextBasicBlock(LLVMBasicBlockRef BB);
-- LLVMBasicBlockRef LLVMGetPreviousBasicBlock(LLVMBasicBlockRef BB);
-- LLVMBasicBlockRef LLVMGetEntryBasicBlock(LLVMValueRef Fn);


end -- class LLVM_BASIC_BLOCK

-- Copyright 2009 Paolo Redaelli, partially derived from LLVM documentation
