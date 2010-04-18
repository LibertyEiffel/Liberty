class LLVM_TYPE_HANDLE

inherit 
	C_STRUCT
	EIFFEL_OWNED redefine dispose end

insert LLVM_TYPE_FACTORY

creation from_type, from_external_pointer

feature 
	from_type (a_type: LLVM_TYPE) is
		-- `a_type' is potentially an abstract type.
	require a_type/=Void
	do
		handle:=llvmcreate_type_handle(a_type.handle)
	end

	type: LLVM_TYPE is
		-- Current resolved into an effective type. 
	do
		Result:=type_wrapper(llvmresolve_type_handle(handle))
	end

	-- TODO: provide refining support:  void LLVMRefineType(LLVMTypeRef AbstractTy, LLVMTypeRef ConcreteTy);

feature -- Disposing
	dispose is
		do
			llvmdispose_type_handle(handle)
		end

	struct_size: INTEGER is do not_yet_implemented end 
end -- class LLVM_TYPE_HANDLE

-- Copyright 2009 Paolo Redaelli

