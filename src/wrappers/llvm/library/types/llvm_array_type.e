class LLVM_ARRAY_TYPE
	-- 
inherit LLVM_SEQUENCE_TYPE

creation {ANY} make
creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer
feature -- Creation
	make (a_type: LLVM_TYPE; a_count: NATURAL_32) is
		-- Create an LLVM_ARRAY_TYPE holding `a_count' elements of `a_type'
	require a_type/=Void
	do
		handle:=llvmarray_type(a_type.handle, a_count)
	end
feature 
	length: NATURAL_32 is
		-- The number of elements in array
	do
		Result:=llvmget_array_length(handle)
	end
invariant type.is_array_type_kind
end -- class LLVM_ARRAY_TYPE

-- Copyright 2009 Paolo Redaelli

