-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMREAL_PREDICATE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = oeq_low_level)  or else
				(a_value = oge_low_level)  or else
				(a_value = ogt_low_level)  or else
				(a_value = ole_low_level)  or else
				(a_value = olt_low_level)  or else
				(a_value = one_low_level)  or else
				(a_value = ord_low_level)  or else
				(a_value = predicate_false_low_level)  or else
				(a_value = predicate_true_low_level)  or else
				(a_value = ueq_low_level)  or else
				(a_value = uge_low_level)  or else
				(a_value = ugt_low_level)  or else
				(a_value = ule_low_level)  or else
				(a_value = ult_low_level)  or else
				(a_value = une_low_level)  or else
				(a_value = uno_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_oeq
		do
			value := oeq_low_level
		end

	set_oge
		do
			value := oge_low_level
		end

	set_ogt
		do
			value := ogt_low_level
		end

	set_ole
		do
			value := ole_low_level
		end

	set_olt
		do
			value := olt_low_level
		end

	set_one
		do
			value := one_low_level
		end

	set_ord
		do
			value := ord_low_level
		end

	set_predicate_false
		do
			value := predicate_false_low_level
		end

	set_predicate_true
		do
			value := predicate_true_low_level
		end

	set_ueq
		do
			value := ueq_low_level
		end

	set_uge
		do
			value := uge_low_level
		end

	set_ugt
		do
			value := ugt_low_level
		end

	set_ule
		do
			value := ule_low_level
		end

	set_ult
		do
			value := ult_low_level
		end

	set_une
		do
			value := une_low_level
		end

	set_uno
		do
			value := uno_low_level
		end

feature {ANY} -- Queries
	is_oeq: BOOLEAN
		do
			Result := (value=oeq_low_level)
		end

	is_oge: BOOLEAN
		do
			Result := (value=oge_low_level)
		end

	is_ogt: BOOLEAN
		do
			Result := (value=ogt_low_level)
		end

	is_ole: BOOLEAN
		do
			Result := (value=ole_low_level)
		end

	is_olt: BOOLEAN
		do
			Result := (value=olt_low_level)
		end

	is_one: BOOLEAN
		do
			Result := (value=one_low_level)
		end

	is_ord: BOOLEAN
		do
			Result := (value=ord_low_level)
		end

	is_predicate_false: BOOLEAN
		do
			Result := (value=predicate_false_low_level)
		end

	is_predicate_true: BOOLEAN
		do
			Result := (value=predicate_true_low_level)
		end

	is_ueq: BOOLEAN
		do
			Result := (value=ueq_low_level)
		end

	is_uge: BOOLEAN
		do
			Result := (value=uge_low_level)
		end

	is_ugt: BOOLEAN
		do
			Result := (value=ugt_low_level)
		end

	is_ule: BOOLEAN
		do
			Result := (value=ule_low_level)
		end

	is_ult: BOOLEAN
		do
			Result := (value=ult_low_level)
		end

	is_une: BOOLEAN
		do
			Result := (value=une_low_level)
		end

	is_uno: BOOLEAN
		do
			Result := (value=uno_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	oeq_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOEQ"
 			}"
 		end

	oge_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOGE"
 			}"
 		end

	ogt_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOGT"
 			}"
 		end

	ole_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOLE"
 			}"
 		end

	olt_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealOLT"
 			}"
 		end

	one_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealONE"
 			}"
 		end

	ord_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealORD"
 			}"
 		end

	predicate_false_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealPredicateFalse"
 			}"
 		end

	predicate_true_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealPredicateTrue"
 			}"
 		end

	ueq_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUEQ"
 			}"
 		end

	uge_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUGE"
 			}"
 		end

	ugt_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUGT"
 			}"
 		end

	ule_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealULE"
 			}"
 		end

	ult_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealULT"
 			}"
 		end

	une_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUNE"
 			}"
 		end

	uno_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMRealUNO"
 			}"
 		end


end -- class LLVMREAL_PREDICATE_ENUM
