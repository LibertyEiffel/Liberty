-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class HANDLE_BASE_KIND

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = assert) or else 
				(a_value = weak) or else 
				(a_value = callback))
		end

feature -- Setters
	default_create,  set_assert is
	
		do
			value := assert
		end

	 set_weak is
	
		do
			value := weak
		end

	 set_callback is
	
		do
			value := callback
		end

feature -- Queries
	is_assert: BOOLEAN is
		
		do
			Result := (value=assert)
		end

	is_weak: BOOLEAN is
		
		do
			Result := (value=weak)
		end

	is_callback: BOOLEAN is
		
		do
			Result := (value=callback)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	assert: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Assert"
 			}"
 		end

	weak: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Weak"
 			}"
 		end

	callback: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Callback"
 			}"
 		end

end

