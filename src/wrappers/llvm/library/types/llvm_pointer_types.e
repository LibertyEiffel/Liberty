deferred class LLVM_POINTER_TYPES
	-- Commodity queries for commonly used integer types: boolean (1bit),
	-- 8,16,32,64 bits and commodoty creation factory-like features
	obsolete "use LLVM_C_TYPES"

insert ANY undefine copy, is_equal end
feature -- 
	pointer(a_type: LLVM_TYPE): LLVM_POINTER_TYPE is
		-- The type of a pointer to `a_type'; i.e. pointer(int_32) represents "int*".
	require a_type/=Void
	do
		create Result.make(a_type)
	ensure Result/=Void
	end
end
