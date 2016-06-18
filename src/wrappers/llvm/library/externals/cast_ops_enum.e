-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CAST_OPS_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bit_cast_low_level)  or else
				(a_value = cast_ops_begin_low_level)  or else
				(a_value = cast_ops_end_low_level)  or else
				(a_value = fpext_low_level)  or else
				(a_value = fpto_si_low_level)  or else
				(a_value = fpto_ui_low_level)  or else
				(a_value = fptrunc_low_level)  or else
				(a_value = int_to_ptr_low_level)  or else
				(a_value = ptr_to_int_low_level)  or else
				(a_value = sext_low_level)  or else
				(a_value = sito_fp_low_level)  or else
				(a_value = trunc_low_level)  or else
				(a_value = uito_fp_low_level)  or else
				(a_value = zext_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bit_cast
		do
			value := bit_cast_low_level
		end

	set_cast_ops_begin
		do
			value := cast_ops_begin_low_level
		end

	set_cast_ops_end
		do
			value := cast_ops_end_low_level
		end

	set_fpext
		do
			value := fpext_low_level
		end

	set_fpto_si
		do
			value := fpto_si_low_level
		end

	set_fpto_ui
		do
			value := fpto_ui_low_level
		end

	set_fptrunc
		do
			value := fptrunc_low_level
		end

	set_int_to_ptr
		do
			value := int_to_ptr_low_level
		end

	set_ptr_to_int
		do
			value := ptr_to_int_low_level
		end

	set_sext
		do
			value := sext_low_level
		end

	set_sito_fp
		do
			value := sito_fp_low_level
		end

	set_trunc
		do
			value := trunc_low_level
		end

	set_uito_fp
		do
			value := uito_fp_low_level
		end

	set_zext
		do
			value := zext_low_level
		end

feature {ANY} -- Queries
	is_bit_cast: BOOLEAN
		do
			Result := (value=bit_cast_low_level)
		end

	is_cast_ops_begin: BOOLEAN
		do
			Result := (value=cast_ops_begin_low_level)
		end

	is_cast_ops_end: BOOLEAN
		do
			Result := (value=cast_ops_end_low_level)
		end

	is_fpext: BOOLEAN
		do
			Result := (value=fpext_low_level)
		end

	is_fpto_si: BOOLEAN
		do
			Result := (value=fpto_si_low_level)
		end

	is_fpto_ui: BOOLEAN
		do
			Result := (value=fpto_ui_low_level)
		end

	is_fptrunc: BOOLEAN
		do
			Result := (value=fptrunc_low_level)
		end

	is_int_to_ptr: BOOLEAN
		do
			Result := (value=int_to_ptr_low_level)
		end

	is_ptr_to_int: BOOLEAN
		do
			Result := (value=ptr_to_int_low_level)
		end

	is_sext: BOOLEAN
		do
			Result := (value=sext_low_level)
		end

	is_sito_fp: BOOLEAN
		do
			Result := (value=sito_fp_low_level)
		end

	is_trunc: BOOLEAN
		do
			Result := (value=trunc_low_level)
		end

	is_uito_fp: BOOLEAN
		do
			Result := (value=uito_fp_low_level)
		end

	is_zext: BOOLEAN
		do
			Result := (value=zext_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	bit_cast_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BitCast"
 			}"
 		end

	cast_ops_begin_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CastOpsBegin"
 			}"
 		end

	cast_ops_end_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CastOpsEnd"
 			}"
 		end

	fpext_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FPExt"
 			}"
 		end

	fpto_si_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FPToSI"
 			}"
 		end

	fpto_ui_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FPToUI"
 			}"
 		end

	fptrunc_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FPTrunc"
 			}"
 		end

	int_to_ptr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "IntToPtr"
 			}"
 		end

	ptr_to_int_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PtrToInt"
 			}"
 		end

	sext_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "SExt"
 			}"
 		end

	sito_fp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "SIToFP"
 			}"
 		end

	trunc_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Trunc"
 			}"
 		end

	uito_fp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UIToFP"
 			}"
 		end

	zext_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ZExt"
 			}"
 		end


end -- class CAST_OPS_ENUM
