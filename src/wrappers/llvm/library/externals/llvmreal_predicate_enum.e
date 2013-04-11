-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMREAL_PREDICATE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = predicate_false_low_level)  or else
				(a_value = oeq_low_level)  or else
				(a_value = ogt_low_level)  or else
				(a_value = oge_low_level)  or else
				(a_value = olt_low_level)  or else
				(a_value = ole_low_level)  or else
				(a_value = one_low_level)  or else
				(a_value = ord_low_level)  or else
				(a_value = uno_low_level)  or else
				(a_value = ueq_low_level)  or else
				(a_value = ugt_low_level)  or else
				(a_value = uge_low_level)  or else
				(a_value = ult_low_level)  or else
				(a_value = ule_low_level)  or else
				(a_value = une_low_level)  or else
				(a_value = predicate_true_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_predicate_false is
		do
			value := predicate_false_low_level
		end

	set_oeq is
		do
			value := oeq_low_level
		end

	set_ogt is
		do
			value := ogt_low_level
		end

	set_oge is
		do
			value := oge_low_level
		end

	set_olt is
		do
			value := olt_low_level
		end

	set_ole is
		do
			value := ole_low_level
		end

	set_one is
		do
			value := one_low_level
		end

	set_ord is
		do
			value := ord_low_level
		end

	set_uno is
		do
			value := uno_low_level
		end

	set_ueq is
		do
			value := ueq_low_level
		end

	set_ugt is
		do
			value := ugt_low_level
		end

	set_uge is
		do
			value := uge_low_level
		end

	set_ult is
		do
			value := ult_low_level
		end

	set_ule is
		do
			value := ule_low_level
		end

	set_une is
		do
			value := une_low_level
		end

	set_predicate_true is
		do
			value := predicate_true_low_level
		end

feature {ANY} -- Queries
	predicate_false: BOOLEAN is
		do
			Result := (value=predicate_false_low_level)
		end

	oeq: BOOLEAN is
		do
			Result := (value=oeq_low_level)
		end

	ogt: BOOLEAN is
		do
			Result := (value=ogt_low_level)
		end

	oge: BOOLEAN is
		do
			Result := (value=oge_low_level)
		end

	olt: BOOLEAN is
		do
			Result := (value=olt_low_level)
		end

	ole: BOOLEAN is
		do
			Result := (value=ole_low_level)
		end

	one: BOOLEAN is
		do
			Result := (value=one_low_level)
		end

	ord: BOOLEAN is
		do
			Result := (value=ord_low_level)
		end

	uno: BOOLEAN is
		do
			Result := (value=uno_low_level)
		end

	ueq: BOOLEAN is
		do
			Result := (value=ueq_low_level)
		end

	ugt: BOOLEAN is
		do
			Result := (value=ugt_low_level)
		end

	uge: BOOLEAN is
		do
			Result := (value=uge_low_level)
		end

	ult: BOOLEAN is
		do
			Result := (value=ult_low_level)
		end

	ule: BOOLEAN is
		do
			Result := (value=ule_low_level)
		end

	une: BOOLEAN is
		do
			Result := (value=une_low_level)
		end

	predicate_true: BOOLEAN is
		do
			Result := (value=predicate_true_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	predicate_false_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealPredicateFalse"
 			}"
 		end

	oeq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOEQ"
 			}"
 		end

	ogt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOGT"
 			}"
 		end

	oge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOGE"
 			}"
 		end

	olt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOLT"
 			}"
 		end

	ole_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOLE"
 			}"
 		end

	one_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealONE"
 			}"
 		end

	ord_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealORD"
 			}"
 		end

	uno_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUNO"
 			}"
 		end

	ueq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUEQ"
 			}"
 		end

	ugt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUGT"
 			}"
 		end

	uge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUGE"
 			}"
 		end

	ult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealULT"
 			}"
 		end

	ule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealULE"
 			}"
 		end

	une_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUNE"
 			}"
 		end

	predicate_true_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealPredicateTrue"
 			}"
 		end


end -- class LLVMREAL_PREDICATE_ENUM
