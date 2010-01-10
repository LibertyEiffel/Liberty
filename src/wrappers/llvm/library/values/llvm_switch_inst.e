class LLVM_SWITCH_INST
	-- A multiway switch instruction.

inherit LLVM_TERMINATOR_INST
insert CORE_EXTERNALS
creation {LLVM_BUILDER} from_external_pointer
feature 
	add_case (a_value: LLVM_VALUE; a_destionation: LLVM_BASIC_BLOCK) is
		-- Add to Current the case for `a_value' that will execute `a_destionation'
	require 
		a_value/=Void
		a_destionation/=Void
	do
		llvmadd_case(handle,a_value.handle,a_destionation.handle)
	end
end -- class LLVM_SWITCH_INST

-- Copyright 2009 Paolo Redaelli
