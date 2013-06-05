-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMREAL_PREDICATE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = llvmreal_oeq_low_level)  or else
				(a_value = llvmreal_oge_low_level)  or else
				(a_value = llvmreal_ogt_low_level)  or else
				(a_value = llvmreal_ole_low_level)  or else
				(a_value = llvmreal_olt_low_level)  or else
				(a_value = llvmreal_one_low_level)  or else
				(a_value = llvmreal_ord_low_level)  or else
				(a_value = llvmreal_predicate_false_low_level)  or else
				(a_value = llvmreal_predicate_true_low_level)  or else
				(a_value = llvmreal_ueq_low_level)  or else
				(a_value = llvmreal_uge_low_level)  or else
				(a_value = llvmreal_ugt_low_level)  or else
				(a_value = llvmreal_ule_low_level)  or else
				(a_value = llvmreal_ult_low_level)  or else
				(a_value = llvmreal_une_low_level)  or else
				(a_value = llvmreal_uno_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_llvmreal_oeq is
		do
			value := llvmreal_oeq_low_level
		end

	set_llvmreal_oge is
		do
			value := llvmreal_oge_low_level
		end

	set_llvmreal_ogt is
		do
			value := llvmreal_ogt_low_level
		end

	set_llvmreal_ole is
		do
			value := llvmreal_ole_low_level
		end

	set_llvmreal_olt is
		do
			value := llvmreal_olt_low_level
		end

	set_llvmreal_one is
		do
			value := llvmreal_one_low_level
		end

	set_llvmreal_ord is
		do
			value := llvmreal_ord_low_level
		end

	set_llvmreal_predicate_false is
		do
			value := llvmreal_predicate_false_low_level
		end

	set_llvmreal_predicate_true is
		do
			value := llvmreal_predicate_true_low_level
		end

	set_llvmreal_ueq is
		do
			value := llvmreal_ueq_low_level
		end

	set_llvmreal_uge is
		do
			value := llvmreal_uge_low_level
		end

	set_llvmreal_ugt is
		do
			value := llvmreal_ugt_low_level
		end

	set_llvmreal_ule is
		do
			value := llvmreal_ule_low_level
		end

	set_llvmreal_ult is
		do
			value := llvmreal_ult_low_level
		end

	set_llvmreal_une is
		do
			value := llvmreal_une_low_level
		end

	set_llvmreal_uno is
		do
			value := llvmreal_uno_low_level
		end

feature {ANY} -- Queries
	is_llvmreal_oeq: BOOLEAN is
		do
			Result := (value=llvmreal_oeq_low_level)
		end

	is_llvmreal_oge: BOOLEAN is
		do
			Result := (value=llvmreal_oge_low_level)
		end

	is_llvmreal_ogt: BOOLEAN is
		do
			Result := (value=llvmreal_ogt_low_level)
		end

	is_llvmreal_ole: BOOLEAN is
		do
			Result := (value=llvmreal_ole_low_level)
		end

	is_llvmreal_olt: BOOLEAN is
		do
			Result := (value=llvmreal_olt_low_level)
		end

	is_llvmreal_one: BOOLEAN is
		do
			Result := (value=llvmreal_one_low_level)
		end

	is_llvmreal_ord: BOOLEAN is
		do
			Result := (value=llvmreal_ord_low_level)
		end

	is_llvmreal_predicate_false: BOOLEAN is
		do
			Result := (value=llvmreal_predicate_false_low_level)
		end

	is_llvmreal_predicate_true: BOOLEAN is
		do
			Result := (value=llvmreal_predicate_true_low_level)
		end

	is_llvmreal_ueq: BOOLEAN is
		do
			Result := (value=llvmreal_ueq_low_level)
		end

	is_llvmreal_uge: BOOLEAN is
		do
			Result := (value=llvmreal_uge_low_level)
		end

	is_llvmreal_ugt: BOOLEAN is
		do
			Result := (value=llvmreal_ugt_low_level)
		end

	is_llvmreal_ule: BOOLEAN is
		do
			Result := (value=llvmreal_ule_low_level)
		end

	is_llvmreal_ult: BOOLEAN is
		do
			Result := (value=llvmreal_ult_low_level)
		end

	is_llvmreal_une: BOOLEAN is
		do
			Result := (value=llvmreal_une_low_level)
		end

	is_llvmreal_uno: BOOLEAN is
		do
			Result := (value=llvmreal_uno_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmreal_oeq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOEQ"
 			}"
 		end

	llvmreal_oge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOGE"
 			}"
 		end

	llvmreal_ogt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOGT"
 			}"
 		end

	llvmreal_ole_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOLE"
 			}"
 		end

	llvmreal_olt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOLT"
 			}"
 		end

	llvmreal_one_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealONE"
 			}"
 		end

	llvmreal_ord_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealORD"
 			}"
 		end

	llvmreal_predicate_false_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealPredicateFalse"
 			}"
 		end

	llvmreal_predicate_true_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealPredicateTrue"
 			}"
 		end

	llvmreal_ueq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUEQ"
 			}"
 		end

	llvmreal_uge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUGE"
 			}"
 		end

	llvmreal_ugt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUGT"
 			}"
 		end

	llvmreal_ule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealULE"
 			}"
 		end

	llvmreal_ult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealULT"
 			}"
 		end

	llvmreal_une_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUNE"
 			}"
 		end

	llvmreal_uno_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUNO"
 			}"
 		end


end -- class LLVMREAL_PREDICATE_ENUM
