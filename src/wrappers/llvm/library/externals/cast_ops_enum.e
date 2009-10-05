-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CAST_OPS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = cast_ops_begin_low_level)  or else
				(a_value = zext_low_level)  or else
				(a_value = sext_low_level)  or else
				(a_value = fpto_ui_low_level)  or else
				(a_value = fpto_si_low_level)  or else
				(a_value = uito_fp_low_level)  or else
				(a_value = sito_fp_low_level)  or else
				(a_value = fptrunc_low_level)  or else
				(a_value = fpext_low_level)  or else
				(a_value = ptr_to_int_low_level)  or else
				(a_value = int_to_ptr_low_level)  or else
				(a_value = bit_cast_low_level)  or else
				(a_value = cast_ops_end_low_level) )
		end

feature -- Setters
	default_create,
	set_cast_ops_begin is
		do
			value := cast_ops_begin_low_level
		end

	set_zext is
		do
			value := zext_low_level
		end

	set_sext is
		do
			value := sext_low_level
		end

	set_fpto_ui is
		do
			value := fpto_ui_low_level
		end

	set_fpto_si is
		do
			value := fpto_si_low_level
		end

	set_uito_fp is
		do
			value := uito_fp_low_level
		end

	set_sito_fp is
		do
			value := sito_fp_low_level
		end

	set_fptrunc is
		do
			value := fptrunc_low_level
		end

	set_fpext is
		do
			value := fpext_low_level
		end

	set_ptr_to_int is
		do
			value := ptr_to_int_low_level
		end

	set_int_to_ptr is
		do
			value := int_to_ptr_low_level
		end

	set_bit_cast is
		do
			value := bit_cast_low_level
		end

	set_cast_ops_end is
		do
			value := cast_ops_end_low_level
		end

feature -- Queries
	is_cast_ops_begin: BOOLEAN is
		do
			Result := (value=cast_ops_begin_low_level)
		end

	is_zext: BOOLEAN is
		do
			Result := (value=zext_low_level)
		end

	is_sext: BOOLEAN is
		do
			Result := (value=sext_low_level)
		end

	is_fpto_ui: BOOLEAN is
		do
			Result := (value=fpto_ui_low_level)
		end

	is_fpto_si: BOOLEAN is
		do
			Result := (value=fpto_si_low_level)
		end

	is_uito_fp: BOOLEAN is
		do
			Result := (value=uito_fp_low_level)
		end

	is_sito_fp: BOOLEAN is
		do
			Result := (value=sito_fp_low_level)
		end

	is_fptrunc: BOOLEAN is
		do
			Result := (value=fptrunc_low_level)
		end

	is_fpext: BOOLEAN is
		do
			Result := (value=fpext_low_level)
		end

	is_ptr_to_int: BOOLEAN is
		do
			Result := (value=ptr_to_int_low_level)
		end

	is_int_to_ptr: BOOLEAN is
		do
			Result := (value=int_to_ptr_low_level)
		end

	is_bit_cast: BOOLEAN is
		do
			Result := (value=bit_cast_low_level)
		end

	is_cast_ops_end: BOOLEAN is
		do
			Result := (value=cast_ops_end_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cast_ops_begin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "CastOpsBegin"
 			}"
 		end

	zext_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ZExt"
 			}"
 		end

	sext_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "SExt"
 			}"
 		end

	fpto_ui_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FPToUI"
 			}"
 		end

	fpto_si_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FPToSI"
 			}"
 		end

	uito_fp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "UIToFP"
 			}"
 		end

	sito_fp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "SIToFP"
 			}"
 		end

	fptrunc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FPTrunc"
 			}"
 		end

	fpext_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FPExt"
 			}"
 		end

	ptr_to_int_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PtrToInt"
 			}"
 		end

	int_to_ptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "IntToPtr"
 			}"
 		end

	bit_cast_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "BitCast"
 			}"
 		end

	cast_ops_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "CastOpsEnd"
 			}"
 		end


end -- class CAST_OPS_ENUM
