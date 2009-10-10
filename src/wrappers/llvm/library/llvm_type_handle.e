class LLVM_TYPE_HANDLE

inherit 
	C_STRUCT
	EIFFEL_OWNED redefine dispose end

insert LLVM_TYPE_FACTORY undefine copy, is_equal end

creation from_type

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
		Result:=wrapper(llvmresolve_type_handle(handle))
	end

feature -- Disposing
	dispose is
		do
			llvmdispose_type_handle(handle)
		end

end -- class LLVM_TYPE_HANDLE

-- Copyright 2009 Paolo Redaelli

