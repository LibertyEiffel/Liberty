-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GREGEX_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_regex_error_assertion_expected_low_level)  or else
				(a_value = g_regex_error_backtracking_control_verb_argument_forbidden_low_level)  or else
				(a_value = g_regex_error_backtracking_control_verb_argument_required_low_level)  or else
				(a_value = g_regex_error_character_value_too_large_low_level)  or else
				(a_value = g_regex_error_compile_low_level)  or else
				(a_value = g_regex_error_define_repetion_low_level)  or else
				(a_value = g_regex_error_duplicate_subpattern_name_low_level)  or else
				(a_value = g_regex_error_expression_too_large_low_level)  or else
				(a_value = g_regex_error_extra_subpattern_name_low_level)  or else
				(a_value = g_regex_error_hex_code_too_large_low_level)  or else
				(a_value = g_regex_error_inconsistent_newline_options_low_level)  or else
				(a_value = g_regex_error_inexistent_subpattern_reference_low_level)  or else
				(a_value = g_regex_error_infinite_loop_low_level)  or else
				(a_value = g_regex_error_internal_low_level)  or else
				(a_value = g_regex_error_invalid_condition_low_level)  or else
				(a_value = g_regex_error_invalid_control_char_low_level)  or else
				(a_value = g_regex_error_invalid_data_character_low_level)  or else
				(a_value = g_regex_error_invalid_escape_in_character_class_low_level)  or else
				(a_value = g_regex_error_invalid_octal_value_low_level)  or else
				(a_value = g_regex_error_invalid_relative_reference_low_level)  or else
				(a_value = g_regex_error_malformed_condition_low_level)  or else
				(a_value = g_regex_error_malformed_property_low_level)  or else
				(a_value = g_regex_error_match_low_level)  or else
				(a_value = g_regex_error_memory_error_low_level)  or else
				(a_value = g_regex_error_missing_back_reference_low_level)  or else
				(a_value = g_regex_error_missing_control_char_low_level)  or else
				(a_value = g_regex_error_missing_digit_low_level)  or else
				(a_value = g_regex_error_missing_name_low_level)  or else
				(a_value = g_regex_error_missing_subpattern_name_low_level)  or else
				(a_value = g_regex_error_missing_subpattern_name_terminator_low_level)  or else
				(a_value = g_regex_error_name_too_long_low_level)  or else
				(a_value = g_regex_error_not_supported_in_class_low_level)  or else
				(a_value = g_regex_error_nothing_to_repeat_low_level)  or else
				(a_value = g_regex_error_number_too_big_low_level)  or else
				(a_value = g_regex_error_optimize_low_level)  or else
				(a_value = g_regex_error_posix_collating_elements_not_supported_low_level)  or else
				(a_value = g_regex_error_posix_named_class_outside_class_low_level)  or else
				(a_value = g_regex_error_quantifier_too_big_low_level)  or else
				(a_value = g_regex_error_quantifiers_out_of_order_low_level)  or else
				(a_value = g_regex_error_range_out_of_order_low_level)  or else
				(a_value = g_regex_error_replace_low_level)  or else
				(a_value = g_regex_error_single_byte_match_in_lookbehind_low_level)  or else
				(a_value = g_regex_error_stray_backslash_low_level)  or else
				(a_value = g_regex_error_subpattern_name_too_long_low_level)  or else
				(a_value = g_regex_error_too_many_branches_in_define_low_level)  or else
				(a_value = g_regex_error_too_many_conditional_branches_low_level)  or else
				(a_value = g_regex_error_too_many_forward_references_low_level)  or else
				(a_value = g_regex_error_too_many_subpatterns_low_level)  or else
				(a_value = g_regex_error_unknown_backtracking_control_verb_low_level)  or else
				(a_value = g_regex_error_unknown_posix_class_name_low_level)  or else
				(a_value = g_regex_error_unknown_property_low_level)  or else
				(a_value = g_regex_error_unmatched_parenthesis_low_level)  or else
				(a_value = g_regex_error_unrecognized_character_low_level)  or else
				(a_value = g_regex_error_unrecognized_escape_low_level)  or else
				(a_value = g_regex_error_unterminated_character_class_low_level)  or else
				(a_value = g_regex_error_unterminated_comment_low_level)  or else
				(a_value = g_regex_error_variable_length_lookbehind_low_level) )
		end

