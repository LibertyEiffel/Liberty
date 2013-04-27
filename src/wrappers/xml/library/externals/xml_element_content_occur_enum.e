-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ELEMENT_CONTENT_OCCUR_ENUM

insert ENUM

<<<<<<< HEAD
creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = xml_element_content_mult_low_level)  or else
				(a_value = xml_element_content_once_low_level)  or else
				(a_value = xml_element_content_opt_low_level)  or else
				(a_value = xml_element_content_plus_low_level) )
=======
create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = once_external_low_level)  or else
				(a_value = opt_low_level)  or else
				(a_value = mult_low_level)  or else
				(a_value = plus_low_level) )
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		end

feature {ANY} -- Setters
	default_create,
	set_xml_element_content_mult is
		do
			value := xml_element_content_mult_low_level
		end

	set_xml_element_content_once is
		do
			value := xml_element_content_once_low_level
		end

	set_xml_element_content_opt is
		do
			value := xml_element_content_opt_low_level
		end

	set_xml_element_content_plus is
		do
			value := xml_element_content_plus_low_level
		end

<<<<<<< HEAD
feature -- Queries
	is_xml_element_content_mult: BOOLEAN is
=======
feature {ANY} -- Queries
	once_external: BOOLEAN is
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		do
			Result := (value=xml_element_content_mult_low_level)
		end

	is_xml_element_content_once: BOOLEAN is
		do
			Result := (value=xml_element_content_once_low_level)
		end

	is_xml_element_content_opt: BOOLEAN is
		do
			Result := (value=xml_element_content_opt_low_level)
		end

	is_xml_element_content_plus: BOOLEAN is
		do
			Result := (value=xml_element_content_plus_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_element_content_mult_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_MULT"
 			}"
 		end

	xml_element_content_once_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_ONCE"
 			}"
 		end

	xml_element_content_opt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_OPT"
 			}"
 		end

	xml_element_content_plus_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_PLUS"
 			}"
 		end


end -- class XML_ELEMENT_CONTENT_OCCUR_ENUM
