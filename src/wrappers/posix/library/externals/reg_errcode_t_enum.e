-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class REG_ERRCODE_T_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = enosys_low_level)  or else
				(a_value = noerror_low_level)  or else
				(a_value = nomatch_low_level)  or else
				(a_value = badpat_low_level)  or else
				(a_value = ecollate_low_level)  or else
				(a_value = ectype_low_level)  or else
				(a_value = eescape_low_level)  or else
				(a_value = esubreg_low_level)  or else
				(a_value = ebrack_low_level)  or else
				(a_value = eparen_low_level)  or else
				(a_value = ebrace_low_level)  or else
				(a_value = badbr_low_level)  or else
				(a_value = erange_low_level)  or else
				(a_value = espace_low_level)  or else
				(a_value = badrpt_low_level)  or else
				(a_value = eend_low_level)  or else
				(a_value = esize_low_level)  or else
				(a_value = erparen_low_level) )
		end

feature -- Setters
	default_create,
	set_enosys is
		do
			value := enosys_low_level
		end

	set_noerror is
		do
			value := noerror_low_level
		end

	set_nomatch is
		do
			value := nomatch_low_level
		end

	set_badpat is
		do
			value := badpat_low_level
		end

	set_ecollate is
		do
			value := ecollate_low_level
		end

	set_ectype is
		do
			value := ectype_low_level
		end

	set_eescape is
		do
			value := eescape_low_level
		end

	set_esubreg is
		do
			value := esubreg_low_level
		end

	set_ebrack is
		do
			value := ebrack_low_level
		end

	set_eparen is
		do
			value := eparen_low_level
		end

	set_ebrace is
		do
			value := ebrace_low_level
		end

	set_badbr is
		do
			value := badbr_low_level
		end

	set_erange is
		do
			value := erange_low_level
		end

	set_espace is
		do
			value := espace_low_level
		end

	set_badrpt is
		do
			value := badrpt_low_level
		end

	set_eend is
		do
			value := eend_low_level
		end

	set_esize is
		do
			value := esize_low_level
		end

	set_erparen is
		do
			value := erparen_low_level
		end

feature -- Queries
	enosys: BOOLEAN is
		do
			Result := (value=enosys_low_level)
		end

	noerror: BOOLEAN is
		do
			Result := (value=noerror_low_level)
		end

	nomatch: BOOLEAN is
		do
			Result := (value=nomatch_low_level)
		end

	badpat: BOOLEAN is
		do
			Result := (value=badpat_low_level)
		end

	ecollate: BOOLEAN is
		do
			Result := (value=ecollate_low_level)
		end

	ectype: BOOLEAN is
		do
			Result := (value=ectype_low_level)
		end

	eescape: BOOLEAN is
		do
			Result := (value=eescape_low_level)
		end

	esubreg: BOOLEAN is
		do
			Result := (value=esubreg_low_level)
		end

	ebrack: BOOLEAN is
		do
			Result := (value=ebrack_low_level)
		end

	eparen: BOOLEAN is
		do
			Result := (value=eparen_low_level)
		end

	ebrace: BOOLEAN is
		do
			Result := (value=ebrace_low_level)
		end

	badbr: BOOLEAN is
		do
			Result := (value=badbr_low_level)
		end

	erange: BOOLEAN is
		do
			Result := (value=erange_low_level)
		end

	espace: BOOLEAN is
		do
			Result := (value=espace_low_level)
		end

	badrpt: BOOLEAN is
		do
			Result := (value=badrpt_low_level)
		end

	eend: BOOLEAN is
		do
			Result := (value=eend_low_level)
		end

	esize: BOOLEAN is
		do
			Result := (value=esize_low_level)
		end

	erparen: BOOLEAN is
		do
			Result := (value=erparen_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	enosys_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ENOSYS"
 			}"
 		end

	noerror_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_NOERROR"
 			}"
 		end

	nomatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_NOMATCH"
 			}"
 		end

	badpat_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_BADPAT"
 			}"
 		end

	ecollate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ECOLLATE"
 			}"
 		end

	ectype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ECTYPE"
 			}"
 		end

	eescape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_EESCAPE"
 			}"
 		end

	esubreg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ESUBREG"
 			}"
 		end

	ebrack_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_EBRACK"
 			}"
 		end

	eparen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_EPAREN"
 			}"
 		end

	ebrace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_EBRACE"
 			}"
 		end

	badbr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_BADBR"
 			}"
 		end

	erange_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ERANGE"
 			}"
 		end

	espace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ESPACE"
 			}"
 		end

	badrpt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_BADRPT"
 			}"
 		end

	eend_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_EEND"
 			}"
 		end

	esize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ESIZE"
 			}"
 		end

	erparen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ERPAREN"
 			}"
 		end


end -- class REG_ERRCODE_T_ENUM
