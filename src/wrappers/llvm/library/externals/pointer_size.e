-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class POINTER_SIZE

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = anypointersize) or else 
				(a_value = pointer32) or else 
				(a_value = pointer64))
		end

feature -- Setters
	default_create,  set_anypointersize is
	
		do
			value := anypointersize
		end

	 set_pointer32 is
	
		do
			value := pointer32
		end

	 set_pointer64 is
	
		do
			value := pointer64
		end

feature -- Queries
	is_anypointersize: BOOLEAN is
		
		do
			Result := (value=anypointersize)
		end

	is_pointer32: BOOLEAN is
		
		do
			Result := (value=pointer32)
		end

	is_pointer64: BOOLEAN is
		
		do
			Result := (value=pointer64)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	anypointersize: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "AnyPointerSize"
 			}"
 		end

	pointer32: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Pointer32"
 			}"
 		end

	pointer64: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Pointer64"
 			}"
 		end

end

