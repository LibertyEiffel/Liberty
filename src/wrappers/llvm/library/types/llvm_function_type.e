class LLVM_FUNCTION_TYPE
	-- A type representing a function. 

	-- It is a COLLECTION of LLVM_TYPEs, the types of its arguments.

	-- TODO: ask 

inherit 
	LLVM_TYPE 
		--undefine fill_tagged_out_memory 
		redefine copy end 
	LLVM_TYPE_FACTORY 
	-- TODO: enable access to the type of the argument of the function; it may be a 
	-- C_ARRAY[LLVM_TYPE] 
	-- 	undefine is_equal -- use is_equal from LLVM_TYPE 
	-- 	redefine copy
	-- 	end 
	-- but we shall ask LLVM developers if parameter list may change during
	-- object's lifetime. In that case how to be notied?If they may change it
	-- can hardly be a C_ARRAY, since it can change under our feets. 

creation make, from_external_pointer
feature {ANY}
	make (a_return_type: LLVM_TYPE; some_parameters: COLLECTION[LLVM_TYPE]; a_variadic_function: BOOLEAN) is
	-- Create a function type with `a_return_type' and `some_parameters'
	-- Variadic functions, allowed by LLVM don't fit Eiffel design rules therefore are not supported
	
	-- TODO: currently `some_parameters' items will be copied into a newly
	-- allocated C array passed to LLVM.  This is plainly inefficient yet avoid
	-- tricky bugs with current compiler. In future if `some_parameters'
	-- conforms to a C_ARRAY its storage will be used directly;
	require 
		a_return_type/=Void
		some_parameters/=Void
	local params: NATIVE_ARRAY[POINTER]; i: INTEGER_32; ti: ITERATOR[LLVM_TYPE]
	do
		params:=params.calloc(some_parameters.count)
		from i:=0; ti:=some_parameters.new_iterator; ti.start
		until ti.is_off
		loop
			params.put(ti.item.handle,i)
			i:=i+1
			ti.next
		end

		handle := llvmfunction_type
		(a_return_type.handle, 
		params.to_external, -- could have been some_parameters.as_c_array.to_external, 
		some_parameters.count.to_natural_32, 0)
		-- 0 stands for an eventual `a_variadic_function'.to_integer_32; if
		-- `a_variadic_function' is True the Result will be variadic.

		-- TODO: Initialize `storage' with the parameters of the function
		--storage := storage.calloc(llvmcount_param_types(handle).to_integer_32)
		-- llvmget_param_types(handle, storage.to_pointer)
		-- ensure a_variadic_function=is_variadic
	end

	copy (another: like Current) is
		do
			handle:=another.handle
			--storage:=storage.calloc(another.count)
			--storage.copy_from(another.storage,another.upper)
		end
feature {ANY}
	return_type: LLVM_TYPE is
		do
			Result:=type_wrapper(llvmget_return_type(handle))
		end

	parameters_count: INTEGER_32 is
		-- The number of parameters accepted by Current function
	do
		Result:=llvmcount_params(handle).to_integer_32
	end

invariant type.is_function_type_kind
end -- LLVM_FUNCTION_TYPE

-- Copyright 2009 Paolo Redaelli

