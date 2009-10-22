deferred class LLVM_INTRINSIC_INST
	-- An LLVM_INTRINSIC_INST is used to inspect calls to intrinsic functions,
	-- allowing the standard isa/dyncast/cast functionality to work with calls
	-- to intrinsic functions.
inherit LLVM_INSTRUCTION
end -- class LLVM_CALL_INST

-- Copyright 2009 Paolo Redaelli
