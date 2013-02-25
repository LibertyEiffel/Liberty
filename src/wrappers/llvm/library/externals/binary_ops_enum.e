-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class BINARY_OPS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = binary_ops_begin_low_level)  or else
				(a_value = add_low_level)  or else
				(a_value = fadd_low_level)  or else
				(a_value = sub_low_level)  or else
				(a_value = fsub_low_level)  or else
				(a_value = mul_low_level)  or else
				(a_value = fmul_low_level)  or else
				(a_value = udiv_low_level)  or else
				(a_value = sdiv_low_level)  or else
				(a_value = fdiv_low_level)  or else
				(a_value = urem_low_level)  or else
				(a_value = srem_low_level)  or else
				(a_value = frem_low_level)  or else
				(a_value = shl_low_level)  or else
				(a_value = lshr_low_level)  or else
				(a_value = ashr_low_level)  or else
				(a_value = and_external_low_level)  or else
				(a_value = or_external_low_level)  or else
				(a_value = xor_external_low_level)  or else
				(a_value = binary_ops_end_low_level) )
		end

feature -- Setters
	default_create,
	set_binary_ops_begin is
		do
			value := binary_ops_begin_low_level
		end

	set_add is
		do
			value := add_low_level
		end

	set_fadd is
		do
			value := fadd_low_level
		end

	set_sub is
		do
			value := sub_low_level
		end

	set_fsub is
		do
			value := fsub_low_level
		end

	set_mul is
		do
			value := mul_low_level
		end

	set_fmul is
		do
			value := fmul_low_level
		end

	set_udiv is
		do
			value := udiv_low_level
		end

	set_sdiv is
		do
			value := sdiv_low_level
		end

	set_fdiv is
		do
			value := fdiv_low_level
		end

	set_urem is
		do
			value := urem_low_level
		end

	set_srem is
		do
			value := srem_low_level
		end

	set_frem is
		do
			value := frem_low_level
		end

	set_shl is
		do
			value := shl_low_level
		end

	set_lshr is
		do
			value := lshr_low_level
		end

	set_ashr is
		do
			value := ashr_low_level
		end

	set_and_external is
		do
			value := and_external_low_level
		end

	set_or_external is
		do
			value := or_external_low_level
		end

	set_xor_external is
		do
			value := xor_external_low_level
		end

	set_binary_ops_end is
		do
			value := binary_ops_end_low_level
		end

feature -- Queries
	binary_ops_begin: BOOLEAN is
		do
			Result := (value=binary_ops_begin_low_level)
		end

	add: BOOLEAN is
		do
			Result := (value=add_low_level)
		end

	fadd: BOOLEAN is
		do
			Result := (value=fadd_low_level)
		end

	sub: BOOLEAN is
		do
			Result := (value=sub_low_level)
		end

	fsub: BOOLEAN is
		do
			Result := (value=fsub_low_level)
		end

	mul: BOOLEAN is
		do
			Result := (value=mul_low_level)
		end

	fmul: BOOLEAN is
		do
			Result := (value=fmul_low_level)
		end

	udiv: BOOLEAN is
		do
			Result := (value=udiv_low_level)
		end

	sdiv: BOOLEAN is
		do
			Result := (value=sdiv_low_level)
		end

	fdiv: BOOLEAN is
		do
			Result := (value=fdiv_low_level)
		end

	urem: BOOLEAN is
		do
			Result := (value=urem_low_level)
		end

	srem: BOOLEAN is
		do
			Result := (value=srem_low_level)
		end

	frem: BOOLEAN is
		do
			Result := (value=frem_low_level)
		end

	shl: BOOLEAN is
		do
			Result := (value=shl_low_level)
		end

	lshr: BOOLEAN is
		do
			Result := (value=lshr_low_level)
		end

	ashr: BOOLEAN is
		do
			Result := (value=ashr_low_level)
		end

	and_external: BOOLEAN is
		do
			Result := (value=and_external_low_level)
		end

	or_external: BOOLEAN is
		do
			Result := (value=or_external_low_level)
		end

	xor_external: BOOLEAN is
		do
			Result := (value=xor_external_low_level)
		end

	binary_ops_end: BOOLEAN is
		do
			Result := (value=binary_ops_end_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	binary_ops_begin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BinaryOpsBegin"
 			}"
 		end

	add_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Add"
 			}"
 		end

	fadd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FAdd"
 			}"
 		end

	sub_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Sub"
 			}"
 		end

	fsub_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FSub"
 			}"
 		end

	mul_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Mul"
 			}"
 		end

	fmul_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FMul"
 			}"
 		end

	udiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UDiv"
 			}"
 		end

	sdiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "SDiv"
 			}"
 		end

	fdiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FDiv"
 			}"
 		end

	urem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "URem"
 			}"
 		end

	srem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "SRem"
 			}"
 		end

	frem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FRem"
 			}"
 		end

	shl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Shl"
 			}"
 		end

	lshr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LShr"
 			}"
 		end

	ashr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "AShr"
 			}"
 		end

	and_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "And"
 			}"
 		end

	or_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Or"
 			}"
 		end

	xor_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Xor"
 			}"
 		end

	binary_ops_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BinaryOpsEnd"
 			}"
 		end


end -- class BINARY_OPS_ENUM
