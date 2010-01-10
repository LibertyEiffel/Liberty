class LLVM_INVOKE_INST
	-- An invoke instruction; the (TODO) `subclassdata' feature holds the calling convention..

inherit LLVM_TERMINATOR_INST
creation {LLVM_BUILDER} from_external_pointer
end -- class LLVM_INVOKE_INST

-- Copyright 2009 Paolo Redaelli
