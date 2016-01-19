-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODE_BREAK_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = mandatory_low_level)  or else
				(a_value = carriage_return_low_level)  or else
				(a_value = line_feed_low_level)  or else
				(a_value = combining_mark_low_level)  or else
				(a_value = surrogate_low_level)  or else
				(a_value = zero_width_space_low_level)  or else
				(a_value = inseparable_low_level)  or else
				(a_value = non_breaking_glue_low_level)  or else
				(a_value = contingent_low_level)  or else
				(a_value = space_low_level)  or else
				(a_value = after_low_level)  or else
				(a_value = before_low_level)  or else
				(a_value = before_and_after_low_level)  or else
				(a_value = hyphen_low_level)  or else
				(a_value = non_starter_low_level)  or else
				(a_value = open_punctuation_low_level)  or else
				(a_value = close_punctuation_low_level)  or else
				(a_value = quotation_low_level)  or else
				(a_value = exclamation_low_level)  or else
				(a_value = ideographic_low_level)  or else
				(a_value = numeric_low_level)  or else
				(a_value = infix_separator_low_level)  or else
				(a_value = symbol_low_level)  or else
				(a_value = alphabetic_low_level)  or else
				(a_value = prefix_low_level)  or else
				(a_value = postfix_low_level)  or else
				(a_value = complex_context_low_level)  or else
				(a_value = ambiguous_low_level)  or else
				(a_value = unknown_low_level)  or else
				(a_value = next_line_low_level)  or else
				(a_value = word_joiner_low_level)  or else
				(a_value = hangul_l_jamo_low_level)  or else
				(a_value = hangul_v_jamo_low_level)  or else
				(a_value = hangul_t_jamo_low_level)  or else
				(a_value = hangul_lv_syllable_low_level)  or else
				(a_value = hangul_lvt_syllable_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_mandatory is
		do
			value := mandatory_low_level
		end

	set_carriage_return is
		do
			value := carriage_return_low_level
		end

	set_line_feed is
		do
			value := line_feed_low_level
		end

	set_combining_mark is
		do
			value := combining_mark_low_level
		end

	set_surrogate is
		do
			value := surrogate_low_level
		end

	set_zero_width_space is
		do
			value := zero_width_space_low_level
		end

	set_inseparable is
		do
			value := inseparable_low_level
		end

	set_non_breaking_glue is
		do
			value := non_breaking_glue_low_level
		end

	set_contingent is
		do
			value := contingent_low_level
		end

	set_space is
		do
			value := space_low_level
		end

	set_after is
		do
			value := after_low_level
		end

	set_before is
		do
			value := before_low_level
		end

	set_before_and_after is
		do
			value := before_and_after_low_level
		end

	set_hyphen is
		do
			value := hyphen_low_level
		end

	set_non_starter is
		do
			value := non_starter_low_level
		end

	set_open_punctuation is
		do
			value := open_punctuation_low_level
		end

	set_close_punctuation is
		do
			value := close_punctuation_low_level
		end

	set_quotation is
		do
			value := quotation_low_level
		end

	set_exclamation is
		do
			value := exclamation_low_level
		end

	set_ideographic is
		do
			value := ideographic_low_level
		end

	set_numeric is
		do
			value := numeric_low_level
		end

	set_infix_separator is
		do
			value := infix_separator_low_level
		end

	set_symbol is
		do
			value := symbol_low_level
		end

	set_alphabetic is
		do
			value := alphabetic_low_level
		end

	set_prefix is
		do
			value := prefix_low_level
		end

	set_postfix is
		do
			value := postfix_low_level
		end

	set_complex_context is
		do
			value := complex_context_low_level
		end

	set_ambiguous is
		do
			value := ambiguous_low_level
		end

	set_unknown is
		do
			value := unknown_low_level
		end

	set_next_line is
		do
			value := next_line_low_level
		end

	set_word_joiner is
		do
			value := word_joiner_low_level
		end

	set_hangul_l_jamo is
		do
			value := hangul_l_jamo_low_level
		end

	set_hangul_v_jamo is
		do
			value := hangul_v_jamo_low_level
		end

	set_hangul_t_jamo is
		do
			value := hangul_t_jamo_low_level
		end

	set_hangul_lv_syllable is
		do
			value := hangul_lv_syllable_low_level
		end

	set_hangul_lvt_syllable is
		do
			value := hangul_lvt_syllable_low_level
		end

feature {ANY} -- Queries
	is_mandatory: BOOLEAN is
		do
			Result := (value=mandatory_low_level)
		end

	is_carriage_return: BOOLEAN is
		do
			Result := (value=carriage_return_low_level)
		end

	is_line_feed: BOOLEAN is
		do
			Result := (value=line_feed_low_level)
		end

	is_combining_mark: BOOLEAN is
		do
			Result := (value=combining_mark_low_level)
		end

	is_surrogate: BOOLEAN is
		do
			Result := (value=surrogate_low_level)
		end

	is_zero_width_space: BOOLEAN is
		do
			Result := (value=zero_width_space_low_level)
		end

	is_inseparable: BOOLEAN is
		do
			Result := (value=inseparable_low_level)
		end

	is_non_breaking_glue: BOOLEAN is
		do
			Result := (value=non_breaking_glue_low_level)
		end

	is_contingent: BOOLEAN is
		do
			Result := (value=contingent_low_level)
		end

	is_space: BOOLEAN is
		do
			Result := (value=space_low_level)
		end

	is_after: BOOLEAN is
		do
			Result := (value=after_low_level)
		end

	is_before: BOOLEAN is
		do
			Result := (value=before_low_level)
		end

	is_before_and_after: BOOLEAN is
		do
			Result := (value=before_and_after_low_level)
		end

	is_hyphen: BOOLEAN is
		do
			Result := (value=hyphen_low_level)
		end

	is_non_starter: BOOLEAN is
		do
			Result := (value=non_starter_low_level)
		end

	is_open_punctuation: BOOLEAN is
		do
			Result := (value=open_punctuation_low_level)
		end

	is_close_punctuation: BOOLEAN is
		do
			Result := (value=close_punctuation_low_level)
		end

	is_quotation: BOOLEAN is
		do
			Result := (value=quotation_low_level)
		end

	is_exclamation: BOOLEAN is
		do
			Result := (value=exclamation_low_level)
		end

	is_ideographic: BOOLEAN is
		do
			Result := (value=ideographic_low_level)
		end

	is_numeric: BOOLEAN is
		do
			Result := (value=numeric_low_level)
		end

	is_infix_separator: BOOLEAN is
		do
			Result := (value=infix_separator_low_level)
		end

	is_symbol: BOOLEAN is
		do
			Result := (value=symbol_low_level)
		end

	is_alphabetic: BOOLEAN is
		do
			Result := (value=alphabetic_low_level)
		end

	is_prefix: BOOLEAN is
		do
			Result := (value=prefix_low_level)
		end

	is_postfix: BOOLEAN is
		do
			Result := (value=postfix_low_level)
		end

	is_complex_context: BOOLEAN is
		do
			Result := (value=complex_context_low_level)
		end

	is_ambiguous: BOOLEAN is
		do
			Result := (value=ambiguous_low_level)
		end

	is_unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

	is_next_line: BOOLEAN is
		do
			Result := (value=next_line_low_level)
		end

	is_word_joiner: BOOLEAN is
		do
			Result := (value=word_joiner_low_level)
		end

	is_hangul_l_jamo: BOOLEAN is
		do
			Result := (value=hangul_l_jamo_low_level)
		end

	is_hangul_v_jamo: BOOLEAN is
		do
			Result := (value=hangul_v_jamo_low_level)
		end

	is_hangul_t_jamo: BOOLEAN is
		do
			Result := (value=hangul_t_jamo_low_level)
		end

	is_hangul_lv_syllable: BOOLEAN is
		do
			Result := (value=hangul_lv_syllable_low_level)
		end

	is_hangul_lvt_syllable: BOOLEAN is
		do
			Result := (value=hangul_lvt_syllable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	mandatory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_MANDATORY"
 			}"
 		end

	carriage_return_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CARRIAGE_RETURN"
 			}"
 		end

	line_feed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_LINE_FEED"
 			}"
 		end

	combining_mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_COMBINING_MARK"
 			}"
 		end

	surrogate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_SURROGATE"
 			}"
 		end

	zero_width_space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_ZERO_WIDTH_SPACE"
 			}"
 		end

	inseparable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_INSEPARABLE"
 			}"
 		end

	non_breaking_glue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NON_BREAKING_GLUE"
 			}"
 		end

	contingent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CONTINGENT"
 			}"
 		end

	space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_SPACE"
 			}"
 		end

	after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_AFTER"
 			}"
 		end

	before_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_BEFORE"
 			}"
 		end

	before_and_after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_BEFORE_AND_AFTER"
 			}"
 		end

	hyphen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HYPHEN"
 			}"
 		end

	non_starter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NON_STARTER"
 			}"
 		end

	open_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_OPEN_PUNCTUATION"
 			}"
 		end

	close_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_CLOSE_PUNCTUATION"
 			}"
 		end

	quotation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_QUOTATION"
 			}"
 		end

	exclamation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_EXCLAMATION"
 			}"
 		end

	ideographic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_IDEOGRAPHIC"
 			}"
 		end

	numeric_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NUMERIC"
 			}"
 		end

	infix_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_INFIX_SEPARATOR"
 			}"
 		end

	symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_SYMBOL"
 			}"
 		end

	alphabetic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_ALPHABETIC"
 			}"
 		end

	prefix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_PREFIX"
 			}"
 		end

	postfix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_POSTFIX"
 			}"
 		end

	complex_context_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_COMPLEX_CONTEXT"
 			}"
 		end

	ambiguous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_AMBIGUOUS"
 			}"
 		end

	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_UNKNOWN"
 			}"
 		end

	next_line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NEXT_LINE"
 			}"
 		end

	word_joiner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_WORD_JOINER"
 			}"
 		end

	hangul_l_jamo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_L_JAMO"
 			}"
 		end

	hangul_v_jamo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_V_JAMO"
 			}"
 		end

	hangul_t_jamo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_T_JAMO"
 			}"
 		end

	hangul_lv_syllable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_LV_SYLLABLE"
 			}"
 		end

	hangul_lvt_syllable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE"
 			}"
 		end


end -- class GUNICODE_BREAK_TYPE_ENUM
