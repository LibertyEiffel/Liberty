-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMTYPE_KIND_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = array_type_kind_low_level)  or else
				(a_value = double_type_kind_low_level)  or else
				(a_value = float_type_kind_low_level)  or else
				(a_value = fp128type_kind_low_level)  or else
				(a_value = function_type_kind_low_level)  or else
				(a_value = half_type_kind_low_level)  or else
				(a_value = integer_type_kind_low_level)  or else
				(a_value = label_type_kind_low_level)  or else
				(a_value = metadata_type_kind_low_level)  or else
				(a_value = pointer_type_kind_low_level)  or else
				(a_value = ppc_fp128type_kind_low_level)  or else
				(a_value = struct_type_kind_low_level)  or else
				(a_value = vector_type_kind_low_level)  or else
				(a_value = void_type_kind_low_level)  or else
				(a_value = x86_fp80type_kind_low_level)  or else
				(a_value = x86_mmxtype_kind_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_array_type_kind
		do
			value := array_type_kind_low_level
		end

	set_double_type_kind
		do
			value := double_type_kind_low_level
		end

	set_float_type_kind
		do
			value := float_type_kind_low_level
		end

	set_fp128type_kind
		do
			value := fp128type_kind_low_level
		end

	set_function_type_kind
		do
			value := function_type_kind_low_level
		end

	set_half_type_kind
		do
			value := half_type_kind_low_level
		end

	set_integer_type_kind
		do
			value := integer_type_kind_low_level
		end

	set_label_type_kind
		do
			value := label_type_kind_low_level
		end

	set_metadata_type_kind
		do
			value := metadata_type_kind_low_level
		end

	set_pointer_type_kind
		do
			value := pointer_type_kind_low_level
		end

	set_ppc_fp128type_kind
		do
			value := ppc_fp128type_kind_low_level
		end

	set_struct_type_kind
		do
			value := struct_type_kind_low_level
		end

	set_vector_type_kind
		do
			value := vector_type_kind_low_level
		end

	set_void_type_kind
		do
			value := void_type_kind_low_level
		end

	set_x86_fp80type_kind
		do
			value := x86_fp80type_kind_low_level
		end

	set_x86_mmxtype_kind
		do
			value := x86_mmxtype_kind_low_level
		end

feature {ANY} -- Queries
	is_array_type_kind: BOOLEAN
		do
			Result := (value=array_type_kind_low_level)
		end

	is_double_type_kind: BOOLEAN
		do
			Result := (value=double_type_kind_low_level)
		end

	is_float_type_kind: BOOLEAN
		do
			Result := (value=float_type_kind_low_level)
		end

	is_fp128type_kind: BOOLEAN
		do
			Result := (value=fp128type_kind_low_level)
		end

	is_function_type_kind: BOOLEAN
		do
			Result := (value=function_type_kind_low_level)
		end

	is_half_type_kind: BOOLEAN
		do
			Result := (value=half_type_kind_low_level)
		end

	is_integer_type_kind: BOOLEAN
		do
			Result := (value=integer_type_kind_low_level)
		end

	is_label_type_kind: BOOLEAN
		do
			Result := (value=label_type_kind_low_level)
		end

	is_metadata_type_kind: BOOLEAN
		do
			Result := (value=metadata_type_kind_low_level)
		end

	is_pointer_type_kind: BOOLEAN
		do
			Result := (value=pointer_type_kind_low_level)
		end

	is_ppc_fp128type_kind: BOOLEAN
		do
			Result := (value=ppc_fp128type_kind_low_level)
		end

	is_struct_type_kind: BOOLEAN
		do
			Result := (value=struct_type_kind_low_level)
		end

	is_vector_type_kind: BOOLEAN
		do
			Result := (value=vector_type_kind_low_level)
		end

	is_void_type_kind: BOOLEAN
		do
			Result := (value=void_type_kind_low_level)
		end

	is_x86_fp80type_kind: BOOLEAN
		do
			Result := (value=x86_fp80type_kind_low_level)
		end

	is_x86_mmxtype_kind: BOOLEAN
		do
			Result := (value=x86_mmxtype_kind_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	array_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMArrayTypeKind"
 			}"
 		end

	double_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMDoubleTypeKind"
 			}"
 		end

	float_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFloatTypeKind"
 			}"
 		end

	fp128type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFP128TypeKind"
 			}"
 		end

	function_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFunctionTypeKind"
 			}"
 		end

	half_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMHalfTypeKind"
 			}"
 		end

	integer_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntegerTypeKind"
 			}"
 		end

	label_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLabelTypeKind"
 			}"
 		end

	metadata_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMMetadataTypeKind"
 			}"
 		end

	pointer_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPointerTypeKind"
 			}"
 		end

	ppc_fp128type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPPC_FP128TypeKind"
 			}"
 		end

	struct_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStructTypeKind"
 			}"
 		end

	vector_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMVectorTypeKind"
 			}"
 		end

	void_type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMVoidTypeKind"
 			}"
 		end

	x86_fp80type_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86_FP80TypeKind"
 			}"
 		end

	x86_mmxtype_kind_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86_MMXTypeKind"
 			}"
 		end


end -- class LLVMTYPE_KIND_ENUM
