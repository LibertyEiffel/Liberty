-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class L_LVMLINKAGE

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = llvmexternallinkage) or else 
				(a_value = llvmavailableexternallylinkage) or else 
				(a_value = llvmlinkonceanylinkage) or else 
				(a_value = llvmlinkonceodrlinkage) or else 
				(a_value = llvmweakanylinkage) or else 
				(a_value = llvmweakodrlinkage) or else 
				(a_value = llvmappendinglinkage) or else 
				(a_value = llvminternallinkage) or else 
				(a_value = llvmprivatelinkage) or else 
				(a_value = llvmdllimportlinkage) or else 
				(a_value = llvmdllexportlinkage) or else 
				(a_value = llvmexternalweaklinkage) or else 
				(a_value = llvmghostlinkage) or else 
				(a_value = llvmcommonlinkage) or else 
				(a_value = llvmlinkerprivatelinkage))
		end

feature -- Setters
	default_create,  set_externallinkage is
	
		do
			value := llvmexternallinkage
		end

	 set_availableexternallylinkage is
	
		do
			value := llvmavailableexternallylinkage
		end

	 set_linkonceanylinkage is
	
		do
			value := llvmlinkonceanylinkage
		end

	 set_linkonceodrlinkage is
	
		do
			value := llvmlinkonceodrlinkage
		end

	 set_weakanylinkage is
	
		do
			value := llvmweakanylinkage
		end

	 set_weakodrlinkage is
	
		do
			value := llvmweakodrlinkage
		end

	 set_appendinglinkage is
	
		do
			value := llvmappendinglinkage
		end

	 set_internallinkage is
	
		do
			value := llvminternallinkage
		end

	 set_privatelinkage is
	
		do
			value := llvmprivatelinkage
		end

	 set_dllimportlinkage is
	
		do
			value := llvmdllimportlinkage
		end

	 set_dllexportlinkage is
	
		do
			value := llvmdllexportlinkage
		end

	 set_externalweaklinkage is
	
		do
			value := llvmexternalweaklinkage
		end

	 set_ghostlinkage is
	
		do
			value := llvmghostlinkage
		end

	 set_commonlinkage is
	
		do
			value := llvmcommonlinkage
		end

	 set_linkerprivatelinkage is
	
		do
			value := llvmlinkerprivatelinkage
		end

feature -- Queries
	is_externallinkage: BOOLEAN is
		
		do
			Result := (value=llvmexternallinkage)
		end

	is_availableexternallylinkage: BOOLEAN is
		
		do
			Result := (value=llvmavailableexternallylinkage)
		end

	is_linkonceanylinkage: BOOLEAN is
		
		do
			Result := (value=llvmlinkonceanylinkage)
		end

	is_linkonceodrlinkage: BOOLEAN is
		
		do
			Result := (value=llvmlinkonceodrlinkage)
		end

	is_weakanylinkage: BOOLEAN is
		
		do
			Result := (value=llvmweakanylinkage)
		end

	is_weakodrlinkage: BOOLEAN is
		
		do
			Result := (value=llvmweakodrlinkage)
		end

	is_appendinglinkage: BOOLEAN is
		
		do
			Result := (value=llvmappendinglinkage)
		end

	is_internallinkage: BOOLEAN is
		
		do
			Result := (value=llvminternallinkage)
		end

	is_privatelinkage: BOOLEAN is
		
		do
			Result := (value=llvmprivatelinkage)
		end

	is_dllimportlinkage: BOOLEAN is
		
		do
			Result := (value=llvmdllimportlinkage)
		end

	is_dllexportlinkage: BOOLEAN is
		
		do
			Result := (value=llvmdllexportlinkage)
		end

	is_externalweaklinkage: BOOLEAN is
		
		do
			Result := (value=llvmexternalweaklinkage)
		end

	is_ghostlinkage: BOOLEAN is
		
		do
			Result := (value=llvmghostlinkage)
		end

	is_commonlinkage: BOOLEAN is
		
		do
			Result := (value=llvmcommonlinkage)
		end

	is_linkerprivatelinkage: BOOLEAN is
		
		do
			Result := (value=llvmlinkerprivatelinkage)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmexternallinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMExternalLinkage"
 			}"
 		end

	llvmavailableexternallylinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMAvailableExternallyLinkage"
 			}"
 		end

	llvmlinkonceanylinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMLinkOnceAnyLinkage"
 			}"
 		end

	llvmlinkonceodrlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMLinkOnceODRLinkage"
 			}"
 		end

	llvmweakanylinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMWeakAnyLinkage"
 			}"
 		end

	llvmweakodrlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMWeakODRLinkage"
 			}"
 		end

	llvmappendinglinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMAppendingLinkage"
 			}"
 		end

	llvminternallinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMInternalLinkage"
 			}"
 		end

	llvmprivatelinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMPrivateLinkage"
 			}"
 		end

	llvmdllimportlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMDLLImportLinkage"
 			}"
 		end

	llvmdllexportlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMDLLExportLinkage"
 			}"
 		end

	llvmexternalweaklinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMExternalWeakLinkage"
 			}"
 		end

	llvmghostlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMGhostLinkage"
 			}"
 		end

	llvmcommonlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMCommonLinkage"
 			}"
 		end

	llvmlinkerprivatelinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMLinkerPrivateLinkage"
 			}"
 		end

end

