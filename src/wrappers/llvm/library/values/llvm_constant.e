deferred class LLVM_CONSTANT
	-- LLVM Constant Representation.

	-- This is an important base class in LLVM. It provides the common
	-- facilities of all constant values in an LLVM program. A constant is a
	-- value that is immutable at runtime. Functions are constants because
	-- their address is immutable. Same with global variables.

	-- All constants share the capabilities provided in this class. All
	-- constants can have a null value. They can have an operand list.
	-- Constants can be simple (integer and floating point values), complex
	-- (arrays and structures), or expression based (computations yielding a
	-- constant value composed of only certain operators and other constant
	-- values).

	-- Note that Constants are immutable (once created they never change) and
	-- are fully shared by structural equivalence. This means that two
	-- structurally equivalent constants will always have the same address.
	-- Constants are created on demand as needed and never deleted: thus
	-- clients don't have to worry about the lifetime of the objects.
inherit LLVM_USER
end -- class LLVM_CONSTANT
