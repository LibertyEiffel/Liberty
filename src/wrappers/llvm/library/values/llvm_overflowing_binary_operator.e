deferred class LLVM_OVERFLOWING_BINARY_OPERATOR
	-- Common anchestor of integer arithmetic operators which may overflow:
	-- addition, subtraction and multiplication. The SDiv instruction is not
	-- included althought it may overflow.

inherit LLVM_OPERATOR
end -- class LLVM_OVERFLOWING_BINARY_OPERATOR

-- Copyright 2009 Paolo Redaelli

