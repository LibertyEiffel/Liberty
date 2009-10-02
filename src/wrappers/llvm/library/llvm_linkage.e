expanded class LLVM_LINKAGE
	-- Enum LLVMLinkage

insert ENUM

feature -- Queries
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result :=
			(a_value = llvm_external_linkage) or else
			(a_value = llvm_available_externally_linkage) or else
			(a_value = llvm_link_once_any_linkage) or else
			(a_value = llvm_link_once_odr_linkage) or else
			(a_value = llvm_weakany_linkage) or else
			(a_value = llvm_weak_odr_linkage) or else
			(a_value = llvm_appending_linkage) or else
			(a_value = llvm_internal_linkage) or else
			(a_value = llvm_private_linkage) or else
			(a_value = llvm_dll_import_linkage) or else
			(a_value = llvm_dll_export_linkage) or else
			(a_value = llvm_external_weak_linkage) or else
			(a_value = llvm_ghost_linkage) or else
			(a_value = llvm_common_linkage) 
		end

  is_external: BOOLEAN is 
		-- Is Current linkage a Externally visible function 
	do
		Result := (value = llvm_external_linkage)
	end

  is_available_externally: BOOLEAN is 
		-- Is Current linkage a 
	do
		Result := (value = llvm_available_externally_linkage)
	end

  is_link_once_any: BOOLEAN is 
		-- Is Current linkage a Keep one copy of function when linking (inline)
	do
		Result := (value = llvm_link_once_any_linkage)
	end

  is_link_once_odr: BOOLEAN is 
		-- Is Current linkage a Same, but only replaced by something equivalent. 
	do
		Result := (value = llvm_link_once_odr_linkage)
	end

  is_weakany: BOOLEAN is 
		-- Is Current linkage a Keep one copy of function when linking (weak) 
	do
		Result := (value = llvm_weakany_linkage)
	end

  is_weak_odr: BOOLEAN is 
		-- Is Current linkage a Same, but only replaced by something equivalent. 
	do
		Result := (value = llvm_weak_odr_linkage)
	end

  is_appending: BOOLEAN is 
		-- Is Current linkage a Special purpose, only applies to global arrays 
	do
		Result := (value = llvm_appending_linkage)
	end

  is_internal: BOOLEAN is 
		-- Is Current linkage a Rename collisions when linking (static functions) 
	do
		Result := (value = llvm_internal_linkage)
	end

  is_private: BOOLEAN is 
		-- Is Current linkage a Like Internal, but omit from symbol table 
	do
		Result := (value = llvm_private_linkage)
	end

  is_dll_import: BOOLEAN is 
		-- Is Current linkage a Function to be imported from DLL 
	do
		Result := (value = llvm_dll_import_linkage)
	end

  is_dll_export: BOOLEAN is 
		-- Is Current linkage a Function to be accessible from DLL 
	do
		Result := (value = llvm_dll_export_linkage)
	end

  is_external_weak: BOOLEAN is 
		-- Is Current linkage a ExternalWeak linkage description 
	do
		Result := (value = llvm_external_weak_linkage)
	end

  is_ghost: BOOLEAN is 
		-- Is Current linkage a Stand-in functions for streaming fns from bitcode 
	do
		Result := (value = llvm_ghost_linkage)
	end

  is_common: BOOLEAN is 
		-- Is Current linkage a Tentative definitions 
	do
		Result := (value = llvm_common_linkage)
	end

feature -- Setters
	default_create is do value := llvm_external_linkage end
  set_external is 
		-- Set to Externally visible function 
	do
		value := llvm_external_linkage
	end

  set_available_externally is 
		-- Set to 
	do
		value := llvm_available_externally_linkage
	end

  set_link_once_any is 
		-- Set to Keep one copy of function when linking (inline)
	do
		value := llvm_link_once_any_linkage
	end

  set_link_once_odr is 
		-- Set to Same, but only replaced by something equivalent. 
	do
		value := llvm_link_once_odr_linkage
	end

  set_weakany is 
		-- Set to Keep one copy of function when linking (weak) 
	do
		value := llvm_weakany_linkage
	end

  set_weak_odr is 
		-- Set to Same, but only replaced by something equivalent. 
	do
		value := llvm_weak_odr_linkage
	end

  set_appending is 
		-- Set to Special purpose, only applies to global arrays 
	do
		value := llvm_appending_linkage
	end

  set_internal is 
		-- Set to Rename collisions when linking (static functions) 
	do
		value := llvm_internal_linkage
	end

  set_private is 
		-- Set to Like Internal, but omit from symbol table 
	do
		value := llvm_private_linkage
	end

  set_dll_import is 
		-- Set to Function to be imported from DLL 
	do
		value := llvm_dll_import_linkage
	end

  set_dll_export is 
		-- Set to Function to be accessible from DLL 
	do
		value := llvm_dll_export_linkage
	end

  set_external_weak is 
		-- Set to ExternalWeak linkage description 
	do
		value := llvm_external_weak_linkage
	end

  set_ghost is 
		-- Set to Stand-in functions for streaming fns from bitcode 
	do
		value := llvm_ghost_linkage
	end

  set_common is 
		-- Set to Tentative definitions 
	do
		value := llvm_common_linkage
	end

feature {} -- Low-level values
	llvm_external_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMExternallyLinkage" end
	llvm_available_externally_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMAvailableExternallyLinkage" end
	llvm_link_once_any_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMLinkOnceAnyLinkage" end
	llvm_link_once_odr_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMLinkOnceODRLinkage" end
	llvm_weakany_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMWeakAnyLinkage" end
	llvm_weak_odr_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMWeakODRLinkage" end
	llvm_appending_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMAppendingLinkage" end
	llvm_internal_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMInternalLinkage" end
	llvm_private_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMPrivateLinkage" end
	llvm_dll_import_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMDLLImportLinkage" end
	llvm_dll_export_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMDLLExportLinkage" end
	llvm_external_weak_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMExternalWeakLinkage" end
	llvm_ghost_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMGhostLinkage" end
	llvm_common_linkage: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMCommonLinkage" end

end -- class LLVM_LINKAGE
	
