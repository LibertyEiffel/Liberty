-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class POSSIBLE_RELOCATIONS_TY

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = norelocation) or else 
				(a_value = localrelocation) or else 
				(a_value = globalrelocations))
		end

feature -- Setters
	default_create,  set_norelocation is
	
		do
			value := norelocation
		end

	 set_localrelocation is
	
		do
			value := localrelocation
		end

	 set_globalrelocations is
	
		do
			value := globalrelocations
		end

feature -- Queries
	is_norelocation: BOOLEAN is
		
		do
			Result := (value=norelocation)
		end

	is_localrelocation: BOOLEAN is
		
		do
			Result := (value=localrelocation)
		end

	is_globalrelocations: BOOLEAN is
		
		do
			Result := (value=globalrelocations)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	norelocation: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "NoRelocation"
 			}"
 		end

	localrelocation: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LocalRelocation"
 			}"
 		end

	globalrelocations: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "GlobalRelocations"
 			}"
 		end

end

