-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class BINARY_OPS_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = add_low_level)  or else
				(a_value = and_external_low_level)  or else
				(a_value = ashr_low_level)  or else
				(a_value = binary_ops_begin_low_level)  or else
				(a_value = binary_ops_end_low_level)  or else
				(a_value = fadd_low_level)  or else
				(a_value = fdiv_low_level)  or else
				(a_value = fmul_low_level)  or else
				(a_value = frem_low_level)  or else
				(a_value = fsub_low_level)  or else
				(a_value = lshr_low_level)  or else
				(a_value = mul_low_level)  or else
				(a_value = or_external_low_level)  or else
				(a_value = sdiv_low_level)  or else
				(a_value = shl_low_level)  or else
				(a_value = srem_low_level)  or else
				(a_value = sub_low_level)  or else
				(a_value = udiv_low_level)  or else
				(a_value = urem_low_level)  or else
				(a_value = xor_external_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_add
		do
			value := add_low_level
		end

	set_and_external
		do
			value := and_external_low_level
		end

	set_ashr
		do
			value := ashr_low_level
		end

	set_binary_ops_begin
		do
			value := binary_ops_begin_low_level
		end

	set_binary_ops_end
		do
			value := binary_ops_end_low_level
		end

	set_fadd
		do
			value := fadd_low_level
		end

	set_fdiv
		do
			value := fdiv_low_level
		end

	set_fmul
		do
			value := fmul_low_level
		end

	set_frem
		do
			value := frem_low_level
		end

	set_fsub
		do
			value := fsub_low_level
		end

	set_lshr
		do
			value := lshr_low_level
		end

	set_mul
		do
			value := mul_low_level
		end

	set_or_external
		do
			value := or_external_low_level
		end

	set_sdiv
		do
			value := sdiv_low_level
		end

	set_shl
		do
			value := shl_low_level
		end

	set_srem
		do
			value := srem_low_level
		end

	set_sub
		do
			value := sub_low_level
		end

	set_udiv
		do
			value := udiv_low_level
		end

	set_urem
		do
			value := urem_low_level
		end

	set_xor_external
		do
			value := xor_external_low_level
		end

feature {ANY} -- Queries
	is_add: BOOLEAN
		do
			Result := (value=add_low_level)
		end

	is_and_external: BOOLEAN
		do
			Result := (value=and_external_low_level)
		end

	is_ashr: BOOLEAN
		do
			Result := (value=ashr_low_level)
		end

	is_binary_ops_begin: BOOLEAN
		do
			Result := (value=binary_ops_begin_low_level)
		end

	is_binary_ops_end: BOOLEAN
		do
			Result := (value=binary_ops_end_low_level)
		end

	is_fadd: BOOLEAN
		do
			Result := (value=fadd_low_level)
		end

	is_fdiv: BOOLEAN
		do
			Result := (value=fdiv_low_level)
		end

	is_fmul: BOOLEAN
		do
			Result := (value=fmul_low_level)
		end

	is_frem: BOOLEAN
		do
			Result := (value=frem_low_level)
		end

	is_fsub: BOOLEAN
		do
			Result := (value=fsub_low_level)
		end

	is_lshr: BOOLEAN
		do
			Result := (value=lshr_low_level)
		end

	is_mul: BOOLEAN
		do
			Result := (value=mul_low_level)
		end

	is_or_external: BOOLEAN
		do
			Result := (value=or_external_low_level)
		end

	is_sdiv: BOOLEAN
		do
			Result := (value=sdiv_low_level)
		end

	is_shl: BOOLEAN
		do
			Result := (value=shl_low_level)
		end

	is_srem: BOOLEAN
		do
			Result := (value=srem_low_level)
		end

	is_sub: BOOLEAN
		do
			Result := (value=sub_low_level)
		end

	is_udiv: BOOLEAN
		do
			Result := (value=udiv_low_level)
		end

	is_urem: BOOLEAN
		do
			Result := (value=urem_low_level)
		end

	is_xor_external: BOOLEAN
		do
			Result := (value=xor_external_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	add_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Add"
 			}"
 		end

	and_external_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "And"
 			}"
 		end

	ashr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "AShr"
 			}"
 		end

	binary_ops_begin_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BinaryOpsBegin"
 			}"
 		end

	binary_ops_end_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BinaryOpsEnd"
 			}"
 		end

	fadd_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FAdd"
 			}"
 		end

	fdiv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FDiv"
 			}"
 		end

	fmul_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FMul"
 			}"
 		end

	frem_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FRem"
 			}"
 		end

	fsub_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FSub"
 			}"
 		end

	lshr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LShr"
 			}"
 		end

	mul_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Mul"
 			}"
 		end

	or_external_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Or"
 			}"
 		end

	sdiv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "SDiv"
 			}"
 		end

	shl_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Shl"
 			}"
 		end

	srem_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "SRem"
 			}"
 		end

	sub_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Sub"
 			}"
 		end

	udiv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UDiv"
 			}"
 		end

	urem_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "URem"
 			}"
 		end

	xor_external_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Xor"
 			}"
 		end


end -- class BINARY_OPS_ENUM
