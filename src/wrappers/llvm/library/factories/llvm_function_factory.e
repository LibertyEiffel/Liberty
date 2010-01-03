deferred class LLVM_FUNCTION_FACTORY
	-- A factory of LLVM_FUNCTIONs

inherit 
	CACHING_FACTORY[LLVM_FUNCTION] 
	-- It could be CACHING_FACTORY[LLVM_FUNCTION] but currently
	-- CACHING_FACTORY requires wrappers dictionary to be an attribute and
	-- not an once feature thus forbidding to make this LLVM_FUNCTION_FACTORY
	-- a deferred class to be inserted where it is useful. TODO: check if a
	-- more proper design is to make CACHING_FACTORY.wrappers a deferred
	-- feature.

insert 
	CORE_EXTERNALS undefine fill_tagged_out_memory end 
	EXCEPTIONS undefine copy, fill_tagged_out_memory, is_equal end 

feature 
	wrappers: HASHED_DICTIONARY [LLVM_FUNCTION, POINTER] is once create Result.make end
	
	wrapper (a_pointer: POINTER): LLVM_FUNCTION is
		-- The LLVM_FUNCTION for `a_pointer' of the fittest type.
	do
		Result:=wrappers.reference_at(a_pointer)
		if Result=Void then
			create Result.from_external_pointer(a_pointer)
			wrappers.put(Result,a_pointer)
		end
	end
end -- class LLVM_FUNCTION_FACTORY
