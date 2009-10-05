-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PREDICATE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = fcmp__false_low_level)  or else
				(a_value = fcmp__ogt_low_level)  or else
				(a_value = fcmp__oge_low_level)  or else
				(a_value = fcmp__olt_low_level)  or else
				(a_value = fcmp__ole_low_level)  or else
				(a_value = fcmp__one_low_level)  or else
				(a_value = fcmp__ord_low_level)  or else
				(a_value = fcmp__uno_low_level)  or else
				(a_value = fcmp__ueq_low_level)  or else
				(a_value = fcmp__ugt_low_level)  or else
				(a_value = fcmp__uge_low_level)  or else
				(a_value = fcmp__ult_low_level)  or else
				(a_value = fcmp__ule_low_level)  or else
				(a_value = fcmp__une_low_level)  or else
				(a_value = fcmp__true_low_level)  or else
				(a_value = first__fcmp__predicate_low_level)  or else
				(a_value = last__fcmp__predicate_low_level)  or else
				(a_value = bad__fcmp__predicate_low_level)  or else
				(a_value = icmp__eq_low_level)  or else
				(a_value = icmp__ne_low_level)  or else
				(a_value = icmp__ugt_low_level)  or else
				(a_value = icmp__uge_low_level)  or else
				(a_value = icmp__ult_low_level)  or else
				(a_value = icmp__ule_low_level)  or else
				(a_value = icmp__sgt_low_level)  or else
				(a_value = icmp__sge_low_level)  or else
				(a_value = icmp__slt_low_level)  or else
				(a_value = icmp__sle_low_level)  or else
				(a_value = first__icmp__predicate_low_level)  or else
				(a_value = last__icmp__predicate_low_level)  or else
				(a_value = bad__icmp__predicate_low_level) )
		end

feature -- Setters
	default_create,
	set_fcmp__false is
		do
			value := fcmp__false_low_level
		end

	set_fcmp__ogt is
		do
			value := fcmp__ogt_low_level
		end

	set_fcmp__oge is
		do
			value := fcmp__oge_low_level
		end

	set_fcmp__olt is
		do
			value := fcmp__olt_low_level
		end

	set_fcmp__ole is
		do
			value := fcmp__ole_low_level
		end

	set_fcmp__one is
		do
			value := fcmp__one_low_level
		end

	set_fcmp__ord is
		do
			value := fcmp__ord_low_level
		end

	set_fcmp__uno is
		do
			value := fcmp__uno_low_level
		end

	set_fcmp__ueq is
		do
			value := fcmp__ueq_low_level
		end

	set_fcmp__ugt is
		do
			value := fcmp__ugt_low_level
		end

	set_fcmp__uge is
		do
			value := fcmp__uge_low_level
		end

	set_fcmp__ult is
		do
			value := fcmp__ult_low_level
		end

	set_fcmp__ule is
		do
			value := fcmp__ule_low_level
		end

	set_fcmp__une is
		do
			value := fcmp__une_low_level
		end

	set_fcmp__true is
		do
			value := fcmp__true_low_level
		end

	set_first__fcmp__predicate is
		do
			value := first__fcmp__predicate_low_level
		end

	set_last__fcmp__predicate is
		do
			value := last__fcmp__predicate_low_level
		end

	set_bad__fcmp__predicate is
		do
			value := bad__fcmp__predicate_low_level
		end

	set_icmp__eq is
		do
			value := icmp__eq_low_level
		end

	set_icmp__ne is
		do
			value := icmp__ne_low_level
		end

	set_icmp__ugt is
		do
			value := icmp__ugt_low_level
		end

	set_icmp__uge is
		do
			value := icmp__uge_low_level
		end

	set_icmp__ult is
		do
			value := icmp__ult_low_level
		end

	set_icmp__ule is
		do
			value := icmp__ule_low_level
		end

	set_icmp__sgt is
		do
			value := icmp__sgt_low_level
		end

	set_icmp__sge is
		do
			value := icmp__sge_low_level
		end

	set_icmp__slt is
		do
			value := icmp__slt_low_level
		end

	set_icmp__sle is
		do
			value := icmp__sle_low_level
		end

	set_first__icmp__predicate is
		do
			value := first__icmp__predicate_low_level
		end

	set_last__icmp__predicate is
		do
			value := last__icmp__predicate_low_level
		end

	set_bad__icmp__predicate is
		do
			value := bad__icmp__predicate_low_level
		end

