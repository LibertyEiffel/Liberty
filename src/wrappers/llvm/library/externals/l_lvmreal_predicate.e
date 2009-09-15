-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class L_LVMREAL_PREDICATE

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = llvmrealpredicatefalse) or else 
				(a_value = llvmrealoeq) or else 
				(a_value = llvmrealogt) or else 
				(a_value = llvmrealoge) or else 
				(a_value = llvmrealolt) or else 
				(a_value = llvmrealole) or else 
				(a_value = llvmrealone) or else 
				(a_value = llvmrealord) or else 
				(a_value = llvmrealuno) or else 
				(a_value = llvmrealueq) or else 
				(a_value = llvmrealugt) or else 
				(a_value = llvmrealuge) or else 
				(a_value = llvmrealult) or else 
				(a_value = llvmrealule) or else 
				(a_value = llvmrealune) or else 
				(a_value = llvmrealpredicatetrue))
		end

feature -- Setters
	default_create,  set_predicatefalse is
	
		do
			value := llvmrealpredicatefalse
		end

	 set_oeq is
	
		do
			value := llvmrealoeq
		end

	 set_ogt is
	
		do
			value := llvmrealogt
		end

	 set_oge is
	
		do
			value := llvmrealoge
		end

	 set_olt is
	
		do
			value := llvmrealolt
		end

	 set_ole is
	
		do
			value := llvmrealole
		end

	 set_one is
	
		do
			value := llvmrealone
		end

	 set_ord is
	
		do
			value := llvmrealord
		end

	 set_uno is
	
		do
			value := llvmrealuno
		end

	 set_ueq is
	
		do
			value := llvmrealueq
		end

	 set_ugt is
	
		do
			value := llvmrealugt
		end

	 set_uge is
	
		do
			value := llvmrealuge
		end

	 set_ult is
	
		do
			value := llvmrealult
		end

	 set_ule is
	
		do
			value := llvmrealule
		end

	 set_une is
	
		do
			value := llvmrealune
		end

	 set_predicatetrue is
	
		do
			value := llvmrealpredicatetrue
		end

feature -- Queries
	is_predicatefalse: BOOLEAN is
		
		do
			Result := (value=llvmrealpredicatefalse)
		end

	is_oeq: BOOLEAN is
		
		do
			Result := (value=llvmrealoeq)
		end

	is_ogt: BOOLEAN is
		
		do
			Result := (value=llvmrealogt)
		end

	is_oge: BOOLEAN is
		
		do
			Result := (value=llvmrealoge)
		end

	is_olt: BOOLEAN is
		
		do
			Result := (value=llvmrealolt)
		end

	is_ole: BOOLEAN is
		
		do
			Result := (value=llvmrealole)
		end

	is_one: BOOLEAN is
		
		do
			Result := (value=llvmrealone)
		end

	is_ord: BOOLEAN is
		
		do
			Result := (value=llvmrealord)
		end

	is_uno: BOOLEAN is
		
		do
			Result := (value=llvmrealuno)
		end

	is_ueq: BOOLEAN is
		
		do
			Result := (value=llvmrealueq)
		end

	is_ugt: BOOLEAN is
		
		do
			Result := (value=llvmrealugt)
		end

	is_uge: BOOLEAN is
		
		do
			Result := (value=llvmrealuge)
		end

	is_ult: BOOLEAN is
		
		do
			Result := (value=llvmrealult)
		end

	is_ule: BOOLEAN is
		
		do
			Result := (value=llvmrealule)
		end

	is_une: BOOLEAN is
		
		do
			Result := (value=llvmrealune)
		end

	is_predicatetrue: BOOLEAN is
		
		do
			Result := (value=llvmrealpredicatetrue)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmrealpredicatefalse: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealPredicateFalse"
 			}"
 		end

	llvmrealoeq: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealOEQ"
 			}"
 		end

	llvmrealogt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealOGT"
 			}"
 		end

	llvmrealoge: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealOGE"
 			}"
 		end

	llvmrealolt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealOLT"
 			}"
 		end

	llvmrealole: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealOLE"
 			}"
 		end

	llvmrealone: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealONE"
 			}"
 		end

	llvmrealord: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealORD"
 			}"
 		end

	llvmrealuno: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealUNO"
 			}"
 		end

	llvmrealueq: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealUEQ"
 			}"
 		end

	llvmrealugt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealUGT"
 			}"
 		end

	llvmrealuge: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealUGE"
 			}"
 		end

	llvmrealult: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealULT"
 			}"
 		end

	llvmrealule: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealULE"
 			}"
 		end

	llvmrealune: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealUNE"
 			}"
 		end

	llvmrealpredicatetrue: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMRealPredicateTrue"
 			}"
 		end

end

