class LLVM_VECTOR_TYPE
	-- A type representing a vector
inherit LLVM_SEQUENCE_TYPE
creation {ANY} make
creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer

feature -- Creation
	make (a_type: LLVM_TYPE; a_count: NATURAL_32) is
		-- Creates a vector type with `a_count' elements of `a_type'.
	require a_type/=Void
	do
		handle:=llvmvector_type(a_type.handle,a_count)
	end
feature 
	size: NATURAL_32 is
		-- Size of current vector
	do
		Result:=llvmget_vector_size(handle)
	end
invariant type_kind.is_vector_type_kind
end -- class LLVM_VECTOR_TYPE

-- Copyright 2009 Paolo Redaelli

