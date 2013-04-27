-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_CHAR_ENCODING_ENUM

insert ENUM

<<<<<<< HEAD
creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
=======
create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = error_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = utf8_low_level)  or else
				(a_value = utf16le_low_level)  or else
				(a_value = utf16be_low_level)  or else
				(a_value = ucs4le_low_level)  or else
				(a_value = ucs4be_low_level)  or else
				(a_value = ebcdic_low_level)  or else
				(a_value = ucs4_2143_low_level)  or else
				(a_value = ucs4_3412_low_level)  or else
				(a_value = ucs2_low_level)  or else
				(a_value = a_8859_1_low_level)  or else
				(a_value = a_8859_2_low_level)  or else
				(a_value = a_8859_3_low_level)  or else
				(a_value = a_8859_4_low_level)  or else
				(a_value = a_8859_5_low_level)  or else
				(a_value = a_8859_6_low_level)  or else
				(a_value = a_8859_7_low_level)  or else
				(a_value = a_8859_8_low_level)  or else
				(a_value = a_8859_9_low_level)  or else
				(a_value = a_2022_jp_low_level)  or else
				(a_value = shift_jis_low_level)  or else
				(a_value = euc_jp_low_level)  or else
				(a_value = ascii_low_level) )
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		end

feature {ANY} -- Setters
	default_create,
	set_xml_char_encoding_2022_jp is
		do
			value := xml_char_encoding_2022_jp_low_level
		end

	set_xml_char_encoding_8859_1 is
		do
			value := xml_char_encoding_8859_1_low_level
		end

	set_xml_char_encoding_8859_2 is
		do
			value := xml_char_encoding_8859_2_low_level
		end

	set_xml_char_encoding_8859_3 is
		do
			value := xml_char_encoding_8859_3_low_level
		end

	set_xml_char_encoding_8859_4 is
		do
			value := xml_char_encoding_8859_4_low_level
		end

	set_xml_char_encoding_8859_5 is
		do
			value := xml_char_encoding_8859_5_low_level
		end

	set_xml_char_encoding_8859_6 is
		do
			value := xml_char_encoding_8859_6_low_level
		end

	set_xml_char_encoding_8859_7 is
		do
			value := xml_char_encoding_8859_7_low_level
		end

	set_xml_char_encoding_8859_8 is
		do
			value := xml_char_encoding_8859_8_low_level
		end

	set_xml_char_encoding_8859_9 is
		do
			value := xml_char_encoding_8859_9_low_level
		end

	set_xml_char_encoding_ascii is
		do
			value := xml_char_encoding_ascii_low_level
		end

	set_xml_char_encoding_ebcdic is
		do
			value := xml_char_encoding_ebcdic_low_level
		end

	set_xml_char_encoding_error is
		do
			value := xml_char_encoding_error_low_level
		end

	set_xml_char_encoding_euc_jp is
		do
			value := xml_char_encoding_euc_jp_low_level
		end

	set_xml_char_encoding_none is
		do
			value := xml_char_encoding_none_low_level
		end

	set_xml_char_encoding_shift_jis is
		do
			value := xml_char_encoding_shift_jis_low_level
		end

	set_xml_char_encoding_ucs2 is
		do
			value := xml_char_encoding_ucs2_low_level
		end

	set_xml_char_encoding_ucs4_2143 is
		do
			value := xml_char_encoding_ucs4_2143_low_level
		end

	set_xml_char_encoding_ucs4_3412 is
		do
			value := xml_char_encoding_ucs4_3412_low_level
		end

	set_xml_char_encoding_ucs4be is
		do
			value := xml_char_encoding_ucs4be_low_level
		end

	set_xml_char_encoding_ucs4le is
		do
			value := xml_char_encoding_ucs4le_low_level
		end

	set_xml_char_encoding_utf16be is
		do
			value := xml_char_encoding_utf16be_low_level
		end

	set_xml_char_encoding_utf16le is
		do
			value := xml_char_encoding_utf16le_low_level
		end

	set_xml_char_encoding_utf8 is
		do
			value := xml_char_encoding_utf8_low_level
		end

<<<<<<< HEAD
feature -- Queries
	is_xml_char_encoding_2022_jp: BOOLEAN is
