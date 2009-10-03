-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class OTHER_OPS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = otheropsbegin_low_level)  or else
				(a_value = fcmp_low_level)  or else
				(a_value = phi_low_level)  or else
				(a_value = call_low_level)  or else
				(a_value = select_external_low_level)  or else
				(a_value = userop1_low_level)  or else
				(a_value = userop2_low_level)  or else
				(a_value = vaarg_low_level)  or else
				(a_value = extractelement_low_level)  or else
				(a_value = insertelement_low_level)  or else
				(a_value = shufflevector_low_level)  or else
				(a_value = extractvalue_low_level)  or else
				(a_value = insertvalue_low_level)  or else
				(a_value = otheropsend_low_level) )
		end

feature -- Setters
	default_create,
	set_otheropsbegin is
		do
			value := otheropsbegin_low_level
		end

	set_fcmp is
		do
			value := fcmp_low_level
		end

	set_phi is
		do
			value := phi_low_level
		end

	set_call is
		do
			value := call_low_level
		end

	set_select_external is
		do
			value := select_external_low_level
		end

	set_userop1 is
		do
			value := userop1_low_level
		end

	set_userop2 is
		do
			value := userop2_low_level
		end

	set_vaarg is
		do
			value := vaarg_low_level
		end

	set_extractelement is
		do
			value := extractelement_low_level
		end

	set_insertelement is
		do
			value := insertelement_low_level
		end

	set_shufflevector is
		do
			value := shufflevector_low_level
		end

	set_extractvalue is
		do
			value := extractvalue_low_level
		end

	set_insertvalue is
		do
			value := insertvalue_low_level
		end

	set_otheropsend is
		do
			value := otheropsend_low_level
		end

feature -- Queries
	is_otheropsbegin: BOOLEAN is
		do
			Result := (value=otheropsbegin_low_level)
		end

	is_fcmp: BOOLEAN is
		do
			Result := (value=fcmp_low_level)
		end

	is_phi: BOOLEAN is
		do
			Result := (value=phi_low_level)
		end

	is_call: BOOLEAN is
		do
			Result := (value=call_low_level)
		end

	is_select_external: BOOLEAN is
		do
			Result := (value=select_external_low_level)
		end

	is_userop1: BOOLEAN is
		do
			Result := (value=userop1_low_level)
		end

	is_userop2: BOOLEAN is
		do
			Result := (value=userop2_low_level)
		end

	is_vaarg: BOOLEAN is
		do
			Result := (value=vaarg_low_level)
		end

	is_extractelement: BOOLEAN is
		do
			Result := (value=extractelement_low_level)
		end

	is_insertelement: BOOLEAN is
		do
			Result := (value=insertelement_low_level)
		end

	is_shufflevector: BOOLEAN is
		do
			Result := (value=shufflevector_low_level)
		end

	is_extractvalue: BOOLEAN is
		do
			Result := (value=extractvalue_low_level)
		end

	is_insertvalue: BOOLEAN is
		do
			Result := (value=insertvalue_low_level)
		end

	is_otheropsend: BOOLEAN is
		do
			Result := (value=otheropsend_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	otheropsbegin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "OtherOpsBegin"
 			}"
 		end

	fcmp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FCmp"
 			}"
 		end

	phi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PHI"
 			}"
 		end

	call_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Call"
 			}"
 		end

	select_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "Select"
 			}"
 		end

	userop1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "UserOp1"
 			}"
 		end

	userop2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "UserOp2"
 			}"
 		end

	vaarg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "VAArg"
 			}"
 		end

	extractelement_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ExtractElement"
 			}"
 		end

	insertelement_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "InsertElement"
 			}"
 		end

	shufflevector_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ShuffleVector"
 			}"
 		end

	extractvalue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ExtractValue"
 			}"
 		end

	insertvalue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "InsertValue"
 			}"
 		end

	otheropsend_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "OtherOpsEnd"
 			}"
 		end


end -- class OTHER_OPS_ENUM
