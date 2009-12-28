deferred class LLVM_GLOBAL_VALUE
	-- Global values (GlobalVariables or Functions) are the only LLVM
	-- values that are visible in the bodies of all Functions.
	-- Because they are visible at global scope, they are also
	-- subject to linking with other globals defined in different
	-- translation units. To control the linking process,
	-- GlobalValues know their linkage rules. Specifically,
	-- GlobalValues know whether they have internal or external
	-- linkage, as defined by the LinkageTypes enumeration.

	-- If a GlobalValue has internal linkage (equivalent to being
	-- static in C), it is not visible to code outside the current
	-- translation unit, and does not participate in linking. If it
	-- has external linkage, it is visible to external code, and does
	-- participate in linking. In addition to linkage information,
	-- GlobalValues keep track of which Module they are currently
	-- part of.

	-- Because GlobalValues are memory objects, they are always
	-- referred to by their address. As such, the Type of a global is
	-- always a pointer to its contents. It is important to remember
	-- this when using the GetElementPtrInst instruction because this
	-- pointer must be dereferenced first. For example, if you have a
	-- GlobalVariable (a subclass of GlobalValue) that is an array of
	-- 24 ints, type [24 x i32], then the GlobalVariable is a pointer
	-- to that array. Although the address of the first element of
	-- this array and the value of the GlobalVariable are the same,
	-- they have different types. The GlobalVariable's type is [24 x
	-- i32]. The first element's type is i32. Because of this,
	-- accessing a global value requires you to dereference the
	-- pointer with GetElementPtrInst first, then its elements can be
	-- accessed. This is explained in the LLVM Language Reference
	-- Manual.

inherit LLVM_CONSTANT
feature
-- bool hasInternalLinkage() const
-- bool hasExternalLinkage() const
-- void setInternalLinkage(bool HasInternalLinkage)
-- These methods manipulate the linkage characteristics of the GlobalValue.
-- 
-- Module *getParent()
-- This returns the Module that the GlobalValue is currently embedded into.
end -- class LLVM_GLOBAL_VALUE

-- Copyright 2009 Paolo Redaelli

