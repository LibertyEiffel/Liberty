-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODE_BREAK_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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

feature -- Setters
	default_create,
	set_g_unicode_break_after is
		do
			value := g_unicode_break_after_low_level
		end

	set_g_unicode_break_alphabetic is
		do
			value := g_unicode_break_alphabetic_low_level
		end

	set_g_unicode_break_ambiguous is
		do
			value := g_unicode_break_ambiguous_low_level
		end

	set_g_unicode_break_before is
		do
			value := g_unicode_break_before_low_level
		end

	set_g_unicode_break_before_and_after is
		do
			value := g_unicode_break_before_and_after_low_level
		end

	set_g_unicode_break_carriage_return is
		do
			value := g_unicode_break_carriage_return_low_level
		end

	set_g_unicode_break_close_paranthesis is
		do
			value := g_unicode_break_close_paranthesis_low_level
		end

	set_g_unicode_break_close_punctuation is
		do
			value := g_unicode_break_close_punctuation_low_level
		end

	set_g_unicode_break_combining_mark is
		do
			value := g_unicode_break_combining_mark_low_level
		end

	set_g_unicode_break_complex_context is
		do
			value := g_unicode_break_complex_context_low_level
		end

	set_g_unicode_break_conditional_japanese_starter is
		do
			value := g_unicode_break_conditional_japanese_starter_low_level
		end

	set_g_unicode_break_contingent is
		do
			value := g_unicode_break_contingent_low_level
		end

	set_g_unicode_break_exclamation is
		do
			value := g_unicode_break_exclamation_low_level
		end

	set_g_unicode_break_hangul_l_jamo is
		do
			value := g_unicode_break_hangul_l_jamo_low_level
		end

	set_g_unicode_break_hangul_lv_syllable is
		do
			value := g_unicode_break_hangul_lv_syllable_low_level
		end

	set_g_unicode_break_hangul_lvt_syllable is
		do
			value := g_unicode_break_hangul_lvt_syllable_low_level
		end

	set_g_unicode_break_hangul_t_jamo is
		do
			value := g_unicode_break_hangul_t_jamo_low_level
		end

	set_g_unicode_break_hangul_v_jamo is
		do
			value := g_unicode_break_hangul_v_jamo_low_level
		end

	set_g_unicode_break_hebrew_letter is
		do
			value := g_unicode_break_hebrew_letter_low_level
		end

	set_g_unicode_break_hyphen is
		do
			value := g_unicode_break_hyphen_low_level
		end

	set_g_unicode_break_ideographic is
		do
			value := g_unicode_break_ideographic_low_level
		end

	set_g_unicode_break_infix_separator is
		do
			value := g_unicode_break_infix_separator_low_level
		end

	set_g_unicode_break_inseparable is
		do
			value := g_unicode_break_inseparable_low_level
		end

	set_g_unicode_break_line_feed is
		do
			value := g_unicode_break_line_feed_low_level
		end

	set_g_unicode_break_mandatory is
		do
			value := g_unicode_break_mandatory_low_level
		end

	set_g_unicode_break_next_line is
		do
			value := g_unicode_break_next_line_low_level
		end

	set_g_unicode_break_non_breaking_glue is
		do
			value := g_unicode_break_non_breaking_glue_low_level
		end

	set_g_unicode_break_non_starter is
		do
			value := g_unicode_break_non_starter_low_level
		end

	set_g_unicode_break_numeric is
		do
			value := g_unicode_break_numeric_low_level
		end

	set_g_unicode_break_open_punctuation is
		do
			value := g_unicode_break_open_punctuation_low_level
		end

	set_g_unicode_break_postfix is
		do
			value := g_unicode_break_postfix_low_level
		end

	set_g_unicode_break_prefix is
		do
			value := g_unicode_break_prefix_low_level
		end

	set_g_unicode_break_quotation is
		do
			value := g_unicode_break_quotation_low_level
		end

	set_g_unicode_break_space is
		do
			value := g_unicode_break_space_low_level
		end

	set_g_unicode_break_surrogate is
		do
			value := g_unicode_break_surrogate_low_level
		end

	set_g_unicode_break_symbol is
		do
			value := g_unicode_break_symbol_low_level
		end

	set_g_unicode_break_unknown is
		do
			value := g_unicode_break_unknown_low_level
		end

	set_g_unicode_break_word_joiner is
		do
			value := g_unicode_break_word_joiner_low_level
		end

	set_g_unicode_break_zero_width_space is
		do
			value := g_unicode_break_zero_width_space_low_level
		end

