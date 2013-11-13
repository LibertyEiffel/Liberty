-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODE_SCRIPT_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = arabic_low_level)  or else
				(a_value = armenian_low_level)  or else
				(a_value = avestan_low_level)  or else
				(a_value = balinese_low_level)  or else
				(a_value = bamum_low_level)  or else
				(a_value = batak_low_level)  or else
				(a_value = bengali_low_level)  or else
				(a_value = bopomofo_low_level)  or else
				(a_value = brahmi_low_level)  or else
				(a_value = braille_low_level)  or else
				(a_value = buginese_low_level)  or else
				(a_value = buhid_low_level)  or else
				(a_value = canadian_aboriginal_low_level)  or else
				(a_value = carian_low_level)  or else
				(a_value = chakma_low_level)  or else
				(a_value = cham_low_level)  or else
				(a_value = cherokee_low_level)  or else
				(a_value = common_low_level)  or else
				(a_value = coptic_low_level)  or else
				(a_value = cuneiform_low_level)  or else
				(a_value = cypriot_low_level)  or else
				(a_value = cyrillic_low_level)  or else
				(a_value = deseret_low_level)  or else
				(a_value = devanagari_low_level)  or else
				(a_value = egyptian_hieroglyphs_low_level)  or else
				(a_value = ethiopic_low_level)  or else
				(a_value = georgian_low_level)  or else
				(a_value = glagolitic_low_level)  or else
				(a_value = gothic_low_level)  or else
				(a_value = greek_low_level)  or else
				(a_value = gujarati_low_level)  or else
				(a_value = gurmukhi_low_level)  or else
				(a_value = han_low_level)  or else
				(a_value = hangul_low_level)  or else
				(a_value = hanunoo_low_level)  or else
				(a_value = hebrew_low_level)  or else
				(a_value = hiragana_low_level)  or else
				(a_value = imperial_aramaic_low_level)  or else
				(a_value = inherited_low_level)  or else
				(a_value = inscriptional_pahlavi_low_level)  or else
				(a_value = inscriptional_parthian_low_level)  or else
				(a_value = invalid_code_low_level)  or else
				(a_value = javanese_low_level)  or else
				(a_value = kaithi_low_level)  or else
				(a_value = kannada_low_level)  or else
				(a_value = katakana_low_level)  or else
				(a_value = kayah_li_low_level)  or else
				(a_value = kharoshthi_low_level)  or else
				(a_value = khmer_low_level)  or else
				(a_value = lao_low_level)  or else
				(a_value = latin_low_level)  or else
				(a_value = lepcha_low_level)  or else
				(a_value = limbu_low_level)  or else
				(a_value = linear_b_low_level)  or else
				(a_value = lisu_low_level)  or else
				(a_value = lycian_low_level)  or else
				(a_value = lydian_low_level)  or else
				(a_value = malayalam_low_level)  or else
				(a_value = mandaic_low_level)  or else
				(a_value = meetei_mayek_low_level)  or else
				(a_value = meroitic_cursive_low_level)  or else
				(a_value = meroitic_hieroglyphs_low_level)  or else
				(a_value = miao_low_level)  or else
				(a_value = mongolian_low_level)  or else
				(a_value = myanmar_low_level)  or else
				(a_value = new_tai_lue_low_level)  or else
				(a_value = nko_low_level)  or else
				(a_value = ogham_low_level)  or else
				(a_value = ol_chiki_low_level)  or else
				(a_value = old_italic_low_level)  or else
				(a_value = old_persian_low_level)  or else
				(a_value = old_south_arabian_low_level)  or else
				(a_value = old_turkic_low_level)  or else
				(a_value = oriya_low_level)  or else
				(a_value = osmanya_low_level)  or else
				(a_value = phags_pa_low_level)  or else
				(a_value = phoenician_low_level)  or else
				(a_value = rejang_low_level)  or else
				(a_value = runic_low_level)  or else
				(a_value = samaritan_low_level)  or else
				(a_value = saurashtra_low_level)  or else
				(a_value = sharada_low_level)  or else
				(a_value = shavian_low_level)  or else
				(a_value = sinhala_low_level)  or else
				(a_value = sora_sompeng_low_level)  or else
				(a_value = sundanese_low_level)  or else
				(a_value = syloti_nagri_low_level)  or else
				(a_value = syriac_low_level)  or else
				(a_value = tagalog_low_level)  or else
				(a_value = tagbanwa_low_level)  or else
				(a_value = tai_le_low_level)  or else
				(a_value = tai_tham_low_level)  or else
				(a_value = tai_viet_low_level)  or else
				(a_value = takri_low_level)  or else
				(a_value = tamil_low_level)  or else
				(a_value = telugu_low_level)  or else
				(a_value = thaana_low_level)  or else
				(a_value = thai_low_level)  or else
				(a_value = tibetan_low_level)  or else
				(a_value = tifinagh_low_level)  or else
				(a_value = ugaritic_low_level)  or else
				(a_value = unknown_low_level)  or else
				(a_value = vai_low_level)  or else
				(a_value = yi_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_arabic is
		do
			value := arabic_low_level
		end

	set_armenian is
		do
			value := armenian_low_level
		end

	set_avestan is
		do
			value := avestan_low_level
		end

	set_balinese is
		do
			value := balinese_low_level
		end

	set_bamum is
		do
			value := bamum_low_level
		end

	set_batak is
		do
			value := batak_low_level
		end

	set_bengali is
		do
			value := bengali_low_level
		end

	set_bopomofo is
		do
			value := bopomofo_low_level
		end

	set_brahmi is
		do
			value := brahmi_low_level
		end

	set_braille is
		do
			value := braille_low_level
		end

	set_buginese is
		do
			value := buginese_low_level
		end

	set_buhid is
		do
			value := buhid_low_level
		end

	set_canadian_aboriginal is
		do
			value := canadian_aboriginal_low_level
		end

	set_carian is
		do
			value := carian_low_level
		end

	set_chakma is
		do
			value := chakma_low_level
		end

	set_cham is
		do
			value := cham_low_level
		end

	set_cherokee is
		do
			value := cherokee_low_level
		end

	set_common is
		do
			value := common_low_level
		end

	set_coptic is
		do
			value := coptic_low_level
		end

	set_cuneiform is
		do
			value := cuneiform_low_level
		end

	set_cypriot is
		do
			value := cypriot_low_level
		end

	set_cyrillic is
		do
			value := cyrillic_low_level
		end

	set_deseret is
		do
			value := deseret_low_level
		end

	set_devanagari is
		do
			value := devanagari_low_level
		end

	set_egyptian_hieroglyphs is
		do
			value := egyptian_hieroglyphs_low_level
		end

	set_ethiopic is
		do
			value := ethiopic_low_level
		end

	set_georgian is
		do
			value := georgian_low_level
		end

	set_glagolitic is
		do
			value := glagolitic_low_level
		end

	set_gothic is
		do
			value := gothic_low_level
		end

	set_greek is
		do
			value := greek_low_level
		end

	set_gujarati is
		do
			value := gujarati_low_level
		end

	set_gurmukhi is
		do
			value := gurmukhi_low_level
		end

	set_han is
		do
			value := han_low_level
		end

	set_hangul is
		do
			value := hangul_low_level
		end

	set_hanunoo is
		do
			value := hanunoo_low_level
		end

	set_hebrew is
		do
			value := hebrew_low_level
		end

	set_hiragana is
		do
			value := hiragana_low_level
		end

	set_imperial_aramaic is
		do
			value := imperial_aramaic_low_level
		end

	set_inherited is
		do
			value := inherited_low_level
		end

	set_inscriptional_pahlavi is
		do
			value := inscriptional_pahlavi_low_level
		end

	set_inscriptional_parthian is
		do
			value := inscriptional_parthian_low_level
		end

	set_invalid_code is
		do
			value := invalid_code_low_level
		end

	set_javanese is
		do
			value := javanese_low_level
		end

	set_kaithi is
		do
			value := kaithi_low_level
		end

	set_kannada is
		do
			value := kannada_low_level
		end

	set_katakana is
		do
			value := katakana_low_level
		end

	set_kayah_li is
		do
			value := kayah_li_low_level
		end

	set_kharoshthi is
		do
			value := kharoshthi_low_level
		end

	set_khmer is
		do
			value := khmer_low_level
		end

	set_lao is
		do
			value := lao_low_level
		end

	set_latin is
		do
			value := latin_low_level
		end

	set_lepcha is
		do
			value := lepcha_low_level
		end

	set_limbu is
		do
			value := limbu_low_level
		end

	set_linear_b is
		do
			value := linear_b_low_level
		end

	set_lisu is
		do
			value := lisu_low_level
		end

	set_lycian is
		do
			value := lycian_low_level
		end

	set_lydian is
		do
			value := lydian_low_level
		end

	set_malayalam is
		do
			value := malayalam_low_level
		end

	set_mandaic is
		do
			value := mandaic_low_level
		end

	set_meetei_mayek is
		do
			value := meetei_mayek_low_level
		end

	set_meroitic_cursive is
		do
			value := meroitic_cursive_low_level
		end

	set_meroitic_hieroglyphs is
		do
			value := meroitic_hieroglyphs_low_level
		end

	set_miao is
		do
			value := miao_low_level
		end

	set_mongolian is
		do
			value := mongolian_low_level
		end

	set_myanmar is
		do
			value := myanmar_low_level
		end

	set_new_tai_lue is
		do
			value := new_tai_lue_low_level
		end

	set_nko is
		do
			value := nko_low_level
		end

	set_ogham is
		do
			value := ogham_low_level
		end

	set_ol_chiki is
		do
			value := ol_chiki_low_level
		end

	set_old_italic is
		do
			value := old_italic_low_level
		end

	set_old_persian is
		do
			value := old_persian_low_level
		end

	set_old_south_arabian is
		do
			value := old_south_arabian_low_level
		end

	set_old_turkic is
		do
			value := old_turkic_low_level
		end

	set_oriya is
		do
			value := oriya_low_level
		end

	set_osmanya is
		do
			value := osmanya_low_level
		end

	set_phags_pa is
		do
			value := phags_pa_low_level
		end

	set_phoenician is
		do
			value := phoenician_low_level
		end

	set_rejang is
		do
			value := rejang_low_level
		end

	set_runic is
		do
			value := runic_low_level
		end

	set_samaritan is
		do
			value := samaritan_low_level
		end

	set_saurashtra is
		do
			value := saurashtra_low_level
		end

	set_sharada is
		do
			value := sharada_low_level
		end

	set_shavian is
		do
			value := shavian_low_level
		end

	set_sinhala is
		do
			value := sinhala_low_level
		end

	set_sora_sompeng is
		do
			value := sora_sompeng_low_level
		end

	set_sundanese is
		do
			value := sundanese_low_level
		end

	set_syloti_nagri is
		do
			value := syloti_nagri_low_level
		end

	set_syriac is
		do
			value := syriac_low_level
		end

	set_tagalog is
		do
			value := tagalog_low_level
		end

	set_tagbanwa is
		do
			value := tagbanwa_low_level
		end

	set_tai_le is
		do
			value := tai_le_low_level
		end

	set_tai_tham is
		do
			value := tai_tham_low_level
		end

	set_tai_viet is
		do
			value := tai_viet_low_level
		end

	set_takri is
		do
			value := takri_low_level
		end

	set_tamil is
		do
			value := tamil_low_level
		end

	set_telugu is
		do
			value := telugu_low_level
		end

	set_thaana is
		do
			value := thaana_low_level
		end

	set_thai is
		do
			value := thai_low_level
		end

	set_tibetan is
		do
			value := tibetan_low_level
		end

	set_tifinagh is
		do
			value := tifinagh_low_level
		end

	set_ugaritic is
		do
			value := ugaritic_low_level
		end

	set_unknown is
		do
			value := unknown_low_level
		end

	set_vai is
		do
			value := vai_low_level
		end

	set_yi is
		do
			value := yi_low_level
		end

feature {ANY} -- Queries
	is_arabic: BOOLEAN is
		do
			Result := (value=arabic_low_level)
		end

	is_armenian: BOOLEAN is
		do
			Result := (value=armenian_low_level)
		end

	is_avestan: BOOLEAN is
		do
			Result := (value=avestan_low_level)
		end

	is_balinese: BOOLEAN is
		do
			Result := (value=balinese_low_level)
		end

	is_bamum: BOOLEAN is
		do
			Result := (value=bamum_low_level)
		end

	is_batak: BOOLEAN is
		do
			Result := (value=batak_low_level)
		end

	is_bengali: BOOLEAN is
		do
			Result := (value=bengali_low_level)
		end

	is_bopomofo: BOOLEAN is
		do
			Result := (value=bopomofo_low_level)
		end

	is_brahmi: BOOLEAN is
		do
			Result := (value=brahmi_low_level)
		end

	is_braille: BOOLEAN is
		do
			Result := (value=braille_low_level)
		end

	is_buginese: BOOLEAN is
		do
			Result := (value=buginese_low_level)
		end

	is_buhid: BOOLEAN is
		do
			Result := (value=buhid_low_level)
		end

	is_canadian_aboriginal: BOOLEAN is
		do
			Result := (value=canadian_aboriginal_low_level)
		end

	is_carian: BOOLEAN is
		do
			Result := (value=carian_low_level)
		end

	is_chakma: BOOLEAN is
		do
			Result := (value=chakma_low_level)
		end

	is_cham: BOOLEAN is
		do
			Result := (value=cham_low_level)
		end

	is_cherokee: BOOLEAN is
		do
			Result := (value=cherokee_low_level)
		end

	is_common: BOOLEAN is
		do
			Result := (value=common_low_level)
		end

	is_coptic: BOOLEAN is
		do
			Result := (value=coptic_low_level)
		end

	is_cuneiform: BOOLEAN is
		do
			Result := (value=cuneiform_low_level)
		end

	is_cypriot: BOOLEAN is
		do
			Result := (value=cypriot_low_level)
		end

	is_cyrillic: BOOLEAN is
		do
			Result := (value=cyrillic_low_level)
		end

	is_deseret: BOOLEAN is
		do
			Result := (value=deseret_low_level)
		end

	is_devanagari: BOOLEAN is
		do
			Result := (value=devanagari_low_level)
		end

	is_egyptian_hieroglyphs: BOOLEAN is
		do
			Result := (value=egyptian_hieroglyphs_low_level)
		end

	is_ethiopic: BOOLEAN is
		do
			Result := (value=ethiopic_low_level)
		end

	is_georgian: BOOLEAN is
		do
			Result := (value=georgian_low_level)
		end

	is_glagolitic: BOOLEAN is
		do
			Result := (value=glagolitic_low_level)
		end

	is_gothic: BOOLEAN is
		do
			Result := (value=gothic_low_level)
		end

	is_greek: BOOLEAN is
		do
			Result := (value=greek_low_level)
		end

	is_gujarati: BOOLEAN is
		do
			Result := (value=gujarati_low_level)
		end

	is_gurmukhi: BOOLEAN is
		do
			Result := (value=gurmukhi_low_level)
		end

	is_han: BOOLEAN is
		do
			Result := (value=han_low_level)
		end

	is_hangul: BOOLEAN is
		do
			Result := (value=hangul_low_level)
		end

	is_hanunoo: BOOLEAN is
		do
			Result := (value=hanunoo_low_level)
		end

	is_hebrew: BOOLEAN is
		do
			Result := (value=hebrew_low_level)
		end

	is_hiragana: BOOLEAN is
		do
			Result := (value=hiragana_low_level)
		end

	is_imperial_aramaic: BOOLEAN is
		do
			Result := (value=imperial_aramaic_low_level)
		end

	is_inherited: BOOLEAN is
		do
			Result := (value=inherited_low_level)
		end

	is_inscriptional_pahlavi: BOOLEAN is
		do
			Result := (value=inscriptional_pahlavi_low_level)
		end

	is_inscriptional_parthian: BOOLEAN is
		do
			Result := (value=inscriptional_parthian_low_level)
		end

	is_invalid_code: BOOLEAN is
		do
			Result := (value=invalid_code_low_level)
		end

	is_javanese: BOOLEAN is
		do
			Result := (value=javanese_low_level)
		end

	is_kaithi: BOOLEAN is
		do
			Result := (value=kaithi_low_level)
		end

	is_kannada: BOOLEAN is
		do
			Result := (value=kannada_low_level)
		end

	is_katakana: BOOLEAN is
		do
			Result := (value=katakana_low_level)
		end

	is_kayah_li: BOOLEAN is
		do
			Result := (value=kayah_li_low_level)
		end

	is_kharoshthi: BOOLEAN is
		do
			Result := (value=kharoshthi_low_level)
		end

	is_khmer: BOOLEAN is
		do
			Result := (value=khmer_low_level)
		end

	is_lao: BOOLEAN is
		do
			Result := (value=lao_low_level)
		end

	is_latin: BOOLEAN is
		do
			Result := (value=latin_low_level)
		end

	is_lepcha: BOOLEAN is
		do
			Result := (value=lepcha_low_level)
		end

	is_limbu: BOOLEAN is
		do
			Result := (value=limbu_low_level)
		end

	is_linear_b: BOOLEAN is
		do
			Result := (value=linear_b_low_level)
		end

	is_lisu: BOOLEAN is
		do
			Result := (value=lisu_low_level)
		end

	is_lycian: BOOLEAN is
		do
			Result := (value=lycian_low_level)
		end

	is_lydian: BOOLEAN is
		do
			Result := (value=lydian_low_level)
		end

	is_malayalam: BOOLEAN is
		do
			Result := (value=malayalam_low_level)
		end

	is_mandaic: BOOLEAN is
		do
			Result := (value=mandaic_low_level)
		end

	is_meetei_mayek: BOOLEAN is
		do
			Result := (value=meetei_mayek_low_level)
		end

	is_meroitic_cursive: BOOLEAN is
		do
			Result := (value=meroitic_cursive_low_level)
		end

	is_meroitic_hieroglyphs: BOOLEAN is
		do
			Result := (value=meroitic_hieroglyphs_low_level)
		end

	is_miao: BOOLEAN is
		do
			Result := (value=miao_low_level)
		end

	is_mongolian: BOOLEAN is
		do
			Result := (value=mongolian_low_level)
		end

	is_myanmar: BOOLEAN is
		do
			Result := (value=myanmar_low_level)
		end

	is_new_tai_lue: BOOLEAN is
		do
			Result := (value=new_tai_lue_low_level)
		end

	is_nko: BOOLEAN is
		do
			Result := (value=nko_low_level)
		end

	is_ogham: BOOLEAN is
		do
			Result := (value=ogham_low_level)
		end

	is_ol_chiki: BOOLEAN is
		do
			Result := (value=ol_chiki_low_level)
		end

	is_old_italic: BOOLEAN is
		do
			Result := (value=old_italic_low_level)
		end

	is_old_persian: BOOLEAN is
		do
			Result := (value=old_persian_low_level)
		end

	is_old_south_arabian: BOOLEAN is
		do
			Result := (value=old_south_arabian_low_level)
		end

	is_old_turkic: BOOLEAN is
		do
			Result := (value=old_turkic_low_level)
		end

	is_oriya: BOOLEAN is
		do
			Result := (value=oriya_low_level)
		end

	is_osmanya: BOOLEAN is
		do
			Result := (value=osmanya_low_level)
		end

	is_phags_pa: BOOLEAN is
		do
			Result := (value=phags_pa_low_level)
		end

	is_phoenician: BOOLEAN is
		do
			Result := (value=phoenician_low_level)
		end

	is_rejang: BOOLEAN is
		do
			Result := (value=rejang_low_level)
		end

	is_runic: BOOLEAN is
		do
			Result := (value=runic_low_level)
		end

	is_samaritan: BOOLEAN is
		do
			Result := (value=samaritan_low_level)
		end

	is_saurashtra: BOOLEAN is
		do
			Result := (value=saurashtra_low_level)
		end

	is_sharada: BOOLEAN is
		do
			Result := (value=sharada_low_level)
		end

	is_shavian: BOOLEAN is
		do
			Result := (value=shavian_low_level)
		end

	is_sinhala: BOOLEAN is
		do
			Result := (value=sinhala_low_level)
		end

	is_sora_sompeng: BOOLEAN is
		do
			Result := (value=sora_sompeng_low_level)
		end

	is_sundanese: BOOLEAN is
		do
			Result := (value=sundanese_low_level)
		end

	is_syloti_nagri: BOOLEAN is
		do
			Result := (value=syloti_nagri_low_level)
		end

	is_syriac: BOOLEAN is
		do
			Result := (value=syriac_low_level)
		end

	is_tagalog: BOOLEAN is
		do
			Result := (value=tagalog_low_level)
		end

	is_tagbanwa: BOOLEAN is
		do
			Result := (value=tagbanwa_low_level)
		end

	is_tai_le: BOOLEAN is
		do
			Result := (value=tai_le_low_level)
		end

	is_tai_tham: BOOLEAN is
		do
			Result := (value=tai_tham_low_level)
		end

	is_tai_viet: BOOLEAN is
		do
			Result := (value=tai_viet_low_level)
		end

	is_takri: BOOLEAN is
		do
			Result := (value=takri_low_level)
		end

	is_tamil: BOOLEAN is
		do
			Result := (value=tamil_low_level)
		end

	is_telugu: BOOLEAN is
		do
			Result := (value=telugu_low_level)
		end

	is_thaana: BOOLEAN is
		do
			Result := (value=thaana_low_level)
		end

	is_thai: BOOLEAN is
		do
			Result := (value=thai_low_level)
		end

	is_tibetan: BOOLEAN is
		do
			Result := (value=tibetan_low_level)
		end

	is_tifinagh: BOOLEAN is
		do
			Result := (value=tifinagh_low_level)
		end

	is_ugaritic: BOOLEAN is
		do
			Result := (value=ugaritic_low_level)
		end

	is_unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

	is_vai: BOOLEAN is
		do
			Result := (value=vai_low_level)
		end

	is_yi: BOOLEAN is
		do
			Result := (value=yi_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	arabic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ARABIC"
 			}"
 		end

	armenian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ARMENIAN"
 			}"
 		end

	avestan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_AVESTAN"
 			}"
 		end

	balinese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BALINESE"
 			}"
 		end

	bamum_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BAMUM"
 			}"
 		end

	batak_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BATAK"
 			}"
 		end

	bengali_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BENGALI"
 			}"
 		end

	bopomofo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BOPOMOFO"
 			}"
 		end

	brahmi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BRAHMI"
 			}"
 		end

	braille_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BRAILLE"
 			}"
 		end

	buginese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BUGINESE"
 			}"
 		end

	buhid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_BUHID"
 			}"
 		end

	canadian_aboriginal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CANADIAN_ABORIGINAL"
 			}"
 		end

	carian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CARIAN"
 			}"
 		end

	chakma_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CHAKMA"
 			}"
 		end

	cham_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CHAM"
 			}"
 		end

	cherokee_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CHEROKEE"
 			}"
 		end

	common_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_COMMON"
 			}"
 		end

	coptic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_COPTIC"
 			}"
 		end

	cuneiform_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CUNEIFORM"
 			}"
 		end

	cypriot_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CYPRIOT"
 			}"
 		end

	cyrillic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_CYRILLIC"
 			}"
 		end

	deseret_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_DESERET"
 			}"
 		end

	devanagari_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_DEVANAGARI"
 			}"
 		end

	egyptian_hieroglyphs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_EGYPTIAN_HIEROGLYPHS"
 			}"
 		end

	ethiopic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ETHIOPIC"
 			}"
 		end

	georgian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GEORGIAN"
 			}"
 		end

	glagolitic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GLAGOLITIC"
 			}"
 		end

	gothic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GOTHIC"
 			}"
 		end

	greek_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GREEK"
 			}"
 		end

	gujarati_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GUJARATI"
 			}"
 		end

	gurmukhi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_GURMUKHI"
 			}"
 		end

	han_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HAN"
 			}"
 		end

	hangul_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HANGUL"
 			}"
 		end

	hanunoo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HANUNOO"
 			}"
 		end

	hebrew_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HEBREW"
 			}"
 		end

	hiragana_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_HIRAGANA"
 			}"
 		end

	imperial_aramaic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_IMPERIAL_ARAMAIC"
 			}"
 		end

	inherited_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INHERITED"
 			}"
 		end

	inscriptional_pahlavi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INSCRIPTIONAL_PAHLAVI"
 			}"
 		end

	inscriptional_parthian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INSCRIPTIONAL_PARTHIAN"
 			}"
 		end

	invalid_code_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_INVALID_CODE"
 			}"
 		end

	javanese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_JAVANESE"
 			}"
 		end

	kaithi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KAITHI"
 			}"
 		end

	kannada_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KANNADA"
 			}"
 		end

	katakana_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KATAKANA"
 			}"
 		end

	kayah_li_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KAYAH_LI"
 			}"
 		end

	kharoshthi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KHAROSHTHI"
 			}"
 		end

	khmer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_KHMER"
 			}"
 		end

	lao_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LAO"
 			}"
 		end

	latin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LATIN"
 			}"
 		end

	lepcha_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LEPCHA"
 			}"
 		end

	limbu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LIMBU"
 			}"
 		end

	linear_b_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LINEAR_B"
 			}"
 		end

	lisu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LISU"
 			}"
 		end

	lycian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LYCIAN"
 			}"
 		end

	lydian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_LYDIAN"
 			}"
 		end

	malayalam_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MALAYALAM"
 			}"
 		end

	mandaic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MANDAIC"
 			}"
 		end

	meetei_mayek_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MEETEI_MAYEK"
 			}"
 		end

	meroitic_cursive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MEROITIC_CURSIVE"
 			}"
 		end

	meroitic_hieroglyphs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MEROITIC_HIEROGLYPHS"
 			}"
 		end

	miao_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MIAO"
 			}"
 		end

	mongolian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MONGOLIAN"
 			}"
 		end

	myanmar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_MYANMAR"
 			}"
 		end

	new_tai_lue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_NEW_TAI_LUE"
 			}"
 		end

	nko_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_NKO"
 			}"
 		end

	ogham_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OGHAM"
 			}"
 		end

	ol_chiki_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OL_CHIKI"
 			}"
 		end

	old_italic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_ITALIC"
 			}"
 		end

	old_persian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_PERSIAN"
 			}"
 		end

	old_south_arabian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_SOUTH_ARABIAN"
 			}"
 		end

	old_turkic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OLD_TURKIC"
 			}"
 		end

	oriya_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_ORIYA"
 			}"
 		end

	osmanya_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_OSMANYA"
 			}"
 		end

	phags_pa_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_PHAGS_PA"
 			}"
 		end

	phoenician_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_PHOENICIAN"
 			}"
 		end

	rejang_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_REJANG"
 			}"
 		end

	runic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_RUNIC"
 			}"
 		end

	samaritan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SAMARITAN"
 			}"
 		end

	saurashtra_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SAURASHTRA"
 			}"
 		end

	sharada_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SHARADA"
 			}"
 		end

	shavian_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SHAVIAN"
 			}"
 		end

	sinhala_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SINHALA"
 			}"
 		end

	sora_sompeng_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SORA_SOMPENG"
 			}"
 		end

	sundanese_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SUNDANESE"
 			}"
 		end

	syloti_nagri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SYLOTI_NAGRI"
 			}"
 		end

	syriac_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_SYRIAC"
 			}"
 		end

	tagalog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAGALOG"
 			}"
 		end

	tagbanwa_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAGBANWA"
 			}"
 		end

	tai_le_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAI_LE"
 			}"
 		end

	tai_tham_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAI_THAM"
 			}"
 		end

	tai_viet_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAI_VIET"
 			}"
 		end

	takri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAKRI"
 			}"
 		end

	tamil_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TAMIL"
 			}"
 		end

	telugu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TELUGU"
 			}"
 		end

	thaana_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_THAANA"
 			}"
 		end

	thai_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_THAI"
 			}"
 		end

	tibetan_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TIBETAN"
 			}"
 		end

	tifinagh_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_TIFINAGH"
 			}"
 		end

	ugaritic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_UGARITIC"
 			}"
 		end

	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_UNKNOWN"
 			}"
 		end

	vai_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_VAI"
 			}"
 		end

	yi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SCRIPT_YI"
 			}"
 		end


end -- class GUNICODE_SCRIPT_ENUM
