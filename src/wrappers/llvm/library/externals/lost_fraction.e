-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class LOST_FRACTION

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = lfexactlyzero) or else 
				(a_value = lflessthanhalf) or else 
				(a_value = lfexactlyhalf) or else 
				(a_value = lfmorethanhalf))
		end

feature -- Setters
	default_create,  set_zero is
	
		do
			value := lfexactlyzero
		end

	 set_nhalf is
	
		do
			value := lflessthanhalf
		end

	 set_half is
	
		do
			value := lfexactlyhalf
		end

	 set_nhalf is
	
		do
			value := lfmorethanhalf
		end

feature -- Queries
	is_zero: BOOLEAN is
		
		do
			Result := (value=lfexactlyzero)
		end

	is_nhalf: BOOLEAN is
		
		do
			Result := (value=lflessthanhalf)
		end

	is_half: BOOLEAN is
		
		do
			Result := (value=lfexactlyhalf)
		end

	is_nhalf: BOOLEAN is
		
		do
			Result := (value=lfmorethanhalf)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	lfexactlyzero: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "lfExactlyZero"
 			}"
 		end

	lflessthanhalf: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "lfLessThanHalf"
 			}"
 		end

	lfexactlyhalf: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "lfExactlyHalf"
 			}"
 		end

	lfmorethanhalf: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "lfMoreThanHalf"
 			}"
 		end

end

