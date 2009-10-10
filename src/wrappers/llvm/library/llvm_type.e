deferred class LLVM_TYPE
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

	context: LLVM_CONTEXT is
		do
			-- TODO: cache the result.
			create Result.from_external_pointer(llvmget_type_context(handle))
		end

	struct_size: INTEGER is
		-- LLVM_TYPE actually wraps a polymorphic C++ class; temporarly this query always fails.
	require implemented: False
		do
			not_yet_implemented -- or mostly unuseful
		end
end -- class LLVM_TYPE


-- Copyright 2009 Paolo Redaelli
