class LLVM_OPAQUE_TYPE

inherit LLVM_TYPE
creation make, in_context, from_external_pointer
feature -- Creation 
	make is
		do
			handle:=llvmopaque_type
		end

	in_context (a_context: LLVM_CONTEXT) is
	require a_context/=Void
	do
		handle:=llvmopaque_type_in_context(a_context.handle)
	end

invariant type_kind.is_opaque_type_kind
end -- class LLVM_OPAQUE_TYPE

-- Copyright 2009 Paolo Redaelli

