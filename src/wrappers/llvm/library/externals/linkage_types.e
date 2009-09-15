-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class LINKAGE_TYPES

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = externallinkage) or else 
				(a_value = availableexternallylinkage) or else 
				(a_value = linkonceanylinkage) or else 
				(a_value = linkonceodrlinkage) or else 
				(a_value = weakanylinkage) or else 
				(a_value = weakodrlinkage) or else 
				(a_value = appendinglinkage) or else 
				(a_value = internallinkage) or else 
				(a_value = privatelinkage) or else 
				(a_value = linkerprivatelinkage) or else 
				(a_value = dllimportlinkage) or else 
				(a_value = dllexportlinkage) or else 
				(a_value = externalweaklinkage) or else 
				(a_value = ghostlinkage) or else 
				(a_value = commonlinkage))
		end

feature -- Setters
	default_create,  set_externallinkage is
	
		do
			value := externallinkage
		end

	 set_availableexternallylinkage is
	
		do
			value := availableexternallylinkage
		end

	 set_linkonceanylinkage is
	
		do
			value := linkonceanylinkage
		end

	 set_linkonceodrlinkage is
	
		do
			value := linkonceodrlinkage
		end

	 set_weakanylinkage is
	
		do
			value := weakanylinkage
		end

	 set_weakodrlinkage is
	
		do
			value := weakodrlinkage
		end

	 set_appendinglinkage is
	
		do
			value := appendinglinkage
		end

	 set_internallinkage is
	
		do
			value := internallinkage
		end

	 set_privatelinkage is
	
		do
			value := privatelinkage
		end

	 set_linkerprivatelinkage is
	
		do
			value := linkerprivatelinkage
		end

	 set_dllimportlinkage is
	
		do
			value := dllimportlinkage
		end

	 set_dllexportlinkage is
	
		do
			value := dllexportlinkage
		end

	 set_externalweaklinkage is
	
		do
			value := externalweaklinkage
		end

	 set_ghostlinkage is
	
		do
			value := ghostlinkage
		end

	 set_commonlinkage is
	
		do
			value := commonlinkage
		end

feature -- Queries
	is_externallinkage: BOOLEAN is
		
		do
			Result := (value=externallinkage)
		end

	is_availableexternallylinkage: BOOLEAN is
		
		do
			Result := (value=availableexternallylinkage)
		end

	is_linkonceanylinkage: BOOLEAN is
		
		do
			Result := (value=linkonceanylinkage)
		end

	is_linkonceodrlinkage: BOOLEAN is
		
		do
			Result := (value=linkonceodrlinkage)
		end

	is_weakanylinkage: BOOLEAN is
		
		do
			Result := (value=weakanylinkage)
		end

	is_weakodrlinkage: BOOLEAN is
		
		do
			Result := (value=weakodrlinkage)
		end

	is_appendinglinkage: BOOLEAN is
		
		do
			Result := (value=appendinglinkage)
		end

	is_internallinkage: BOOLEAN is
		
		do
			Result := (value=internallinkage)
		end

	is_privatelinkage: BOOLEAN is
		
		do
			Result := (value=privatelinkage)
		end

	is_linkerprivatelinkage: BOOLEAN is
		
		do
			Result := (value=linkerprivatelinkage)
		end

	is_dllimportlinkage: BOOLEAN is
		
		do
			Result := (value=dllimportlinkage)
		end

	is_dllexportlinkage: BOOLEAN is
		
		do
			Result := (value=dllexportlinkage)
		end

	is_externalweaklinkage: BOOLEAN is
		
		do
			Result := (value=externalweaklinkage)
		end

	is_ghostlinkage: BOOLEAN is
		
		do
			Result := (value=ghostlinkage)
		end

	is_commonlinkage: BOOLEAN is
		
		do
			Result := (value=commonlinkage)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	externallinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ExternalLinkage"
 			}"
 		end

	availableexternallylinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "AvailableExternallyLinkage"
 			}"
 		end

	linkonceanylinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LinkOnceAnyLinkage"
 			}"
 		end

	linkonceodrlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LinkOnceODRLinkage"
 			}"
 		end

	weakanylinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "WeakAnyLinkage"
 			}"
 		end

	weakodrlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "WeakODRLinkage"
 			}"
 		end

	appendinglinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "AppendingLinkage"
 			}"
 		end

	internallinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "InternalLinkage"
 			}"
 		end

	privatelinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "PrivateLinkage"
 			}"
 		end

	linkerprivatelinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LinkerPrivateLinkage"
 			}"
 		end

	dllimportlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "DLLImportLinkage"
 			}"
 		end

	dllexportlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "DLLExportLinkage"
 			}"
 		end

	externalweaklinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ExternalWeakLinkage"
 			}"
 		end

	ghostlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "GhostLinkage"
 			}"
 		end

	commonlinkage: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "CommonLinkage"
 			}"
 		end

end

