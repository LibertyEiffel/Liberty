-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMTYPEKIND_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = llvmarray_type_kind_low_level)  or else
				(a_value = llvmdouble_type_kind_low_level)  or else
				(a_value = llvmfloat_type_kind_low_level)  or else
				(a_value = llvmfp128type_kind_low_level)  or else
				(a_value = llvmfunction_type_kind_low_level)  or else
				(a_value = llvminteger_type_kind_low_level)  or else
				(a_value = llvmlabel_type_kind_low_level)  or else
				(a_value = llvmmetadata_type_kind_low_level)  or else
				(a_value = llvmopaque_type_kind_low_level)  or else
				(a_value = llvmpointer_type_kind_low_level)  or else
				(a_value = llvmppc_fp128type_kind_low_level)  or else
				(a_value = llvmstruct_type_kind_low_level)  or else
				(a_value = llvmvector_type_kind_low_level)  or else
				(a_value = llvmvoid_type_kind_low_level)  or else
				(a_value = llvmx86_fp80type_kind_low_level)  or else
				(a_value = llvmx86_mmxtype_kind_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_llvmarray_type_kind is
		do
			value := llvmarray_type_kind_low_level
		end

	set_llvmdouble_type_kind is
		do
			value := llvmdouble_type_kind_low_level
		end

	set_llvmfloat_type_kind is
		do
			value := llvmfloat_type_kind_low_level
		end

	set_llvmfp128type_kind is
		do
			value := llvmfp128type_kind_low_level
		end

	set_llvmfunction_type_kind is
		do
			value := llvmfunction_type_kind_low_level
		end

	set_llvminteger_type_kind is
		do
			value := llvminteger_type_kind_low_level
		end

	set_llvmlabel_type_kind is
		do
			value := llvmlabel_type_kind_low_level
		end

	set_llvmmetadata_type_kind is
		do
			value := llvmmetadata_type_kind_low_level
		end

	set_llvmopaque_type_kind is
		do
			value := llvmopaque_type_kind_low_level
		end

	set_llvmpointer_type_kind is
		do
			value := llvmpointer_type_kind_low_level
		end

	set_llvmppc_fp128type_kind is
		do
			value := llvmppc_fp128type_kind_low_level
		end

	set_llvmstruct_type_kind is
		do
			value := llvmstruct_type_kind_low_level
		end

	set_llvmvector_type_kind is
		do
			value := llvmvector_type_kind_low_level
		end

	set_llvmvoid_type_kind is
		do
			value := llvmvoid_type_kind_low_level
		end

	set_llvmx86_fp80type_kind is
		do
			value := llvmx86_fp80type_kind_low_level
		end

	set_llvmx86_mmxtype_kind is
		do
			value := llvmx86_mmxtype_kind_low_level
		end

feature {ANY} -- Queries
	is_llvmarray_type_kind: BOOLEAN is
		do
			Result := (value=llvmarray_type_kind_low_level)
		end

	is_llvmdouble_type_kind: BOOLEAN is
		do
			Result := (value=llvmdouble_type_kind_low_level)
		end

	is_llvmfloat_type_kind: BOOLEAN is
		do
			Result := (value=llvmfloat_type_kind_low_level)
		end

	is_llvmfp128type_kind: BOOLEAN is
		do
			Result := (value=llvmfp128type_kind_low_level)
		end

	is_llvmfunction_type_kind: BOOLEAN is
		do
			Result := (value=llvmfunction_type_kind_low_level)
		end

	is_llvminteger_type_kind: BOOLEAN is
		do
			Result := (value=llvminteger_type_kind_low_level)
		end

	is_llvmlabel_type_kind: BOOLEAN is
		do
			Result := (value=llvmlabel_type_kind_low_level)
		end

	is_llvmmetadata_type_kind: BOOLEAN is
		do
			Result := (value=llvmmetadata_type_kind_low_level)
		end

	is_llvmopaque_type_kind: BOOLEAN is
		do
			Result := (value=llvmopaque_type_kind_low_level)
		end

	is_llvmpointer_type_kind: BOOLEAN is
		do
			Result := (value=llvmpointer_type_kind_low_level)
		end

	is_llvmppc_fp128type_kind: BOOLEAN is
		do
			Result := (value=llvmppc_fp128type_kind_low_level)
		end

	is_llvmstruct_type_kind: BOOLEAN is
		do
			Result := (value=llvmstruct_type_kind_low_level)
		end

	is_llvmvector_type_kind: BOOLEAN is
		do
			Result := (value=llvmvector_type_kind_low_level)
		end

	is_llvmvoid_type_kind: BOOLEAN is
		do
			Result := (value=llvmvoid_type_kind_low_level)
		end

	is_llvmx86_fp80type_kind: BOOLEAN is
		do
			Result := (value=llvmx86_fp80type_kind_low_level)
		end

	is_llvmx86_mmxtype_kind: BOOLEAN is
		do
			Result := (value=llvmx86_mmxtype_kind_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmarray_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMArrayTypeKind"
 			}"
 		end

	llvmdouble_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMDoubleTypeKind"
 			}"
 		end

	llvmfloat_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFloatTypeKind"
 			}"
 		end

	llvmfp128type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFP128TypeKind"
 			}"
 		end

	llvmfunction_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFunctionTypeKind"
 			}"
 		end

	llvminteger_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntegerTypeKind"
 			}"
 		end

	llvmlabel_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLabelTypeKind"
 			}"
 		end

	llvmmetadata_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMMetadataTypeKind"
 			}"
 		end

	llvmopaque_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMOpaqueTypeKind"
 			}"
 		end

	llvmpointer_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPointerTypeKind"
 			}"
 		end

	llvmppc_fp128type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPPC_FP128TypeKind"
 			}"
 		end

	llvmstruct_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStructTypeKind"
 			}"
 		end

	llvmvector_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMVectorTypeKind"
 			}"
 		end

	llvmvoid_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMVoidTypeKind"
 			}"
 		end

	llvmx86_fp80type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86_FP80TypeKind"
 			}"
 		end

	llvmx86_mmxtype_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86_MMXTypeKind"
 			}"
 		end


end -- class LLVMTYPEKIND_ENUM