=======
feature {ANY} -- Queries
	error: BOOLEAN is
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		do
			Result := (value=xml_char_encoding_2022_jp_low_level)
		end

	is_xml_char_encoding_8859_1: BOOLEAN is
		do
			Result := (value=xml_char_encoding_8859_1_low_level)
		end

	is_xml_char_encoding_8859_2: BOOLEAN is
		do
			Result := (value=xml_char_encoding_8859_2_low_level)
		end

	is_xml_char_encoding_8859_3: BOOLEAN is
		do
			Result := (value=xml_char_encoding_8859_3_low_level)
		end

	is_xml_char_encoding_8859_4: BOOLEAN is
		do
			Result := (value=xml_char_encoding_8859_4_low_level)
		end

	is_xml_char_encoding_8859_5: BOOLEAN is
		do
			Result := (value=xml_char_encoding_8859_5_low_level)
		end

	is_xml_char_encoding_8859_6: BOOLEAN is
		do
			Result := (value=xml_char_encoding_8859_6_low_level)
		end

	is_xml_char_encoding_8859_7: BOOLEAN is
		do
			Result := (value=xml_char_encoding_8859_7_low_level)
		end

	is_xml_char_encoding_8859_8: BOOLEAN is
		do
			Result := (value=xml_char_encoding_8859_8_low_level)
		end

	is_xml_char_encoding_8859_9: BOOLEAN is
		do
			Result := (value=xml_char_encoding_8859_9_low_level)
		end

	is_xml_char_encoding_ascii: BOOLEAN is
		do
			Result := (value=xml_char_encoding_ascii_low_level)
		end

	is_xml_char_encoding_ebcdic: BOOLEAN is
		do
			Result := (value=xml_char_encoding_ebcdic_low_level)
		end

	is_xml_char_encoding_error: BOOLEAN is
		do
			Result := (value=xml_char_encoding_error_low_level)
		end

	is_xml_char_encoding_euc_jp: BOOLEAN is
		do
			Result := (value=xml_char_encoding_euc_jp_low_level)
		end

	is_xml_char_encoding_none: BOOLEAN is
		do
			Result := (value=xml_char_encoding_none_low_level)
		end

	is_xml_char_encoding_shift_jis: BOOLEAN is
		do
			Result := (value=xml_char_encoding_shift_jis_low_level)
		end

	is_xml_char_encoding_ucs2: BOOLEAN is
		do
			Result := (value=xml_char_encoding_ucs2_low_level)
		end

	is_xml_char_encoding_ucs4_2143: BOOLEAN is
		do
			Result := (value=xml_char_encoding_ucs4_2143_low_level)
		end

	is_xml_char_encoding_ucs4_3412: BOOLEAN is
		do
			Result := (value=xml_char_encoding_ucs4_3412_low_level)
		end

	is_xml_char_encoding_ucs4be: BOOLEAN is
		do
			Result := (value=xml_char_encoding_ucs4be_low_level)
		end

	is_xml_char_encoding_ucs4le: BOOLEAN is
		do
			Result := (value=xml_char_encoding_ucs4le_low_level)
		end

	is_xml_char_encoding_utf16be: BOOLEAN is
		do
			Result := (value=xml_char_encoding_utf16be_low_level)
		end

	is_xml_char_encoding_utf16le: BOOLEAN is
		do
			Result := (value=xml_char_encoding_utf16le_low_level)
		end

	is_xml_char_encoding_utf8: BOOLEAN is
		do
			Result := (value=xml_char_encoding_utf8_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_char_encoding_2022_jp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_2022_JP"
 			}"
 		end

	xml_char_encoding_8859_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_1"
 			}"
 		end

	xml_char_encoding_8859_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_2"
 			}"
 		end

	xml_char_encoding_8859_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_3"
 			}"
 		end

	xml_char_encoding_8859_4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_4"
 			}"
 		end

	xml_char_encoding_8859_5_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_5"
 			}"
 		end

	xml_char_encoding_8859_6_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_6"
 			}"
 		end

	xml_char_encoding_8859_7_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_7"
 			}"
 		end

	xml_char_encoding_8859_8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_8"
 			}"
 		end

	xml_char_encoding_8859_9_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_8859_9"
 			}"
 		end

	xml_char_encoding_ascii_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_ASCII"
 			}"
 		end

	xml_char_encoding_ebcdic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_EBCDIC"
 			}"
 		end

	xml_char_encoding_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_ERROR"
 			}"
 		end

	xml_char_encoding_euc_jp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_EUC_JP"
 			}"
 		end

	xml_char_encoding_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_NONE"
 			}"
 		end

	xml_char_encoding_shift_jis_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_SHIFT_JIS"
 			}"
 		end

	xml_char_encoding_ucs2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UCS2"
 			}"
 		end

	xml_char_encoding_ucs4_2143_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UCS4_2143"
 			}"
 		end

	xml_char_encoding_ucs4_3412_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UCS4_3412"
 			}"
 		end

	xml_char_encoding_ucs4be_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UCS4BE"
 			}"
 		end

	xml_char_encoding_ucs4le_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UCS4LE"
 			}"
 		end

	xml_char_encoding_utf16be_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UTF16BE"
 			}"
 		end

	xml_char_encoding_utf16le_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UTF16LE"
 			}"
 		end

	xml_char_encoding_utf8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHAR_ENCODING_UTF8"
 			}"
 		end


end -- class XML_CHAR_ENCODING_ENUM
