class LLVM_CONTEXT

inherit 
	C_STRUCT
	EIFFEL_OWNED -- TODO: check if it is the correct behaviour.
insert CORE_EXTERNALS
creation make
feature 
	make is
		do
			handle:=llvmcontext_create
		end

	dispose is
		do
			llvmcontext_dispose
		end
end  LLVM_CONTEXT

