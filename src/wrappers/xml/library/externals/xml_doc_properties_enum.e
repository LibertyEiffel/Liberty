-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_DOC_PROPERTIES_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (xml_doc_dtdvalid_low_level | 
				xml_doc_internal_low_level | 
				xml_doc_nsvalid_low_level | 
				xml_doc_old10_low_level | 
				xml_doc_userbuilt_low_level | 
				xml_doc_wellformed_low_level | 
				xml_doc_xinclude_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_xml_doc_dtdvalid is
		do
			value := value.bit_or(xml_doc_dtdvalid_low_level)
		end

	unset_xml_doc_dtdvalid is
		do
			value := value.bit_xor(xml_doc_dtdvalid_low_level)
		end

	set_xml_doc_internal is
		do
			value := value.bit_or(xml_doc_internal_low_level)
		end

	unset_xml_doc_internal is
		do
			value := value.bit_xor(xml_doc_internal_low_level)
		end

	set_xml_doc_nsvalid is
		do
			value := value.bit_or(xml_doc_nsvalid_low_level)
		end

	unset_xml_doc_nsvalid is
		do
			value := value.bit_xor(xml_doc_nsvalid_low_level)
		end

	set_xml_doc_old10 is
		do
			value := value.bit_or(xml_doc_old10_low_level)
		end

	unset_xml_doc_old10 is
		do
			value := value.bit_xor(xml_doc_old10_low_level)
		end

	set_xml_doc_userbuilt is
		do
			value := value.bit_or(xml_doc_userbuilt_low_level)
		end

	unset_xml_doc_userbuilt is
		do
			value := value.bit_xor(xml_doc_userbuilt_low_level)
		end

	set_xml_doc_wellformed is
		do
			value := value.bit_or(xml_doc_wellformed_low_level)
		end

	unset_xml_doc_wellformed is
		do
			value := value.bit_xor(xml_doc_wellformed_low_level)
		end

	set_xml_doc_xinclude is
		do
			value := value.bit_or(xml_doc_xinclude_low_level)
		end

	unset_xml_doc_xinclude is
		do
			value := value.bit_xor(xml_doc_xinclude_low_level)
		end

feature -- Queries
	is_xml_doc_dtdvalid: BOOLEAN is
		do
			Result := (value=xml_doc_dtdvalid_low_level)
		end

	is_xml_doc_internal: BOOLEAN is
		do
			Result := (value=xml_doc_internal_low_level)
		end

	is_xml_doc_nsvalid: BOOLEAN is
		do
			Result := (value=xml_doc_nsvalid_low_level)
		end

	is_xml_doc_old10: BOOLEAN is
		do
			Result := (value=xml_doc_old10_low_level)
		end

	is_xml_doc_userbuilt: BOOLEAN is
		do
			Result := (value=xml_doc_userbuilt_low_level)
		end

	is_xml_doc_wellformed: BOOLEAN is
		do
			Result := (value=xml_doc_wellformed_low_level)
		end

	is_xml_doc_xinclude: BOOLEAN is
		do
			Result := (value=xml_doc_xinclude_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_doc_dtdvalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_DTDVALID"
 			}"
 		end

	xml_doc_internal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_INTERNAL"
 			}"
 		end

	xml_doc_nsvalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_NSVALID"
 			}"
 		end

	xml_doc_old10_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_OLD10"
 			}"
 		end

	xml_doc_userbuilt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_USERBUILT"
 			}"
 		end

	xml_doc_wellformed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_WELLFORMED"
 			}"
 		end

	xml_doc_xinclude_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_XINCLUDE"
 			}"
 		end


end -- class XML_DOC_PROPERTIES_ENUM
