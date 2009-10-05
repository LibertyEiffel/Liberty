class LLVM_INTEGER_TYPE
	-- Integer representation type in LLVM.

	-- It represents integer types, including the built-in 1-bit. 8-bit, 16-bit, 32-bit and 64-bit.

	-- TODO: This API looks horrible as soon as I finished translating it from C. 

inherit
	LLVM_TYPE

creation {ANY}
	with_1_bit, with_1_bit_in_context, 
	with_8_bits, with_8_bits_in_context, 
	with_16_bits, with_16_bits_in_context, 
	with_32_bits, with_32_bits_in_context, 
	with_64_bits, with_64_bits_in_contexti --, with_n_bits, with_n_bits_in_context

feature {} -- Creation
	with_1_bit_in_context (a_context: LLVM_CONTEXT) is
		require
			a_context /= Void
		do
			handle := llvmint_1type_in_context(a_context.handle)
		end

	with_8_bits_in_context (a_context: LLVM_CONTEXT) is
		require
			a_context /= Void
		do
			handle := llvmint_8type_in_context(a_context.handle)
		end

	with_16_bits_in_context (a_context: LLVM_CONTEXT) is
		require
			a_context /= Void
		do
			handle := llvmint_16type_in_context(a_context.handle)
		end

	with_32_bits_in_context (a_context: LLVM_CONTEXT) is
		require
			a_context /= Void
		do
			handle := llvmint_32type_in_context(a_context.handle)
		end

	with_64_bits_in_context (a_context: LLVM_CONTEXT) is
		require
			a_context /= Void
		do
			handle := llvmint_1type_in_context(a_context.handle)
		end

	with_1_bit is
		do
			handle := llvmint_1type
		end

	with_8_bits is
		do
			handle := llvmint_8type
		end

	with_16_bits is
		do
			handle := llvmint_16type
		end

	with_32_bits is
		do
			handle := llvmint_32type
		end

	with_64_bits is
		do
			handle := llvmint_64type
		end
		-- LLVMTypeRef LLVMIntType(unsigned NumBits);
		-- unsigned LLVMGetIntTypeWidth(LLVMTypeRef IntegerTy);

invariant
	type.is_integer_type_kind

end -- class LLVM_INTEGER_TYPE
-- Copyright 2009 Paolo Redaelli
