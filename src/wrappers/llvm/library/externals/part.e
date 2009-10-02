-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class PART

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none) or else 
				(a_value = space) or else 
				(a_value = symbol) or else 
				(a_value = sign) or else 
				(a_value = value))
		end

feature -- Setters
	default_create,  set_none is
	
		do
			value := none
		end

	 set_space is
	
		do
			value := space
		end

	 set_symbol is
	
		do
			value := symbol
		end

	 set_sign is
	
		do
			value := sign
		end

	 set_value is
	
		do
			value := value
		end

feature -- Queries
	is_none: BOOLEAN is
		
		do
			Result := (value=none)
		end

	is_space: BOOLEAN is
		
		do
			Result := (value=space)
		end

	is_symbol: BOOLEAN is
		
		do
			Result := (value=symbol)
		end

	is_sign: BOOLEAN is
		
		do
			Result := (value=sign)
		end

	is_value: BOOLEAN is
		
		do
			Result := (value=value)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "none"
 			}"
 		end

	space: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "space"
 			}"
 		end

	symbol: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "symbol"
 			}"
 		end

	sign: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "sign"
 			}"
 		end

	value: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "value"
 			}"
 		end

end

