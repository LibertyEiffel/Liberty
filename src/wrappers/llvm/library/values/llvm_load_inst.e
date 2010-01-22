class LLVM_LOAD_INST
	-- An instruction to read from memory, using `subclassdata' (TODO) field
	-- to store. The load may or may not be volatile. 

inherit LLVM_UNARY_INST

creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer

end -- class LLVM_LOAD_INST

-- Copyright 2009 Paolo Redaelli	
