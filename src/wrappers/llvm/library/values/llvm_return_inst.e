class LLVM_RETURN_INST
	-- An instruction that returns a value (possibly void); execution does not
	-- continue in this function any longer.

inherit LLVM_TERMINATOR_INST
creation {LLVM_BUILDER} from_external_pointer

end -- class LLVM_RETURN_INST

-- Copyright 2009 Paolo Redaelli
