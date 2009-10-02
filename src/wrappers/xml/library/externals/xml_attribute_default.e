-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ATTRIBUTE_DEFAULT

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = xml_attribute_none) or else 
				(a_value = xml_attribute_required) or else 
				(a_value = xml_attribute_implied) or else 
				(a_value = xml_attribute_fixed))
		end

feature -- Setters
	default_create,  set_none is
	
		do
			value := xml_attribute_none
		end

	 set_required is
	
		do
			value := xml_attribute_required
		end

	 set_implied is
	
		do
			value := xml_attribute_implied
		end

	 set_fixed is
	
		do
			value := xml_attribute_fixed
		end

feature -- Queries
	is_none: BOOLEAN is
		
		do
			Result := (value=xml_attribute_none)
		end

	is_required: BOOLEAN is
		
		do
			Result := (value=xml_attribute_required)
		end

	is_implied: BOOLEAN is
		
		do
			Result := (value=xml_attribute_implied)
		end

	is_fixed: BOOLEAN is
		
		do
			Result := (value=xml_attribute_fixed)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_attribute_none: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "XML_ATTRIBUTE_NONE"
 			}"
 		end

	xml_attribute_required: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "XML_ATTRIBUTE_REQUIRED"
 			}"
 		end

	xml_attribute_implied: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "XML_ATTRIBUTE_IMPLIED"
 			}"
 		end

	xml_attribute_fixed: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "XML_ATTRIBUTE_FIXED"
 			}"
 		end

end

