-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GREGEX_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = compile_low_level)  or else
				(a_value = replace_low_level)  or else
				(a_value = match_low_level)  or else
				(a_value = internal_low_level)  or else
				(a_value = stray__backslash_low_level)  or else
				(a_value = missing__control__char_low_level)  or else
				(a_value = unrecognized__escape_low_level)  or else
				(a_value = quantifiers__out__of__order_low_level)  or else
				(a_value = quantifier__too__big_low_level)  or else
				(a_value = unterminated__character__class_low_level)  or else
				(a_value = invalid__escape__in__character__class_low_level)  or else
				(a_value = range__out__of__order_low_level)  or else
				(a_value = nothing__to__repeat_low_level)  or else
				(a_value = unrecognized__character_low_level)  or else
				(a_value = posix__named__class__outside__class_low_level)  or else
				(a_value = unmatched__parenthesis_low_level)  or else
				(a_value = inexistent__subpattern__reference_low_level)  or else
				(a_value = unterminated__comment_low_level)  or else
				(a_value = expression__too__large_low_level)  or else
				(a_value = memory__error_low_level)  or else
				(a_value = variable__length__lookbehind_low_level)  or else
				(a_value = malformed__condition_low_level)  or else
				(a_value = too__many__conditional__branches_low_level)  or else
				(a_value = assertion__expected_low_level)  or else
				(a_value = unknown__posix__class__name_low_level)  or else
				(a_value = posix__collating__elements__not__supported_low_level)  or else
				(a_value = hex__code__too__large_low_level)  or else
				(a_value = invalid__condition_low_level)  or else
				(a_value = single__byte__match__in__lookbehind_low_level)  or else
				(a_value = infinite__loop_low_level)  or else
				(a_value = missing__subpattern__name__terminator_low_level)  or else
				(a_value = duplicate__subpattern__name_low_level)  or else
				(a_value = malformed__property_low_level)  or else
				(a_value = unknown__property_low_level)  or else
				(a_value = subpattern__name__too__long_low_level)  or else
				(a_value = too__many__subpatterns_low_level)  or else
				(a_value = invalid__octal__value_low_level)  or else
				(a_value = too__many__branches__in__define_low_level)  or else
				(a_value = define__repetion_low_level)  or else
				(a_value = inconsistent__newline__options_low_level)  or else
				(a_value = missing__back__reference_low_level) )
		end

feature -- Setters
	default_create,
	set_compile is
		do
			value := compile_low_level
		end

	set_replace is
		do
			value := replace_low_level
		end

	set_match is
		do
			value := match_low_level
		end

	set_internal is
		do
			value := internal_low_level
		end

	set_stray__backslash is
		do
			value := stray__backslash_low_level
		end

	set_missing__control__char is
		do
			value := missing__control__char_low_level
		end

	set_unrecognized__escape is
		do
			value := unrecognized__escape_low_level
		end

	set_quantifiers__out__of__order is
		do
			value := quantifiers__out__of__order_low_level
		end

	set_quantifier__too__big is
		do
			value := quantifier__too__big_low_level
		end

	set_unterminated__character__class is
		do
			value := unterminated__character__class_low_level
		end

	set_invalid__escape__in__character__class is
		do
			value := invalid__escape__in__character__class_low_level
		end

	set_range__out__of__order is
		do
			value := range__out__of__order_low_level
		end

	set_nothing__to__repeat is
		do
			value := nothing__to__repeat_low_level
		end

	set_unrecognized__character is
		do
			value := unrecognized__character_low_level
		end

	set_posix__named__class__outside__class is
		do
			value := posix__named__class__outside__class_low_level
		end

	set_unmatched__parenthesis is
		do
			value := unmatched__parenthesis_low_level
		end

	set_inexistent__subpattern__reference is
		do
			value := inexistent__subpattern__reference_low_level
		end

	set_unterminated__comment is
		do
			value := unterminated__comment_low_level
		end

	set_expression__too__large is
		do
			value := expression__too__large_low_level
		end

	set_memory__error is
		do
			value := memory__error_low_level
		end

	set_variable__length__lookbehind is
		do
			value := variable__length__lookbehind_low_level
		end

	set_malformed__condition is
		do
			value := malformed__condition_low_level
		end

	set_too__many__conditional__branches is
		do
			value := too__many__conditional__branches_low_level
		end

	set_assertion__expected is
		do
			value := assertion__expected_low_level
		end

	set_unknown__posix__class__name is
		do
			value := unknown__posix__class__name_low_level
		end

	set_posix__collating__elements__not__supported is
		do
			value := posix__collating__elements__not__supported_low_level
		end

	set_hex__code__too__large is
		do
			value := hex__code__too__large_low_level
		end

	set_invalid__condition is
		do
			value := invalid__condition_low_level
		end

	set_single__byte__match__in__lookbehind is
		do
			value := single__byte__match__in__lookbehind_low_level
		end

	set_infinite__loop is
		do
			value := infinite__loop_low_level
		end

	set_missing__subpattern__name__terminator is
		do
			value := missing__subpattern__name__terminator_low_level
		end

	set_duplicate__subpattern__name is
		do
			value := duplicate__subpattern__name_low_level
		end

	set_malformed__property is
		do
			value := malformed__property_low_level
		end

	set_unknown__property is
		do
			value := unknown__property_low_level
		end

	set_subpattern__name__too__long is
		do
			value := subpattern__name__too__long_low_level
		end

	set_too__many__subpatterns is
		do
			value := too__many__subpatterns_low_level
		end

	set_invalid__octal__value is
		do
			value := invalid__octal__value_low_level
		end

	set_too__many__branches__in__define is
		do
			value := too__many__branches__in__define_low_level
		end

	set_define__repetion is
		do
			value := define__repetion_low_level
		end

	set_inconsistent__newline__options is
		do
			value := inconsistent__newline__options_low_level
		end

	set_missing__back__reference is
		do
			value := missing__back__reference_low_level
		end

