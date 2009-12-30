deferred class LLVM_INTEGER_TYPES
	-- A provider for commonly used integer types: boolean (1bit),
	-- 8,16,32,64 bits.

feature -- Shared integer types
	boolean_type: LLVM_INTEGER_TYPE is once create Result.with_1_bit end
	integer_8bit_type: LLVM_INTEGER_TYPE is once create Result.with_1_bit end
	integer_16bit_type: LLVM_INTEGER_TYPE is once create Result.with_8_bits end
	integer_32bit_type: LLVM_INTEGER_TYPE is once create Result.with_32_bits end
	integer_64bit_type: LLVM_INTEGER_TYPE is once create Result.with_64_bits end 
end
