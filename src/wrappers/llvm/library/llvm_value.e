class LLVM_VALUE
	-- LLVM Value Representation.

	-- This is a very important LLVM class. It is the anchestor of all values
	-- computed by a program that may be used as operands to other values.
	-- LLVM_VALUE is the parent of other important classes such as Instruction
	-- and Function. 
	
	-- All LLVM_VALUEs have a Type. Type is not a subclass of Value. All types
	-- can have a name and they should belong to some Module. Setting the name
	-- on the Value automatically updates the module's symbol table.

	-- Every value has a "use list" that keeps track of which other Values are
	-- using this Value. A Value can also have an arbitrary number of
	-- ValueHandle objects that watch it and listen to RAUW and Destroy events
	-- see llvm/Support/ValueHandle.h for details.
inherit 
	C_STRUCT
	EIFFEL_OWNED
feature 
end
