-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_CHAR_ENCODING_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xml_char_encoding_2022_jp_low_level)  or else
				(a_value = xml_char_encoding_8859_1_low_level)  or else
				(a_value = xml_char_encoding_8859_2_low_level)  or else
				(a_value = xml_char_encoding_8859_3_low_level)  or else
				(a_value = xml_char_encoding_8859_4_low_level)  or else
				(a_value = xml_char_encoding_8859_5_low_level)  or else
				(a_value = xml_char_encoding_8859_6_low_level)  or else
				(a_value = xml_char_encoding_8859_7_low_level)  or else
				(a_value = xml_char_encoding_8859_8_low_level)  or else
				(a_value = xml_char_encoding_8859_9_low_level)  or else
				(a_value = xml_char_encoding_ascii_low_level)  or else
				(a_value = xml_char_encoding_ebcdic_low_level)  or else
				(a_value = xml_char_encoding_error_low_level)  or else
				(a_value = xml_char_encoding_euc_jp_low_level)  or else
				(a_value = xml_char_encoding_none_low_level)  or else
				(a_value = xml_char_encoding_shift_jis_low_level)  or else
				(a_value = xml_char_encoding_ucs2_low_level)  or else
				(a_value = xml_char_encoding_ucs4_2143_low_level)  or else
				(a_value = xml_char_encoding_ucs4_3412_low_level)  or else
				(a_value = xml_char_encoding_ucs4be_low_level)  or else
				(a_value = xml_char_encoding_ucs4le_low_level)  or else
				(a_value = xml_char_encoding_utf16be_low_level)  or else
				(a_value = xml_char_encoding_utf16le_low_level)  or else
				(a_value = xml_char_encoding_utf8_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_char_encoding_2022_jp
		do
			value := xml_char_encoding_2022_jp_low_level
		end

	set_xml_char_encoding_8859_1
		do
			value := xml_char_encoding_8859_1_low_level
		end

	set_xml_char_encoding_8859_2
		do
			value := xml_char_encoding_8859_2_low_level
		end

	set_xml_char_encoding_8859_3
		do
			value := xml_char_encoding_8859_3_low_level
		end

	set_xml_char_encoding_8859_4
		do
			value := xml_char_encoding_8859_4_low_level
		end

	set_xml_char_encoding_8859_5
		do
			value := xml_char_encoding_8859_5_low_level
		end

	set_xml_char_encoding_8859_6
		do
			value := xml_char_encoding_8859_6_low_level
		end

	set_xml_char_encoding_8859_7
		do
			value := xml_char_encoding_8859_7_low_level
		end

	set_xml_char_encoding_8859_8
		do
			value := xml_char_encoding_8859_8_low_level
		end

	set_xml_char_encoding_8859_9
		do
			value := xml_char_encoding_8859_9_low_level
		end

	set_xml_char_encoding_ascii
		do
			value := xml_char_encoding_ascii_low_level
		end

	set_xml_char_encoding_ebcdic
		do
			value := xml_char_encoding_ebcdic_low_level
		end

	set_xml_char_encoding_error
		do
			value := xml_char_encoding_error_low_level
		end

	set_xml_char_encoding_euc_jp
		do
			value := xml_char_encoding_euc_jp_low_level
		end

	set_xml_char_encoding_none
		do
			value := xml_char_encoding_none_low_level
		end

	set_xml_char_encoding_shift_jis
		do
			value := xml_char_encoding_shift_jis_low_level
		end

	set_xml_char_encoding_ucs2
		do
			value := xml_char_encoding_ucs2_low_level
		end

	set_xml_char_encoding_ucs4_2143
		do
			value := xml_char_encoding_ucs4_2143_low_level
		end

	set_xml_char_encoding_ucs4_3412
		do
			value := xml_char_encoding_ucs4_3412_low_level
		end

	set_xml_char_encoding_ucs4be
		do
			value := xml_char_encoding_ucs4be_low_level
		end

	set_xml_char_encoding_ucs4le
		do
			value := xml_char_encoding_ucs4le_low_level
		end

	set_xml_char_encoding_utf16be
		do
			value := xml_char_encoding_utf16be_low_level
		end

	set_xml_char_encoding_utf16le
		do
			value := xml_char_encoding_utf16le_low_level
		end

	set_xml_char_encoding_utf8
		do
			value := xml_char_encoding_utf8_low_level
		end

feature -- Queries
	is_xml_char_encoding_2022_jp: BOOLEAN
		do
			Result := (value=xml_char_encoding_2022_jp_low_level)
		end

	is_xml_char_encoding_8859_1: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_1_low_level)
		end

	is_xml_char_encoding_8859_2: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_2_low_level)
		end

	is_xml_char_encoding_8859_3: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_3_low_level)
		end

	is_xml_char_encoding_8859_4: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_4_low_level)
		end

	is_xml_char_encoding_8859_5: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_5_low_level)
		end

	is_xml_char_encoding_8859_6: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_6_low_level)
		end

	is_xml_char_encoding_8859_7: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_7_low_level)
		end

	is_xml_char_encoding_8859_8: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_8_low_level)
		end

	is_xml_char_encoding_8859_9: BOOLEAN
		do
			Result := (value=xml_char_encoding_8859_9_low_level)
		end

	is_xml_char_encoding_ascii: BOOLEAN
		do
			Result := (value=xml_char_encoding_ascii_low_level)
		end

	is_xml_char_encoding_ebcdic: BOOLEAN
		do
			Result := (value=xml_char_encoding_ebcdic_low_level)
		end

	is_xml_char_encoding_error: BOOLEAN
		do
			Result := (value=xml_char_encoding_error_low_level)
		end

	is_xml_char_encoding_euc_jp: BOOLEAN
		do
			Result := (value=xml_char_encoding_euc_jp_low_level)
		end

	is_xml_char_encoding_none: BOOLEAN
		do
			Result := (value=xml_char_encoding_none_low_level)
		end

	is_xml_char_encoding_shift_jis: BOOLEAN
		do
			Result := (value=xml_char_encoding_shift_jis_low_level)
		end

	is_xml_char_encoding_ucs2: BOOLEAN
		do
			Result := (value=xml_char_encoding_ucs2_low_level)
		end

	is_xml_char_encoding_ucs4_2143: BOOLEAN
		do
			Result := (value=xml_char_encoding_ucs4_2143_low_level)
		end

	is_xml_char_encoding_ucs4_3412: BOOLEAN
		do
			Result := (value=xml_char_encoding_ucs4_3412_low_level)
		end

	is_xml_char_encoding_ucs4be: BOOLEAN
		do
			Result := (value=xml_char_encoding_ucs4be_low_level)
		end

	is_xml_char_encoding_ucs4le: BOOLEAN
		do
			Result := (value=xml_char_encoding_ucs4le_low_level)
		end

	is_xml_char_encoding_utf16be: BOOLEAN
		do
			Result := (value=xml_char_encoding_utf16be_low_level)
		end

	is_xml_char_encoding_utf16le: BOOLEAN
		do
			Result := (value=xml_char_encoding_utf16le_low_level)
		end

	is_xml_char_encoding_utf8: BOOLEAN
		do
			Result := (value=xml_char_encoding_utf8_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_char_encoding_2022_jp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_2022_JP"
 			}"
 		end

	xml_char_encoding_8859_1_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_1"
 			}"
 		end

	xml_char_encoding_8859_2_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_2"
 			}"
 		end

	xml_char_encoding_8859_3_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_3"
 			}"
 		end

	xml_char_encoding_8859_4_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_4"
 			}"
 		end

	xml_char_encoding_8859_5_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_5"
 			}"
 		end

	xml_char_encoding_8859_6_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_6"
 			}"
 		end

	xml_char_encoding_8859_7_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_7"
 			}"
 		end

	xml_char_encoding_8859_8_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_8"
 			}"
 		end

	xml_char_encoding_8859_9_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_9"
 			}"
 		end

	xml_char_encoding_ascii_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_ASCII"
 			}"
 		end

	xml_char_encoding_ebcdic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_EBCDIC"
 			}"
 		end

	xml_char_encoding_error_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_ERROR"
 			}"
 		end

	xml_char_encoding_euc_jp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_EUC_JP"
 			}"
 		end

	xml_char_encoding_none_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_NONE"
 			}"
 		end

	xml_char_encoding_shift_jis_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_SHIFT_JIS"
 			}"
 		end

	xml_char_encoding_ucs2_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UCS2"
 			}"
 		end

	xml_char_encoding_ucs4_2143_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UCS4_2143"
 			}"
 		end

	xml_char_encoding_ucs4_3412_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UCS4_3412"
 			}"
 		end

	xml_char_encoding_ucs4be_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UCS4BE"
 			}"
 		end

	xml_char_encoding_ucs4le_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UCS4LE"
 			}"
 		end

	xml_char_encoding_utf16be_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UTF16BE"
 			}"
 		end

	xml_char_encoding_utf16le_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UTF16LE"
 			}"
 		end

	xml_char_encoding_utf8_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UTF8"
 			}"
 		end


end -- class XML_CHAR_ENCODING_ENUM
