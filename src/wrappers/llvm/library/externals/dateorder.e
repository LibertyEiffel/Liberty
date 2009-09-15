-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class DATEORDER

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = no_order) or else 
				(a_value = dmy) or else 
				(a_value = mdy) or else 
				(a_value = ymd) or else 
				(a_value = ydm))
		end

feature -- Setters
	default_create,  set_no_order is
	
		do
			value := no_order
		end

	 set_dmy is
	
		do
			value := dmy
		end

	 set_mdy is
	
		do
			value := mdy
		end

	 set_ymd is
	
		do
			value := ymd
		end

	 set_ydm is
	
		do
			value := ydm
		end

feature -- Queries
	is_no_order: BOOLEAN is
		
		do
			Result := (value=no_order)
		end

	is_dmy: BOOLEAN is
		
		do
			Result := (value=dmy)
		end

	is_mdy: BOOLEAN is
		
		do
			Result := (value=mdy)
		end

	is_ymd: BOOLEAN is
		
		do
			Result := (value=ymd)
		end

	is_ydm: BOOLEAN is
		
		do
			Result := (value=ydm)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	no_order: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "no_order"
 			}"
 		end

	dmy: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "dmy"
 			}"
 		end

	mdy: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "mdy"
 			}"
 		end

	ymd: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ymd"
 			}"
 		end

	ydm: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ydm"
 			}"
 		end

end

