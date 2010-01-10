deferred class LLVM_TYPE
	--	Type is a superclass of all type classes.
	--	Every Value has a Type. Type cannot be
	--	instantiated directly but only through its
	--	subclasses. Certain primitive types
	--	(VoidType, LabelType, FloatType and
	--	DoubleType) have hidden subclasses. They are
	--	hidden because they offer no useful
	--	functionality beyond what the Type class
	--	offers except to distinguish themselves from
	--	other subclasses of Type.

	-- All other types are subclasses of
	-- DerivedType. Types can be named, but this is
	-- not a requirement. There exists exactly one
	-- instance of a given shape at any one time.
	-- This allows type equality to be performed
	-- with address equality of the Type Instance.
	-- That is, given two Type* values, the types
	-- are identical if the pointers are identical.

-- The representation of the base type of all datatypes in LLVM. Anchestor
	-- of all hierarchy of types. See
	-- http://llvm.org/doxygen/classllvm_1_1Type.html for a clean graph of its
	-- heirs.

inherit 
	C_STRUCT
	EIFFEL_OWNED

insert CORE_EXTERNALS

feature 
	type: LLVMTYPE_KIND_ENUM is
		-- The actual type of Current
		do
			Result.change_value
			(llvmget_type_kind(handle))
		end


	-- TODO: C binding offers a call "LLVMTypeRef
	-- LLVMGetElementType(LLVMTypeRef Ty);"; provide a meaningful Eiffel
	-- equivalent.
	context: LLVM_CONTEXT is
		do
			create Result.from_external_pointer(llvmget_type_context(handle))
		end

	struct_size: INTEGER is
		-- LLVM_TYPE actually wraps a polymorphic C++ class; temporarly this query always fails.
	require implemented: False
		do
			not_yet_implemented -- or mostly unuseful
		end

	-- is_integer: sOOLEAN is -- Is Current an integer type.
	-- is_floating_point: BOOLEAN -- Is Current a floating point type.
	-- is_abstract: BOOLEAN is -- is Current abstract, i.e. does it contain opaque type anywhere in its definition.
	-- is_sized: BOOLEAN is -- Has the type a known size? Things that don't have a size are abstract types, labels and void.
	
end -- class LLVM_TYPE


-- Copyright 2009 Paolo Redaelli
