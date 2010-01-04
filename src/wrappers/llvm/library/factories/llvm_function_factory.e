deferred class LLVM_FUNCTION_FACTORY
	-- A factory of LLVM_FUNCTIONs

inherit 
	CACHING_FACTORY[LLVM_FUNCTION] 
		rename 
			wrappers as function_wrappers,
			wrapper as function_wrapper,
			wrapper_or_void as function_wrapper_or_void
		end
insert 
	CORE_EXTERNALS undefine fill_tagged_out_memory end 
	EXCEPTIONS undefine copy, fill_tagged_out_memory, is_equal end 

feature {WRAPPER, WRAPPER_HANDLER}
	function_wrappers: HASHED_DICTIONARY [LLVM_FUNCTION, POINTER] is once create Result.make end
	
	function_wrapper (a_pointer: POINTER): LLVM_FUNCTION is
		-- The LLVM_FUNCTION for `a_pointer' of the fittest type.
	do
		Result:=function_wrappers.reference_at(a_pointer)
		if Result=Void then
			create Result.from_external_pointer(a_pointer)
			function_wrappers.put(Result,a_pointer)
		end
	end
end -- class LLVM_FUNCTION_FACTORY
