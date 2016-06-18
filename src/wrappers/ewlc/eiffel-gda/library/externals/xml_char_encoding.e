-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_CHAR_ENCODING
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_char_encoding_error) or else 
				(a_value = xml_char_encoding_none) or else 
				(a_value = xml_char_encoding_utf8) or else 
				(a_value = xml_char_encoding_utf16le) or else 
				(a_value = xml_char_encoding_utf16be) or else 
				(a_value = xml_char_encoding_ucs4le) or else 
				(a_value = xml_char_encoding_ucs4be) or else 
				(a_value = xml_char_encoding_ebcdic) or else 
				(a_value = xml_char_encoding_ucs4_2143) or else 
				(a_value = xml_char_encoding_ucs4_3412) or else 
				(a_value = xml_char_encoding_ucs2) or else 
				(a_value = xml_char_encoding_8859_1) or else 
				(a_value = xml_char_encoding_8859_2) or else 
				(a_value = xml_char_encoding_8859_3) or else 
				(a_value = xml_char_encoding_8859_4) or else 
				(a_value = xml_char_encoding_8859_5) or else 
				(a_value = xml_char_encoding_8859_6) or else 
				(a_value = xml_char_encoding_8859_7) or else 
				(a_value = xml_char_encoding_8859_8) or else 
				(a_value = xml_char_encoding_8859_9) or else 
				(a_value = xml_char_encoding_2022_jp) or else 
				(a_value = xml_char_encoding_shift_jis) or else 
				(a_value = xml_char_encoding_euc_jp) or else 
				(a_value = xml_char_encoding_ascii))
		end


feature {ANY} -- Setters
	default_create, set_error
		do
			value := xml_char_encoding_error
		end

	set_none
		do
			value := xml_char_encoding_none
		end

	set_utf8
		do
			value := xml_char_encoding_utf8
		end

	set_utf16le
		do
			value := xml_char_encoding_utf16le
		end

	set_utf16be
		do
			value := xml_char_encoding_utf16be
		end

	set_ucs4le
		do
			value := xml_char_encoding_ucs4le
		end

	set_ucs4be
		do
			value := xml_char_encoding_ucs4be
		end

	set_ebcdic
		do
			value := xml_char_encoding_ebcdic
		end

	set_ucs4_2143
		do
			value := xml_char_encoding_ucs4_2143
		end

	set_ucs4_3412
		do
			value := xml_char_encoding_ucs4_3412
		end

	set_ucs2
		do
			value := xml_char_encoding_ucs2
		end

	set_8859_1
		do
			value := xml_char_encoding_8859_1
		end

	set_8859_2
		do
			value := xml_char_encoding_8859_2
		end

	set_8859_3
		do
			value := xml_char_encoding_8859_3
		end

	set_8859_4
		do
			value := xml_char_encoding_8859_4
		end

	set_8859_5
		do
			value := xml_char_encoding_8859_5
		end

	set_8859_6
		do
			value := xml_char_encoding_8859_6
		end

	set_8859_7
		do
			value := xml_char_encoding_8859_7
		end

	set_8859_8
		do
			value := xml_char_encoding_8859_8
		end

	set_8859_9
		do
			value := xml_char_encoding_8859_9
		end

	set_2022_jp
		do
			value := xml_char_encoding_2022_jp
		end

	set_shift_jis
		do
			value := xml_char_encoding_shift_jis
		end

	set_euc_jp
		do
			value := xml_char_encoding_euc_jp
		end

	set_ascii
		do
			value := xml_char_encoding_ascii
		end


feature {ANY} -- Queries
	is_error: BOOLEAN
		do
			Result := (value=xml_char_encoding_error)
		end

	is_none: BOOLEAN
		do
			Result := (value=xml_char_encoding_none)
		end

	is_utf8: BOOLEAN
		do
			Result := (value=xml_char_encoding_utf8)
		end

	is_utf16le: BOOLEAN
		do
			Result := (value=xml_char_encoding_utf16le)
		end

	is_utf16be: BOOLEAN
		do
			Result := (value=xml_char_encoding_utf16be)
		end

	is_ucs4le: BOOLEAN
		do
			Result := (value=xml_char_encoding_ucs4le)
		end

	is_ucs4be: BOOLEAN
		do
			Result := (value=xml_char_encoding_ucs4be)
		end

	is_ebcdic: BOOLEAN
		do
			Result := (value=xml_char_encoding_ebcdic)
		end

	is_ucs4_2143: BOOLEAN
		do
			Result := (value=xml_char_encoding_ucs4_2143)
		end

	is_ucs4_3412: BOOLEAN
		do
			Result := (value=xml_char_encoding_ucs4_3412)
		end

	is_ucs2: BOOLEAN
		do
			Result := (value=xml_char_encoding_ucs2)
		end

	is_8859_1: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_1)
		end

	is_8859_2: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_2)
		end

	is_8859_3: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_3)
		end

	is_8859_4: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_4)
		end

	is_8859_5: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_5)
		end

	is_8859_6: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_6)
		end

	is_8859_7: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_7)
		end

	is_8859_8: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_8)
		end

	is_8859_9: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_9)
		end

	is_2022_jp: BOOLEAN
		do
			Result := (value=xml_char_encoding_2022_jp)
		end

	is_shift_jis: BOOLEAN
		do
			Result := (value=xml_char_encoding_shift_jis)
		end

	is_euc_jp: BOOLEAN
		do
			Result := (value=xml_char_encoding_euc_jp)
		end

	is_ascii: BOOLEAN
		do
			Result := (value=xml_char_encoding_ascii)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_char_encoding_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_ERROR"
		end

	xml_char_encoding_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_NONE"
		end

	xml_char_encoding_utf8: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_UTF8"
		end

	xml_char_encoding_utf16le: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_UTF16LE"
		end

	xml_char_encoding_utf16be: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_UTF16BE"
		end

	xml_char_encoding_ucs4le: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_UCS4LE"
		end

	xml_char_encoding_ucs4be: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_UCS4BE"
		end

	xml_char_encoding_ebcdic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_EBCDIC"
		end

	xml_char_encoding_ucs4_2143: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_UCS4_2143"
		end

	xml_char_encoding_ucs4_3412: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_UCS4_3412"
		end

	xml_char_encoding_ucs2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_UCS2"
		end

	xml_char_encoding_8859_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_8859_1"
		end

	xml_char_encoding_8859_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_8859_2"
		end

	xml_char_encoding_8859_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_8859_3"
		end

	xml_char_encoding_8859_4: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_8859_4"
		end

	xml_char_encoding_8859_5: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_8859_5"
		end

	xml_char_encoding_8859_6: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_8859_6"
		end

	xml_char_encoding_8859_7: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_8859_7"
		end

	xml_char_encoding_8859_8: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_8859_8"
		end

	xml_char_encoding_8859_9: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_8859_9"
		end

	xml_char_encoding_2022_jp: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_2022_JP"
		end

	xml_char_encoding_shift_jis: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_SHIFT_JIS"
		end

	xml_char_encoding_euc_jp: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_EUC_JP"
		end

	xml_char_encoding_ascii: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHAR_ENCODING_ASCII"
		end


end

