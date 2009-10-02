-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class CMP_RESULT

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = cmplessthan) or else 
				(a_value = cmpequal) or else 
				(a_value = cmpgreaterthan) or else 
				(a_value = cmpunordered))
		end

feature -- Setters
	default_create,  set_lessthan is
	
		do
			value := cmplessthan
		end

	 set_equal is
	
		do
			value := cmpequal
		end

	 set_greaterthan is
	
		do
			value := cmpgreaterthan
		end

	 set_unordered is
	
		do
			value := cmpunordered
		end

feature -- Queries
	is_lessthan: BOOLEAN is
		
		do
			Result := (value=cmplessthan)
		end

	is_equal: BOOLEAN is
		
		do
			Result := (value=cmpequal)
		end

	is_greaterthan: BOOLEAN is
		
		do
			Result := (value=cmpgreaterthan)
		end

	is_unordered: BOOLEAN is
		
		do
			Result := (value=cmpunordered)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cmplessthan: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "cmpLessThan"
 			}"
 		end

	cmpequal: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "cmpEqual"
 			}"
 		end

	cmpgreaterthan: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "cmpGreaterThan"
 			}"
 		end

	cmpunordered: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "cmpUnordered"
 			}"
 		end

end

