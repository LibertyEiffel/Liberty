-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_REGEX_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_regex_error_compile) or else 
				(a_value = g_regex_error_optimize) or else 
				(a_value = g_regex_error_replace) or else 
				(a_value = g_regex_error_match) or else 
				(a_value = g_regex_error_internal) or else 
				(a_value = g_regex_error_stray_backslash) or else 
				(a_value = g_regex_error_missing_control_char) or else 
				(a_value = g_regex_error_unrecognized_escape) or else 
				(a_value = g_regex_error_quantifiers_out_of_order) or else 
				(a_value = g_regex_error_quantifier_too_big) or else 
				(a_value = g_regex_error_unterminated_character_class) or else 
				(a_value = g_regex_error_invalid_escape_in_character_class) or else 
				(a_value = g_regex_error_range_out_of_order) or else 
				(a_value = g_regex_error_nothing_to_repeat) or else 
				(a_value = g_regex_error_unrecognized_character) or else 
				(a_value = g_regex_error_posix_named_class_outside_class) or else 
				(a_value = g_regex_error_unmatched_parenthesis) or else 
				(a_value = g_regex_error_inexistent_subpattern_reference) or else 
				(a_value = g_regex_error_unterminated_comment) or else 
				(a_value = g_regex_error_expression_too_large) or else 
				(a_value = g_regex_error_memory_error) or else 
				(a_value = g_regex_error_variable_length_lookbehind) or else 
				(a_value = g_regex_error_malformed_condition) or else 
				(a_value = g_regex_error_too_many_conditional_branches) or else 
				(a_value = g_regex_error_assertion_expected) or else 
				(a_value = g_regex_error_unknown_posix_class_name) or else 
				(a_value = g_regex_error_posix_collating_elements_not_supported) or else 
				(a_value = g_regex_error_hex_code_too_large) or else 
				(a_value = g_regex_error_invalid_condition) or else 
				(a_value = g_regex_error_single_byte_match_in_lookbehind) or else 
				(a_value = g_regex_error_infinite_loop) or else 
				(a_value = g_regex_error_missing_subpattern_name_terminator) or else 
				(a_value = g_regex_error_duplicate_subpattern_name) or else 
				(a_value = g_regex_error_malformed_property) or else 
				(a_value = g_regex_error_unknown_property) or else 
				(a_value = g_regex_error_subpattern_name_too_long) or else 
				(a_value = g_regex_error_too_many_subpatterns) or else 
				(a_value = g_regex_error_invalid_octal_value) or else 
				(a_value = g_regex_error_too_many_branches_in_define) or else 
				(a_value = g_regex_error_define_repetion) or else 
				(a_value = g_regex_error_inconsistent_newline_options) or else 
				(a_value = g_regex_error_missing_back_reference))
		end


