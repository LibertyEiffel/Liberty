-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_UNICODE_SCRIPT
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
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
	default_create, set_invalid_code
		do
			value := g_unicode_script_invalid_code
		end

	set_common
		do
			value := g_unicode_script_common
		end

	set_inherited
		do
			value := g_unicode_script_inherited
		end

	set_arabic
		do
			value := g_unicode_script_arabic
		end

	set_armenian
		do
			value := g_unicode_script_armenian
		end

	set_bengali
		do
			value := g_unicode_script_bengali
		end

	set_bopomofo
		do
			value := g_unicode_script_bopomofo
		end

	set_cherokee
		do
			value := g_unicode_script_cherokee
		end

	set_coptic
		do
			value := g_unicode_script_coptic
		end

	set_cyrillic
		do
			value := g_unicode_script_cyrillic
		end

	set_deseret
		do
			value := g_unicode_script_deseret
		end

	set_devanagari
		do
			value := g_unicode_script_devanagari
		end

	set_ethiopic
		do
			value := g_unicode_script_ethiopic
		end

	set_georgian
		do
			value := g_unicode_script_georgian
		end

	set_gothic
		do
			value := g_unicode_script_gothic
		end

	set_greek
		do
			value := g_unicode_script_greek
		end

	set_gujarati
		do
			value := g_unicode_script_gujarati
		end

	set_gurmukhi
		do
			value := g_unicode_script_gurmukhi
		end

	set_han
		do
			value := g_unicode_script_han
		end

	set_hangul
		do
			value := g_unicode_script_hangul
		end

	set_hebrew
		do
			value := g_unicode_script_hebrew
		end

	set_hiragana
		do
			value := g_unicode_script_hiragana
		end

	set_kannada
		do
			value := g_unicode_script_kannada
		end

	set_katakana
		do
			value := g_unicode_script_katakana
		end

	set_khmer
		do
			value := g_unicode_script_khmer
		end

	set_lao
		do
			value := g_unicode_script_lao
		end

	set_latin
		do
			value := g_unicode_script_latin
		end

	set_malayalam
		do
			value := g_unicode_script_malayalam
		end

	set_mongolian
		do
			value := g_unicode_script_mongolian
		end

	set_myanmar
		do
			value := g_unicode_script_myanmar
		end

	set_ogham
		do
			value := g_unicode_script_ogham
		end

	set_old_italic
		do
			value := g_unicode_script_old_italic
		end

	set_oriya
		do
			value := g_unicode_script_oriya
		end

	set_runic
		do
			value := g_unicode_script_runic
		end

	set_sinhala
		do
			value := g_unicode_script_sinhala
		end

	set_syriac
		do
			value := g_unicode_script_syriac
		end

	set_tamil
		do
			value := g_unicode_script_tamil
		end

	set_telugu
		do
			value := g_unicode_script_telugu
		end

	set_thaana
		do
			value := g_unicode_script_thaana
		end

	set_thai
		do
			value := g_unicode_script_thai
		end

	set_tibetan
		do
			value := g_unicode_script_tibetan
		end

	set_canadian_aboriginal
		do
			value := g_unicode_script_canadian_aboriginal
		end

	set_yi
		do
			value := g_unicode_script_yi
		end

	set_tagalog
		do
			value := g_unicode_script_tagalog
		end

	set_hanunoo
		do
			value := g_unicode_script_hanunoo
		end

	set_buhid
		do
			value := g_unicode_script_buhid
		end

	set_tagbanwa
		do
			value := g_unicode_script_tagbanwa
		end

	set_braille
		do
			value := g_unicode_script_braille
		end

	set_cypriot
		do
			value := g_unicode_script_cypriot
		end

	set_limbu
		do
			value := g_unicode_script_limbu
		end

	set_osmanya
		do
			value := g_unicode_script_osmanya
		end

	set_shavian
		do
			value := g_unicode_script_shavian
		end

	set_linear_b
		do
			value := g_unicode_script_linear_b
		end

	set_tai_le
		do
			value := g_unicode_script_tai_le
		end

	set_ugaritic
		do
			value := g_unicode_script_ugaritic
		end

	set_new_tai_lue
		do
			value := g_unicode_script_new_tai_lue
		end

	set_buginese
		do
			value := g_unicode_script_buginese
		end

	set_glagolitic
		do
			value := g_unicode_script_glagolitic
		end

	set_tifinagh
		do
			value := g_unicode_script_tifinagh
		end

	set_syloti_nagri
		do
			value := g_unicode_script_syloti_nagri
		end

	set_old_persian
		do
			value := g_unicode_script_old_persian
		end

	set_kharoshthi
		do
			value := g_unicode_script_kharoshthi
		end

	set_unknown
		do
			value := g_unicode_script_unknown
		end

	set_balinese
		do
			value := g_unicode_script_balinese
		end

	set_cuneiform
		do
			value := g_unicode_script_cuneiform
		end

	set_phoenician
		do
			value := g_unicode_script_phoenician
		end

	set_phags_pa
		do
			value := g_unicode_script_phags_pa
		end

	set_nko
		do
			value := g_unicode_script_nko
		end

	set_kayah_li
		do
			value := g_unicode_script_kayah_li
		end

	set_lepcha
		do
			value := g_unicode_script_lepcha
		end

	set_rejang
		do
			value := g_unicode_script_rejang
		end

	set_sundanese
		do
			value := g_unicode_script_sundanese
		end

	set_saurashtra
		do
			value := g_unicode_script_saurashtra
		end

	set_cham
		do
			value := g_unicode_script_cham
		end

	set_ol_chiki
		do
			value := g_unicode_script_ol_chiki
		end

	set_vai
		do
			value := g_unicode_script_vai
		end

	set_carian
		do
			value := g_unicode_script_carian
		end

	set_lycian
		do
			value := g_unicode_script_lycian
		end

	set_lydian
		do
			value := g_unicode_script_lydian
		end


