-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODE_SCRIPT_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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
	set_g_unicode_script_arabic
		do
			value := g_unicode_script_arabic_low_level
		end

	set_g_unicode_script_armenian
		do
			value := g_unicode_script_armenian_low_level
		end

	set_g_unicode_script_avestan
		do
			value := g_unicode_script_avestan_low_level
		end

	set_g_unicode_script_balinese
		do
			value := g_unicode_script_balinese_low_level
		end

	set_g_unicode_script_bamum
		do
			value := g_unicode_script_bamum_low_level
		end

	set_g_unicode_script_batak
		do
			value := g_unicode_script_batak_low_level
		end

	set_g_unicode_script_bengali
		do
			value := g_unicode_script_bengali_low_level
		end

	set_g_unicode_script_bopomofo
		do
			value := g_unicode_script_bopomofo_low_level
		end

	set_g_unicode_script_brahmi
		do
			value := g_unicode_script_brahmi_low_level
		end

	set_g_unicode_script_braille
		do
			value := g_unicode_script_braille_low_level
		end

	set_g_unicode_script_buginese
		do
			value := g_unicode_script_buginese_low_level
		end

	set_g_unicode_script_buhid
		do
			value := g_unicode_script_buhid_low_level
		end

	set_g_unicode_script_canadian_aboriginal
		do
			value := g_unicode_script_canadian_aboriginal_low_level
		end

	set_g_unicode_script_carian
		do
			value := g_unicode_script_carian_low_level
		end

	set_g_unicode_script_chakma
		do
			value := g_unicode_script_chakma_low_level
		end

	set_g_unicode_script_cham
		do
			value := g_unicode_script_cham_low_level
		end

	set_g_unicode_script_cherokee
		do
			value := g_unicode_script_cherokee_low_level
		end

	set_g_unicode_script_common
		do
			value := g_unicode_script_common_low_level
		end

	set_g_unicode_script_coptic
		do
			value := g_unicode_script_coptic_low_level
		end

	set_g_unicode_script_cuneiform
		do
			value := g_unicode_script_cuneiform_low_level
		end

	set_g_unicode_script_cypriot
		do
			value := g_unicode_script_cypriot_low_level
		end

	set_g_unicode_script_cyrillic
		do
			value := g_unicode_script_cyrillic_low_level
		end

	set_g_unicode_script_deseret
		do
			value := g_unicode_script_deseret_low_level
		end

	set_g_unicode_script_devanagari
		do
			value := g_unicode_script_devanagari_low_level
		end

	set_g_unicode_script_egyptian_hieroglyphs
		do
			value := g_unicode_script_egyptian_hieroglyphs_low_level
		end

	set_g_unicode_script_ethiopic
		do
			value := g_unicode_script_ethiopic_low_level
		end

	set_g_unicode_script_georgian
		do
			value := g_unicode_script_georgian_low_level
		end

	set_g_unicode_script_glagolitic
		do
			value := g_unicode_script_glagolitic_low_level
		end

	set_g_unicode_script_gothic
		do
			value := g_unicode_script_gothic_low_level
		end

	set_g_unicode_script_greek
		do
			value := g_unicode_script_greek_low_level
		end

	set_g_unicode_script_gujarati
		do
			value := g_unicode_script_gujarati_low_level
		end

	set_g_unicode_script_gurmukhi
		do
			value := g_unicode_script_gurmukhi_low_level
		end

	set_g_unicode_script_han
		do
			value := g_unicode_script_han_low_level
		end

	set_g_unicode_script_hangul
		do
			value := g_unicode_script_hangul_low_level
		end

	set_g_unicode_script_hanunoo
		do
			value := g_unicode_script_hanunoo_low_level
		end

	set_g_unicode_script_hebrew
		do
			value := g_unicode_script_hebrew_low_level
		end

	set_g_unicode_script_hiragana
		do
			value := g_unicode_script_hiragana_low_level
		end

	set_g_unicode_script_imperial_aramaic
		do
			value := g_unicode_script_imperial_aramaic_low_level
		end

	set_g_unicode_script_inherited
		do
			value := g_unicode_script_inherited_low_level
		end

	set_g_unicode_script_inscriptional_pahlavi
		do
			value := g_unicode_script_inscriptional_pahlavi_low_level
		end

	set_g_unicode_script_inscriptional_parthian
		do
			value := g_unicode_script_inscriptional_parthian_low_level
		end

	set_g_unicode_script_invalid_code
		do
			value := g_unicode_script_invalid_code_low_level
		end

	set_g_unicode_script_javanese
		do
			value := g_unicode_script_javanese_low_level
		end

	set_g_unicode_script_kaithi
		do
			value := g_unicode_script_kaithi_low_level
		end

	set_g_unicode_script_kannada
		do
			value := g_unicode_script_kannada_low_level
		end

	set_g_unicode_script_katakana
		do
			value := g_unicode_script_katakana_low_level
		end

	set_g_unicode_script_kayah_li
		do
			value := g_unicode_script_kayah_li_low_level
		end

	set_g_unicode_script_kharoshthi
		do
			value := g_unicode_script_kharoshthi_low_level
		end

	set_g_unicode_script_khmer
		do
			value := g_unicode_script_khmer_low_level
		end

	set_g_unicode_script_lao
		do
			value := g_unicode_script_lao_low_level
		end

	set_g_unicode_script_latin
		do
			value := g_unicode_script_latin_low_level
		end

	set_g_unicode_script_lepcha
		do
			value := g_unicode_script_lepcha_low_level
		end

	set_g_unicode_script_limbu
		do
			value := g_unicode_script_limbu_low_level
		end

	set_g_unicode_script_linear_b
		do
			value := g_unicode_script_linear_b_low_level
		end

	set_g_unicode_script_lisu
		do
			value := g_unicode_script_lisu_low_level
		end

	set_g_unicode_script_lycian
		do
			value := g_unicode_script_lycian_low_level
		end

	set_g_unicode_script_lydian
		do
			value := g_unicode_script_lydian_low_level
		end

	set_g_unicode_script_malayalam
		do
			value := g_unicode_script_malayalam_low_level
		end

	set_g_unicode_script_mandaic
		do
			value := g_unicode_script_mandaic_low_level
		end

	set_g_unicode_script_meetei_mayek
		do
			value := g_unicode_script_meetei_mayek_low_level
		end

	set_g_unicode_script_meroitic_cursive
		do
			value := g_unicode_script_meroitic_cursive_low_level
		end

	set_g_unicode_script_meroitic_hieroglyphs
		do
			value := g_unicode_script_meroitic_hieroglyphs_low_level
		end

	set_g_unicode_script_miao
		do
			value := g_unicode_script_miao_low_level
		end

	set_g_unicode_script_mongolian
		do
			value := g_unicode_script_mongolian_low_level
		end

	set_g_unicode_script_myanmar
		do
			value := g_unicode_script_myanmar_low_level
		end

	set_g_unicode_script_new_tai_lue
		do
			value := g_unicode_script_new_tai_lue_low_level
		end

	set_g_unicode_script_nko
		do
			value := g_unicode_script_nko_low_level
		end

	set_g_unicode_script_ogham
		do
			value := g_unicode_script_ogham_low_level
		end

	set_g_unicode_script_ol_chiki
		do
			value := g_unicode_script_ol_chiki_low_level
		end

	set_g_unicode_script_old_italic
		do
			value := g_unicode_script_old_italic_low_level
		end

	set_g_unicode_script_old_persian
		do
			value := g_unicode_script_old_persian_low_level
		end

	set_g_unicode_script_old_south_arabian
		do
			value := g_unicode_script_old_south_arabian_low_level
		end

	set_g_unicode_script_old_turkic
		do
			value := g_unicode_script_old_turkic_low_level
		end

	set_g_unicode_script_oriya
		do
			value := g_unicode_script_oriya_low_level
		end

	set_g_unicode_script_osmanya
		do
			value := g_unicode_script_osmanya_low_level
		end

	set_g_unicode_script_phags_pa
		do
			value := g_unicode_script_phags_pa_low_level
		end

	set_g_unicode_script_phoenician
		do
			value := g_unicode_script_phoenician_low_level
		end

	set_g_unicode_script_rejang
		do
			value := g_unicode_script_rejang_low_level
		end

	set_g_unicode_script_runic
		do
			value := g_unicode_script_runic_low_level
		end

	set_g_unicode_script_samaritan
		do
			value := g_unicode_script_samaritan_low_level
		end

	set_g_unicode_script_saurashtra
		do
			value := g_unicode_script_saurashtra_low_level
		end

	set_g_unicode_script_sharada
		do
			value := g_unicode_script_sharada_low_level
		end

	set_g_unicode_script_shavian
		do
			value := g_unicode_script_shavian_low_level
		end

	set_g_unicode_script_sinhala
		do
			value := g_unicode_script_sinhala_low_level
		end

	set_g_unicode_script_sora_sompeng
		do
			value := g_unicode_script_sora_sompeng_low_level
		end

	set_g_unicode_script_sundanese
		do
			value := g_unicode_script_sundanese_low_level
		end

	set_g_unicode_script_syloti_nagri
		do
			value := g_unicode_script_syloti_nagri_low_level
		end

	set_g_unicode_script_syriac
		do
			value := g_unicode_script_syriac_low_level
		end

	set_g_unicode_script_tagalog
		do
			value := g_unicode_script_tagalog_low_level
		end

	set_g_unicode_script_tagbanwa
		do
			value := g_unicode_script_tagbanwa_low_level
		end

	set_g_unicode_script_tai_le
		do
			value := g_unicode_script_tai_le_low_level
		end

	set_g_unicode_script_tai_tham
		do
			value := g_unicode_script_tai_tham_low_level
		end

	set_g_unicode_script_tai_viet
		do
			value := g_unicode_script_tai_viet_low_level
		end

	set_g_unicode_script_takri
		do
			value := g_unicode_script_takri_low_level
		end

	set_g_unicode_script_tamil
		do
			value := g_unicode_script_tamil_low_level
		end

	set_g_unicode_script_telugu
		do
			value := g_unicode_script_telugu_low_level
		end

	set_g_unicode_script_thaana
		do
			value := g_unicode_script_thaana_low_level
		end

	set_g_unicode_script_thai
		do
			value := g_unicode_script_thai_low_level
		end

	set_g_unicode_script_tibetan
		do
			value := g_unicode_script_tibetan_low_level
		end

	set_g_unicode_script_tifinagh
		do
			value := g_unicode_script_tifinagh_low_level
		end

	set_g_unicode_script_ugaritic
		do
			value := g_unicode_script_ugaritic_low_level
		end

	set_g_unicode_script_unknown
		do
			value := g_unicode_script_unknown_low_level
		end

	set_g_unicode_script_vai
		do
			value := g_unicode_script_vai_low_level
		end

	set_g_unicode_script_yi
		do
			value := g_unicode_script_yi_low_level
		end

