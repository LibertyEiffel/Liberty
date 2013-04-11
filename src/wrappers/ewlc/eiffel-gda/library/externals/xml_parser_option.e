-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_PARSER_OPTION
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (xml_parse_recover | 
				xml_parse_noent | 
				xml_parse_dtdload | 
				xml_parse_dtdattr | 
				xml_parse_dtdvalid | 
				xml_parse_noerror | 
				xml_parse_nowarning | 
				xml_parse_pedantic | 
				xml_parse_noblanks | 
				xml_parse_sax1 | 
				xml_parse_xinclude | 
				xml_parse_nonet | 
				xml_parse_nodict | 
				xml_parse_nsclean | 
				xml_parse_nocdata | 
				xml_parse_noxincnode | 
				xml_parse_compact)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_recover is
		do
			value := value.bit_or(xml_parse_recover)
		end

	unset_recover is
		do
			value := value.bit_xor(xml_parse_recover)
		end

	set_noent is
		do
			value := value.bit_or(xml_parse_noent)
		end

	unset_noent is
		do
			value := value.bit_xor(xml_parse_noent)
		end

	set_dtdload is
		do
			value := value.bit_or(xml_parse_dtdload)
		end

	unset_dtdload is
		do
			value := value.bit_xor(xml_parse_dtdload)
		end

	set_dtdattr is
		do
			value := value.bit_or(xml_parse_dtdattr)
		end

	unset_dtdattr is
		do
			value := value.bit_xor(xml_parse_dtdattr)
		end

	set_dtdvalid is
		do
			value := value.bit_or(xml_parse_dtdvalid)
		end

	unset_dtdvalid is
		do
			value := value.bit_xor(xml_parse_dtdvalid)
		end

	set_noerror is
		do
			value := value.bit_or(xml_parse_noerror)
		end

	unset_noerror is
		do
			value := value.bit_xor(xml_parse_noerror)
		end

	set_nowarning is
		do
			value := value.bit_or(xml_parse_nowarning)
		end

	unset_nowarning is
		do
			value := value.bit_xor(xml_parse_nowarning)
		end

	set_pedantic is
		do
			value := value.bit_or(xml_parse_pedantic)
		end

	unset_pedantic is
		do
			value := value.bit_xor(xml_parse_pedantic)
		end

	set_noblanks is
		do
			value := value.bit_or(xml_parse_noblanks)
		end

	unset_noblanks is
		do
			value := value.bit_xor(xml_parse_noblanks)
		end

	set_sax1 is
		do
			value := value.bit_or(xml_parse_sax1)
		end

	unset_sax1 is
		do
			value := value.bit_xor(xml_parse_sax1)
		end

	set_xinclude is
		do
			value := value.bit_or(xml_parse_xinclude)
		end

	unset_xinclude is
		do
			value := value.bit_xor(xml_parse_xinclude)
		end

	set_nonet is
		do
			value := value.bit_or(xml_parse_nonet)
		end

	unset_nonet is
		do
			value := value.bit_xor(xml_parse_nonet)
		end

	set_nodict is
		do
			value := value.bit_or(xml_parse_nodict)
		end

	unset_nodict is
		do
			value := value.bit_xor(xml_parse_nodict)
		end

	set_nsclean is
		do
			value := value.bit_or(xml_parse_nsclean)
		end

	unset_nsclean is
		do
			value := value.bit_xor(xml_parse_nsclean)
		end

	set_nocdata is
		do
			value := value.bit_or(xml_parse_nocdata)
		end

	unset_nocdata is
		do
			value := value.bit_xor(xml_parse_nocdata)
		end

	set_noxincnode is
		do
			value := value.bit_or(xml_parse_noxincnode)
		end

	unset_noxincnode is
		do
			value := value.bit_xor(xml_parse_noxincnode)
		end

	set_compact is
		do
			value := value.bit_or(xml_parse_compact)
		end

	unset_compact is
		do
			value := value.bit_xor(xml_parse_compact)
		end


feature {ANY} -- Queries
	is_recover: BOOLEAN is
		do
			Result := (value &xml_parse_recover).to_boolean
		end

	is_noent: BOOLEAN is
		do
			Result := (value &xml_parse_noent).to_boolean
		end

	is_dtdload: BOOLEAN is
		do
			Result := (value &xml_parse_dtdload).to_boolean
		end

	is_dtdattr: BOOLEAN is
		do
			Result := (value &xml_parse_dtdattr).to_boolean
		end

	is_dtdvalid: BOOLEAN is
		do
			Result := (value &xml_parse_dtdvalid).to_boolean
		end

	is_noerror: BOOLEAN is
		do
			Result := (value &xml_parse_noerror).to_boolean
		end

	is_nowarning: BOOLEAN is
		do
			Result := (value &xml_parse_nowarning).to_boolean
		end

	is_pedantic: BOOLEAN is
		do
			Result := (value &xml_parse_pedantic).to_boolean
		end

	is_noblanks: BOOLEAN is
		do
			Result := (value &xml_parse_noblanks).to_boolean
		end

	is_sax1: BOOLEAN is
		do
			Result := (value &xml_parse_sax1).to_boolean
		end

	is_xinclude: BOOLEAN is
		do
			Result := (value &xml_parse_xinclude).to_boolean
		end

	is_nonet: BOOLEAN is
		do
			Result := (value &xml_parse_nonet).to_boolean
		end

	is_nodict: BOOLEAN is
		do
			Result := (value &xml_parse_nodict).to_boolean
		end

	is_nsclean: BOOLEAN is
		do
			Result := (value &xml_parse_nsclean).to_boolean
		end

	is_nocdata: BOOLEAN is
		do
			Result := (value &xml_parse_nocdata).to_boolean
		end

	is_noxincnode: BOOLEAN is
		do
			Result := (value &xml_parse_noxincnode).to_boolean
		end

	is_compact: BOOLEAN is
		do
			Result := (value &xml_parse_compact).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_parse_recover: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_RECOVER"
		end

	xml_parse_noent: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_NOENT"
		end

	xml_parse_dtdload: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_DTDLOAD"
		end

	xml_parse_dtdattr: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_DTDATTR"
		end

	xml_parse_dtdvalid: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_DTDVALID"
		end

	xml_parse_noerror: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_NOERROR"
		end

	xml_parse_nowarning: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_NOWARNING"
		end

	xml_parse_pedantic: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_PEDANTIC"
		end

	xml_parse_noblanks: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_NOBLANKS"
		end

	xml_parse_sax1: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_SAX1"
		end

	xml_parse_xinclude: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_XINCLUDE"
		end

	xml_parse_nonet: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_NONET"
		end

	xml_parse_nodict: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_NODICT"
		end

	xml_parse_nsclean: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_NSCLEAN"
		end

	xml_parse_nocdata: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_NOCDATA"
		end

	xml_parse_noxincnode: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_NOXINCNODE"
		end

	xml_parse_compact: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_PARSE_COMPACT"
		end


end

