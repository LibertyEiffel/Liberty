class LLVM_FREE_INST
	-- An instruction to deallocate memory.

inherit LLVM_UNARY_INST

creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer

end -- class LLVM_FREE_INST

-- Copyright 2009 Paolo Redaelli	
