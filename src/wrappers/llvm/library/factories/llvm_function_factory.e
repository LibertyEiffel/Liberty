deferred class LLVM_FUNCTION_FACTORY
	-- A factory of LLVM_FUNCTIONs

inherit 
	WRAPPER_FACTORY[LLVM_FUNCTION] 
		rename 
			wrapper as function_wrapper,
			wrapper_or_void as function_wrapper_or_void
		end
insert 
	CORE_EXTERNALS undefine fill_tagged_out_memory end 
	EXCEPTIONS undefine copy, fill_tagged_out_memory, is_equal end 

feature {WRAPPER, WRAPPER_HANDLER}
	function_wrapper (a_pointer: POINTER): LLVM_FUNCTION is
		-- The LLVM_FUNCTION for `a_pointer' of the fittest type.
	do
		create Result.from_external_pointer(a_pointer)
	end
end -- class LLVM_FUNCTION_FACTORY
