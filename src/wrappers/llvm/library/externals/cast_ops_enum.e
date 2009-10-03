-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CAST_OPS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = castopsbegin_low_level)  or else
				(a_value = zext_low_level)  or else
				(a_value = sext_low_level)  or else
				(a_value = fptoui_low_level)  or else
				(a_value = fptosi_low_level)  or else
				(a_value = uitofp_low_level)  or else
				(a_value = sitofp_low_level)  or else
				(a_value = fptrunc_low_level)  or else
				(a_value = fpext_low_level)  or else
				(a_value = ptrtoint_low_level)  or else
				(a_value = inttoptr_low_level)  or else
				(a_value = bitcast_low_level)  or else
				(a_value = castopsend_low_level) )
		end

feature -- Setters
	default_create,
	set_castopsbegin is
		do
			value := castopsbegin_low_level
		end

	set_zext is
		do
			value := zext_low_level
		end

	set_sext is
		do
			value := sext_low_level
		end

	set_fptoui is
		do
			value := fptoui_low_level
		end

	set_fptosi is
		do
			value := fptosi_low_level
		end

	set_uitofp is
		do
			value := uitofp_low_level
		end

	set_sitofp is
		do
			value := sitofp_low_level
		end

	set_fptrunc is
		do
			value := fptrunc_low_level
		end

	set_fpext is
		do
			value := fpext_low_level
		end

	set_ptrtoint is
		do
			value := ptrtoint_low_level
		end

	set_inttoptr is
		do
			value := inttoptr_low_level
		end

	set_bitcast is
		do
			value := bitcast_low_level
		end

	set_castopsend is
		do
			value := castopsend_low_level
		end

feature -- Queries
	is_castopsbegin: BOOLEAN is
		do
			Result := (value=castopsbegin_low_level)
		end

	is_zext: BOOLEAN is
		do
			Result := (value=zext_low_level)
		end

	is_sext: BOOLEAN is
		do
			Result := (value=sext_low_level)
		end

	is_fptoui: BOOLEAN is
		do
			Result := (value=fptoui_low_level)
		end

	is_fptosi: BOOLEAN is
		do
			Result := (value=fptosi_low_level)
		end

	is_uitofp: BOOLEAN is
		do
			Result := (value=uitofp_low_level)
		end

	is_sitofp: BOOLEAN is
		do
			Result := (value=sitofp_low_level)
		end

	is_fptrunc: BOOLEAN is
		do
			Result := (value=fptrunc_low_level)
		end

	is_fpext: BOOLEAN is
		do
			Result := (value=fpext_low_level)
		end

	is_ptrtoint: BOOLEAN is
		do
			Result := (value=ptrtoint_low_level)
		end

	is_inttoptr: BOOLEAN is
		do
			Result := (value=inttoptr_low_level)
		end

	is_bitcast: BOOLEAN is
		do
			Result := (value=bitcast_low_level)
		end

	is_castopsend: BOOLEAN is
		do
			Result := (value=castopsend_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	castopsbegin_low_level: INTEGER is
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

	fptoui_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FPToUI"
 			}"
 		end

	fptosi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FPToSI"
 			}"
 		end

	uitofp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "UIToFP"
 			}"
 		end

	sitofp_low_level: INTEGER is
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

	ptrtoint_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PtrToInt"
 			}"
 		end

	inttoptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "IntToPtr"
 			}"
 		end

	bitcast_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "BitCast"
 			}"
 		end

	castopsend_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "CastOpsEnd"
 			}"
 		end


end -- class CAST_OPS_ENUM
