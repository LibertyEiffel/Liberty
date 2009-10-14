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

end -- class LLVM_BASIC_BLOCK

-- Copyright 2009 Paolo Redaelli, partially derived from LLVM documentation
