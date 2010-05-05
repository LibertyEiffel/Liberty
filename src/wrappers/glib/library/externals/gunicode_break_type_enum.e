-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODE_BREAK_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = mandatory_low_level)  or else
				(a_value = line__feed_low_level)  or else
				(a_value = combining__mark_low_level)  or else
				(a_value = surrogate_low_level)  or else
				(a_value = zero__width__space_low_level)  or else
				(a_value = inseparable_low_level)  or else
				(a_value = non__breaking__glue_low_level)  or else
				(a_value = contingent_low_level)  or else
				(a_value = space_low_level)  or else
				(a_value = after_low_level)  or else
				(a_value = before_low_level)  or else
				(a_value = before__and__after_low_level)  or else
				(a_value = hyphen_low_level)  or else
				(a_value = non__starter_low_level)  or else
				(a_value = open__punctuation_low_level)  or else
				(a_value = close__punctuation_low_level)  or else
				(a_value = quotation_low_level)  or else
				(a_value = exclamation_low_level)  or else
				(a_value = ideographic_low_level)  or else
				(a_value = numeric_low_level)  or else
				(a_value = infix__separator_low_level)  or else
				(a_value = symbol_low_level)  or else
				(a_value = alphabetic_low_level)  or else
				(a_value = prefix_low_level)  or else
				(a_value = postfix_low_level)  or else
				(a_value = complex__context_low_level)  or else
				(a_value = ambiguous_low_level)  or else
				(a_value = unknown_low_level)  or else
				(a_value = next__line_low_level)  or else
				(a_value = word__joiner_low_level)  or else
				(a_value = hangul__l__jamo_low_level)  or else
				(a_value = hangul__v__jamo_low_level)  or else
				(a_value = hangul__t__jamo_low_level)  or else
				(a_value = hangul__lv__syllable_low_level)  or else
				(a_value = hangul__lvt__syllable_low_level) )
		end

feature -- Setters
	default_create,
	set_mandatory is
		do
			value := mandatory_low_level
		end

	set_line__feed is
		do
			value := line__feed_low_level
		end

	set_combining__mark is
		do
			value := combining__mark_low_level
		end

	set_surrogate is
		do
			value := surrogate_low_level
		end

	set_zero__width__space is
		do
			value := zero__width__space_low_level
		end

	set_inseparable is
		do
			value := inseparable_low_level
		end

	set_non__breaking__glue is
		do
			value := non__breaking__glue_low_level
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

	set_before__and__after is
		do
			value := before__and__after_low_level
		end

	set_hyphen is
		do
			value := hyphen_low_level
		end

	set_non__starter is
		do
			value := non__starter_low_level
		end

	set_open__punctuation is
		do
			value := open__punctuation_low_level
		end

	set_close__punctuation is
		do
			value := close__punctuation_low_level
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

	set_infix__separator is
		do
			value := infix__separator_low_level
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

	set_complex__context is
		do
			value := complex__context_low_level
		end

	set_ambiguous is
		do
			value := ambiguous_low_level
		end

	set_unknown is
		do
			value := unknown_low_level
		end

	set_next__line is
		do
			value := next__line_low_level
		end

	set_word__joiner is
		do
			value := word__joiner_low_level
		end

	set_hangul__l__jamo is
		do
			value := hangul__l__jamo_low_level
		end

	set_hangul__v__jamo is
		do
			value := hangul__v__jamo_low_level
		end

	set_hangul__t__jamo is
		do
			value := hangul__t__jamo_low_level
		end

	set_hangul__lv__syllable is
		do
			value := hangul__lv__syllable_low_level
		end

	set_hangul__lvt__syllable is
		do
			value := hangul__lvt__syllable_low_level
		end

feature -- Queries
	is_mandatory: BOOLEAN is
		do
			Result := (value=mandatory_low_level)
		end

	is_line__feed: BOOLEAN is
		do
			Result := (value=line__feed_low_level)
		end

	is_combining__mark: BOOLEAN is
		do
			Result := (value=combining__mark_low_level)
		end

	is_surrogate: BOOLEAN is
		do
			Result := (value=surrogate_low_level)
		end

	is_zero__width__space: BOOLEAN is
		do
			Result := (value=zero__width__space_low_level)
		end

	is_inseparable: BOOLEAN is
		do
			Result := (value=inseparable_low_level)
		end

	is_non__breaking__glue: BOOLEAN is
		do
			Result := (value=non__breaking__glue_low_level)
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

	is_before__and__after: BOOLEAN is
		do
			Result := (value=before__and__after_low_level)
		end

	is_hyphen: BOOLEAN is
		do
			Result := (value=hyphen_low_level)
		end

	is_non__starter: BOOLEAN is
		do
			Result := (value=non__starter_low_level)
		end

	is_open__punctuation: BOOLEAN is
		do
			Result := (value=open__punctuation_low_level)
		end

	is_close__punctuation: BOOLEAN is
		do
			Result := (value=close__punctuation_low_level)
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

	is_infix__separator: BOOLEAN is
		do
			Result := (value=infix__separator_low_level)
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

	is_complex__context: BOOLEAN is
		do
			Result := (value=complex__context_low_level)
		end

	is_ambiguous: BOOLEAN is
		do
			Result := (value=ambiguous_low_level)
		end

	is_unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

	is_next__line: BOOLEAN is
		do
			Result := (value=next__line_low_level)
		end

	is_word__joiner: BOOLEAN is
		do
			Result := (value=word__joiner_low_level)
		end

	is_hangul__l__jamo: BOOLEAN is
		do
			Result := (value=hangul__l__jamo_low_level)
		end

	is_hangul__v__jamo: BOOLEAN is
		do
			Result := (value=hangul__v__jamo_low_level)
		end

	is_hangul__t__jamo: BOOLEAN is
		do
			Result := (value=hangul__t__jamo_low_level)
		end

	is_hangul__lv__syllable: BOOLEAN is
		do
			Result := (value=hangul__lv__syllable_low_level)
		end

	is_hangul__lvt__syllable: BOOLEAN is
		do
			Result := (value=hangul__lvt__syllable_low_level)
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

	line__feed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_LINE_FEED"
 			}"
 		end

	combining__mark_low_level: INTEGER is
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

	zero__width__space_low_level: INTEGER is
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

	non__breaking__glue_low_level: INTEGER is
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

	before__and__after_low_level: INTEGER is
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

	non__starter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NON_STARTER"
 			}"
 		end

	open__punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_OPEN_PUNCTUATION"
 			}"
 		end

	close__punctuation_low_level: INTEGER is
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

	infix__separator_low_level: INTEGER is
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

	complex__context_low_level: INTEGER is
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

	next__line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_NEXT_LINE"
 			}"
 		end

	word__joiner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_WORD_JOINER"
 			}"
 		end

	hangul__l__jamo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_L_JAMO"
 			}"
 		end

	hangul__v__jamo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_V_JAMO"
 			}"
 		end

	hangul__t__jamo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_T_JAMO"
 			}"
 		end

	hangul__lv__syllable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_LV_SYLLABLE"
 			}"
 		end

	hangul__lvt__syllable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE"
 			}"
 		end


end -- class GUNICODE_BREAK_TYPE_ENUM
