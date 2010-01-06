class LLVM_VOID_TYPE

inherit LLVM_TYPE
creation make, in_context, from_external_pointer
feature {ANY} -- Creation 
	make is
		do
			handle:=llvmvoid_type
		end

	in_context (a_context: LLVM_CONTEXT) is
	require a_context/=Void
	do
		handle:=llvmvoid_type_in_context(a_context.handle)
	end
invariant type.is_void_type_kind
end -- class LLVM_VOID_TYPE

-- Copyright 2009 Paolo Redaelli

