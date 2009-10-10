class LLVM_CONTEXT

inherit 
	C_STRUCT
	EIFFEL_OWNED 
		-- TODO: check if it is the correct behaviour.
		redefine dispose
		end
insert CORE_EXTERNALS
creation make, from_external_pointer
feature 
	make is
		do
			handle:=llvmcontext_create
		end

	dispose is
		do
			llvmcontext_dispose(handle)
		end

	struct_size: INTEGER is do not_yet_implemented end 

end -- class LLVM_CONTEXT

-- Copyright 2009 Paolo Redaelli
