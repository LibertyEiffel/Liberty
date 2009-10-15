class LLVM_FUNCTION_TYPE

inherit LLVM_TYPE

creation make
feature 
	make (a_return_type: LLVM_TYPE; some_parameters: COLLECTION[LLVM_TYPE]; a_variadic_function: BOOLEAN) is
	-- Create a function type with `a_return_type' and `some_parameters'; if
	-- `a_variadic_function' is True the Result will be variadic.

	-- If `some_parameters' does not conform to a C_ARRAY it has to be copied before actual creation.
	require 
		a_return_type/=Void
		some_parameters/=Void
	local an_array: NATIVE_ARRAY[POINTER]; c_array: C_ARRAY[LLVM_TYPE]
	do
		c_array ?= some_parameters 
		if c_array/=Void then -- some_parameters is a C_ARRAY; we can directly pass the address of the C array
			an_array.from_pointer(c_array.to_external)
		else 
			FINISCIMI!
	ensure a_variadic_function=is_variadic
	end
invariant type.is_function_type_kind
end -- LLVM_FUNCTION_TYPE

-- Copyright 2009 Paolo Redaelli

