class LLVM_TYPE_ARRAY
	-- A C_ARRAY of LLVM_TYPEs.

inherit  C_ARRAY[LLVM_TYPE]
insert   LLVM_TYPE_FACTORY
creation manifest_creation, from_external_array
end -- class LLVM_TYPE_ARRAY
