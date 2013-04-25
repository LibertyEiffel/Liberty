-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_UNICODE_SCRIPT
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_unicode_script_invalid_code) or else 
				(a_value = g_unicode_script_common) or else 
				(a_value = g_unicode_script_inherited) or else 
				(a_value = g_unicode_script_arabic) or else 
				(a_value = g_unicode_script_armenian) or else 
				(a_value = g_unicode_script_bengali) or else 
				(a_value = g_unicode_script_bopomofo) or else 
				(a_value = g_unicode_script_cherokee) or else 
				(a_value = g_unicode_script_coptic) or else 
				(a_value = g_unicode_script_cyrillic) or else 
				(a_value = g_unicode_script_deseret) or else 
				(a_value = g_unicode_script_devanagari) or else 
				(a_value = g_unicode_script_ethiopic) or else 
				(a_value = g_unicode_script_georgian) or else 
				(a_value = g_unicode_script_gothic) or else 
				(a_value = g_unicode_script_greek) or else 
				(a_value = g_unicode_script_gujarati) or else 
				(a_value = g_unicode_script_gurmukhi) or else 
				(a_value = g_unicode_script_han) or else 
				(a_value = g_unicode_script_hangul) or else 
				(a_value = g_unicode_script_hebrew) or else 
				(a_value = g_unicode_script_hiragana) or else 
				(a_value = g_unicode_script_kannada) or else 
				(a_value = g_unicode_script_katakana) or else 
				(a_value = g_unicode_script_khmer) or else 
				(a_value = g_unicode_script_lao) or else 
				(a_value = g_unicode_script_latin) or else 
				(a_value = g_unicode_script_malayalam) or else 
				(a_value = g_unicode_script_mongolian) or else 
				(a_value = g_unicode_script_myanmar) or else 
				(a_value = g_unicode_script_ogham) or else 
				(a_value = g_unicode_script_old_italic) or else 
				(a_value = g_unicode_script_oriya) or else 
				(a_value = g_unicode_script_runic) or else 
				(a_value = g_unicode_script_sinhala) or else 
				(a_value = g_unicode_script_syriac) or else 
				(a_value = g_unicode_script_tamil) or else 
				(a_value = g_unicode_script_telugu) or else 
				(a_value = g_unicode_script_thaana) or else 
				(a_value = g_unicode_script_thai) or else 
				(a_value = g_unicode_script_tibetan) or else 
				(a_value = g_unicode_script_canadian_aboriginal) or else 
				(a_value = g_unicode_script_yi) or else 
				(a_value = g_unicode_script_tagalog) or else 
				(a_value = g_unicode_script_hanunoo) or else 
				(a_value = g_unicode_script_buhid) or else 
				(a_value = g_unicode_script_tagbanwa) or else 
				(a_value = g_unicode_script_braille) or else 
				(a_value = g_unicode_script_cypriot) or else 
				(a_value = g_unicode_script_limbu) or else 
				(a_value = g_unicode_script_osmanya) or else 
				(a_value = g_unicode_script_shavian) or else 
				(a_value = g_unicode_script_linear_b) or else 
				(a_value = g_unicode_script_tai_le) or else 
				(a_value = g_unicode_script_ugaritic) or else 
				(a_value = g_unicode_script_new_tai_lue) or else 
				(a_value = g_unicode_script_buginese) or else 
				(a_value = g_unicode_script_glagolitic) or else 
				(a_value = g_unicode_script_tifinagh) or else 
				(a_value = g_unicode_script_syloti_nagri) or else 
				(a_value = g_unicode_script_old_persian) or else 
				(a_value = g_unicode_script_kharoshthi) or else 
				(a_value = g_unicode_script_unknown) or else 
				(a_value = g_unicode_script_balinese) or else 
				(a_value = g_unicode_script_cuneiform) or else 
				(a_value = g_unicode_script_phoenician) or else 
				(a_value = g_unicode_script_phags_pa) or else 
				(a_value = g_unicode_script_nko) or else 
				(a_value = g_unicode_script_kayah_li) or else 
				(a_value = g_unicode_script_lepcha) or else 
				(a_value = g_unicode_script_rejang) or else 
				(a_value = g_unicode_script_sundanese) or else 
				(a_value = g_unicode_script_saurashtra) or else 
				(a_value = g_unicode_script_cham) or else 
				(a_value = g_unicode_script_ol_chiki) or else 
				(a_value = g_unicode_script_vai) or else 
				(a_value = g_unicode_script_carian) or else 
				(a_value = g_unicode_script_lycian) or else 
				(a_value = g_unicode_script_lydian))
		end


