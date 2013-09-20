-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class TYPE_ID_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = array_ty_id_low_level)  or else
				(a_value = double_ty_id_low_level)  or else
				(a_value = first_derived_ty_id_low_level)  or else
				(a_value = float_ty_id_low_level)  or else
				(a_value = fp128ty_id_low_level)  or else
				(a_value = function_ty_id_low_level)  or else
				(a_value = half_ty_id_low_level)  or else
				(a_value = integer_ty_id_low_level)  or else
				(a_value = label_ty_id_low_level)  or else
				(a_value = last_primitive_ty_id_low_level)  or else
				(a_value = metadata_ty_id_low_level)  or else
				(a_value = num_type_ids_low_level)  or else
				(a_value = pointer_ty_id_low_level)  or else
				(a_value = ppc_fp128ty_id_low_level)  or else
				(a_value = struct_ty_id_low_level)  or else
				(a_value = vector_ty_id_low_level)  or else
				(a_value = void_ty_id_low_level)  or else
				(a_value = x86_fp80ty_id_low_level)  or else
				(a_value = x86_mmxty_id_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_array_ty_id is
		do
			value := array_ty_id_low_level
		end

	set_double_ty_id is
		do
			value := double_ty_id_low_level
		end

	set_first_derived_ty_id is
		do
			value := first_derived_ty_id_low_level
		end

	set_float_ty_id is
		do
			value := float_ty_id_low_level
		end

	set_fp128ty_id is
		do
			value := fp128ty_id_low_level
		end

	set_function_ty_id is
		do
			value := function_ty_id_low_level
		end

	set_half_ty_id is
		do
			value := half_ty_id_low_level
		end

	set_integer_ty_id is
		do
			value := integer_ty_id_low_level
		end

	set_label_ty_id is
		do
			value := label_ty_id_low_level
		end

	set_last_primitive_ty_id is
		do
			value := last_primitive_ty_id_low_level
		end

	set_metadata_ty_id is
		do
			value := metadata_ty_id_low_level
		end

	set_num_type_ids is
		do
			value := num_type_ids_low_level
		end

	set_pointer_ty_id is
		do
			value := pointer_ty_id_low_level
		end

	set_ppc_fp128ty_id is
		do
			value := ppc_fp128ty_id_low_level
		end

	set_struct_ty_id is
		do
			value := struct_ty_id_low_level
		end

	set_vector_ty_id is
		do
			value := vector_ty_id_low_level
		end

	set_void_ty_id is
		do
			value := void_ty_id_low_level
		end

	set_x86_fp80ty_id is
		do
			value := x86_fp80ty_id_low_level
		end

	set_x86_mmxty_id is
		do
			value := x86_mmxty_id_low_level
		end

feature {ANY} -- Queries
	is_array_ty_id: BOOLEAN is
		do
			Result := (value=array_ty_id_low_level)
		end

	is_double_ty_id: BOOLEAN is
		do
			Result := (value=double_ty_id_low_level)
		end

	is_first_derived_ty_id: BOOLEAN is
		do
			Result := (value=first_derived_ty_id_low_level)
		end

	is_float_ty_id: BOOLEAN is
		do
			Result := (value=float_ty_id_low_level)
		end

	is_fp128ty_id: BOOLEAN is
		do
			Result := (value=fp128ty_id_low_level)
		end

	is_function_ty_id: BOOLEAN is
		do
			Result := (value=function_ty_id_low_level)
		end

	is_half_ty_id: BOOLEAN is
		do
			Result := (value=half_ty_id_low_level)
		end

	is_integer_ty_id: BOOLEAN is
		do
			Result := (value=integer_ty_id_low_level)
		end

	is_label_ty_id: BOOLEAN is
		do
			Result := (value=label_ty_id_low_level)
		end

	is_last_primitive_ty_id: BOOLEAN is
		do
			Result := (value=last_primitive_ty_id_low_level)
		end

	is_metadata_ty_id: BOOLEAN is
		do
			Result := (value=metadata_ty_id_low_level)
		end

	is_num_type_ids: BOOLEAN is
		do
			Result := (value=num_type_ids_low_level)
		end

	is_pointer_ty_id: BOOLEAN is
		do
			Result := (value=pointer_ty_id_low_level)
		end

	is_ppc_fp128ty_id: BOOLEAN is
		do
			Result := (value=ppc_fp128ty_id_low_level)
		end

	is_struct_ty_id: BOOLEAN is
		do
			Result := (value=struct_ty_id_low_level)
		end

	is_vector_ty_id: BOOLEAN is
		do
			Result := (value=vector_ty_id_low_level)
		end

	is_void_ty_id: BOOLEAN is
		do
			Result := (value=void_ty_id_low_level)
		end

	is_x86_fp80ty_id: BOOLEAN is
		do
			Result := (value=x86_fp80ty_id_low_level)
		end

	is_x86_mmxty_id: BOOLEAN is
		do
			Result := (value=x86_mmxty_id_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	array_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ArrayTyID"
 			}"
 		end

	double_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DoubleTyID"
 			}"
 		end

	first_derived_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FirstDerivedTyID"
 			}"
 		end

	float_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FloatTyID"
 			}"
 		end

	fp128ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FP128TyID"
 			}"
 		end

	function_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FunctionTyID"
 			}"
 		end

	half_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "HalfTyID"
 			}"
 		end

	integer_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "IntegerTyID"
 			}"
 		end

	label_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LabelTyID"
 			}"
 		end

	last_primitive_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LastPrimitiveTyID"
 			}"
 		end

	metadata_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MetadataTyID"
 			}"
 		end

	num_type_ids_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "NumTypeIDs"
 			}"
 		end

	pointer_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PointerTyID"
 			}"
 		end

	ppc_fp128ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PPC_FP128TyID"
 			}"
 		end

	struct_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "StructTyID"
 			}"
 		end

	vector_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "VectorTyID"
 			}"
 		end

	void_ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "VoidTyID"
 			}"
 		end

	x86_fp80ty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "X86_FP80TyID"
 			}"
 		end

	x86_mmxty_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "X86_MMXTyID"
 			}"
 		end


end -- class TYPE_ID_ENUM
