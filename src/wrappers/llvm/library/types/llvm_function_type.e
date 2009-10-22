class LLVM_FUNCTION_TYPE
	-- A type representing a function. 

	-- It is a COLLECTION of LLVM_TYPEs, the types of its arguments.

	-- TODO: ask LLVM developers if parameter list may change during object's lifetime. In that case how to be notied? When noti

inherit 
	LLVM_TYPE undefine fill_tagged_out_memory redefine copy end 
	LLVM_TYPE_FACTORY 
	C_ARRAY[LLVM_TYPE] 
		undefine is_equal -- use is_equal from LLVM_TYPE 
		redefine copy
		end 

creation make, from_external_pointer
feature 
	make (a_return_type: LLVM_TYPE; some_parameters: C_ARRAY[LLVM_TYPE]; a_variadic_function: BOOLEAN) is
	-- Create a function type with `a_return_type' and `some_parameters'
	-- Variadic functions, allowed by LLVM don't fit Eiffel design rules therefore are not supported
	
	-- TODO: make `some_parameters' a COLLECTION[LLVM_TYPE], so that if
	-- `some_parameters' conforms to a C_ARRAY it will be used directly;
	-- otherwise if will be copies into a newly created C_ARRAY that will be
	-- passed to LLVM.
	require 
		a_return_type/=Void
		some_parameters/=Void
	do
		handle := llvmfunction_type(a_return_type.handle, some_parameters.to_pointer, some_parameters.count.to_natural_32, 0)
		-- 0 stands for an eventual `a_variadic_function'.to_integer_32; if
		-- `a_variadic_function' is True the Result will be variadic.

		-- Initialize `storage' with the parameters of the function
		storage := storage.calloc(llvmcount_param_types(handle).to_integer_32)
		llvmget_param_types(handle, storage.to_pointer)
		-- ensure a_variadic_function=is_variadic
	end

	copy (another: like Current) is
		do
			handle:=another.handle
			storage:=storage.calloc(another.count)
			storage.copy_from(another.storage,another.upper)
		end
feature 
	return_type: LLVM_TYPE is
		do
			Result:=wrapper(llvmget_return_type(handle))
		end

invariant type.is_function_type_kind
end -- LLVM_FUNCTION_TYPE

-- Copyright 2009 Paolo Redaelli

