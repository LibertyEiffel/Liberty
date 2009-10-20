class LLVM_FCMP_INST
	-- A floating point comparison operator.

	-- This instruction compares its operands according to the predicate given
	-- to the constructor. It only operates on floating point values or packed
	-- vectors of floating point values. The operands must be identical types.

inherit LLVM_CMP_INST

end -- class LLVM_FCMP_INST

-- Copyright 2009 Paolo Redaelli

