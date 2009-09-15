-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class RESULT

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ok) or else 
				(a_value = partial) or else 
				(a_value = error) or else 
				(a_value = noconv))
		end

feature -- Setters
	default_create,  set_ok is
	
		do
			value := ok
		end

	 set_partial is
	
		do
			value := partial
		end

	 set_error is
	
		do
			value := error
		end

	 set_noconv is
	
		do
			value := noconv
		end

feature -- Queries
	is_ok: BOOLEAN is
		
		do
			Result := (value=ok)
		end

	is_partial: BOOLEAN is
		
		do
			Result := (value=partial)
		end

	is_error: BOOLEAN is
		
		do
			Result := (value=error)
		end

	is_noconv: BOOLEAN is
		
		do
			Result := (value=noconv)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ok: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ok"
 			}"
 		end

	partial: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "partial"
 			}"
 		end

	error: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "error"
 			}"
 		end

	noconv: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "noconv"
 			}"
 		end

end

