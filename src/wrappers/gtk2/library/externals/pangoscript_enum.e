-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGOSCRIPT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_script_arabic_low_level)  or else
				(a_value = pango_script_armenian_low_level)  or else
				(a_value = pango_script_balinese_low_level)  or else
				(a_value = pango_script_bengali_low_level)  or else
				(a_value = pango_script_bopomofo_low_level)  or else
				(a_value = pango_script_braille_low_level)  or else
				(a_value = pango_script_buginese_low_level)  or else
				(a_value = pango_script_buhid_low_level)  or else
				(a_value = pango_script_canadian_aboriginal_low_level)  or else
				(a_value = pango_script_carian_low_level)  or else
				(a_value = pango_script_cham_low_level)  or else
				(a_value = pango_script_cherokee_low_level)  or else
				(a_value = pango_script_common_low_level)  or else
				(a_value = pango_script_coptic_low_level)  or else
				(a_value = pango_script_cuneiform_low_level)  or else
				(a_value = pango_script_cypriot_low_level)  or else
				(a_value = pango_script_cyrillic_low_level)  or else
				(a_value = pango_script_deseret_low_level)  or else
				(a_value = pango_script_devanagari_low_level)  or else
				(a_value = pango_script_ethiopic_low_level)  or else
				(a_value = pango_script_georgian_low_level)  or else
				(a_value = pango_script_glagolitic_low_level)  or else
				(a_value = pango_script_gothic_low_level)  or else
				(a_value = pango_script_greek_low_level)  or else
				(a_value = pango_script_gujarati_low_level)  or else
				(a_value = pango_script_gurmukhi_low_level)  or else
				(a_value = pango_script_han_low_level)  or else
				(a_value = pango_script_hangul_low_level)  or else
				(a_value = pango_script_hanunoo_low_level)  or else
				(a_value = pango_script_hebrew_low_level)  or else
				(a_value = pango_script_hiragana_low_level)  or else
				(a_value = pango_script_inherited_low_level)  or else
				(a_value = pango_script_invalid_code_low_level)  or else
				(a_value = pango_script_kannada_low_level)  or else
				(a_value = pango_script_katakana_low_level)  or else
				(a_value = pango_script_kayah_li_low_level)  or else
				(a_value = pango_script_kharoshthi_low_level)  or else
				(a_value = pango_script_khmer_low_level)  or else
				(a_value = pango_script_lao_low_level)  or else
				(a_value = pango_script_latin_low_level)  or else
				(a_value = pango_script_lepcha_low_level)  or else
				(a_value = pango_script_limbu_low_level)  or else
				(a_value = pango_script_linear_b_low_level)  or else
				(a_value = pango_script_lycian_low_level)  or else
				(a_value = pango_script_lydian_low_level)  or else
				(a_value = pango_script_malayalam_low_level)  or else
				(a_value = pango_script_mongolian_low_level)  or else
				(a_value = pango_script_myanmar_low_level)  or else
				(a_value = pango_script_new_tai_lue_low_level)  or else
				(a_value = pango_script_nko_low_level)  or else
				(a_value = pango_script_ogham_low_level)  or else
				(a_value = pango_script_ol_chiki_low_level)  or else
				(a_value = pango_script_old_italic_low_level)  or else
				(a_value = pango_script_old_persian_low_level)  or else
				(a_value = pango_script_oriya_low_level)  or else
				(a_value = pango_script_osmanya_low_level)  or else
				(a_value = pango_script_phags_pa_low_level)  or else
				(a_value = pango_script_phoenician_low_level)  or else
				(a_value = pango_script_rejang_low_level)  or else
				(a_value = pango_script_runic_low_level)  or else
				(a_value = pango_script_saurashtra_low_level)  or else
				(a_value = pango_script_shavian_low_level)  or else
				(a_value = pango_script_sinhala_low_level)  or else
				(a_value = pango_script_sundanese_low_level)  or else
				(a_value = pango_script_syloti_nagri_low_level)  or else
				(a_value = pango_script_syriac_low_level)  or else
				(a_value = pango_script_tagalog_low_level)  or else
				(a_value = pango_script_tagbanwa_low_level)  or else
				(a_value = pango_script_tai_le_low_level)  or else
				(a_value = pango_script_tamil_low_level)  or else
				(a_value = pango_script_telugu_low_level)  or else
				(a_value = pango_script_thaana_low_level)  or else
				(a_value = pango_script_thai_low_level)  or else
				(a_value = pango_script_tibetan_low_level)  or else
				(a_value = pango_script_tifinagh_low_level)  or else
				(a_value = pango_script_ugaritic_low_level)  or else
				(a_value = pango_script_unknown_low_level)  or else
				(a_value = pango_script_vai_low_level)  or else
				(a_value = pango_script_yi_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_pango_script_arabic is
		do
			value := pango_script_arabic_low_level
		end

	set_pango_script_armenian is
		do
			value := pango_script_armenian_low_level
		end

	set_pango_script_balinese is
		do
			value := pango_script_balinese_low_level
		end

	set_pango_script_bengali is
		do
			value := pango_script_bengali_low_level
		end

	set_pango_script_bopomofo is
		do
			value := pango_script_bopomofo_low_level
		end

	set_pango_script_braille is
		do
			value := pango_script_braille_low_level
		end

	set_pango_script_buginese is
		do
			value := pango_script_buginese_low_level
		end

	set_pango_script_buhid is
		do
			value := pango_script_buhid_low_level
		end

	set_pango_script_canadian_aboriginal is
		do
			value := pango_script_canadian_aboriginal_low_level
		end

	set_pango_script_carian is
		do
			value := pango_script_carian_low_level
		end

	set_pango_script_cham is
		do
			value := pango_script_cham_low_level
		end

	set_pango_script_cherokee is
		do
			value := pango_script_cherokee_low_level
		end

	set_pango_script_common is
		do
			value := pango_script_common_low_level
		end

	set_pango_script_coptic is
		do
			value := pango_script_coptic_low_level
		end

	set_pango_script_cuneiform is
		do
			value := pango_script_cuneiform_low_level
		end

	set_pango_script_cypriot is
		do
			value := pango_script_cypriot_low_level
		end

	set_pango_script_cyrillic is
		do
			value := pango_script_cyrillic_low_level
		end

	set_pango_script_deseret is
		do
			value := pango_script_deseret_low_level
		end

	set_pango_script_devanagari is
		do
			value := pango_script_devanagari_low_level
		end

	set_pango_script_ethiopic is
		do
			value := pango_script_ethiopic_low_level
		end

	set_pango_script_georgian is
		do
			value := pango_script_georgian_low_level
		end

	set_pango_script_glagolitic is
		do
			value := pango_script_glagolitic_low_level
		end

	set_pango_script_gothic is
		do
			value := pango_script_gothic_low_level
		end

	set_pango_script_greek is
		do
			value := pango_script_greek_low_level
		end

	set_pango_script_gujarati is
		do
			value := pango_script_gujarati_low_level
		end

	set_pango_script_gurmukhi is
		do
			value := pango_script_gurmukhi_low_level
		end

	set_pango_script_han is
		do
			value := pango_script_han_low_level
		end

	set_pango_script_hangul is
		do
			value := pango_script_hangul_low_level
		end

	set_pango_script_hanunoo is
		do
			value := pango_script_hanunoo_low_level
		end

	set_pango_script_hebrew is
		do
			value := pango_script_hebrew_low_level
		end

	set_pango_script_hiragana is
		do
			value := pango_script_hiragana_low_level
		end

	set_pango_script_inherited is
		do
			value := pango_script_inherited_low_level
		end

	set_pango_script_invalid_code is
		do
			value := pango_script_invalid_code_low_level
		end

	set_pango_script_kannada is
		do
			value := pango_script_kannada_low_level
		end

	set_pango_script_katakana is
		do
			value := pango_script_katakana_low_level
		end

	set_pango_script_kayah_li is
		do
			value := pango_script_kayah_li_low_level
		end

	set_pango_script_kharoshthi is
		do
			value := pango_script_kharoshthi_low_level
		end

	set_pango_script_khmer is
		do
			value := pango_script_khmer_low_level
		end

	set_pango_script_lao is
		do
			value := pango_script_lao_low_level
		end

	set_pango_script_latin is
		do
			value := pango_script_latin_low_level
		end

	set_pango_script_lepcha is
		do
			value := pango_script_lepcha_low_level
		end

	set_pango_script_limbu is
		do
			value := pango_script_limbu_low_level
		end

	set_pango_script_linear_b is
		do
			value := pango_script_linear_b_low_level
		end

	set_pango_script_lycian is
		do
			value := pango_script_lycian_low_level
		end

	set_pango_script_lydian is
		do
			value := pango_script_lydian_low_level
		end

	set_pango_script_malayalam is
		do
			value := pango_script_malayalam_low_level
		end

	set_pango_script_mongolian is
		do
			value := pango_script_mongolian_low_level
		end

	set_pango_script_myanmar is
		do
			value := pango_script_myanmar_low_level
		end

	set_pango_script_new_tai_lue is
		do
			value := pango_script_new_tai_lue_low_level
		end

	set_pango_script_nko is
		do
			value := pango_script_nko_low_level
		end

	set_pango_script_ogham is
		do
			value := pango_script_ogham_low_level
		end

	set_pango_script_ol_chiki is
		do
			value := pango_script_ol_chiki_low_level
		end

	set_pango_script_old_italic is
		do
			value := pango_script_old_italic_low_level
		end

	set_pango_script_old_persian is
		do
			value := pango_script_old_persian_low_level
		end

	set_pango_script_oriya is
		do
			value := pango_script_oriya_low_level
		end

	set_pango_script_osmanya is
		do
			value := pango_script_osmanya_low_level
		end

	set_pango_script_phags_pa is
		do
			value := pango_script_phags_pa_low_level
		end

	set_pango_script_phoenician is
		do
			value := pango_script_phoenician_low_level
		end

	set_pango_script_rejang is
		do
			value := pango_script_rejang_low_level
		end

	set_pango_script_runic is
		do
			value := pango_script_runic_low_level
		end

	set_pango_script_saurashtra is
		do
			value := pango_script_saurashtra_low_level
		end

	set_pango_script_shavian is
		do
			value := pango_script_shavian_low_level
		end

	set_pango_script_sinhala is
		do
			value := pango_script_sinhala_low_level
		end

	set_pango_script_sundanese is
		do
			value := pango_script_sundanese_low_level
		end

	set_pango_script_syloti_nagri is
		do
			value := pango_script_syloti_nagri_low_level
		end

	set_pango_script_syriac is
		do
			value := pango_script_syriac_low_level
		end

	set_pango_script_tagalog is
		do
			value := pango_script_tagalog_low_level
		end

	set_pango_script_tagbanwa is
		do
			value := pango_script_tagbanwa_low_level
		end

	set_pango_script_tai_le is
		do
			value := pango_script_tai_le_low_level
		end

	set_pango_script_tamil is
		do
			value := pango_script_tamil_low_level
		end

	set_pango_script_telugu is
		do
			value := pango_script_telugu_low_level
		end

	set_pango_script_thaana is
		do
			value := pango_script_thaana_low_level
		end

	set_pango_script_thai is
		do
			value := pango_script_thai_low_level
		end

	set_pango_script_tibetan is
		do
			value := pango_script_tibetan_low_level
		end

	set_pango_script_tifinagh is
		do
			value := pango_script_tifinagh_low_level
		end

	set_pango_script_ugaritic is
		do
			value := pango_script_ugaritic_low_level
		end

	set_pango_script_unknown is
		do
			value := pango_script_unknown_low_level
		end

	set_pango_script_vai is
		do
			value := pango_script_vai_low_level
		end

	set_pango_script_yi is
		do
			value := pango_script_yi_low_level
		end

feature {ANY} -- Queries
	is_pango_script_arabic: BOOLEAN is
		do
			Result := (value=pango_script_arabic_low_level)
		end

	is_pango_script_armenian: BOOLEAN is
		do
			Result := (value=pango_script_armenian_low_level)
		end

	is_pango_script_balinese: BOOLEAN is
		do
			Result := (value=pango_script_balinese_low_level)
		end

	is_pango_script_bengali: BOOLEAN is
		do
			Result := (value=pango_script_bengali_low_level)
		end

	is_pango_script_bopomofo: BOOLEAN is
		do
			Result := (value=pango_script_bopomofo_low_level)
		end

	is_pango_script_braille: BOOLEAN is
		do
			Result := (value=pango_script_braille_low_level)
		end

	is_pango_script_buginese: BOOLEAN is
		do
			Result := (value=pango_script_buginese_low_level)
		end

	is_pango_script_buhid: BOOLEAN is
		do
			Result := (value=pango_script_buhid_low_level)
		end

	is_pango_script_canadian_aboriginal: BOOLEAN is
		do
			Result := (value=pango_script_canadian_aboriginal_low_level)
		end

	is_pango_script_carian: BOOLEAN is
		do
			Result := (value=pango_script_carian_low_level)
		end

	is_pango_script_cham: BOOLEAN is
		do
			Result := (value=pango_script_cham_low_level)
		end

	is_pango_script_cherokee: BOOLEAN is
		do
			Result := (value=pango_script_cherokee_low_level)
		end

	is_pango_script_common: BOOLEAN is
		do
			Result := (value=pango_script_common_low_level)
		end

	is_pango_script_coptic: BOOLEAN is
		do
			Result := (value=pango_script_coptic_low_level)
		end

	is_pango_script_cuneiform: BOOLEAN is
		do
			Result := (value=pango_script_cuneiform_low_level)
		end

	is_pango_script_cypriot: BOOLEAN is
		do
			Result := (value=pango_script_cypriot_low_level)
		end

	is_pango_script_cyrillic: BOOLEAN is
		do
			Result := (value=pango_script_cyrillic_low_level)
		end

	is_pango_script_deseret: BOOLEAN is
		do
			Result := (value=pango_script_deseret_low_level)
		end

	is_pango_script_devanagari: BOOLEAN is
		do
			Result := (value=pango_script_devanagari_low_level)
		end

	is_pango_script_ethiopic: BOOLEAN is
		do
			Result := (value=pango_script_ethiopic_low_level)
		end

	is_pango_script_georgian: BOOLEAN is
		do
			Result := (value=pango_script_georgian_low_level)
		end

	is_pango_script_glagolitic: BOOLEAN is
		do
			Result := (value=pango_script_glagolitic_low_level)
		end

	is_pango_script_gothic: BOOLEAN is
		do
			Result := (value=pango_script_gothic_low_level)
		end

	is_pango_script_greek: BOOLEAN is
		do
			Result := (value=pango_script_greek_low_level)
		end

	is_pango_script_gujarati: BOOLEAN is
		do
			Result := (value=pango_script_gujarati_low_level)
		end

	is_pango_script_gurmukhi: BOOLEAN is
		do
			Result := (value=pango_script_gurmukhi_low_level)
		end

	is_pango_script_han: BOOLEAN is
		do
			Result := (value=pango_script_han_low_level)
		end

	is_pango_script_hangul: BOOLEAN is
		do
			Result := (value=pango_script_hangul_low_level)
		end

	is_pango_script_hanunoo: BOOLEAN is
		do
			Result := (value=pango_script_hanunoo_low_level)
		end

	is_pango_script_hebrew: BOOLEAN is
		do
			Result := (value=pango_script_hebrew_low_level)
		end

	is_pango_script_hiragana: BOOLEAN is
		do
			Result := (value=pango_script_hiragana_low_level)
		end

	is_pango_script_inherited: BOOLEAN is
		do
			Result := (value=pango_script_inherited_low_level)
		end

	is_pango_script_invalid_code: BOOLEAN is
		do
			Result := (value=pango_script_invalid_code_low_level)
		end

	is_pango_script_kannada: BOOLEAN is
		do
			Result := (value=pango_script_kannada_low_level)
		end

	is_pango_script_katakana: BOOLEAN is
		do
			Result := (value=pango_script_katakana_low_level)
		end

	is_pango_script_kayah_li: BOOLEAN is
		do
			Result := (value=pango_script_kayah_li_low_level)
		end

	is_pango_script_kharoshthi: BOOLEAN is
		do
			Result := (value=pango_script_kharoshthi_low_level)
		end

	is_pango_script_khmer: BOOLEAN is
		do
			Result := (value=pango_script_khmer_low_level)
		end

	is_pango_script_lao: BOOLEAN is
		do
			Result := (value=pango_script_lao_low_level)
		end

	is_pango_script_latin: BOOLEAN is
		do
			Result := (value=pango_script_latin_low_level)
		end

	is_pango_script_lepcha: BOOLEAN is
		do
			Result := (value=pango_script_lepcha_low_level)
		end

	is_pango_script_limbu: BOOLEAN is
		do
			Result := (value=pango_script_limbu_low_level)
		end

	is_pango_script_linear_b: BOOLEAN is
		do
			Result := (value=pango_script_linear_b_low_level)
		end

	is_pango_script_lycian: BOOLEAN is
		do
			Result := (value=pango_script_lycian_low_level)
		end

	is_pango_script_lydian: BOOLEAN is
		do
			Result := (value=pango_script_lydian_low_level)
		end

	is_pango_script_malayalam: BOOLEAN is
		do
			Result := (value=pango_script_malayalam_low_level)
		end

	is_pango_script_mongolian: BOOLEAN is
		do
			Result := (value=pango_script_mongolian_low_level)
		end

	is_pango_script_myanmar: BOOLEAN is
		do
			Result := (value=pango_script_myanmar_low_level)
		end

	is_pango_script_new_tai_lue: BOOLEAN is
		do
			Result := (value=pango_script_new_tai_lue_low_level)
		end

	is_pango_script_nko: BOOLEAN is
		do
			Result := (value=pango_script_nko_low_level)
		end

	is_pango_script_ogham: BOOLEAN is
		do
			Result := (value=pango_script_ogham_low_level)
		end

	is_pango_script_ol_chiki: BOOLEAN is
		do
			Result := (value=pango_script_ol_chiki_low_level)
		end

	is_pango_script_old_italic: BOOLEAN is
		do
			Result := (value=pango_script_old_italic_low_level)
		end

	is_pango_script_old_persian: BOOLEAN is
		do
			Result := (value=pango_script_old_persian_low_level)
		end

	is_pango_script_oriya: BOOLEAN is
		do
			Result := (value=pango_script_oriya_low_level)
		end

	is_pango_script_osmanya: BOOLEAN is
		do
			Result := (value=pango_script_osmanya_low_level)
		end

	is_pango_script_phags_pa: BOOLEAN is
		do
			Result := (value=pango_script_phags_pa_low_level)
		end

	is_pango_script_phoenician: BOOLEAN is
		do
			Result := (value=pango_script_phoenician_low_level)
		end

	is_pango_script_rejang: BOOLEAN is
		do
			Result := (value=pango_script_rejang_low_level)
		end

	is_pango_script_runic: BOOLEAN is
		do
			Result := (value=pango_script_runic_low_level)
		end

	is_pango_script_saurashtra: BOOLEAN is
		do
			Result := (value=pango_script_saurashtra_low_level)
		end

	is_pango_script_shavian: BOOLEAN is
		do
			Result := (value=pango_script_shavian_low_level)
		end

	is_pango_script_sinhala: BOOLEAN is
		do
			Result := (value=pango_script_sinhala_low_level)
		end

	is_pango_script_sundanese: BOOLEAN is
		do
			Result := (value=pango_script_sundanese_low_level)
		end

	is_pango_script_syloti_nagri: BOOLEAN is
		do
			Result := (value=pango_script_syloti_nagri_low_level)
		end

	is_pango_script_syriac: BOOLEAN is
		do
			Result := (value=pango_script_syriac_low_level)
		end

	is_pango_script_tagalog: BOOLEAN is
		do
			Result := (value=pango_script_tagalog_low_level)
		end

	is_pango_script_tagbanwa: BOOLEAN is
		do
			Result := (value=pango_script_tagbanwa_low_level)
		end

	is_pango_script_tai_le: BOOLEAN is
		do
			Result := (value=pango_script_tai_le_low_level)
		end

	is_pango_script_tamil: BOOLEAN is
		do
			Result := (value=pango_script_tamil_low_level)
		end

	is_pango_script_telugu: BOOLEAN is
		do
			Result := (value=pango_script_telugu_low_level)
		end

	is_pango_script_thaana: BOOLEAN is
		do
			Result := (value=pango_script_thaana_low_level)
		end

	is_pango_script_thai: BOOLEAN is
		do
			Result := (value=pango_script_thai_low_level)
		end

	is_pango_script_tibetan: BOOLEAN is
		do
			Result := (value=pango_script_tibetan_low_level)
		end

	is_pango_script_tifinagh: BOOLEAN is
		do
			Result := (value=pango_script_tifinagh_low_level)
		end

	is_pango_script_ugaritic: BOOLEAN is
		do
			Result := (value=pango_script_ugaritic_low_level)
		end

	is_pango_script_unknown: BOOLEAN is
		do
			Result := (value=pango_script_unknown_low_level)
		end

	is_pango_script_vai: BOOLEAN is
		do
			Result := (value=pango_script_vai_low_level)
		end

	is_pango_script_yi: BOOLEAN is
		do
			Result := (value=pango_script_yi_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_script_arabic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_ARABIC"
 			}"
 		end

	pango_script_armenian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_ARMENIAN"
 			}"
 		end

	pango_script_balinese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_BALINESE"
 			}"
 		end

	pango_script_bengali_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_BENGALI"
 			}"
 		end

	pango_script_bopomofo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_BOPOMOFO"
 			}"
 		end

	pango_script_braille_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_BRAILLE"
 			}"
 		end

	pango_script_buginese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_BUGINESE"
 			}"
 		end

	pango_script_buhid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_BUHID"
 			}"
 		end

	pango_script_canadian_aboriginal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_CANADIAN_ABORIGINAL"
 			}"
 		end

	pango_script_carian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_CARIAN"
 			}"
 		end

	pango_script_cham_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_CHAM"
 			}"
 		end

	pango_script_cherokee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_CHEROKEE"
 			}"
 		end

	pango_script_common_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_COMMON"
 			}"
 		end

	pango_script_coptic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_COPTIC"
 			}"
 		end

	pango_script_cuneiform_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_CUNEIFORM"
 			}"
 		end

	pango_script_cypriot_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_CYPRIOT"
 			}"
 		end

	pango_script_cyrillic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_CYRILLIC"
 			}"
 		end

	pango_script_deseret_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_DESERET"
 			}"
 		end

	pango_script_devanagari_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_DEVANAGARI"
 			}"
 		end

	pango_script_ethiopic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_ETHIOPIC"
 			}"
 		end

	pango_script_georgian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_GEORGIAN"
 			}"
 		end

	pango_script_glagolitic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_GLAGOLITIC"
 			}"
 		end

	pango_script_gothic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_GOTHIC"
 			}"
 		end

	pango_script_greek_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_GREEK"
 			}"
 		end

	pango_script_gujarati_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_GUJARATI"
 			}"
 		end

	pango_script_gurmukhi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_GURMUKHI"
 			}"
 		end

	pango_script_han_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_HAN"
 			}"
 		end

	pango_script_hangul_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_HANGUL"
 			}"
 		end

	pango_script_hanunoo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_HANUNOO"
 			}"
 		end

	pango_script_hebrew_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_HEBREW"
 			}"
 		end

	pango_script_hiragana_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_HIRAGANA"
 			}"
 		end

	pango_script_inherited_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_INHERITED"
 			}"
 		end

	pango_script_invalid_code_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_INVALID_CODE"
 			}"
 		end

	pango_script_kannada_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_KANNADA"
 			}"
 		end

	pango_script_katakana_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_KATAKANA"
 			}"
 		end

	pango_script_kayah_li_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_KAYAH_LI"
 			}"
 		end

	pango_script_kharoshthi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_KHAROSHTHI"
 			}"
 		end

	pango_script_khmer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_KHMER"
 			}"
 		end

	pango_script_lao_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_LAO"
 			}"
 		end

	pango_script_latin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_LATIN"
 			}"
 		end

	pango_script_lepcha_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_LEPCHA"
 			}"
 		end

	pango_script_limbu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_LIMBU"
 			}"
 		end

	pango_script_linear_b_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_LINEAR_B"
 			}"
 		end

	pango_script_lycian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_LYCIAN"
 			}"
 		end

	pango_script_lydian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_LYDIAN"
 			}"
 		end

	pango_script_malayalam_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_MALAYALAM"
 			}"
 		end

	pango_script_mongolian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_MONGOLIAN"
 			}"
 		end

	pango_script_myanmar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_MYANMAR"
 			}"
 		end

	pango_script_new_tai_lue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_NEW_TAI_LUE"
 			}"
 		end

	pango_script_nko_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_NKO"
 			}"
 		end

	pango_script_ogham_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_OGHAM"
 			}"
 		end

	pango_script_ol_chiki_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_OL_CHIKI"
 			}"
 		end

	pango_script_old_italic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_OLD_ITALIC"
 			}"
 		end

	pango_script_old_persian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_OLD_PERSIAN"
 			}"
 		end

	pango_script_oriya_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_ORIYA"
 			}"
 		end

	pango_script_osmanya_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_OSMANYA"
 			}"
 		end

	pango_script_phags_pa_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_PHAGS_PA"
 			}"
 		end

	pango_script_phoenician_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_PHOENICIAN"
 			}"
 		end

	pango_script_rejang_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_REJANG"
 			}"
 		end

	pango_script_runic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_RUNIC"
 			}"
 		end

	pango_script_saurashtra_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_SAURASHTRA"
 			}"
 		end

	pango_script_shavian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_SHAVIAN"
 			}"
 		end

	pango_script_sinhala_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_SINHALA"
 			}"
 		end

	pango_script_sundanese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_SUNDANESE"
 			}"
 		end

	pango_script_syloti_nagri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_SYLOTI_NAGRI"
 			}"
 		end

	pango_script_syriac_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_SYRIAC"
 			}"
 		end

	pango_script_tagalog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_TAGALOG"
 			}"
 		end

	pango_script_tagbanwa_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_TAGBANWA"
 			}"
 		end

	pango_script_tai_le_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_TAI_LE"
 			}"
 		end

	pango_script_tamil_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_TAMIL"
 			}"
 		end

	pango_script_telugu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_TELUGU"
 			}"
 		end

	pango_script_thaana_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_THAANA"
 			}"
 		end

	pango_script_thai_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_THAI"
 			}"
 		end

	pango_script_tibetan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_TIBETAN"
 			}"
 		end

	pango_script_tifinagh_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_TIFINAGH"
 			}"
 		end

	pango_script_ugaritic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_UGARITIC"
 			}"
 		end

	pango_script_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_UNKNOWN"
 			}"
 		end

	pango_script_vai_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_VAI"
 			}"
 		end

	pango_script_yi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_SCRIPT_YI"
 			}"
 		end


end -- class PANGOSCRIPT_ENUM
