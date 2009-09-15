-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class L_LVMVISIBILITY

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = llvmdefaultvisibility) or else 
				(a_value = llvmhiddenvisibility) or else 
				(a_value = llvmprotectedvisibility))
		end

feature -- Setters
	default_create,  set_llvmdefaultvisibility is
	
		do
			value := llvmdefaultvisibility
		end

	 set_llvmhiddenvisibility is
	
		do
			value := llvmhiddenvisibility
		end

	 set_llvmprotectedvisibility is
	
		do
			value := llvmprotectedvisibility
		end

feature -- Queries
	is_llvmdefaultvisibility: BOOLEAN is
		
		do
			Result := (value=llvmdefaultvisibility)
		end

	is_llvmhiddenvisibility: BOOLEAN is
		
		do
			Result := (value=llvmhiddenvisibility)
		end

	is_llvmprotectedvisibility: BOOLEAN is
		
		do
			Result := (value=llvmprotectedvisibility)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmdefaultvisibility: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMDefaultVisibility"
 			}"
 		end

	llvmhiddenvisibility: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMHiddenVisibility"
 			}"
 		end

	llvmprotectedvisibility: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMProtectedVisibility"
 			}"
 		end

end

