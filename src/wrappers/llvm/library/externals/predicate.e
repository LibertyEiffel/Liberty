-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class PREDICATE

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = fcmp_false) or else 
				(a_value = fcmp_oeq) or else 
				(a_value = fcmp_ogt) or else 
				(a_value = fcmp_oge) or else 
				(a_value = fcmp_olt) or else 
				(a_value = fcmp_ole) or else 
				(a_value = fcmp_one) or else 
				(a_value = fcmp_ord) or else 
				(a_value = fcmp_uno) or else 
				(a_value = fcmp_ueq) or else 
				(a_value = fcmp_ugt) or else 
				(a_value = fcmp_uge) or else 
				(a_value = fcmp_ult) or else 
				(a_value = fcmp_ule) or else 
				(a_value = fcmp_une) or else 
				(a_value = fcmp_true) or else 
				(a_value = first_fcmp_predicate) or else 
				(a_value = last_fcmp_predicate) or else 
				(a_value = bad_fcmp_predicate) or else 
				(a_value = icmp_eq) or else 
				(a_value = icmp_ne) or else 
				(a_value = icmp_ugt) or else 
				(a_value = icmp_uge) or else 
				(a_value = icmp_ult) or else 
				(a_value = icmp_ule) or else 
				(a_value = icmp_sgt) or else 
				(a_value = icmp_sge) or else 
				(a_value = icmp_slt) or else 
				(a_value = icmp_sle) or else 
				(a_value = first_icmp_predicate) or else 
				(a_value = last_icmp_predicate) or else 
				(a_value = bad_icmp_predicate))
		end

feature -- Setters
	default_create,  set_fcmp_false is
	
		do
			value := fcmp_false
		end

	 set_fcmp_oeq is
	
		do
			value := fcmp_oeq
		end

	 set_fcmp_ogt is
	
		do
			value := fcmp_ogt
		end

	 set_fcmp_oge is
	
		do
			value := fcmp_oge
		end

	 set_fcmp_olt is
	
		do
			value := fcmp_olt
		end

	 set_fcmp_ole is
	
		do
			value := fcmp_ole
		end

	 set_fcmp_one is
	
		do
			value := fcmp_one
		end

	 set_fcmp_ord is
	
		do
			value := fcmp_ord
		end

	 set_fcmp_uno is
	
		do
			value := fcmp_uno
		end

	 set_fcmp_ueq is
	
		do
			value := fcmp_ueq
		end

	 set_fcmp_ugt is
	
		do
			value := fcmp_ugt
		end

	 set_fcmp_uge is
	
		do
			value := fcmp_uge
		end

	 set_fcmp_ult is
	
		do
			value := fcmp_ult
		end

	 set_fcmp_ule is
	
		do
			value := fcmp_ule
		end

	 set_fcmp_une is
	
		do
			value := fcmp_une
		end

	 set_fcmp_true is
	
		do
			value := fcmp_true
		end

	 set_first_fcmp_predicate is
	
		do
			value := first_fcmp_predicate
		end

	 set_last_fcmp_predicate is
	
		do
			value := last_fcmp_predicate
		end

	 set_bad_fcmp_predicate is
	
		do
			value := bad_fcmp_predicate
		end

	 set_icmp_eq is
	
		do
			value := icmp_eq
		end

	 set_icmp_ne is
	
		do
			value := icmp_ne
		end

	 set_icmp_ugt is
	
		do
			value := icmp_ugt
		end

	 set_icmp_uge is
	
		do
			value := icmp_uge
		end

	 set_icmp_ult is
	
		do
			value := icmp_ult
		end

	 set_icmp_ule is
	
		do
			value := icmp_ule
		end

	 set_icmp_sgt is
	
		do
			value := icmp_sgt
		end

	 set_icmp_sge is
	
		do
			value := icmp_sge
		end

	 set_icmp_slt is
	
		do
			value := icmp_slt
		end

	 set_icmp_sle is
	
		do
			value := icmp_sle
		end

	 set_first_icmp_predicate is
	
		do
			value := first_icmp_predicate
		end

	 set_last_icmp_predicate is
	
		do
			value := last_icmp_predicate
		end

	 set_bad_icmp_predicate is
	
		do
			value := bad_icmp_predicate
		end

