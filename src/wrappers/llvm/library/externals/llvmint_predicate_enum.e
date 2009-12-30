-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMINT_PREDICATE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = eq_low_level)  or else
				(a_value = ugt_low_level)  or else
				(a_value = uge_low_level)  or else
				(a_value = ult_low_level)  or else
				(a_value = ule_low_level)  or else
				(a_value = sgt_low_level)  or else
				(a_value = sge_low_level)  or else
				(a_value = slt_low_level)  or else
				(a_value = sle_low_level) )
		end

feature -- Setters
	default_create,
	set_eq is
		do
			value := eq_low_level
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

	set_sgt is
		do
			value := sgt_low_level
		end

	set_sge is
		do
			value := sge_low_level
		end

	set_slt is
		do
			value := slt_low_level
		end

	set_sle is
		do
			value := sle_low_level
		end

feature -- Queries
	is_eq: BOOLEAN is
		do
			Result := (value=eq_low_level)
		end

	is_ugt: BOOLEAN is
		do
			Result := (value=ugt_low_level)
		end

	is_uge: BOOLEAN is
		do
			Result := (value=uge_low_level)
		end

	is_ult: BOOLEAN is
		do
			Result := (value=ult_low_level)
		end

	is_ule: BOOLEAN is
		do
			Result := (value=ule_low_level)
		end

	is_sgt: BOOLEAN is
		do
			Result := (value=sgt_low_level)
		end

	is_sge: BOOLEAN is
		do
			Result := (value=sge_low_level)
		end

	is_slt: BOOLEAN is
		do
			Result := (value=slt_low_level)
		end

	is_sle: BOOLEAN is
		do
			Result := (value=sle_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	eq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntEQ"
 			}"
 		end

	ugt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntUGT"
 			}"
 		end

	uge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntUGE"
 			}"
 		end

	ult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntULT"
 			}"
 		end

	ule_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntULE"
 			}"
 		end

	sgt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSGT"
 			}"
 		end

	sge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSGE"
 			}"
 		end

	slt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSLT"
 			}"
 		end

	sle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMIntSLE"
 			}"
 		end


end -- class LLVMINT_PREDICATE_ENUM
