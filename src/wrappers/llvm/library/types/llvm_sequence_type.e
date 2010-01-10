deferred class LLVM_SEQUENCE_TYPE
	-- Anchestor of LLVM_ARRAY_TYPE, LLVM_POINTER_TYPE and LLVM_VECTOR_TYPE
inherit LLVM_TYPE
insert LLVM_TYPE_FACTORY

feature 
	element_type: LLVM_TYPE is
		-- The type of the elements of Current sequence.
	do
		Result:=type_wrapper(llvmget_element_type(handle))
	ensure Result/=Void
	end

end -- class LLVM_SEQUENCE_TYPE

-- Copyright 2009 Paolo Redaelli

