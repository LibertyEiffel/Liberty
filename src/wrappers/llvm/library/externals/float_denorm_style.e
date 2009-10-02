-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class FLOAT_DENORM_STYLE

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = denorm_indeterminate) or else 
				(a_value = denorm_absent) or else 
				(a_value = denorm_present))
		end

feature -- Setters
	default_create,  set_denorm_indeterminate is
	
		do
			value := denorm_indeterminate
		end

	 set_denorm_absent is
	
		do
			value := denorm_absent
		end

	 set_denorm_present is
	
		do
			value := denorm_present
		end

feature -- Queries
	is_denorm_indeterminate: BOOLEAN is
		
		do
			Result := (value=denorm_indeterminate)
		end

	is_denorm_absent: BOOLEAN is
		
		do
			Result := (value=denorm_absent)
		end

	is_denorm_present: BOOLEAN is
		
		do
			Result := (value=denorm_present)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	denorm_indeterminate: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "denorm_indeterminate"
 			}"
 		end

	denorm_absent: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "denorm_absent"
 			}"
 		end

	denorm_present: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "denorm_present"
 			}"
 		end

end

