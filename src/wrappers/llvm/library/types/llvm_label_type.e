class LLVM_LABEL_TYPE

inherit LLVM_TYPE

creation {ANY} make, in_context
creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer

feature -- Creation 
	make is
		do
			handle:=llvmlabel_type
		end

	in_context (a_context: LLVM_CONTEXT) is
	require a_context/=Void
	do
		handle:=llvmlabel_type_in_context(a_context.handle)
	end

invariant type.is_label_type_kind
end -- class LLVM_LABEL_TYPE

-- Copyright 2009 Paolo Redaelli

