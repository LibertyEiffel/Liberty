class LLVM_CONSTANT_VECTOR
inherit 
	LLVM_CONSTANT 
		redefine type end
creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer
feature 
	type: LLVM_VECTOR_TYPE is
		do
			create Result.from_external_pointer(llvmtype_of(handle))
		end
		
end -- class LLVM_CONSTANT_VECTOR
-- Copyright 2009 Paolo Redaellis
