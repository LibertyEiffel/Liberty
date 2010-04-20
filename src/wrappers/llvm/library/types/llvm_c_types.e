deferred class LLVM_C_TYPES
	-- Access to the LLVM_TYPEs representing basic C types.

insert ANY undefine copy, is_equal end

feature {ANY}
	-- Commodity queries for commonly used integer types: boolean (1bit),
	-- 8,16,32,64 bits and commodoty creation factory-like features

	bool: LLVM_INTEGER_TYPE is once create Result.with_1_bit end
	int_8: LLVM_INTEGER_TYPE is once create Result.with_8_bits end
	int_16: LLVM_INTEGER_TYPE is once create Result.with_16_bits end
	int_32: LLVM_INTEGER_TYPE is once create Result.with_32_bits end
	int_64: LLVM_INTEGER_TYPE is once create Result.with_64_bits end 

feature {ANY} -- 8-bit character
	-- TODO: use a portable way to discover whenever "char" is signed or not. If it will be useful.
	char: LLVM_INTEGER_TYPE is once create Result.with_8_bits end 
	string, string_type: LLVM_POINTER_TYPE is once create Result.make(char) end 

feature {ANY} -- Pointers
	pointer(a_type: LLVM_TYPE): LLVM_POINTER_TYPE is
		-- The type of a pointer to `a_type'; i.e. pointer(int_32) represents "int*".
	require a_type/=Void
	do
		create Result.make(a_type)
	ensure Result/=Void
	end
end -- class LLVM_C_TYPES