feature {ANY} -- Queries
	is_invalid_code: BOOLEAN
		do
			Result := (value=g_unicode_script_invalid_code)
		end

	is_common: BOOLEAN
		do
			Result := (value=g_unicode_script_common)
		end

	is_inherited: BOOLEAN
		do
			Result := (value=g_unicode_script_inherited)
		end

	is_arabic: BOOLEAN
		do
			Result := (value=g_unicode_script_arabic)
		end

	is_armenian: BOOLEAN
		do
			Result := (value=g_unicode_script_armenian)
		end

	is_bengali: BOOLEAN
		do
			Result := (value=g_unicode_script_bengali)
		end

	is_bopomofo: BOOLEAN
		do
			Result := (value=g_unicode_script_bopomofo)
		end

	is_cherokee: BOOLEAN
		do
			Result := (value=g_unicode_script_cherokee)
		end

	is_coptic: BOOLEAN
		do
			Result := (value=g_unicode_script_coptic)
		end

	is_cyrillic: BOOLEAN
		do
			Result := (value=g_unicode_script_cyrillic)
		end

	is_deseret: BOOLEAN
		do
			Result := (value=g_unicode_script_deseret)
		end

	is_devanagari: BOOLEAN
		do
			Result := (value=g_unicode_script_devanagari)
		end

	is_ethiopic: BOOLEAN
		do
			Result := (value=g_unicode_script_ethiopic)
		end

	is_georgian: BOOLEAN
		do
			Result := (value=g_unicode_script_georgian)
		end

	is_gothic: BOOLEAN
		do
			Result := (value=g_unicode_script_gothic)
		end

	is_greek: BOOLEAN
		do
			Result := (value=g_unicode_script_greek)
		end

	is_gujarati: BOOLEAN
		do
			Result := (value=g_unicode_script_gujarati)
		end

	is_gurmukhi: BOOLEAN
		do
			Result := (value=g_unicode_script_gurmukhi)
		end

	is_han: BOOLEAN
		do
			Result := (value=g_unicode_script_han)
		end

	is_hangul: BOOLEAN
		do
			Result := (value=g_unicode_script_hangul)
		end

	is_hebrew: BOOLEAN
		do
			Result := (value=g_unicode_script_hebrew)
		end

	is_hiragana: BOOLEAN
		do
			Result := (value=g_unicode_script_hiragana)
		end

	is_kannada: BOOLEAN
		do
			Result := (value=g_unicode_script_kannada)
		end

	is_katakana: BOOLEAN
		do
			Result := (value=g_unicode_script_katakana)
		end

	is_khmer: BOOLEAN
		do
			Result := (value=g_unicode_script_khmer)
		end

	is_lao: BOOLEAN
		do
			Result := (value=g_unicode_script_lao)
		end

	is_latin: BOOLEAN
		do
			Result := (value=g_unicode_script_latin)
		end

	is_malayalam: BOOLEAN
		do
			Result := (value=g_unicode_script_malayalam)
		end

	is_mongolian: BOOLEAN
		do
			Result := (value=g_unicode_script_mongolian)
		end

	is_myanmar: BOOLEAN
		do
			Result := (value=g_unicode_script_myanmar)
		end

	is_ogham: BOOLEAN
		do
			Result := (value=g_unicode_script_ogham)
		end

	is_old_italic: BOOLEAN
		do
			Result := (value=g_unicode_script_old_italic)
		end

	is_oriya: BOOLEAN
		do
			Result := (value=g_unicode_script_oriya)
		end

	is_runic: BOOLEAN
		do
			Result := (value=g_unicode_script_runic)
		end

	is_sinhala: BOOLEAN
		do
			Result := (value=g_unicode_script_sinhala)
		end

	is_syriac: BOOLEAN
		do
			Result := (value=g_unicode_script_syriac)
		end

	is_tamil: BOOLEAN
		do
			Result := (value=g_unicode_script_tamil)
		end

	is_telugu: BOOLEAN
		do
			Result := (value=g_unicode_script_telugu)
		end

	is_thaana: BOOLEAN
		do
			Result := (value=g_unicode_script_thaana)
		end

	is_thai: BOOLEAN
		do
			Result := (value=g_unicode_script_thai)
		end

	is_tibetan: BOOLEAN
		do
			Result := (value=g_unicode_script_tibetan)
		end

	is_canadian_aboriginal: BOOLEAN
		do
			Result := (value=g_unicode_script_canadian_aboriginal)
		end

	is_yi: BOOLEAN
		do
			Result := (value=g_unicode_script_yi)
		end

	is_tagalog: BOOLEAN
		do
			Result := (value=g_unicode_script_tagalog)
		end

	is_hanunoo: BOOLEAN
		do
			Result := (value=g_unicode_script_hanunoo)
		end

	is_buhid: BOOLEAN
		do
			Result := (value=g_unicode_script_buhid)
		end

	is_tagbanwa: BOOLEAN
		do
			Result := (value=g_unicode_script_tagbanwa)
		end

	is_braille: BOOLEAN
		do
			Result := (value=g_unicode_script_braille)
		end

	is_cypriot: BOOLEAN
		do
			Result := (value=g_unicode_script_cypriot)
		end

	is_limbu: BOOLEAN
		do
			Result := (value=g_unicode_script_limbu)
		end

	is_osmanya: BOOLEAN
		do
			Result := (value=g_unicode_script_osmanya)
		end

	is_shavian: BOOLEAN
		do
			Result := (value=g_unicode_script_shavian)
		end

	is_linear_b: BOOLEAN
		do
			Result := (value=g_unicode_script_linear_b)
		end

	is_tai_le: BOOLEAN
		do
			Result := (value=g_unicode_script_tai_le)
		end

	is_ugaritic: BOOLEAN
		do
			Result := (value=g_unicode_script_ugaritic)
		end

	is_new_tai_lue: BOOLEAN
		do
			Result := (value=g_unicode_script_new_tai_lue)
		end

	is_buginese: BOOLEAN
		do
			Result := (value=g_unicode_script_buginese)
		end

	is_glagolitic: BOOLEAN
		do
			Result := (value=g_unicode_script_glagolitic)
		end

	is_tifinagh: BOOLEAN
		do
			Result := (value=g_unicode_script_tifinagh)
		end

	is_syloti_nagri: BOOLEAN
		do
			Result := (value=g_unicode_script_syloti_nagri)
		end

	is_old_persian: BOOLEAN
		do
			Result := (value=g_unicode_script_old_persian)
		end

	is_kharoshthi: BOOLEAN
		do
			Result := (value=g_unicode_script_kharoshthi)
		end

	is_unknown: BOOLEAN
		do
			Result := (value=g_unicode_script_unknown)
		end

	is_balinese: BOOLEAN
		do
			Result := (value=g_unicode_script_balinese)
		end

	is_cuneiform: BOOLEAN
		do
			Result := (value=g_unicode_script_cuneiform)
		end

	is_phoenician: BOOLEAN
		do
			Result := (value=g_unicode_script_phoenician)
		end

	is_phags_pa: BOOLEAN
		do
			Result := (value=g_unicode_script_phags_pa)
		end

	is_nko: BOOLEAN
		do
			Result := (value=g_unicode_script_nko)
		end

	is_kayah_li: BOOLEAN
		do
			Result := (value=g_unicode_script_kayah_li)
		end

	is_lepcha: BOOLEAN
		do
			Result := (value=g_unicode_script_lepcha)
		end

	is_rejang: BOOLEAN
		do
			Result := (value=g_unicode_script_rejang)
		end

	is_sundanese: BOOLEAN
		do
			Result := (value=g_unicode_script_sundanese)
		end

	is_saurashtra: BOOLEAN
		do
			Result := (value=g_unicode_script_saurashtra)
		end

	is_cham: BOOLEAN
		do
			Result := (value=g_unicode_script_cham)
		end

	is_ol_chiki: BOOLEAN
		do
			Result := (value=g_unicode_script_ol_chiki)
		end

	is_vai: BOOLEAN
		do
			Result := (value=g_unicode_script_vai)
		end

	is_carian: BOOLEAN
		do
			Result := (value=g_unicode_script_carian)
		end

	is_lycian: BOOLEAN
		do
			Result := (value=g_unicode_script_lycian)
		end

	is_lydian: BOOLEAN
		do
			Result := (value=g_unicode_script_lydian)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unicode_script_invalid_code: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_INVALID_CODE"
		end

	g_unicode_script_common: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_COMMON"
		end

	g_unicode_script_inherited: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_INHERITED"
		end

	g_unicode_script_arabic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_ARABIC"
		end

	g_unicode_script_armenian: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_ARMENIAN"
		end

	g_unicode_script_bengali: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BENGALI"
		end

	g_unicode_script_bopomofo: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BOPOMOFO"
		end

	g_unicode_script_cherokee: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CHEROKEE"
		end

	g_unicode_script_coptic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_COPTIC"
		end

	g_unicode_script_cyrillic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CYRILLIC"
		end

	g_unicode_script_deseret: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_DESERET"
		end

	g_unicode_script_devanagari: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_DEVANAGARI"
		end

	g_unicode_script_ethiopic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_ETHIOPIC"
		end

	g_unicode_script_georgian: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GEORGIAN"
		end

	g_unicode_script_gothic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GOTHIC"
		end

	g_unicode_script_greek: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GREEK"
		end

	g_unicode_script_gujarati: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GUJARATI"
		end

	g_unicode_script_gurmukhi: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GURMUKHI"
		end

	g_unicode_script_han: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_HAN"
		end

	g_unicode_script_hangul: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_HANGUL"
		end

	g_unicode_script_hebrew: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_HEBREW"
		end

	g_unicode_script_hiragana: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_HIRAGANA"
		end

	g_unicode_script_kannada: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_KANNADA"
		end

	g_unicode_script_katakana: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_KATAKANA"
		end

	g_unicode_script_khmer: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_KHMER"
		end

	g_unicode_script_lao: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LAO"
		end

	g_unicode_script_latin: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LATIN"
		end

	g_unicode_script_malayalam: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_MALAYALAM"
		end

	g_unicode_script_mongolian: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_MONGOLIAN"
		end

	g_unicode_script_myanmar: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_MYANMAR"
		end

	g_unicode_script_ogham: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_OGHAM"
		end

	g_unicode_script_old_italic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_OLD_ITALIC"
		end

	g_unicode_script_oriya: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_ORIYA"
		end

	g_unicode_script_runic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_RUNIC"
		end

	g_unicode_script_sinhala: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SINHALA"
		end

	g_unicode_script_syriac: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SYRIAC"
		end

	g_unicode_script_tamil: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TAMIL"
		end

	g_unicode_script_telugu: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TELUGU"
		end

	g_unicode_script_thaana: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_THAANA"
		end

	g_unicode_script_thai: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_THAI"
		end

	g_unicode_script_tibetan: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TIBETAN"
		end

	g_unicode_script_canadian_aboriginal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CANADIAN_ABORIGINAL"
		end

	g_unicode_script_yi: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_YI"
		end

	g_unicode_script_tagalog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TAGALOG"
		end

	g_unicode_script_hanunoo: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_HANUNOO"
		end

	g_unicode_script_buhid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BUHID"
		end

	g_unicode_script_tagbanwa: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TAGBANWA"
		end

	g_unicode_script_braille: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BRAILLE"
		end

	g_unicode_script_cypriot: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CYPRIOT"
		end

	g_unicode_script_limbu: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LIMBU"
		end

	g_unicode_script_osmanya: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_OSMANYA"
		end

	g_unicode_script_shavian: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SHAVIAN"
		end

	g_unicode_script_linear_b: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LINEAR_B"
		end

	g_unicode_script_tai_le: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TAI_LE"
		end

	g_unicode_script_ugaritic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_UGARITIC"
		end

	g_unicode_script_new_tai_lue: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_NEW_TAI_LUE"
		end

	g_unicode_script_buginese: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BUGINESE"
		end

	g_unicode_script_glagolitic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_GLAGOLITIC"
		end

	g_unicode_script_tifinagh: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_TIFINAGH"
		end

	g_unicode_script_syloti_nagri: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SYLOTI_NAGRI"
		end

	g_unicode_script_old_persian: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_OLD_PERSIAN"
		end

	g_unicode_script_kharoshthi: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_KHAROSHTHI"
		end

	g_unicode_script_unknown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_UNKNOWN"
		end

	g_unicode_script_balinese: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_BALINESE"
		end

	g_unicode_script_cuneiform: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CUNEIFORM"
		end

	g_unicode_script_phoenician: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_PHOENICIAN"
		end

	g_unicode_script_phags_pa: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_PHAGS_PA"
		end

	g_unicode_script_nko: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_NKO"
		end

	g_unicode_script_kayah_li: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_KAYAH_LI"
		end

	g_unicode_script_lepcha: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LEPCHA"
		end

	g_unicode_script_rejang: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_REJANG"
		end

	g_unicode_script_sundanese: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SUNDANESE"
		end

	g_unicode_script_saurashtra: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_SAURASHTRA"
		end

	g_unicode_script_cham: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CHAM"
		end

	g_unicode_script_ol_chiki: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_OL_CHIKI"
		end

	g_unicode_script_vai: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_VAI"
		end

	g_unicode_script_carian: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_CARIAN"
		end

	g_unicode_script_lycian: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LYCIAN"
		end

	g_unicode_script_lydian: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SCRIPT_LYDIAN"
		end


end

