-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_PARSER_OPTION_ENUM

-- Wrapper of enum xmlParserOption defined in file /usr/include/libxml2/libxml/parser.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (big_lines_low_level | 
				compact_low_level | 
				dtdattr_low_level | 
				dtdload_low_level | 
				dtdvalid_low_level | 
				huge_low_level | 
				ignore_enc_low_level | 
				nobasefix_low_level | 
				noblanks_low_level | 
				nocdata_low_level | 
				nodict_low_level | 
				noent_low_level | 
				noerror_low_level | 
				nonet_low_level | 
				nowarning_low_level | 
				noxincnode_low_level | 
				nsclean_low_level | 
				old10_low_level | 
				oldsax_low_level | 
				pedantic_low_level | 
				recover_low_level | 
				sax1_low_level | 
				xinclude_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_big_lines
               do
                       value := value.bit_or(big_lines_low_level)
               end

	unset_big_lines
               do
                       value := value.bit_xor(big_lines_low_level)
               end

	set_compact
               do
                       value := value.bit_or(compact_low_level)
               end

	unset_compact
               do
                       value := value.bit_xor(compact_low_level)
               end

	set_dtdattr
               do
                       value := value.bit_or(dtdattr_low_level)
               end

	unset_dtdattr
               do
                       value := value.bit_xor(dtdattr_low_level)
               end

	set_dtdload
               do
                       value := value.bit_or(dtdload_low_level)
               end

	unset_dtdload
               do
                       value := value.bit_xor(dtdload_low_level)
               end

	set_dtdvalid
               do
                       value := value.bit_or(dtdvalid_low_level)
               end

	unset_dtdvalid
               do
                       value := value.bit_xor(dtdvalid_low_level)
               end

	set_huge
               do
                       value := value.bit_or(huge_low_level)
               end

	unset_huge
               do
                       value := value.bit_xor(huge_low_level)
               end

	set_ignore_enc
               do
                       value := value.bit_or(ignore_enc_low_level)
               end

	unset_ignore_enc
               do
                       value := value.bit_xor(ignore_enc_low_level)
               end

	set_nobasefix
               do
                       value := value.bit_or(nobasefix_low_level)
               end

	unset_nobasefix
               do
                       value := value.bit_xor(nobasefix_low_level)
               end

	set_noblanks
               do
                       value := value.bit_or(noblanks_low_level)
               end

	unset_noblanks
               do
                       value := value.bit_xor(noblanks_low_level)
               end

	set_nocdata
               do
                       value := value.bit_or(nocdata_low_level)
               end

	unset_nocdata
               do
                       value := value.bit_xor(nocdata_low_level)
               end

	set_nodict
               do
                       value := value.bit_or(nodict_low_level)
               end

	unset_nodict
               do
                       value := value.bit_xor(nodict_low_level)
               end

	set_noent
               do
                       value := value.bit_or(noent_low_level)
               end

	unset_noent
               do
                       value := value.bit_xor(noent_low_level)
               end

	set_noerror
               do
                       value := value.bit_or(noerror_low_level)
               end

	unset_noerror
               do
                       value := value.bit_xor(noerror_low_level)
               end

	set_nonet
               do
                       value := value.bit_or(nonet_low_level)
               end

	unset_nonet
               do
                       value := value.bit_xor(nonet_low_level)
               end

	set_nowarning
               do
                       value := value.bit_or(nowarning_low_level)
               end

	unset_nowarning
               do
                       value := value.bit_xor(nowarning_low_level)
               end

	set_noxincnode
               do
                       value := value.bit_or(noxincnode_low_level)
               end

	unset_noxincnode
               do
                       value := value.bit_xor(noxincnode_low_level)
               end

	set_nsclean
               do
                       value := value.bit_or(nsclean_low_level)
               end

	unset_nsclean
               do
                       value := value.bit_xor(nsclean_low_level)
               end

	set_old10
               do
                       value := value.bit_or(old10_low_level)
               end

	unset_old10
               do
                       value := value.bit_xor(old10_low_level)
               end

	set_oldsax
               do
                       value := value.bit_or(oldsax_low_level)
               end

	unset_oldsax
               do
                       value := value.bit_xor(oldsax_low_level)
               end

	set_pedantic
               do
                       value := value.bit_or(pedantic_low_level)
               end

	unset_pedantic
               do
                       value := value.bit_xor(pedantic_low_level)
               end

	set_recover
               do
                       value := value.bit_or(recover_low_level)
               end

	unset_recover
               do
                       value := value.bit_xor(recover_low_level)
               end

	set_sax1
               do
                       value := value.bit_or(sax1_low_level)
               end

	unset_sax1
               do
                       value := value.bit_xor(sax1_low_level)
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
       is_big_lines: BOOLEAN
               do
                       Result := (value.bit_and(big_lines_low_level).to_boolean)
               end

       is_compact: BOOLEAN
               do
                       Result := (value.bit_and(compact_low_level).to_boolean)
               end

       is_dtdattr: BOOLEAN
               do
                       Result := (value.bit_and(dtdattr_low_level).to_boolean)
               end

       is_dtdload: BOOLEAN
               do
                       Result := (value.bit_and(dtdload_low_level).to_boolean)
               end

       is_dtdvalid: BOOLEAN
               do
                       Result := (value.bit_and(dtdvalid_low_level).to_boolean)
               end

       is_huge: BOOLEAN
               do
                       Result := (value.bit_and(huge_low_level).to_boolean)
               end

       is_ignore_enc: BOOLEAN
               do
                       Result := (value.bit_and(ignore_enc_low_level).to_boolean)
               end

       is_nobasefix: BOOLEAN
               do
                       Result := (value.bit_and(nobasefix_low_level).to_boolean)
               end

       is_noblanks: BOOLEAN
               do
                       Result := (value.bit_and(noblanks_low_level).to_boolean)
               end

       is_nocdata: BOOLEAN
               do
                       Result := (value.bit_and(nocdata_low_level).to_boolean)
               end

       is_nodict: BOOLEAN
               do
                       Result := (value.bit_and(nodict_low_level).to_boolean)
               end

       is_noent: BOOLEAN
               do
                       Result := (value.bit_and(noent_low_level).to_boolean)
               end

       is_noerror: BOOLEAN
               do
                       Result := (value.bit_and(noerror_low_level).to_boolean)
               end

       is_nonet: BOOLEAN
               do
                       Result := (value.bit_and(nonet_low_level).to_boolean)
               end

       is_nowarning: BOOLEAN
               do
                       Result := (value.bit_and(nowarning_low_level).to_boolean)
               end

       is_noxincnode: BOOLEAN
               do
                       Result := (value.bit_and(noxincnode_low_level).to_boolean)
               end

       is_nsclean: BOOLEAN
               do
                       Result := (value.bit_and(nsclean_low_level).to_boolean)
               end

       is_old10: BOOLEAN
               do
                       Result := (value.bit_and(old10_low_level).to_boolean)
               end

       is_oldsax: BOOLEAN
               do
                       Result := (value.bit_and(oldsax_low_level).to_boolean)
               end

       is_pedantic: BOOLEAN
               do
                       Result := (value.bit_and(pedantic_low_level).to_boolean)
               end

       is_recover: BOOLEAN
               do
                       Result := (value.bit_and(recover_low_level).to_boolean)
               end

       is_sax1: BOOLEAN
               do
                       Result := (value.bit_and(sax1_low_level).to_boolean)
               end

       is_xinclude: BOOLEAN
               do
                       Result := (value.bit_and(xinclude_low_level).to_boolean)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     big_lines_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_BIG_LINES"
                       }"
               end

     compact_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_COMPACT"
                       }"
               end

     dtdattr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_DTDATTR"
                       }"
               end

     dtdload_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_DTDLOAD"
                       }"
               end

     dtdvalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_DTDVALID"
                       }"
               end

     huge_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_HUGE"
                       }"
               end

     ignore_enc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_IGNORE_ENC"
                       }"
               end

     nobasefix_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_NOBASEFIX"
                       }"
               end

     noblanks_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_NOBLANKS"
                       }"
               end

     nocdata_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_NOCDATA"
                       }"
               end

     nodict_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_NODICT"
                       }"
               end

     noent_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_NOENT"
                       }"
               end

     noerror_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_NOERROR"
                       }"
               end

     nonet_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_NONET"
                       }"
               end

     nowarning_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_NOWARNING"
                       }"
               end

     noxincnode_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_NOXINCNODE"
                       }"
               end

     nsclean_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_NSCLEAN"
                       }"
               end

     old10_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_OLD10"
                       }"
               end

     oldsax_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_OLDSAX"
                       }"
               end

     pedantic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_PEDANTIC"
                       }"
               end

     recover_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_RECOVER"
                       }"
               end

     sax1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_SAX1"
                       }"
               end

     xinclude_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_PARSE_XINCLUDE"
                       }"
               end


end -- class XML_PARSER_OPTION_ENUM
