-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class VISIBILITY_TYPES

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = defaultvisibility) or else 
				(a_value = hiddenvisibility) or else 
				(a_value = protectedvisibility))
		end

feature -- Setters
	default_create,  set_defaultvisibility is
	
		do
			value := defaultvisibility
		end

	 set_hiddenvisibility is
	
		do
			value := hiddenvisibility
		end

	 set_protectedvisibility is
	
		do
			value := protectedvisibility
		end

feature -- Queries
	is_defaultvisibility: BOOLEAN is
		
		do
			Result := (value=defaultvisibility)
		end

	is_hiddenvisibility: BOOLEAN is
		
		do
			Result := (value=hiddenvisibility)
		end

	is_protectedvisibility: BOOLEAN is
		
		do
			Result := (value=protectedvisibility)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	defaultvisibility: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "DefaultVisibility"
 			}"
 		end

	hiddenvisibility: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "HiddenVisibility"
 			}"
 		end

	protectedvisibility: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ProtectedVisibility"
 			}"
 		end

end

