-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class PREV_PTR_TAG

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = zerodigittag) or else 
				(a_value = onedigittag) or else 
				(a_value = stoptag) or else 
				(a_value = fullstoptag))
		end

feature -- Setters
	default_create,  set_zerodigittag is
	
		do
			value := zerodigittag
		end

	 set_onedigittag is
	
		do
			value := onedigittag
		end

	 set_stoptag is
	
		do
			value := stoptag
		end

	 set_fullstoptag is
	
		do
			value := fullstoptag
		end

feature -- Queries
	is_zerodigittag: BOOLEAN is
		
		do
			Result := (value=zerodigittag)
		end

	is_onedigittag: BOOLEAN is
		
		do
			Result := (value=onedigittag)
		end

	is_stoptag: BOOLEAN is
		
		do
			Result := (value=stoptag)
		end

	is_fullstoptag: BOOLEAN is
		
		do
			Result := (value=fullstoptag)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	zerodigittag: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "zeroDigitTag"
 			}"
 		end

	onedigittag: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "oneDigitTag"
 			}"
 		end

	stoptag: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "stopTag"
 			}"
 		end

	fullstoptag: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "fullStopTag"
 			}"
 		end

end

