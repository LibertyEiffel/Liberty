-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class OP_STATUS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = opok) or else 
				(a_value = opinvalidop) or else 
				(a_value = opdivbyzero) or else 
				(a_value = opoverflow) or else 
				(a_value = opunderflow) or else 
				(a_value = opinexact))
		end

feature -- Setters
	default_create,  set_ok is
	
		do
			value := opok
		end

	 set_invalidop is
	
		do
			value := opinvalidop
		end

	 set_divbyzero is
	
		do
			value := opdivbyzero
		end

	 set_overflow is
	
		do
			value := opoverflow
		end

	 set_underflow is
	
		do
			value := opunderflow
		end

	 set_inexact is
	
		do
			value := opinexact
		end

feature -- Queries
	is_ok: BOOLEAN is
		
		do
			Result := (value=opok)
		end

	is_invalidop: BOOLEAN is
		
		do
			Result := (value=opinvalidop)
		end

	is_divbyzero: BOOLEAN is
		
		do
			Result := (value=opdivbyzero)
		end

	is_overflow: BOOLEAN is
		
		do
			Result := (value=opoverflow)
		end

	is_underflow: BOOLEAN is
		
		do
			Result := (value=opunderflow)
		end

	is_inexact: BOOLEAN is
		
		do
			Result := (value=opinexact)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	opok: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "opOK"
 			}"
 		end

	opinvalidop: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "opInvalidOp"
 			}"
 		end

	opdivbyzero: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "opDivByZero"
 			}"
 		end

	opoverflow: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "opOverflow"
 			}"
 		end

	opunderflow: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "opUnderflow"
 			}"
 		end

	opinexact: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "opInexact"
 			}"
 		end

end

