-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_PARSER_OPTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (recover_low_level | 
				dtdload_low_level | 
				dtdattr_low_level | 
				dtdvalid_low_level | 
				noerror_low_level | 
				nowarning_low_level | 
				pedantic_low_level | 
				noblanks_low_level | 
				sax1_low_level | 
				xinclude_low_level | 
				nonet_low_level | 
				nodict_low_level | 
				nsclean_low_level | 
				nocdata_low_level | 
				noxincnode_low_level | 
				compact_low_level | 
				old10_low_level | 
				nobasefix_low_level | 
				huge_low_level | 
				oldsax_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_recover is
		do
			value := value.bit_or(recover_low_level)
		end

	unset_recover is
		do
			value := value.bit_xor(recover_low_level)
		end

	set_dtdload is
		do
			value := value.bit_or(dtdload_low_level)
		end

	unset_dtdload is
		do
			value := value.bit_xor(dtdload_low_level)
		end

	set_dtdattr is
		do
			value := value.bit_or(dtdattr_low_level)
		end

	unset_dtdattr is
		do
			value := value.bit_xor(dtdattr_low_level)
		end

	set_dtdvalid is
		do
			value := value.bit_or(dtdvalid_low_level)
		end

	unset_dtdvalid is
		do
			value := value.bit_xor(dtdvalid_low_level)
		end

	set_noerror is
		do
			value := value.bit_or(noerror_low_level)
		end

	unset_noerror is
		do
			value := value.bit_xor(noerror_low_level)
		end

	set_nowarning is
		do
			value := value.bit_or(nowarning_low_level)
		end

	unset_nowarning is
		do
			value := value.bit_xor(nowarning_low_level)
		end

	set_pedantic is
		do
			value := value.bit_or(pedantic_low_level)
		end

	unset_pedantic is
		do
			value := value.bit_xor(pedantic_low_level)
		end

	set_noblanks is
		do
			value := value.bit_or(noblanks_low_level)
		end

	unset_noblanks is
		do
			value := value.bit_xor(noblanks_low_level)
		end

	set_sax1 is
		do
			value := value.bit_or(sax1_low_level)
		end

	unset_sax1 is
		do
			value := value.bit_xor(sax1_low_level)
		end

	set_xinclude is
		do
			value := value.bit_or(xinclude_low_level)
		end

	unset_xinclude is
		do
			value := value.bit_xor(xinclude_low_level)
		end

	set_nonet is
		do
			value := value.bit_or(nonet_low_level)
		end

	unset_nonet is
		do
			value := value.bit_xor(nonet_low_level)
		end

	set_nodict is
		do
			value := value.bit_or(nodict_low_level)
		end

	unset_nodict is
		do
			value := value.bit_xor(nodict_low_level)
		end

	set_nsclean is
		do
			value := value.bit_or(nsclean_low_level)
		end

	unset_nsclean is
		do
			value := value.bit_xor(nsclean_low_level)
		end

	set_nocdata is
		do
			value := value.bit_or(nocdata_low_level)
		end

	unset_nocdata is
		do
			value := value.bit_xor(nocdata_low_level)
		end

	set_noxincnode is
		do
			value := value.bit_or(noxincnode_low_level)
		end

	unset_noxincnode is
		do
			value := value.bit_xor(noxincnode_low_level)
		end

	set_compact is
		do
			value := value.bit_or(compact_low_level)
		end

	unset_compact is
		do
			value := value.bit_xor(compact_low_level)
		end

	set_old10 is
		do
			value := value.bit_or(old10_low_level)
		end

	unset_old10 is
		do
			value := value.bit_xor(old10_low_level)
		end

	set_nobasefix is
		do
			value := value.bit_or(nobasefix_low_level)
		end

	unset_nobasefix is
		do
			value := value.bit_xor(nobasefix_low_level)
		end

	set_huge is
		do
			value := value.bit_or(huge_low_level)
		end

	unset_huge is
		do
			value := value.bit_xor(huge_low_level)
		end

	set_oldsax is
		do
			value := value.bit_or(oldsax_low_level)
		end

	unset_oldsax is
		do
			value := value.bit_xor(oldsax_low_level)
		end

feature {ANY} -- Queries
	is_recover: BOOLEAN is
		do
			Result := (value=recover_low_level)
		end

	is_dtdload: BOOLEAN is
		do
			Result := (value=dtdload_low_level)
		end

	is_dtdattr: BOOLEAN is
		do
			Result := (value=dtdattr_low_level)
		end

	is_dtdvalid: BOOLEAN is
		do
			Result := (value=dtdvalid_low_level)
		end

	is_noerror: BOOLEAN is
		do
			Result := (value=noerror_low_level)
		end

	is_nowarning: BOOLEAN is
		do
			Result := (value=nowarning_low_level)
		end

	is_pedantic: BOOLEAN is
		do
			Result := (value=pedantic_low_level)
		end

	is_noblanks: BOOLEAN is
		do
			Result := (value=noblanks_low_level)
		end

	is_sax1: BOOLEAN is
		do
			Result := (value=sax1_low_level)
		end

	is_xinclude: BOOLEAN is
		do
			Result := (value=xinclude_low_level)
		end

	is_nonet: BOOLEAN is
		do
			Result := (value=nonet_low_level)
		end

	is_nodict: BOOLEAN is
		do
			Result := (value=nodict_low_level)
		end

	is_nsclean: BOOLEAN is
		do
			Result := (value=nsclean_low_level)
		end

	is_nocdata: BOOLEAN is
		do
			Result := (value=nocdata_low_level)
		end

	is_noxincnode: BOOLEAN is
		do
			Result := (value=noxincnode_low_level)
		end

	is_compact: BOOLEAN is
		do
			Result := (value=compact_low_level)
		end

	is_old10: BOOLEAN is
		do
			Result := (value=old10_low_level)
		end

	is_nobasefix: BOOLEAN is
		do
			Result := (value=nobasefix_low_level)
		end

	is_huge: BOOLEAN is
		do
			Result := (value=huge_low_level)
		end

	is_oldsax: BOOLEAN is
		do
			Result := (value=oldsax_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	recover_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_RECOVER"
 			}"
 		end

	dtdload_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_DTDLOAD"
 			}"
 		end

	dtdattr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_DTDATTR"
 			}"
 		end

	dtdvalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_DTDVALID"
 			}"
 		end

	noerror_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOERROR"
 			}"
 		end

	nowarning_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOWARNING"
 			}"
 		end

	pedantic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_PEDANTIC"
 			}"
 		end

	noblanks_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOBLANKS"
 			}"
 		end

	sax1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_SAX1"
 			}"
 		end

	xinclude_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_XINCLUDE"
 			}"
 		end

	nonet_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NONET"
 			}"
 		end

	nodict_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NODICT"
 			}"
 		end

	nsclean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NSCLEAN"
 			}"
 		end

	nocdata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOCDATA"
 			}"
 		end

	noxincnode_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOXINCNODE"
 			}"
 		end

	compact_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_COMPACT"
 			}"
 		end

	old10_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_OLD10"
 			}"
 		end

	nobasefix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_NOBASEFIX"
 			}"
 		end

	huge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_HUGE"
 			}"
 		end

	oldsax_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "XML_PARSE_OLDSAX"
 			}"
 		end


end -- class XML_PARSER_OPTION_ENUM
