-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class ROUNDING_MODE

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = rmnearesttiestoeven) or else 
				(a_value = rmtowardpositive) or else 
				(a_value = rmtowardnegative) or else 
				(a_value = rmtowardzero) or else 
				(a_value = rmnearesttiestoaway))
		end

feature -- Setters
	default_create,  set_nearesttiestoeven is
	
		do
			value := rmnearesttiestoeven
		end

	 set_towardpositive is
	
		do
			value := rmtowardpositive
		end

	 set_towardnegative is
	
		do
			value := rmtowardnegative
		end

	 set_towardzero is
	
		do
			value := rmtowardzero
		end

	 set_nearesttiestoaway is
	
		do
			value := rmnearesttiestoaway
		end

feature -- Queries
	is_nearesttiestoeven: BOOLEAN is
		
		do
			Result := (value=rmnearesttiestoeven)
		end

	is_towardpositive: BOOLEAN is
		
		do
			Result := (value=rmtowardpositive)
		end

	is_towardnegative: BOOLEAN is
		
		do
			Result := (value=rmtowardnegative)
		end

	is_towardzero: BOOLEAN is
		
		do
			Result := (value=rmtowardzero)
		end

	is_nearesttiestoaway: BOOLEAN is
		
		do
			Result := (value=rmnearesttiestoaway)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	rmnearesttiestoeven: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "rmNearestTiesToEven"
 			}"
 		end

	rmtowardpositive: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "rmTowardPositive"
 			}"
 		end

	rmtowardnegative: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "rmTowardNegative"
 			}"
 		end

	rmtowardzero: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "rmTowardZero"
 			}"
 		end

	rmnearesttiestoaway: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "rmNearestTiesToAway"
 			}"
 		end

end

