-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class L_LVMINT_PREDICATE

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = llvminteq) or else 
				(a_value = llvmintne) or else 
				(a_value = llvmintugt) or else 
				(a_value = llvmintuge) or else 
				(a_value = llvmintult) or else 
				(a_value = llvmintule) or else 
				(a_value = llvmintsgt) or else 
				(a_value = llvmintsge) or else 
				(a_value = llvmintslt) or else 
				(a_value = llvmintsle))
		end

feature -- Setters
	default_create,  set_eq is
	
		do
			value := llvminteq
		end

	 set_ne is
	
		do
			value := llvmintne
		end

	 set_ugt is
	
		do
			value := llvmintugt
		end

	 set_uge is
	
		do
			value := llvmintuge
		end

	 set_ult is
	
		do
			value := llvmintult
		end

	 set_ule is
	
		do
			value := llvmintule
		end

	 set_sgt is
	
		do
			value := llvmintsgt
		end

	 set_sge is
	
		do
			value := llvmintsge
		end

	 set_slt is
	
		do
			value := llvmintslt
		end

	 set_sle is
	
		do
			value := llvmintsle
		end

feature -- Queries
	is_eq: BOOLEAN is
		
		do
			Result := (value=llvminteq)
		end

	is_ne: BOOLEAN is
		
		do
			Result := (value=llvmintne)
		end

	is_ugt: BOOLEAN is
		
		do
			Result := (value=llvmintugt)
		end

	is_uge: BOOLEAN is
		
		do
			Result := (value=llvmintuge)
		end

	is_ult: BOOLEAN is
		
		do
			Result := (value=llvmintult)
		end

	is_ule: BOOLEAN is
		
		do
			Result := (value=llvmintule)
		end

	is_sgt: BOOLEAN is
		
		do
			Result := (value=llvmintsgt)
		end

	is_sge: BOOLEAN is
		
		do
			Result := (value=llvmintsge)
		end

	is_slt: BOOLEAN is
		
		do
			Result := (value=llvmintslt)
		end

	is_sle: BOOLEAN is
		
		do
			Result := (value=llvmintsle)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvminteq: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntEQ"
 			}"
 		end

	llvmintne: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntNE"
 			}"
 		end

	llvmintugt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntUGT"
 			}"
 		end

	llvmintuge: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntUGE"
 			}"
 		end

	llvmintult: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntULT"
 			}"
 		end

	llvmintule: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntULE"
 			}"
 		end

	llvmintsgt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntSGT"
 			}"
 		end

	llvmintsge: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntSGE"
 			}"
 		end

	llvmintslt: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntSLT"
 			}"
 		end

	llvmintsle: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMIntSLE"
 			}"
 		end

end

