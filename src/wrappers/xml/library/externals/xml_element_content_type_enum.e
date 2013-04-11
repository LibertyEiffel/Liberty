-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ELEMENT_CONTENT_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = pcdata_low_level)  or else
				(a_value = element_low_level)  or else
				(a_value = seq_low_level)  or else
				(a_value = or_external_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_pcdata is
		do
			value := pcdata_low_level
		end

	set_element is
		do
			value := element_low_level
		end

	set_seq is
		do
			value := seq_low_level
		end

	set_or_external is
		do
			value := or_external_low_level
		end

feature {ANY} -- Queries
	pcdata: BOOLEAN is
		do
			Result := (value=pcdata_low_level)
		end

	element: BOOLEAN is
		do
			Result := (value=element_low_level)
		end

	seq: BOOLEAN is
		do
			Result := (value=seq_low_level)
		end

	or_external: BOOLEAN is
		do
			Result := (value=or_external_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pcdata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_PCDATA"
 			}"
 		end

	element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_ELEMENT"
 			}"
 		end

	seq_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_SEQ"
 			}"
 		end

	or_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ELEMENT_CONTENT_OR"
 			}"
 		end


end -- class XML_ELEMENT_CONTENT_TYPE_ENUM
