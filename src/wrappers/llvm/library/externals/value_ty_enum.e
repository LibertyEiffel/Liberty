-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class VALUE_TY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = argumentval_low_level)  or else
				(a_value = functionval_low_level)  or else
				(a_value = globalaliasval_low_level)  or else
				(a_value = globalvariableval_low_level)  or else
				(a_value = undefvalueval_low_level)  or else
				(a_value = constantexprval_low_level)  or else
				(a_value = constantaggregatezeroval_low_level)  or else
				(a_value = constantintval_low_level)  or else
				(a_value = constantfpval_low_level)  or else
				(a_value = constantarrayval_low_level)  or else
				(a_value = constantstructval_low_level)  or else
				(a_value = constantvectorval_low_level)  or else
				(a_value = constantpointernullval_low_level)  or else
				(a_value = mdnodeval_low_level)  or else
				(a_value = mdstringval_low_level)  or else
				(a_value = namedmdnodeval_low_level)  or else
				(a_value = inlineasmval_low_level)  or else
				(a_value = pseudosourcevalueval_low_level)  or else
				(a_value = instructionval_low_level)  or else
				(a_value = constantfirstval_low_level)  or else
				(a_value = constantlastval_low_level) )
		end

feature -- Setters
	default_create,
	set_argumentval is
		do
			value := argumentval_low_level
		end

	set_functionval is
		do
			value := functionval_low_level
		end

	set_globalaliasval is
		do
			value := globalaliasval_low_level
		end

	set_globalvariableval is
		do
			value := globalvariableval_low_level
		end

	set_undefvalueval is
		do
			value := undefvalueval_low_level
		end

	set_constantexprval is
		do
			value := constantexprval_low_level
		end

	set_constantaggregatezeroval is
		do
			value := constantaggregatezeroval_low_level
		end

	set_constantintval is
		do
			value := constantintval_low_level
		end

	set_constantfpval is
		do
			value := constantfpval_low_level
		end

	set_constantarrayval is
		do
			value := constantarrayval_low_level
		end

	set_constantstructval is
		do
			value := constantstructval_low_level
		end

	set_constantvectorval is
		do
			value := constantvectorval_low_level
		end

	set_constantpointernullval is
		do
			value := constantpointernullval_low_level
		end

	set_mdnodeval is
		do
			value := mdnodeval_low_level
		end

	set_mdstringval is
		do
			value := mdstringval_low_level
		end

	set_namedmdnodeval is
		do
			value := namedmdnodeval_low_level
		end

	set_inlineasmval is
		do
			value := inlineasmval_low_level
		end

	set_pseudosourcevalueval is
		do
			value := pseudosourcevalueval_low_level
		end

	set_instructionval is
		do
			value := instructionval_low_level
		end

	set_constantfirstval is
		do
			value := constantfirstval_low_level
		end

	set_constantlastval is
		do
			value := constantlastval_low_level
		end

feature -- Queries
	is_argumentval: BOOLEAN is
		do
			Result := (value=argumentval_low_level)
		end

	is_functionval: BOOLEAN is
		do
			Result := (value=functionval_low_level)
		end

	is_globalaliasval: BOOLEAN is
		do
			Result := (value=globalaliasval_low_level)
		end

	is_globalvariableval: BOOLEAN is
		do
			Result := (value=globalvariableval_low_level)
		end

	is_undefvalueval: BOOLEAN is
		do
			Result := (value=undefvalueval_low_level)
		end

	is_constantexprval: BOOLEAN is
		do
			Result := (value=constantexprval_low_level)
		end

	is_constantaggregatezeroval: BOOLEAN is
		do
			Result := (value=constantaggregatezeroval_low_level)
		end

	is_constantintval: BOOLEAN is
		do
			Result := (value=constantintval_low_level)
		end

	is_constantfpval: BOOLEAN is
		do
			Result := (value=constantfpval_low_level)
		end

	is_constantarrayval: BOOLEAN is
		do
			Result := (value=constantarrayval_low_level)
		end

	is_constantstructval: BOOLEAN is
		do
			Result := (value=constantstructval_low_level)
		end

	is_constantvectorval: BOOLEAN is
		do
			Result := (value=constantvectorval_low_level)
		end

	is_constantpointernullval: BOOLEAN is
		do
			Result := (value=constantpointernullval_low_level)
		end

	is_mdnodeval: BOOLEAN is
		do
			Result := (value=mdnodeval_low_level)
		end

	is_mdstringval: BOOLEAN is
		do
			Result := (value=mdstringval_low_level)
		end

	is_namedmdnodeval: BOOLEAN is
		do
			Result := (value=namedmdnodeval_low_level)
		end

	is_inlineasmval: BOOLEAN is
		do
			Result := (value=inlineasmval_low_level)
		end

	is_pseudosourcevalueval: BOOLEAN is
		do
			Result := (value=pseudosourcevalueval_low_level)
		end

	is_instructionval: BOOLEAN is
		do
			Result := (value=instructionval_low_level)
		end

	is_constantfirstval: BOOLEAN is
		do
			Result := (value=constantfirstval_low_level)
		end

	is_constantlastval: BOOLEAN is
		do
			Result := (value=constantlastval_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	argumentval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ArgumentVal"
 			}"
 		end

	functionval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "FunctionVal"
 			}"
 		end

	globalaliasval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GlobalAliasVal"
 			}"
 		end

	globalvariableval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GlobalVariableVal"
 			}"
 		end

	undefvalueval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "UndefValueVal"
 			}"
 		end

	constantexprval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ConstantExprVal"
 			}"
 		end

	constantaggregatezeroval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ConstantAggregateZeroVal"
 			}"
 		end

	constantintval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ConstantIntVal"
 			}"
 		end

	constantfpval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ConstantFPVal"
 			}"
 		end

	constantarrayval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ConstantArrayVal"
 			}"
 		end

	constantstructval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ConstantStructVal"
 			}"
 		end

	constantvectorval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ConstantVectorVal"
 			}"
 		end

	constantpointernullval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ConstantPointerNullVal"
 			}"
 		end

	mdnodeval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "MDNodeVal"
 			}"
 		end

	mdstringval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "MDStringVal"
 			}"
 		end

	namedmdnodeval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "NamedMDNodeVal"
 			}"
 		end

	inlineasmval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "InlineAsmVal"
 			}"
 		end

	pseudosourcevalueval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "PseudoSourceValueVal"
 			}"
 		end

	instructionval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "InstructionVal"
 			}"
 		end

	constantfirstval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ConstantFirstVal"
 			}"
 		end

	constantlastval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ConstantLastVal"
 			}"
 		end


end -- class VALUE_TY_ENUM
