-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODESCRIPT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_unicode_script_arabic_low_level)  or else
				(a_value = g_unicode_script_armenian_low_level)  or else
				(a_value = g_unicode_script_avestan_low_level)  or else
				(a_value = g_unicode_script_balinese_low_level)  or else
				(a_value = g_unicode_script_bamum_low_level)  or else
				(a_value = g_unicode_script_batak_low_level)  or else
				(a_value = g_unicode_script_bengali_low_level)  or else
				(a_value = g_unicode_script_bopomofo_low_level)  or else
				(a_value = g_unicode_script_brahmi_low_level)  or else
				(a_value = g_unicode_script_braille_low_level)  or else
				(a_value = g_unicode_script_buginese_low_level)  or else
				(a_value = g_unicode_script_buhid_low_level)  or else
				(a_value = g_unicode_script_canadian_aboriginal_low_level)  or else
				(a_value = g_unicode_script_carian_low_level)  or else
				(a_value = g_unicode_script_chakma_low_level)  or else
				(a_value = g_unicode_script_cham_low_level)  or else
				(a_value = g_unicode_script_cherokee_low_level)  or else
				(a_value = g_unicode_script_common_low_level)  or else
				(a_value = g_unicode_script_coptic_low_level)  or else
				(a_value = g_unicode_script_cuneiform_low_level)  or else
				(a_value = g_unicode_script_cypriot_low_level)  or else
				(a_value = g_unicode_script_cyrillic_low_level)  or else
				(a_value = g_unicode_script_deseret_low_level)  or else
				(a_value = g_unicode_script_devanagari_low_level)  or else
				(a_value = g_unicode_script_egyptian_hieroglyphs_low_level)  or else
				(a_value = g_unicode_script_ethiopic_low_level)  or else
				(a_value = g_unicode_script_georgian_low_level)  or else
				(a_value = g_unicode_script_glagolitic_low_level)  or else
				(a_value = g_unicode_script_gothic_low_level)  or else
				(a_value = g_unicode_script_greek_low_level)  or else
				(a_value = g_unicode_script_gujarati_low_level)  or else
				(a_value = g_unicode_script_gurmukhi_low_level)  or else
				(a_value = g_unicode_script_han_low_level)  or else
				(a_value = g_unicode_script_hangul_low_level)  or else
				(a_value = g_unicode_script_hanunoo_low_level)  or else
				(a_value = g_unicode_script_hebrew_low_level)  or else
				(a_value = g_unicode_script_hiragana_low_level)  or else
				(a_value = g_unicode_script_imperial_aramaic_low_level)  or else
				(a_value = g_unicode_script_inherited_low_level)  or else
				(a_value = g_unicode_script_inscriptional_pahlavi_low_level)  or else
				(a_value = g_unicode_script_inscriptional_parthian_low_level)  or else
				(a_value = g_unicode_script_invalid_code_low_level)  or else
				(a_value = g_unicode_script_javanese_low_level)  or else
				(a_value = g_unicode_script_kaithi_low_level)  or else
				(a_value = g_unicode_script_kannada_low_level)  or else
				(a_value = g_unicode_script_katakana_low_level)  or else
				(a_value = g_unicode_script_kayah_li_low_level)  or else
				(a_value = g_unicode_script_kharoshthi_low_level)  or else
				(a_value = g_unicode_script_khmer_low_level)  or else
				(a_value = g_unicode_script_lao_low_level)  or else
				(a_value = g_unicode_script_latin_low_level)  or else
				(a_value = g_unicode_script_lepcha_low_level)  or else
				(a_value = g_unicode_script_limbu_low_level)  or else
				(a_value = g_unicode_script_linear_b_low_level)  or else
				(a_value = g_unicode_script_lisu_low_level)  or else
				(a_value = g_unicode_script_lycian_low_level)  or else
				(a_value = g_unicode_script_lydian_low_level)  or else
				(a_value = g_unicode_script_malayalam_low_level)  or else
				(a_value = g_unicode_script_mandaic_low_level)  or else
				(a_value = g_unicode_script_meetei_mayek_low_level)  or else
				(a_value = g_unicode_script_meroitic_cursive_low_level)  or else
				(a_value = g_unicode_script_meroitic_hieroglyphs_low_level)  or else
				(a_value = g_unicode_script_miao_low_level)  or else
				(a_value = g_unicode_script_mongolian_low_level)  or else
				(a_value = g_unicode_script_myanmar_low_level)  or else
				(a_value = g_unicode_script_new_tai_lue_low_level)  or else
				(a_value = g_unicode_script_nko_low_level)  or else
				(a_value = g_unicode_script_ogham_low_level)  or else
				(a_value = g_unicode_script_ol_chiki_low_level)  or else
				(a_value = g_unicode_script_old_italic_low_level)  or else
				(a_value = g_unicode_script_old_persian_low_level)  or else
				(a_value = g_unicode_script_old_south_arabian_low_level)  or else
				(a_value = g_unicode_script_old_turkic_low_level)  or else
				(a_value = g_unicode_script_oriya_low_level)  or else
				(a_value = g_unicode_script_osmanya_low_level)  or else
				(a_value = g_unicode_script_phags_pa_low_level)  or else
				(a_value = g_unicode_script_phoenician_low_level)  or else
				(a_value = g_unicode_script_rejang_low_level)  or else
				(a_value = g_unicode_script_runic_low_level)  or else
				(a_value = g_unicode_script_samaritan_low_level)  or else
				(a_value = g_unicode_script_saurashtra_low_level)  or else
				(a_value = g_unicode_script_sharada_low_level)  or else
				(a_value = g_unicode_script_shavian_low_level)  or else
				(a_value = g_unicode_script_sinhala_low_level)  or else
				(a_value = g_unicode_script_sora_sompeng_low_level)  or else
				(a_value = g_unicode_script_sundanese_low_level)  or else
				(a_value = g_unicode_script_syloti_nagri_low_level)  or else
				(a_value = g_unicode_script_syriac_low_level)  or else
				(a_value = g_unicode_script_tagalog_low_level)  or else
				(a_value = g_unicode_script_tagbanwa_low_level)  or else
				(a_value = g_unicode_script_tai_le_low_level)  or else
				(a_value = g_unicode_script_tai_tham_low_level)  or else
				(a_value = g_unicode_script_tai_viet_low_level)  or else
				(a_value = g_unicode_script_takri_low_level)  or else
				(a_value = g_unicode_script_tamil_low_level)  or else
				(a_value = g_unicode_script_telugu_low_level)  or else
				(a_value = g_unicode_script_thaana_low_level)  or else
				(a_value = g_unicode_script_thai_low_level)  or else
				(a_value = g_unicode_script_tibetan_low_level)  or else
				(a_value = g_unicode_script_tifinagh_low_level)  or else
				(a_value = g_unicode_script_ugaritic_low_level)  or else
				(a_value = g_unicode_script_unknown_low_level)  or else
				(a_value = g_unicode_script_vai_low_level)  or else
				(a_value = g_unicode_script_yi_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_unicode_script_arabic is
		do
			value := g_unicode_script_arabic_low_level
		end

	set_g_unicode_script_armenian is
		do
			value := g_unicode_script_armenian_low_level
		end

	set_g_unicode_script_avestan is
		do
			value := g_unicode_script_avestan_low_level
		end

	set_g_unicode_script_balinese is
		do
			value := g_unicode_script_balinese_low_level
		end

	set_g_unicode_script_bamum is
		do
			value := g_unicode_script_bamum_low_level
		end

	set_g_unicode_script_batak is
		do
			value := g_unicode_script_batak_low_level
		end

	set_g_unicode_script_bengali is
		do
			value := g_unicode_script_bengali_low_level
		end

	set_g_unicode_script_bopomofo is
		do
			value := g_unicode_script_bopomofo_low_level
		end

	set_g_unicode_script_brahmi is
		do
			value := g_unicode_script_brahmi_low_level
		end

	set_g_unicode_script_braille is
		do
			value := g_unicode_script_braille_low_level
		end

	set_g_unicode_script_buginese is
		do
			value := g_unicode_script_buginese_low_level
		end

	set_g_unicode_script_buhid is
		do
			value := g_unicode_script_buhid_low_level
		end

	set_g_unicode_script_canadian_aboriginal is
		do
			value := g_unicode_script_canadian_aboriginal_low_level
		end

	set_g_unicode_script_carian is
		do
			value := g_unicode_script_carian_low_level
		end

	set_g_unicode_script_chakma is
		do
			value := g_unicode_script_chakma_low_level
		end

	set_g_unicode_script_cham is
		do
			value := g_unicode_script_cham_low_level
		end

	set_g_unicode_script_cherokee is
		do
			value := g_unicode_script_cherokee_low_level
		end

	set_g_unicode_script_common is
		do
			value := g_unicode_script_common_low_level
		end

	set_g_unicode_script_coptic is
		do
			value := g_unicode_script_coptic_low_level
		end

	set_g_unicode_script_cuneiform is
		do
			value := g_unicode_script_cuneiform_low_level
		end

	set_g_unicode_script_cypriot is
		do
			value := g_unicode_script_cypriot_low_level
		end

	set_g_unicode_script_cyrillic is
		do
			value := g_unicode_script_cyrillic_low_level
		end

	set_g_unicode_script_deseret is
		do
			value := g_unicode_script_deseret_low_level
		end

	set_g_unicode_script_devanagari is
		do
			value := g_unicode_script_devanagari_low_level
		end

	set_g_unicode_script_egyptian_hieroglyphs is
		do
			value := g_unicode_script_egyptian_hieroglyphs_low_level
		end

	set_g_unicode_script_ethiopic is
		do
			value := g_unicode_script_ethiopic_low_level
		end

	set_g_unicode_script_georgian is
		do
			value := g_unicode_script_georgian_low_level
		end

	set_g_unicode_script_glagolitic is
		do
			value := g_unicode_script_glagolitic_low_level
		end

	set_g_unicode_script_gothic is
		do
			value := g_unicode_script_gothic_low_level
		end

	set_g_unicode_script_greek is
		do
			value := g_unicode_script_greek_low_level
		end

	set_g_unicode_script_gujarati is
		do
			value := g_unicode_script_gujarati_low_level
		end

	set_g_unicode_script_gurmukhi is
		do
			value := g_unicode_script_gurmukhi_low_level
		end

	set_g_unicode_script_han is
		do
			value := g_unicode_script_han_low_level
		end

	set_g_unicode_script_hangul is
		do
			value := g_unicode_script_hangul_low_level
		end

	set_g_unicode_script_hanunoo is
		do
			value := g_unicode_script_hanunoo_low_level
		end

	set_g_unicode_script_hebrew is
		do
			value := g_unicode_script_hebrew_low_level
		end

	set_g_unicode_script_hiragana is
		do
			value := g_unicode_script_hiragana_low_level
		end

	set_g_unicode_script_imperial_aramaic is
		do
			value := g_unicode_script_imperial_aramaic_low_level
		end

	set_g_unicode_script_inherited is
		do
			value := g_unicode_script_inherited_low_level
		end

	set_g_unicode_script_inscriptional_pahlavi is
		do
			value := g_unicode_script_inscriptional_pahlavi_low_level
		end

	set_g_unicode_script_inscriptional_parthian is
		do
			value := g_unicode_script_inscriptional_parthian_low_level
		end

	set_g_unicode_script_invalid_code is
		do
			value := g_unicode_script_invalid_code_low_level
		end

	set_g_unicode_script_javanese is
		do
			value := g_unicode_script_javanese_low_level
		end

	set_g_unicode_script_kaithi is
		do
			value := g_unicode_script_kaithi_low_level
		end

	set_g_unicode_script_kannada is
		do
			value := g_unicode_script_kannada_low_level
		end

	set_g_unicode_script_katakana is
		do
			value := g_unicode_script_katakana_low_level
		end

	set_g_unicode_script_kayah_li is
		do
			value := g_unicode_script_kayah_li_low_level
		end

	set_g_unicode_script_kharoshthi is
		do
			value := g_unicode_script_kharoshthi_low_level
		end

	set_g_unicode_script_khmer is
		do
			value := g_unicode_script_khmer_low_level
		end

	set_g_unicode_script_lao is
		do
			value := g_unicode_script_lao_low_level
		end

	set_g_unicode_script_latin is
		do
			value := g_unicode_script_latin_low_level
		end

	set_g_unicode_script_lepcha is
		do
			value := g_unicode_script_lepcha_low_level
		end

	set_g_unicode_script_limbu is
		do
			value := g_unicode_script_limbu_low_level
		end

	set_g_unicode_script_linear_b is
		do
			value := g_unicode_script_linear_b_low_level
		end

	set_g_unicode_script_lisu is
		do
			value := g_unicode_script_lisu_low_level
		end

	set_g_unicode_script_lycian is
		do
			value := g_unicode_script_lycian_low_level
		end

	set_g_unicode_script_lydian is
		do
			value := g_unicode_script_lydian_low_level
		end

	set_g_unicode_script_malayalam is
		do
			value := g_unicode_script_malayalam_low_level
		end

	set_g_unicode_script_mandaic is
		do
			value := g_unicode_script_mandaic_low_level
		end

	set_g_unicode_script_meetei_mayek is
		do
			value := g_unicode_script_meetei_mayek_low_level
		end

	set_g_unicode_script_meroitic_cursive is
		do
			value := g_unicode_script_meroitic_cursive_low_level
		end

	set_g_unicode_script_meroitic_hieroglyphs is
		do
			value := g_unicode_script_meroitic_hieroglyphs_low_level
		end

	set_g_unicode_script_miao is
		do
			value := g_unicode_script_miao_low_level
		end

	set_g_unicode_script_mongolian is
		do
			value := g_unicode_script_mongolian_low_level
		end

	set_g_unicode_script_myanmar is
		do
			value := g_unicode_script_myanmar_low_level
		end

	set_g_unicode_script_new_tai_lue is
		do
			value := g_unicode_script_new_tai_lue_low_level
		end

	set_g_unicode_script_nko is
		do
			value := g_unicode_script_nko_low_level
		end

	set_g_unicode_script_ogham is
		do
			value := g_unicode_script_ogham_low_level
		end

	set_g_unicode_script_ol_chiki is
		do
			value := g_unicode_script_ol_chiki_low_level
		end

	set_g_unicode_script_old_italic is
		do
			value := g_unicode_script_old_italic_low_level
		end

	set_g_unicode_script_old_persian is
		do
			value := g_unicode_script_old_persian_low_level
		end

	set_g_unicode_script_old_south_arabian is
		do
			value := g_unicode_script_old_south_arabian_low_level
		end

	set_g_unicode_script_old_turkic is
		do
			value := g_unicode_script_old_turkic_low_level
		end

	set_g_unicode_script_oriya is
		do
			value := g_unicode_script_oriya_low_level
		end

	set_g_unicode_script_osmanya is
		do
			value := g_unicode_script_osmanya_low_level
		end

	set_g_unicode_script_phags_pa is
		do
			value := g_unicode_script_phags_pa_low_level
		end

	set_g_unicode_script_phoenician is
		do
			value := g_unicode_script_phoenician_low_level
		end

	set_g_unicode_script_rejang is
		do
			value := g_unicode_script_rejang_low_level
		end

	set_g_unicode_script_runic is
		do
			value := g_unicode_script_runic_low_level
		end

	set_g_unicode_script_samaritan is
		do
			value := g_unicode_script_samaritan_low_level
		end

	set_g_unicode_script_saurashtra is
		do
			value := g_unicode_script_saurashtra_low_level
		end

	set_g_unicode_script_sharada is
		do
			value := g_unicode_script_sharada_low_level
		end

	set_g_unicode_script_shavian is
		do
			value := g_unicode_script_shavian_low_level
		end

	set_g_unicode_script_sinhala is
		do
			value := g_unicode_script_sinhala_low_level
		end

	set_g_unicode_script_sora_sompeng is
		do
			value := g_unicode_script_sora_sompeng_low_level
		end

	set_g_unicode_script_sundanese is
		do
			value := g_unicode_script_sundanese_low_level
		end

	set_g_unicode_script_syloti_nagri is
		do
			value := g_unicode_script_syloti_nagri_low_level
		end

	set_g_unicode_script_syriac is
		do
			value := g_unicode_script_syriac_low_level
		end

	set_g_unicode_script_tagalog is
		do
			value := g_unicode_script_tagalog_low_level
		end

	set_g_unicode_script_tagbanwa is
		do
			value := g_unicode_script_tagbanwa_low_level
		end

	set_g_unicode_script_tai_le is
		do
			value := g_unicode_script_tai_le_low_level
		end

	set_g_unicode_script_tai_tham is
		do
			value := g_unicode_script_tai_tham_low_level
		end

	set_g_unicode_script_tai_viet is
		do
			value := g_unicode_script_tai_viet_low_level
		end

	set_g_unicode_script_takri is
		do
			value := g_unicode_script_takri_low_level
		end

	set_g_unicode_script_tamil is
		do
			value := g_unicode_script_tamil_low_level
		end

	set_g_unicode_script_telugu is
		do
			value := g_unicode_script_telugu_low_level
		end

	set_g_unicode_script_thaana is
		do
			value := g_unicode_script_thaana_low_level
		end

	set_g_unicode_script_thai is
		do
			value := g_unicode_script_thai_low_level
		end

	set_g_unicode_script_tibetan is
		do
			value := g_unicode_script_tibetan_low_level
		end

	set_g_unicode_script_tifinagh is
		do
			value := g_unicode_script_tifinagh_low_level
		end

	set_g_unicode_script_ugaritic is
		do
			value := g_unicode_script_ugaritic_low_level
		end

	set_g_unicode_script_unknown is
		do
			value := g_unicode_script_unknown_low_level
		end

	set_g_unicode_script_vai is
		do
			value := g_unicode_script_vai_low_level
		end

	set_g_unicode_script_yi is
		do
			value := g_unicode_script_yi_low_level
		end

feature {ANY} -- Queries
	is_g_unicode_script_arabic: BOOLEAN is
		do
			Result := (value=g_unicode_script_arabic_low_level)
		end

	is_g_unicode_script_armenian: BOOLEAN is
		do
			Result := (value=g_unicode_script_armenian_low_level)
		end

	is_g_unicode_script_avestan: BOOLEAN is
		do
			Result := (value=g_unicode_script_avestan_low_level)
		end

	is_g_unicode_script_balinese: BOOLEAN is
		do
			Result := (value=g_unicode_script_balinese_low_level)
		end

	is_g_unicode_script_bamum: BOOLEAN is
		do
			Result := (value=g_unicode_script_bamum_low_level)
		end

	is_g_unicode_script_batak: BOOLEAN is
		do
			Result := (value=g_unicode_script_batak_low_level)
		end

	is_g_unicode_script_bengali: BOOLEAN is
		do
			Result := (value=g_unicode_script_bengali_low_level)
		end

	is_g_unicode_script_bopomofo: BOOLEAN is
		do
			Result := (value=g_unicode_script_bopomofo_low_level)
		end

	is_g_unicode_script_brahmi: BOOLEAN is
		do
			Result := (value=g_unicode_script_brahmi_low_level)
		end

	is_g_unicode_script_braille: BOOLEAN is
		do
			Result := (value=g_unicode_script_braille_low_level)
		end

	is_g_unicode_script_buginese: BOOLEAN is
		do
			Result := (value=g_unicode_script_buginese_low_level)
		end

	is_g_unicode_script_buhid: BOOLEAN is
		do
			Result := (value=g_unicode_script_buhid_low_level)
		end

	is_g_unicode_script_canadian_aboriginal: BOOLEAN is
		do
			Result := (value=g_unicode_script_canadian_aboriginal_low_level)
		end

	is_g_unicode_script_carian: BOOLEAN is
		do
			Result := (value=g_unicode_script_carian_low_level)
		end

	is_g_unicode_script_chakma: BOOLEAN is
		do
			Result := (value=g_unicode_script_chakma_low_level)
		end

	is_g_unicode_script_cham: BOOLEAN is
		do
			Result := (value=g_unicode_script_cham_low_level)
		end

	is_g_unicode_script_cherokee: BOOLEAN is
		do
			Result := (value=g_unicode_script_cherokee_low_level)
		end

	is_g_unicode_script_common: BOOLEAN is
		do
			Result := (value=g_unicode_script_common_low_level)
		end

	is_g_unicode_script_coptic: BOOLEAN is
		do
			Result := (value=g_unicode_script_coptic_low_level)
		end

	is_g_unicode_script_cuneiform: BOOLEAN is
		do
			Result := (value=g_unicode_script_cuneiform_low_level)
		end

	is_g_unicode_script_cypriot: BOOLEAN is
		do
			Result := (value=g_unicode_script_cypriot_low_level)
		end

	is_g_unicode_script_cyrillic: BOOLEAN is
		do
			Result := (value=g_unicode_script_cyrillic_low_level)
		end

	is_g_unicode_script_deseret: BOOLEAN is
		do
			Result := (value=g_unicode_script_deseret_low_level)
		end

	is_g_unicode_script_devanagari: BOOLEAN is
		do
			Result := (value=g_unicode_script_devanagari_low_level)
		end

	is_g_unicode_script_egyptian_hieroglyphs: BOOLEAN is
		do
			Result := (value=g_unicode_script_egyptian_hieroglyphs_low_level)
		end

	is_g_unicode_script_ethiopic: BOOLEAN is
		do
			Result := (value=g_unicode_script_ethiopic_low_level)
		end

	is_g_unicode_script_georgian: BOOLEAN is
		do
			Result := (value=g_unicode_script_georgian_low_level)
		end

	is_g_unicode_script_glagolitic: BOOLEAN is
		do
			Result := (value=g_unicode_script_glagolitic_low_level)
		end

	is_g_unicode_script_gothic: BOOLEAN is
		do
			Result := (value=g_unicode_script_gothic_low_level)
		end

	is_g_unicode_script_greek: BOOLEAN is
		do
			Result := (value=g_unicode_script_greek_low_level)
		end

	is_g_unicode_script_gujarati: BOOLEAN is
		do
			Result := (value=g_unicode_script_gujarati_low_level)
		end

	is_g_unicode_script_gurmukhi: BOOLEAN is
		do
			Result := (value=g_unicode_script_gurmukhi_low_level)
		end

	is_g_unicode_script_han: BOOLEAN is
		do
			Result := (value=g_unicode_script_han_low_level)
		end

	is_g_unicode_script_hangul: BOOLEAN is
		do
			Result := (value=g_unicode_script_hangul_low_level)
		end

	is_g_unicode_script_hanunoo: BOOLEAN is
		do
			Result := (value=g_unicode_script_hanunoo_low_level)
		end

	is_g_unicode_script_hebrew: BOOLEAN is
		do
			Result := (value=g_unicode_script_hebrew_low_level)
		end

	is_g_unicode_script_hiragana: BOOLEAN is
		do
			Result := (value=g_unicode_script_hiragana_low_level)
		end

	is_g_unicode_script_imperial_aramaic: BOOLEAN is
		do
			Result := (value=g_unicode_script_imperial_aramaic_low_level)
		end

	is_g_unicode_script_inherited: BOOLEAN is
		do
			Result := (value=g_unicode_script_inherited_low_level)
		end

	is_g_unicode_script_inscriptional_pahlavi: BOOLEAN is
		do
			Result := (value=g_unicode_script_inscriptional_pahlavi_low_level)
		end

	is_g_unicode_script_inscriptional_parthian: BOOLEAN is
		do
			Result := (value=g_unicode_script_inscriptional_parthian_low_level)
		end

	is_g_unicode_script_invalid_code: BOOLEAN is
		do
			Result := (value=g_unicode_script_invalid_code_low_level)
		end

	is_g_unicode_script_javanese: BOOLEAN is
		do
			Result := (value=g_unicode_script_javanese_low_level)
		end

	is_g_unicode_script_kaithi: BOOLEAN is
		do
			Result := (value=g_unicode_script_kaithi_low_level)
		end

	is_g_unicode_script_kannada: BOOLEAN is
		do
			Result := (value=g_unicode_script_kannada_low_level)
		end

	is_g_unicode_script_katakana: BOOLEAN is
		do
			Result := (value=g_unicode_script_katakana_low_level)
		end

	is_g_unicode_script_kayah_li: BOOLEAN is
		do
			Result := (value=g_unicode_script_kayah_li_low_level)
		end

	is_g_unicode_script_kharoshthi: BOOLEAN is
		do
			Result := (value=g_unicode_script_kharoshthi_low_level)
		end

	is_g_unicode_script_khmer: BOOLEAN is
		do
			Result := (value=g_unicode_script_khmer_low_level)
		end

	is_g_unicode_script_lao: BOOLEAN is
		do
			Result := (value=g_unicode_script_lao_low_level)
		end

	is_g_unicode_script_latin: BOOLEAN is
		do
			Result := (value=g_unicode_script_latin_low_level)
		end

	is_g_unicode_script_lepcha: BOOLEAN is
		do
			Result := (value=g_unicode_script_lepcha_low_level)
		end

	is_g_unicode_script_limbu: BOOLEAN is
		do
			Result := (value=g_unicode_script_limbu_low_level)
		end

	is_g_unicode_script_linear_b: BOOLEAN is
		do
			Result := (value=g_unicode_script_linear_b_low_level)
		end

	is_g_unicode_script_lisu: BOOLEAN is
		do
			Result := (value=g_unicode_script_lisu_low_level)
		end

	is_g_unicode_script_lycian: BOOLEAN is
		do
			Result := (value=g_unicode_script_lycian_low_level)
		end

	is_g_unicode_script_lydian: BOOLEAN is
		do
			Result := (value=g_unicode_script_lydian_low_level)
		end

	is_g_unicode_script_malayalam: BOOLEAN is
		do
			Result := (value=g_unicode_script_malayalam_low_level)
		end

	is_g_unicode_script_mandaic: BOOLEAN is
		do
			Result := (value=g_unicode_script_mandaic_low_level)
		end

	is_g_unicode_script_meetei_mayek: BOOLEAN is
		do
			Result := (value=g_unicode_script_meetei_mayek_low_level)
		end

	is_g_unicode_script_meroitic_cursive: BOOLEAN is
		do
			Result := (value=g_unicode_script_meroitic_cursive_low_level)
		end

	is_g_unicode_script_meroitic_hieroglyphs: BOOLEAN is
		do
			Result := (value=g_unicode_script_meroitic_hieroglyphs_low_level)
		end

	is_g_unicode_script_miao: BOOLEAN is
		do
			Result := (value=g_unicode_script_miao_low_level)
		end

	is_g_unicode_script_mongolian: BOOLEAN is
		do
			Result := (value=g_unicode_script_mongolian_low_level)
		end

	is_g_unicode_script_myanmar: BOOLEAN is
		do
			Result := (value=g_unicode_script_myanmar_low_level)
		end

	is_g_unicode_script_new_tai_lue: BOOLEAN is
		do
			Result := (value=g_unicode_script_new_tai_lue_low_level)
		end

	is_g_unicode_script_nko: BOOLEAN is
		do
			Result := (value=g_unicode_script_nko_low_level)
		end

	is_g_unicode_script_ogham: BOOLEAN is
		do
			Result := (value=g_unicode_script_ogham_low_level)
		end

	is_g_unicode_script_ol_chiki: BOOLEAN is
		do
			Result := (value=g_unicode_script_ol_chiki_low_level)
		end

	is_g_unicode_script_old_italic: BOOLEAN is
		do
			Result := (value=g_unicode_script_old_italic_low_level)
		end

	is_g_unicode_script_old_persian: BOOLEAN is
		do
			Result := (value=g_unicode_script_old_persian_low_level)
		end

	is_g_unicode_script_old_south_arabian: BOOLEAN is
		do
			Result := (value=g_unicode_script_old_south_arabian_low_level)
		end

	is_g_unicode_script_old_turkic: BOOLEAN is
		do
			Result := (value=g_unicode_script_old_turkic_low_level)
		end

	is_g_unicode_script_oriya: BOOLEAN is
		do
			Result := (value=g_unicode_script_oriya_low_level)
		end

	is_g_unicode_script_osmanya: BOOLEAN is
		do
			Result := (value=g_unicode_script_osmanya_low_level)
		end

	is_g_unicode_script_phags_pa: BOOLEAN is
		do
			Result := (value=g_unicode_script_phags_pa_low_level)
		end

	is_g_unicode_script_phoenician: BOOLEAN is
		do
			Result := (value=g_unicode_script_phoenician_low_level)
		end

	is_g_unicode_script_rejang: BOOLEAN is
		do
			Result := (value=g_unicode_script_rejang_low_level)
		end

	is_g_unicode_script_runic: BOOLEAN is
		do
			Result := (value=g_unicode_script_runic_low_level)
		end

	is_g_unicode_script_samaritan: BOOLEAN is
		do
			Result := (value=g_unicode_script_samaritan_low_level)
		end

	is_g_unicode_script_saurashtra: BOOLEAN is
		do
			Result := (value=g_unicode_script_saurashtra_low_level)
		end

	is_g_unicode_script_sharada: BOOLEAN is
		do
			Result := (value=g_unicode_script_sharada_low_level)
		end

	is_g_unicode_script_shavian: BOOLEAN is
		do
			Result := (value=g_unicode_script_shavian_low_level)
		end

	is_g_unicode_script_sinhala: BOOLEAN is
		do
			Result := (value=g_unicode_script_sinhala_low_level)
		end

	is_g_unicode_script_sora_sompeng: BOOLEAN is
		do
			Result := (value=g_unicode_script_sora_sompeng_low_level)
		end

	is_g_unicode_script_sundanese: BOOLEAN is
		do
			Result := (value=g_unicode_script_sundanese_low_level)
		end

	is_g_unicode_script_syloti_nagri: BOOLEAN is
		do
			Result := (value=g_unicode_script_syloti_nagri_low_level)
		end

	is_g_unicode_script_syriac: BOOLEAN is
		do
			Result := (value=g_unicode_script_syriac_low_level)
		end

	is_g_unicode_script_tagalog: BOOLEAN is
		do
			Result := (value=g_unicode_script_tagalog_low_level)
		end

	is_g_unicode_script_tagbanwa: BOOLEAN is
		do
			Result := (value=g_unicode_script_tagbanwa_low_level)
		end

	is_g_unicode_script_tai_le: BOOLEAN is
		do
			Result := (value=g_unicode_script_tai_le_low_level)
		end

	is_g_unicode_script_tai_tham: BOOLEAN is
		do
			Result := (value=g_unicode_script_tai_tham_low_level)
		end

	is_g_unicode_script_tai_viet: BOOLEAN is
		do
			Result := (value=g_unicode_script_tai_viet_low_level)
		end

	is_g_unicode_script_takri: BOOLEAN is
		do
			Result := (value=g_unicode_script_takri_low_level)
		end

	is_g_unicode_script_tamil: BOOLEAN is
		do
			Result := (value=g_unicode_script_tamil_low_level)
		end

	is_g_unicode_script_telugu: BOOLEAN is
		do
			Result := (value=g_unicode_script_telugu_low_level)
		end

	is_g_unicode_script_thaana: BOOLEAN is
		do
			Result := (value=g_unicode_script_thaana_low_level)
		end

	is_g_unicode_script_thai: BOOLEAN is
		do
			Result := (value=g_unicode_script_thai_low_level)
		end

	is_g_unicode_script_tibetan: BOOLEAN is
		do
			Result := (value=g_unicode_script_tibetan_low_level)
		end

	is_g_unicode_script_tifinagh: BOOLEAN is
		do
			Result := (value=g_unicode_script_tifinagh_low_level)
		end

	is_g_unicode_script_ugaritic: BOOLEAN is
		do
			Result := (value=g_unicode_script_ugaritic_low_level)
		end

	is_g_unicode_script_unknown: BOOLEAN is
		do
			Result := (value=g_unicode_script_unknown_low_level)
		end

	is_g_unicode_script_vai: BOOLEAN is
		do
			Result := (value=g_unicode_script_vai_low_level)
		end

	is_g_unicode_script_yi: BOOLEAN is
		do
			Result := (value=g_unicode_script_yi_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unicode_script_arabic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ARABIC"
 			}"
 		end

	g_unicode_script_armenian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ARMENIAN"
 			}"
 		end

	g_unicode_script_avestan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_AVESTAN"
 			}"
 		end

	g_unicode_script_balinese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BALINESE"
 			}"
 		end

	g_unicode_script_bamum_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BAMUM"
 			}"
 		end

	g_unicode_script_batak_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BATAK"
 			}"
 		end

	g_unicode_script_bengali_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BENGALI"
 			}"
 		end

	g_unicode_script_bopomofo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BOPOMOFO"
 			}"
 		end

	g_unicode_script_brahmi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BRAHMI"
 			}"
 		end

	g_unicode_script_braille_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BRAILLE"
 			}"
 		end

	g_unicode_script_buginese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BUGINESE"
 			}"
 		end

	g_unicode_script_buhid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BUHID"
 			}"
 		end

	g_unicode_script_canadian_aboriginal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CANADIAN_ABORIGINAL"
 			}"
 		end

	g_unicode_script_carian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CARIAN"
 			}"
 		end

	g_unicode_script_chakma_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CHAKMA"
 			}"
 		end

	g_unicode_script_cham_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CHAM"
 			}"
 		end

	g_unicode_script_cherokee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CHEROKEE"
 			}"
 		end

	g_unicode_script_common_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_COMMON"
 			}"
 		end

	g_unicode_script_coptic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_COPTIC"
 			}"
 		end

	g_unicode_script_cuneiform_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CUNEIFORM"
 			}"
 		end

	g_unicode_script_cypriot_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CYPRIOT"
 			}"
 		end

	g_unicode_script_cyrillic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CYRILLIC"
 			}"
 		end

	g_unicode_script_deseret_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_DESERET"
 			}"
 		end

	g_unicode_script_devanagari_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_DEVANAGARI"
 			}"
 		end

	g_unicode_script_egyptian_hieroglyphs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_EGYPTIAN_HIEROGLYPHS"
 			}"
 		end

	g_unicode_script_ethiopic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ETHIOPIC"
 			}"
 		end

	g_unicode_script_georgian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GEORGIAN"
 			}"
 		end

	g_unicode_script_glagolitic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GLAGOLITIC"
 			}"
 		end

	g_unicode_script_gothic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GOTHIC"
 			}"
 		end

	g_unicode_script_greek_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GREEK"
 			}"
 		end

	g_unicode_script_gujarati_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GUJARATI"
 			}"
 		end

	g_unicode_script_gurmukhi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GURMUKHI"
 			}"
 		end

	g_unicode_script_han_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HAN"
 			}"
 		end

	g_unicode_script_hangul_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HANGUL"
 			}"
 		end

	g_unicode_script_hanunoo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HANUNOO"
 			}"
 		end

	g_unicode_script_hebrew_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HEBREW"
 			}"
 		end

	g_unicode_script_hiragana_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HIRAGANA"
 			}"
 		end

	g_unicode_script_imperial_aramaic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_IMPERIAL_ARAMAIC"
 			}"
 		end

	g_unicode_script_inherited_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INHERITED"
 			}"
 		end

	g_unicode_script_inscriptional_pahlavi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INSCRIPTIONAL_PAHLAVI"
 			}"
 		end

	g_unicode_script_inscriptional_parthian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INSCRIPTIONAL_PARTHIAN"
 			}"
 		end

	g_unicode_script_invalid_code_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INVALID_CODE"
 			}"
 		end

	g_unicode_script_javanese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_JAVANESE"
 			}"
 		end

	g_unicode_script_kaithi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KAITHI"
 			}"
 		end

	g_unicode_script_kannada_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KANNADA"
 			}"
 		end

	g_unicode_script_katakana_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KATAKANA"
 			}"
 		end

	g_unicode_script_kayah_li_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KAYAH_LI"
 			}"
 		end

	g_unicode_script_kharoshthi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KHAROSHTHI"
 			}"
 		end

	g_unicode_script_khmer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KHMER"
 			}"
 		end

	g_unicode_script_lao_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LAO"
 			}"
 		end

	g_unicode_script_latin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LATIN"
 			}"
 		end

	g_unicode_script_lepcha_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LEPCHA"
 			}"
 		end

	g_unicode_script_limbu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LIMBU"
 			}"
 		end

	g_unicode_script_linear_b_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LINEAR_B"
 			}"
 		end

	g_unicode_script_lisu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LISU"
 			}"
 		end

	g_unicode_script_lycian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LYCIAN"
 			}"
 		end

	g_unicode_script_lydian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LYDIAN"
 			}"
 		end

	g_unicode_script_malayalam_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MALAYALAM"
 			}"
 		end

	g_unicode_script_mandaic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MANDAIC"
 			}"
 		end

	g_unicode_script_meetei_mayek_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MEETEI_MAYEK"
 			}"
 		end

	g_unicode_script_meroitic_cursive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MEROITIC_CURSIVE"
 			}"
 		end

	g_unicode_script_meroitic_hieroglyphs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MEROITIC_HIEROGLYPHS"
 			}"
 		end

	g_unicode_script_miao_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MIAO"
 			}"
 		end

	g_unicode_script_mongolian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MONGOLIAN"
 			}"
 		end

	g_unicode_script_myanmar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MYANMAR"
 			}"
 		end

	g_unicode_script_new_tai_lue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_NEW_TAI_LUE"
 			}"
 		end

	g_unicode_script_nko_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_NKO"
 			}"
 		end

	g_unicode_script_ogham_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OGHAM"
 			}"
 		end

	g_unicode_script_ol_chiki_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OL_CHIKI"
 			}"
 		end

	g_unicode_script_old_italic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_ITALIC"
 			}"
 		end

	g_unicode_script_old_persian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_PERSIAN"
 			}"
 		end

	g_unicode_script_old_south_arabian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_SOUTH_ARABIAN"
 			}"
 		end

	g_unicode_script_old_turkic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_TURKIC"
 			}"
 		end

	g_unicode_script_oriya_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ORIYA"
 			}"
 		end

	g_unicode_script_osmanya_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OSMANYA"
 			}"
 		end

	g_unicode_script_phags_pa_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_PHAGS_PA"
 			}"
 		end

	g_unicode_script_phoenician_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_PHOENICIAN"
 			}"
 		end

	g_unicode_script_rejang_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_REJANG"
 			}"
 		end

	g_unicode_script_runic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_RUNIC"
 			}"
 		end

	g_unicode_script_samaritan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SAMARITAN"
 			}"
 		end

	g_unicode_script_saurashtra_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SAURASHTRA"
 			}"
 		end

	g_unicode_script_sharada_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SHARADA"
 			}"
 		end

	g_unicode_script_shavian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SHAVIAN"
 			}"
 		end

	g_unicode_script_sinhala_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SINHALA"
 			}"
 		end

	g_unicode_script_sora_sompeng_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SORA_SOMPENG"
 			}"
 		end

	g_unicode_script_sundanese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SUNDANESE"
 			}"
 		end

	g_unicode_script_syloti_nagri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SYLOTI_NAGRI"
 			}"
 		end

	g_unicode_script_syriac_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SYRIAC"
 			}"
 		end

	g_unicode_script_tagalog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAGALOG"
 			}"
 		end

	g_unicode_script_tagbanwa_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAGBANWA"
 			}"
 		end

	g_unicode_script_tai_le_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAI_LE"
 			}"
 		end

	g_unicode_script_tai_tham_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAI_THAM"
 			}"
 		end

	g_unicode_script_tai_viet_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAI_VIET"
 			}"
 		end

	g_unicode_script_takri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAKRI"
 			}"
 		end

	g_unicode_script_tamil_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAMIL"
 			}"
 		end

	g_unicode_script_telugu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TELUGU"
 			}"
 		end

	g_unicode_script_thaana_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_THAANA"
 			}"
 		end

	g_unicode_script_thai_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_THAI"
 			}"
 		end

	g_unicode_script_tibetan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TIBETAN"
 			}"
 		end

	g_unicode_script_tifinagh_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TIFINAGH"
 			}"
 		end

	g_unicode_script_ugaritic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_UGARITIC"
 			}"
 		end

	g_unicode_script_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_UNKNOWN"
 			}"
 		end

	g_unicode_script_vai_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_VAI"
 			}"
 		end

	g_unicode_script_yi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_YI"
 			}"
 		end


end -- class GUNICODESCRIPT_ENUM