feature -- Queries
	is_fcmp_false: BOOLEAN is
		
		do
			Result := (value=fcmp_false)
		end

	is_fcmp_oeq: BOOLEAN is
		
		do
			Result := (value=fcmp_oeq)
		end

	is_fcmp_ogt: BOOLEAN is
		
		do
			Result := (value=fcmp_ogt)
		end

	is_fcmp_oge: BOOLEAN is
		
		do
			Result := (value=fcmp_oge)
		end

	is_fcmp_olt: BOOLEAN is
		
		do
			Result := (value=fcmp_olt)
		end

	is_fcmp_ole: BOOLEAN is
		
		do
			Result := (value=fcmp_ole)
		end

	is_fcmp_one: BOOLEAN is
		
		do
			Result := (value=fcmp_one)
		end

	is_fcmp_ord: BOOLEAN is
		
		do
			Result := (value=fcmp_ord)
		end

	is_fcmp_uno: BOOLEAN is
		
		do
			Result := (value=fcmp_uno)
		end

	is_fcmp_ueq: BOOLEAN is
		
		do
			Result := (value=fcmp_ueq)
		end

	is_fcmp_ugt: BOOLEAN is
		
		do
			Result := (value=fcmp_ugt)
		end

	is_fcmp_uge: BOOLEAN is
		
		do
			Result := (value=fcmp_uge)
		end

	is_fcmp_ult: BOOLEAN is
		
		do
			Result := (value=fcmp_ult)
		end

	is_fcmp_ule: BOOLEAN is
		
		do
			Result := (value=fcmp_ule)
		end

	is_fcmp_une: BOOLEAN is
		
		do
			Result := (value=fcmp_une)
		end

	is_fcmp_true: BOOLEAN is
		
		do
			Result := (value=fcmp_true)
		end

	is_first_fcmp_predicate: BOOLEAN is
		
		do
			Result := (value=first_fcmp_predicate)
		end

	is_last_fcmp_predicate: BOOLEAN is
		
		do
			Result := (value=last_fcmp_predicate)
		end

	is_bad_fcmp_predicate: BOOLEAN is
		
		do
			Result := (value=bad_fcmp_predicate)
		end

	is_icmp_eq: BOOLEAN is
		
		do
			Result := (value=icmp_eq)
		end

	is_icmp_ne: BOOLEAN is
		
		do
			Result := (value=icmp_ne)
		end

	is_icmp_ugt: BOOLEAN is
		
		do
			Result := (value=icmp_ugt)
		end

	is_icmp_uge: BOOLEAN is
		
		do
			Result := (value=icmp_uge)
		end

	is_icmp_ult: BOOLEAN is
		
		do
			Result := (value=icmp_ult)
		end

	is_icmp_ule: BOOLEAN is
		
		do
			Result := (value=icmp_ule)
		end

	is_icmp_sgt: BOOLEAN is
		
		do
			Result := (value=icmp_sgt)
		end

	is_icmp_sge: BOOLEAN is
		
		do
			Result := (value=icmp_sge)
		end

	is_icmp_slt: BOOLEAN is
		
		do
			Result := (value=icmp_slt)
		end

	is_icmp_sle: BOOLEAN is
		
		do
			Result := (value=icmp_sle)
		end

	is_first_icmp_predicate: BOOLEAN is
		
		do
			Result := (value=first_icmp_predicate)
		end

	is_last_icmp_predicate: BOOLEAN is
		
		do
			Result := (value=last_icmp_predicate)
		end

	is_bad_icmp_predicate: BOOLEAN is
		
		do
			Result := (value=bad_icmp_predicate)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	fcmp_false: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_FALSE"
 			}"
 		end

	fcmp_oeq: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_OEQ"
 			}"
 		end

	fcmp_ogt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_OGT"
 			}"
 		end

	fcmp_oge: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_OGE"
 			}"
 		end

	fcmp_olt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_OLT"
 			}"
 		end

	fcmp_ole: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_OLE"
 			}"
 		end

	fcmp_one: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_ONE"
 			}"
 		end

	fcmp_ord: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_ORD"
 			}"
 		end

	fcmp_uno: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_UNO"
 			}"
 		end

	fcmp_ueq: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_UEQ"
 			}"
 		end

	fcmp_ugt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_UGT"
 			}"
 		end

	fcmp_uge: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_UGE"
 			}"
 		end

	fcmp_ult: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_ULT"
 			}"
 		end

	fcmp_ule: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_ULE"
 			}"
 		end

	fcmp_une: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_UNE"
 			}"
 		end

	fcmp_true: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCMP_TRUE"
 			}"
 		end

	first_fcmp_predicate: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FIRST_FCMP_PREDICATE"
 			}"
 		end

	last_fcmp_predicate: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LAST_FCMP_PREDICATE"
 			}"
 		end

	bad_fcmp_predicate: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "BAD_FCMP_PREDICATE"
 			}"
 		end

	icmp_eq: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICMP_EQ"
 			}"
 		end

	icmp_ne: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICMP_NE"
 			}"
 		end

	icmp_ugt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICMP_UGT"
 			}"
 		end

	icmp_uge: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICMP_UGE"
 			}"
 		end

	icmp_ult: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICMP_ULT"
 			}"
 		end

	icmp_ule: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICMP_ULE"
 			}"
 		end

	icmp_sgt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICMP_SGT"
 			}"
 		end

	icmp_sge: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICMP_SGE"
 			}"
 		end

	icmp_slt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICMP_SLT"
 			}"
 		end

	icmp_sle: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICMP_SLE"
 			}"
 		end

	first_icmp_predicate: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FIRST_ICMP_PREDICATE"
 			}"
 		end

	last_icmp_predicate: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LAST_ICMP_PREDICATE"
 			}"
 		end

	bad_icmp_predicate: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "BAD_ICMP_PREDICATE"
 			}"
 		end

end

