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
	type: LLVMTYPE_KIND is
		-- The actual type of Current
		do
			Result.change_value
			(llvmget_type_kind(handle))
		end

	context: LLVM_CONTEXT is
		do
			-- TODO: cache the result.
			create Result.from_external(llvmget_type_context(handle))
		end
end

-- Copyright 2009 Paolo Redaelli
