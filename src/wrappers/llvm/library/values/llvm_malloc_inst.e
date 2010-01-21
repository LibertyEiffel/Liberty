class LLVM_MALLOC_INST
	-- An instruction to allocate memory on the heap.

inherit LLVM_ALLOCATION_INST

creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer

end -- class LLVM_MALLOC_INST

-- Copyright 2009 Paolo Redaelli
