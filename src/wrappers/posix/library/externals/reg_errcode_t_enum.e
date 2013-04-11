-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class REG_ERRCODE_T_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = reg_badbr_low_level)  or else
				(a_value = reg_badpat_low_level)  or else
				(a_value = reg_badrpt_low_level)  or else
				(a_value = reg_ebrace_low_level)  or else
				(a_value = reg_ebrack_low_level)  or else
				(a_value = reg_ecollate_low_level)  or else
				(a_value = reg_ectype_low_level)  or else
				(a_value = reg_eend_low_level)  or else
				(a_value = reg_eescape_low_level)  or else
				(a_value = reg_enosys_low_level)  or else
				(a_value = reg_eparen_low_level)  or else
				(a_value = reg_erange_low_level)  or else
				(a_value = reg_erparen_low_level)  or else
				(a_value = reg_esize_low_level)  or else
				(a_value = reg_espace_low_level)  or else
				(a_value = reg_esubreg_low_level)  or else
				(a_value = reg_noerror_low_level)  or else
				(a_value = reg_nomatch_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_reg_badbr is
		do
			value := reg_badbr_low_level
		end

	set_reg_badpat is
		do
			value := reg_badpat_low_level
		end

	set_reg_badrpt is
		do
			value := reg_badrpt_low_level
		end

	set_reg_ebrace is
		do
			value := reg_ebrace_low_level
		end

	set_reg_ebrack is
		do
			value := reg_ebrack_low_level
		end

	set_reg_ecollate is
		do
			value := reg_ecollate_low_level
		end

	set_reg_ectype is
		do
			value := reg_ectype_low_level
		end

	set_reg_eend is
		do
			value := reg_eend_low_level
		end

	set_reg_eescape is
		do
			value := reg_eescape_low_level
		end

	set_reg_enosys is
		do
			value := reg_enosys_low_level
		end

	set_reg_eparen is
		do
			value := reg_eparen_low_level
		end

	set_reg_erange is
		do
			value := reg_erange_low_level
		end

	set_reg_erparen is
		do
			value := reg_erparen_low_level
		end

	set_reg_esize is
		do
			value := reg_esize_low_level
		end

	set_reg_espace is
		do
			value := reg_espace_low_level
		end

	set_reg_esubreg is
		do
			value := reg_esubreg_low_level
		end

	set_reg_noerror is
		do
			value := reg_noerror_low_level
		end

	set_reg_nomatch is
		do
			value := reg_nomatch_low_level
		end

feature {ANY} -- Queries
	is_reg_badbr: BOOLEAN is
		do
			Result := (value=reg_badbr_low_level)
		end

	is_reg_badpat: BOOLEAN is
		do
			Result := (value=reg_badpat_low_level)
		end

	is_reg_badrpt: BOOLEAN is
		do
			Result := (value=reg_badrpt_low_level)
		end

	is_reg_ebrace: BOOLEAN is
		do
			Result := (value=reg_ebrace_low_level)
		end

	is_reg_ebrack: BOOLEAN is
		do
			Result := (value=reg_ebrack_low_level)
		end

	is_reg_ecollate: BOOLEAN is
		do
			Result := (value=reg_ecollate_low_level)
		end

	is_reg_ectype: BOOLEAN is
		do
			Result := (value=reg_ectype_low_level)
		end

	is_reg_eend: BOOLEAN is
		do
			Result := (value=reg_eend_low_level)
		end

	is_reg_eescape: BOOLEAN is
		do
			Result := (value=reg_eescape_low_level)
		end

	is_reg_enosys: BOOLEAN is
		do
			Result := (value=reg_enosys_low_level)
		end

	is_reg_eparen: BOOLEAN is
		do
			Result := (value=reg_eparen_low_level)
		end

	is_reg_erange: BOOLEAN is
		do
			Result := (value=reg_erange_low_level)
		end

	is_reg_erparen: BOOLEAN is
		do
			Result := (value=reg_erparen_low_level)
		end

	is_reg_esize: BOOLEAN is
		do
			Result := (value=reg_esize_low_level)
		end

	is_reg_espace: BOOLEAN is
		do
			Result := (value=reg_espace_low_level)
		end

	is_reg_esubreg: BOOLEAN is
		do
			Result := (value=reg_esubreg_low_level)
		end

	is_reg_noerror: BOOLEAN is
		do
			Result := (value=reg_noerror_low_level)
		end

	is_reg_nomatch: BOOLEAN is
		do
			Result := (value=reg_nomatch_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	reg_badbr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_BADBR"
 			}"
 		end

	reg_badpat_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_BADPAT"
 			}"
 		end

	reg_badrpt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_BADRPT"
 			}"
 		end

	reg_ebrace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_EBRACE"
 			}"
 		end

	reg_ebrack_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_EBRACK"
 			}"
 		end

	reg_ecollate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ECOLLATE"
 			}"
 		end

	reg_ectype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ECTYPE"
 			}"
 		end

	reg_eend_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_EEND"
 			}"
 		end

	reg_eescape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_EESCAPE"
 			}"
 		end

	reg_enosys_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ENOSYS"
 			}"
 		end

	reg_eparen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_EPAREN"
 			}"
 		end

	reg_erange_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ERANGE"
 			}"
 		end

	reg_erparen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ERPAREN"
 			}"
 		end

	reg_esize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ESIZE"
 			}"
 		end

	reg_espace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ESPACE"
 			}"
 		end

	reg_esubreg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_ESUBREG"
 			}"
 		end

	reg_noerror_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_NOERROR"
 			}"
 		end

	reg_nomatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "REG_NOMATCH"
 			}"
 		end


end -- class REG_ERRCODE_T_ENUM