feature -- Queries
	is_g_unicode_break_after: BOOLEAN is
		do
			Result := (value=g_unicode_break_after_low_level)
		end

	is_g_unicode_break_alphabetic: BOOLEAN is
		do
			Result := (value=g_unicode_break_alphabetic_low_level)
		end

	is_g_unicode_break_ambiguous: BOOLEAN is
		do
			Result := (value=g_unicode_break_ambiguous_low_level)
		end

	is_g_unicode_break_before: BOOLEAN is
		do
			Result := (value=g_unicode_break_before_low_level)
		end

	is_g_unicode_break_before_and_after: BOOLEAN is
		do
			Result := (value=g_unicode_break_before_and_after_low_level)
		end

	is_g_unicode_break_carriage_return: BOOLEAN is
		do
			Result := (value=g_unicode_break_carriage_return_low_level)
		end

	is_g_unicode_break_close_paranthesis: BOOLEAN is
		do
			Result := (value=g_unicode_break_close_paranthesis_low_level)
		end

	is_g_unicode_break_close_punctuation: BOOLEAN is
		do
			Result := (value=g_unicode_break_close_punctuation_low_level)
		end

	is_g_unicode_break_combining_mark: BOOLEAN is
		do
			Result := (value=g_unicode_break_combining_mark_low_level)
		end

	is_g_unicode_break_complex_context: BOOLEAN is
		do
			Result := (value=g_unicode_break_complex_context_low_level)
		end

	is_g_unicode_break_conditional_japanese_starter: BOOLEAN is
		do
			Result := (value=g_unicode_break_conditional_japanese_starter_low_level)
		end

	is_g_unicode_break_contingent: BOOLEAN is
		do
			Result := (value=g_unicode_break_contingent_low_level)
		end

	is_g_unicode_break_exclamation: BOOLEAN is
		do
			Result := (value=g_unicode_break_exclamation_low_level)
		end

	is_g_unicode_break_hangul_l_jamo: BOOLEAN is
		do
			Result := (value=g_unicode_break_hangul_l_jamo_low_level)
		end

	is_g_unicode_break_hangul_lv_syllable: BOOLEAN is
		do
			Result := (value=g_unicode_break_hangul_lv_syllable_low_level)
		end

	is_g_unicode_break_hangul_lvt_syllable: BOOLEAN is
		do
			Result := (value=g_unicode_break_hangul_lvt_syllable_low_level)
		end

	is_g_unicode_break_hangul_t_jamo: BOOLEAN is
		do
			Result := (value=g_unicode_break_hangul_t_jamo_low_level)
		end

	is_g_unicode_break_hangul_v_jamo: BOOLEAN is
		do
			Result := (value=g_unicode_break_hangul_v_jamo_low_level)
		end

	is_g_unicode_break_hebrew_letter: BOOLEAN is
		do
			Result := (value=g_unicode_break_hebrew_letter_low_level)
		end

	is_g_unicode_break_hyphen: BOOLEAN is
		do
			Result := (value=g_unicode_break_hyphen_low_level)
		end

	is_g_unicode_break_ideographic: BOOLEAN is
		do
			Result := (value=g_unicode_break_ideographic_low_level)
		end

	is_g_unicode_break_infix_separator: BOOLEAN is
		do
			Result := (value=g_unicode_break_infix_separator_low_level)
		end

	is_g_unicode_break_inseparable: BOOLEAN is
		do
			Result := (value=g_unicode_break_inseparable_low_level)
		end

	is_g_unicode_break_line_feed: BOOLEAN is
		do
			Result := (value=g_unicode_break_line_feed_low_level)
		end

	is_g_unicode_break_mandatory: BOOLEAN is
		do
			Result := (value=g_unicode_break_mandatory_low_level)
		end

	is_g_unicode_break_next_line: BOOLEAN is
		do
			Result := (value=g_unicode_break_next_line_low_level)
		end

	is_g_unicode_break_non_breaking_glue: BOOLEAN is
		do
			Result := (value=g_unicode_break_non_breaking_glue_low_level)
		end

	is_g_unicode_break_non_starter: BOOLEAN is
		do
			Result := (value=g_unicode_break_non_starter_low_level)
		end

	is_g_unicode_break_numeric: BOOLEAN is
		do
			Result := (value=g_unicode_break_numeric_low_level)
		end

	is_g_unicode_break_open_punctuation: BOOLEAN is
		do
			Result := (value=g_unicode_break_open_punctuation_low_level)
		end

	is_g_unicode_break_postfix: BOOLEAN is
		do
			Result := (value=g_unicode_break_postfix_low_level)
		end

	is_g_unicode_break_prefix: BOOLEAN is
		do
			Result := (value=g_unicode_break_prefix_low_level)
		end

	is_g_unicode_break_quotation: BOOLEAN is
		do
			Result := (value=g_unicode_break_quotation_low_level)
		end

	is_g_unicode_break_space: BOOLEAN is
		do
			Result := (value=g_unicode_break_space_low_level)
		end

	is_g_unicode_break_surrogate: BOOLEAN is
		do
			Result := (value=g_unicode_break_surrogate_low_level)
		end

	is_g_unicode_break_symbol: BOOLEAN is
		do
			Result := (value=g_unicode_break_symbol_low_level)
		end

	is_g_unicode_break_unknown: BOOLEAN is
		do
			Result := (value=g_unicode_break_unknown_low_level)
		end

	is_g_unicode_break_word_joiner: BOOLEAN is
		do
			Result := (value=g_unicode_break_word_joiner_low_level)
		end

	is_g_unicode_break_zero_width_space: BOOLEAN is
		do
			Result := (value=g_unicode_break_zero_width_space_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unicode_break_after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_AFTER"
 			}"
 		end

	g_unicode_break_alphabetic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_ALPHABETIC"
 			}"
 		end

	g_unicode_break_ambiguous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_AMBIGUOUS"
 			}"
 		end

	g_unicode_break_before_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_BEFORE"
 			}"
 		end

	g_unicode_break_before_and_after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_BEFORE_AND_AFTER"
 			}"
 		end

	g_unicode_break_carriage_return_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CARRIAGE_RETURN"
 			}"
 		end

	g_unicode_break_close_paranthesis_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CLOSE_PARANTHESIS"
 			}"
 		end

	g_unicode_break_close_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CLOSE_PUNCTUATION"
 			}"
 		end

	g_unicode_break_combining_mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_COMBINING_MARK"
 			}"
 		end

	g_unicode_break_complex_context_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_COMPLEX_CONTEXT"
 			}"
 		end

	g_unicode_break_conditional_japanese_starter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CONDITIONAL_JAPANESE_STARTER"
 			}"
 		end

	g_unicode_break_contingent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CONTINGENT"
 			}"
 		end

	g_unicode_break_exclamation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_EXCLAMATION"
 			}"
 		end

	g_unicode_break_hangul_l_jamo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_L_JAMO"
 			}"
 		end

	g_unicode_break_hangul_lv_syllable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_LV_SYLLABLE"
 			}"
 		end

	g_unicode_break_hangul_lvt_syllable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE"
 			}"
 		end

	g_unicode_break_hangul_t_jamo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_T_JAMO"
 			}"
 		end

	g_unicode_break_hangul_v_jamo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_V_JAMO"
 			}"
 		end

	g_unicode_break_hebrew_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HEBREW_LETTER"
 			}"
 		end

	g_unicode_break_hyphen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HYPHEN"
 			}"
 		end

	g_unicode_break_ideographic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_IDEOGRAPHIC"
 			}"
 		end

	g_unicode_break_infix_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_INFIX_SEPARATOR"
 			}"
 		end

	g_unicode_break_inseparable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_INSEPARABLE"
 			}"
 		end

	g_unicode_break_line_feed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_LINE_FEED"
 			}"
 		end

	g_unicode_break_mandatory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_MANDATORY"
 			}"
 		end

	g_unicode_break_next_line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NEXT_LINE"
 			}"
 		end

	g_unicode_break_non_breaking_glue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NON_BREAKING_GLUE"
 			}"
 		end

	g_unicode_break_non_starter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NON_STARTER"
 			}"
 		end

	g_unicode_break_numeric_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NUMERIC"
 			}"
 		end

	g_unicode_break_open_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_OPEN_PUNCTUATION"
 			}"
 		end

	g_unicode_break_postfix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_POSTFIX"
 			}"
 		end

	g_unicode_break_prefix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_PREFIX"
 			}"
 		end

	g_unicode_break_quotation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_QUOTATION"
 			}"
 		end

	g_unicode_break_space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_SPACE"
 			}"
 		end

	g_unicode_break_surrogate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_SURROGATE"
 			}"
 		end

	g_unicode_break_symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_SYMBOL"
 			}"
 		end

	g_unicode_break_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_UNKNOWN"
 			}"
 		end

	g_unicode_break_word_joiner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_WORD_JOINER"
 			}"
 		end

	g_unicode_break_zero_width_space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_ZERO_WIDTH_SPACE"
 			}"
 		end


end -- class GUNICODE_BREAK_TYPE_ENUM
