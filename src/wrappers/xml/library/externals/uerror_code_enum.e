-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class UERROR_CODE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = ambiguous_alias_warning_low_level)  or else
				(a_value = argument_type_mismatch_low_level)  or else
				(a_value = bad_variable_definition_low_level)  or else
				(a_value = brk_assign_error_low_level)  or else
				(a_value = brk_error_limit_low_level)  or else
				(a_value = brk_error_start_low_level)  or else
				(a_value = brk_hex_digits_expected_low_level)  or else
				(a_value = brk_init_error_low_level)  or else
				(a_value = brk_internal_error_low_level)  or else
				(a_value = brk_malformed_rule_tag_low_level)  or else
				(a_value = brk_mismatched_paren_low_level)  or else
				(a_value = brk_new_line_in_quoted_string_low_level)  or else
				(a_value = brk_rule_empty_set_low_level)  or else
				(a_value = brk_rule_syntax_low_level)  or else
				(a_value = brk_semicolon_expected_low_level)  or else
				(a_value = brk_unclosed_set_low_level)  or else
				(a_value = brk_undefined_variable_low_level)  or else
				(a_value = brk_unrecognized_option_low_level)  or else
				(a_value = brk_variable_redfinition_low_level)  or else
				(a_value = buffer_overflow_error_low_level)  or else
				(a_value = ce_not_found_error_low_level)  or else
				(a_value = collator_version_mismatch_low_level)  or else
				(a_value = decimal_number_syntax_error_low_level)  or else
				(a_value = default_keyword_missing_low_level)  or else
				(a_value = different_uca_version_low_level)  or else
				(a_value = duplicate_keyword_low_level)  or else
				(a_value = enum_out_of_sync_error_low_level)  or else
				(a_value = error_limit_low_level)  or else
				(a_value = error_warning_limit_low_level)  or else
				(a_value = error_warning_start_low_level)  or else
				(a_value = file_access_error_low_level)  or else
				(a_value = fmt_parse_error_limit_low_level)  or else
				(a_value = fmt_parse_error_start_low_level)  or else
				(a_value = format_inexact_error_low_level)  or else
				(a_value = idna_ace_prefix_error_low_level)  or else
				(a_value = idna_check_bidi_error_low_level)  or else
				(a_value = idna_domain_name_too_long_error_low_level)  or else
				(a_value = idna_error_limit_low_level)  or else
				(a_value = idna_error_start_low_level)  or else
				(a_value = idna_label_too_long_error_low_level)  or else
				(a_value = idna_prohibited_error_low_level)  or else
				(a_value = idna_std3_ascii_rules_error_low_level)  or else
				(a_value = idna_unassigned_error_low_level)  or else
				(a_value = idna_verification_error_low_level)  or else
				(a_value = idna_zero_length_label_error_low_level)  or else
				(a_value = illegal_argument_error_low_level)  or else
				(a_value = illegal_char_found_low_level)  or else
				(a_value = illegal_char_in_segment_low_level)  or else
				(a_value = illegal_character_low_level)  or else
				(a_value = illegal_escape_sequence_low_level)  or else
				(a_value = illegal_pad_position_low_level)  or else
				(a_value = index_outofbounds_error_low_level)  or else
				(a_value = internal_program_error_low_level)  or else
				(a_value = internal_transliterator_error_low_level)  or else
				(a_value = invalid_char_found_low_level)  or else
				(a_value = invalid_format_error_low_level)  or else
				(a_value = invalid_function_low_level)  or else
				(a_value = invalid_id_low_level)  or else
				(a_value = invalid_property_pattern_low_level)  or else
				(a_value = invalid_rbt_syntax_low_level)  or else
				(a_value = invalid_state_error_low_level)  or else
				(a_value = invalid_table_file_low_level)  or else
				(a_value = invalid_table_format_low_level)  or else
				(a_value = invariant_conversion_error_low_level)  or else
				(a_value = malformed_exponential_pattern_low_level)  or else
				(a_value = malformed_pragma_low_level)  or else
				(a_value = malformed_rule_low_level)  or else
				(a_value = malformed_set_low_level)  or else
				(a_value = malformed_symbol_reference_low_level)  or else
				(a_value = malformed_unicode_escape_low_level)  or else
				(a_value = malformed_variable_definition_low_level)  or else
				(a_value = malformed_variable_reference_low_level)  or else
				(a_value = memory_allocation_error_low_level)  or else
				(a_value = message_parse_error_low_level)  or else
				(a_value = mismatched_segment_delimiters_low_level)  or else
				(a_value = misplaced_anchor_start_low_level)  or else
				(a_value = misplaced_compound_filter_low_level)  or else
				(a_value = misplaced_cursor_offset_low_level)  or else
				(a_value = misplaced_quantifier_low_level)  or else
				(a_value = missing_operator_low_level)  or else
				(a_value = missing_resource_error_low_level)  or else
				(a_value = missing_segment_close_low_level)  or else
				(a_value = multiple_ante_contexts_low_level)  or else
				(a_value = multiple_compound_filters_low_level)  or else
				(a_value = multiple_cursors_low_level)  or else
				(a_value = multiple_decimal_separators_low_level)  or else
				(a_value = multiple_decimal_seperators_low_level)  or else
				(a_value = multiple_exponential_symbols_low_level)  or else
				(a_value = multiple_pad_specifiers_low_level)  or else
				(a_value = multiple_percent_symbols_low_level)  or else
				(a_value = multiple_permill_symbols_low_level)  or else
				(a_value = multiple_post_contexts_low_level)  or else
				(a_value = no_space_available_low_level)  or else
				(a_value = no_write_permission_low_level)  or else
				(a_value = parse_error_low_level)  or else
				(a_value = parse_error_limit_low_level)  or else
				(a_value = parse_error_start_low_level)  or else
				(a_value = pattern_syntax_error_low_level)  or else
				(a_value = plugin_changed_level_warning_low_level)  or else
				(a_value = plugin_didnt_set_level_low_level)  or else
				(a_value = plugin_error_limit_low_level)  or else
				(a_value = plugin_error_start_low_level)  or else
				(a_value = plugin_too_high_low_level)  or else
				(a_value = primary_too_long_error_low_level)  or else
				(a_value = regex_bad_escape_sequence_low_level)  or else
				(a_value = regex_bad_interval_low_level)  or else
				(a_value = regex_error_limit_low_level)  or else
				(a_value = regex_error_start_low_level)  or else
				(a_value = regex_internal_error_low_level)  or else
				(a_value = regex_invalid_back_ref_low_level)  or else
				(a_value = regex_invalid_capture_group_name_low_level)  or else
				(a_value = regex_invalid_flag_low_level)  or else
				(a_value = regex_invalid_range_low_level)  or else
				(a_value = regex_invalid_state_low_level)  or else
				(a_value = regex_look_behind_limit_low_level)  or else
				(a_value = regex_max_lt_min_low_level)  or else
				(a_value = regex_mismatched_paren_low_level)  or else
				(a_value = regex_missing_close_bracket_low_level)  or else
				(a_value = regex_number_too_big_low_level)  or else
				(a_value = regex_octal_too_big_low_level)  or else
				(a_value = regex_pattern_too_big_low_level)  or else
				(a_value = regex_property_syntax_low_level)  or else
				(a_value = regex_rule_syntax_low_level)  or else
				(a_value = regex_set_contains_string_low_level)  or else
				(a_value = regex_stack_overflow_low_level)  or else
				(a_value = regex_stopped_by_caller_low_level)  or else
				(a_value = regex_time_out_low_level)  or else
				(a_value = regex_unimplemented_low_level)  or else
				(a_value = resource_type_mismatch_low_level)  or else
				(a_value = rule_mask_error_low_level)  or else
				(a_value = safeclone_allocated_warning_low_level)  or else
				(a_value = sort_key_too_short_warning_low_level)  or else
				(a_value = standard_error_limit_low_level)  or else
				(a_value = state_old_warning_low_level)  or else
				(a_value = state_too_old_error_low_level)  or else
				(a_value = string_not_terminated_warning_low_level)  or else
				(a_value = stringprep_check_bidi_error_low_level)  or else
				(a_value = stringprep_prohibited_error_low_level)  or else
				(a_value = stringprep_unassigned_error_low_level)  or else
				(a_value = too_many_aliases_error_low_level)  or else
				(a_value = trailing_backslash_low_level)  or else
				(a_value = truncated_char_found_low_level)  or else
				(a_value = unclosed_segment_low_level)  or else
				(a_value = undefined_keyword_low_level)  or else
				(a_value = undefined_segment_reference_low_level)  or else
				(a_value = undefined_variable_low_level)  or else
				(a_value = unexpected_token_low_level)  or else
				(a_value = unmatched_braces_low_level)  or else
				(a_value = unquoted_special_low_level)  or else
				(a_value = unsupported_attribute_low_level)  or else
				(a_value = unsupported_error_low_level)  or else
				(a_value = unsupported_escape_sequence_low_level)  or else
				(a_value = unsupported_property_low_level)  or else
				(a_value = unterminated_quote_low_level)  or else
				(a_value = useless_collator_error_low_level)  or else
				(a_value = using_default_warning_low_level)  or else
				(a_value = using_fallback_warning_low_level)  or else
				(a_value = variable_range_exhausted_low_level)  or else
				(a_value = variable_range_overlap_low_level)  or else
				(a_value = zero_error_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_ambiguous_alias_warning
               do
                       value := ambiguous_alias_warning_low_level
               end

	set_argument_type_mismatch
               do
                       value := argument_type_mismatch_low_level
               end

	set_bad_variable_definition
               do
                       value := bad_variable_definition_low_level
               end

	set_brk_assign_error
               do
                       value := brk_assign_error_low_level
               end

	set_brk_error_limit
               do
                       value := brk_error_limit_low_level
               end

	set_brk_error_start
               do
                       value := brk_error_start_low_level
               end

	set_brk_hex_digits_expected
               do
                       value := brk_hex_digits_expected_low_level
               end

	set_brk_init_error
               do
                       value := brk_init_error_low_level
               end

	set_brk_internal_error
               do
                       value := brk_internal_error_low_level
               end

	set_brk_malformed_rule_tag
               do
                       value := brk_malformed_rule_tag_low_level
               end

	set_brk_mismatched_paren
               do
                       value := brk_mismatched_paren_low_level
               end

	set_brk_new_line_in_quoted_string
               do
                       value := brk_new_line_in_quoted_string_low_level
               end

	set_brk_rule_empty_set
               do
                       value := brk_rule_empty_set_low_level
               end

	set_brk_rule_syntax
               do
                       value := brk_rule_syntax_low_level
               end

	set_brk_semicolon_expected
               do
                       value := brk_semicolon_expected_low_level
               end

	set_brk_unclosed_set
               do
                       value := brk_unclosed_set_low_level
               end

	set_brk_undefined_variable
               do
                       value := brk_undefined_variable_low_level
               end

	set_brk_unrecognized_option
               do
                       value := brk_unrecognized_option_low_level
               end

	set_brk_variable_redfinition
               do
                       value := brk_variable_redfinition_low_level
               end

	set_buffer_overflow_error
               do
                       value := buffer_overflow_error_low_level
               end

	set_ce_not_found_error
               do
                       value := ce_not_found_error_low_level
               end

	set_collator_version_mismatch
               do
                       value := collator_version_mismatch_low_level
               end

	set_decimal_number_syntax_error
               do
                       value := decimal_number_syntax_error_low_level
               end

	set_default_keyword_missing
               do
                       value := default_keyword_missing_low_level
               end

	set_different_uca_version
               do
                       value := different_uca_version_low_level
               end

	set_duplicate_keyword
               do
                       value := duplicate_keyword_low_level
               end

	set_enum_out_of_sync_error
               do
                       value := enum_out_of_sync_error_low_level
               end

	set_error_limit
               do
                       value := error_limit_low_level
               end

	set_error_warning_limit
               do
                       value := error_warning_limit_low_level
               end

	set_error_warning_start
               do
                       value := error_warning_start_low_level
               end

	set_file_access_error
               do
                       value := file_access_error_low_level
               end

	set_fmt_parse_error_limit
               do
                       value := fmt_parse_error_limit_low_level
               end

	set_fmt_parse_error_start
               do
                       value := fmt_parse_error_start_low_level
               end

	set_format_inexact_error
               do
                       value := format_inexact_error_low_level
               end

	set_idna_ace_prefix_error
               do
                       value := idna_ace_prefix_error_low_level
               end

	set_idna_check_bidi_error
               do
                       value := idna_check_bidi_error_low_level
               end

	set_idna_domain_name_too_long_error
               do
                       value := idna_domain_name_too_long_error_low_level
               end

	set_idna_error_limit
               do
                       value := idna_error_limit_low_level
               end

	set_idna_error_start
               do
                       value := idna_error_start_low_level
               end

	set_idna_label_too_long_error
               do
                       value := idna_label_too_long_error_low_level
               end

	set_idna_prohibited_error
               do
                       value := idna_prohibited_error_low_level
               end

	set_idna_std3_ascii_rules_error
               do
                       value := idna_std3_ascii_rules_error_low_level
               end

	set_idna_unassigned_error
               do
                       value := idna_unassigned_error_low_level
               end

	set_idna_verification_error
               do
                       value := idna_verification_error_low_level
               end

	set_idna_zero_length_label_error
               do
                       value := idna_zero_length_label_error_low_level
               end

	set_illegal_argument_error
               do
                       value := illegal_argument_error_low_level
               end

	set_illegal_char_found
               do
                       value := illegal_char_found_low_level
               end

	set_illegal_char_in_segment
               do
                       value := illegal_char_in_segment_low_level
               end

	set_illegal_character
               do
                       value := illegal_character_low_level
               end

	set_illegal_escape_sequence
               do
                       value := illegal_escape_sequence_low_level
               end

	set_illegal_pad_position
               do
                       value := illegal_pad_position_low_level
               end

	set_index_outofbounds_error
               do
                       value := index_outofbounds_error_low_level
               end

	set_internal_program_error
               do
                       value := internal_program_error_low_level
               end

	set_internal_transliterator_error
               do
                       value := internal_transliterator_error_low_level
               end

	set_invalid_char_found
               do
                       value := invalid_char_found_low_level
               end

	set_invalid_format_error
               do
                       value := invalid_format_error_low_level
               end

	set_invalid_function
               do
                       value := invalid_function_low_level
               end

	set_invalid_id
               do
                       value := invalid_id_low_level
               end

	set_invalid_property_pattern
               do
                       value := invalid_property_pattern_low_level
               end

	set_invalid_rbt_syntax
               do
                       value := invalid_rbt_syntax_low_level
               end

	set_invalid_state_error
               do
                       value := invalid_state_error_low_level
               end

	set_invalid_table_file
               do
                       value := invalid_table_file_low_level
               end

	set_invalid_table_format
               do
                       value := invalid_table_format_low_level
               end

	set_invariant_conversion_error
               do
                       value := invariant_conversion_error_low_level
               end

	set_malformed_exponential_pattern
               do
                       value := malformed_exponential_pattern_low_level
               end

	set_malformed_pragma
               do
                       value := malformed_pragma_low_level
               end

	set_malformed_rule
               do
                       value := malformed_rule_low_level
               end

	set_malformed_set
               do
                       value := malformed_set_low_level
               end

	set_malformed_symbol_reference
               do
                       value := malformed_symbol_reference_low_level
               end

	set_malformed_unicode_escape
               do
                       value := malformed_unicode_escape_low_level
               end

	set_malformed_variable_definition
               do
                       value := malformed_variable_definition_low_level
               end

	set_malformed_variable_reference
               do
                       value := malformed_variable_reference_low_level
               end

	set_memory_allocation_error
               do
                       value := memory_allocation_error_low_level
               end

	set_message_parse_error
               do
                       value := message_parse_error_low_level
               end

	set_mismatched_segment_delimiters
               do
                       value := mismatched_segment_delimiters_low_level
               end

	set_misplaced_anchor_start
               do
                       value := misplaced_anchor_start_low_level
               end

	set_misplaced_compound_filter
               do
                       value := misplaced_compound_filter_low_level
               end

	set_misplaced_cursor_offset
               do
                       value := misplaced_cursor_offset_low_level
               end

	set_misplaced_quantifier
               do
                       value := misplaced_quantifier_low_level
               end

	set_missing_operator
               do
                       value := missing_operator_low_level
               end

	set_missing_resource_error
               do
                       value := missing_resource_error_low_level
               end

	set_missing_segment_close
               do
                       value := missing_segment_close_low_level
               end

	set_multiple_ante_contexts
               do
                       value := multiple_ante_contexts_low_level
               end

	set_multiple_compound_filters
               do
                       value := multiple_compound_filters_low_level
               end

	set_multiple_cursors
               do
                       value := multiple_cursors_low_level
               end

	set_multiple_decimal_separators
               do
                       value := multiple_decimal_separators_low_level
               end

	set_multiple_decimal_seperators
               do
                       value := multiple_decimal_seperators_low_level
               end

	set_multiple_exponential_symbols
               do
                       value := multiple_exponential_symbols_low_level
               end

	set_multiple_pad_specifiers
               do
                       value := multiple_pad_specifiers_low_level
               end

	set_multiple_percent_symbols
               do
                       value := multiple_percent_symbols_low_level
               end

	set_multiple_permill_symbols
               do
                       value := multiple_permill_symbols_low_level
               end

	set_multiple_post_contexts
               do
                       value := multiple_post_contexts_low_level
               end

	set_no_space_available
               do
                       value := no_space_available_low_level
               end

	set_no_write_permission
               do
                       value := no_write_permission_low_level
               end

	set_parse_error
               do
                       value := parse_error_low_level
               end

	set_parse_error_limit
               do
                       value := parse_error_limit_low_level
               end

	set_parse_error_start
               do
                       value := parse_error_start_low_level
               end

	set_pattern_syntax_error
               do
                       value := pattern_syntax_error_low_level
               end

	set_plugin_changed_level_warning
               do
                       value := plugin_changed_level_warning_low_level
               end

	set_plugin_didnt_set_level
               do
                       value := plugin_didnt_set_level_low_level
               end

	set_plugin_error_limit
               do
                       value := plugin_error_limit_low_level
               end

	set_plugin_error_start
               do
                       value := plugin_error_start_low_level
               end

	set_plugin_too_high
               do
                       value := plugin_too_high_low_level
               end

	set_primary_too_long_error
               do
                       value := primary_too_long_error_low_level
               end

	set_regex_bad_escape_sequence
               do
                       value := regex_bad_escape_sequence_low_level
               end

	set_regex_bad_interval
               do
                       value := regex_bad_interval_low_level
               end

	set_regex_error_limit
               do
                       value := regex_error_limit_low_level
               end

	set_regex_error_start
               do
                       value := regex_error_start_low_level
               end

	set_regex_internal_error
               do
                       value := regex_internal_error_low_level
               end

	set_regex_invalid_back_ref
               do
                       value := regex_invalid_back_ref_low_level
               end

	set_regex_invalid_capture_group_name
               do
                       value := regex_invalid_capture_group_name_low_level
               end

	set_regex_invalid_flag
               do
                       value := regex_invalid_flag_low_level
               end

	set_regex_invalid_range
               do
                       value := regex_invalid_range_low_level
               end

	set_regex_invalid_state
               do
                       value := regex_invalid_state_low_level
               end

	set_regex_look_behind_limit
               do
                       value := regex_look_behind_limit_low_level
               end

	set_regex_max_lt_min
               do
                       value := regex_max_lt_min_low_level
               end

	set_regex_mismatched_paren
               do
                       value := regex_mismatched_paren_low_level
               end

	set_regex_missing_close_bracket
               do
                       value := regex_missing_close_bracket_low_level
               end

	set_regex_number_too_big
               do
                       value := regex_number_too_big_low_level
               end

	set_regex_octal_too_big
               do
                       value := regex_octal_too_big_low_level
               end

	set_regex_pattern_too_big
               do
                       value := regex_pattern_too_big_low_level
               end

	set_regex_property_syntax
               do
                       value := regex_property_syntax_low_level
               end

	set_regex_rule_syntax
               do
                       value := regex_rule_syntax_low_level
               end

	set_regex_set_contains_string
               do
                       value := regex_set_contains_string_low_level
               end

	set_regex_stack_overflow
               do
                       value := regex_stack_overflow_low_level
               end

	set_regex_stopped_by_caller
               do
                       value := regex_stopped_by_caller_low_level
               end

	set_regex_time_out
               do
                       value := regex_time_out_low_level
               end

	set_regex_unimplemented
               do
                       value := regex_unimplemented_low_level
               end

	set_resource_type_mismatch
               do
                       value := resource_type_mismatch_low_level
               end

	set_rule_mask_error
               do
                       value := rule_mask_error_low_level
               end

	set_safeclone_allocated_warning
               do
                       value := safeclone_allocated_warning_low_level
               end

	set_sort_key_too_short_warning
               do
                       value := sort_key_too_short_warning_low_level
               end

	set_standard_error_limit
               do
                       value := standard_error_limit_low_level
               end

	set_state_old_warning
               do
                       value := state_old_warning_low_level
               end

	set_state_too_old_error
               do
                       value := state_too_old_error_low_level
               end

	set_string_not_terminated_warning
               do
                       value := string_not_terminated_warning_low_level
               end

	set_stringprep_check_bidi_error
               do
                       value := stringprep_check_bidi_error_low_level
               end

	set_stringprep_prohibited_error
               do
                       value := stringprep_prohibited_error_low_level
               end

	set_stringprep_unassigned_error
               do
                       value := stringprep_unassigned_error_low_level
               end

	set_too_many_aliases_error
               do
                       value := too_many_aliases_error_low_level
               end

	set_trailing_backslash
               do
                       value := trailing_backslash_low_level
               end

	set_truncated_char_found
               do
                       value := truncated_char_found_low_level
               end

	set_unclosed_segment
               do
                       value := unclosed_segment_low_level
               end

	set_undefined_keyword
               do
                       value := undefined_keyword_low_level
               end

	set_undefined_segment_reference
               do
                       value := undefined_segment_reference_low_level
               end

	set_undefined_variable
               do
                       value := undefined_variable_low_level
               end

	set_unexpected_token
               do
                       value := unexpected_token_low_level
               end

	set_unmatched_braces
               do
                       value := unmatched_braces_low_level
               end

	set_unquoted_special
               do
                       value := unquoted_special_low_level
               end

	set_unsupported_attribute
               do
                       value := unsupported_attribute_low_level
               end

	set_unsupported_error
               do
                       value := unsupported_error_low_level
               end

	set_unsupported_escape_sequence
               do
                       value := unsupported_escape_sequence_low_level
               end

	set_unsupported_property
               do
                       value := unsupported_property_low_level
               end

	set_unterminated_quote
               do
                       value := unterminated_quote_low_level
               end

	set_useless_collator_error
               do
                       value := useless_collator_error_low_level
               end

	set_using_default_warning
               do
                       value := using_default_warning_low_level
               end

	set_using_fallback_warning
               do
                       value := using_fallback_warning_low_level
               end

	set_variable_range_exhausted
               do
                       value := variable_range_exhausted_low_level
               end

	set_variable_range_overlap
               do
                       value := variable_range_overlap_low_level
               end

	set_zero_error
               do
                       value := zero_error_low_level
               end

feature {ANY} -- Queries
       is_ambiguous_alias_warning: BOOLEAN
               do
                       Result := (value=ambiguous_alias_warning_low_level)
               end

       is_argument_type_mismatch: BOOLEAN
               do
                       Result := (value=argument_type_mismatch_low_level)
               end

       is_bad_variable_definition: BOOLEAN
               do
                       Result := (value=bad_variable_definition_low_level)
               end

       is_brk_assign_error: BOOLEAN
               do
                       Result := (value=brk_assign_error_low_level)
               end

       is_brk_error_limit: BOOLEAN
               do
                       Result := (value=brk_error_limit_low_level)
               end

       is_brk_error_start: BOOLEAN
               do
                       Result := (value=brk_error_start_low_level)
               end

       is_brk_hex_digits_expected: BOOLEAN
               do
                       Result := (value=brk_hex_digits_expected_low_level)
               end

       is_brk_init_error: BOOLEAN
               do
                       Result := (value=brk_init_error_low_level)
               end

       is_brk_internal_error: BOOLEAN
               do
                       Result := (value=brk_internal_error_low_level)
               end

       is_brk_malformed_rule_tag: BOOLEAN
               do
                       Result := (value=brk_malformed_rule_tag_low_level)
               end

       is_brk_mismatched_paren: BOOLEAN
               do
                       Result := (value=brk_mismatched_paren_low_level)
               end

       is_brk_new_line_in_quoted_string: BOOLEAN
               do
                       Result := (value=brk_new_line_in_quoted_string_low_level)
               end

       is_brk_rule_empty_set: BOOLEAN
               do
                       Result := (value=brk_rule_empty_set_low_level)
               end

       is_brk_rule_syntax: BOOLEAN
               do
                       Result := (value=brk_rule_syntax_low_level)
               end

       is_brk_semicolon_expected: BOOLEAN
               do
                       Result := (value=brk_semicolon_expected_low_level)
               end

       is_brk_unclosed_set: BOOLEAN
               do
                       Result := (value=brk_unclosed_set_low_level)
               end

       is_brk_undefined_variable: BOOLEAN
               do
                       Result := (value=brk_undefined_variable_low_level)
               end

       is_brk_unrecognized_option: BOOLEAN
               do
                       Result := (value=brk_unrecognized_option_low_level)
               end

       is_brk_variable_redfinition: BOOLEAN
               do
                       Result := (value=brk_variable_redfinition_low_level)
               end

       is_buffer_overflow_error: BOOLEAN
               do
                       Result := (value=buffer_overflow_error_low_level)
               end

       is_ce_not_found_error: BOOLEAN
               do
                       Result := (value=ce_not_found_error_low_level)
               end

       is_collator_version_mismatch: BOOLEAN
               do
                       Result := (value=collator_version_mismatch_low_level)
               end

       is_decimal_number_syntax_error: BOOLEAN
               do
                       Result := (value=decimal_number_syntax_error_low_level)
               end

       is_default_keyword_missing: BOOLEAN
               do
                       Result := (value=default_keyword_missing_low_level)
               end

       is_different_uca_version: BOOLEAN
               do
                       Result := (value=different_uca_version_low_level)
               end

       is_duplicate_keyword: BOOLEAN
               do
                       Result := (value=duplicate_keyword_low_level)
               end

       is_enum_out_of_sync_error: BOOLEAN
               do
                       Result := (value=enum_out_of_sync_error_low_level)
               end

       is_error_limit: BOOLEAN
               do
                       Result := (value=error_limit_low_level)
               end

       is_error_warning_limit: BOOLEAN
               do
                       Result := (value=error_warning_limit_low_level)
               end

       is_error_warning_start: BOOLEAN
               do
                       Result := (value=error_warning_start_low_level)
               end

       is_file_access_error: BOOLEAN
               do
                       Result := (value=file_access_error_low_level)
               end

       is_fmt_parse_error_limit: BOOLEAN
               do
                       Result := (value=fmt_parse_error_limit_low_level)
               end

       is_fmt_parse_error_start: BOOLEAN
               do
                       Result := (value=fmt_parse_error_start_low_level)
               end

       is_format_inexact_error: BOOLEAN
               do
                       Result := (value=format_inexact_error_low_level)
               end

       is_idna_ace_prefix_error: BOOLEAN
               do
                       Result := (value=idna_ace_prefix_error_low_level)
               end

       is_idna_check_bidi_error: BOOLEAN
               do
                       Result := (value=idna_check_bidi_error_low_level)
               end

       is_idna_domain_name_too_long_error: BOOLEAN
               do
                       Result := (value=idna_domain_name_too_long_error_low_level)
               end

       is_idna_error_limit: BOOLEAN
               do
                       Result := (value=idna_error_limit_low_level)
               end

       is_idna_error_start: BOOLEAN
               do
                       Result := (value=idna_error_start_low_level)
               end

       is_idna_label_too_long_error: BOOLEAN
               do
                       Result := (value=idna_label_too_long_error_low_level)
               end

       is_idna_prohibited_error: BOOLEAN
               do
                       Result := (value=idna_prohibited_error_low_level)
               end

       is_idna_std3_ascii_rules_error: BOOLEAN
               do
                       Result := (value=idna_std3_ascii_rules_error_low_level)
               end

       is_idna_unassigned_error: BOOLEAN
               do
                       Result := (value=idna_unassigned_error_low_level)
               end

       is_idna_verification_error: BOOLEAN
               do
                       Result := (value=idna_verification_error_low_level)
               end

       is_idna_zero_length_label_error: BOOLEAN
               do
                       Result := (value=idna_zero_length_label_error_low_level)
               end

       is_illegal_argument_error: BOOLEAN
               do
                       Result := (value=illegal_argument_error_low_level)
               end

       is_illegal_char_found: BOOLEAN
               do
                       Result := (value=illegal_char_found_low_level)
               end

       is_illegal_char_in_segment: BOOLEAN
               do
                       Result := (value=illegal_char_in_segment_low_level)
               end

       is_illegal_character: BOOLEAN
               do
                       Result := (value=illegal_character_low_level)
               end

       is_illegal_escape_sequence: BOOLEAN
               do
                       Result := (value=illegal_escape_sequence_low_level)
               end

       is_illegal_pad_position: BOOLEAN
               do
                       Result := (value=illegal_pad_position_low_level)
               end

       is_index_outofbounds_error: BOOLEAN
               do
                       Result := (value=index_outofbounds_error_low_level)
               end

       is_internal_program_error: BOOLEAN
               do
                       Result := (value=internal_program_error_low_level)
               end

       is_internal_transliterator_error: BOOLEAN
               do
                       Result := (value=internal_transliterator_error_low_level)
               end

       is_invalid_char_found: BOOLEAN
               do
                       Result := (value=invalid_char_found_low_level)
               end

       is_invalid_format_error: BOOLEAN
               do
                       Result := (value=invalid_format_error_low_level)
               end

       is_invalid_function: BOOLEAN
               do
                       Result := (value=invalid_function_low_level)
               end

       is_invalid_id: BOOLEAN
               do
                       Result := (value=invalid_id_low_level)
               end

       is_invalid_property_pattern: BOOLEAN
               do
                       Result := (value=invalid_property_pattern_low_level)
               end

       is_invalid_rbt_syntax: BOOLEAN
               do
                       Result := (value=invalid_rbt_syntax_low_level)
               end

       is_invalid_state_error: BOOLEAN
               do
                       Result := (value=invalid_state_error_low_level)
               end

       is_invalid_table_file: BOOLEAN
               do
                       Result := (value=invalid_table_file_low_level)
               end

       is_invalid_table_format: BOOLEAN
               do
                       Result := (value=invalid_table_format_low_level)
               end

       is_invariant_conversion_error: BOOLEAN
               do
                       Result := (value=invariant_conversion_error_low_level)
               end

       is_malformed_exponential_pattern: BOOLEAN
               do
                       Result := (value=malformed_exponential_pattern_low_level)
               end

       is_malformed_pragma: BOOLEAN
               do
                       Result := (value=malformed_pragma_low_level)
               end

       is_malformed_rule: BOOLEAN
               do
                       Result := (value=malformed_rule_low_level)
               end

       is_malformed_set: BOOLEAN
               do
                       Result := (value=malformed_set_low_level)
               end

       is_malformed_symbol_reference: BOOLEAN
               do
                       Result := (value=malformed_symbol_reference_low_level)
               end

       is_malformed_unicode_escape: BOOLEAN
               do
                       Result := (value=malformed_unicode_escape_low_level)
               end

       is_malformed_variable_definition: BOOLEAN
               do
                       Result := (value=malformed_variable_definition_low_level)
               end

       is_malformed_variable_reference: BOOLEAN
               do
                       Result := (value=malformed_variable_reference_low_level)
               end

       is_memory_allocation_error: BOOLEAN
               do
                       Result := (value=memory_allocation_error_low_level)
               end

       is_message_parse_error: BOOLEAN
               do
                       Result := (value=message_parse_error_low_level)
               end

       is_mismatched_segment_delimiters: BOOLEAN
               do
                       Result := (value=mismatched_segment_delimiters_low_level)
               end

       is_misplaced_anchor_start: BOOLEAN
               do
                       Result := (value=misplaced_anchor_start_low_level)
               end

       is_misplaced_compound_filter: BOOLEAN
               do
                       Result := (value=misplaced_compound_filter_low_level)
               end

       is_misplaced_cursor_offset: BOOLEAN
               do
                       Result := (value=misplaced_cursor_offset_low_level)
               end

       is_misplaced_quantifier: BOOLEAN
               do
                       Result := (value=misplaced_quantifier_low_level)
               end

       is_missing_operator: BOOLEAN
               do
                       Result := (value=missing_operator_low_level)
               end

       is_missing_resource_error: BOOLEAN
               do
                       Result := (value=missing_resource_error_low_level)
               end

       is_missing_segment_close: BOOLEAN
               do
                       Result := (value=missing_segment_close_low_level)
               end

       is_multiple_ante_contexts: BOOLEAN
               do
                       Result := (value=multiple_ante_contexts_low_level)
               end

       is_multiple_compound_filters: BOOLEAN
               do
                       Result := (value=multiple_compound_filters_low_level)
               end

       is_multiple_cursors: BOOLEAN
               do
                       Result := (value=multiple_cursors_low_level)
               end

       is_multiple_decimal_separators: BOOLEAN
               do
                       Result := (value=multiple_decimal_separators_low_level)
               end

       is_multiple_decimal_seperators: BOOLEAN
               do
                       Result := (value=multiple_decimal_seperators_low_level)
               end

       is_multiple_exponential_symbols: BOOLEAN
               do
                       Result := (value=multiple_exponential_symbols_low_level)
               end

       is_multiple_pad_specifiers: BOOLEAN
               do
                       Result := (value=multiple_pad_specifiers_low_level)
               end

       is_multiple_percent_symbols: BOOLEAN
               do
                       Result := (value=multiple_percent_symbols_low_level)
               end

       is_multiple_permill_symbols: BOOLEAN
               do
                       Result := (value=multiple_permill_symbols_low_level)
               end

       is_multiple_post_contexts: BOOLEAN
               do
                       Result := (value=multiple_post_contexts_low_level)
               end

       is_no_space_available: BOOLEAN
               do
                       Result := (value=no_space_available_low_level)
               end

       is_no_write_permission: BOOLEAN
               do
                       Result := (value=no_write_permission_low_level)
               end

       is_parse_error: BOOLEAN
               do
                       Result := (value=parse_error_low_level)
               end

       is_parse_error_limit: BOOLEAN
               do
                       Result := (value=parse_error_limit_low_level)
               end

       is_parse_error_start: BOOLEAN
               do
                       Result := (value=parse_error_start_low_level)
               end

       is_pattern_syntax_error: BOOLEAN
               do
                       Result := (value=pattern_syntax_error_low_level)
               end

       is_plugin_changed_level_warning: BOOLEAN
               do
                       Result := (value=plugin_changed_level_warning_low_level)
               end

       is_plugin_didnt_set_level: BOOLEAN
               do
                       Result := (value=plugin_didnt_set_level_low_level)
               end

       is_plugin_error_limit: BOOLEAN
               do
                       Result := (value=plugin_error_limit_low_level)
               end

       is_plugin_error_start: BOOLEAN
               do
                       Result := (value=plugin_error_start_low_level)
               end

       is_plugin_too_high: BOOLEAN
               do
                       Result := (value=plugin_too_high_low_level)
               end

       is_primary_too_long_error: BOOLEAN
               do
                       Result := (value=primary_too_long_error_low_level)
               end

       is_regex_bad_escape_sequence: BOOLEAN
               do
                       Result := (value=regex_bad_escape_sequence_low_level)
               end

       is_regex_bad_interval: BOOLEAN
               do
                       Result := (value=regex_bad_interval_low_level)
               end

       is_regex_error_limit: BOOLEAN
               do
                       Result := (value=regex_error_limit_low_level)
               end

       is_regex_error_start: BOOLEAN
               do
                       Result := (value=regex_error_start_low_level)
               end

       is_regex_internal_error: BOOLEAN
               do
                       Result := (value=regex_internal_error_low_level)
               end

       is_regex_invalid_back_ref: BOOLEAN
               do
                       Result := (value=regex_invalid_back_ref_low_level)
               end

       is_regex_invalid_capture_group_name: BOOLEAN
               do
                       Result := (value=regex_invalid_capture_group_name_low_level)
               end

       is_regex_invalid_flag: BOOLEAN
               do
                       Result := (value=regex_invalid_flag_low_level)
               end

       is_regex_invalid_range: BOOLEAN
               do
                       Result := (value=regex_invalid_range_low_level)
               end

       is_regex_invalid_state: BOOLEAN
               do
                       Result := (value=regex_invalid_state_low_level)
               end

       is_regex_look_behind_limit: BOOLEAN
               do
                       Result := (value=regex_look_behind_limit_low_level)
               end

       is_regex_max_lt_min: BOOLEAN
               do
                       Result := (value=regex_max_lt_min_low_level)
               end

       is_regex_mismatched_paren: BOOLEAN
               do
                       Result := (value=regex_mismatched_paren_low_level)
               end

       is_regex_missing_close_bracket: BOOLEAN
               do
                       Result := (value=regex_missing_close_bracket_low_level)
               end

       is_regex_number_too_big: BOOLEAN
               do
                       Result := (value=regex_number_too_big_low_level)
               end

       is_regex_octal_too_big: BOOLEAN
               do
                       Result := (value=regex_octal_too_big_low_level)
               end

       is_regex_pattern_too_big: BOOLEAN
               do
                       Result := (value=regex_pattern_too_big_low_level)
               end

       is_regex_property_syntax: BOOLEAN
               do
                       Result := (value=regex_property_syntax_low_level)
               end

       is_regex_rule_syntax: BOOLEAN
               do
                       Result := (value=regex_rule_syntax_low_level)
               end

       is_regex_set_contains_string: BOOLEAN
               do
                       Result := (value=regex_set_contains_string_low_level)
               end

       is_regex_stack_overflow: BOOLEAN
               do
                       Result := (value=regex_stack_overflow_low_level)
               end

       is_regex_stopped_by_caller: BOOLEAN
               do
                       Result := (value=regex_stopped_by_caller_low_level)
               end

       is_regex_time_out: BOOLEAN
               do
                       Result := (value=regex_time_out_low_level)
               end

       is_regex_unimplemented: BOOLEAN
               do
                       Result := (value=regex_unimplemented_low_level)
               end

       is_resource_type_mismatch: BOOLEAN
               do
                       Result := (value=resource_type_mismatch_low_level)
               end

       is_rule_mask_error: BOOLEAN
               do
                       Result := (value=rule_mask_error_low_level)
               end

       is_safeclone_allocated_warning: BOOLEAN
               do
                       Result := (value=safeclone_allocated_warning_low_level)
               end

       is_sort_key_too_short_warning: BOOLEAN
               do
                       Result := (value=sort_key_too_short_warning_low_level)
               end

       is_standard_error_limit: BOOLEAN
               do
                       Result := (value=standard_error_limit_low_level)
               end

       is_state_old_warning: BOOLEAN
               do
                       Result := (value=state_old_warning_low_level)
               end

       is_state_too_old_error: BOOLEAN
               do
                       Result := (value=state_too_old_error_low_level)
               end

       is_string_not_terminated_warning: BOOLEAN
               do
                       Result := (value=string_not_terminated_warning_low_level)
               end

       is_stringprep_check_bidi_error: BOOLEAN
               do
                       Result := (value=stringprep_check_bidi_error_low_level)
               end

       is_stringprep_prohibited_error: BOOLEAN
               do
                       Result := (value=stringprep_prohibited_error_low_level)
               end

       is_stringprep_unassigned_error: BOOLEAN
               do
                       Result := (value=stringprep_unassigned_error_low_level)
               end

       is_too_many_aliases_error: BOOLEAN
               do
                       Result := (value=too_many_aliases_error_low_level)
               end

       is_trailing_backslash: BOOLEAN
               do
                       Result := (value=trailing_backslash_low_level)
               end

       is_truncated_char_found: BOOLEAN
               do
                       Result := (value=truncated_char_found_low_level)
               end

       is_unclosed_segment: BOOLEAN
               do
                       Result := (value=unclosed_segment_low_level)
               end

       is_undefined_keyword: BOOLEAN
               do
                       Result := (value=undefined_keyword_low_level)
               end

       is_undefined_segment_reference: BOOLEAN
               do
                       Result := (value=undefined_segment_reference_low_level)
               end

       is_undefined_variable: BOOLEAN
               do
                       Result := (value=undefined_variable_low_level)
               end

       is_unexpected_token: BOOLEAN
               do
                       Result := (value=unexpected_token_low_level)
               end

       is_unmatched_braces: BOOLEAN
               do
                       Result := (value=unmatched_braces_low_level)
               end

       is_unquoted_special: BOOLEAN
               do
                       Result := (value=unquoted_special_low_level)
               end

       is_unsupported_attribute: BOOLEAN
               do
                       Result := (value=unsupported_attribute_low_level)
               end

       is_unsupported_error: BOOLEAN
               do
                       Result := (value=unsupported_error_low_level)
               end

       is_unsupported_escape_sequence: BOOLEAN
               do
                       Result := (value=unsupported_escape_sequence_low_level)
               end

       is_unsupported_property: BOOLEAN
               do
                       Result := (value=unsupported_property_low_level)
               end

       is_unterminated_quote: BOOLEAN
               do
                       Result := (value=unterminated_quote_low_level)
               end

       is_useless_collator_error: BOOLEAN
               do
                       Result := (value=useless_collator_error_low_level)
               end

       is_using_default_warning: BOOLEAN
               do
                       Result := (value=using_default_warning_low_level)
               end

       is_using_fallback_warning: BOOLEAN
               do
                       Result := (value=using_fallback_warning_low_level)
               end

       is_variable_range_exhausted: BOOLEAN
               do
                       Result := (value=variable_range_exhausted_low_level)
               end

       is_variable_range_overlap: BOOLEAN
               do
                       Result := (value=variable_range_overlap_low_level)
               end

       is_zero_error: BOOLEAN
               do
                       Result := (value=zero_error_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     ambiguous_alias_warning_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_AMBIGUOUS_ALIAS_WARNING"
                       }"
               end

     argument_type_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ARGUMENT_TYPE_MISMATCH"
                       }"
               end

     bad_variable_definition_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BAD_VARIABLE_DEFINITION"
                       }"
               end

     brk_assign_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_ASSIGN_ERROR"
                       }"
               end

     brk_error_limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_ERROR_LIMIT"
                       }"
               end

     brk_error_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_ERROR_START"
                       }"
               end

     brk_hex_digits_expected_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_HEX_DIGITS_EXPECTED"
                       }"
               end

     brk_init_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_INIT_ERROR"
                       }"
               end

     brk_internal_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_INTERNAL_ERROR"
                       }"
               end

     brk_malformed_rule_tag_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_MALFORMED_RULE_TAG"
                       }"
               end

     brk_mismatched_paren_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_MISMATCHED_PAREN"
                       }"
               end

     brk_new_line_in_quoted_string_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_NEW_LINE_IN_QUOTED_STRING"
                       }"
               end

     brk_rule_empty_set_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_RULE_EMPTY_SET"
                       }"
               end

     brk_rule_syntax_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_RULE_SYNTAX"
                       }"
               end

     brk_semicolon_expected_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_SEMICOLON_EXPECTED"
                       }"
               end

     brk_unclosed_set_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_UNCLOSED_SET"
                       }"
               end

     brk_undefined_variable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_UNDEFINED_VARIABLE"
                       }"
               end

     brk_unrecognized_option_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_UNRECOGNIZED_OPTION"
                       }"
               end

     brk_variable_redfinition_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BRK_VARIABLE_REDFINITION"
                       }"
               end

     buffer_overflow_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_BUFFER_OVERFLOW_ERROR"
                       }"
               end

     ce_not_found_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_CE_NOT_FOUND_ERROR"
                       }"
               end

     collator_version_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_COLLATOR_VERSION_MISMATCH"
                       }"
               end

     decimal_number_syntax_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_DECIMAL_NUMBER_SYNTAX_ERROR"
                       }"
               end

     default_keyword_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_DEFAULT_KEYWORD_MISSING"
                       }"
               end

     different_uca_version_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_DIFFERENT_UCA_VERSION"
                       }"
               end

     duplicate_keyword_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_DUPLICATE_KEYWORD"
                       }"
               end

     enum_out_of_sync_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ENUM_OUT_OF_SYNC_ERROR"
                       }"
               end

     error_limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ERROR_LIMIT"
                       }"
               end

     error_warning_limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ERROR_WARNING_LIMIT"
                       }"
               end

     error_warning_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ERROR_WARNING_START"
                       }"
               end

     file_access_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_FILE_ACCESS_ERROR"
                       }"
               end

     fmt_parse_error_limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_FMT_PARSE_ERROR_LIMIT"
                       }"
               end

     fmt_parse_error_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_FMT_PARSE_ERROR_START"
                       }"
               end

     format_inexact_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_FORMAT_INEXACT_ERROR"
                       }"
               end

     idna_ace_prefix_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_ACE_PREFIX_ERROR"
                       }"
               end

     idna_check_bidi_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_CHECK_BIDI_ERROR"
                       }"
               end

     idna_domain_name_too_long_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_DOMAIN_NAME_TOO_LONG_ERROR"
                       }"
               end

     idna_error_limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_ERROR_LIMIT"
                       }"
               end

     idna_error_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_ERROR_START"
                       }"
               end

     idna_label_too_long_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_LABEL_TOO_LONG_ERROR"
                       }"
               end

     idna_prohibited_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_PROHIBITED_ERROR"
                       }"
               end

     idna_std3_ascii_rules_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_STD3_ASCII_RULES_ERROR"
                       }"
               end

     idna_unassigned_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_UNASSIGNED_ERROR"
                       }"
               end

     idna_verification_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_VERIFICATION_ERROR"
                       }"
               end

     idna_zero_length_label_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_IDNA_ZERO_LENGTH_LABEL_ERROR"
                       }"
               end

     illegal_argument_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ILLEGAL_ARGUMENT_ERROR"
                       }"
               end

     illegal_char_found_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ILLEGAL_CHAR_FOUND"
                       }"
               end

     illegal_char_in_segment_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ILLEGAL_CHAR_IN_SEGMENT"
                       }"
               end

     illegal_character_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ILLEGAL_CHARACTER"
                       }"
               end

     illegal_escape_sequence_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ILLEGAL_ESCAPE_SEQUENCE"
                       }"
               end

     illegal_pad_position_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ILLEGAL_PAD_POSITION"
                       }"
               end

     index_outofbounds_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INDEX_OUTOFBOUNDS_ERROR"
                       }"
               end

     internal_program_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INTERNAL_PROGRAM_ERROR"
                       }"
               end

     internal_transliterator_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INTERNAL_TRANSLITERATOR_ERROR"
                       }"
               end

     invalid_char_found_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INVALID_CHAR_FOUND"
                       }"
               end

     invalid_format_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INVALID_FORMAT_ERROR"
                       }"
               end

     invalid_function_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INVALID_FUNCTION"
                       }"
               end

     invalid_id_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INVALID_ID"
                       }"
               end

     invalid_property_pattern_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INVALID_PROPERTY_PATTERN"
                       }"
               end

     invalid_rbt_syntax_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INVALID_RBT_SYNTAX"
                       }"
               end

     invalid_state_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INVALID_STATE_ERROR"
                       }"
               end

     invalid_table_file_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INVALID_TABLE_FILE"
                       }"
               end

     invalid_table_format_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INVALID_TABLE_FORMAT"
                       }"
               end

     invariant_conversion_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_INVARIANT_CONVERSION_ERROR"
                       }"
               end

     malformed_exponential_pattern_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MALFORMED_EXPONENTIAL_PATTERN"
                       }"
               end

     malformed_pragma_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MALFORMED_PRAGMA"
                       }"
               end

     malformed_rule_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MALFORMED_RULE"
                       }"
               end

     malformed_set_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MALFORMED_SET"
                       }"
               end

     malformed_symbol_reference_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MALFORMED_SYMBOL_REFERENCE"
                       }"
               end

     malformed_unicode_escape_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MALFORMED_UNICODE_ESCAPE"
                       }"
               end

     malformed_variable_definition_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MALFORMED_VARIABLE_DEFINITION"
                       }"
               end

     malformed_variable_reference_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MALFORMED_VARIABLE_REFERENCE"
                       }"
               end

     memory_allocation_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MEMORY_ALLOCATION_ERROR"
                       }"
               end

     message_parse_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MESSAGE_PARSE_ERROR"
                       }"
               end

     mismatched_segment_delimiters_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MISMATCHED_SEGMENT_DELIMITERS"
                       }"
               end

     misplaced_anchor_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MISPLACED_ANCHOR_START"
                       }"
               end

     misplaced_compound_filter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MISPLACED_COMPOUND_FILTER"
                       }"
               end

     misplaced_cursor_offset_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MISPLACED_CURSOR_OFFSET"
                       }"
               end

     misplaced_quantifier_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MISPLACED_QUANTIFIER"
                       }"
               end

     missing_operator_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MISSING_OPERATOR"
                       }"
               end

     missing_resource_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MISSING_RESOURCE_ERROR"
                       }"
               end

     missing_segment_close_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MISSING_SEGMENT_CLOSE"
                       }"
               end

     multiple_ante_contexts_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MULTIPLE_ANTE_CONTEXTS"
                       }"
               end

     multiple_compound_filters_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MULTIPLE_COMPOUND_FILTERS"
                       }"
               end

     multiple_cursors_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MULTIPLE_CURSORS"
                       }"
               end

     multiple_decimal_separators_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MULTIPLE_DECIMAL_SEPARATORS"
                       }"
               end

     multiple_decimal_seperators_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MULTIPLE_DECIMAL_SEPERATORS"
                       }"
               end

     multiple_exponential_symbols_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MULTIPLE_EXPONENTIAL_SYMBOLS"
                       }"
               end

     multiple_pad_specifiers_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MULTIPLE_PAD_SPECIFIERS"
                       }"
               end

     multiple_percent_symbols_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MULTIPLE_PERCENT_SYMBOLS"
                       }"
               end

     multiple_permill_symbols_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MULTIPLE_PERMILL_SYMBOLS"
                       }"
               end

     multiple_post_contexts_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_MULTIPLE_POST_CONTEXTS"
                       }"
               end

     no_space_available_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_NO_SPACE_AVAILABLE"
                       }"
               end

     no_write_permission_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_NO_WRITE_PERMISSION"
                       }"
               end

     parse_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_PARSE_ERROR"
                       }"
               end

     parse_error_limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_PARSE_ERROR_LIMIT"
                       }"
               end

     parse_error_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_PARSE_ERROR_START"
                       }"
               end

     pattern_syntax_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_PATTERN_SYNTAX_ERROR"
                       }"
               end

     plugin_changed_level_warning_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_PLUGIN_CHANGED_LEVEL_WARNING"
                       }"
               end

     plugin_didnt_set_level_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_PLUGIN_DIDNT_SET_LEVEL"
                       }"
               end

     plugin_error_limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_PLUGIN_ERROR_LIMIT"
                       }"
               end

     plugin_error_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_PLUGIN_ERROR_START"
                       }"
               end

     plugin_too_high_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_PLUGIN_TOO_HIGH"
                       }"
               end

     primary_too_long_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_PRIMARY_TOO_LONG_ERROR"
                       }"
               end

     regex_bad_escape_sequence_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_BAD_ESCAPE_SEQUENCE"
                       }"
               end

     regex_bad_interval_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_BAD_INTERVAL"
                       }"
               end

     regex_error_limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_ERROR_LIMIT"
                       }"
               end

     regex_error_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_ERROR_START"
                       }"
               end

     regex_internal_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_INTERNAL_ERROR"
                       }"
               end

     regex_invalid_back_ref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_INVALID_BACK_REF"
                       }"
               end

     regex_invalid_capture_group_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_INVALID_CAPTURE_GROUP_NAME"
                       }"
               end

     regex_invalid_flag_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_INVALID_FLAG"
                       }"
               end

     regex_invalid_range_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_INVALID_RANGE"
                       }"
               end

     regex_invalid_state_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_INVALID_STATE"
                       }"
               end

     regex_look_behind_limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_LOOK_BEHIND_LIMIT"
                       }"
               end

     regex_max_lt_min_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_MAX_LT_MIN"
                       }"
               end

     regex_mismatched_paren_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_MISMATCHED_PAREN"
                       }"
               end

     regex_missing_close_bracket_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_MISSING_CLOSE_BRACKET"
                       }"
               end

     regex_number_too_big_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_NUMBER_TOO_BIG"
                       }"
               end

     regex_octal_too_big_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_OCTAL_TOO_BIG"
                       }"
               end

     regex_pattern_too_big_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_PATTERN_TOO_BIG"
                       }"
               end

     regex_property_syntax_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_PROPERTY_SYNTAX"
                       }"
               end

     regex_rule_syntax_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_RULE_SYNTAX"
                       }"
               end

     regex_set_contains_string_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_SET_CONTAINS_STRING"
                       }"
               end

     regex_stack_overflow_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_STACK_OVERFLOW"
                       }"
               end

     regex_stopped_by_caller_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_STOPPED_BY_CALLER"
                       }"
               end

     regex_time_out_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_TIME_OUT"
                       }"
               end

     regex_unimplemented_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_REGEX_UNIMPLEMENTED"
                       }"
               end

     resource_type_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_RESOURCE_TYPE_MISMATCH"
                       }"
               end

     rule_mask_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_RULE_MASK_ERROR"
                       }"
               end

     safeclone_allocated_warning_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_SAFECLONE_ALLOCATED_WARNING"
                       }"
               end

     sort_key_too_short_warning_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_SORT_KEY_TOO_SHORT_WARNING"
                       }"
               end

     standard_error_limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_STANDARD_ERROR_LIMIT"
                       }"
               end

     state_old_warning_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_STATE_OLD_WARNING"
                       }"
               end

     state_too_old_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_STATE_TOO_OLD_ERROR"
                       }"
               end

     string_not_terminated_warning_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_STRING_NOT_TERMINATED_WARNING"
                       }"
               end

     stringprep_check_bidi_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_STRINGPREP_CHECK_BIDI_ERROR"
                       }"
               end

     stringprep_prohibited_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_STRINGPREP_PROHIBITED_ERROR"
                       }"
               end

     stringprep_unassigned_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_STRINGPREP_UNASSIGNED_ERROR"
                       }"
               end

     too_many_aliases_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_TOO_MANY_ALIASES_ERROR"
                       }"
               end

     trailing_backslash_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_TRAILING_BACKSLASH"
                       }"
               end

     truncated_char_found_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_TRUNCATED_CHAR_FOUND"
                       }"
               end

     unclosed_segment_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNCLOSED_SEGMENT"
                       }"
               end

     undefined_keyword_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNDEFINED_KEYWORD"
                       }"
               end

     undefined_segment_reference_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNDEFINED_SEGMENT_REFERENCE"
                       }"
               end

     undefined_variable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNDEFINED_VARIABLE"
                       }"
               end

     unexpected_token_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNEXPECTED_TOKEN"
                       }"
               end

     unmatched_braces_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNMATCHED_BRACES"
                       }"
               end

     unquoted_special_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNQUOTED_SPECIAL"
                       }"
               end

     unsupported_attribute_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNSUPPORTED_ATTRIBUTE"
                       }"
               end

     unsupported_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNSUPPORTED_ERROR"
                       }"
               end

     unsupported_escape_sequence_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNSUPPORTED_ESCAPE_SEQUENCE"
                       }"
               end

     unsupported_property_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNSUPPORTED_PROPERTY"
                       }"
               end

     unterminated_quote_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_UNTERMINATED_QUOTE"
                       }"
               end

     useless_collator_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_USELESS_COLLATOR_ERROR"
                       }"
               end

     using_default_warning_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_USING_DEFAULT_WARNING"
                       }"
               end

     using_fallback_warning_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_USING_FALLBACK_WARNING"
                       }"
               end

     variable_range_exhausted_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_VARIABLE_RANGE_EXHAUSTED"
                       }"
               end

     variable_range_overlap_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_VARIABLE_RANGE_OVERLAP"
                       }"
               end

     zero_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "U_ZERO_ERROR"
                       }"
               end


end -- class UERROR_CODE_ENUM