feature -- Setters
	default_create,
	set_g_regex_error_assertion_expected is
		do
			value := g_regex_error_assertion_expected_low_level
		end

	set_g_regex_error_backtracking_control_verb_argument_forbidden is
		do
			value := g_regex_error_backtracking_control_verb_argument_forbidden_low_level
		end

	set_g_regex_error_backtracking_control_verb_argument_required is
		do
			value := g_regex_error_backtracking_control_verb_argument_required_low_level
		end

	set_g_regex_error_character_value_too_large is
		do
			value := g_regex_error_character_value_too_large_low_level
		end

	set_g_regex_error_compile is
		do
			value := g_regex_error_compile_low_level
		end

	set_g_regex_error_define_repetion is
		do
			value := g_regex_error_define_repetion_low_level
		end

	set_g_regex_error_duplicate_subpattern_name is
		do
			value := g_regex_error_duplicate_subpattern_name_low_level
		end

	set_g_regex_error_expression_too_large is
		do
			value := g_regex_error_expression_too_large_low_level
		end

	set_g_regex_error_extra_subpattern_name is
		do
			value := g_regex_error_extra_subpattern_name_low_level
		end

	set_g_regex_error_hex_code_too_large is
		do
			value := g_regex_error_hex_code_too_large_low_level
		end

	set_g_regex_error_inconsistent_newline_options is
		do
			value := g_regex_error_inconsistent_newline_options_low_level
		end

	set_g_regex_error_inexistent_subpattern_reference is
		do
			value := g_regex_error_inexistent_subpattern_reference_low_level
		end

	set_g_regex_error_infinite_loop is
		do
			value := g_regex_error_infinite_loop_low_level
		end

	set_g_regex_error_internal is
		do
			value := g_regex_error_internal_low_level
		end

	set_g_regex_error_invalid_condition is
		do
			value := g_regex_error_invalid_condition_low_level
		end

	set_g_regex_error_invalid_control_char is
		do
			value := g_regex_error_invalid_control_char_low_level
		end

	set_g_regex_error_invalid_data_character is
		do
			value := g_regex_error_invalid_data_character_low_level
		end

	set_g_regex_error_invalid_escape_in_character_class is
		do
			value := g_regex_error_invalid_escape_in_character_class_low_level
		end

	set_g_regex_error_invalid_octal_value is
		do
			value := g_regex_error_invalid_octal_value_low_level
		end

	set_g_regex_error_invalid_relative_reference is
		do
			value := g_regex_error_invalid_relative_reference_low_level
		end

	set_g_regex_error_malformed_condition is
		do
			value := g_regex_error_malformed_condition_low_level
		end

	set_g_regex_error_malformed_property is
		do
			value := g_regex_error_malformed_property_low_level
		end

	set_g_regex_error_match is
		do
			value := g_regex_error_match_low_level
		end

	set_g_regex_error_memory_error is
		do
			value := g_regex_error_memory_error_low_level
		end

	set_g_regex_error_missing_back_reference is
		do
			value := g_regex_error_missing_back_reference_low_level
		end

	set_g_regex_error_missing_control_char is
		do
			value := g_regex_error_missing_control_char_low_level
		end

	set_g_regex_error_missing_digit is
		do
			value := g_regex_error_missing_digit_low_level
		end

	set_g_regex_error_missing_name is
		do
			value := g_regex_error_missing_name_low_level
		end

	set_g_regex_error_missing_subpattern_name is
		do
			value := g_regex_error_missing_subpattern_name_low_level
		end

	set_g_regex_error_missing_subpattern_name_terminator is
		do
			value := g_regex_error_missing_subpattern_name_terminator_low_level
		end

	set_g_regex_error_name_too_long is
		do
			value := g_regex_error_name_too_long_low_level
		end

	set_g_regex_error_not_supported_in_class is
		do
			value := g_regex_error_not_supported_in_class_low_level
		end

	set_g_regex_error_nothing_to_repeat is
		do
			value := g_regex_error_nothing_to_repeat_low_level
		end

	set_g_regex_error_number_too_big is
		do
			value := g_regex_error_number_too_big_low_level
		end

	set_g_regex_error_optimize is
		do
			value := g_regex_error_optimize_low_level
		end

	set_g_regex_error_posix_collating_elements_not_supported is
		do
			value := g_regex_error_posix_collating_elements_not_supported_low_level
		end

	set_g_regex_error_posix_named_class_outside_class is
		do
			value := g_regex_error_posix_named_class_outside_class_low_level
		end

	set_g_regex_error_quantifier_too_big is
		do
			value := g_regex_error_quantifier_too_big_low_level
		end

	set_g_regex_error_quantifiers_out_of_order is
		do
			value := g_regex_error_quantifiers_out_of_order_low_level
		end

	set_g_regex_error_range_out_of_order is
		do
			value := g_regex_error_range_out_of_order_low_level
		end

	set_g_regex_error_replace is
		do
			value := g_regex_error_replace_low_level
		end

	set_g_regex_error_single_byte_match_in_lookbehind is
		do
			value := g_regex_error_single_byte_match_in_lookbehind_low_level
		end

	set_g_regex_error_stray_backslash is
		do
			value := g_regex_error_stray_backslash_low_level
		end

	set_g_regex_error_subpattern_name_too_long is
		do
			value := g_regex_error_subpattern_name_too_long_low_level
		end

	set_g_regex_error_too_many_branches_in_define is
		do
			value := g_regex_error_too_many_branches_in_define_low_level
		end

	set_g_regex_error_too_many_conditional_branches is
		do
			value := g_regex_error_too_many_conditional_branches_low_level
		end

	set_g_regex_error_too_many_forward_references is
		do
			value := g_regex_error_too_many_forward_references_low_level
		end

	set_g_regex_error_too_many_subpatterns is
		do
			value := g_regex_error_too_many_subpatterns_low_level
		end

	set_g_regex_error_unknown_backtracking_control_verb is
		do
			value := g_regex_error_unknown_backtracking_control_verb_low_level
		end

	set_g_regex_error_unknown_posix_class_name is
		do
			value := g_regex_error_unknown_posix_class_name_low_level
		end

	set_g_regex_error_unknown_property is
		do
			value := g_regex_error_unknown_property_low_level
		end

	set_g_regex_error_unmatched_parenthesis is
		do
			value := g_regex_error_unmatched_parenthesis_low_level
		end

	set_g_regex_error_unrecognized_character is
		do
			value := g_regex_error_unrecognized_character_low_level
		end

	set_g_regex_error_unrecognized_escape is
		do
			value := g_regex_error_unrecognized_escape_low_level
		end

	set_g_regex_error_unterminated_character_class is
		do
			value := g_regex_error_unterminated_character_class_low_level
		end

	set_g_regex_error_unterminated_comment is
		do
			value := g_regex_error_unterminated_comment_low_level
		end

	set_g_regex_error_variable_length_lookbehind is
		do
			value := g_regex_error_variable_length_lookbehind_low_level
		end