feature {ANY} -- Setters
	default_create, set_invalid_code is
		do
			value := g_unicode_script_invalid_code
		end

	set_common is
		do
			value := g_unicode_script_common
		end

	set_inherited is
		do
			value := g_unicode_script_inherited
		end

	set_arabic is
		do
			value := g_unicode_script_arabic
		end

	set_armenian is
		do
			value := g_unicode_script_armenian
		end

	set_bengali is
		do
			value := g_unicode_script_bengali
		end

	set_bopomofo is
		do
			value := g_unicode_script_bopomofo
		end

	set_cherokee is
		do
			value := g_unicode_script_cherokee
		end

	set_coptic is
		do
			value := g_unicode_script_coptic
		end

	set_cyrillic is
		do
			value := g_unicode_script_cyrillic
		end

	set_deseret is
		do
			value := g_unicode_script_deseret
		end

	set_devanagari is
		do
			value := g_unicode_script_devanagari
		end

	set_ethiopic is
		do
			value := g_unicode_script_ethiopic
		end

	set_georgian is
		do
			value := g_unicode_script_georgian
		end

	set_gothic is
		do
			value := g_unicode_script_gothic
		end

	set_greek is
		do
			value := g_unicode_script_greek
		end

	set_gujarati is
		do
			value := g_unicode_script_gujarati
		end

	set_gurmukhi is
		do
			value := g_unicode_script_gurmukhi
		end

	set_han is
		do
			value := g_unicode_script_han
		end

	set_hangul is
		do
			value := g_unicode_script_hangul
		end

	set_hebrew is
		do
			value := g_unicode_script_hebrew
		end

	set_hiragana is
		do
			value := g_unicode_script_hiragana
		end

	set_kannada is
		do
			value := g_unicode_script_kannada
		end

	set_katakana is
		do
			value := g_unicode_script_katakana
		end

	set_khmer is
		do
			value := g_unicode_script_khmer
		end

	set_lao is
		do
			value := g_unicode_script_lao
		end

	set_latin is
		do
			value := g_unicode_script_latin
		end

	set_malayalam is
		do
			value := g_unicode_script_malayalam
		end

	set_mongolian is
		do
			value := g_unicode_script_mongolian
		end

	set_myanmar is
		do
			value := g_unicode_script_myanmar
		end

	set_ogham is
		do
			value := g_unicode_script_ogham
		end

	set_old_italic is
		do
			value := g_unicode_script_old_italic
		end

	set_oriya is
		do
			value := g_unicode_script_oriya
		end

	set_runic is
		do
			value := g_unicode_script_runic
		end

	set_sinhala is
		do
			value := g_unicode_script_sinhala
		end

	set_syriac is
		do
			value := g_unicode_script_syriac
		end

	set_tamil is
		do
			value := g_unicode_script_tamil
		end

	set_telugu is
		do
			value := g_unicode_script_telugu
		end

	set_thaana is
		do
			value := g_unicode_script_thaana
		end

	set_thai is
		do
			value := g_unicode_script_thai
		end

	set_tibetan is
		do
			value := g_unicode_script_tibetan
		end

	set_canadian_aboriginal is
		do
			value := g_unicode_script_canadian_aboriginal
		end

	set_yi is
		do
			value := g_unicode_script_yi
		end

	set_tagalog is
		do
			value := g_unicode_script_tagalog
		end

	set_hanunoo is
		do
			value := g_unicode_script_hanunoo
		end

	set_buhid is
		do
			value := g_unicode_script_buhid
		end

	set_tagbanwa is
		do
			value := g_unicode_script_tagbanwa
		end

	set_braille is
		do
			value := g_unicode_script_braille
		end

	set_cypriot is
		do
			value := g_unicode_script_cypriot
		end

	set_limbu is
		do
			value := g_unicode_script_limbu
		end

	set_osmanya is
		do
			value := g_unicode_script_osmanya
		end

	set_shavian is
		do
			value := g_unicode_script_shavian
		end

	set_linear_b is
		do
			value := g_unicode_script_linear_b
		end

	set_tai_le is
		do
			value := g_unicode_script_tai_le
		end

	set_ugaritic is
		do
			value := g_unicode_script_ugaritic
		end

	set_new_tai_lue is
		do
			value := g_unicode_script_new_tai_lue
		end

	set_buginese is
		do
			value := g_unicode_script_buginese
		end

	set_glagolitic is
		do
			value := g_unicode_script_glagolitic
		end

	set_tifinagh is
		do
			value := g_unicode_script_tifinagh
		end

	set_syloti_nagri is
		do
			value := g_unicode_script_syloti_nagri
		end

	set_old_persian is
		do
			value := g_unicode_script_old_persian
		end

	set_kharoshthi is
		do
			value := g_unicode_script_kharoshthi
		end

	set_unknown is
		do
			value := g_unicode_script_unknown
		end

	set_balinese is
		do
			value := g_unicode_script_balinese
		end

	set_cuneiform is
		do
			value := g_unicode_script_cuneiform
		end

	set_phoenician is
		do
			value := g_unicode_script_phoenician
		end

	set_phags_pa is
		do
			value := g_unicode_script_phags_pa
		end

	set_nko is
		do
			value := g_unicode_script_nko
		end

	set_kayah_li is
		do
			value := g_unicode_script_kayah_li
		end

	set_lepcha is
		do
			value := g_unicode_script_lepcha
		end

	set_rejang is
		do
			value := g_unicode_script_rejang
		end

	set_sundanese is
		do
			value := g_unicode_script_sundanese
		end

	set_saurashtra is
		do
			value := g_unicode_script_saurashtra
		end

	set_cham is
		do
			value := g_unicode_script_cham
		end

	set_ol_chiki is
		do
			value := g_unicode_script_ol_chiki
		end

	set_vai is
		do
			value := g_unicode_script_vai
		end

	set_carian is
		do
			value := g_unicode_script_carian
		end

	set_lycian is
		do
			value := g_unicode_script_lycian
		end

	set_lydian is
		do
			value := g_unicode_script_lydian
		end


