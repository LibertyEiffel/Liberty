-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class TYPE_ID

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = voidtyid) or else 
				(a_value = floattyid) or else 
				(a_value = doubletyid) or else 
				(a_value = x86_fp80tyid) or else 
				(a_value = fp128tyid) or else 
				(a_value = ppc_fp128tyid) or else 
				(a_value = labeltyid) or else 
				(a_value = metadatatyid) or else 
				(a_value = integertyid) or else 
				(a_value = functiontyid) or else 
				(a_value = structtyid) or else 
				(a_value = arraytyid) or else 
				(a_value = pointertyid) or else 
				(a_value = opaquetyid) or else 
				(a_value = vectortyid) or else 
				(a_value = numtypeids) or else 
				(a_value = lastprimitivetyid) or else 
				(a_value = firstderivedtyid))
		end

feature -- Setters
	default_create,  set_voidtyid is
	
		do
			value := voidtyid
		end

	 set_floattyid is
	
		do
			value := floattyid
		end

	 set_doubletyid is
	
		do
			value := doubletyid
		end

	 set_x86_fp80tyid is
	
		do
			value := x86_fp80tyid
		end

	 set_fp128tyid is
	
		do
			value := fp128tyid
		end

	 set_ppc_fp128tyid is
	
		do
			value := ppc_fp128tyid
		end

	 set_labeltyid is
	
		do
			value := labeltyid
		end

	 set_metadatatyid is
	
		do
			value := metadatatyid
		end

	 set_integertyid is
	
		do
			value := integertyid
		end

	 set_functiontyid is
	
		do
			value := functiontyid
		end

	 set_structtyid is
	
		do
			value := structtyid
		end

	 set_arraytyid is
	
		do
			value := arraytyid
		end

	 set_pointertyid is
	
		do
			value := pointertyid
		end

	 set_opaquetyid is
	
		do
			value := opaquetyid
		end

	 set_vectortyid is
	
		do
			value := vectortyid
		end

	 set_numtypeids is
	
		do
			value := numtypeids
		end

	 set_lastprimitivetyid is
	
		do
			value := lastprimitivetyid
		end

	 set_firstderivedtyid is
	
		do
			value := firstderivedtyid
		end

feature -- Queries
	is_voidtyid: BOOLEAN is
		
		do
			Result := (value=voidtyid)
		end

	is_floattyid: BOOLEAN is
		
		do
			Result := (value=floattyid)
		end

	is_doubletyid: BOOLEAN is
		
		do
			Result := (value=doubletyid)
		end

	is_x86_fp80tyid: BOOLEAN is
		
		do
			Result := (value=x86_fp80tyid)
		end

	is_fp128tyid: BOOLEAN is
		
		do
			Result := (value=fp128tyid)
		end

	is_ppc_fp128tyid: BOOLEAN is
		
		do
			Result := (value=ppc_fp128tyid)
		end

	is_labeltyid: BOOLEAN is
		
		do
			Result := (value=labeltyid)
		end

	is_metadatatyid: BOOLEAN is
		
		do
			Result := (value=metadatatyid)
		end

	is_integertyid: BOOLEAN is
		
		do
			Result := (value=integertyid)
		end

	is_functiontyid: BOOLEAN is
		
		do
			Result := (value=functiontyid)
		end

	is_structtyid: BOOLEAN is
		
		do
			Result := (value=structtyid)
		end

	is_arraytyid: BOOLEAN is
		
		do
			Result := (value=arraytyid)
		end

	is_pointertyid: BOOLEAN is
		
		do
			Result := (value=pointertyid)
		end

	is_opaquetyid: BOOLEAN is
		
		do
			Result := (value=opaquetyid)
		end

	is_vectortyid: BOOLEAN is
		
		do
			Result := (value=vectortyid)
		end

	is_numtypeids: BOOLEAN is
		
		do
			Result := (value=numtypeids)
		end

	is_lastprimitivetyid: BOOLEAN is
		
		do
			Result := (value=lastprimitivetyid)
		end

	is_firstderivedtyid: BOOLEAN is
		
		do
			Result := (value=firstderivedtyid)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	voidtyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "VoidTyID"
 			}"
 		end

	floattyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FloatTyID"
 			}"
 		end

	doubletyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "DoubleTyID"
 			}"
 		end

	x86_fp80tyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "X86_FP80TyID"
 			}"
 		end

	fp128tyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FP128TyID"
 			}"
 		end

	ppc_fp128tyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "PPC_FP128TyID"
 			}"
 		end

	labeltyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LabelTyID"
 			}"
 		end

	metadatatyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "MetadataTyID"
 			}"
 		end

	integertyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "IntegerTyID"
 			}"
 		end

	functiontyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FunctionTyID"
 			}"
 		end

	structtyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "StructTyID"
 			}"
 		end

	arraytyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ArrayTyID"
 			}"
 		end

	pointertyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "PointerTyID"
 			}"
 		end

	opaquetyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "OpaqueTyID"
 			}"
 		end

	vectortyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "VectorTyID"
 			}"
 		end

	numtypeids: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "NumTypeIDs"
 			}"
 		end

	lastprimitivetyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LastPrimitiveTyID"
 			}"
 		end

	firstderivedtyid: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FirstDerivedTyID"
 			}"
 		end

end

