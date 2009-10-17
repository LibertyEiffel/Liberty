class LLVM_INTEGER_TYPE
	-- Integer representation type in LLVM.

	-- It represents integer types, including the built-in 1-bit. 8-bit,
	-- 16-bit, 32-bit and 64-bit.

	-- The underlying C++ function to get or create an IntegerType pointer is
	-- "const IntegerType *IntegerType::get ( LLVMContext & C, unsigned
	-- NumBits )" and is a static method and it's the primary way of
	-- constructing an IntegerType. If an IntegerType with the same NumBits
	-- value was previously instantiated, that instance will be returned.
	-- Otherwise a new one will be created. Only one instance with a given
	-- NumBits value is ever created.

inherit
	LLVM_TYPE

creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer
creation {ANY}
	with_1_bit, with_1_bit_in_context, 
	with_8_bits, with_8_bits_in_context, 
	with_16_bits, with_16_bits_in_context, 
	with_32_bits, with_32_bits_in_context, 
	with_64_bits, with_64_bits_in_context, 
	with_bits, with_bits_in_context

feature {} -- Creation in a specific context
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

	with_bits_in_context (a_bit_count: NATURAL_32) is
		do
			handle := llvmint_type(a_bit_count)
		end


feature {} -- Creation in global context
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
	
	with_bits (a_bit_count: NATURAL_32) is
		do
			handle := llvmint_type(a_bit_count)
		end

feature 
	width: NATURAL_32 is
		do
			Result := llvmget_int_type_width(handle)
		end
invariant
	type.is_integer_type_kind

end -- class LLVM_INTEGER_TYPE
-- Copyright 2009 Paolo Redaelli
