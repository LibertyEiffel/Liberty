class LLVM_FUNCTION
	-- A function in LLVM 

	-- Note: variadic functions - functions accepting
	-- a variable number of arguments - are not
	-- supported. 
inherit 
	LLVM_GLOBAL_VALUE
	GLOBALLY_CACHED

creation from_external_pointer

feature 
	make (a_return_type: LLVM_TYPE; some_parameters: WRAPPER_COLLECTION[LLVM_TYPE]) is
	do
		from_external_pointer
		(llvmfunction_type
		(null_or(a_return_type),
		 null_or_array(some_parameters),
		0 -- i.e. False, non-variadic
		))

	end
feature -- Iterating over blocks

	-- `first', `last' from LLVM_FUNCTION and `next', `previous' from
	-- LLVM_BASIC_BLOCK allow to iterate over blocks. A proper ITERATOR shall
	-- be provided (TODO).

	-- Note: a feature like "blocks: COLLECTION[LLVM_BASIC_BLOCK]" is not
	-- offered even if there are functions like "llvmcount_basic_blocks" and
	-- "llvmget_basic_blocks" because its content may be invalidated adding
	-- some blocks; there is not efficient way to monitor changes standing my
	-- insufficient current knowledge of LLVM. Paolo 2009-10-20.

	first: LLVM_BASIC_BLOCK is 
		-- The first block
	local p: POINTER
	do
		p := llvmget_first_basic_block(handle)
		if p.is_not_null then 
			create Result.from_external_pointer(p)
		end
	end
	
	last: LLVM_BASIC_BLOCK is
		-- The last block
	local p: POINTER
	do
		p:=llvmget_last_basic_block(handle)
		if p.is_not_null then
			create Result.from_external_pointer(p)
		end
	end
-- unsigned LLVMCountBasicBlocks(LLVMValueRef Fn);
-- void LLVMGetBasicBlocks(LLVMValueRef Fn, LLVMBasicBlockRef *BasicBlocks);
-- LLVMBasicBlockRef LLVMGetFirstBasicBlock(LLVMValueRef Fn);
-- LLVMBasicBlockRef LLVMGetLastBasicBlock(LLVMValueRef Fn);
-- LLVMBasicBlockRef LLVMGetNextBasicBlock(LLVMBasicBlockRef BB);
-- LLVMBasicBlockRef LLVMGetPreviousBasicBlock(LLVMBasicBlockRef BB);
-- LLVMBasicBlockRef LLVMGetEntryBasicBlock(LLVMValueRef Fn);

end -- class LLVM_FUNCTION

-- Copyright 2009 Paolo Redaelli