feature {ANY} -- Setters
	default_create, set_compile
		do
			value := g_regex_error_compile
		end

	set_optimize
		do
			value := g_regex_error_optimize
		end

	set_replace
		do
			value := g_regex_error_replace
		end

	set_match
		do
			value := g_regex_error_match
		end

	set_internal
		do
			value := g_regex_error_internal
		end

	set_stray_backslash
		do
			value := g_regex_error_stray_backslash
		end

	set_missing_control_char
		do
			value := g_regex_error_missing_control_char
		end

	set_unrecognized_escape
		do
			value := g_regex_error_unrecognized_escape
		end

	set_quantifiers_out_of_order
		do
			value := g_regex_error_quantifiers_out_of_order
		end

	set_quantifier_too_big
		do
			value := g_regex_error_quantifier_too_big
		end

	set_unterminated_character_class
		do
			value := g_regex_error_unterminated_character_class
		end

	set_invalid_escape_in_character_class
		do
			value := g_regex_error_invalid_escape_in_character_class
		end

	set_range_out_of_order
		do
			value := g_regex_error_range_out_of_order
		end

	set_nothing_to_repeat
		do
			value := g_regex_error_nothing_to_repeat
		end

	set_unrecognized_character
		do
			value := g_regex_error_unrecognized_character
		end

	set_posix_named_class_outside_class
		do
			value := g_regex_error_posix_named_class_outside_class
		end

	set_unmatched_parenthesis
		do
			value := g_regex_error_unmatched_parenthesis
		end

	set_inexistent_subpattern_reference
		do
			value := g_regex_error_inexistent_subpattern_reference
		end

	set_unterminated_comment
		do
			value := g_regex_error_unterminated_comment
		end

	set_expression_too_large
		do
			value := g_regex_error_expression_too_large
		end

	set_memory_error
		do
			value := g_regex_error_memory_error
		end

	set_variable_length_lookbehind
		do
			value := g_regex_error_variable_length_lookbehind
		end

	set_malformed_condition
		do
			value := g_regex_error_malformed_condition
		end

	set_too_many_conditional_branches
		do
			value := g_regex_error_too_many_conditional_branches
		end

	set_assertion_expected
		do
			value := g_regex_error_assertion_expected
		end

	set_unknown_posix_class_name
		do
			value := g_regex_error_unknown_posix_class_name
		end

	set_posix_collating_elements_not_supported
		do
			value := g_regex_error_posix_collating_elements_not_supported
		end

	set_hex_code_too_large
		do
			value := g_regex_error_hex_code_too_large
		end

	set_invalid_condition
		do
			value := g_regex_error_invalid_condition
		end

	set_single_byte_match_in_lookbehind
		do
			value := g_regex_error_single_byte_match_in_lookbehind
		end

	set_infinite_loop
		do
			value := g_regex_error_infinite_loop
		end

	set_missing_subpattern_name_terminator
		do
			value := g_regex_error_missing_subpattern_name_terminator
		end

	set_duplicate_subpattern_name
		do
			value := g_regex_error_duplicate_subpattern_name
		end

	set_malformed_property
		do
			value := g_regex_error_malformed_property
		end

	set_unknown_property
		do
			value := g_regex_error_unknown_property
		end

	set_subpattern_name_too_long
		do
			value := g_regex_error_subpattern_name_too_long
		end

	set_too_many_subpatterns
		do
			value := g_regex_error_too_many_subpatterns
		end

	set_invalid_octal_value
		do
			value := g_regex_error_invalid_octal_value
		end

	set_too_many_branches_in_define
		do
			value := g_regex_error_too_many_branches_in_define
		end

	set_define_repetion
		do
			value := g_regex_error_define_repetion
		end

	set_inconsistent_newline_options
		do
			value := g_regex_error_inconsistent_newline_options
		end

	set_missing_back_reference
		do
			value := g_regex_error_missing_back_reference
		end


