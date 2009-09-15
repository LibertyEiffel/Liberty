-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class FLT_CATEGORY

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = fcinfinity) or else 
				(a_value = fcnan) or else 
				(a_value = fcnormal) or else 
				(a_value = fczero))
		end

feature -- Setters
	default_create,  set_infinity is
	
		do
			value := fcinfinity
		end

	 set_nan is
	
		do
			value := fcnan
		end

	 set_normal is
	
		do
			value := fcnormal
		end

	 set_zero is
	
		do
			value := fczero
		end

feature -- Queries
	is_infinity: BOOLEAN is
		
		do
			Result := (value=fcinfinity)
		end

	is_nan: BOOLEAN is
		
		do
			Result := (value=fcnan)
		end

	is_normal: BOOLEAN is
		
		do
			Result := (value=fcnormal)
		end

	is_zero: BOOLEAN is
		
		do
			Result := (value=fczero)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	fcinfinity: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "fcInfinity"
 			}"
 		end

	fcnan: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "fcNaN"
 			}"
 		end

	fcnormal: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "fcNormal"
 			}"
 		end

	fczero: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "fcZero"
 			}"
 		end

end

