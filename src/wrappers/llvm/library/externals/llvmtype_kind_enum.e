-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMTYPE_KIND_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = void_type_kind_low_level)  or else
				(a_value = float_type_kind_low_level)  or else
				(a_value = double_type_kind_low_level)  or else
				(a_value = x86_fp80type_kind_low_level)  or else
				(a_value = fp128type_kind_low_level)  or else
				(a_value = ppc_fp128type_kind_low_level)  or else
				(a_value = label_type_kind_low_level)  or else
				(a_value = integer_type_kind_low_level)  or else
				(a_value = function_type_kind_low_level)  or else
				(a_value = struct_type_kind_low_level)  or else
				(a_value = array_type_kind_low_level)  or else
				(a_value = pointer_type_kind_low_level)  or else
				(a_value = opaque_type_kind_low_level)  or else
				(a_value = vector_type_kind_low_level)  or else
				(a_value = metadata_type_kind_low_level)  or else
				(a_value = union_type_kind_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_void_type_kind is
		do
			value := void_type_kind_low_level
		end

	set_float_type_kind is
		do
			value := float_type_kind_low_level
		end

	set_double_type_kind is
		do
			value := double_type_kind_low_level
		end

	set_x86_fp80type_kind is
		do
			value := x86_fp80type_kind_low_level
		end

	set_fp128type_kind is
		do
			value := fp128type_kind_low_level
		end

	set_ppc_fp128type_kind is
		do
			value := ppc_fp128type_kind_low_level
		end

	set_label_type_kind is
		do
			value := label_type_kind_low_level
		end

	set_integer_type_kind is
		do
			value := integer_type_kind_low_level
		end

	set_function_type_kind is
		do
			value := function_type_kind_low_level
		end

	set_struct_type_kind is
		do
			value := struct_type_kind_low_level
		end

	set_array_type_kind is
		do
			value := array_type_kind_low_level
		end

	set_pointer_type_kind is
		do
			value := pointer_type_kind_low_level
		end

	set_opaque_type_kind is
		do
			value := opaque_type_kind_low_level
		end

	set_vector_type_kind is
		do
			value := vector_type_kind_low_level
		end

	set_metadata_type_kind is
		do
			value := metadata_type_kind_low_level
		end

	set_union_type_kind is
		do
			value := union_type_kind_low_level
		end

feature {ANY} -- Queries
	void_type_kind: BOOLEAN is
		do
			Result := (value=void_type_kind_low_level)
		end

	float_type_kind: BOOLEAN is
		do
			Result := (value=float_type_kind_low_level)
		end

	double_type_kind: BOOLEAN is
		do
			Result := (value=double_type_kind_low_level)
		end

	x86_fp80type_kind: BOOLEAN is
		do
			Result := (value=x86_fp80type_kind_low_level)
		end

	fp128type_kind: BOOLEAN is
		do
			Result := (value=fp128type_kind_low_level)
		end

	ppc_fp128type_kind: BOOLEAN is
		do
			Result := (value=ppc_fp128type_kind_low_level)
		end

	label_type_kind: BOOLEAN is
		do
			Result := (value=label_type_kind_low_level)
		end

	integer_type_kind: BOOLEAN is
		do
			Result := (value=integer_type_kind_low_level)
		end

	function_type_kind: BOOLEAN is
		do
			Result := (value=function_type_kind_low_level)
		end

	struct_type_kind: BOOLEAN is
		do
			Result := (value=struct_type_kind_low_level)
		end

	array_type_kind: BOOLEAN is
		do
			Result := (value=array_type_kind_low_level)
		end

	pointer_type_kind: BOOLEAN is
		do
			Result := (value=pointer_type_kind_low_level)
		end

	opaque_type_kind: BOOLEAN is
		do
			Result := (value=opaque_type_kind_low_level)
		end

	vector_type_kind: BOOLEAN is
		do
			Result := (value=vector_type_kind_low_level)
		end

	metadata_type_kind: BOOLEAN is
		do
			Result := (value=metadata_type_kind_low_level)
		end

	union_type_kind: BOOLEAN is
		do
			Result := (value=union_type_kind_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	void_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMVoidTypeKind"
 			}"
 		end

	float_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFloatTypeKind"
 			}"
 		end

	double_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMDoubleTypeKind"
 			}"
 		end

	x86_fp80type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMX86_FP80TypeKind"
 			}"
 		end

	fp128type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFP128TypeKind"
 			}"
 		end

	ppc_fp128type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPPC_FP128TypeKind"
 			}"
 		end

	label_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLabelTypeKind"
 			}"
 		end

	integer_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntegerTypeKind"
 			}"
 		end

	function_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMFunctionTypeKind"
 			}"
 		end

	struct_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMStructTypeKind"
 			}"
 		end

	array_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMArrayTypeKind"
 			}"
 		end

	pointer_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPointerTypeKind"
 			}"
 		end

	opaque_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMOpaqueTypeKind"
 			}"
 		end

	vector_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMVectorTypeKind"
 			}"
 		end

	metadata_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMMetadataTypeKind"
 			}"
 		end

	union_type_kind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMUnionTypeKind"
 			}"
 		end


end -- class LLVMTYPE_KIND_ENUM