feature -- Queries
	is_g_regex_error_assertion_expected: BOOLEAN is
		do
			Result := (value=g_regex_error_assertion_expected_low_level)
		end

	is_g_regex_error_backtracking_control_verb_argument_forbidden: BOOLEAN is
		do
			Result := (value=g_regex_error_backtracking_control_verb_argument_forbidden_low_level)
		end

	is_g_regex_error_backtracking_control_verb_argument_required: BOOLEAN is
		do
			Result := (value=g_regex_error_backtracking_control_verb_argument_required_low_level)
		end

	is_g_regex_error_character_value_too_large: BOOLEAN is
		do
			Result := (value=g_regex_error_character_value_too_large_low_level)
		end

	is_g_regex_error_compile: BOOLEAN is
		do
			Result := (value=g_regex_error_compile_low_level)
		end

	is_g_regex_error_define_repetion: BOOLEAN is
		do
			Result := (value=g_regex_error_define_repetion_low_level)
		end

	is_g_regex_error_duplicate_subpattern_name: BOOLEAN is
		do
			Result := (value=g_regex_error_duplicate_subpattern_name_low_level)
		end

	is_g_regex_error_expression_too_large: BOOLEAN is
		do
			Result := (value=g_regex_error_expression_too_large_low_level)
		end

	is_g_regex_error_extra_subpattern_name: BOOLEAN is
		do
			Result := (value=g_regex_error_extra_subpattern_name_low_level)
		end

	is_g_regex_error_hex_code_too_large: BOOLEAN is
		do
			Result := (value=g_regex_error_hex_code_too_large_low_level)
		end

	is_g_regex_error_inconsistent_newline_options: BOOLEAN is
		do
			Result := (value=g_regex_error_inconsistent_newline_options_low_level)
		end

	is_g_regex_error_inexistent_subpattern_reference: BOOLEAN is
		do
			Result := (value=g_regex_error_inexistent_subpattern_reference_low_level)
		end

	is_g_regex_error_infinite_loop: BOOLEAN is
		do
			Result := (value=g_regex_error_infinite_loop_low_level)
		end

	is_g_regex_error_internal: BOOLEAN is
		do
			Result := (value=g_regex_error_internal_low_level)
		end

	is_g_regex_error_invalid_condition: BOOLEAN is
		do
			Result := (value=g_regex_error_invalid_condition_low_level)
		end

	is_g_regex_error_invalid_control_char: BOOLEAN is
		do
			Result := (value=g_regex_error_invalid_control_char_low_level)
		end

	is_g_regex_error_invalid_data_character: BOOLEAN is
		do
			Result := (value=g_regex_error_invalid_data_character_low_level)
		end

	is_g_regex_error_invalid_escape_in_character_class: BOOLEAN is
		do
			Result := (value=g_regex_error_invalid_escape_in_character_class_low_level)
		end

	is_g_regex_error_invalid_octal_value: BOOLEAN is
		do
			Result := (value=g_regex_error_invalid_octal_value_low_level)
		end

	is_g_regex_error_invalid_relative_reference: BOOLEAN is
		do
			Result := (value=g_regex_error_invalid_relative_reference_low_level)
		end

	is_g_regex_error_malformed_condition: BOOLEAN is
		do
			Result := (value=g_regex_error_malformed_condition_low_level)
		end

	is_g_regex_error_malformed_property: BOOLEAN is
		do
			Result := (value=g_regex_error_malformed_property_low_level)
		end

	is_g_regex_error_match: BOOLEAN is
		do
			Result := (value=g_regex_error_match_low_level)
		end

	is_g_regex_error_memory_error: BOOLEAN is
		do
			Result := (value=g_regex_error_memory_error_low_level)
		end

	is_g_regex_error_missing_back_reference: BOOLEAN is
		do
			Result := (value=g_regex_error_missing_back_reference_low_level)
		end

	is_g_regex_error_missing_control_char: BOOLEAN is
		do
			Result := (value=g_regex_error_missing_control_char_low_level)
		end

	is_g_regex_error_missing_digit: BOOLEAN is
		do
			Result := (value=g_regex_error_missing_digit_low_level)
		end

	is_g_regex_error_missing_name: BOOLEAN is
		do
			Result := (value=g_regex_error_missing_name_low_level)
		end

	is_g_regex_error_missing_subpattern_name: BOOLEAN is
		do
			Result := (value=g_regex_error_missing_subpattern_name_low_level)
		end

	is_g_regex_error_missing_subpattern_name_terminator: BOOLEAN is
		do
			Result := (value=g_regex_error_missing_subpattern_name_terminator_low_level)
		end

	is_g_regex_error_name_too_long: BOOLEAN is
		do
			Result := (value=g_regex_error_name_too_long_low_level)
		end

	is_g_regex_error_not_supported_in_class: BOOLEAN is
		do
			Result := (value=g_regex_error_not_supported_in_class_low_level)
		end

	is_g_regex_error_nothing_to_repeat: BOOLEAN is
		do
			Result := (value=g_regex_error_nothing_to_repeat_low_level)
		end

	is_g_regex_error_number_too_big: BOOLEAN is
		do
			Result := (value=g_regex_error_number_too_big_low_level)
		end

	is_g_regex_error_optimize: BOOLEAN is
		do
			Result := (value=g_regex_error_optimize_low_level)
		end

	is_g_regex_error_posix_collating_elements_not_supported: BOOLEAN is
		do
			Result := (value=g_regex_error_posix_collating_elements_not_supported_low_level)
		end

	is_g_regex_error_posix_named_class_outside_class: BOOLEAN is
		do
			Result := (value=g_regex_error_posix_named_class_outside_class_low_level)
		end

	is_g_regex_error_quantifier_too_big: BOOLEAN is
		do
			Result := (value=g_regex_error_quantifier_too_big_low_level)
		end

	is_g_regex_error_quantifiers_out_of_order: BOOLEAN is
		do
			Result := (value=g_regex_error_quantifiers_out_of_order_low_level)
		end

	is_g_regex_error_range_out_of_order: BOOLEAN is
		do
			Result := (value=g_regex_error_range_out_of_order_low_level)
		end

	is_g_regex_error_replace: BOOLEAN is
		do
			Result := (value=g_regex_error_replace_low_level)
		end

	is_g_regex_error_single_byte_match_in_lookbehind: BOOLEAN is
		do
			Result := (value=g_regex_error_single_byte_match_in_lookbehind_low_level)
		end

	is_g_regex_error_stray_backslash: BOOLEAN is
		do
			Result := (value=g_regex_error_stray_backslash_low_level)
		end

	is_g_regex_error_subpattern_name_too_long: BOOLEAN is
		do
			Result := (value=g_regex_error_subpattern_name_too_long_low_level)
		end

	is_g_regex_error_too_many_branches_in_define: BOOLEAN is
		do
			Result := (value=g_regex_error_too_many_branches_in_define_low_level)
		end

	is_g_regex_error_too_many_conditional_branches: BOOLEAN is
		do
			Result := (value=g_regex_error_too_many_conditional_branches_low_level)
		end

	is_g_regex_error_too_many_forward_references: BOOLEAN is
		do
			Result := (value=g_regex_error_too_many_forward_references_low_level)
		end

	is_g_regex_error_too_many_subpatterns: BOOLEAN is
		do
			Result := (value=g_regex_error_too_many_subpatterns_low_level)
		end

	is_g_regex_error_unknown_backtracking_control_verb: BOOLEAN is
		do
			Result := (value=g_regex_error_unknown_backtracking_control_verb_low_level)
		end

	is_g_regex_error_unknown_posix_class_name: BOOLEAN is
		do
			Result := (value=g_regex_error_unknown_posix_class_name_low_level)
		end

	is_g_regex_error_unknown_property: BOOLEAN is
		do
			Result := (value=g_regex_error_unknown_property_low_level)
		end

	is_g_regex_error_unmatched_parenthesis: BOOLEAN is
		do
			Result := (value=g_regex_error_unmatched_parenthesis_low_level)
		end

	is_g_regex_error_unrecognized_character: BOOLEAN is
		do
			Result := (value=g_regex_error_unrecognized_character_low_level)
		end

	is_g_regex_error_unrecognized_escape: BOOLEAN is
		do
			Result := (value=g_regex_error_unrecognized_escape_low_level)
		end

	is_g_regex_error_unterminated_character_class: BOOLEAN is
		do
			Result := (value=g_regex_error_unterminated_character_class_low_level)
		end

	is_g_regex_error_unterminated_comment: BOOLEAN is
		do
			Result := (value=g_regex_error_unterminated_comment_low_level)
		end

	is_g_regex_error_variable_length_lookbehind: BOOLEAN is
		do
			Result := (value=g_regex_error_variable_length_lookbehind_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_error_assertion_expected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_ASSERTION_EXPECTED"
 			}"
 		end

	g_regex_error_backtracking_control_verb_argument_forbidden_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_FORBIDDEN"
 			}"
 		end

	g_regex_error_backtracking_control_verb_argument_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_REQUIRED"
 			}"
 		end

	g_regex_error_character_value_too_large_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_CHARACTER_VALUE_TOO_LARGE"
 			}"
 		end

	g_regex_error_compile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_COMPILE"
 			}"
 		end

	g_regex_error_define_repetion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_DEFINE_REPETION"
 			}"
 		end

	g_regex_error_duplicate_subpattern_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_DUPLICATE_SUBPATTERN_NAME"
 			}"
 		end

	g_regex_error_expression_too_large_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_EXPRESSION_TOO_LARGE"
 			}"
 		end

	g_regex_error_extra_subpattern_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_EXTRA_SUBPATTERN_NAME"
 			}"
 		end

	g_regex_error_hex_code_too_large_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_HEX_CODE_TOO_LARGE"
 			}"
 		end

	g_regex_error_inconsistent_newline_options_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INCONSISTENT_NEWLINE_OPTIONS"
 			}"
 		end

	g_regex_error_inexistent_subpattern_reference_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INEXISTENT_SUBPATTERN_REFERENCE"
 			}"
 		end

	g_regex_error_infinite_loop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INFINITE_LOOP"
 			}"
 		end

	g_regex_error_internal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INTERNAL"
 			}"
 		end

	g_regex_error_invalid_condition_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_CONDITION"
 			}"
 		end

	g_regex_error_invalid_control_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_CONTROL_CHAR"
 			}"
 		end

	g_regex_error_invalid_data_character_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_DATA_CHARACTER"
 			}"
 		end

	g_regex_error_invalid_escape_in_character_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_ESCAPE_IN_CHARACTER_CLASS"
 			}"
 		end

	g_regex_error_invalid_octal_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_OCTAL_VALUE"
 			}"
 		end

	g_regex_error_invalid_relative_reference_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_INVALID_RELATIVE_REFERENCE"
 			}"
 		end

	g_regex_error_malformed_condition_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MALFORMED_CONDITION"
 			}"
 		end

	g_regex_error_malformed_property_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MALFORMED_PROPERTY"
 			}"
 		end

	g_regex_error_match_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MATCH"
 			}"
 		end

	g_regex_error_memory_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MEMORY_ERROR"
 			}"
 		end

	g_regex_error_missing_back_reference_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_BACK_REFERENCE"
 			}"
 		end

	g_regex_error_missing_control_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_CONTROL_CHAR"
 			}"
 		end

	g_regex_error_missing_digit_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_DIGIT"
 			}"
 		end

	g_regex_error_missing_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_NAME"
 			}"
 		end

	g_regex_error_missing_subpattern_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_SUBPATTERN_NAME"
 			}"
 		end

	g_regex_error_missing_subpattern_name_terminator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_MISSING_SUBPATTERN_NAME_TERMINATOR"
 			}"
 		end

	g_regex_error_name_too_long_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_NAME_TOO_LONG"
 			}"
 		end

	g_regex_error_not_supported_in_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_NOT_SUPPORTED_IN_CLASS"
 			}"
 		end

	g_regex_error_nothing_to_repeat_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_NOTHING_TO_REPEAT"
 			}"
 		end

	g_regex_error_number_too_big_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_NUMBER_TOO_BIG"
 			}"
 		end

	g_regex_error_optimize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_OPTIMIZE"
 			}"
 		end

	g_regex_error_posix_collating_elements_not_supported_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED"
 			}"
 		end

	g_regex_error_posix_named_class_outside_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_POSIX_NAMED_CLASS_OUTSIDE_CLASS"
 			}"
 		end

	g_regex_error_quantifier_too_big_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_QUANTIFIER_TOO_BIG"
 			}"
 		end

	g_regex_error_quantifiers_out_of_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_QUANTIFIERS_OUT_OF_ORDER"
 			}"
 		end

	g_regex_error_range_out_of_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_RANGE_OUT_OF_ORDER"
 			}"
 		end

	g_regex_error_replace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_REPLACE"
 			}"
 		end

	g_regex_error_single_byte_match_in_lookbehind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_SINGLE_BYTE_MATCH_IN_LOOKBEHIND"
 			}"
 		end

	g_regex_error_stray_backslash_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_STRAY_BACKSLASH"
 			}"
 		end

	g_regex_error_subpattern_name_too_long_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_SUBPATTERN_NAME_TOO_LONG"
 			}"
 		end

	g_regex_error_too_many_branches_in_define_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_BRANCHES_IN_DEFINE"
 			}"
 		end

	g_regex_error_too_many_conditional_branches_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_CONDITIONAL_BRANCHES"
 			}"
 		end

	g_regex_error_too_many_forward_references_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_FORWARD_REFERENCES"
 			}"
 		end

	g_regex_error_too_many_subpatterns_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_TOO_MANY_SUBPATTERNS"
 			}"
 		end

	g_regex_error_unknown_backtracking_control_verb_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNKNOWN_BACKTRACKING_CONTROL_VERB"
 			}"
 		end

	g_regex_error_unknown_posix_class_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNKNOWN_POSIX_CLASS_NAME"
 			}"
 		end

	g_regex_error_unknown_property_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNKNOWN_PROPERTY"
 			}"
 		end

	g_regex_error_unmatched_parenthesis_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNMATCHED_PARENTHESIS"
 			}"
 		end

	g_regex_error_unrecognized_character_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNRECOGNIZED_CHARACTER"
 			}"
 		end

	g_regex_error_unrecognized_escape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNRECOGNIZED_ESCAPE"
 			}"
 		end

	g_regex_error_unterminated_character_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNTERMINATED_CHARACTER_CLASS"
 			}"
 		end

	g_regex_error_unterminated_comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_UNTERMINATED_COMMENT"
 			}"
 		end

	g_regex_error_variable_length_lookbehind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND"
 			}"
 		end


end -- class GREGEX_ERROR_ENUM
