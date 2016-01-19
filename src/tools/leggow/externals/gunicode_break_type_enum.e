-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GUNICODE_BREAK_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = after_low_level)  or else
				(a_value = alphabetic_low_level)  or else
				(a_value = ambiguous_low_level)  or else
				(a_value = before_low_level)  or else
				(a_value = before_and_after_low_level)  or else
				(a_value = carriage_return_low_level)  or else
				(a_value = close_paranthesis_low_level)  or else
				(a_value = close_punctuation_low_level)  or else
				(a_value = combining_mark_low_level)  or else
				(a_value = complex_context_low_level)  or else
				(a_value = conditional_japanese_starter_low_level)  or else
				(a_value = contingent_low_level)  or else
				(a_value = exclamation_low_level)  or else
				(a_value = hangul_l_jamo_low_level)  or else
				(a_value = hangul_lv_syllable_low_level)  or else
				(a_value = hangul_lvt_syllable_low_level)  or else
				(a_value = hangul_t_jamo_low_level)  or else
				(a_value = hangul_v_jamo_low_level)  or else
				(a_value = hebrew_letter_low_level)  or else
				(a_value = hyphen_low_level)  or else
				(a_value = ideographic_low_level)  or else
				(a_value = infix_separator_low_level)  or else
				(a_value = inseparable_low_level)  or else
				(a_value = line_feed_low_level)  or else
				(a_value = mandatory_low_level)  or else
				(a_value = next_line_low_level)  or else
				(a_value = non_breaking_glue_low_level)  or else
				(a_value = non_starter_low_level)  or else
				(a_value = numeric_low_level)  or else
				(a_value = open_punctuation_low_level)  or else
				(a_value = postfix_low_level)  or else
				(a_value = prefix_low_level)  or else
				(a_value = quotation_low_level)  or else
				(a_value = regional_indicator_low_level)  or else
				(a_value = space_low_level)  or else
				(a_value = surrogate_low_level)  or else
				(a_value = symbol_low_level)  or else
				(a_value = unknown_low_level)  or else
				(a_value = word_joiner_low_level)  or else
				(a_value = zero_width_space_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_after
               do
                       value := after_low_level
               end

	set_alphabetic
               do
                       value := alphabetic_low_level
               end

	set_ambiguous
               do
                       value := ambiguous_low_level
               end

	set_before
               do
                       value := before_low_level
               end

	set_before_and_after
               do
                       value := before_and_after_low_level
               end

	set_carriage_return
               do
                       value := carriage_return_low_level
               end

	set_close_paranthesis
               do
                       value := close_paranthesis_low_level
               end

	set_close_punctuation
               do
                       value := close_punctuation_low_level
               end

	set_combining_mark
               do
                       value := combining_mark_low_level
               end

	set_complex_context
               do
                       value := complex_context_low_level
               end

	set_conditional_japanese_starter
               do
                       value := conditional_japanese_starter_low_level
               end

	set_contingent
               do
                       value := contingent_low_level
               end

	set_exclamation
               do
                       value := exclamation_low_level
               end

	set_hangul_l_jamo
               do
                       value := hangul_l_jamo_low_level
               end

	set_hangul_lv_syllable
               do
                       value := hangul_lv_syllable_low_level
               end

	set_hangul_lvt_syllable
               do
                       value := hangul_lvt_syllable_low_level
               end

	set_hangul_t_jamo
               do
                       value := hangul_t_jamo_low_level
               end

	set_hangul_v_jamo
               do
                       value := hangul_v_jamo_low_level
               end

	set_hebrew_letter
               do
                       value := hebrew_letter_low_level
               end

	set_hyphen
               do
                       value := hyphen_low_level
               end

	set_ideographic
               do
                       value := ideographic_low_level
               end

	set_infix_separator
               do
                       value := infix_separator_low_level
               end

	set_inseparable
               do
                       value := inseparable_low_level
               end

	set_line_feed
               do
                       value := line_feed_low_level
               end

	set_mandatory
               do
                       value := mandatory_low_level
               end

	set_next_line
               do
                       value := next_line_low_level
               end

	set_non_breaking_glue
               do
                       value := non_breaking_glue_low_level
               end

	set_non_starter
               do
                       value := non_starter_low_level
               end

	set_numeric
               do
                       value := numeric_low_level
               end

	set_open_punctuation
               do
                       value := open_punctuation_low_level
               end

	set_postfix
               do
                       value := postfix_low_level
               end

	set_prefix
               do
                       value := prefix_low_level
               end

	set_quotation
               do
                       value := quotation_low_level
               end

	set_regional_indicator
               do
                       value := regional_indicator_low_level
               end

	set_space
               do
                       value := space_low_level
               end

	set_surrogate
               do
                       value := surrogate_low_level
               end

	set_symbol
               do
                       value := symbol_low_level
               end

	set_unknown
               do
                       value := unknown_low_level
               end

	set_word_joiner
               do
                       value := word_joiner_low_level
               end

	set_zero_width_space
               do
                       value := zero_width_space_low_level
               end

feature {ANY} -- Queries
       is_after: BOOLEAN
               do
                       Result := (value=after_low_level)
               end

       is_alphabetic: BOOLEAN
               do
                       Result := (value=alphabetic_low_level)
               end

       is_ambiguous: BOOLEAN
               do
                       Result := (value=ambiguous_low_level)
               end

       is_before: BOOLEAN
               do
                       Result := (value=before_low_level)
               end

       is_before_and_after: BOOLEAN
               do
                       Result := (value=before_and_after_low_level)
               end

       is_carriage_return: BOOLEAN
               do
                       Result := (value=carriage_return_low_level)
               end

       is_close_paranthesis: BOOLEAN
               do
                       Result := (value=close_paranthesis_low_level)
               end

       is_close_punctuation: BOOLEAN
               do
                       Result := (value=close_punctuation_low_level)
               end

       is_combining_mark: BOOLEAN
               do
                       Result := (value=combining_mark_low_level)
               end

       is_complex_context: BOOLEAN
               do
                       Result := (value=complex_context_low_level)
               end

       is_conditional_japanese_starter: BOOLEAN
               do
                       Result := (value=conditional_japanese_starter_low_level)
               end

       is_contingent: BOOLEAN
               do
                       Result := (value=contingent_low_level)
               end

       is_exclamation: BOOLEAN
               do
                       Result := (value=exclamation_low_level)
               end

       is_hangul_l_jamo: BOOLEAN
               do
                       Result := (value=hangul_l_jamo_low_level)
               end

       is_hangul_lv_syllable: BOOLEAN
               do
                       Result := (value=hangul_lv_syllable_low_level)
               end

       is_hangul_lvt_syllable: BOOLEAN
               do
                       Result := (value=hangul_lvt_syllable_low_level)
               end

       is_hangul_t_jamo: BOOLEAN
               do
                       Result := (value=hangul_t_jamo_low_level)
               end

       is_hangul_v_jamo: BOOLEAN
               do
                       Result := (value=hangul_v_jamo_low_level)
               end

       is_hebrew_letter: BOOLEAN
               do
                       Result := (value=hebrew_letter_low_level)
               end

       is_hyphen: BOOLEAN
               do
                       Result := (value=hyphen_low_level)
               end

       is_ideographic: BOOLEAN
               do
                       Result := (value=ideographic_low_level)
               end

       is_infix_separator: BOOLEAN
               do
                       Result := (value=infix_separator_low_level)
               end

       is_inseparable: BOOLEAN
               do
                       Result := (value=inseparable_low_level)
               end

       is_line_feed: BOOLEAN
               do
                       Result := (value=line_feed_low_level)
               end

       is_mandatory: BOOLEAN
               do
                       Result := (value=mandatory_low_level)
               end

       is_next_line: BOOLEAN
               do
                       Result := (value=next_line_low_level)
               end

       is_non_breaking_glue: BOOLEAN
               do
                       Result := (value=non_breaking_glue_low_level)
               end

       is_non_starter: BOOLEAN
               do
                       Result := (value=non_starter_low_level)
               end

       is_numeric: BOOLEAN
               do
                       Result := (value=numeric_low_level)
               end

       is_open_punctuation: BOOLEAN
               do
                       Result := (value=open_punctuation_low_level)
               end

       is_postfix: BOOLEAN
               do
                       Result := (value=postfix_low_level)
               end

       is_prefix: BOOLEAN
               do
                       Result := (value=prefix_low_level)
               end

       is_quotation: BOOLEAN
               do
                       Result := (value=quotation_low_level)
               end

       is_regional_indicator: BOOLEAN
               do
                       Result := (value=regional_indicator_low_level)
               end

       is_space: BOOLEAN
               do
                       Result := (value=space_low_level)
               end

       is_surrogate: BOOLEAN
               do
                       Result := (value=surrogate_low_level)
               end

       is_symbol: BOOLEAN
               do
                       Result := (value=symbol_low_level)
               end

       is_unknown: BOOLEAN
               do
                       Result := (value=unknown_low_level)
               end

       is_word_joiner: BOOLEAN
               do
                       Result := (value=word_joiner_low_level)
               end

       is_zero_width_space: BOOLEAN
               do
                       Result := (value=zero_width_space_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     after_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_AFTER"
                       }"
               end

     alphabetic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_ALPHABETIC"
                       }"
               end

     ambiguous_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_AMBIGUOUS"
                       }"
               end

     before_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_BEFORE"
                       }"
               end

     before_and_after_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_BEFORE_AND_AFTER"
                       }"
               end

     carriage_return_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_CARRIAGE_RETURN"
                       }"
               end

     close_paranthesis_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_CLOSE_PARANTHESIS"
                       }"
               end

     close_punctuation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_CLOSE_PUNCTUATION"
                       }"
               end

     combining_mark_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_COMBINING_MARK"
                       }"
               end

     complex_context_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_COMPLEX_CONTEXT"
                       }"
               end

     conditional_japanese_starter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_CONDITIONAL_JAPANESE_STARTER"
                       }"
               end

     contingent_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_CONTINGENT"
                       }"
               end

     exclamation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_EXCLAMATION"
                       }"
               end

     hangul_l_jamo_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_HANGUL_L_JAMO"
                       }"
               end

     hangul_lv_syllable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_HANGUL_LV_SYLLABLE"
                       }"
               end

     hangul_lvt_syllable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE"
                       }"
               end

     hangul_t_jamo_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_HANGUL_T_JAMO"
                       }"
               end

     hangul_v_jamo_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_HANGUL_V_JAMO"
                       }"
               end

     hebrew_letter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_HEBREW_LETTER"
                       }"
               end

     hyphen_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_HYPHEN"
                       }"
               end

     ideographic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_IDEOGRAPHIC"
                       }"
               end

     infix_separator_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_INFIX_SEPARATOR"
                       }"
               end

     inseparable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_INSEPARABLE"
                       }"
               end

     line_feed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_LINE_FEED"
                       }"
               end

     mandatory_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_MANDATORY"
                       }"
               end

     next_line_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_NEXT_LINE"
                       }"
               end

     non_breaking_glue_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_NON_BREAKING_GLUE"
                       }"
               end

     non_starter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_NON_STARTER"
                       }"
               end

     numeric_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_NUMERIC"
                       }"
               end

     open_punctuation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_OPEN_PUNCTUATION"
                       }"
               end

     postfix_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_POSTFIX"
                       }"
               end

     prefix_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_PREFIX"
                       }"
               end

     quotation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_QUOTATION"
                       }"
               end

     regional_indicator_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_REGIONAL_INDICATOR"
                       }"
               end

     space_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_SPACE"
                       }"
               end

     surrogate_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_SURROGATE"
                       }"
               end

     symbol_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_SYMBOL"
                       }"
               end

     unknown_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_UNKNOWN"
                       }"
               end

     word_joiner_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_WORD_JOINER"
                       }"
               end

     zero_width_space_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_BREAK_ZERO_WIDTH_SPACE"
                       }"
               end


end -- class GUNICODE_BREAK_TYPE_ENUM
