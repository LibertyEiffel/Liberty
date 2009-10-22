class LLVM_UNREACHABLE_INST
	-- An instruction with an undefined behaviour. In particular, the presence
	-- of this instruction indicates some higher level knowledge that the end
	-- of the block cannot be reached.

inherit LLVM_TERMINATOR_INST

end -- class LLVM_UNREACHABLE_INST

-- Copyright 2009 Paolo Redaelli