feature {ANY} -- Queries
	is_invalid_code: BOOLEAN is
		do
			Result := (value=g_unicode_script_invalid_code)
		end

	is_common: BOOLEAN is
		do
			Result := (value=g_unicode_script_common)
		end

	is_inherited: BOOLEAN is
		do
			Result := (value=g_unicode_script_inherited)
		end

	is_arabic: BOOLEAN is
		do
			Result := (value=g_unicode_script_arabic)
		end

	is_armenian: BOOLEAN is
		do
			Result := (value=g_unicode_script_armenian)
		end

	is_bengali: BOOLEAN is
		do
			Result := (value=g_unicode_script_bengali)
		end

	is_bopomofo: BOOLEAN is
		do
			Result := (value=g_unicode_script_bopomofo)
		end

	is_cherokee: BOOLEAN is
		do
			Result := (value=g_unicode_script_cherokee)
		end

	is_coptic: BOOLEAN is
		do
			Result := (value=g_unicode_script_coptic)
		end

	is_cyrillic: BOOLEAN is
		do
			Result := (value=g_unicode_script_cyrillic)
		end

	is_deseret: BOOLEAN is
		do
			Result := (value=g_unicode_script_deseret)
		end

	is_devanagari: BOOLEAN is
		do
			Result := (value=g_unicode_script_devanagari)
		end

	is_ethiopic: BOOLEAN is
		do
			Result := (value=g_unicode_script_ethiopic)
		end

	is_georgian: BOOLEAN is
		do
			Result := (value=g_unicode_script_georgian)
		end

	is_gothic: BOOLEAN is
		do
			Result := (value=g_unicode_script_gothic)
		end

	is_greek: BOOLEAN is
		do
			Result := (value=g_unicode_script_greek)
		end

	is_gujarati: BOOLEAN is
		do
			Result := (value=g_unicode_script_gujarati)
		end

	is_gurmukhi: BOOLEAN is
		do
			Result := (value=g_unicode_script_gurmukhi)
		end

	is_han: BOOLEAN is
		do
			Result := (value=g_unicode_script_han)
		end

	is_hangul: BOOLEAN is
		do
			Result := (value=g_unicode_script_hangul)
		end

	is_hebrew: BOOLEAN is
		do
			Result := (value=g_unicode_script_hebrew)
		end

	is_hiragana: BOOLEAN is
		do
			Result := (value=g_unicode_script_hiragana)
		end

	is_kannada: BOOLEAN is
		do
			Result := (value=g_unicode_script_kannada)
		end

	is_katakana: BOOLEAN is
		do
			Result := (value=g_unicode_script_katakana)
		end

	is_khmer: BOOLEAN is
		do
			Result := (value=g_unicode_script_khmer)
		end

	is_lao: BOOLEAN is
		do
			Result := (value=g_unicode_script_lao)
		end

	is_latin: BOOLEAN is
		do
			Result := (value=g_unicode_script_latin)
		end

	is_malayalam: BOOLEAN is
		do
			Result := (value=g_unicode_script_malayalam)
		end

	is_mongolian: BOOLEAN is
		do
			Result := (value=g_unicode_script_mongolian)
		end

	is_myanmar: BOOLEAN is
		do
			Result := (value=g_unicode_script_myanmar)
		end

	is_ogham: BOOLEAN is
		do
			Result := (value=g_unicode_script_ogham)
		end

	is_old_italic: BOOLEAN is
		do
			Result := (value=g_unicode_script_old_italic)
		end

	is_oriya: BOOLEAN is
		do
			Result := (value=g_unicode_script_oriya)
		end

	is_runic: BOOLEAN is
		do
			Result := (value=g_unicode_script_runic)
		end

	is_sinhala: BOOLEAN is
		do
			Result := (value=g_unicode_script_sinhala)
		end

	is_syriac: BOOLEAN is
		do
			Result := (value=g_unicode_script_syriac)
		end

	is_tamil: BOOLEAN is
		do
			Result := (value=g_unicode_script_tamil)
		end

	is_telugu: BOOLEAN is
		do
			Result := (value=g_unicode_script_telugu)
		end

	is_thaana: BOOLEAN is
		do
			Result := (value=g_unicode_script_thaana)
		end

	is_thai: BOOLEAN is
		do
			Result := (value=g_unicode_script_thai)
		end

	is_tibetan: BOOLEAN is
		do
			Result := (value=g_unicode_script_tibetan)
		end

	is_canadian_aboriginal: BOOLEAN is
		do
			Result := (value=g_unicode_script_canadian_aboriginal)
		end

	is_yi: BOOLEAN is
		do
			Result := (value=g_unicode_script_yi)
		end

	is_tagalog: BOOLEAN is
		do
			Result := (value=g_unicode_script_tagalog)
		end

	is_hanunoo: BOOLEAN is
		do
			Result := (value=g_unicode_script_hanunoo)
		end

	is_buhid: BOOLEAN is
		do
			Result := (value=g_unicode_script_buhid)
		end

	is_tagbanwa: BOOLEAN is
		do
			Result := (value=g_unicode_script_tagbanwa)
		end

	is_braille: BOOLEAN is
		do
			Result := (value=g_unicode_script_braille)
		end

	is_cypriot: BOOLEAN is
		do
			Result := (value=g_unicode_script_cypriot)
		end

	is_limbu: BOOLEAN is
		do
			Result := (value=g_unicode_script_limbu)
		end

	is_osmanya: BOOLEAN is
		do
			Result := (value=g_unicode_script_osmanya)
		end

	is_shavian: BOOLEAN is
		do
			Result := (value=g_unicode_script_shavian)
		end

	is_linear_b: BOOLEAN is
		do
			Result := (value=g_unicode_script_linear_b)
		end

	is_tai_le: BOOLEAN is
		do
			Result := (value=g_unicode_script_tai_le)
		end

	is_ugaritic: BOOLEAN is
		do
			Result := (value=g_unicode_script_ugaritic)
		end

	is_new_tai_lue: BOOLEAN is
		do
			Result := (value=g_unicode_script_new_tai_lue)
		end

	is_buginese: BOOLEAN is
		do
			Result := (value=g_unicode_script_buginese)
		end

	is_glagolitic: BOOLEAN is
		do
			Result := (value=g_unicode_script_glagolitic)
		end

	is_tifinagh: BOOLEAN is
		do
			Result := (value=g_unicode_script_tifinagh)
		end

	is_syloti_nagri: BOOLEAN is
		do
			Result := (value=g_unicode_script_syloti_nagri)
		end

	is_old_persian: BOOLEAN is
		do
			Result := (value=g_unicode_script_old_persian)
		end

	is_kharoshthi: BOOLEAN is
		do
			Result := (value=g_unicode_script_kharoshthi)
		end

	is_unknown: BOOLEAN is
		do
			Result := (value=g_unicode_script_unknown)
		end

	is_balinese: BOOLEAN is
		do
			Result := (value=g_unicode_script_balinese)
		end

	is_cuneiform: BOOLEAN is
		do
			Result := (value=g_unicode_script_cuneiform)
		end

	is_phoenician: BOOLEAN is
		do
			Result := (value=g_unicode_script_phoenician)
		end

	is_phags_pa: BOOLEAN is
		do
			Result := (value=g_unicode_script_phags_pa)
		end

	is_nko: BOOLEAN is
		do
			Result := (value=g_unicode_script_nko)
		end

	is_kayah_li: BOOLEAN is
		do
			Result := (value=g_unicode_script_kayah_li)
		end

	is_lepcha: BOOLEAN is
		do
			Result := (value=g_unicode_script_lepcha)
		end

	is_rejang: BOOLEAN is
		do
			Result := (value=g_unicode_script_rejang)
		end

	is_sundanese: BOOLEAN is
		do
			Result := (value=g_unicode_script_sundanese)
		end

	is_saurashtra: BOOLEAN is
		do
			Result := (value=g_unicode_script_saurashtra)
		end

	is_cham: BOOLEAN is
		do
			Result := (value=g_unicode_script_cham)
		end

	is_ol_chiki: BOOLEAN is
		do
			Result := (value=g_unicode_script_ol_chiki)
		end

	is_vai: BOOLEAN is
		do
			Result := (value=g_unicode_script_vai)
		end

	is_carian: BOOLEAN is
		do
			Result := (value=g_unicode_script_carian)
		end

	is_lycian: BOOLEAN is
		do
			Result := (value=g_unicode_script_lycian)
		end

	is_lydian: BOOLEAN is
		do
			Result := (value=g_unicode_script_lydian)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unicode_script_invalid_code: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_INVALID_CODE"
		end

	g_unicode_script_common: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_COMMON"
		end

	g_unicode_script_inherited: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_INHERITED"
		end

	g_unicode_script_arabic: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_ARABIC"
		end

	g_unicode_script_armenian: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_ARMENIAN"
		end

	g_unicode_script_bengali: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BENGALI"
		end

	g_unicode_script_bopomofo: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BOPOMOFO"
		end

	g_unicode_script_cherokee: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CHEROKEE"
		end

	g_unicode_script_coptic: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_COPTIC"
		end

	g_unicode_script_cyrillic: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CYRILLIC"
		end

	g_unicode_script_deseret: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_DESERET"
		end

	g_unicode_script_devanagari: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_DEVANAGARI"
		end

	g_unicode_script_ethiopic: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_ETHIOPIC"
		end

	g_unicode_script_georgian: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GEORGIAN"
		end

	g_unicode_script_gothic: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GOTHIC"
		end

	g_unicode_script_greek: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GREEK"
		end

	g_unicode_script_gujarati: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GUJARATI"
		end

	g_unicode_script_gurmukhi: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GURMUKHI"
		end

	g_unicode_script_han: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_HAN"
		end

	g_unicode_script_hangul: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_HANGUL"
		end

	g_unicode_script_hebrew: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_HEBREW"
		end

	g_unicode_script_hiragana: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_HIRAGANA"
		end

	g_unicode_script_kannada: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_KANNADA"
		end

	g_unicode_script_katakana: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_KATAKANA"
		end

	g_unicode_script_khmer: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_KHMER"
		end

	g_unicode_script_lao: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LAO"
		end

	g_unicode_script_latin: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LATIN"
		end

	g_unicode_script_malayalam: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_MALAYALAM"
		end

	g_unicode_script_mongolian: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_MONGOLIAN"
		end

	g_unicode_script_myanmar: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_MYANMAR"
		end

	g_unicode_script_ogham: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_OGHAM"
		end

	g_unicode_script_old_italic: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_OLD_ITALIC"
		end

	g_unicode_script_oriya: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_ORIYA"
		end

	g_unicode_script_runic: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_RUNIC"
		end

	g_unicode_script_sinhala: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SINHALA"
		end

	g_unicode_script_syriac: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SYRIAC"
		end

	g_unicode_script_tamil: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TAMIL"
		end

	g_unicode_script_telugu: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TELUGU"
		end

	g_unicode_script_thaana: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_THAANA"
		end

	g_unicode_script_thai: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_THAI"
		end

	g_unicode_script_tibetan: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TIBETAN"
		end

	g_unicode_script_canadian_aboriginal: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CANADIAN_ABORIGINAL"
		end

	g_unicode_script_yi: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_YI"
		end

	g_unicode_script_tagalog: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TAGALOG"
		end

	g_unicode_script_hanunoo: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_HANUNOO"
		end

	g_unicode_script_buhid: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BUHID"
		end

	g_unicode_script_tagbanwa: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TAGBANWA"
		end

	g_unicode_script_braille: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BRAILLE"
		end

	g_unicode_script_cypriot: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CYPRIOT"
		end

	g_unicode_script_limbu: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LIMBU"
		end

	g_unicode_script_osmanya: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_OSMANYA"
		end

	g_unicode_script_shavian: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SHAVIAN"
		end

	g_unicode_script_linear_b: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LINEAR_B"
		end

	g_unicode_script_tai_le: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TAI_LE"
		end

	g_unicode_script_ugaritic: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_UGARITIC"
		end

	g_unicode_script_new_tai_lue: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_NEW_TAI_LUE"
		end

	g_unicode_script_buginese: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BUGINESE"
		end

	g_unicode_script_glagolitic: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GLAGOLITIC"
		end

	g_unicode_script_tifinagh: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TIFINAGH"
		end

	g_unicode_script_syloti_nagri: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SYLOTI_NAGRI"
		end

	g_unicode_script_old_persian: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_OLD_PERSIAN"
		end

	g_unicode_script_kharoshthi: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_KHAROSHTHI"
		end

	g_unicode_script_unknown: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_UNKNOWN"
		end

	g_unicode_script_balinese: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BALINESE"
		end

	g_unicode_script_cuneiform: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CUNEIFORM"
		end

	g_unicode_script_phoenician: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_PHOENICIAN"
		end

	g_unicode_script_phags_pa: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_PHAGS_PA"
		end

	g_unicode_script_nko: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_NKO"
		end

	g_unicode_script_kayah_li: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_KAYAH_LI"
		end

	g_unicode_script_lepcha: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LEPCHA"
		end

	g_unicode_script_rejang: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_REJANG"
		end

	g_unicode_script_sundanese: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SUNDANESE"
		end

	g_unicode_script_saurashtra: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SAURASHTRA"
		end

	g_unicode_script_cham: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CHAM"
		end

	g_unicode_script_ol_chiki: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_OL_CHIKI"
		end

	g_unicode_script_vai: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_VAI"
		end

	g_unicode_script_carian: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CARIAN"
		end

	g_unicode_script_lycian: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LYCIAN"
		end

	g_unicode_script_lydian: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LYDIAN"
		end


end

