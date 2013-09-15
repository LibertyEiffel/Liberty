-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class OTHER_OPS_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = call_low_level)  or else
				(a_value = extract_element_low_level)  or else
				(a_value = extract_value_low_level)  or else
				(a_value = fcmp_low_level)  or else
				(a_value = icmp_low_level)  or else
				(a_value = insert_element_low_level)  or else
				(a_value = insert_value_low_level)  or else
				(a_value = landing_pad_low_level)  or else
				(a_value = other_ops_begin_low_level)  or else
				(a_value = other_ops_end_low_level)  or else
				(a_value = phi_low_level)  or else
				(a_value = select_external_low_level)  or else
				(a_value = shuffle_vector_low_level)  or else
				(a_value = user_op1_low_level)  or else
				(a_value = user_op2_low_level)  or else
				(a_value = vaarg_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_call is
		do
			value := call_low_level
		end

	set_extract_element is
		do
			value := extract_element_low_level
		end

	set_extract_value is
		do
			value := extract_value_low_level
		end

	set_fcmp is
		do
			value := fcmp_low_level
		end

	set_icmp is
		do
			value := icmp_low_level
		end

	set_insert_element is
		do
			value := insert_element_low_level
		end

	set_insert_value is
		do
			value := insert_value_low_level
		end

	set_landing_pad is
		do
			value := landing_pad_low_level
		end

	set_other_ops_begin is
		do
			value := other_ops_begin_low_level
		end

	set_other_ops_end is
		do
			value := other_ops_end_low_level
		end

	set_phi is
		do
			value := phi_low_level
		end

	set_select_external is
		do
			value := select_external_low_level
		end

	set_shuffle_vector is
		do
			value := shuffle_vector_low_level
		end

	set_user_op1 is
		do
			value := user_op1_low_level
		end

	set_user_op2 is
		do
			value := user_op2_low_level
		end

	set_vaarg is
		do
			value := vaarg_low_level
		end

feature {ANY} -- Queries
	is_call: BOOLEAN is
		do
			Result := (value=call_low_level)
		end

	is_extract_element: BOOLEAN is
		do
			Result := (value=extract_element_low_level)
		end

	is_extract_value: BOOLEAN is
		do
			Result := (value=extract_value_low_level)
		end

	is_fcmp: BOOLEAN is
		do
			Result := (value=fcmp_low_level)
		end

	is_icmp: BOOLEAN is
		do
			Result := (value=icmp_low_level)
		end

	is_insert_element: BOOLEAN is
		do
			Result := (value=insert_element_low_level)
		end

	is_insert_value: BOOLEAN is
		do
			Result := (value=insert_value_low_level)
		end

	is_landing_pad: BOOLEAN is
		do
			Result := (value=landing_pad_low_level)
		end

	is_other_ops_begin: BOOLEAN is
		do
			Result := (value=other_ops_begin_low_level)
		end

	is_other_ops_end: BOOLEAN is
		do
			Result := (value=other_ops_end_low_level)
		end

	is_phi: BOOLEAN is
		do
			Result := (value=phi_low_level)
		end

	is_select_external: BOOLEAN is
		do
			Result := (value=select_external_low_level)
		end

	is_shuffle_vector: BOOLEAN is
		do
			Result := (value=shuffle_vector_low_level)
		end

	is_user_op1: BOOLEAN is
		do
			Result := (value=user_op1_low_level)
		end

	is_user_op2: BOOLEAN is
		do
			Result := (value=user_op2_low_level)
		end

	is_vaarg: BOOLEAN is
		do
			Result := (value=vaarg_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	call_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Call"
 			}"
 		end

	extract_element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ExtractElement"
 			}"
 		end

	extract_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ExtractValue"
 			}"
 		end

	fcmp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FCmp"
 			}"
 		end

	icmp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ICmp"
 			}"
 		end

	insert_element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "InsertElement"
 			}"
 		end

	insert_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "InsertValue"
 			}"
 		end

	landing_pad_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LandingPad"
 			}"
 		end

	other_ops_begin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "OtherOpsBegin"
 			}"
 		end

	other_ops_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "OtherOpsEnd"
 			}"
 		end

	phi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PHI"
 			}"
 		end

	select_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Select"
 			}"
 		end

	shuffle_vector_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ShuffleVector"
 			}"
 		end

	user_op1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UserOp1"
 			}"
 		end

	user_op2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "UserOp2"
 			}"
 		end

	vaarg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "VAArg"
 			}"
 		end


end -- class OTHER_OPS_ENUM
