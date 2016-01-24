-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class UCONVERTER_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bocu1_low_level)  or else
				(a_value = cesu8_low_level)  or else
				(a_value = compound_text_low_level)  or else
				(a_value = dbcs_low_level)  or else
				(a_value = ebcdic_stateful_low_level)  or else
				(a_value = hz_low_level)  or else
				(a_value = imap_mailbox_low_level)  or else
				(a_value = iscii_low_level)  or else
				(a_value = iso_2022_low_level)  or else
				(a_value = latin_1_low_level)  or else
				(a_value = lmbcs_1_low_level)  or else
				(a_value = lmbcs_11_low_level)  or else
				(a_value = lmbcs_16_low_level)  or else
				(a_value = lmbcs_17_low_level)  or else
				(a_value = lmbcs_18_low_level)  or else
				(a_value = lmbcs_19_low_level)  or else
				(a_value = lmbcs_2_low_level)  or else
				(a_value = lmbcs_3_low_level)  or else
				(a_value = lmbcs_4_low_level)  or else
				(a_value = lmbcs_5_low_level)  or else
				(a_value = lmbcs_6_low_level)  or else
				(a_value = lmbcs_8_low_level)  or else
				(a_value = lmbcs_last_low_level)  or else
				(a_value = mbcs_low_level)  or else
				(a_value = number_of_supported_converter_types_low_level)  or else
				(a_value = sbcs_low_level)  or else
				(a_value = scsu_low_level)  or else
				(a_value = unsupported_converter_low_level)  or else
				(a_value = us_ascii_low_level)  or else
				(a_value = utf16_low_level)  or else
				(a_value = utf16_big_endian_low_level)  or else
				(a_value = utf16_little_endian_low_level)  or else
				(a_value = utf32_low_level)  or else
				(a_value = utf32_big_endian_low_level)  or else
				(a_value = utf32_little_endian_low_level)  or else
				(a_value = utf7_low_level)  or else
				(a_value = utf8_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bocu1
               do
                       value := bocu1_low_level
               end

	set_cesu8
               do
                       value := cesu8_low_level
               end

	set_compound_text
               do
                       value := compound_text_low_level
               end

	set_dbcs
               do
                       value := dbcs_low_level
               end

	set_ebcdic_stateful
               do
                       value := ebcdic_stateful_low_level
               end

	set_hz
               do
                       value := hz_low_level
               end

	set_imap_mailbox
               do
                       value := imap_mailbox_low_level
               end

	set_iscii
               do
                       value := iscii_low_level
               end

	set_iso_2022
               do
                       value := iso_2022_low_level
               end

	set_latin_1
               do
                       value := latin_1_low_level
               end

	set_lmbcs_1
               do
                       value := lmbcs_1_low_level
               end

	set_lmbcs_11
               do
                       value := lmbcs_11_low_level
               end

	set_lmbcs_16
               do
                       value := lmbcs_16_low_level
               end

	set_lmbcs_17
               do
                       value := lmbcs_17_low_level
               end

	set_lmbcs_18
               do
                       value := lmbcs_18_low_level
               end

	set_lmbcs_19
               do
                       value := lmbcs_19_low_level
               end

	set_lmbcs_2
               do
                       value := lmbcs_2_low_level
               end

	set_lmbcs_3
               do
                       value := lmbcs_3_low_level
               end

	set_lmbcs_4
               do
                       value := lmbcs_4_low_level
               end

	set_lmbcs_5
               do
                       value := lmbcs_5_low_level
               end

	set_lmbcs_6
               do
                       value := lmbcs_6_low_level
               end

	set_lmbcs_8
               do
                       value := lmbcs_8_low_level
               end

	set_lmbcs_last
               do
                       value := lmbcs_last_low_level
               end

	set_mbcs
               do
                       value := mbcs_low_level
               end

	set_number_of_supported_converter_types
               do
                       value := number_of_supported_converter_types_low_level
               end

	set_sbcs
               do
                       value := sbcs_low_level
               end

	set_scsu
               do
                       value := scsu_low_level
               end

	set_unsupported_converter
               do
                       value := unsupported_converter_low_level
               end

	set_us_ascii
               do
                       value := us_ascii_low_level
               end

	set_utf16
               do
                       value := utf16_low_level
               end

	set_utf16_big_endian
               do
                       value := utf16_big_endian_low_level
               end

	set_utf16_little_endian
               do
                       value := utf16_little_endian_low_level
               end

	set_utf32
               do
                       value := utf32_low_level
               end

	set_utf32_big_endian
               do
                       value := utf32_big_endian_low_level
               end

	set_utf32_little_endian
               do
                       value := utf32_little_endian_low_level
               end

	set_utf7
               do
                       value := utf7_low_level
               end

	set_utf8
               do
                       value := utf8_low_level
               end

feature {ANY} -- Queries
       is_bocu1: BOOLEAN
               do
                       Result := (value=bocu1_low_level)
               end

       is_cesu8: BOOLEAN
               do
                       Result := (value=cesu8_low_level)
               end

       is_compound_text: BOOLEAN
               do
                       Result := (value=compound_text_low_level)
               end

       is_dbcs: BOOLEAN
               do
                       Result := (value=dbcs_low_level)
               end

       is_ebcdic_stateful: BOOLEAN
               do
                       Result := (value=ebcdic_stateful_low_level)
               end

       is_hz: BOOLEAN
               do
                       Result := (value=hz_low_level)
               end

       is_imap_mailbox: BOOLEAN
               do
                       Result := (value=imap_mailbox_low_level)
               end

       is_iscii: BOOLEAN
               do
                       Result := (value=iscii_low_level)
               end

       is_iso_2022: BOOLEAN
               do
                       Result := (value=iso_2022_low_level)
               end

       is_latin_1: BOOLEAN
               do
                       Result := (value=latin_1_low_level)
               end

       is_lmbcs_1: BOOLEAN
               do
                       Result := (value=lmbcs_1_low_level)
               end

       is_lmbcs_11: BOOLEAN
               do
                       Result := (value=lmbcs_11_low_level)
               end

       is_lmbcs_16: BOOLEAN
               do
                       Result := (value=lmbcs_16_low_level)
               end

       is_lmbcs_17: BOOLEAN
               do
                       Result := (value=lmbcs_17_low_level)
               end

       is_lmbcs_18: BOOLEAN
               do
                       Result := (value=lmbcs_18_low_level)
               end

       is_lmbcs_19: BOOLEAN
               do
                       Result := (value=lmbcs_19_low_level)
               end

       is_lmbcs_2: BOOLEAN
               do
                       Result := (value=lmbcs_2_low_level)
               end

       is_lmbcs_3: BOOLEAN
               do
                       Result := (value=lmbcs_3_low_level)
               end

       is_lmbcs_4: BOOLEAN
               do
                       Result := (value=lmbcs_4_low_level)
               end

       is_lmbcs_5: BOOLEAN
               do
                       Result := (value=lmbcs_5_low_level)
               end

       is_lmbcs_6: BOOLEAN
               do
                       Result := (value=lmbcs_6_low_level)
               end

       is_lmbcs_8: BOOLEAN
               do
                       Result := (value=lmbcs_8_low_level)
               end

       is_lmbcs_last: BOOLEAN
               do
                       Result := (value=lmbcs_last_low_level)
               end

       is_mbcs: BOOLEAN
               do
                       Result := (value=mbcs_low_level)
               end

       is_number_of_supported_converter_types: BOOLEAN
               do
                       Result := (value=number_of_supported_converter_types_low_level)
               end

       is_sbcs: BOOLEAN
               do
                       Result := (value=sbcs_low_level)
               end

       is_scsu: BOOLEAN
               do
                       Result := (value=scsu_low_level)
               end

       is_unsupported_converter: BOOLEAN
               do
                       Result := (value=unsupported_converter_low_level)
               end

       is_us_ascii: BOOLEAN
               do
                       Result := (value=us_ascii_low_level)
               end

       is_utf16: BOOLEAN
               do
                       Result := (value=utf16_low_level)
               end

       is_utf16_big_endian: BOOLEAN
               do
                       Result := (value=utf16_big_endian_low_level)
               end

       is_utf16_little_endian: BOOLEAN
               do
                       Result := (value=utf16_little_endian_low_level)
               end

       is_utf32: BOOLEAN
               do
                       Result := (value=utf32_low_level)
               end

       is_utf32_big_endian: BOOLEAN
               do
                       Result := (value=utf32_big_endian_low_level)
               end

       is_utf32_little_endian: BOOLEAN
               do
                       Result := (value=utf32_little_endian_low_level)
               end

       is_utf7: BOOLEAN
               do
                       Result := (value=utf7_low_level)
               end

       is_utf8: BOOLEAN
               do
                       Result := (value=utf8_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bocu1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_BOCU1"
                       }"
               end

     cesu8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_CESU8"
                       }"
               end

     compound_text_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_COMPOUND_TEXT"
                       }"
               end

     dbcs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_DBCS"
                       }"
               end

     ebcdic_stateful_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_EBCDIC_STATEFUL"
                       }"
               end

     hz_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_HZ"
                       }"
               end

     imap_mailbox_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_IMAP_MAILBOX"
                       }"
               end

     iscii_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_ISCII"
                       }"
               end

     iso_2022_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_ISO_2022"
                       }"
               end

     latin_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LATIN_1"
                       }"
               end

     lmbcs_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_1"
                       }"
               end

     lmbcs_11_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_11"
                       }"
               end

     lmbcs_16_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_16"
                       }"
               end

     lmbcs_17_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_17"
                       }"
               end

     lmbcs_18_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_18"
                       }"
               end

     lmbcs_19_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_19"
                       }"
               end

     lmbcs_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_2"
                       }"
               end

     lmbcs_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_3"
                       }"
               end

     lmbcs_4_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_4"
                       }"
               end

     lmbcs_5_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_5"
                       }"
               end

     lmbcs_6_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_6"
                       }"
               end

     lmbcs_8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_8"
                       }"
               end

     lmbcs_last_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_LMBCS_LAST"
                       }"
               end

     mbcs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_MBCS"
                       }"
               end

     number_of_supported_converter_types_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_NUMBER_OF_SUPPORTED_CONVERTER_TYPES"
                       }"
               end

     sbcs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_SBCS"
                       }"
               end

     scsu_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_SCSU"
                       }"
               end

     unsupported_converter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UNSUPPORTED_CONVERTER"
                       }"
               end

     us_ascii_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_US_ASCII"
                       }"
               end

     utf16_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UTF16"
                       }"
               end

     utf16_big_endian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UTF16_BigEndian"
                       }"
               end

     utf16_little_endian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UTF16_LittleEndian"
                       }"
               end

     utf32_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UTF32"
                       }"
               end

     utf32_big_endian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UTF32_BigEndian"
                       }"
               end

     utf32_little_endian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UTF32_LittleEndian"
                       }"
               end

     utf7_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UTF7"
                       }"
               end

     utf8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UTF8"
                       }"
               end


end -- class UCONVERTER_TYPE_ENUM
