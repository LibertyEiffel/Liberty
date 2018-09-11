-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_DOC_PROPERTIES_ENUM

-- Wrapper of enum xmlDocProperties defined in file /usr/include/libxml2/libxml/tree.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (dtdvalid_low_level | 
				html_low_level | 
				internal_low_level | 
				nsvalid_low_level | 
				old10_low_level | 
				userbuilt_low_level | 
				wellformed_low_level | 
				xinclude_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_dtdvalid
               do
                       value := value.bit_or(dtdvalid_low_level)
               end

	unset_dtdvalid
               do
                       value := value.bit_xor(dtdvalid_low_level)
               end

	set_html
               do
                       value := value.bit_or(html_low_level)
               end

	unset_html
               do
                       value := value.bit_xor(html_low_level)
               end

	set_internal
               do
                       value := value.bit_or(internal_low_level)
               end

	unset_internal
               do
                       value := value.bit_xor(internal_low_level)
               end

	set_nsvalid
               do
                       value := value.bit_or(nsvalid_low_level)
               end

	unset_nsvalid
               do
                       value := value.bit_xor(nsvalid_low_level)
               end

	set_old10
               do
                       value := value.bit_or(old10_low_level)
               end

	unset_old10
               do
                       value := value.bit_xor(old10_low_level)
               end

	set_userbuilt
               do
                       value := value.bit_or(userbuilt_low_level)
               end

	unset_userbuilt
               do
                       value := value.bit_xor(userbuilt_low_level)
               end

	set_wellformed
               do
                       value := value.bit_or(wellformed_low_level)
               end

	unset_wellformed
               do
                       value := value.bit_xor(wellformed_low_level)
               end

	set_xinclude
               do
                       value := value.bit_or(xinclude_low_level)
               end

	unset_xinclude
               do
                       value := value.bit_xor(xinclude_low_level)
               end

feature {ANY} -- Queries
       is_dtdvalid: BOOLEAN
               do
                       Result := (value.bit_and(dtdvalid_low_level).to_boolean)
               end

       is_html: BOOLEAN
               do
                       Result := (value.bit_and(html_low_level).to_boolean)
               end

       is_internal: BOOLEAN
               do
                       Result := (value.bit_and(internal_low_level).to_boolean)
               end

       is_nsvalid: BOOLEAN
               do
                       Result := (value.bit_and(nsvalid_low_level).to_boolean)
               end

       is_old10: BOOLEAN
               do
                       Result := (value.bit_and(old10_low_level).to_boolean)
               end

       is_userbuilt: BOOLEAN
               do
                       Result := (value.bit_and(userbuilt_low_level).to_boolean)
               end

       is_wellformed: BOOLEAN
               do
                       Result := (value.bit_and(wellformed_low_level).to_boolean)
               end

       is_xinclude: BOOLEAN
               do
                       Result := (value.bit_and(xinclude_low_level).to_boolean)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     dtdvalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DOC_DTDVALID"
                       }"
               end

     html_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DOC_HTML"
                       }"
               end

     internal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DOC_INTERNAL"
                       }"
               end

     nsvalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DOC_NSVALID"
                       }"
               end

     old10_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DOC_OLD10"
                       }"
               end

     userbuilt_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DOC_USERBUILT"
                       }"
               end

     wellformed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DOC_WELLFORMED"
                       }"
               end

     xinclude_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DOC_XINCLUDE"
                       }"
               end


end -- class XML_DOC_PROPERTIES_ENUM
