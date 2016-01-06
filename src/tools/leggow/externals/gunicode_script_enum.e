-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GUNICODE_SCRIPT_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = arabic_low_level)  or else
				(a_value = armenian_low_level)  or else
				(a_value = avestan_low_level)  or else
				(a_value = balinese_low_level)  or else
				(a_value = bamum_low_level)  or else
				(a_value = bassa_vah_low_level)  or else
				(a_value = batak_low_level)  or else
				(a_value = bengali_low_level)  or else
				(a_value = bopomofo_low_level)  or else
				(a_value = brahmi_low_level)  or else
				(a_value = braille_low_level)  or else
				(a_value = buginese_low_level)  or else
				(a_value = buhid_low_level)  or else
				(a_value = canadian_aboriginal_low_level)  or else
				(a_value = carian_low_level)  or else
				(a_value = caucasian_albanian_low_level)  or else
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
				(a_value = duployan_low_level)  or else
				(a_value = egyptian_hieroglyphs_low_level)  or else
				(a_value = elbasan_low_level)  or else
				(a_value = ethiopic_low_level)  or else
				(a_value = georgian_low_level)  or else
				(a_value = glagolitic_low_level)  or else
				(a_value = gothic_low_level)  or else
				(a_value = grantha_low_level)  or else
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
				(a_value = khojki_low_level)  or else
				(a_value = khudawadi_low_level)  or else
				(a_value = lao_low_level)  or else
				(a_value = latin_low_level)  or else
				(a_value = lepcha_low_level)  or else
				(a_value = limbu_low_level)  or else
				(a_value = linear_a_low_level)  or else
				(a_value = linear_b_low_level)  or else
				(a_value = lisu_low_level)  or else
				(a_value = lycian_low_level)  or else
				(a_value = lydian_low_level)  or else
				(a_value = mahajani_low_level)  or else
				(a_value = malayalam_low_level)  or else
				(a_value = mandaic_low_level)  or else
				(a_value = manichaean_low_level)  or else
				(a_value = meetei_mayek_low_level)  or else
				(a_value = mende_kikakui_low_level)  or else
				(a_value = meroitic_cursive_low_level)  or else
				(a_value = meroitic_hieroglyphs_low_level)  or else
				(a_value = miao_low_level)  or else
				(a_value = modi_low_level)  or else
				(a_value = mongolian_low_level)  or else
				(a_value = mro_low_level)  or else
				(a_value = myanmar_low_level)  or else
				(a_value = nabataean_low_level)  or else
				(a_value = new_tai_lue_low_level)  or else
				(a_value = nko_low_level)  or else
				(a_value = ogham_low_level)  or else
				(a_value = ol_chiki_low_level)  or else
				(a_value = old_italic_low_level)  or else
				(a_value = old_north_arabian_low_level)  or else
				(a_value = old_permic_low_level)  or else
				(a_value = old_persian_low_level)  or else
				(a_value = old_south_arabian_low_level)  or else
				(a_value = old_turkic_low_level)  or else
				(a_value = oriya_low_level)  or else
				(a_value = osmanya_low_level)  or else
				(a_value = pahawh_hmong_low_level)  or else
				(a_value = palmyrene_low_level)  or else
				(a_value = pau_cin_hau_low_level)  or else
				(a_value = phags_pa_low_level)  or else
				(a_value = phoenician_low_level)  or else
				(a_value = psalter_pahlavi_low_level)  or else
				(a_value = rejang_low_level)  or else
				(a_value = runic_low_level)  or else
				(a_value = samaritan_low_level)  or else
				(a_value = saurashtra_low_level)  or else
				(a_value = sharada_low_level)  or else
				(a_value = shavian_low_level)  or else
				(a_value = siddham_low_level)  or else
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
				(a_value = tirhuta_low_level)  or else
				(a_value = ugaritic_low_level)  or else
				(a_value = unknown_low_level)  or else
				(a_value = vai_low_level)  or else
				(a_value = warang_citi_low_level)  or else
				(a_value = yi_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_arabic
               do
                       value := arabic_low_level
               end

	set_armenian
               do
                       value := armenian_low_level
               end

	set_avestan
               do
                       value := avestan_low_level
               end

	set_balinese
               do
                       value := balinese_low_level
               end

	set_bamum
               do
                       value := bamum_low_level
               end

	set_bassa_vah
               do
                       value := bassa_vah_low_level
               end

	set_batak
               do
                       value := batak_low_level
               end

	set_bengali
               do
                       value := bengali_low_level
               end

	set_bopomofo
               do
                       value := bopomofo_low_level
               end

	set_brahmi
               do
                       value := brahmi_low_level
               end

	set_braille
               do
                       value := braille_low_level
               end

	set_buginese
               do
                       value := buginese_low_level
               end

	set_buhid
               do
                       value := buhid_low_level
               end

	set_canadian_aboriginal
               do
                       value := canadian_aboriginal_low_level
               end

	set_carian
               do
                       value := carian_low_level
               end

	set_caucasian_albanian
               do
                       value := caucasian_albanian_low_level
               end

	set_chakma
               do
                       value := chakma_low_level
               end

	set_cham
               do
                       value := cham_low_level
               end

	set_cherokee
               do
                       value := cherokee_low_level
               end

	set_common
               do
                       value := common_low_level
               end

	set_coptic
               do
                       value := coptic_low_level
               end

	set_cuneiform
               do
                       value := cuneiform_low_level
               end

	set_cypriot
               do
                       value := cypriot_low_level
               end

	set_cyrillic
               do
                       value := cyrillic_low_level
               end

	set_deseret
               do
                       value := deseret_low_level
               end

	set_devanagari
               do
                       value := devanagari_low_level
               end

	set_duployan
               do
                       value := duployan_low_level
               end

	set_egyptian_hieroglyphs
               do
                       value := egyptian_hieroglyphs_low_level
               end

	set_elbasan
               do
                       value := elbasan_low_level
               end

	set_ethiopic
               do
                       value := ethiopic_low_level
               end

	set_georgian
               do
                       value := georgian_low_level
               end

	set_glagolitic
               do
                       value := glagolitic_low_level
               end

	set_gothic
               do
                       value := gothic_low_level
               end

	set_grantha
               do
                       value := grantha_low_level
               end

	set_greek
               do
                       value := greek_low_level
               end

	set_gujarati
               do
                       value := gujarati_low_level
               end

	set_gurmukhi
               do
                       value := gurmukhi_low_level
               end

	set_han
               do
                       value := han_low_level
               end

	set_hangul
               do
                       value := hangul_low_level
               end

	set_hanunoo
               do
                       value := hanunoo_low_level
               end

	set_hebrew
               do
                       value := hebrew_low_level
               end

	set_hiragana
               do
                       value := hiragana_low_level
               end

	set_imperial_aramaic
               do
                       value := imperial_aramaic_low_level
               end

	set_inherited
               do
                       value := inherited_low_level
               end

	set_inscriptional_pahlavi
               do
                       value := inscriptional_pahlavi_low_level
               end

	set_inscriptional_parthian
               do
                       value := inscriptional_parthian_low_level
               end

	set_invalid_code
               do
                       value := invalid_code_low_level
               end

	set_javanese
               do
                       value := javanese_low_level
               end

	set_kaithi
               do
                       value := kaithi_low_level
               end

	set_kannada
               do
                       value := kannada_low_level
               end

	set_katakana
               do
                       value := katakana_low_level
               end

	set_kayah_li
               do
                       value := kayah_li_low_level
               end

	set_kharoshthi
               do
                       value := kharoshthi_low_level
               end

	set_khmer
               do
                       value := khmer_low_level
               end

	set_khojki
               do
                       value := khojki_low_level
               end

	set_khudawadi
               do
                       value := khudawadi_low_level
               end

	set_lao
               do
                       value := lao_low_level
               end

	set_latin
               do
                       value := latin_low_level
               end

	set_lepcha
               do
                       value := lepcha_low_level
               end

	set_limbu
               do
                       value := limbu_low_level
               end

	set_linear_a
               do
                       value := linear_a_low_level
               end

	set_linear_b
               do
                       value := linear_b_low_level
               end

	set_lisu
               do
                       value := lisu_low_level
               end

	set_lycian
               do
                       value := lycian_low_level
               end

	set_lydian
               do
                       value := lydian_low_level
               end

	set_mahajani
               do
                       value := mahajani_low_level
               end

	set_malayalam
               do
                       value := malayalam_low_level
               end

	set_mandaic
               do
                       value := mandaic_low_level
               end

	set_manichaean
               do
                       value := manichaean_low_level
               end

	set_meetei_mayek
               do
                       value := meetei_mayek_low_level
               end

	set_mende_kikakui
               do
                       value := mende_kikakui_low_level
               end

	set_meroitic_cursive
               do
                       value := meroitic_cursive_low_level
               end

	set_meroitic_hieroglyphs
               do
                       value := meroitic_hieroglyphs_low_level
               end

	set_miao
               do
                       value := miao_low_level
               end

	set_modi
               do
                       value := modi_low_level
               end

	set_mongolian
               do
                       value := mongolian_low_level
               end

	set_mro
               do
                       value := mro_low_level
               end

	set_myanmar
               do
                       value := myanmar_low_level
               end

	set_nabataean
               do
                       value := nabataean_low_level
               end

	set_new_tai_lue
               do
                       value := new_tai_lue_low_level
               end

	set_nko
               do
                       value := nko_low_level
               end

	set_ogham
               do
                       value := ogham_low_level
               end

	set_ol_chiki
               do
                       value := ol_chiki_low_level
               end

	set_old_italic
               do
                       value := old_italic_low_level
               end

	set_old_north_arabian
               do
                       value := old_north_arabian_low_level
               end

	set_old_permic
               do
                       value := old_permic_low_level
               end

	set_old_persian
               do
                       value := old_persian_low_level
               end

	set_old_south_arabian
               do
                       value := old_south_arabian_low_level
               end

	set_old_turkic
               do
                       value := old_turkic_low_level
               end

	set_oriya
               do
                       value := oriya_low_level
               end

	set_osmanya
               do
                       value := osmanya_low_level
               end

	set_pahawh_hmong
               do
                       value := pahawh_hmong_low_level
               end

	set_palmyrene
               do
                       value := palmyrene_low_level
               end

	set_pau_cin_hau
               do
                       value := pau_cin_hau_low_level
               end

	set_phags_pa
               do
                       value := phags_pa_low_level
               end

	set_phoenician
               do
                       value := phoenician_low_level
               end

	set_psalter_pahlavi
               do
                       value := psalter_pahlavi_low_level
               end

	set_rejang
               do
                       value := rejang_low_level
               end

	set_runic
               do
                       value := runic_low_level
               end

	set_samaritan
               do
                       value := samaritan_low_level
               end

	set_saurashtra
               do
                       value := saurashtra_low_level
               end

	set_sharada
               do
                       value := sharada_low_level
               end

	set_shavian
               do
                       value := shavian_low_level
               end

	set_siddham
               do
                       value := siddham_low_level
               end

	set_sinhala
               do
                       value := sinhala_low_level
               end

	set_sora_sompeng
               do
                       value := sora_sompeng_low_level
               end

	set_sundanese
               do
                       value := sundanese_low_level
               end

	set_syloti_nagri
               do
                       value := syloti_nagri_low_level
               end

	set_syriac
               do
                       value := syriac_low_level
               end

	set_tagalog
               do
                       value := tagalog_low_level
               end

	set_tagbanwa
               do
                       value := tagbanwa_low_level
               end

	set_tai_le
               do
                       value := tai_le_low_level
               end

	set_tai_tham
               do
                       value := tai_tham_low_level
               end

	set_tai_viet
               do
                       value := tai_viet_low_level
               end

	set_takri
               do
                       value := takri_low_level
               end

	set_tamil
               do
                       value := tamil_low_level
               end

	set_telugu
               do
                       value := telugu_low_level
               end

	set_thaana
               do
                       value := thaana_low_level
               end

	set_thai
               do
                       value := thai_low_level
               end

	set_tibetan
               do
                       value := tibetan_low_level
               end

	set_tifinagh
               do
                       value := tifinagh_low_level
               end

	set_tirhuta
               do
                       value := tirhuta_low_level
               end

	set_ugaritic
               do
                       value := ugaritic_low_level
               end

	set_unknown
               do
                       value := unknown_low_level
               end

	set_vai
               do
                       value := vai_low_level
               end

	set_warang_citi
               do
                       value := warang_citi_low_level
               end

	set_yi
               do
                       value := yi_low_level
               end

feature {ANY} -- Queries
       is_arabic: BOOLEAN
               do
                       Result := (value=arabic_low_level)
               end

       is_armenian: BOOLEAN
               do
                       Result := (value=armenian_low_level)
               end

       is_avestan: BOOLEAN
               do
                       Result := (value=avestan_low_level)
               end

       is_balinese: BOOLEAN
               do
                       Result := (value=balinese_low_level)
               end

       is_bamum: BOOLEAN
               do
                       Result := (value=bamum_low_level)
               end

       is_bassa_vah: BOOLEAN
               do
                       Result := (value=bassa_vah_low_level)
               end

       is_batak: BOOLEAN
               do
                       Result := (value=batak_low_level)
               end

       is_bengali: BOOLEAN
               do
                       Result := (value=bengali_low_level)
               end

       is_bopomofo: BOOLEAN
               do
                       Result := (value=bopomofo_low_level)
               end

       is_brahmi: BOOLEAN
               do
                       Result := (value=brahmi_low_level)
               end

       is_braille: BOOLEAN
               do
                       Result := (value=braille_low_level)
               end

       is_buginese: BOOLEAN
               do
                       Result := (value=buginese_low_level)
               end

       is_buhid: BOOLEAN
               do
                       Result := (value=buhid_low_level)
               end

       is_canadian_aboriginal: BOOLEAN
               do
                       Result := (value=canadian_aboriginal_low_level)
               end

       is_carian: BOOLEAN
               do
                       Result := (value=carian_low_level)
               end

       is_caucasian_albanian: BOOLEAN
               do
                       Result := (value=caucasian_albanian_low_level)
               end

       is_chakma: BOOLEAN
               do
                       Result := (value=chakma_low_level)
               end

       is_cham: BOOLEAN
               do
                       Result := (value=cham_low_level)
               end

       is_cherokee: BOOLEAN
               do
                       Result := (value=cherokee_low_level)
               end

       is_common: BOOLEAN
               do
                       Result := (value=common_low_level)
               end

       is_coptic: BOOLEAN
               do
                       Result := (value=coptic_low_level)
               end

       is_cuneiform: BOOLEAN
               do
                       Result := (value=cuneiform_low_level)
               end

       is_cypriot: BOOLEAN
               do
                       Result := (value=cypriot_low_level)
               end

       is_cyrillic: BOOLEAN
               do
                       Result := (value=cyrillic_low_level)
               end

       is_deseret: BOOLEAN
               do
                       Result := (value=deseret_low_level)
               end

       is_devanagari: BOOLEAN
               do
                       Result := (value=devanagari_low_level)
               end

       is_duployan: BOOLEAN
               do
                       Result := (value=duployan_low_level)
               end

       is_egyptian_hieroglyphs: BOOLEAN
               do
                       Result := (value=egyptian_hieroglyphs_low_level)
               end

       is_elbasan: BOOLEAN
               do
                       Result := (value=elbasan_low_level)
               end

       is_ethiopic: BOOLEAN
               do
                       Result := (value=ethiopic_low_level)
               end

       is_georgian: BOOLEAN
               do
                       Result := (value=georgian_low_level)
               end

       is_glagolitic: BOOLEAN
               do
                       Result := (value=glagolitic_low_level)
               end

       is_gothic: BOOLEAN
               do
                       Result := (value=gothic_low_level)
               end

       is_grantha: BOOLEAN
               do
                       Result := (value=grantha_low_level)
               end

       is_greek: BOOLEAN
               do
                       Result := (value=greek_low_level)
               end

       is_gujarati: BOOLEAN
               do
                       Result := (value=gujarati_low_level)
               end

       is_gurmukhi: BOOLEAN
               do
                       Result := (value=gurmukhi_low_level)
               end

       is_han: BOOLEAN
               do
                       Result := (value=han_low_level)
               end

       is_hangul: BOOLEAN
               do
                       Result := (value=hangul_low_level)
               end

       is_hanunoo: BOOLEAN
               do
                       Result := (value=hanunoo_low_level)
               end

       is_hebrew: BOOLEAN
               do
                       Result := (value=hebrew_low_level)
               end

       is_hiragana: BOOLEAN
               do
                       Result := (value=hiragana_low_level)
               end

       is_imperial_aramaic: BOOLEAN
               do
                       Result := (value=imperial_aramaic_low_level)
               end

       is_inherited: BOOLEAN
               do
                       Result := (value=inherited_low_level)
               end

       is_inscriptional_pahlavi: BOOLEAN
               do
                       Result := (value=inscriptional_pahlavi_low_level)
               end

       is_inscriptional_parthian: BOOLEAN
               do
                       Result := (value=inscriptional_parthian_low_level)
               end

       is_invalid_code: BOOLEAN
               do
                       Result := (value=invalid_code_low_level)
               end

       is_javanese: BOOLEAN
               do
                       Result := (value=javanese_low_level)
               end

       is_kaithi: BOOLEAN
               do
                       Result := (value=kaithi_low_level)
               end

       is_kannada: BOOLEAN
               do
                       Result := (value=kannada_low_level)
               end

       is_katakana: BOOLEAN
               do
                       Result := (value=katakana_low_level)
               end

       is_kayah_li: BOOLEAN
               do
                       Result := (value=kayah_li_low_level)
               end

       is_kharoshthi: BOOLEAN
               do
                       Result := (value=kharoshthi_low_level)
               end

       is_khmer: BOOLEAN
               do
                       Result := (value=khmer_low_level)
               end

       is_khojki: BOOLEAN
               do
                       Result := (value=khojki_low_level)
               end

       is_khudawadi: BOOLEAN
               do
                       Result := (value=khudawadi_low_level)
               end

       is_lao: BOOLEAN
               do
                       Result := (value=lao_low_level)
               end

       is_latin: BOOLEAN
               do
                       Result := (value=latin_low_level)
               end

       is_lepcha: BOOLEAN
               do
                       Result := (value=lepcha_low_level)
               end

       is_limbu: BOOLEAN
               do
                       Result := (value=limbu_low_level)
               end

       is_linear_a: BOOLEAN
               do
                       Result := (value=linear_a_low_level)
               end

       is_linear_b: BOOLEAN
               do
                       Result := (value=linear_b_low_level)
               end

       is_lisu: BOOLEAN
               do
                       Result := (value=lisu_low_level)
               end

       is_lycian: BOOLEAN
               do
                       Result := (value=lycian_low_level)
               end

       is_lydian: BOOLEAN
               do
                       Result := (value=lydian_low_level)
               end

       is_mahajani: BOOLEAN
               do
                       Result := (value=mahajani_low_level)
               end

       is_malayalam: BOOLEAN
               do
                       Result := (value=malayalam_low_level)
               end

       is_mandaic: BOOLEAN
               do
                       Result := (value=mandaic_low_level)
               end

       is_manichaean: BOOLEAN
               do
                       Result := (value=manichaean_low_level)
               end

       is_meetei_mayek: BOOLEAN
               do
                       Result := (value=meetei_mayek_low_level)
               end

       is_mende_kikakui: BOOLEAN
               do
                       Result := (value=mende_kikakui_low_level)
               end

       is_meroitic_cursive: BOOLEAN
               do
                       Result := (value=meroitic_cursive_low_level)
               end

       is_meroitic_hieroglyphs: BOOLEAN
               do
                       Result := (value=meroitic_hieroglyphs_low_level)
               end

       is_miao: BOOLEAN
               do
                       Result := (value=miao_low_level)
               end

       is_modi: BOOLEAN
               do
                       Result := (value=modi_low_level)
               end

       is_mongolian: BOOLEAN
               do
                       Result := (value=mongolian_low_level)
               end

       is_mro: BOOLEAN
               do
                       Result := (value=mro_low_level)
               end

       is_myanmar: BOOLEAN
               do
                       Result := (value=myanmar_low_level)
               end

       is_nabataean: BOOLEAN
               do
                       Result := (value=nabataean_low_level)
               end

       is_new_tai_lue: BOOLEAN
               do
                       Result := (value=new_tai_lue_low_level)
               end

       is_nko: BOOLEAN
               do
                       Result := (value=nko_low_level)
               end

       is_ogham: BOOLEAN
               do
                       Result := (value=ogham_low_level)
               end

       is_ol_chiki: BOOLEAN
               do
                       Result := (value=ol_chiki_low_level)
               end

       is_old_italic: BOOLEAN
               do
                       Result := (value=old_italic_low_level)
               end

       is_old_north_arabian: BOOLEAN
               do
                       Result := (value=old_north_arabian_low_level)
               end

       is_old_permic: BOOLEAN
               do
                       Result := (value=old_permic_low_level)
               end

       is_old_persian: BOOLEAN
               do
                       Result := (value=old_persian_low_level)
               end

       is_old_south_arabian: BOOLEAN
               do
                       Result := (value=old_south_arabian_low_level)
               end

       is_old_turkic: BOOLEAN
               do
                       Result := (value=old_turkic_low_level)
               end

       is_oriya: BOOLEAN
               do
                       Result := (value=oriya_low_level)
               end

       is_osmanya: BOOLEAN
               do
                       Result := (value=osmanya_low_level)
               end

       is_pahawh_hmong: BOOLEAN
               do
                       Result := (value=pahawh_hmong_low_level)
               end

       is_palmyrene: BOOLEAN
               do
                       Result := (value=palmyrene_low_level)
               end

       is_pau_cin_hau: BOOLEAN
               do
                       Result := (value=pau_cin_hau_low_level)
               end

       is_phags_pa: BOOLEAN
               do
                       Result := (value=phags_pa_low_level)
               end

       is_phoenician: BOOLEAN
               do
                       Result := (value=phoenician_low_level)
               end

       is_psalter_pahlavi: BOOLEAN
               do
                       Result := (value=psalter_pahlavi_low_level)
               end

       is_rejang: BOOLEAN
               do
                       Result := (value=rejang_low_level)
               end

       is_runic: BOOLEAN
               do
                       Result := (value=runic_low_level)
               end

       is_samaritan: BOOLEAN
               do
                       Result := (value=samaritan_low_level)
               end

       is_saurashtra: BOOLEAN
               do
                       Result := (value=saurashtra_low_level)
               end

       is_sharada: BOOLEAN
               do
                       Result := (value=sharada_low_level)
               end

       is_shavian: BOOLEAN
               do
                       Result := (value=shavian_low_level)
               end

       is_siddham: BOOLEAN
               do
                       Result := (value=siddham_low_level)
               end

       is_sinhala: BOOLEAN
               do
                       Result := (value=sinhala_low_level)
               end

       is_sora_sompeng: BOOLEAN
               do
                       Result := (value=sora_sompeng_low_level)
               end

       is_sundanese: BOOLEAN
               do
                       Result := (value=sundanese_low_level)
               end

       is_syloti_nagri: BOOLEAN
               do
                       Result := (value=syloti_nagri_low_level)
               end

       is_syriac: BOOLEAN
               do
                       Result := (value=syriac_low_level)
               end

       is_tagalog: BOOLEAN
               do
                       Result := (value=tagalog_low_level)
               end

       is_tagbanwa: BOOLEAN
               do
                       Result := (value=tagbanwa_low_level)
               end

       is_tai_le: BOOLEAN
               do
                       Result := (value=tai_le_low_level)
               end

       is_tai_tham: BOOLEAN
               do
                       Result := (value=tai_tham_low_level)
               end

       is_tai_viet: BOOLEAN
               do
                       Result := (value=tai_viet_low_level)
               end

       is_takri: BOOLEAN
               do
                       Result := (value=takri_low_level)
               end

       is_tamil: BOOLEAN
               do
                       Result := (value=tamil_low_level)
               end

       is_telugu: BOOLEAN
               do
                       Result := (value=telugu_low_level)
               end

       is_thaana: BOOLEAN
               do
                       Result := (value=thaana_low_level)
               end

       is_thai: BOOLEAN
               do
                       Result := (value=thai_low_level)
               end

       is_tibetan: BOOLEAN
               do
                       Result := (value=tibetan_low_level)
               end

       is_tifinagh: BOOLEAN
               do
                       Result := (value=tifinagh_low_level)
               end

       is_tirhuta: BOOLEAN
               do
                       Result := (value=tirhuta_low_level)
               end

       is_ugaritic: BOOLEAN
               do
                       Result := (value=ugaritic_low_level)
               end

       is_unknown: BOOLEAN
               do
                       Result := (value=unknown_low_level)
               end

       is_vai: BOOLEAN
               do
                       Result := (value=vai_low_level)
               end

       is_warang_citi: BOOLEAN
               do
                       Result := (value=warang_citi_low_level)
               end

       is_yi: BOOLEAN
               do
                       Result := (value=yi_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     arabic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_ARABIC"
                       }"
               end

     armenian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_ARMENIAN"
                       }"
               end

     avestan_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_AVESTAN"
                       }"
               end

     balinese_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_BALINESE"
                       }"
               end

     bamum_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_BAMUM"
                       }"
               end

     bassa_vah_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_BASSA_VAH"
                       }"
               end

     batak_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_BATAK"
                       }"
               end

     bengali_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_BENGALI"
                       }"
               end

     bopomofo_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_BOPOMOFO"
                       }"
               end

     brahmi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_BRAHMI"
                       }"
               end

     braille_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_BRAILLE"
                       }"
               end

     buginese_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_BUGINESE"
                       }"
               end

     buhid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_BUHID"
                       }"
               end

     canadian_aboriginal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_CANADIAN_ABORIGINAL"
                       }"
               end

     carian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_CARIAN"
                       }"
               end

     caucasian_albanian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_CAUCASIAN_ALBANIAN"
                       }"
               end

     chakma_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_CHAKMA"
                       }"
               end

     cham_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_CHAM"
                       }"
               end

     cherokee_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_CHEROKEE"
                       }"
               end

     common_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_COMMON"
                       }"
               end

     coptic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_COPTIC"
                       }"
               end

     cuneiform_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_CUNEIFORM"
                       }"
               end

     cypriot_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_CYPRIOT"
                       }"
               end

     cyrillic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_CYRILLIC"
                       }"
               end

     deseret_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_DESERET"
                       }"
               end

     devanagari_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_DEVANAGARI"
                       }"
               end

     duployan_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_DUPLOYAN"
                       }"
               end

     egyptian_hieroglyphs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_EGYPTIAN_HIEROGLYPHS"
                       }"
               end

     elbasan_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_ELBASAN"
                       }"
               end

     ethiopic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_ETHIOPIC"
                       }"
               end

     georgian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_GEORGIAN"
                       }"
               end

     glagolitic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_GLAGOLITIC"
                       }"
               end

     gothic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_GOTHIC"
                       }"
               end

     grantha_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_GRANTHA"
                       }"
               end

     greek_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_GREEK"
                       }"
               end

     gujarati_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_GUJARATI"
                       }"
               end

     gurmukhi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_GURMUKHI"
                       }"
               end

     han_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_HAN"
                       }"
               end

     hangul_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_HANGUL"
                       }"
               end

     hanunoo_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_HANUNOO"
                       }"
               end

     hebrew_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_HEBREW"
                       }"
               end

     hiragana_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_HIRAGANA"
                       }"
               end

     imperial_aramaic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_IMPERIAL_ARAMAIC"
                       }"
               end

     inherited_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_INHERITED"
                       }"
               end

     inscriptional_pahlavi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_INSCRIPTIONAL_PAHLAVI"
                       }"
               end

     inscriptional_parthian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_INSCRIPTIONAL_PARTHIAN"
                       }"
               end

     invalid_code_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_INVALID_CODE"
                       }"
               end

     javanese_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_JAVANESE"
                       }"
               end

     kaithi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_KAITHI"
                       }"
               end

     kannada_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_KANNADA"
                       }"
               end

     katakana_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_KATAKANA"
                       }"
               end

     kayah_li_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_KAYAH_LI"
                       }"
               end

     kharoshthi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_KHAROSHTHI"
                       }"
               end

     khmer_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_KHMER"
                       }"
               end

     khojki_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_KHOJKI"
                       }"
               end

     khudawadi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_KHUDAWADI"
                       }"
               end

     lao_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_LAO"
                       }"
               end

     latin_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_LATIN"
                       }"
               end

     lepcha_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_LEPCHA"
                       }"
               end

     limbu_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_LIMBU"
                       }"
               end

     linear_a_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_LINEAR_A"
                       }"
               end

     linear_b_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_LINEAR_B"
                       }"
               end

     lisu_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_LISU"
                       }"
               end

     lycian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_LYCIAN"
                       }"
               end

     lydian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_LYDIAN"
                       }"
               end

     mahajani_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MAHAJANI"
                       }"
               end

     malayalam_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MALAYALAM"
                       }"
               end

     mandaic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MANDAIC"
                       }"
               end

     manichaean_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MANICHAEAN"
                       }"
               end

     meetei_mayek_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MEETEI_MAYEK"
                       }"
               end

     mende_kikakui_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MENDE_KIKAKUI"
                       }"
               end

     meroitic_cursive_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MEROITIC_CURSIVE"
                       }"
               end

     meroitic_hieroglyphs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MEROITIC_HIEROGLYPHS"
                       }"
               end

     miao_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MIAO"
                       }"
               end

     modi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MODI"
                       }"
               end

     mongolian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MONGOLIAN"
                       }"
               end

     mro_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MRO"
                       }"
               end

     myanmar_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_MYANMAR"
                       }"
               end

     nabataean_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_NABATAEAN"
                       }"
               end

     new_tai_lue_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_NEW_TAI_LUE"
                       }"
               end

     nko_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_NKO"
                       }"
               end

     ogham_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_OGHAM"
                       }"
               end

     ol_chiki_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_OL_CHIKI"
                       }"
               end

     old_italic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_OLD_ITALIC"
                       }"
               end

     old_north_arabian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_OLD_NORTH_ARABIAN"
                       }"
               end

     old_permic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_OLD_PERMIC"
                       }"
               end

     old_persian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_OLD_PERSIAN"
                       }"
               end

     old_south_arabian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_OLD_SOUTH_ARABIAN"
                       }"
               end

     old_turkic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_OLD_TURKIC"
                       }"
               end

     oriya_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_ORIYA"
                       }"
               end

     osmanya_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_OSMANYA"
                       }"
               end

     pahawh_hmong_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_PAHAWH_HMONG"
                       }"
               end

     palmyrene_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_PALMYRENE"
                       }"
               end

     pau_cin_hau_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_PAU_CIN_HAU"
                       }"
               end

     phags_pa_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_PHAGS_PA"
                       }"
               end

     phoenician_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_PHOENICIAN"
                       }"
               end

     psalter_pahlavi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_PSALTER_PAHLAVI"
                       }"
               end

     rejang_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_REJANG"
                       }"
               end

     runic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_RUNIC"
                       }"
               end

     samaritan_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_SAMARITAN"
                       }"
               end

     saurashtra_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_SAURASHTRA"
                       }"
               end

     sharada_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_SHARADA"
                       }"
               end

     shavian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_SHAVIAN"
                       }"
               end

     siddham_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_SIDDHAM"
                       }"
               end

     sinhala_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_SINHALA"
                       }"
               end

     sora_sompeng_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_SORA_SOMPENG"
                       }"
               end

     sundanese_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_SUNDANESE"
                       }"
               end

     syloti_nagri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_SYLOTI_NAGRI"
                       }"
               end

     syriac_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_SYRIAC"
                       }"
               end

     tagalog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TAGALOG"
                       }"
               end

     tagbanwa_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TAGBANWA"
                       }"
               end

     tai_le_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TAI_LE"
                       }"
               end

     tai_tham_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TAI_THAM"
                       }"
               end

     tai_viet_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TAI_VIET"
                       }"
               end

     takri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TAKRI"
                       }"
               end

     tamil_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TAMIL"
                       }"
               end

     telugu_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TELUGU"
                       }"
               end

     thaana_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_THAANA"
                       }"
               end

     thai_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_THAI"
                       }"
               end

     tibetan_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TIBETAN"
                       }"
               end

     tifinagh_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TIFINAGH"
                       }"
               end

     tirhuta_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_TIRHUTA"
                       }"
               end

     ugaritic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_UGARITIC"
                       }"
               end

     unknown_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_UNKNOWN"
                       }"
               end

     vai_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_VAI"
                       }"
               end

     warang_citi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_WARANG_CITI"
                       }"
               end

     yi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SCRIPT_YI"
                       }"
               end


end -- class GUNICODE_SCRIPT_ENUM
