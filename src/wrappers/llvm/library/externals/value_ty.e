-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class VALUE_TY

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = argumentval) or else 
				(a_value = basicblockval) or else 
				(a_value = functionval) or else 
				(a_value = globalaliasval) or else 
				(a_value = globalvariableval) or else 
				(a_value = undefvalueval) or else 
				(a_value = constantexprval) or else 
				(a_value = constantaggregatezeroval) or else 
				(a_value = constantintval) or else 
				(a_value = constantfpval) or else 
				(a_value = constantarrayval) or else 
				(a_value = constantstructval) or else 
				(a_value = constantvectorval) or else 
				(a_value = constantpointernullval) or else 
				(a_value = mdnodeval) or else 
				(a_value = mdstringval) or else 
				(a_value = namedmdnodeval) or else 
				(a_value = inlineasmval) or else 
				(a_value = pseudosourcevalueval) or else 
				(a_value = instructionval) or else 
				(a_value = constantfirstval) or else 
				(a_value = constantlastval))
		end

feature -- Setters
	default_create,  set_argumentval is
	
		do
			value := argumentval
		end

	 set_basicblockval is
	
		do
			value := basicblockval
		end

	 set_functionval is
	
		do
			value := functionval
		end

	 set_globalaliasval is
	
		do
			value := globalaliasval
		end

	 set_globalvariableval is
	
		do
			value := globalvariableval
		end

	 set_undefvalueval is
	
		do
			value := undefvalueval
		end

	 set_constantexprval is
	
		do
			value := constantexprval
		end

	 set_constantaggregatezeroval is
	
		do
			value := constantaggregatezeroval
		end

	 set_constantintval is
	
		do
			value := constantintval
		end

	 set_constantfpval is
	
		do
			value := constantfpval
		end

	 set_constantarrayval is
	
		do
			value := constantarrayval
		end

	 set_constantstructval is
	
		do
			value := constantstructval
		end

	 set_constantvectorval is
	
		do
			value := constantvectorval
		end

	 set_constantpointernullval is
	
		do
			value := constantpointernullval
		end

	 set_mdnodeval is
	
		do
			value := mdnodeval
		end

	 set_mdstringval is
	
		do
			value := mdstringval
		end

	 set_namedmdnodeval is
	
		do
			value := namedmdnodeval
		end

	 set_inlineasmval is
	
		do
			value := inlineasmval
		end

	 set_pseudosourcevalueval is
	
		do
			value := pseudosourcevalueval
		end

	 set_instructionval is
	
		do
			value := instructionval
		end

	 set_constantfirstval is
	
		do
			value := constantfirstval
		end

	 set_constantlastval is
	
		do
			value := constantlastval
		end

feature -- Queries
	is_argumentval: BOOLEAN is
		
		do
			Result := (value=argumentval)
		end

	is_basicblockval: BOOLEAN is
		
		do
			Result := (value=basicblockval)
		end

	is_functionval: BOOLEAN is
		
		do
			Result := (value=functionval)
		end

	is_globalaliasval: BOOLEAN is
		
		do
			Result := (value=globalaliasval)
		end

	is_globalvariableval: BOOLEAN is
		
		do
			Result := (value=globalvariableval)
		end

	is_undefvalueval: BOOLEAN is
		
		do
			Result := (value=undefvalueval)
		end

	is_constantexprval: BOOLEAN is
		
		do
			Result := (value=constantexprval)
		end

	is_constantaggregatezeroval: BOOLEAN is
		
		do
			Result := (value=constantaggregatezeroval)
		end

	is_constantintval: BOOLEAN is
		
		do
			Result := (value=constantintval)
		end

	is_constantfpval: BOOLEAN is
		
		do
			Result := (value=constantfpval)
		end

	is_constantarrayval: BOOLEAN is
		
		do
			Result := (value=constantarrayval)
		end

	is_constantstructval: BOOLEAN is
		
		do
			Result := (value=constantstructval)
		end

	is_constantvectorval: BOOLEAN is
		
		do
			Result := (value=constantvectorval)
		end

	is_constantpointernullval: BOOLEAN is
		
		do
			Result := (value=constantpointernullval)
		end

	is_mdnodeval: BOOLEAN is
		
		do
			Result := (value=mdnodeval)
		end

	is_mdstringval: BOOLEAN is
		
		do
			Result := (value=mdstringval)
		end

	is_namedmdnodeval: BOOLEAN is
		
		do
			Result := (value=namedmdnodeval)
		end

	is_inlineasmval: BOOLEAN is
		
		do
			Result := (value=inlineasmval)
		end

	is_pseudosourcevalueval: BOOLEAN is
		
		do
			Result := (value=pseudosourcevalueval)
		end

	is_instructionval: BOOLEAN is
		
		do
			Result := (value=instructionval)
		end

	is_constantfirstval: BOOLEAN is
		
		do
			Result := (value=constantfirstval)
		end

	is_constantlastval: BOOLEAN is
		
		do
			Result := (value=constantlastval)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	argumentval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ArgumentVal"
 			}"
 		end

	basicblockval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "BasicBlockVal"
 			}"
 		end

	functionval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FunctionVal"
 			}"
 		end

	globalaliasval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "GlobalAliasVal"
 			}"
 		end

	globalvariableval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "GlobalVariableVal"
 			}"
 		end

	undefvalueval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "UndefValueVal"
 			}"
 		end

	constantexprval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ConstantExprVal"
 			}"
 		end

	constantaggregatezeroval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ConstantAggregateZeroVal"
 			}"
 		end

	constantintval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ConstantIntVal"
 			}"
 		end

	constantfpval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ConstantFPVal"
 			}"
 		end

	constantarrayval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ConstantArrayVal"
 			}"
 		end

	constantstructval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ConstantStructVal"
 			}"
 		end

	constantvectorval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ConstantVectorVal"
 			}"
 		end

	constantpointernullval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ConstantPointerNullVal"
 			}"
 		end

	mdnodeval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "MDNodeVal"
 			}"
 		end

	mdstringval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "MDStringVal"
 			}"
 		end

	namedmdnodeval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "NamedMDNodeVal"
 			}"
 		end

	inlineasmval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "InlineAsmVal"
 			}"
 		end

	pseudosourcevalueval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "PseudoSourceValueVal"
 			}"
 		end

	instructionval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "InstructionVal"
 			}"
 		end

	constantfirstval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ConstantFirstVal"
 			}"
 		end

	constantlastval: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ConstantLastVal"
 			}"
 		end

end

