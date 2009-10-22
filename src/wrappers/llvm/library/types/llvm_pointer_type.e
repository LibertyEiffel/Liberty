class LLVM_POINTER_TYPE
	-- A type representing a pointer to a specified type
inherit LLVM_SEQUENCE_TYPE

creation make, from_external_pointer
feature -- Creation 
	make (a_type: LLVM_TYPE) is
		-- Creates a pointer type referring to `a_type'

		-- TODO: the C call has an undocumented/misunderstood `unsigned
		-- AddressSpace' argument, currently fixed to 0.
	require a_type/=Void
	do
		handle:=llvmpointer_type(a_type.handle, 0.to_natural_32)
	end

	address_space: NATURAL_32 is
		-- The address space of the pointer
	do
		Result:=llvmget_pointer_address_space(handle)
	end
invariant type.is_pointer_type_kind
end -- class LLVM_POINTER_TYPE

-- Copyright 2009 Paolo Redaelli

