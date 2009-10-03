-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class TYPE_ID_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = voidtyid_low_level)  or else
				(a_value = doubletyid_low_level)  or else
				(a_value = x86_fp80tyid_low_level)  or else
				(a_value = fp128tyid_low_level)  or else
				(a_value = ppc_fp128tyid_low_level)  or else
				(a_value = labeltyid_low_level)  or else
				(a_value = metadatatyid_low_level)  or else
				(a_value = integertyid_low_level)  or else
				(a_value = functiontyid_low_level)  or else
				(a_value = structtyid_low_level)  or else
				(a_value = arraytyid_low_level)  or else
				(a_value = pointertyid_low_level)  or else
				(a_value = opaquetyid_low_level)  or else
				(a_value = vectortyid_low_level)  or else
				(a_value = numtypeids_low_level)  or else
				(a_value = lastprimitivetyid_low_level)  or else
				(a_value = firstderivedtyid_low_level) )
		end

feature -- Setters
	default_create,
	set_voidtyid is
		do
			value := voidtyid_low_level
		end

	set_doubletyid is
		do
			value := doubletyid_low_level
		end

	set_x86_fp80tyid is
		do
			value := x86_fp80tyid_low_level
		end

	set_fp128tyid is
		do
			value := fp128tyid_low_level
		end

	set_ppc_fp128tyid is
		do
			value := ppc_fp128tyid_low_level
		end

	set_labeltyid is
		do
			value := labeltyid_low_level
		end

	set_metadatatyid is
		do
			value := metadatatyid_low_level
		end

	set_integertyid is
		do
			value := integertyid_low_level
		end

	set_functiontyid is
		do
			value := functiontyid_low_level
		end

	set_structtyid is
		do
			value := structtyid_low_level
		end

	set_arraytyid is
		do
			value := arraytyid_low_level
		end

	set_pointertyid is
		do
			value := pointertyid_low_level
		end

	set_opaquetyid is
		do
			value := opaquetyid_low_level
		end

	set_vectortyid is
		do
			value := vectortyid_low_level
		end

	set_numtypeids is
		do
			value := numtypeids_low_level
		end

	set_lastprimitivetyid is
		do
			value := lastprimitivetyid_low_level
		end

	set_firstderivedtyid is
		do
			value := firstderivedtyid_low_level
		end

feature -- Queries
	is_voidtyid: BOOLEAN is
		do
			Result := (value=voidtyid_low_level)
		end

	is_doubletyid: BOOLEAN is
		do
			Result := (value=doubletyid_low_level)
		end

	is_x86_fp80tyid: BOOLEAN is
		do
			Result := (value=x86_fp80tyid_low_level)
		end

	is_fp128tyid: BOOLEAN is
		do
			Result := (value=fp128tyid_low_level)
		end

	is_ppc_fp128tyid: BOOLEAN is
		do
			Result := (value=ppc_fp128tyid_low_level)
		end

	is_labeltyid: BOOLEAN is
		do
			Result := (value=labeltyid_low_level)
		end

	is_metadatatyid: BOOLEAN is
		do
			Result := (value=metadatatyid_low_level)
		end

	is_integertyid: BOOLEAN is
		do
			Result := (value=integertyid_low_level)
		end

	is_functiontyid: BOOLEAN is
		do
			Result := (value=functiontyid_low_level)
		end

	is_structtyid: BOOLEAN is
		do
			Result := (value=structtyid_low_level)
		end

	is_arraytyid: BOOLEAN is
		do
			Result := (value=arraytyid_low_level)
		end

	is_pointertyid: BOOLEAN is
		do
			Result := (value=pointertyid_low_level)
		end

	is_opaquetyid: BOOLEAN is
		do
			Result := (value=opaquetyid_low_level)
		end

	is_vectortyid: BOOLEAN is
		do
			Result := (value=vectortyid_low_level)
		end

	is_numtypeids: BOOLEAN is
		do
			Result := (value=numtypeids_low_level)
		end

	is_lastprimitivetyid: BOOLEAN is
		do
			Result := (value=lastprimitivetyid_low_level)
		end

	is_firstderivedtyid: BOOLEAN is
		do
			Result := (value=firstderivedtyid_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	voidtyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "VoidTyID"
 			}"
 		end

	doubletyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DoubleTyID"
 			}"
 		end

	x86_fp80tyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "X86_FP80TyID"
 			}"
 		end

	fp128tyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FP128TyID"
 			}"
 		end

	ppc_fp128tyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PPC_FP128TyID"
 			}"
 		end

	labeltyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LabelTyID"
 			}"
 		end

	metadatatyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "MetadataTyID"
 			}"
 		end

	integertyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "IntegerTyID"
 			}"
 		end

	functiontyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FunctionTyID"
 			}"
 		end

	structtyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "StructTyID"
 			}"
 		end

	arraytyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ArrayTyID"
 			}"
 		end

	pointertyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PointerTyID"
 			}"
 		end

	opaquetyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "OpaqueTyID"
 			}"
 		end

	vectortyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "VectorTyID"
 			}"
 		end

	numtypeids_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "NumTypeIDs"
 			}"
 		end

	lastprimitivetyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LastPrimitiveTyID"
 			}"
 		end

	firstderivedtyid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FirstDerivedTyID"
 			}"
 		end


end -- class TYPE_ID_ENUM
