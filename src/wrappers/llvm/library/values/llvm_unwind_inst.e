class LLVM_UNWIND_INST
	-- An instruction that immediately exit the current function, unwinding the
	-- stack until an invoke instruction is found. 

inherit LLVM_TERMINATOR_INST

end -- class LLVM_UNWIND_INST

-- Copyright 2009 Paolo Redaelli
