-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMTYPE_KIND_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = voidtypekind_low_level)  or else
				(a_value = doubletypekind_low_level)  or else
				(a_value = x86_fp80typekind_low_level)  or else
				(a_value = fp128typekind_low_level)  or else
				(a_value = ppc_fp128typekind_low_level)  or else
				(a_value = labeltypekind_low_level)  or else
				(a_value = integertypekind_low_level)  or else
				(a_value = functiontypekind_low_level)  or else
				(a_value = structtypekind_low_level)  or else
				(a_value = arraytypekind_low_level)  or else
				(a_value = pointertypekind_low_level)  or else
				(a_value = opaquetypekind_low_level)  or else
				(a_value = vectortypekind_low_level)  or else
				(a_value = metadatatypekind_low_level) )
		end

feature -- Setters
	default_create,
	set_voidtypekind is
		do
			value := voidtypekind_low_level
		end

	set_doubletypekind is
		do
			value := doubletypekind_low_level
		end

	set_x86_fp80typekind is
		do
			value := x86_fp80typekind_low_level
		end

	set_fp128typekind is
		do
			value := fp128typekind_low_level
		end

	set_ppc_fp128typekind is
		do
			value := ppc_fp128typekind_low_level
		end

	set_labeltypekind is
		do
			value := labeltypekind_low_level
		end

	set_integertypekind is
		do
			value := integertypekind_low_level
		end

	set_functiontypekind is
		do
			value := functiontypekind_low_level
		end

	set_structtypekind is
		do
			value := structtypekind_low_level
		end

	set_arraytypekind is
		do
			value := arraytypekind_low_level
		end

	set_pointertypekind is
		do
			value := pointertypekind_low_level
		end

	set_opaquetypekind is
		do
			value := opaquetypekind_low_level
		end

	set_vectortypekind is
		do
			value := vectortypekind_low_level
		end

	set_metadatatypekind is
		do
			value := metadatatypekind_low_level
		end

feature -- Queries
	is_voidtypekind: BOOLEAN is
		do
			Result := (value=voidtypekind_low_level)
		end

	is_doubletypekind: BOOLEAN is
		do
			Result := (value=doubletypekind_low_level)
		end

	is_x86_fp80typekind: BOOLEAN is
		do
			Result := (value=x86_fp80typekind_low_level)
		end

	is_fp128typekind: BOOLEAN is
		do
			Result := (value=fp128typekind_low_level)
		end

	is_ppc_fp128typekind: BOOLEAN is
		do
			Result := (value=ppc_fp128typekind_low_level)
		end

	is_labeltypekind: BOOLEAN is
		do
			Result := (value=labeltypekind_low_level)
		end

	is_integertypekind: BOOLEAN is
		do
			Result := (value=integertypekind_low_level)
		end

	is_functiontypekind: BOOLEAN is
		do
			Result := (value=functiontypekind_low_level)
		end

	is_structtypekind: BOOLEAN is
		do
			Result := (value=structtypekind_low_level)
		end

	is_arraytypekind: BOOLEAN is
		do
			Result := (value=arraytypekind_low_level)
		end

	is_pointertypekind: BOOLEAN is
		do
			Result := (value=pointertypekind_low_level)
		end

	is_opaquetypekind: BOOLEAN is
		do
			Result := (value=opaquetypekind_low_level)
		end

	is_vectortypekind: BOOLEAN is
		do
			Result := (value=vectortypekind_low_level)
		end

	is_metadatatypekind: BOOLEAN is
		do
			Result := (value=metadatatypekind_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	voidtypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMVoidTypeKind"
 			}"
 		end

	doubletypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMDoubleTypeKind"
 			}"
 		end

	x86_fp80typekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMX86_FP80TypeKind"
 			}"
 		end

	fp128typekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMFP128TypeKind"
 			}"
 		end

	ppc_fp128typekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMPPC_FP128TypeKind"
 			}"
 		end

	labeltypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMLabelTypeKind"
 			}"
 		end

	integertypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMIntegerTypeKind"
 			}"
 		end

	functiontypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMFunctionTypeKind"
 			}"
 		end

	structtypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMStructTypeKind"
 			}"
 		end

	arraytypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMArrayTypeKind"
 			}"
 		end

	pointertypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMPointerTypeKind"
 			}"
 		end

	opaquetypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMOpaqueTypeKind"
 			}"
 		end

	vectortypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMVectorTypeKind"
 			}"
 		end

	metadatatypekind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMMetadataTypeKind"
 			}"
 		end


end -- class LLVMTYPE_KIND_ENUM
