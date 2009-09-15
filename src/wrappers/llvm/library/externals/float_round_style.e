-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class FLOAT_ROUND_STYLE

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = round_indeterminate) or else 
				(a_value = round_toward_zero) or else 
				(a_value = round_to_nearest) or else 
				(a_value = round_toward_infinity) or else 
				(a_value = round_toward_neg_infinity))
		end

feature -- Setters
	default_create,  set_indeterminate is
	
		do
			value := round_indeterminate
		end

	 set_toward_zero is
	
		do
			value := round_toward_zero
		end

	 set_to_nearest is
	
		do
			value := round_to_nearest
		end

	 set_toward_infinity is
	
		do
			value := round_toward_infinity
		end

	 set_toward_neg_infinity is
	
		do
			value := round_toward_neg_infinity
		end

feature -- Queries
	is_indeterminate: BOOLEAN is
		
		do
			Result := (value=round_indeterminate)
		end

	is_toward_zero: BOOLEAN is
		
		do
			Result := (value=round_toward_zero)
		end

	is_to_nearest: BOOLEAN is
		
		do
			Result := (value=round_to_nearest)
		end

	is_toward_infinity: BOOLEAN is
		
		do
			Result := (value=round_toward_infinity)
		end

	is_toward_neg_infinity: BOOLEAN is
		
		do
			Result := (value=round_toward_neg_infinity)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	round_indeterminate: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "round_indeterminate"
 			}"
 		end

	round_toward_zero: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "round_toward_zero"
 			}"
 		end

	round_to_nearest: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "round_to_nearest"
 			}"
 		end

	round_toward_infinity: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "round_toward_infinity"
 			}"
 		end

	round_toward_neg_infinity: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "round_toward_neg_infinity"
 			}"
 		end

end

