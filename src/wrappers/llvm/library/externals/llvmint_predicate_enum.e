-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMINT_PREDICATE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = llvmint_eq_low_level)  or else
				(a_value = llvmint_ne_low_level)  or else
				(a_value = llvmint_sge_low_level)  or else
				(a_value = llvmint_sgt_low_level)  or else
				(a_value = llvmint_sle_low_level)  or else
				(a_value = llvmint_slt_low_level)  or else
				(a_value = llvmint_uge_low_level)  or else
				(a_value = llvmint_ugt_low_level)  or else
				(a_value = llvmint_ule_low_level)  or else
				(a_value = llvmint_ult_low_level) )
		end

feature -- Setters
	default_create,
	set_llvmint_eq is
		do
			value := llvmint_eq_low_level
		end

	set_llvmint_ne is
		do
			value := llvmint_ne_low_level
		end

	set_llvmint_sge is
		do
			value := llvmint_sge_low_level
		end

	set_llvmint_sgt is
		do
			value := llvmint_sgt_low_level
		end

	set_llvmint_sle is
		do
			value := llvmint_sle_low_level
		end

	set_llvmint_slt is
		do
			value := llvmint_slt_low_level
		end

	set_llvmint_uge is
		do
			value := llvmint_uge_low_level
		end

	set_llvmint_ugt is
		do
			value := llvmint_ugt_low_level
		end

	set_llvmint_ule is
		do
			value := llvmint_ule_low_level
		end

	set_llvmint_ult is
		do
			value := llvmint_ult_low_level
		end

feature -- Queries
	is_llvmint_eq: BOOLEAN is
		do
			Result := (value=llvmint_eq_low_level)
		end

	is_llvmint_ne: BOOLEAN is
		do
			Result := (value=llvmint_ne_low_level)
		end

	is_llvmint_sge: BOOLEAN is
		do
			Result := (value=llvmint_sge_low_level)
		end

	is_llvmint_sgt: BOOLEAN is
		do
			Result := (value=llvmint_sgt_low_level)
		end

	is_llvmint_sle: BOOLEAN is
		do
			Result := (value=llvmint_sle_low_level)
		end

	is_llvmint_slt: BOOLEAN is
		do
			Result := (value=llvmint_slt_low_level)
		end

	is_llvmint_uge: BOOLEAN is
		do
			Result := (value=llvmint_uge_low_level)
		end

	is_llvmint_ugt: BOOLEAN is
		do
			Result := (value=llvmint_ugt_low_level)
		end

	is_llvmint_ule: BOOLEAN is
		do
			Result := (value=llvmint_ule_low_level)
		end

	is_llvmint_ult: BOOLEAN is
		do
			Result := (value=llvmint_ult_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmint_eq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntEQ"
 			}"
 		end

	llvmint_ne_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntNE"
 			}"
 		end

	llvmint_sge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSGE"
 			}"
 		end

	llvmint_sgt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSGT"
 			}"
 		end

	llvmint_sle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSLE"
 			}"
 		end

	llvmint_slt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSLT"
 			}"
 		end

	llvmint_uge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntUGE"
 			}"
 		end

	llvmint_ugt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntUGT"
 			}"
 		end

	llvmint_ule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntULE"
 			}"
 		end

	llvmint_ult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntULT"
 			}"
 		end


end -- class LLVMINT_PREDICATE_ENUM
