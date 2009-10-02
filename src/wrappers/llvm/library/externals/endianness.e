-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class ENDIANNESS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = anyendianness) or else 
				(a_value = littleendian) or else 
				(a_value = bigendian))
		end

feature -- Setters
	default_create,  set_anyendianness is
	
		do
			value := anyendianness
		end

	 set_littleendian is
	
		do
			value := littleendian
		end

	 set_bigendian is
	
		do
			value := bigendian
		end

feature -- Queries
	is_anyendianness: BOOLEAN is
		
		do
			Result := (value=anyendianness)
		end

	is_littleendian: BOOLEAN is
		
		do
			Result := (value=littleendian)
		end

	is_bigendian: BOOLEAN is
		
		do
			Result := (value=bigendian)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	anyendianness: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "AnyEndianness"
 			}"
 		end

	littleendian: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LittleEndian"
 			}"
 		end

	bigendian: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "BigEndian"
 			}"
 		end

end

