-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_PARSER_OPTION_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (xml_parse_compact_low_level | 
				xml_parse_dtdload_low_level | 
				xml_parse_dtdvalid_low_level | 
				xml_parse_huge_low_level | 
				xml_parse_nobasefix_low_level | 
				xml_parse_noblanks_low_level | 
				xml_parse_nocdata_low_level | 
				xml_parse_nodict_low_level | 
				xml_parse_noent_low_level | 
				xml_parse_noerror_low_level | 
				xml_parse_nonet_low_level | 
				xml_parse_nowarning_low_level | 
				xml_parse_noxincnode_low_level | 
				xml_parse_nsclean_low_level | 
				xml_parse_old10_low_level | 
				xml_parse_oldsax_low_level | 
				xml_parse_pedantic_low_level | 
				xml_parse_recover_low_level | 
				xml_parse_sax1_low_level | 
				xml_parse_xinclude_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_xml_parse_compact is
		do
			value := value.bit_or(xml_parse_compact_low_level)
		end

	unset_xml_parse_compact is
		do
			value := value.bit_xor(xml_parse_compact_low_level)
		end

	set_xml_parse_dtdload is
		do
			value := value.bit_or(xml_parse_dtdload_low_level)
		end

	unset_xml_parse_dtdload is
		do
			value := value.bit_xor(xml_parse_dtdload_low_level)
		end

	set_xml_parse_dtdvalid is
		do
			value := value.bit_or(xml_parse_dtdvalid_low_level)
		end

	unset_xml_parse_dtdvalid is
		do
			value := value.bit_xor(xml_parse_dtdvalid_low_level)
		end

	set_xml_parse_huge is
		do
			value := value.bit_or(xml_parse_huge_low_level)
		end

	unset_xml_parse_huge is
		do
			value := value.bit_xor(xml_parse_huge_low_level)
		end

	set_xml_parse_nobasefix is
		do
			value := value.bit_or(xml_parse_nobasefix_low_level)
		end

	unset_xml_parse_nobasefix is
		do
			value := value.bit_xor(xml_parse_nobasefix_low_level)
		end

	set_xml_parse_noblanks is
		do
			value := value.bit_or(xml_parse_noblanks_low_level)
		end

	unset_xml_parse_noblanks is
		do
			value := value.bit_xor(xml_parse_noblanks_low_level)
		end

	set_xml_parse_nocdata is
		do
			value := value.bit_or(xml_parse_nocdata_low_level)
		end

	unset_xml_parse_nocdata is
		do
			value := value.bit_xor(xml_parse_nocdata_low_level)
		end

	set_xml_parse_nodict is
		do
			value := value.bit_or(xml_parse_nodict_low_level)
		end

	unset_xml_parse_nodict is
		do
			value := value.bit_xor(xml_parse_nodict_low_level)
		end

	set_xml_parse_noent is
		do
			value := value.bit_or(xml_parse_noent_low_level)
		end

	unset_xml_parse_noent is
		do
			value := value.bit_xor(xml_parse_noent_low_level)
		end

	set_xml_parse_noerror is
		do
			value := value.bit_or(xml_parse_noerror_low_level)
		end

	unset_xml_parse_noerror is
		do
			value := value.bit_xor(xml_parse_noerror_low_level)
		end

	set_xml_parse_nonet is
		do
			value := value.bit_or(xml_parse_nonet_low_level)
		end

	unset_xml_parse_nonet is
		do
			value := value.bit_xor(xml_parse_nonet_low_level)
		end

	set_xml_parse_nowarning is
		do
			value := value.bit_or(xml_parse_nowarning_low_level)
		end

	unset_xml_parse_nowarning is
		do
			value := value.bit_xor(xml_parse_nowarning_low_level)
		end

	set_xml_parse_noxincnode is
		do
			value := value.bit_or(xml_parse_noxincnode_low_level)
		end

	unset_xml_parse_noxincnode is
		do
			value := value.bit_xor(xml_parse_noxincnode_low_level)
		end

	set_xml_parse_nsclean is
		do
			value := value.bit_or(xml_parse_nsclean_low_level)
		end

	unset_xml_parse_nsclean is
		do
			value := value.bit_xor(xml_parse_nsclean_low_level)
		end

	set_xml_parse_old10 is
		do
			value := value.bit_or(xml_parse_old10_low_level)
		end

	unset_xml_parse_old10 is
		do
			value := value.bit_xor(xml_parse_old10_low_level)
		end

	set_xml_parse_oldsax is
		do
			value := value.bit_or(xml_parse_oldsax_low_level)
		end

	unset_xml_parse_oldsax is
		do
			value := value.bit_xor(xml_parse_oldsax_low_level)
		end

	set_xml_parse_pedantic is
		do
			value := value.bit_or(xml_parse_pedantic_low_level)
		end

	unset_xml_parse_pedantic is
		do
			value := value.bit_xor(xml_parse_pedantic_low_level)
		end

	set_xml_parse_recover is
		do
			value := value.bit_or(xml_parse_recover_low_level)
		end

	unset_xml_parse_recover is
		do
			value := value.bit_xor(xml_parse_recover_low_level)
		end

	set_xml_parse_sax1 is
		do
			value := value.bit_or(xml_parse_sax1_low_level)
		end

	unset_xml_parse_sax1 is
		do
			value := value.bit_xor(xml_parse_sax1_low_level)
		end

	set_xml_parse_xinclude is
		do
			value := value.bit_or(xml_parse_xinclude_low_level)
		end

	unset_xml_parse_xinclude is
		do
			value := value.bit_xor(xml_parse_xinclude_low_level)
		end

feature -- Queries
	is_xml_parse_compact: BOOLEAN is
		do
			Result := (value=xml_parse_compact_low_level)
		end

	is_xml_parse_dtdload: BOOLEAN is
		do
			Result := (value=xml_parse_dtdload_low_level)
		end

	is_xml_parse_dtdvalid: BOOLEAN is
		do
			Result := (value=xml_parse_dtdvalid_low_level)
		end

	is_xml_parse_huge: BOOLEAN is
		do
			Result := (value=xml_parse_huge_low_level)
		end

	is_xml_parse_nobasefix: BOOLEAN is
		do
			Result := (value=xml_parse_nobasefix_low_level)
		end

	is_xml_parse_noblanks: BOOLEAN is
		do
			Result := (value=xml_parse_noblanks_low_level)
		end

	is_xml_parse_nocdata: BOOLEAN is
		do
			Result := (value=xml_parse_nocdata_low_level)
		end

	is_xml_parse_nodict: BOOLEAN is
		do
			Result := (value=xml_parse_nodict_low_level)
		end

	is_xml_parse_noent: BOOLEAN is
		do
			Result := (value=xml_parse_noent_low_level)
		end

	is_xml_parse_noerror: BOOLEAN is
		do
			Result := (value=xml_parse_noerror_low_level)
		end

	is_xml_parse_nonet: BOOLEAN is
		do
			Result := (value=xml_parse_nonet_low_level)
		end

	is_xml_parse_nowarning: BOOLEAN is
		do
			Result := (value=xml_parse_nowarning_low_level)
		end

	is_xml_parse_noxincnode: BOOLEAN is
		do
			Result := (value=xml_parse_noxincnode_low_level)
		end

	is_xml_parse_nsclean: BOOLEAN is
		do
			Result := (value=xml_parse_nsclean_low_level)
		end

	is_xml_parse_old10: BOOLEAN is
		do
			Result := (value=xml_parse_old10_low_level)
		end

	is_xml_parse_oldsax: BOOLEAN is
		do
			Result := (value=xml_parse_oldsax_low_level)
		end

	is_xml_parse_pedantic: BOOLEAN is
		do
			Result := (value=xml_parse_pedantic_low_level)
		end

	is_xml_parse_recover: BOOLEAN is
		do
			Result := (value=xml_parse_recover_low_level)
		end

	is_xml_parse_sax1: BOOLEAN is
		do
			Result := (value=xml_parse_sax1_low_level)
		end

	is_xml_parse_xinclude: BOOLEAN is
		do
			Result := (value=xml_parse_xinclude_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_parse_compact_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_COMPACT"
 			}"
 		end

	xml_parse_dtdload_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_DTDLOAD"
 			}"
 		end

	xml_parse_dtdvalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_DTDVALID"
 			}"
 		end

	xml_parse_huge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_HUGE"
 			}"
 		end

	xml_parse_nobasefix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOBASEFIX"
 			}"
 		end

	xml_parse_noblanks_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOBLANKS"
 			}"
 		end

	xml_parse_nocdata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOCDATA"
 			}"
 		end

	xml_parse_nodict_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NODICT"
 			}"
 		end

	xml_parse_noent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOENT"
 			}"
 		end

	xml_parse_noerror_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOERROR"
 			}"
 		end

	xml_parse_nonet_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NONET"
 			}"
 		end

	xml_parse_nowarning_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOWARNING"
 			}"
 		end

	xml_parse_noxincnode_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOXINCNODE"
 			}"
 		end

	xml_parse_nsclean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NSCLEAN"
 			}"
 		end

	xml_parse_old10_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_OLD10"
 			}"
 		end

	xml_parse_oldsax_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_OLDSAX"
 			}"
 		end

	xml_parse_pedantic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_PEDANTIC"
 			}"
 		end

	xml_parse_recover_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_RECOVER"
 			}"
 		end

	xml_parse_sax1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_SAX1"
 			}"
 		end

	xml_parse_xinclude_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_XINCLUDE"
 			}"
 		end


end -- class XML_PARSER_OPTION_ENUM
