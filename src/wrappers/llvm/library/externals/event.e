-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class EVENT

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = erase_event) or else 
				(a_value = imbue_event) or else 
				(a_value = copyfmt_event))
		end

feature -- Setters
	default_create,  set_erase_event is
	
		do
			value := erase_event
		end

	 set_imbue_event is
	
		do
			value := imbue_event
		end

	 set_copyfmt_event is
	
		do
			value := copyfmt_event
		end

feature -- Queries
	is_erase_event: BOOLEAN is
		
		do
			Result := (value=erase_event)
		end

	is_imbue_event: BOOLEAN is
		
		do
			Result := (value=imbue_event)
		end

	is_copyfmt_event: BOOLEAN is
		
		do
			Result := (value=copyfmt_event)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	erase_event: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "erase_event"
 			}"
 		end

	imbue_event: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "imbue_event"
 			}"
 		end

	copyfmt_event: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "copyfmt_event"
 			}"
 		end

end

