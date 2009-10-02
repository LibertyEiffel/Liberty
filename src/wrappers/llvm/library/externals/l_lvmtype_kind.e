-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class L_LVMTYPE_KIND

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = llvmvoidtypekind) or else 
				(a_value = llvmfloattypekind) or else 
				(a_value = llvmdoubletypekind) or else 
				(a_value = llvmx86_fp80typekind) or else 
				(a_value = llvmfp128typekind) or else 
				(a_value = llvmppc_fp128typekind) or else 
				(a_value = llvmlabeltypekind) or else 
				(a_value = llvmintegertypekind) or else 
				(a_value = llvmfunctiontypekind) or else 
				(a_value = llvmstructtypekind) or else 
				(a_value = llvmarraytypekind) or else 
				(a_value = llvmpointertypekind) or else 
				(a_value = llvmopaquetypekind) or else 
				(a_value = llvmvectortypekind) or else 
				(a_value = llvmmetadatatypekind))
		end

feature -- Setters
	default_create,  set_voidtypekind is
	
		do
			value := llvmvoidtypekind
		end

	 set_floattypekind is
	
		do
			value := llvmfloattypekind
		end

	 set_doubletypekind is
	
		do
			value := llvmdoubletypekind
		end

	 set_x86_fp80typekind is
	
		do
			value := llvmx86_fp80typekind
		end

	 set_fp128typekind is
	
		do
			value := llvmfp128typekind
		end

	 set_ppc_fp128typekind is
	
		do
			value := llvmppc_fp128typekind
		end

	 set_labeltypekind is
	
		do
			value := llvmlabeltypekind
		end

	 set_integertypekind is
	
		do
			value := llvmintegertypekind
		end

	 set_functiontypekind is
	
		do
			value := llvmfunctiontypekind
		end

	 set_structtypekind is
	
		do
			value := llvmstructtypekind
		end

	 set_arraytypekind is
	
		do
			value := llvmarraytypekind
		end

	 set_pointertypekind is
	
		do
			value := llvmpointertypekind
		end

	 set_opaquetypekind is
	
		do
			value := llvmopaquetypekind
		end

	 set_vectortypekind is
	
		do
			value := llvmvectortypekind
		end

	 set_metadatatypekind is
	
		do
			value := llvmmetadatatypekind
		end

feature -- Queries
	is_voidtypekind: BOOLEAN is
		
		do
			Result := (value=llvmvoidtypekind)
		end

	is_floattypekind: BOOLEAN is
		
		do
			Result := (value=llvmfloattypekind)
		end

	is_doubletypekind: BOOLEAN is
		
		do
			Result := (value=llvmdoubletypekind)
		end

	is_x86_fp80typekind: BOOLEAN is
		
		do
			Result := (value=llvmx86_fp80typekind)
		end

	is_fp128typekind: BOOLEAN is
		
		do
			Result := (value=llvmfp128typekind)
		end

	is_ppc_fp128typekind: BOOLEAN is
		
		do
			Result := (value=llvmppc_fp128typekind)
		end

	is_labeltypekind: BOOLEAN is
		
		do
			Result := (value=llvmlabeltypekind)
		end

	is_integertypekind: BOOLEAN is
		
		do
			Result := (value=llvmintegertypekind)
		end

	is_functiontypekind: BOOLEAN is
		
		do
			Result := (value=llvmfunctiontypekind)
		end

	is_structtypekind: BOOLEAN is
		
		do
			Result := (value=llvmstructtypekind)
		end

	is_arraytypekind: BOOLEAN is
		
		do
			Result := (value=llvmarraytypekind)
		end

	is_pointertypekind: BOOLEAN is
		
		do
			Result := (value=llvmpointertypekind)
		end

	is_opaquetypekind: BOOLEAN is
		
		do
			Result := (value=llvmopaquetypekind)
		end

	is_vectortypekind: BOOLEAN is
		
		do
			Result := (value=llvmvectortypekind)
		end

	is_metadatatypekind: BOOLEAN is
		
		do
			Result := (value=llvmmetadatatypekind)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmvoidtypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMVoidTypeKind"
 			}"
 		end

	llvmfloattypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMFloatTypeKind"
 			}"
 		end

	llvmdoubletypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMDoubleTypeKind"
 			}"
 		end

	llvmx86_fp80typekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMX86_FP80TypeKind"
 			}"
 		end

	llvmfp128typekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMFP128TypeKind"
 			}"
 		end

	llvmppc_fp128typekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMPPC_FP128TypeKind"
 			}"
 		end

	llvmlabeltypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMLabelTypeKind"
 			}"
 		end

	llvmintegertypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntegerTypeKind"
 			}"
 		end

	llvmfunctiontypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMFunctionTypeKind"
 			}"
 		end

	llvmstructtypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMStructTypeKind"
 			}"
 		end

	llvmarraytypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMArrayTypeKind"
 			}"
 		end

	llvmpointertypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMPointerTypeKind"
 			}"
 		end

	llvmopaquetypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMOpaqueTypeKind"
 			}"
 		end

	llvmvectortypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMVectorTypeKind"
 			}"
 		end

	llvmmetadatatypekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMMetadataTypeKind"
 			}"
 		end

end