feature -- Queries
	is_fcmp__false: BOOLEAN is
		do
			Result := (value=fcmp__false_low_level)
		end

	is_fcmp__ogt: BOOLEAN is
		do
			Result := (value=fcmp__ogt_low_level)
		end

	is_fcmp__oge: BOOLEAN is
		do
			Result := (value=fcmp__oge_low_level)
		end

	is_fcmp__olt: BOOLEAN is
		do
			Result := (value=fcmp__olt_low_level)
		end

	is_fcmp__ole: BOOLEAN is
		do
			Result := (value=fcmp__ole_low_level)
		end

	is_fcmp__one: BOOLEAN is
		do
			Result := (value=fcmp__one_low_level)
		end

	is_fcmp__ord: BOOLEAN is
		do
			Result := (value=fcmp__ord_low_level)
		end

	is_fcmp__uno: BOOLEAN is
		do
			Result := (value=fcmp__uno_low_level)
		end

	is_fcmp__ueq: BOOLEAN is
		do
			Result := (value=fcmp__ueq_low_level)
		end

	is_fcmp__ugt: BOOLEAN is
		do
			Result := (value=fcmp__ugt_low_level)
		end

	is_fcmp__uge: BOOLEAN is
		do
			Result := (value=fcmp__uge_low_level)
		end

	is_fcmp__ult: BOOLEAN is
		do
			Result := (value=fcmp__ult_low_level)
		end

	is_fcmp__ule: BOOLEAN is
		do
			Result := (value=fcmp__ule_low_level)
		end

	is_fcmp__une: BOOLEAN is
		do
			Result := (value=fcmp__une_low_level)
		end

	is_fcmp__true: BOOLEAN is
		do
			Result := (value=fcmp__true_low_level)
		end

	is_first__fcmp__predicate: BOOLEAN is
		do
			Result := (value=first__fcmp__predicate_low_level)
		end

	is_last__fcmp__predicate: BOOLEAN is
		do
			Result := (value=last__fcmp__predicate_low_level)
		end

	is_bad__fcmp__predicate: BOOLEAN is
		do
			Result := (value=bad__fcmp__predicate_low_level)
		end

	is_icmp__eq: BOOLEAN is
		do
			Result := (value=icmp__eq_low_level)
		end

	is_icmp__ne: BOOLEAN is
		do
			Result := (value=icmp__ne_low_level)
		end

	is_icmp__ugt: BOOLEAN is
		do
			Result := (value=icmp__ugt_low_level)
		end

	is_icmp__uge: BOOLEAN is
		do
			Result := (value=icmp__uge_low_level)
		end

	is_icmp__ult: BOOLEAN is
		do
			Result := (value=icmp__ult_low_level)
		end

	is_icmp__ule: BOOLEAN is
		do
			Result := (value=icmp__ule_low_level)
		end

	is_icmp__sgt: BOOLEAN is
		do
			Result := (value=icmp__sgt_low_level)
		end

	is_icmp__sge: BOOLEAN is
		do
			Result := (value=icmp__sge_low_level)
		end

	is_icmp__slt: BOOLEAN is
		do
			Result := (value=icmp__slt_low_level)
		end

	is_icmp__sle: BOOLEAN is
		do
			Result := (value=icmp__sle_low_level)
		end

	is_first__icmp__predicate: BOOLEAN is
		do
			Result := (value=first__icmp__predicate_low_level)
		end

	is_last__icmp__predicate: BOOLEAN is
		do
			Result := (value=last__icmp__predicate_low_level)
		end

	is_bad__icmp__predicate: BOOLEAN is
		do
			Result := (value=bad__icmp__predicate_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	fcmp__false_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_FALSE"
 			}"
 		end

	fcmp__ogt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_OGT"
 			}"
 		end

	fcmp__oge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_OGE"
 			}"
 		end

	fcmp__olt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_OLT"
 			}"
 		end

	fcmp__ole_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_OLE"
 			}"
 		end

	fcmp__one_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_ONE"
 			}"
 		end

	fcmp__ord_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_ORD"
 			}"
 		end

	fcmp__uno_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_UNO"
 			}"
 		end

	fcmp__ueq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_UEQ"
 			}"
 		end

	fcmp__ugt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_UGT"
 			}"
 		end

	fcmp__uge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_UGE"
 			}"
 		end

	fcmp__ult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_ULT"
 			}"
 		end

	fcmp__ule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_ULE"
 			}"
 		end

	fcmp__une_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_UNE"
 			}"
 		end

	fcmp__true_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCMP_TRUE"
 			}"
 		end

	first__fcmp__predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FIRST_FCMP_PREDICATE"
 			}"
 		end

	last__fcmp__predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LAST_FCMP_PREDICATE"
 			}"
 		end

	bad__fcmp__predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "BAD_FCMP_PREDICATE"
 			}"
 		end

	icmp__eq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ICMP_EQ"
 			}"
 		end

	icmp__ne_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ICMP_NE"
 			}"
 		end

	icmp__ugt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ICMP_UGT"
 			}"
 		end

	icmp__uge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ICMP_UGE"
 			}"
 		end

	icmp__ult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ICMP_ULT"
 			}"
 		end

	icmp__ule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ICMP_ULE"
 			}"
 		end

	icmp__sgt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ICMP_SGT"
 			}"
 		end

	icmp__sge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ICMP_SGE"
 			}"
 		end

	icmp__slt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ICMP_SLT"
 			}"
 		end

	icmp__sle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ICMP_SLE"
 			}"
 		end

	first__icmp__predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FIRST_ICMP_PREDICATE"
 			}"
 		end

	last__icmp__predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LAST_ICMP_PREDICATE"
 			}"
 		end

	bad__icmp__predicate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "BAD_ICMP_PREDICATE"
 			}"
 		end


end -- class PREDICATE_ENUM
