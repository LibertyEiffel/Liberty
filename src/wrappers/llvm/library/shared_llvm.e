deferred class SHARED_LLVM
	-- The shared objects of Low Level Virtual Machine infrastructure.

feature 
	global_context: LLVM_GLOBAL_CONTEXT is
		-- The global context
		once
			create Result
		end
end -- class SHARED_LLVM
