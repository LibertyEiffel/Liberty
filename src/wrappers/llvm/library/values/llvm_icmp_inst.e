class LLVM_ICMP_INST
	-- An integer comparison operator.

	-- This instruction compares its operands according to the predicate given
	-- to the constructor. It only operates on integers or pointers. The
	-- operands must be identical types.

inherit LLVM_CMP_INST
creation {LLVM_BUILDER} from_external_pointer

end -- class LLVM_ICMP_INST

-- Copyright 2009 Paolo Redaelli

