class LLVM_ARGUMENT
	-- An incoming formal argument to a LLVM_FUNCTION. An argument is a very
	-- simple LLVM_VALUE. It is essentially a named (optional) type. When used
	-- in the body of a function, it represents the value of the actual
	-- argument the function was called with.

inherit LLVM_VALUE
end -- class LLVM_ARGUMENT

-- Copyright 2009 Paolo Redaelli


