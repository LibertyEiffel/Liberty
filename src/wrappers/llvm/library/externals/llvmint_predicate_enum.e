-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMINT_PREDICATE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = eq_low_level)  or else
				(a_value = ne_low_level)  or else
				(a_value = sge_low_level)  or else
				(a_value = sgt_low_level)  or else
				(a_value = sle_low_level)  or else
				(a_value = slt_low_level)  or else
				(a_value = uge_low_level)  or else
				(a_value = ugt_low_level)  or else
				(a_value = ule_low_level)  or else
				(a_value = ult_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_eq
		do
			value := eq_low_level
		end

	set_ne
		do
			value := ne_low_level
		end

	set_sge
		do
			value := sge_low_level
		end

	set_sgt
		do
			value := sgt_low_level
		end

	set_sle
		do
			value := sle_low_level
		end

	set_slt
		do
			value := slt_low_level
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

feature {ANY} -- Queries
	is_eq: BOOLEAN
		do
			Result := (value=eq_low_level)
		end

	is_ne: BOOLEAN
		do
			Result := (value=ne_low_level)
		end

	is_sge: BOOLEAN
		do
			Result := (value=sge_low_level)
		end

	is_sgt: BOOLEAN
		do
			Result := (value=sgt_low_level)
		end

	is_sle: BOOLEAN
		do
			Result := (value=sle_low_level)
		end

	is_slt: BOOLEAN
		do
			Result := (value=slt_low_level)
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

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	eq_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntEQ"
 			}"
 		end

	ne_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntNE"
 			}"
 		end

	sge_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSGE"
 			}"
 		end

	sgt_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSGT"
 			}"
 		end

	sle_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSLE"
 			}"
 		end

	slt_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSLT"
 			}"
 		end

	uge_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntUGE"
 			}"
 		end

	ugt_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntUGT"
 			}"
 		end

	ule_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntULE"
 			}"
 		end

	ult_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntULT"
 			}"
 		end


end -- class LLVMINT_PREDICATE_ENUM
