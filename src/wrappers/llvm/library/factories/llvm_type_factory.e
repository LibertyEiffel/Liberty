deferred class LLVM_TYPE_FACTORY
	-- A factory of LLVM_TYPEs

inherit CACHING_FACTORY[LLVM_TYPE] 
insert 
	CORE_EXTERNALS undefine fill_tagged_out_memory end 
	EXCEPTIONS undefine copy, fill_tagged_out_memory, is_equal end 

feature 
	wrappers: HASHED_DICTIONARY [LLVM_TYPE, POINTER] is once create Result.make end

	wrapper (a_pointer: POINTER): LLVM_TYPE is
		-- The LLVM_TYPE for `a_pointer' of the fittest type.
	local a_type: LLVMTYPE_KIND_ENUM
	do
		Result := wrappers.reference_at(a_pointer)
		if Result=Void then
			a_type.change_value(llvmget_type_kind(a_pointer))
			-- The following long conditional instruction ideally should be an
			-- inspect instruction but current compiler don't allow instructions
			-- like "when.a_type.void_type_kind_low_level .....
			if a_type.is_void_type_kind  then create {LLVM_VOID_TYPE} Result.from_external_pointer(a_pointer)
			elseif a_type.is_double_type_kind  then create {LLVM_REAL_TYPE} Result.from_external_pointer(a_pointer)
			elseif a_type.is_x_86_fp_80type_kind  then create {LLVM_REAL_TYPE} Result.from_external_pointer(a_pointer)
			--elseif a_type.is_fp_128type_kind  then create {} Result
			--elseif a_type.is_ppc__fp_128type_kind  then create {} Result
			elseif a_type.is_label_type_kind  then create {LLVM_LABEL_TYPE} Result.from_external_pointer(a_pointer)
			elseif a_type.is_integer_type_kind  then create {LLVM_INTEGER_TYPE} Result.from_external_pointer(a_pointer)
			elseif a_type.is_function_type_kind  then create {LLVM_FUNCTION_TYPE} Result.from_external_pointer(a_pointer)
			elseif a_type.is_struct_type_kind  then create {LLVM_STRUCT_TYPE} Result.from_external_pointer(a_pointer)
			elseif a_type.is_array_type_kind  then create {LLVM_ARRAY_TYPE} Result.from_external_pointer(a_pointer)
			elseif a_type.is_pointer_type_kind  then create {LLVM_POINTER_TYPE} Result.from_external_pointer(a_pointer)
			elseif a_type.is_opaque_type_kind  then create {LLVM_OPAQUE_TYPE} Result.from_external_pointer(a_pointer)
			elseif a_type.is_vector_type_kind  then create {LLVM_VECTOR_TYPE} Result.from_external_pointer(a_pointer)
			--elseif a_type.is_metadata_type_kind  then create {} Result
			else raise("LLVM_TYPE_FACTORY.wrapper: unknown type")
			end
			wrappers.put(Result,a_pointer)
		end
	end
end -- class LLVM_TYPE_FACTORY
