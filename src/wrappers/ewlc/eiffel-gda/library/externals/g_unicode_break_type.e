-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_UNICODE_BREAK_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_unicode_break_mandatory) or else 
				(a_value = g_unicode_break_carriage_return) or else 
				(a_value = g_unicode_break_line_feed) or else 
				(a_value = g_unicode_break_combining_mark) or else 
				(a_value = g_unicode_break_surrogate) or else 
				(a_value = g_unicode_break_zero_width_space) or else 
				(a_value = g_unicode_break_inseparable) or else 
				(a_value = g_unicode_break_non_breaking_glue) or else 
				(a_value = g_unicode_break_contingent) or else 
				(a_value = g_unicode_break_space) or else 
				(a_value = g_unicode_break_after) or else 
				(a_value = g_unicode_break_before) or else 
				(a_value = g_unicode_break_before_and_after) or else 
				(a_value = g_unicode_break_hyphen) or else 
				(a_value = g_unicode_break_non_starter) or else 
				(a_value = g_unicode_break_open_punctuation) or else 
				(a_value = g_unicode_break_close_punctuation) or else 
				(a_value = g_unicode_break_quotation) or else 
				(a_value = g_unicode_break_exclamation) or else 
				(a_value = g_unicode_break_ideographic) or else 
				(a_value = g_unicode_break_numeric) or else 
				(a_value = g_unicode_break_infix_separator) or else 
				(a_value = g_unicode_break_symbol) or else 
				(a_value = g_unicode_break_alphabetic) or else 
				(a_value = g_unicode_break_prefix) or else 
				(a_value = g_unicode_break_postfix) or else 
				(a_value = g_unicode_break_complex_context) or else 
				(a_value = g_unicode_break_ambiguous) or else 
				(a_value = g_unicode_break_unknown) or else 
				(a_value = g_unicode_break_next_line) or else 
				(a_value = g_unicode_break_word_joiner) or else 
				(a_value = g_unicode_break_hangul_l_jamo) or else 
				(a_value = g_unicode_break_hangul_v_jamo) or else 
				(a_value = g_unicode_break_hangul_t_jamo) or else 
				(a_value = g_unicode_break_hangul_lv_syllable) or else 
				(a_value = g_unicode_break_hangul_lvt_syllable))
		end


feature {ANY} -- Setters
	default_create, set_mandatory
		do
			value := g_unicode_break_mandatory
		end

	set_carriage_return
		do
			value := g_unicode_break_carriage_return
		end

	set_line_feed
		do
			value := g_unicode_break_line_feed
		end

	set_combining_mark
		do
			value := g_unicode_break_combining_mark
		end

	set_surrogate
		do
			value := g_unicode_break_surrogate
		end

	set_zero_width_space
		do
			value := g_unicode_break_zero_width_space
		end

	set_inseparable
		do
			value := g_unicode_break_inseparable
		end

	set_non_breaking_glue
		do
			value := g_unicode_break_non_breaking_glue
		end

	set_contingent
		do
			value := g_unicode_break_contingent
		end

	set_space
		do
			value := g_unicode_break_space
		end

	set_after
		do
			value := g_unicode_break_after
		end

	set_before
		do
			value := g_unicode_break_before
		end

	set_before_and_after
		do
			value := g_unicode_break_before_and_after
		end

	set_hyphen
		do
			value := g_unicode_break_hyphen
		end

	set_non_starter
		do
			value := g_unicode_break_non_starter
		end

	set_open_punctuation
		do
			value := g_unicode_break_open_punctuation
		end

	set_close_punctuation
		do
			value := g_unicode_break_close_punctuation
		end

	set_quotation
		do
			value := g_unicode_break_quotation
		end

	set_exclamation
		do
			value := g_unicode_break_exclamation
		end

	set_ideographic
		do
			value := g_unicode_break_ideographic
		end

	set_numeric
		do
			value := g_unicode_break_numeric
		end

	set_infix_separator
		do
			value := g_unicode_break_infix_separator
		end

	set_symbol
		do
			value := g_unicode_break_symbol
		end

	set_alphabetic
		do
			value := g_unicode_break_alphabetic
		end

	set_prefix
		do
			value := g_unicode_break_prefix
		end

	set_postfix
		do
			value := g_unicode_break_postfix
		end

	set_complex_context
		do
			value := g_unicode_break_complex_context
		end

	set_ambiguous
		do
			value := g_unicode_break_ambiguous
		end

	set_unknown
		do
			value := g_unicode_break_unknown
		end

	set_next_line
		do
			value := g_unicode_break_next_line
		end

	set_word_joiner
		do
			value := g_unicode_break_word_joiner
		end

	set_hangul_l_jamo
		do
			value := g_unicode_break_hangul_l_jamo
		end

	set_hangul_v_jamo
		do
			value := g_unicode_break_hangul_v_jamo
		end

	set_hangul_t_jamo
		do
			value := g_unicode_break_hangul_t_jamo
		end

	set_hangul_lv_syllable
		do
			value := g_unicode_break_hangul_lv_syllable
		end

	set_hangul_lvt_syllable
		do
			value := g_unicode_break_hangul_lvt_syllable
		end


