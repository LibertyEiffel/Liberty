-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class NODE_KIND

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = nullkind) or else 
				(a_value = emptykind) or else 
				(a_value = twinekind) or else 
				(a_value = cstringkind) or else 
				(a_value = stdstringkind) or else 
				(a_value = stringrefkind) or else 
				(a_value = decuikind) or else 
				(a_value = decikind) or else 
				(a_value = deculkind) or else 
				(a_value = declkind) or else 
				(a_value = decullkind) or else 
				(a_value = decllkind) or else 
				(a_value = uhexkind))
		end

feature -- Setters
	default_create,  set_nullkind is
	
		do
			value := nullkind
		end

	 set_emptykind is
	
		do
			value := emptykind
		end

	 set_twinekind is
	
		do
			value := twinekind
		end

	 set_cstringkind is
	
		do
			value := cstringkind
		end

	 set_stdstringkind is
	
		do
			value := stdstringkind
		end

	 set_stringrefkind is
	
		do
			value := stringrefkind
		end

	 set_decuikind is
	
		do
			value := decuikind
		end

	 set_decikind is
	
		do
			value := decikind
		end

	 set_deculkind is
	
		do
			value := deculkind
		end

	 set_declkind is
	
		do
			value := declkind
		end

	 set_decullkind is
	
		do
			value := decullkind
		end

	 set_decllkind is
	
		do
			value := decllkind
		end

	 set_uhexkind is
	
		do
			value := uhexkind
		end

feature -- Queries
	is_nullkind: BOOLEAN is
		
		do
			Result := (value=nullkind)
		end

	is_emptykind: BOOLEAN is
		
		do
			Result := (value=emptykind)
		end

	is_twinekind: BOOLEAN is
		
		do
			Result := (value=twinekind)
		end

	is_cstringkind: BOOLEAN is
		
		do
			Result := (value=cstringkind)
		end

	is_stdstringkind: BOOLEAN is
		
		do
			Result := (value=stdstringkind)
		end

	is_stringrefkind: BOOLEAN is
		
		do
			Result := (value=stringrefkind)
		end

	is_decuikind: BOOLEAN is
		
		do
			Result := (value=decuikind)
		end

	is_decikind: BOOLEAN is
		
		do
			Result := (value=decikind)
		end

	is_deculkind: BOOLEAN is
		
		do
			Result := (value=deculkind)
		end

	is_declkind: BOOLEAN is
		
		do
			Result := (value=declkind)
		end

	is_decullkind: BOOLEAN is
		
		do
			Result := (value=decullkind)
		end

	is_decllkind: BOOLEAN is
		
		do
			Result := (value=decllkind)
		end

	is_uhexkind: BOOLEAN is
		
		do
			Result := (value=uhexkind)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	nullkind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "NullKind"
 			}"
 		end

	emptykind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "EmptyKind"
 			}"
 		end

	twinekind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "TwineKind"
 			}"
 		end

	cstringkind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "CStringKind"
 			}"
 		end

	stdstringkind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "StdStringKind"
 			}"
 		end

	stringrefkind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "StringRefKind"
 			}"
 		end

	decuikind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "DecUIKind"
 			}"
 		end

	decikind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "DecIKind"
 			}"
 		end

	deculkind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "DecULKind"
 			}"
 		end

	declkind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "DecLKind"
 			}"
 		end

	decullkind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "DecULLKind"
 			}"
 		end

	decllkind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "DecLLKind"
 			}"
 		end

	uhexkind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "UHexKind"
 			}"
 		end

end

