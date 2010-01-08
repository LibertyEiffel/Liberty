deferred class LLVM_INSTRUCTION_FACTORY
	-- A factory of values

inherit WRAPPER_FACTORY[LLVM_INSTRUCTION]
insert	
	CORE_EXTERNALS 
	EXCEPTIONS undefine copy, is_equal end
feature 
	wrapper (p: POINTER): LLVM_INSTRUCTION is
		do
			not_yet_implemented -- The implementation will follow LLVM_VALUE_FACTORY style
	end
end -- class LLVM_INSTRUCTION_FACTORY

-- Copyright 2009 Paolo Redaelli
