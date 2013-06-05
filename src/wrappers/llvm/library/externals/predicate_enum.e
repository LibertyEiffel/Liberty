-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PREDICATE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = bad_fcmp_predicate_low_level)  or else
				(a_value = bad_icmp_predicate_low_level)  or else
				(a_value = fcmp_false_low_level)  or else
				(a_value = fcmp_oeq_low_level)  or else
				(a_value = fcmp_oge_low_level)  or else
				(a_value = fcmp_ogt_low_level)  or else
				(a_value = fcmp_ole_low_level)  or else
				(a_value = fcmp_olt_low_level)  or else
				(a_value = fcmp_one_low_level)  or else
				(a_value = fcmp_ord_low_level)  or else
				(a_value = fcmp_true_low_level)  or else
				(a_value = fcmp_ueq_low_level)  or else
				(a_value = fcmp_uge_low_level)  or else
				(a_value = fcmp_ugt_low_level)  or else
				(a_value = fcmp_ule_low_level)  or else
				(a_value = fcmp_ult_low_level)  or else
				(a_value = fcmp_une_low_level)  or else
				(a_value = fcmp_uno_low_level)  or else
				(a_value = first_fcmp_predicate_low_level)  or else
				(a_value = first_icmp_predicate_low_level)  or else
				(a_value = icmp_eq_low_level)  or else
				(a_value = icmp_ne_low_level)  or else
				(a_value = icmp_sge_low_level)  or else
				(a_value = icmp_sgt_low_level)  or else
				(a_value = icmp_sle_low_level)  or else
				(a_value = icmp_slt_low_level)  or else
				(a_value = icmp_uge_low_level)  or else
				(a_value = icmp_ugt_low_level)  or else
				(a_value = icmp_ule_low_level)  or else
				(a_value = icmp_ult_low_level)  or else
				(a_value = last_fcmp_predicate_low_level)  or else
				(a_value = last_icmp_predicate_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bad_fcmp_predicate is
		do
			value := bad_fcmp_predicate_low_level
		end

	set_bad_icmp_predicate is
		do
			value := bad_icmp_predicate_low_level
		end

	set_fcmp_false is
		do
			value := fcmp_false_low_level
		end

	set_fcmp_oeq is
		do
			value := fcmp_oeq_low_level
		end

	set_fcmp_oge is
		do
			value := fcmp_oge_low_level
		end

	set_fcmp_ogt is
		do
			value := fcmp_ogt_low_level
		end

	set_fcmp_ole is
		do
			value := fcmp_ole_low_level
		end

	set_fcmp_olt is
		do
			value := fcmp_olt_low_level
		end

	set_fcmp_one is
		do
			value := fcmp_one_low_level
		end

	set_fcmp_ord is
		do
			value := fcmp_ord_low_level
		end

	set_fcmp_true is
		do
			value := fcmp_true_low_level
		end

	set_fcmp_ueq is
		do
			value := fcmp_ueq_low_level
		end

	set_fcmp_uge is
		do
			value := fcmp_uge_low_level
		end

	set_fcmp_ugt is
		do
			value := fcmp_ugt_low_level
		end

	set_fcmp_ule is
		do
			value := fcmp_ule_low_level
		end

	set_fcmp_ult is
		do
			value := fcmp_ult_low_level
		end

	set_fcmp_une is
		do
			value := fcmp_une_low_level
		end

	set_fcmp_uno is
		do
			value := fcmp_uno_low_level
		end

	set_first_fcmp_predicate is
		do
			value := first_fcmp_predicate_low_level
		end

	set_first_icmp_predicate is
		do
			value := first_icmp_predicate_low_level
		end

	set_icmp_eq is
		do
			value := icmp_eq_low_level
		end

	set_icmp_ne is
		do
			value := icmp_ne_low_level
		end

	set_icmp_sge is
		do
			value := icmp_sge_low_level
		end

	set_icmp_sgt is
		do
			value := icmp_sgt_low_level
		end

	set_icmp_sle is
		do
			value := icmp_sle_low_level
		end

	set_icmp_slt is
		do
			value := icmp_slt_low_level
		end

	set_icmp_uge is
		do
			value := icmp_uge_low_level
		end

	set_icmp_ugt is
		do
			value := icmp_ugt_low_level
		end

	set_icmp_ule is
		do
			value := icmp_ule_low_level
		end

	set_icmp_ult is
		do
			value := icmp_ult_low_level
		end

	set_last_fcmp_predicate is
		do
			value := last_fcmp_predicate_low_level
		end

	set_last_icmp_predicate is
		do
			value := last_icmp_predicate_low_level
		end

feature {ANY} -- Queries
	is_bad_fcmp_predicate: BOOLEAN is
		do
			Result := (value=bad_fcmp_predicate_low_level)
		end

	is_bad_icmp_predicate: BOOLEAN is
		do
			Result := (value=bad_icmp_predicate_low_level)
		end

	is_fcmp_false: BOOLEAN is
		do
			Result := (value=fcmp_false_low_level)
		end

	is_fcmp_oeq: BOOLEAN is
		do
			Result := (value=fcmp_oeq_low_level)
		end

	is_fcmp_oge: BOOLEAN is
		do
			Result := (value=fcmp_oge_low_level)
		end

	is_fcmp_ogt: BOOLEAN is
		do
			Result := (value=fcmp_ogt_low_level)
		end

	is_fcmp_ole: BOOLEAN is
		do
			Result := (value=fcmp_ole_low_level)
		end

	is_fcmp_olt: BOOLEAN is
		do
			Result := (value=fcmp_olt_low_level)
		end

	is_fcmp_one: BOOLEAN is
		do
			Result := (value=fcmp_one_low_level)
		end

	is_fcmp_ord: BOOLEAN is
		do
			Result := (value=fcmp_ord_low_level)
		end

	is_fcmp_true: BOOLEAN is
		do
			Result := (value=fcmp_true_low_level)
		end

	is_fcmp_ueq: BOOLEAN is
		do
			Result := (value=fcmp_ueq_low_level)
		end

	is_fcmp_uge: BOOLEAN is
		do
			Result := (value=fcmp_uge_low_level)
		end

	is_fcmp_ugt: BOOLEAN is
		do
			Result := (value=fcmp_ugt_low_level)
		end

	is_fcmp_ule: BOOLEAN is
		do
			Result := (value=fcmp_ule_low_level)
		end

	is_fcmp_ult: BOOLEAN is
		do
			Result := (value=fcmp_ult_low_level)
		end

	is_fcmp_une: BOOLEAN is
		do
			Result := (value=fcmp_une_low_level)
		end

	is_fcmp_uno: BOOLEAN is
		do
			Result := (value=fcmp_uno_low_level)
		end

	is_first_fcmp_predicate: BOOLEAN is
		do
			Result := (value=first_fcmp_predicate_low_level)
		end

	is_first_icmp_predicate: BOOLEAN is
		do
			Result := (value=first_icmp_predicate_low_level)
		end

	is_icmp_eq: BOOLEAN is
		do
			Result := (value=icmp_eq_low_level)
		end

	is_icmp_ne: BOOLEAN is
		do
			Result := (value=icmp_ne_low_level)
		end

	is_icmp_sge: BOOLEAN is
		do
			Result := (value=icmp_sge_low_level)
		end

	is_icmp_sgt: BOOLEAN is
		do
			Result := (value=icmp_sgt_low_level)
		end

	is_icmp_sle: BOOLEAN is
		do
			Result := (value=icmp_sle_low_level)
		end

	is_icmp_slt: BOOLEAN is
		do
			Result := (value=icmp_slt_low_level)
		end

	is_icmp_uge: BOOLEAN is
		do
			Result := (value=icmp_uge_low_level)
		end

	is_icmp_ugt: BOOLEAN is
		do
			Result := (value=icmp_ugt_low_level)
		end

	is_icmp_ule: BOOLEAN is
		do
			Result := (value=icmp_ule_low_level)
		end

	is_icmp_ult: BOOLEAN is
		do
			Result := (value=icmp_ult_low_level)
		end

	is_last_fcmp_predicate: BOOLEAN is
		do
			Result := (value=last_fcmp_predicate_low_level)
		end

	is_last_icmp_predicate: BOOLEAN is
		do
			Result := (value=last_icmp_predicate_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	bad_fcmp_predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BAD_FCMP_PREDICATE"
 			}"
 		end

	bad_icmp_predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "BAD_ICMP_PREDICATE"
 			}"
 		end

	fcmp_false_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_FALSE"
 			}"
 		end

	fcmp_oeq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_OEQ"
 			}"
 		end

	fcmp_oge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_OGE"
 			}"
 		end

	fcmp_ogt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_OGT"
 			}"
 		end

	fcmp_ole_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_OLE"
 			}"
 		end

	fcmp_olt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_OLT"
 			}"
 		end

	fcmp_one_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_ONE"
 			}"
 		end

	fcmp_ord_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_ORD"
 			}"
 		end

	fcmp_true_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_TRUE"
 			}"
 		end

	fcmp_ueq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_UEQ"
 			}"
 		end

	fcmp_uge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_UGE"
 			}"
 		end

	fcmp_ugt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_UGT"
 			}"
 		end

	fcmp_ule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_ULE"
 			}"
 		end

	fcmp_ult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_ULT"
 			}"
 		end

	fcmp_une_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_UNE"
 			}"
 		end

	fcmp_uno_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCMP_UNO"
 			}"
 		end

	first_fcmp_predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FIRST_FCMP_PREDICATE"
 			}"
 		end

	first_icmp_predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FIRST_ICMP_PREDICATE"
 			}"
 		end

	icmp_eq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICMP_EQ"
 			}"
 		end

	icmp_ne_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICMP_NE"
 			}"
 		end

	icmp_sge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICMP_SGE"
 			}"
 		end

	icmp_sgt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICMP_SGT"
 			}"
 		end

	icmp_sle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICMP_SLE"
 			}"
 		end

	icmp_slt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICMP_SLT"
 			}"
 		end

	icmp_uge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICMP_UGE"
 			}"
 		end

	icmp_ugt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICMP_UGT"
 			}"
 		end

	icmp_ule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICMP_ULE"
 			}"
 		end

	icmp_ult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICMP_ULT"
 			}"
 		end

	last_fcmp_predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LAST_FCMP_PREDICATE"
 			}"
 		end

	last_icmp_predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LAST_ICMP_PREDICATE"
 			}"
 		end


end -- class PREDICATE_ENUM
