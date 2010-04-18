deferred class LLVM_INTEGER_TYPES
	-- Commodity queries for commonly used integer types: boolean (1bit),
	-- 8,16,32,64 bits and commodoty creation factory-like features
	obsolete "use LLVM_C_TYPES"

insert ANY undefine copy, is_equal end

feature -- Shared integer types
	bool: LLVM_INTEGER_TYPE is once create Result.with_1_bit end
	int_8: LLVM_INTEGER_TYPE is once create Result.with_1_bit end
	int_16: LLVM_INTEGER_TYPE is once create Result.with_8_bits end
	int_32: LLVM_INTEGER_TYPE is once create Result.with_32_bits end
	int_64: LLVM_INTEGER_TYPE is once create Result.with_64_bits end 

end