feature {ANY} -- Queries
	is_g_unicode_script_arabic: BOOLEAN
		do
			Result := (value=g_unicode_script_arabic_low_level)
		end

	is_g_unicode_script_armenian: BOOLEAN
		do
			Result := (value=g_unicode_script_armenian_low_level)
		end

	is_g_unicode_script_avestan: BOOLEAN
		do
			Result := (value=g_unicode_script_avestan_low_level)
		end

	is_g_unicode_script_balinese: BOOLEAN
		do
			Result := (value=g_unicode_script_balinese_low_level)
		end

	is_g_unicode_script_bamum: BOOLEAN
		do
			Result := (value=g_unicode_script_bamum_low_level)
		end

	is_g_unicode_script_batak: BOOLEAN
		do
			Result := (value=g_unicode_script_batak_low_level)
		end

	is_g_unicode_script_bengali: BOOLEAN
		do
			Result := (value=g_unicode_script_bengali_low_level)
		end

	is_g_unicode_script_bopomofo: BOOLEAN
		do
			Result := (value=g_unicode_script_bopomofo_low_level)
		end

	is_g_unicode_script_brahmi: BOOLEAN
		do
			Result := (value=g_unicode_script_brahmi_low_level)
		end

	is_g_unicode_script_braille: BOOLEAN
		do
			Result := (value=g_unicode_script_braille_low_level)
		end

	is_g_unicode_script_buginese: BOOLEAN
		do
			Result := (value=g_unicode_script_buginese_low_level)
		end

	is_g_unicode_script_buhid: BOOLEAN
		do
			Result := (value=g_unicode_script_buhid_low_level)
		end

	is_g_unicode_script_canadian_aboriginal: BOOLEAN
		do
			Result := (value=g_unicode_script_canadian_aboriginal_low_level)
		end

	is_g_unicode_script_carian: BOOLEAN
		do
			Result := (value=g_unicode_script_carian_low_level)
		end

	is_g_unicode_script_chakma: BOOLEAN
		do
			Result := (value=g_unicode_script_chakma_low_level)
		end

	is_g_unicode_script_cham: BOOLEAN
		do
			Result := (value=g_unicode_script_cham_low_level)
		end

	is_g_unicode_script_cherokee: BOOLEAN
		do
			Result := (value=g_unicode_script_cherokee_low_level)
		end

	is_g_unicode_script_common: BOOLEAN
		do
			Result := (value=g_unicode_script_common_low_level)
		end

	is_g_unicode_script_coptic: BOOLEAN
		do
			Result := (value=g_unicode_script_coptic_low_level)
		end

	is_g_unicode_script_cuneiform: BOOLEAN
		do
			Result := (value=g_unicode_script_cuneiform_low_level)
		end

	is_g_unicode_script_cypriot: BOOLEAN
		do
			Result := (value=g_unicode_script_cypriot_low_level)
		end

	is_g_unicode_script_cyrillic: BOOLEAN
		do
			Result := (value=g_unicode_script_cyrillic_low_level)
		end

	is_g_unicode_script_deseret: BOOLEAN
		do
			Result := (value=g_unicode_script_deseret_low_level)
		end

	is_g_unicode_script_devanagari: BOOLEAN
		do
			Result := (value=g_unicode_script_devanagari_low_level)
		end

	is_g_unicode_script_egyptian_hieroglyphs: BOOLEAN
		do
			Result := (value=g_unicode_script_egyptian_hieroglyphs_low_level)
		end

	is_g_unicode_script_ethiopic: BOOLEAN
		do
			Result := (value=g_unicode_script_ethiopic_low_level)
		end

	is_g_unicode_script_georgian: BOOLEAN
		do
			Result := (value=g_unicode_script_georgian_low_level)
		end

	is_g_unicode_script_glagolitic: BOOLEAN
		do
			Result := (value=g_unicode_script_glagolitic_low_level)
		end

	is_g_unicode_script_gothic: BOOLEAN
		do
			Result := (value=g_unicode_script_gothic_low_level)
		end

	is_g_unicode_script_greek: BOOLEAN
		do
			Result := (value=g_unicode_script_greek_low_level)
		end

	is_g_unicode_script_gujarati: BOOLEAN
		do
			Result := (value=g_unicode_script_gujarati_low_level)
		end

	is_g_unicode_script_gurmukhi: BOOLEAN
		do
			Result := (value=g_unicode_script_gurmukhi_low_level)
		end

	is_g_unicode_script_han: BOOLEAN
		do
			Result := (value=g_unicode_script_han_low_level)
		end

	is_g_unicode_script_hangul: BOOLEAN
		do
			Result := (value=g_unicode_script_hangul_low_level)
		end

	is_g_unicode_script_hanunoo: BOOLEAN
		do
			Result := (value=g_unicode_script_hanunoo_low_level)
		end

	is_g_unicode_script_hebrew: BOOLEAN
		do
			Result := (value=g_unicode_script_hebrew_low_level)
		end

	is_g_unicode_script_hiragana: BOOLEAN
		do
			Result := (value=g_unicode_script_hiragana_low_level)
		end

	is_g_unicode_script_imperial_aramaic: BOOLEAN
		do
			Result := (value=g_unicode_script_imperial_aramaic_low_level)
		end

	is_g_unicode_script_inherited: BOOLEAN
		do
			Result := (value=g_unicode_script_inherited_low_level)
		end

	is_g_unicode_script_inscriptional_pahlavi: BOOLEAN
		do
			Result := (value=g_unicode_script_inscriptional_pahlavi_low_level)
		end

	is_g_unicode_script_inscriptional_parthian: BOOLEAN
		do
			Result := (value=g_unicode_script_inscriptional_parthian_low_level)
		end

	is_g_unicode_script_invalid_code: BOOLEAN
		do
			Result := (value=g_unicode_script_invalid_code_low_level)
		end

	is_g_unicode_script_javanese: BOOLEAN
		do
			Result := (value=g_unicode_script_javanese_low_level)
		end

	is_g_unicode_script_kaithi: BOOLEAN
		do
			Result := (value=g_unicode_script_kaithi_low_level)
		end

	is_g_unicode_script_kannada: BOOLEAN
		do
			Result := (value=g_unicode_script_kannada_low_level)
		end

	is_g_unicode_script_katakana: BOOLEAN
		do
			Result := (value=g_unicode_script_katakana_low_level)
		end

	is_g_unicode_script_kayah_li: BOOLEAN
		do
			Result := (value=g_unicode_script_kayah_li_low_level)
		end

	is_g_unicode_script_kharoshthi: BOOLEAN
		do
			Result := (value=g_unicode_script_kharoshthi_low_level)
		end

	is_g_unicode_script_khmer: BOOLEAN
		do
			Result := (value=g_unicode_script_khmer_low_level)
		end

	is_g_unicode_script_lao: BOOLEAN
		do
			Result := (value=g_unicode_script_lao_low_level)
		end

	is_g_unicode_script_latin: BOOLEAN
		do
			Result := (value=g_unicode_script_latin_low_level)
		end

	is_g_unicode_script_lepcha: BOOLEAN
		do
			Result := (value=g_unicode_script_lepcha_low_level)
		end

	is_g_unicode_script_limbu: BOOLEAN
		do
			Result := (value=g_unicode_script_limbu_low_level)
		end

	is_g_unicode_script_linear_b: BOOLEAN
		do
			Result := (value=g_unicode_script_linear_b_low_level)
		end

	is_g_unicode_script_lisu: BOOLEAN
		do
			Result := (value=g_unicode_script_lisu_low_level)
		end

	is_g_unicode_script_lycian: BOOLEAN
		do
			Result := (value=g_unicode_script_lycian_low_level)
		end

	is_g_unicode_script_lydian: BOOLEAN
		do
			Result := (value=g_unicode_script_lydian_low_level)
		end

	is_g_unicode_script_malayalam: BOOLEAN
		do
			Result := (value=g_unicode_script_malayalam_low_level)
		end

	is_g_unicode_script_mandaic: BOOLEAN
		do
			Result := (value=g_unicode_script_mandaic_low_level)
		end

	is_g_unicode_script_meetei_mayek: BOOLEAN
		do
			Result := (value=g_unicode_script_meetei_mayek_low_level)
		end

	is_g_unicode_script_meroitic_cursive: BOOLEAN
		do
			Result := (value=g_unicode_script_meroitic_cursive_low_level)
		end

	is_g_unicode_script_meroitic_hieroglyphs: BOOLEAN
		do
			Result := (value=g_unicode_script_meroitic_hieroglyphs_low_level)
		end

	is_g_unicode_script_miao: BOOLEAN
		do
			Result := (value=g_unicode_script_miao_low_level)
		end

	is_g_unicode_script_mongolian: BOOLEAN
		do
			Result := (value=g_unicode_script_mongolian_low_level)
		end

	is_g_unicode_script_myanmar: BOOLEAN
		do
			Result := (value=g_unicode_script_myanmar_low_level)
		end

	is_g_unicode_script_new_tai_lue: BOOLEAN
		do
			Result := (value=g_unicode_script_new_tai_lue_low_level)
		end

	is_g_unicode_script_nko: BOOLEAN
		do
			Result := (value=g_unicode_script_nko_low_level)
		end

	is_g_unicode_script_ogham: BOOLEAN
		do
			Result := (value=g_unicode_script_ogham_low_level)
		end

	is_g_unicode_script_ol_chiki: BOOLEAN
		do
			Result := (value=g_unicode_script_ol_chiki_low_level)
		end

	is_g_unicode_script_old_italic: BOOLEAN
		do
			Result := (value=g_unicode_script_old_italic_low_level)
		end

	is_g_unicode_script_old_persian: BOOLEAN
		do
			Result := (value=g_unicode_script_old_persian_low_level)
		end

	is_g_unicode_script_old_south_arabian: BOOLEAN
		do
			Result := (value=g_unicode_script_old_south_arabian_low_level)
		end

	is_g_unicode_script_old_turkic: BOOLEAN
		do
			Result := (value=g_unicode_script_old_turkic_low_level)
		end

	is_g_unicode_script_oriya: BOOLEAN
		do
			Result := (value=g_unicode_script_oriya_low_level)
		end

	is_g_unicode_script_osmanya: BOOLEAN
		do
			Result := (value=g_unicode_script_osmanya_low_level)
		end

	is_g_unicode_script_phags_pa: BOOLEAN
		do
			Result := (value=g_unicode_script_phags_pa_low_level)
		end

	is_g_unicode_script_phoenician: BOOLEAN
		do
			Result := (value=g_unicode_script_phoenician_low_level)
		end

	is_g_unicode_script_rejang: BOOLEAN
		do
			Result := (value=g_unicode_script_rejang_low_level)
		end

	is_g_unicode_script_runic: BOOLEAN
		do
			Result := (value=g_unicode_script_runic_low_level)
		end

	is_g_unicode_script_samaritan: BOOLEAN
		do
			Result := (value=g_unicode_script_samaritan_low_level)
		end

	is_g_unicode_script_saurashtra: BOOLEAN
		do
			Result := (value=g_unicode_script_saurashtra_low_level)
		end

	is_g_unicode_script_sharada: BOOLEAN
		do
			Result := (value=g_unicode_script_sharada_low_level)
		end

	is_g_unicode_script_shavian: BOOLEAN
		do
			Result := (value=g_unicode_script_shavian_low_level)
		end

	is_g_unicode_script_sinhala: BOOLEAN
		do
			Result := (value=g_unicode_script_sinhala_low_level)
		end

	is_g_unicode_script_sora_sompeng: BOOLEAN
		do
			Result := (value=g_unicode_script_sora_sompeng_low_level)
		end

	is_g_unicode_script_sundanese: BOOLEAN
		do
			Result := (value=g_unicode_script_sundanese_low_level)
		end

	is_g_unicode_script_syloti_nagri: BOOLEAN
		do
			Result := (value=g_unicode_script_syloti_nagri_low_level)
		end

	is_g_unicode_script_syriac: BOOLEAN
		do
			Result := (value=g_unicode_script_syriac_low_level)
		end

	is_g_unicode_script_tagalog: BOOLEAN
		do
			Result := (value=g_unicode_script_tagalog_low_level)
		end

	is_g_unicode_script_tagbanwa: BOOLEAN
		do
			Result := (value=g_unicode_script_tagbanwa_low_level)
		end

	is_g_unicode_script_tai_le: BOOLEAN
		do
			Result := (value=g_unicode_script_tai_le_low_level)
		end

	is_g_unicode_script_tai_tham: BOOLEAN
		do
			Result := (value=g_unicode_script_tai_tham_low_level)
		end

	is_g_unicode_script_tai_viet: BOOLEAN
		do
			Result := (value=g_unicode_script_tai_viet_low_level)
		end

	is_g_unicode_script_takri: BOOLEAN
		do
			Result := (value=g_unicode_script_takri_low_level)
		end

	is_g_unicode_script_tamil: BOOLEAN
		do
			Result := (value=g_unicode_script_tamil_low_level)
		end

	is_g_unicode_script_telugu: BOOLEAN
		do
			Result := (value=g_unicode_script_telugu_low_level)
		end

	is_g_unicode_script_thaana: BOOLEAN
		do
			Result := (value=g_unicode_script_thaana_low_level)
		end

	is_g_unicode_script_thai: BOOLEAN
		do
			Result := (value=g_unicode_script_thai_low_level)
		end

	is_g_unicode_script_tibetan: BOOLEAN
		do
			Result := (value=g_unicode_script_tibetan_low_level)
		end

	is_g_unicode_script_tifinagh: BOOLEAN
		do
			Result := (value=g_unicode_script_tifinagh_low_level)
		end

	is_g_unicode_script_ugaritic: BOOLEAN
		do
			Result := (value=g_unicode_script_ugaritic_low_level)
		end

	is_g_unicode_script_unknown: BOOLEAN
		do
			Result := (value=g_unicode_script_unknown_low_level)
		end

	is_g_unicode_script_vai: BOOLEAN
		do
			Result := (value=g_unicode_script_vai_low_level)
		end

	is_g_unicode_script_yi: BOOLEAN
		do
			Result := (value=g_unicode_script_yi_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unicode_script_arabic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ARABIC"
 			}"
 		end

	g_unicode_script_armenian_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ARMENIAN"
 			}"
 		end

	g_unicode_script_avestan_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_AVESTAN"
 			}"
 		end

	g_unicode_script_balinese_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BALINESE"
 			}"
 		end

	g_unicode_script_bamum_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BAMUM"
 			}"
 		end

	g_unicode_script_batak_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BATAK"
 			}"
 		end

	g_unicode_script_bengali_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BENGALI"
 			}"
 		end

	g_unicode_script_bopomofo_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BOPOMOFO"
 			}"
 		end

	g_unicode_script_brahmi_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BRAHMI"
 			}"
 		end

	g_unicode_script_braille_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BRAILLE"
 			}"
 		end

	g_unicode_script_buginese_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BUGINESE"
 			}"
 		end

	g_unicode_script_buhid_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BUHID"
 			}"
 		end

	g_unicode_script_canadian_aboriginal_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CANADIAN_ABORIGINAL"
 			}"
 		end

	g_unicode_script_carian_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CARIAN"
 			}"
 		end

	g_unicode_script_chakma_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CHAKMA"
 			}"
 		end

	g_unicode_script_cham_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CHAM"
 			}"
 		end

	g_unicode_script_cherokee_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CHEROKEE"
 			}"
 		end

	g_unicode_script_common_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_COMMON"
 			}"
 		end

	g_unicode_script_coptic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_COPTIC"
 			}"
 		end

	g_unicode_script_cuneiform_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CUNEIFORM"
 			}"
 		end

	g_unicode_script_cypriot_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CYPRIOT"
 			}"
 		end

	g_unicode_script_cyrillic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CYRILLIC"
 			}"
 		end

	g_unicode_script_deseret_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_DESERET"
 			}"
 		end

	g_unicode_script_devanagari_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_DEVANAGARI"
 			}"
 		end

	g_unicode_script_egyptian_hieroglyphs_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_EGYPTIAN_HIEROGLYPHS"
 			}"
 		end

	g_unicode_script_ethiopic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ETHIOPIC"
 			}"
 		end

	g_unicode_script_georgian_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GEORGIAN"
 			}"
 		end

	g_unicode_script_glagolitic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GLAGOLITIC"
 			}"
 		end

	g_unicode_script_gothic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GOTHIC"
 			}"
 		end

	g_unicode_script_greek_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GREEK"
 			}"
 		end

	g_unicode_script_gujarati_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GUJARATI"
 			}"
 		end

	g_unicode_script_gurmukhi_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GURMUKHI"
 			}"
 		end

	g_unicode_script_han_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HAN"
 			}"
 		end

	g_unicode_script_hangul_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HANGUL"
 			}"
 		end

	g_unicode_script_hanunoo_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HANUNOO"
 			}"
 		end

	g_unicode_script_hebrew_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HEBREW"
 			}"
 		end

	g_unicode_script_hiragana_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HIRAGANA"
 			}"
 		end

	g_unicode_script_imperial_aramaic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_IMPERIAL_ARAMAIC"
 			}"
 		end

	g_unicode_script_inherited_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INHERITED"
 			}"
 		end

	g_unicode_script_inscriptional_pahlavi_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INSCRIPTIONAL_PAHLAVI"
 			}"
 		end

	g_unicode_script_inscriptional_parthian_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INSCRIPTIONAL_PARTHIAN"
 			}"
 		end

	g_unicode_script_invalid_code_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INVALID_CODE"
 			}"
 		end

	g_unicode_script_javanese_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_JAVANESE"
 			}"
 		end

	g_unicode_script_kaithi_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KAITHI"
 			}"
 		end

	g_unicode_script_kannada_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KANNADA"
 			}"
 		end

	g_unicode_script_katakana_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KATAKANA"
 			}"
 		end

	g_unicode_script_kayah_li_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KAYAH_LI"
 			}"
 		end

	g_unicode_script_kharoshthi_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KHAROSHTHI"
 			}"
 		end

	g_unicode_script_khmer_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KHMER"
 			}"
 		end

	g_unicode_script_lao_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LAO"
 			}"
 		end

	g_unicode_script_latin_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LATIN"
 			}"
 		end

	g_unicode_script_lepcha_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LEPCHA"
 			}"
 		end

	g_unicode_script_limbu_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LIMBU"
 			}"
 		end

	g_unicode_script_linear_b_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LINEAR_B"
 			}"
 		end

	g_unicode_script_lisu_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LISU"
 			}"
 		end

	g_unicode_script_lycian_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LYCIAN"
 			}"
 		end

	g_unicode_script_lydian_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LYDIAN"
 			}"
 		end

	g_unicode_script_malayalam_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MALAYALAM"
 			}"
 		end

	g_unicode_script_mandaic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MANDAIC"
 			}"
 		end

	g_unicode_script_meetei_mayek_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MEETEI_MAYEK"
 			}"
 		end

	g_unicode_script_meroitic_cursive_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MEROITIC_CURSIVE"
 			}"
 		end

	g_unicode_script_meroitic_hieroglyphs_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MEROITIC_HIEROGLYPHS"
 			}"
 		end

	g_unicode_script_miao_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MIAO"
 			}"
 		end

	g_unicode_script_mongolian_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MONGOLIAN"
 			}"
 		end

	g_unicode_script_myanmar_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MYANMAR"
 			}"
 		end

	g_unicode_script_new_tai_lue_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_NEW_TAI_LUE"
 			}"
 		end

	g_unicode_script_nko_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_NKO"
 			}"
 		end

	g_unicode_script_ogham_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OGHAM"
 			}"
 		end

	g_unicode_script_ol_chiki_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OL_CHIKI"
 			}"
 		end

	g_unicode_script_old_italic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_ITALIC"
 			}"
 		end

	g_unicode_script_old_persian_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_PERSIAN"
 			}"
 		end

	g_unicode_script_old_south_arabian_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_SOUTH_ARABIAN"
 			}"
 		end

	g_unicode_script_old_turkic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_TURKIC"
 			}"
 		end

	g_unicode_script_oriya_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ORIYA"
 			}"
 		end

	g_unicode_script_osmanya_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OSMANYA"
 			}"
 		end

	g_unicode_script_phags_pa_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_PHAGS_PA"
 			}"
 		end

	g_unicode_script_phoenician_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_PHOENICIAN"
 			}"
 		end

	g_unicode_script_rejang_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_REJANG"
 			}"
 		end

	g_unicode_script_runic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_RUNIC"
 			}"
 		end

	g_unicode_script_samaritan_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SAMARITAN"
 			}"
 		end

	g_unicode_script_saurashtra_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SAURASHTRA"
 			}"
 		end

	g_unicode_script_sharada_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SHARADA"
 			}"
 		end

	g_unicode_script_shavian_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SHAVIAN"
 			}"
 		end

	g_unicode_script_sinhala_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SINHALA"
 			}"
 		end

	g_unicode_script_sora_sompeng_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SORA_SOMPENG"
 			}"
 		end

	g_unicode_script_sundanese_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SUNDANESE"
 			}"
 		end

	g_unicode_script_syloti_nagri_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SYLOTI_NAGRI"
 			}"
 		end

	g_unicode_script_syriac_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SYRIAC"
 			}"
 		end

	g_unicode_script_tagalog_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAGALOG"
 			}"
 		end

	g_unicode_script_tagbanwa_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAGBANWA"
 			}"
 		end

	g_unicode_script_tai_le_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAI_LE"
 			}"
 		end

	g_unicode_script_tai_tham_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAI_THAM"
 			}"
 		end

	g_unicode_script_tai_viet_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAI_VIET"
 			}"
 		end

	g_unicode_script_takri_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAKRI"
 			}"
 		end

	g_unicode_script_tamil_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAMIL"
 			}"
 		end

	g_unicode_script_telugu_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TELUGU"
 			}"
 		end

	g_unicode_script_thaana_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_THAANA"
 			}"
 		end

	g_unicode_script_thai_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_THAI"
 			}"
 		end

	g_unicode_script_tibetan_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TIBETAN"
 			}"
 		end

	g_unicode_script_tifinagh_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TIFINAGH"
 			}"
 		end

	g_unicode_script_ugaritic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_UGARITIC"
 			}"
 		end

	g_unicode_script_unknown_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_UNKNOWN"
 			}"
 		end

	g_unicode_script_vai_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_VAI"
 			}"
 		end

	g_unicode_script_yi_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_YI"
 			}"
 		end


end -- class GUNICODE_SCRIPT_ENUM
