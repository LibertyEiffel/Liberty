-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODE_BREAK_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_unicode_break_after_low_level)  or else
				(a_value = g_unicode_break_alphabetic_low_level)  or else
				(a_value = g_unicode_break_ambiguous_low_level)  or else
				(a_value = g_unicode_break_before_low_level)  or else
				(a_value = g_unicode_break_before_and_after_low_level)  or else
				(a_value = g_unicode_break_carriage_return_low_level)  or else
				(a_value = g_unicode_break_close_paranthesis_low_level)  or else
				(a_value = g_unicode_break_close_punctuation_low_level)  or else
				(a_value = g_unicode_break_combining_mark_low_level)  or else
				(a_value = g_unicode_break_complex_context_low_level)  or else
				(a_value = g_unicode_break_conditional_japanese_starter_low_level)  or else
				(a_value = g_unicode_break_contingent_low_level)  or else
				(a_value = g_unicode_break_exclamation_low_level)  or else
				(a_value = g_unicode_break_hangul_l_jamo_low_level)  or else
				(a_value = g_unicode_break_hangul_lv_syllable_low_level)  or else
				(a_value = g_unicode_break_hangul_lvt_syllable_low_level)  or else
				(a_value = g_unicode_break_hangul_t_jamo_low_level)  or else
				(a_value = g_unicode_break_hangul_v_jamo_low_level)  or else
				(a_value = g_unicode_break_hebrew_letter_low_level)  or else
				(a_value = g_unicode_break_hyphen_low_level)  or else
				(a_value = g_unicode_break_ideographic_low_level)  or else
				(a_value = g_unicode_break_infix_separator_low_level)  or else
				(a_value = g_unicode_break_inseparable_low_level)  or else
				(a_value = g_unicode_break_line_feed_low_level)  or else
				(a_value = g_unicode_break_mandatory_low_level)  or else
				(a_value = g_unicode_break_next_line_low_level)  or else
				(a_value = g_unicode_break_non_breaking_glue_low_level)  or else
				(a_value = g_unicode_break_non_starter_low_level)  or else
				(a_value = g_unicode_break_numeric_low_level)  or else
				(a_value = g_unicode_break_open_punctuation_low_level)  or else
				(a_value = g_unicode_break_postfix_low_level)  or else
				(a_value = g_unicode_break_prefix_low_level)  or else
				(a_value = g_unicode_break_quotation_low_level)  or else
				(a_value = g_unicode_break_space_low_level)  or else
				(a_value = g_unicode_break_surrogate_low_level)  or else
				(a_value = g_unicode_break_symbol_low_level)  or else
				(a_value = g_unicode_break_unknown_low_level)  or else
				(a_value = g_unicode_break_word_joiner_low_level)  or else
				(a_value = g_unicode_break_zero_width_space_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_unicode_break_after
		do
			value := g_unicode_break_after_low_level
		end

	set_g_unicode_break_alphabetic
		do
			value := g_unicode_break_alphabetic_low_level
		end

	set_g_unicode_break_ambiguous
		do
			value := g_unicode_break_ambiguous_low_level
		end

	set_g_unicode_break_before
		do
			value := g_unicode_break_before_low_level
		end

	set_g_unicode_break_before_and_after
		do
			value := g_unicode_break_before_and_after_low_level
		end

	set_g_unicode_break_carriage_return
		do
			value := g_unicode_break_carriage_return_low_level
		end

	set_g_unicode_break_close_paranthesis
		do
			value := g_unicode_break_close_paranthesis_low_level
		end

	set_g_unicode_break_close_punctuation
		do
			value := g_unicode_break_close_punctuation_low_level
		end

	set_g_unicode_break_combining_mark
		do
			value := g_unicode_break_combining_mark_low_level
		end

	set_g_unicode_break_complex_context
		do
			value := g_unicode_break_complex_context_low_level
		end

	set_g_unicode_break_conditional_japanese_starter
		do
			value := g_unicode_break_conditional_japanese_starter_low_level
		end

	set_g_unicode_break_contingent
		do
			value := g_unicode_break_contingent_low_level
		end

	set_g_unicode_break_exclamation
		do
			value := g_unicode_break_exclamation_low_level
		end

	set_g_unicode_break_hangul_l_jamo
		do
			value := g_unicode_break_hangul_l_jamo_low_level
		end

	set_g_unicode_break_hangul_lv_syllable
		do
			value := g_unicode_break_hangul_lv_syllable_low_level
		end

	set_g_unicode_break_hangul_lvt_syllable
		do
			value := g_unicode_break_hangul_lvt_syllable_low_level
		end

	set_g_unicode_break_hangul_t_jamo
		do
			value := g_unicode_break_hangul_t_jamo_low_level
		end

	set_g_unicode_break_hangul_v_jamo
		do
			value := g_unicode_break_hangul_v_jamo_low_level
		end

	set_g_unicode_break_hebrew_letter
		do
			value := g_unicode_break_hebrew_letter_low_level
		end

	set_g_unicode_break_hyphen
		do
			value := g_unicode_break_hyphen_low_level
		end

	set_g_unicode_break_ideographic
		do
			value := g_unicode_break_ideographic_low_level
		end

	set_g_unicode_break_infix_separator
		do
			value := g_unicode_break_infix_separator_low_level
		end

	set_g_unicode_break_inseparable
		do
			value := g_unicode_break_inseparable_low_level
		end

	set_g_unicode_break_line_feed
		do
			value := g_unicode_break_line_feed_low_level
		end

	set_g_unicode_break_mandatory
		do
			value := g_unicode_break_mandatory_low_level
		end

	set_g_unicode_break_next_line
		do
			value := g_unicode_break_next_line_low_level
		end

	set_g_unicode_break_non_breaking_glue
		do
			value := g_unicode_break_non_breaking_glue_low_level
		end

	set_g_unicode_break_non_starter
		do
			value := g_unicode_break_non_starter_low_level
		end

	set_g_unicode_break_numeric
		do
			value := g_unicode_break_numeric_low_level
		end

	set_g_unicode_break_open_punctuation
		do
			value := g_unicode_break_open_punctuation_low_level
		end

	set_g_unicode_break_postfix
		do
			value := g_unicode_break_postfix_low_level
		end

	set_g_unicode_break_prefix
		do
			value := g_unicode_break_prefix_low_level
		end

	set_g_unicode_break_quotation
		do
			value := g_unicode_break_quotation_low_level
		end

	set_g_unicode_break_space
		do
			value := g_unicode_break_space_low_level
		end

	set_g_unicode_break_surrogate
		do
			value := g_unicode_break_surrogate_low_level
		end

	set_g_unicode_break_symbol
		do
			value := g_unicode_break_symbol_low_level
		end

	set_g_unicode_break_unknown
		do
			value := g_unicode_break_unknown_low_level
		end

	set_g_unicode_break_word_joiner
		do
			value := g_unicode_break_word_joiner_low_level
		end

	set_g_unicode_break_zero_width_space
		do
			value := g_unicode_break_zero_width_space_low_level
		end

feature {ANY} -- Queries
	is_g_unicode_break_after: BOOLEAN
		do
			Result := (value=g_unicode_break_after_low_level)
		end

	is_g_unicode_break_alphabetic: BOOLEAN
		do
			Result := (value=g_unicode_break_alphabetic_low_level)
		end

	is_g_unicode_break_ambiguous: BOOLEAN
		do
			Result := (value=g_unicode_break_ambiguous_low_level)
		end

	is_g_unicode_break_before: BOOLEAN
		do
			Result := (value=g_unicode_break_before_low_level)
		end

	is_g_unicode_break_before_and_after: BOOLEAN
		do
			Result := (value=g_unicode_break_before_and_after_low_level)
		end

	is_g_unicode_break_carriage_return: BOOLEAN
		do
			Result := (value=g_unicode_break_carriage_return_low_level)
		end

	is_g_unicode_break_close_paranthesis: BOOLEAN
		do
			Result := (value=g_unicode_break_close_paranthesis_low_level)
		end

	is_g_unicode_break_close_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_break_close_punctuation_low_level)
		end

	is_g_unicode_break_combining_mark: BOOLEAN
		do
			Result := (value=g_unicode_break_combining_mark_low_level)
		end

	is_g_unicode_break_complex_context: BOOLEAN
		do
			Result := (value=g_unicode_break_complex_context_low_level)
		end

	is_g_unicode_break_conditional_japanese_starter: BOOLEAN
		do
			Result := (value=g_unicode_break_conditional_japanese_starter_low_level)
		end

	is_g_unicode_break_contingent: BOOLEAN
		do
			Result := (value=g_unicode_break_contingent_low_level)
		end

	is_g_unicode_break_exclamation: BOOLEAN
		do
			Result := (value=g_unicode_break_exclamation_low_level)
		end

	is_g_unicode_break_hangul_l_jamo: BOOLEAN
		do
			Result := (value=g_unicode_break_hangul_l_jamo_low_level)
		end

	is_g_unicode_break_hangul_lv_syllable: BOOLEAN
		do
			Result := (value=g_unicode_break_hangul_lv_syllable_low_level)
		end

	is_g_unicode_break_hangul_lvt_syllable: BOOLEAN
		do
			Result := (value=g_unicode_break_hangul_lvt_syllable_low_level)
		end

	is_g_unicode_break_hangul_t_jamo: BOOLEAN
		do
			Result := (value=g_unicode_break_hangul_t_jamo_low_level)
		end

	is_g_unicode_break_hangul_v_jamo: BOOLEAN
		do
			Result := (value=g_unicode_break_hangul_v_jamo_low_level)
		end

	is_g_unicode_break_hebrew_letter: BOOLEAN
		do
			Result := (value=g_unicode_break_hebrew_letter_low_level)
		end

	is_g_unicode_break_hyphen: BOOLEAN
		do
			Result := (value=g_unicode_break_hyphen_low_level)
		end

	is_g_unicode_break_ideographic: BOOLEAN
		do
			Result := (value=g_unicode_break_ideographic_low_level)
		end

	is_g_unicode_break_infix_separator: BOOLEAN
		do
			Result := (value=g_unicode_break_infix_separator_low_level)
		end

	is_g_unicode_break_inseparable: BOOLEAN
		do
			Result := (value=g_unicode_break_inseparable_low_level)
		end

	is_g_unicode_break_line_feed: BOOLEAN
		do
			Result := (value=g_unicode_break_line_feed_low_level)
		end

	is_g_unicode_break_mandatory: BOOLEAN
		do
			Result := (value=g_unicode_break_mandatory_low_level)
		end

	is_g_unicode_break_next_line: BOOLEAN
		do
			Result := (value=g_unicode_break_next_line_low_level)
		end

	is_g_unicode_break_non_breaking_glue: BOOLEAN
		do
			Result := (value=g_unicode_break_non_breaking_glue_low_level)
		end

	is_g_unicode_break_non_starter: BOOLEAN
		do
			Result := (value=g_unicode_break_non_starter_low_level)
		end

	is_g_unicode_break_numeric: BOOLEAN
		do
			Result := (value=g_unicode_break_numeric_low_level)
		end

	is_g_unicode_break_open_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_break_open_punctuation_low_level)
		end

	is_g_unicode_break_postfix: BOOLEAN
		do
			Result := (value=g_unicode_break_postfix_low_level)
		end

	is_g_unicode_break_prefix: BOOLEAN
		do
			Result := (value=g_unicode_break_prefix_low_level)
		end

	is_g_unicode_break_quotation: BOOLEAN
		do
			Result := (value=g_unicode_break_quotation_low_level)
		end

	is_g_unicode_break_space: BOOLEAN
		do
			Result := (value=g_unicode_break_space_low_level)
		end

	is_g_unicode_break_surrogate: BOOLEAN
		do
			Result := (value=g_unicode_break_surrogate_low_level)
		end

	is_g_unicode_break_symbol: BOOLEAN
		do
			Result := (value=g_unicode_break_symbol_low_level)
		end

	is_g_unicode_break_unknown: BOOLEAN
		do
			Result := (value=g_unicode_break_unknown_low_level)
		end

	is_g_unicode_break_word_joiner: BOOLEAN
		do
			Result := (value=g_unicode_break_word_joiner_low_level)
		end

	is_g_unicode_break_zero_width_space: BOOLEAN
		do
			Result := (value=g_unicode_break_zero_width_space_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unicode_break_after_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_AFTER"
 			}"
 		end

	g_unicode_break_alphabetic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_ALPHABETIC"
 			}"
 		end

	g_unicode_break_ambiguous_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_AMBIGUOUS"
 			}"
 		end

	g_unicode_break_before_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_BEFORE"
 			}"
 		end

	g_unicode_break_before_and_after_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_BEFORE_AND_AFTER"
 			}"
 		end

	g_unicode_break_carriage_return_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CARRIAGE_RETURN"
 			}"
 		end

	g_unicode_break_close_paranthesis_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CLOSE_PARANTHESIS"
 			}"
 		end

	g_unicode_break_close_punctuation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CLOSE_PUNCTUATION"
 			}"
 		end

	g_unicode_break_combining_mark_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_COMBINING_MARK"
 			}"
 		end

	g_unicode_break_complex_context_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_COMPLEX_CONTEXT"
 			}"
 		end

	g_unicode_break_conditional_japanese_starter_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CONDITIONAL_JAPANESE_STARTER"
 			}"
 		end

	g_unicode_break_contingent_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CONTINGENT"
 			}"
 		end

	g_unicode_break_exclamation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_EXCLAMATION"
 			}"
 		end

	g_unicode_break_hangul_l_jamo_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_L_JAMO"
 			}"
 		end

	g_unicode_break_hangul_lv_syllable_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_LV_SYLLABLE"
 			}"
 		end

	g_unicode_break_hangul_lvt_syllable_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE"
 			}"
 		end

	g_unicode_break_hangul_t_jamo_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_T_JAMO"
 			}"
 		end

	g_unicode_break_hangul_v_jamo_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_V_JAMO"
 			}"
 		end

	g_unicode_break_hebrew_letter_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HEBREW_LETTER"
 			}"
 		end

	g_unicode_break_hyphen_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HYPHEN"
 			}"
 		end

	g_unicode_break_ideographic_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_IDEOGRAPHIC"
 			}"
 		end

	g_unicode_break_infix_separator_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_INFIX_SEPARATOR"
 			}"
 		end

	g_unicode_break_inseparable_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_INSEPARABLE"
 			}"
 		end

	g_unicode_break_line_feed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_LINE_FEED"
 			}"
 		end

	g_unicode_break_mandatory_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_MANDATORY"
 			}"
 		end

	g_unicode_break_next_line_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NEXT_LINE"
 			}"
 		end

	g_unicode_break_non_breaking_glue_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NON_BREAKING_GLUE"
 			}"
 		end

	g_unicode_break_non_starter_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NON_STARTER"
 			}"
 		end

	g_unicode_break_numeric_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NUMERIC"
 			}"
 		end

	g_unicode_break_open_punctuation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_OPEN_PUNCTUATION"
 			}"
 		end

	g_unicode_break_postfix_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_POSTFIX"
 			}"
 		end

	g_unicode_break_prefix_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_PREFIX"
 			}"
 		end

	g_unicode_break_quotation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_QUOTATION"
 			}"
 		end

	g_unicode_break_space_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_SPACE"
 			}"
 		end

	g_unicode_break_surrogate_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_SURROGATE"
 			}"
 		end

	g_unicode_break_symbol_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_SYMBOL"
 			}"
 		end

	g_unicode_break_unknown_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_UNKNOWN"
 			}"
 		end

	g_unicode_break_word_joiner_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_WORD_JOINER"
 			}"
 		end

	g_unicode_break_zero_width_space_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_ZERO_WIDTH_SPACE"
 			}"
 		end


end -- class GUNICODE_BREAK_TYPE_ENUM