feature {ANY} -- Queries
	is_mandatory: BOOLEAN
		do
			Result := (value=g_unicode_break_mandatory)
		end

	is_carriage_return: BOOLEAN
		do
			Result := (value=g_unicode_break_carriage_return)
		end

	is_line_feed: BOOLEAN
		do
			Result := (value=g_unicode_break_line_feed)
		end

	is_combining_mark: BOOLEAN
		do
			Result := (value=g_unicode_break_combining_mark)
		end

	is_surrogate: BOOLEAN
		do
			Result := (value=g_unicode_break_surrogate)
		end

	is_zero_width_space: BOOLEAN
		do
			Result := (value=g_unicode_break_zero_width_space)
		end

	is_inseparable: BOOLEAN
		do
			Result := (value=g_unicode_break_inseparable)
		end

	is_non_breaking_glue: BOOLEAN
		do
			Result := (value=g_unicode_break_non_breaking_glue)
		end

	is_contingent: BOOLEAN
		do
			Result := (value=g_unicode_break_contingent)
		end

	is_space: BOOLEAN
		do
			Result := (value=g_unicode_break_space)
		end

	is_after: BOOLEAN
		do
			Result := (value=g_unicode_break_after)
		end

	is_before: BOOLEAN
		do
			Result := (value=g_unicode_break_before)
		end

	is_before_and_after: BOOLEAN
		do
			Result := (value=g_unicode_break_before_and_after)
		end

	is_hyphen: BOOLEAN
		do
			Result := (value=g_unicode_break_hyphen)
		end

	is_non_starter: BOOLEAN
		do
			Result := (value=g_unicode_break_non_starter)
		end

	is_open_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_break_open_punctuation)
		end

	is_close_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_break_close_punctuation)
		end

	is_quotation: BOOLEAN
		do
			Result := (value=g_unicode_break_quotation)
		end

	is_exclamation: BOOLEAN
		do
			Result := (value=g_unicode_break_exclamation)
		end

	is_ideographic: BOOLEAN
		do
			Result := (value=g_unicode_break_ideographic)
		end

	is_numeric: BOOLEAN
		do
			Result := (value=g_unicode_break_numeric)
		end

	is_infix_separator: BOOLEAN
		do
			Result := (value=g_unicode_break_infix_separator)
		end

	is_symbol: BOOLEAN
		do
			Result := (value=g_unicode_break_symbol)
		end

	is_alphabetic: BOOLEAN
		do
			Result := (value=g_unicode_break_alphabetic)
		end

	is_prefix: BOOLEAN
		do
			Result := (value=g_unicode_break_prefix)
		end

	is_postfix: BOOLEAN
		do
			Result := (value=g_unicode_break_postfix)
		end

	is_complex_context: BOOLEAN
		do
			Result := (value=g_unicode_break_complex_context)
		end

	is_ambiguous: BOOLEAN
		do
			Result := (value=g_unicode_break_ambiguous)
		end

	is_unknown: BOOLEAN
		do
			Result := (value=g_unicode_break_unknown)
		end

	is_next_line: BOOLEAN
		do
			Result := (value=g_unicode_break_next_line)
		end

	is_word_joiner: BOOLEAN
		do
			Result := (value=g_unicode_break_word_joiner)
		end

	is_hangul_l_jamo: BOOLEAN
		do
			Result := (value=g_unicode_break_hangul_l_jamo)
		end

	is_hangul_v_jamo: BOOLEAN
		do
			Result := (value=g_unicode_break_hangul_v_jamo)
		end

	is_hangul_t_jamo: BOOLEAN
		do
			Result := (value=g_unicode_break_hangul_t_jamo)
		end

	is_hangul_lv_syllable: BOOLEAN
		do
			Result := (value=g_unicode_break_hangul_lv_syllable)
		end

	is_hangul_lvt_syllable: BOOLEAN
		do
			Result := (value=g_unicode_break_hangul_lvt_syllable)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unicode_break_mandatory: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_MANDATORY"
		end

	g_unicode_break_carriage_return: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_CARRIAGE_RETURN"
		end

	g_unicode_break_line_feed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_LINE_FEED"
		end

	g_unicode_break_combining_mark: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_COMBINING_MARK"
		end

	g_unicode_break_surrogate: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_SURROGATE"
		end

	g_unicode_break_zero_width_space: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_ZERO_WIDTH_SPACE"
		end

	g_unicode_break_inseparable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_INSEPARABLE"
		end

	g_unicode_break_non_breaking_glue: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_NON_BREAKING_GLUE"
		end

	g_unicode_break_contingent: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_CONTINGENT"
		end

	g_unicode_break_space: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_SPACE"
		end

	g_unicode_break_after: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_AFTER"
		end

	g_unicode_break_before: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_BEFORE"
		end

	g_unicode_break_before_and_after: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_BEFORE_AND_AFTER"
		end

	g_unicode_break_hyphen: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_HYPHEN"
		end

	g_unicode_break_non_starter: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_NON_STARTER"
		end

	g_unicode_break_open_punctuation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_OPEN_PUNCTUATION"
		end

	g_unicode_break_close_punctuation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_CLOSE_PUNCTUATION"
		end

	g_unicode_break_quotation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_QUOTATION"
		end

	g_unicode_break_exclamation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_EXCLAMATION"
		end

	g_unicode_break_ideographic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_IDEOGRAPHIC"
		end

	g_unicode_break_numeric: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_NUMERIC"
		end

	g_unicode_break_infix_separator: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_INFIX_SEPARATOR"
		end

	g_unicode_break_symbol: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_SYMBOL"
		end

	g_unicode_break_alphabetic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_ALPHABETIC"
		end

	g_unicode_break_prefix: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_PREFIX"
		end

	g_unicode_break_postfix: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_POSTFIX"
		end

	g_unicode_break_complex_context: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_COMPLEX_CONTEXT"
		end

	g_unicode_break_ambiguous: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_AMBIGUOUS"
		end

	g_unicode_break_unknown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_UNKNOWN"
		end

	g_unicode_break_next_line: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_NEXT_LINE"
		end

	g_unicode_break_word_joiner: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_WORD_JOINER"
		end

	g_unicode_break_hangul_l_jamo: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_HANGUL_L_JAMO"
		end

	g_unicode_break_hangul_v_jamo: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_HANGUL_V_JAMO"
		end

	g_unicode_break_hangul_t_jamo: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_HANGUL_T_JAMO"
		end

	g_unicode_break_hangul_lv_syllable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_HANGUL_LV_SYLLABLE"
		end

	g_unicode_break_hangul_lvt_syllable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE"
		end


end

