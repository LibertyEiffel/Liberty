-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class OTHER_OPS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = otheropsbegin) or else 
				(a_value = icmp) or else 
				(a_value = fcmp) or else 
				(a_value = phi) or else 
				(a_value = call) or else 
				(a_value = select) or else 
				(a_value = userop1) or else 
				(a_value = userop2) or else 
				(a_value = vaarg) or else 
				(a_value = extractelement) or else 
				(a_value = insertelement) or else 
				(a_value = shufflevector) or else 
				(a_value = extractvalue) or else 
				(a_value = insertvalue) or else 
				(a_value = otheropsend))
		end

feature -- Setters
	default_create,  set_otheropsbegin is
	
		do
			value := otheropsbegin
		end

	 set_icmp is
	
		do
			value := icmp
		end

	 set_fcmp is
	
		do
			value := fcmp
		end

	 set_phi is
	
		do
			value := phi
		end

	 set_call is
	
		do
			value := call
		end

	 set_select_external is
	
		do
			value := select
		end

	 set_userop1 is
	
		do
			value := userop1
		end

	 set_userop2 is
	
		do
			value := userop2
		end

	 set_vaarg is
	
		do
			value := vaarg
		end

	 set_extractelement is
	
		do
			value := extractelement
		end

	 set_insertelement is
	
		do
			value := insertelement
		end

	 set_shufflevector is
	
		do
			value := shufflevector
		end

	 set_extractvalue is
	
		do
			value := extractvalue
		end

	 set_insertvalue is
	
		do
			value := insertvalue
		end

	 set_otheropsend is
	
		do
			value := otheropsend
		end

feature -- Queries
	is_otheropsbegin: BOOLEAN is
		
		do
			Result := (value=otheropsbegin)
		end

	is_icmp: BOOLEAN is
		
		do
			Result := (value=icmp)
		end

	is_fcmp: BOOLEAN is
		
		do
			Result := (value=fcmp)
		end

	is_phi: BOOLEAN is
		
		do
			Result := (value=phi)
		end

	is_call: BOOLEAN is
		
		do
			Result := (value=call)
		end

	is_select_external: BOOLEAN is
		
		do
			Result := (value=select)
		end

	is_userop1: BOOLEAN is
		
		do
			Result := (value=userop1)
		end

	is_userop2: BOOLEAN is
		
		do
			Result := (value=userop2)
		end

	is_vaarg: BOOLEAN is
		
		do
			Result := (value=vaarg)
		end

	is_extractelement: BOOLEAN is
		
		do
			Result := (value=extractelement)
		end

	is_insertelement: BOOLEAN is
		
		do
			Result := (value=insertelement)
		end

	is_shufflevector: BOOLEAN is
		
		do
			Result := (value=shufflevector)
		end

	is_extractvalue: BOOLEAN is
		
		do
			Result := (value=extractvalue)
		end

	is_insertvalue: BOOLEAN is
		
		do
			Result := (value=insertvalue)
		end

	is_otheropsend: BOOLEAN is
		
		do
			Result := (value=otheropsend)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	otheropsbegin: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "OtherOpsBegin"
 			}"
 		end

	icmp: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ICmp"
 			}"
 		end

	fcmp: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FCmp"
 			}"
 		end

	phi: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "PHI"
 			}"
 		end

	call: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Call"
 			}"
 		end

	select: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Select"
 			}"
 		end

	userop1: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "UserOp1"
 			}"
 		end

	userop2: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "UserOp2"
 			}"
 		end

	vaarg: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "VAArg"
 			}"
 		end

	extractelement: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ExtractElement"
 			}"
 		end

	insertelement: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "InsertElement"
 			}"
 		end

	shufflevector: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ShuffleVector"
 			}"
 		end

	extractvalue: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ExtractValue"
 			}"
 		end

	insertvalue: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "InsertValue"
 			}"
 		end

	otheropsend: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "OtherOpsEnd"
 			}"
 		end

end