feature {ANY} -- Queries
	is_compile: BOOLEAN
		do
			Result := (value=g_regex_error_compile)
		end

	is_optimize: BOOLEAN
		do
			Result := (value=g_regex_error_optimize)
		end

	is_replace: BOOLEAN
		do
			Result := (value=g_regex_error_replace)
		end

	is_match: BOOLEAN
		do
			Result := (value=g_regex_error_match)
		end

	is_internal: BOOLEAN
		do
			Result := (value=g_regex_error_internal)
		end

	is_stray_backslash: BOOLEAN
		do
			Result := (value=g_regex_error_stray_backslash)
		end

	is_missing_control_char: BOOLEAN
		do
			Result := (value=g_regex_error_missing_control_char)
		end

	is_unrecognized_escape: BOOLEAN
		do
			Result := (value=g_regex_error_unrecognized_escape)
		end

	is_quantifiers_out_of_order: BOOLEAN
		do
			Result := (value=g_regex_error_quantifiers_out_of_order)
		end

	is_quantifier_too_big: BOOLEAN
		do
			Result := (value=g_regex_error_quantifier_too_big)
		end

	is_unterminated_character_class: BOOLEAN
		do
			Result := (value=g_regex_error_unterminated_character_class)
		end

	is_invalid_escape_in_character_class: BOOLEAN
		do
			Result := (value=g_regex_error_invalid_escape_in_character_class)
		end

	is_range_out_of_order: BOOLEAN
		do
			Result := (value=g_regex_error_range_out_of_order)
		end

	is_nothing_to_repeat: BOOLEAN
		do
			Result := (value=g_regex_error_nothing_to_repeat)
		end

	is_unrecognized_character: BOOLEAN
		do
			Result := (value=g_regex_error_unrecognized_character)
		end

	is_posix_named_class_outside_class: BOOLEAN
		do
			Result := (value=g_regex_error_posix_named_class_outside_class)
		end

	is_unmatched_parenthesis: BOOLEAN
		do
			Result := (value=g_regex_error_unmatched_parenthesis)
		end

	is_inexistent_subpattern_reference: BOOLEAN
		do
			Result := (value=g_regex_error_inexistent_subpattern_reference)
		end

	is_unterminated_comment: BOOLEAN
		do
			Result := (value=g_regex_error_unterminated_comment)
		end

	is_expression_too_large: BOOLEAN
		do
			Result := (value=g_regex_error_expression_too_large)
		end

	is_memory_error: BOOLEAN
		do
			Result := (value=g_regex_error_memory_error)
		end

	is_variable_length_lookbehind: BOOLEAN
		do
			Result := (value=g_regex_error_variable_length_lookbehind)
		end

	is_malformed_condition: BOOLEAN
		do
			Result := (value=g_regex_error_malformed_condition)
		end

	is_too_many_conditional_branches: BOOLEAN
		do
			Result := (value=g_regex_error_too_many_conditional_branches)
		end

	is_assertion_expected: BOOLEAN
		do
			Result := (value=g_regex_error_assertion_expected)
		end

	is_unknown_posix_class_name: BOOLEAN
		do
			Result := (value=g_regex_error_unknown_posix_class_name)
		end

	is_posix_collating_elements_not_supported: BOOLEAN
		do
			Result := (value=g_regex_error_posix_collating_elements_not_supported)
		end

	is_hex_code_too_large: BOOLEAN
		do
			Result := (value=g_regex_error_hex_code_too_large)
		end

	is_invalid_condition: BOOLEAN
		do
			Result := (value=g_regex_error_invalid_condition)
		end

	is_single_byte_match_in_lookbehind: BOOLEAN
		do
			Result := (value=g_regex_error_single_byte_match_in_lookbehind)
		end

	is_infinite_loop: BOOLEAN
		do
			Result := (value=g_regex_error_infinite_loop)
		end

	is_missing_subpattern_name_terminator: BOOLEAN
		do
			Result := (value=g_regex_error_missing_subpattern_name_terminator)
		end

	is_duplicate_subpattern_name: BOOLEAN
		do
			Result := (value=g_regex_error_duplicate_subpattern_name)
		end

	is_malformed_property: BOOLEAN
		do
			Result := (value=g_regex_error_malformed_property)
		end

	is_unknown_property: BOOLEAN
		do
			Result := (value=g_regex_error_unknown_property)
		end

	is_subpattern_name_too_long: BOOLEAN
		do
			Result := (value=g_regex_error_subpattern_name_too_long)
		end

	is_too_many_subpatterns: BOOLEAN
		do
			Result := (value=g_regex_error_too_many_subpatterns)
		end

	is_invalid_octal_value: BOOLEAN
		do
			Result := (value=g_regex_error_invalid_octal_value)
		end

	is_too_many_branches_in_define: BOOLEAN
		do
			Result := (value=g_regex_error_too_many_branches_in_define)
		end

	is_define_repetion: BOOLEAN
		do
			Result := (value=g_regex_error_define_repetion)
		end

	is_inconsistent_newline_options: BOOLEAN
		do
			Result := (value=g_regex_error_inconsistent_newline_options)
		end

	is_missing_back_reference: BOOLEAN
		do
			Result := (value=g_regex_error_missing_back_reference)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_error_compile: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_COMPILE"
		end

	g_regex_error_optimize: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_OPTIMIZE"
		end

	g_regex_error_replace: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_REPLACE"
		end

	g_regex_error_match: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_MATCH"
		end

	g_regex_error_internal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_INTERNAL"
		end

	g_regex_error_stray_backslash: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_STRAY_BACKSLASH"
		end

	g_regex_error_missing_control_char: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_MISSING_CONTROL_CHAR"
		end

	g_regex_error_unrecognized_escape: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_UNRECOGNIZED_ESCAPE"
		end

	g_regex_error_quantifiers_out_of_order: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_QUANTIFIERS_OUT_OF_ORDER"
		end

	g_regex_error_quantifier_too_big: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_QUANTIFIER_TOO_BIG"
		end

	g_regex_error_unterminated_character_class: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_UNTERMINATED_CHARACTER_CLASS"
		end

	g_regex_error_invalid_escape_in_character_class: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_INVALID_ESCAPE_IN_CHARACTER_CLASS"
		end

	g_regex_error_range_out_of_order: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_RANGE_OUT_OF_ORDER"
		end

	g_regex_error_nothing_to_repeat: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_NOTHING_TO_REPEAT"
		end

	g_regex_error_unrecognized_character: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_UNRECOGNIZED_CHARACTER"
		end

	g_regex_error_posix_named_class_outside_class: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_POSIX_NAMED_CLASS_OUTSIDE_CLASS"
		end

	g_regex_error_unmatched_parenthesis: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_UNMATCHED_PARENTHESIS"
		end

	g_regex_error_inexistent_subpattern_reference: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_INEXISTENT_SUBPATTERN_REFERENCE"
		end

	g_regex_error_unterminated_comment: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_UNTERMINATED_COMMENT"
		end

	g_regex_error_expression_too_large: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_EXPRESSION_TOO_LARGE"
		end

	g_regex_error_memory_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_MEMORY_ERROR"
		end

	g_regex_error_variable_length_lookbehind: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND"
		end

	g_regex_error_malformed_condition: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_MALFORMED_CONDITION"
		end

	g_regex_error_too_many_conditional_branches: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_TOO_MANY_CONDITIONAL_BRANCHES"
		end

	g_regex_error_assertion_expected: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_ASSERTION_EXPECTED"
		end

	g_regex_error_unknown_posix_class_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_UNKNOWN_POSIX_CLASS_NAME"
		end

	g_regex_error_posix_collating_elements_not_supported: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED"
		end

	g_regex_error_hex_code_too_large: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_HEX_CODE_TOO_LARGE"
		end

	g_regex_error_invalid_condition: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_INVALID_CONDITION"
		end

	g_regex_error_single_byte_match_in_lookbehind: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_SINGLE_BYTE_MATCH_IN_LOOKBEHIND"
		end

	g_regex_error_infinite_loop: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_INFINITE_LOOP"
		end

	g_regex_error_missing_subpattern_name_terminator: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_MISSING_SUBPATTERN_NAME_TERMINATOR"
		end

	g_regex_error_duplicate_subpattern_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_DUPLICATE_SUBPATTERN_NAME"
		end

	g_regex_error_malformed_property: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_MALFORMED_PROPERTY"
		end

	g_regex_error_unknown_property: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_UNKNOWN_PROPERTY"
		end

	g_regex_error_subpattern_name_too_long: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_SUBPATTERN_NAME_TOO_LONG"
		end

	g_regex_error_too_many_subpatterns: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_TOO_MANY_SUBPATTERNS"
		end

	g_regex_error_invalid_octal_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_INVALID_OCTAL_VALUE"
		end

	g_regex_error_too_many_branches_in_define: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_TOO_MANY_BRANCHES_IN_DEFINE"
		end

	g_regex_error_define_repetion: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_DEFINE_REPETION"
		end

	g_regex_error_inconsistent_newline_options: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_INCONSISTENT_NEWLINE_OPTIONS"
		end

	g_regex_error_missing_back_reference: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ERROR_MISSING_BACK_REFERENCE"
		end


end

