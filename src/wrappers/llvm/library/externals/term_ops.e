-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class TERM_OPS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = termopsbegin) or else 
				(a_value = ret) or else 
				(a_value = br) or else 
				(a_value = switch) or else 
				(a_value = invoke) or else 
				(a_value = unwind) or else 
				(a_value = unreachable) or else 
				(a_value = termopsend))
		end

feature -- Setters
	default_create,  set_termopsbegin is
	
		do
			value := termopsbegin
		end

	 set_ret is
	
		do
			value := ret
		end

	 set_br is
	
		do
			value := br
		end

	 set_switch is
	
		do
			value := switch
		end

	 set_invoke is
	
		do
			value := invoke
		end

	 set_unwind is
	
		do
			value := unwind
		end

	 set_unreachable is
	
		do
			value := unreachable
		end

	 set_termopsend is
	
		do
			value := termopsend
		end

feature -- Queries
	is_termopsbegin: BOOLEAN is
		
		do
			Result := (value=termopsbegin)
		end

	is_ret: BOOLEAN is
		
		do
			Result := (value=ret)
		end

	is_br: BOOLEAN is
		
		do
			Result := (value=br)
		end

	is_switch: BOOLEAN is
		
		do
			Result := (value=switch)
		end

	is_invoke: BOOLEAN is
		
		do
			Result := (value=invoke)
		end

	is_unwind: BOOLEAN is
		
		do
			Result := (value=unwind)
		end

	is_unreachable: BOOLEAN is
		
		do
			Result := (value=unreachable)
		end

	is_termopsend: BOOLEAN is
		
		do
			Result := (value=termopsend)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	termopsbegin: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "TermOpsBegin"
 			}"
 		end

	ret: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Ret"
 			}"
 		end

	br: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Br"
 			}"
 		end

	switch: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Switch"
 			}"
 		end

	invoke: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Invoke"
 			}"
 		end

	unwind: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Unwind"
 			}"
 		end

	unreachable: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Unreachable"
 			}"
 		end

	termopsend: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "TermOpsEnd"
 			}"
 		end

end

