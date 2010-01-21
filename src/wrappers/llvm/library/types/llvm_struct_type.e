class LLVM_STRUCT_TYPE
	-- A type representing a structure in LLVM.

	-- It is also a COLLECTION of LLVM_TYPEs, the types of its fields.

inherit 
	LLVM_COMPOSITE_TYPE 
		--undefine fill_tagged_out_memory 
		redefine copy end 
	LLVM_TYPE_FACTORY
	-- -- TODO: check if fields may change during object's lifetime. In that case
	-- we may make it a C_ARRAY[LLVM_TYPE]
	-- 	undefine is_equal -- use is_equal from LLVM_TYPE 
	-- 	redefine copy
	-- 	end 

creation make, in_context, from_external_pointer

feature -- Creation
	make (some_elements: C_ARRAY[LLVM_TYPE]; packed: BOOLEAN) is
		require 
			some_elements/=Void
			not some_elements.is_empty
		do
			handle := llvmstruct_type(some_elements.storage.to_pointer, some_elements.count.to_natural_32, packed.to_integer)
		end
	
	in_context (a_context: LLVM_CONTEXT; some_elements: C_ARRAY[LLVM_TYPE]; packed: BOOLEAN) is
		require 
			a_context/=Void
			some_elements/=Void
			not some_elements.is_empty
		do
			handle := llvmstruct_type_in_context(a_context.handle, some_elements.storage.to_pointer, some_elements.count.to_natural_32, packed.to_integer)
			-- Initialize `storage' with the field types of the structure
			--storage := storage.calloc(llvmcount_struct_element_types(handle).to_integer_32)
			--llvmget_struct_element_types(handle, storage.to_pointer)
		end
	
	copy (another: like Current) is
		do
			handle:=another.handle
			--storage:=storage.calloc(another.count)
			--storage.copy_from(another.storage,another.upper)
		end

feature
	is_packed: BOOLEAN is
		do
			Result:=llvmis_packed_struct(handle).to_boolean
		end

invariant type_kind.is_struct_type_kind
end -- class LLVM_STRUCT_TYPE

-- Copyright 2009 Paolo Redaelli

