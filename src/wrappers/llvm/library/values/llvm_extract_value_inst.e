class LLVM_EXTRACT_VALUE_INST
	-- An instruction to extract a struct member or an array element from an aggregate value

inherit LLVM_UNARY_INST

creation {LLVM_BUILDER} from_external_pointer

end -- class LLVM_EXTRACT_VALUE_INST

-- Copyright 2009 Paolo Redaelli	
