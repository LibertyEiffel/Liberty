-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class TAG

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = notag) or else 
				(a_value = tagone) or else 
				(a_value = tagtwo) or else 
				(a_value = tagthree))
		end

feature -- Setters
	default_create,  set_notag is
	
		do
			value := notag
		end

	 set_tagone is
	
		do
			value := tagone
		end

	 set_tagtwo is
	
		do
			value := tagtwo
		end

	 set_tagthree is
	
		do
			value := tagthree
		end

feature -- Queries
	is_notag: BOOLEAN is
		
		do
			Result := (value=notag)
		end

	is_tagone: BOOLEAN is
		
		do
			Result := (value=tagone)
		end

	is_tagtwo: BOOLEAN is
		
		do
			Result := (value=tagtwo)
		end

	is_tagthree: BOOLEAN is
		
		do
			Result := (value=tagthree)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	notag: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "noTag"
 			}"
 		end

	tagone: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "tagOne"
 			}"
 		end

	tagtwo: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "tagTwo"
 			}"
 		end

	tagthree: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "tagThree"
 			}"
 		end

end

