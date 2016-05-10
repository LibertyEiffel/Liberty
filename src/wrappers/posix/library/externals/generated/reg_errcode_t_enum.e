-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class REG_ERRCODE_T_ENUM

-- Wrapper of enum reg_errcode_t defined in file /usr/include/regex.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = badbr_low_level)  or else
				(a_value = badpat_low_level)  or else
				(a_value = badrpt_low_level)  or else
				(a_value = ebrace_low_level)  or else
				(a_value = ebrack_low_level)  or else
				(a_value = ecollate_low_level)  or else
				(a_value = ectype_low_level)  or else
				(a_value = eend_low_level)  or else
				(a_value = eescape_low_level)  or else
				(a_value = enosys_low_level)  or else
				(a_value = eparen_low_level)  or else
				(a_value = erange_low_level)  or else
				(a_value = erparen_low_level)  or else
				(a_value = esize_low_level)  or else
				(a_value = espace_low_level)  or else
				(a_value = esubreg_low_level)  or else
				(a_value = noerror_low_level)  or else
				(a_value = nomatch_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_badbr
               do
                       value := badbr_low_level
               end

	set_badpat
               do
                       value := badpat_low_level
               end

	set_badrpt
               do
                       value := badrpt_low_level
               end

	set_ebrace
               do
                       value := ebrace_low_level
               end

	set_ebrack
               do
                       value := ebrack_low_level
               end

	set_ecollate
               do
                       value := ecollate_low_level
               end

	set_ectype
               do
                       value := ectype_low_level
               end

	set_eend
               do
                       value := eend_low_level
               end

	set_eescape
               do
                       value := eescape_low_level
               end

	set_enosys
               do
                       value := enosys_low_level
               end

	set_eparen
               do
                       value := eparen_low_level
               end

	set_erange
               do
                       value := erange_low_level
               end

	set_erparen
               do
                       value := erparen_low_level
               end

	set_esize
               do
                       value := esize_low_level
               end

	set_espace
               do
                       value := espace_low_level
               end

	set_esubreg
               do
                       value := esubreg_low_level
               end

	set_noerror
               do
                       value := noerror_low_level
               end

	set_nomatch
               do
                       value := nomatch_low_level
               end

feature {ANY} -- Queries
       is_badbr: BOOLEAN
               do
                       Result := (value=badbr_low_level)
               end

       is_badpat: BOOLEAN
               do
                       Result := (value=badpat_low_level)
               end

       is_badrpt: BOOLEAN
               do
                       Result := (value=badrpt_low_level)
               end

       is_ebrace: BOOLEAN
               do
                       Result := (value=ebrace_low_level)
               end

       is_ebrack: BOOLEAN
               do
                       Result := (value=ebrack_low_level)
               end

       is_ecollate: BOOLEAN
               do
                       Result := (value=ecollate_low_level)
               end

       is_ectype: BOOLEAN
               do
                       Result := (value=ectype_low_level)
               end

       is_eend: BOOLEAN
               do
                       Result := (value=eend_low_level)
               end

       is_eescape: BOOLEAN
               do
                       Result := (value=eescape_low_level)
               end

       is_enosys: BOOLEAN
               do
                       Result := (value=enosys_low_level)
               end

       is_eparen: BOOLEAN
               do
                       Result := (value=eparen_low_level)
               end

       is_erange: BOOLEAN
               do
                       Result := (value=erange_low_level)
               end

       is_erparen: BOOLEAN
               do
                       Result := (value=erparen_low_level)
               end

       is_esize: BOOLEAN
               do
                       Result := (value=esize_low_level)
               end

       is_espace: BOOLEAN
               do
                       Result := (value=espace_low_level)
               end

       is_esubreg: BOOLEAN
               do
                       Result := (value=esubreg_low_level)
               end

       is_noerror: BOOLEAN
               do
                       Result := (value=noerror_low_level)
               end

       is_nomatch: BOOLEAN
               do
                       Result := (value=nomatch_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     badbr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_BADBR"
                       }"
               end

     badpat_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_BADPAT"
                       }"
               end

     badrpt_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_BADRPT"
                       }"
               end

     ebrace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_EBRACE"
                       }"
               end

     ebrack_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_EBRACK"
                       }"
               end

     ecollate_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_ECOLLATE"
                       }"
               end

     ectype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_ECTYPE"
                       }"
               end

     eend_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_EEND"
                       }"
               end

     eescape_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_EESCAPE"
                       }"
               end

     enosys_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_ENOSYS"
                       }"
               end

     eparen_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_EPAREN"
                       }"
               end

     erange_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_ERANGE"
                       }"
               end

     erparen_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_ERPAREN"
                       }"
               end

     esize_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_ESIZE"
                       }"
               end

     espace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_ESPACE"
                       }"
               end

     esubreg_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_ESUBREG"
                       }"
               end

     noerror_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_NOERROR"
                       }"
               end

     nomatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "REG_NOMATCH"
                       }"
               end


end -- class REG_ERRCODE_T_ENUM
