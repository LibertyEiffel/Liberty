-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class BINARY_OPS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = binaryopsbegin_low_level)  or else
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
				(a_value = and_low_level)  or else
				(a_value = or_low_level)  or else
				(a_value = xor_low_level)  or else
				(a_value = binaryopsend_low_level) )
		end

feature -- Setters
	default_create,
	set_binaryopsbegin is
		do
			value := binaryopsbegin_low_level
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

	set_and is
		do
			value := and_low_level
		end

	set_or is
		do
			value := or_low_level
		end

	set_xor is
		do
			value := xor_low_level
		end

	set_binaryopsend is
		do
			value := binaryopsend_low_level
		end

feature -- Queries
	is_binaryopsbegin: BOOLEAN is
		do
			Result := (value=binaryopsbegin_low_level)
		end

	is_fadd: BOOLEAN is
		do
			Result := (value=fadd_low_level)
		end

	is_sub: BOOLEAN is
		do
			Result := (value=sub_low_level)
		end

	is_fsub: BOOLEAN is
		do
			Result := (value=fsub_low_level)
		end

	is_mul: BOOLEAN is
		do
			Result := (value=mul_low_level)
		end

	is_fmul: BOOLEAN is
		do
			Result := (value=fmul_low_level)
		end

	is_udiv: BOOLEAN is
		do
			Result := (value=udiv_low_level)
		end

	is_sdiv: BOOLEAN is
		do
			Result := (value=sdiv_low_level)
		end

	is_fdiv: BOOLEAN is
		do
			Result := (value=fdiv_low_level)
		end

	is_urem: BOOLEAN is
		do
			Result := (value=urem_low_level)
		end

	is_srem: BOOLEAN is
		do
			Result := (value=srem_low_level)
		end

	is_frem: BOOLEAN is
		do
			Result := (value=frem_low_level)
		end

	is_shl: BOOLEAN is
		do
			Result := (value=shl_low_level)
		end

	is_lshr: BOOLEAN is
		do
			Result := (value=lshr_low_level)
		end

	is_ashr: BOOLEAN is
		do
			Result := (value=ashr_low_level)
		end

	is_and: BOOLEAN is
		do
			Result := (value=and_low_level)
		end

	is_or: BOOLEAN is
		do
			Result := (value=or_low_level)
		end

	is_xor: BOOLEAN is
		do
			Result := (value=xor_low_level)
		end

	is_binaryopsend: BOOLEAN is
		do
			Result := (value=binaryopsend_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	binaryopsbegin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "BinaryOpsBegin"
 			}"
 		end

	fadd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FAdd"
 			}"
 		end

	sub_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Sub"
 			}"
 		end

	fsub_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FSub"
 			}"
 		end

	mul_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Mul"
 			}"
 		end

	fmul_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FMul"
 			}"
 		end

	udiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "UDiv"
 			}"
 		end

	sdiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "SDiv"
 			}"
 		end

	fdiv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FDiv"
 			}"
 		end

	urem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "URem"
 			}"
 		end

	srem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "SRem"
 			}"
 		end

	frem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FRem"
 			}"
 		end

	shl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Shl"
 			}"
 		end

	lshr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LShr"
 			}"
 		end

	ashr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "AShr"
 			}"
 		end

	and_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "And"
 			}"
 		end

	or_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Or"
 			}"
 		end

	xor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Xor"
 			}"
 		end

	binaryopsend_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "BinaryOpsEnd"
 			}"
 		end


end -- class BINARY_OPS_ENUM
