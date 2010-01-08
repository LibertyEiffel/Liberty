class LLVM_CONTEXT

inherit 
	C_STRUCT
		redefine default_create
		end
	EIFFEL_OWNED 
		-- TODO: check if it is the correct behaviour.
		redefine dispose, default_create
		end
insert CORE_EXTERNALS undefine default_create end
creation {ANY} default_create, make
creation {WRAPPER,WRAPPER_HANDLER} from_external_pointer
feature {} -- Creation
	make is
		do
			handle:=llvmcontext_create
		end

	default_create is
		do
			handle:=llvmget_global_context
		end

feature {} -- Disposing
	dispose is
		do
			llvmcontext_dispose(handle)
		end

	struct_size: INTEGER is do not_yet_implemented end 

end -- class LLVM_CONTEXT

-- Copyright 2009 Paolo Redaelli
