-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class L_LVMCALL_CONV

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = llvmccallconv) or else 
				(a_value = llvmfastcallconv) or else 
				(a_value = llvmcoldcallconv) or else 
				(a_value = llvmx86stdcallcallconv) or else 
				(a_value = llvmx86fastcallcallconv))
		end

feature -- Setters
	default_create,  set_ccallconv is
	
		do
			value := llvmccallconv
		end

	 set_fastcallconv is
	
		do
			value := llvmfastcallconv
		end

	 set_coldcallconv is
	
		do
			value := llvmcoldcallconv
		end

	 set_x86stdcallcallconv is
	
		do
			value := llvmx86stdcallcallconv
		end

	 set_x86fastcallcallconv is
	
		do
			value := llvmx86fastcallcallconv
		end

feature -- Queries
	is_ccallconv: BOOLEAN is
		
		do
			Result := (value=llvmccallconv)
		end

	is_fastcallconv: BOOLEAN is
		
		do
			Result := (value=llvmfastcallconv)
		end

	is_coldcallconv: BOOLEAN is
		
		do
			Result := (value=llvmcoldcallconv)
		end

	is_x86stdcallcallconv: BOOLEAN is
		
		do
			Result := (value=llvmx86stdcallcallconv)
		end

	is_x86fastcallcallconv: BOOLEAN is
		
		do
			Result := (value=llvmx86fastcallcallconv)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmccallconv: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMCCallConv"
 			}"
 		end

	llvmfastcallconv: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMFastCallConv"
 			}"
 		end

	llvmcoldcallconv: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMColdCallConv"
 			}"
 		end

	llvmx86stdcallcallconv: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMX86StdcallCallConv"
 			}"
 		end

	llvmx86fastcallcallconv: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMX86FastcallCallConv"
 			}"
 		end

end