feature -- Queries
	is_compile: BOOLEAN is
		do
			Result := (value=compile_low_level)
		end

	is_replace: BOOLEAN is
		do
			Result := (value=replace_low_level)
		end

	is_match: BOOLEAN is
		do
			Result := (value=match_low_level)
		end

	is_internal: BOOLEAN is
		do
			Result := (value=internal_low_level)
		end

	is_stray__backslash: BOOLEAN is
		do
			Result := (value=stray__backslash_low_level)
		end

	is_missing__control__char: BOOLEAN is
		do
			Result := (value=missing__control__char_low_level)
		end

	is_unrecognized__escape: BOOLEAN is
		do
			Result := (value=unrecognized__escape_low_level)
		end

	is_quantifiers__out__of__order: BOOLEAN is
		do
			Result := (value=quantifiers__out__of__order_low_level)
		end

	is_quantifier__too__big: BOOLEAN is
		do
			Result := (value=quantifier__too__big_low_level)
		end

	is_unterminated__character__class: BOOLEAN is
		do
			Result := (value=unterminated__character__class_low_level)
		end

	is_invalid__escape__in__character__class: BOOLEAN is
		do
			Result := (value=invalid__escape__in__character__class_low_level)
		end

	is_range__out__of__order: BOOLEAN is
		do
			Result := (value=range__out__of__order_low_level)
		end

	is_nothing__to__repeat: BOOLEAN is
		do
			Result := (value=nothing__to__repeat_low_level)
		end

	is_unrecognized__character: BOOLEAN is
		do
			Result := (value=unrecognized__character_low_level)
		end

	is_posix__named__class__outside__class: BOOLEAN is
		do
			Result := (value=posix__named__class__outside__class_low_level)
		end

	is_unmatched__parenthesis: BOOLEAN is
		do
			Result := (value=unmatched__parenthesis_low_level)
		end

	is_inexistent__subpattern__reference: BOOLEAN is
		do
			Result := (value=inexistent__subpattern__reference_low_level)
		end

	is_unterminated__comment: BOOLEAN is
		do
			Result := (value=unterminated__comment_low_level)
		end

	is_expression__too__large: BOOLEAN is
		do
			Result := (value=expression__too__large_low_level)
		end

	is_memory__error: BOOLEAN is
		do
			Result := (value=memory__error_low_level)
		end

	is_variable__length__lookbehind: BOOLEAN is
		do
			Result := (value=variable__length__lookbehind_low_level)
		end

	is_malformed__condition: BOOLEAN is
		do
			Result := (value=malformed__condition_low_level)
		end

	is_too__many__conditional__branches: BOOLEAN is
		do
			Result := (value=too__many__conditional__branches_low_level)
		end

	is_assertion__expected: BOOLEAN is
		do
			Result := (value=assertion__expected_low_level)
		end

	is_unknown__posix__class__name: BOOLEAN is
		do
			Result := (value=unknown__posix__class__name_low_level)
		end

	is_posix__collating__elements__not__supported: BOOLEAN is
		do
			Result := (value=posix__collating__elements__not__supported_low_level)
		end

	is_hex__code__too__large: BOOLEAN is
		do
			Result := (value=hex__code__too__large_low_level)
		end

	is_invalid__condition: BOOLEAN is
		do
			Result := (value=invalid__condition_low_level)
		end

	is_single__byte__match__in__lookbehind: BOOLEAN is
		do
			Result := (value=single__byte__match__in__lookbehind_low_level)
		end

	is_infinite__loop: BOOLEAN is
		do
			Result := (value=infinite__loop_low_level)
		end

	is_missing__subpattern__name__terminator: BOOLEAN is
		do
			Result := (value=missing__subpattern__name__terminator_low_level)
		end

	is_duplicate__subpattern__name: BOOLEAN is
		do
			Result := (value=duplicate__subpattern__name_low_level)
		end

	is_malformed__property: BOOLEAN is
		do
			Result := (value=malformed__property_low_level)
		end

	is_unknown__property: BOOLEAN is
		do
			Result := (value=unknown__property_low_level)
		end

	is_subpattern__name__too__long: BOOLEAN is
		do
			Result := (value=subpattern__name__too__long_low_level)
		end

	is_too__many__subpatterns: BOOLEAN is
		do
			Result := (value=too__many__subpatterns_low_level)
		end

	is_invalid__octal__value: BOOLEAN is
		do
			Result := (value=invalid__octal__value_low_level)
		end

	is_too__many__branches__in__define: BOOLEAN is
		do
			Result := (value=too__many__branches__in__define_low_level)
		end

	is_define__repetion: BOOLEAN is
		do
			Result := (value=define__repetion_low_level)
		end

	is_inconsistent__newline__options: BOOLEAN is
		do
			Result := (value=inconsistent__newline__options_low_level)
		end

	is_missing__back__reference: BOOLEAN is
		do
			Result := (value=missing__back__reference_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	compile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_COMPILE"
 			}"
 		end

	replace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_REPLACE"
 			}"
 		end

	match_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MATCH"
 			}"
 		end

	internal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INTERNAL"
 			}"
 		end

	stray__backslash_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_STRAY_BACKSLASH"
 			}"
 		end

	missing__control__char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_CONTROL_CHAR"
 			}"
 		end

	unrecognized__escape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNRECOGNIZED_ESCAPE"
 			}"
 		end

	quantifiers__out__of__order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_QUANTIFIERS_OUT_OF_ORDER"
 			}"
 		end

	quantifier__too__big_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_QUANTIFIER_TOO_BIG"
 			}"
 		end

	unterminated__character__class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNTERMINATED_CHARACTER_CLASS"
 			}"
 		end

	invalid__escape__in__character__class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_ESCAPE_IN_CHARACTER_CLASS"
 			}"
 		end

	range__out__of__order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_RANGE_OUT_OF_ORDER"
 			}"
 		end

	nothing__to__repeat_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_NOTHING_TO_REPEAT"
 			}"
 		end

	unrecognized__character_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNRECOGNIZED_CHARACTER"
 			}"
 		end

	posix__named__class__outside__class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_POSIX_NAMED_CLASS_OUTSIDE_CLASS"
 			}"
 		end

	unmatched__parenthesis_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNMATCHED_PARENTHESIS"
 			}"
 		end

	inexistent__subpattern__reference_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INEXISTENT_SUBPATTERN_REFERENCE"
 			}"
 		end

	unterminated__comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNTERMINATED_COMMENT"
 			}"
 		end

	expression__too__large_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_EXPRESSION_TOO_LARGE"
 			}"
 		end

	memory__error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MEMORY_ERROR"
 			}"
 		end

	variable__length__lookbehind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND"
 			}"
 		end

	malformed__condition_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MALFORMED_CONDITION"
 			}"
 		end

	too__many__conditional__branches_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_CONDITIONAL_BRANCHES"
 			}"
 		end

	assertion__expected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_ASSERTION_EXPECTED"
 			}"
 		end

	unknown__posix__class__name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNKNOWN_POSIX_CLASS_NAME"
 			}"
 		end

	posix__collating__elements__not__supported_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED"
 			}"
 		end

	hex__code__too__large_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_HEX_CODE_TOO_LARGE"
 			}"
 		end

	invalid__condition_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_CONDITION"
 			}"
 		end

	single__byte__match__in__lookbehind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_SINGLE_BYTE_MATCH_IN_LOOKBEHIND"
 			}"
 		end

	infinite__loop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INFINITE_LOOP"
 			}"
 		end

	missing__subpattern__name__terminator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_SUBPATTERN_NAME_TERMINATOR"
 			}"
 		end

	duplicate__subpattern__name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_DUPLICATE_SUBPATTERN_NAME"
 			}"
 		end

	malformed__property_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MALFORMED_PROPERTY"
 			}"
 		end

	unknown__property_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNKNOWN_PROPERTY"
 			}"
 		end

	subpattern__name__too__long_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_SUBPATTERN_NAME_TOO_LONG"
 			}"
 		end

	too__many__subpatterns_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_SUBPATTERNS"
 			}"
 		end

	invalid__octal__value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_OCTAL_VALUE"
 			}"
 		end

	too__many__branches__in__define_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_BRANCHES_IN_DEFINE"
 			}"
 		end

	define__repetion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_DEFINE_REPETION"
 			}"
 		end

	inconsistent__newline__options_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INCONSISTENT_NEWLINE_OPTIONS"
 			}"
 		end

	missing__back__reference_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_BACK_REFERENCE"
 			}"
 		end


end -- class GREGEX_ERROR_ENUM
