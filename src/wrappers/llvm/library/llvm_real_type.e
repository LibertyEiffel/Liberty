class LLVM_REAL_TYPE
	-- Float: 32bit
	-- Double: 64 bit
	-- X86: 80 bit
	-- fp128: 128bit with 112 bit of mantissa
	-- ppc_fp128: 128 bit (two 64 bits)

inherit LLVM_TYPE

creation
	from_external_pointer,
	as_float, as_float_in_context,
	as_double, as_double_in_context,
	as_x86, as_x86_in_context
	-- TODO: allow creation of fp128 and ppc_fp128

feature {} -- Creation
	as_float is
	do
		handle := llvmfloat_type
	end

	as_float_in_context (a_context: LLVM_CONTEXT) is
		require a_context/=Void
		do
			handle:=llvmfloat_type_in_context(a_context.handle)
		end
	
	as_double is
	do
		handle := llvmdouble_type
	end
	
	as_double_in_context (a_context: LLVM_CONTEXT) is
		require a_context/=Void
		do
			handle:=llvmdouble_type_in_context(a_context.handle)
		end

	as_x86 is
	do
		handle := llvmx_86fp_80type
	end
	
	as_x86_in_context (a_context: LLVM_CONTEXT) is
		require a_context/=Void
		do
			handle:=llvmx_86fp_80type_in_context(a_context.handle)
		end

-- TODO: write a correct invariant type.is_real_type_kind
end -- class LLVM_REAL_TYPE

-- Copyright 2009 Paolo Redaelli

