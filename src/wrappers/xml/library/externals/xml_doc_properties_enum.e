-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_DOC_PROPERTIES_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (wellformed_low_level | 
				old10_low_level | 
				dtdvalid_low_level | 
				xinclude_low_level | 
				userbuilt_low_level | 
				internal_low_level | 
				html_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_wellformed is
		do
			value := value.bit_or(wellformed_low_level)
		end

	unset_wellformed is
		do
			value := value.bit_xor(wellformed_low_level)
		end

	set_old10 is
		do
			value := value.bit_or(old10_low_level)
		end

	unset_old10 is
		do
			value := value.bit_xor(old10_low_level)
		end

	set_dtdvalid is
		do
			value := value.bit_or(dtdvalid_low_level)
		end

	unset_dtdvalid is
		do
			value := value.bit_xor(dtdvalid_low_level)
		end

	set_xinclude is
		do
			value := value.bit_or(xinclude_low_level)
		end

	unset_xinclude is
		do
			value := value.bit_xor(xinclude_low_level)
		end

	set_userbuilt is
		do
			value := value.bit_or(userbuilt_low_level)
		end

	unset_userbuilt is
		do
			value := value.bit_xor(userbuilt_low_level)
		end

	set_internal is
		do
			value := value.bit_or(internal_low_level)
		end

	unset_internal is
		do
			value := value.bit_xor(internal_low_level)
		end

	set_html is
		do
			value := value.bit_or(html_low_level)
		end

	unset_html is
		do
			value := value.bit_xor(html_low_level)
		end

feature -- Queries
	is_wellformed: BOOLEAN is
		do
			Result := (value=wellformed_low_level)
		end

	is_old10: BOOLEAN is
		do
			Result := (value=old10_low_level)
		end

	is_dtdvalid: BOOLEAN is
		do
			Result := (value=dtdvalid_low_level)
		end

	is_xinclude: BOOLEAN is
		do
			Result := (value=xinclude_low_level)
		end

	is_userbuilt: BOOLEAN is
		do
			Result := (value=userbuilt_low_level)
		end

	is_internal: BOOLEAN is
		do
			Result := (value=internal_low_level)
		end

	is_html: BOOLEAN is
		do
			Result := (value=html_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	wellformed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_WELLFORMED"
 			}"
 		end

	old10_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_OLD10"
 			}"
 		end

	dtdvalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_DTDVALID"
 			}"
 		end

	xinclude_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_XINCLUDE"
 			}"
 		end

	userbuilt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_USERBUILT"
 			}"
 		end

	internal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_INTERNAL"
 			}"
 		end

	html_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_DOC_HTML"
 			}"
 		end


end -- class XML_DOC_PROPERTIES_ENUM
