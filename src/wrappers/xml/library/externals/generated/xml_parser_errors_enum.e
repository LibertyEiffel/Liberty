-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_PARSER_ERRORS_ENUM

-- Wrapper of enum xmlParserErrors defined in file /usr/include/libxml2/libxml/xmlerror.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = buf_overflow_low_level)  or else
				(a_value = c14n_create_ctxt_low_level)  or else
				(a_value = c14n_create_stack_low_level)  or else
				(a_value = c14n_invalid_node_low_level)  or else
				(a_value = c14n_relative_namespace_low_level)  or else
				(a_value = c14n_requires_utf8_low_level)  or else
				(a_value = c14n_unknow_node_low_level)  or else
				(a_value = catalog_entry_broken_low_level)  or else
				(a_value = catalog_missing_attr_low_level)  or else
				(a_value = catalog_not_catalog_low_level)  or else
				(a_value = catalog_prefer_value_low_level)  or else
				(a_value = catalog_recursion_low_level)  or else
				(a_value = check_entity_type_low_level)  or else
				(a_value = check_found_attribute_low_level)  or else
				(a_value = check_found_cdata_low_level)  or else
				(a_value = check_found_comment_low_level)  or else
				(a_value = check_found_doctype_low_level)  or else
				(a_value = check_found_element_low_level)  or else
				(a_value = check_found_entity_low_level)  or else
				(a_value = check_found_entityref_low_level)  or else
				(a_value = check_found_fragment_low_level)  or else
				(a_value = check_found_notation_low_level)  or else
				(a_value = check_found_pi_low_level)  or else
				(a_value = check_found_text_low_level)  or else
				(a_value = check_name_not_null_low_level)  or else
				(a_value = check_no_dict_low_level)  or else
				(a_value = check_no_doc_low_level)  or else
				(a_value = check_no_elem_low_level)  or else
				(a_value = check_no_href_low_level)  or else
				(a_value = check_no_name_low_level)  or else
				(a_value = check_no_next_low_level)  or else
				(a_value = check_no_parent_low_level)  or else
				(a_value = check_no_prev_low_level)  or else
				(a_value = check_not_attr_low_level)  or else
				(a_value = check_not_attr_decl_low_level)  or else
				(a_value = check_not_dtd_low_level)  or else
				(a_value = check_not_elem_decl_low_level)  or else
				(a_value = check_not_entity_decl_low_level)  or else
				(a_value = check_not_ncname_low_level)  or else
				(a_value = check_not_ns_decl_low_level)  or else
				(a_value = check_not_utf8_low_level)  or else
				(a_value = check_ns_ancestor_low_level)  or else
				(a_value = check_ns_scope_low_level)  or else
				(a_value = check_outside_dict_low_level)  or else
				(a_value = check_unknown_node_low_level)  or else
				(a_value = check_wrong_doc_low_level)  or else
				(a_value = check_wrong_name_low_level)  or else
				(a_value = check_wrong_next_low_level)  or else
				(a_value = check_wrong_parent_low_level)  or else
				(a_value = check_wrong_prev_low_level)  or else
				(a_value = dtd_attribute_default_low_level)  or else
				(a_value = dtd_attribute_redefined_low_level)  or else
				(a_value = dtd_attribute_value_low_level)  or else
				(a_value = dtd_content_error_low_level)  or else
				(a_value = dtd_content_model_low_level)  or else
				(a_value = dtd_content_not_determinist_low_level)  or else
				(a_value = dtd_different_prefix_low_level)  or else
				(a_value = dtd_dup_token_low_level)  or else
				(a_value = dtd_elem_default_namespace_low_level)  or else
				(a_value = dtd_elem_namespace_low_level)  or else
				(a_value = dtd_elem_redefined_low_level)  or else
				(a_value = dtd_empty_notation_low_level)  or else
				(a_value = dtd_entity_type_low_level)  or else
				(a_value = dtd_id_fixed_low_level)  or else
				(a_value = dtd_id_redefined_low_level)  or else
				(a_value = dtd_id_subset_low_level)  or else
				(a_value = dtd_invalid_child_low_level)  or else
				(a_value = dtd_invalid_default_low_level)  or else
				(a_value = dtd_load_error_low_level)  or else
				(a_value = dtd_missing_attribute_low_level)  or else
				(a_value = dtd_mixed_corrupt_low_level)  or else
				(a_value = dtd_multiple_id_low_level)  or else
				(a_value = dtd_no_doc_low_level)  or else
				(a_value = dtd_no_dtd_low_level)  or else
				(a_value = dtd_no_elem_name_low_level)  or else
				(a_value = dtd_no_prefix_low_level)  or else
				(a_value = dtd_no_root_low_level)  or else
				(a_value = dtd_not_empty_low_level)  or else
				(a_value = dtd_not_pcdata_low_level)  or else
				(a_value = dtd_not_standalone_low_level)  or else
				(a_value = dtd_notation_redefined_low_level)  or else
				(a_value = dtd_notation_value_low_level)  or else
				(a_value = dtd_root_name_low_level)  or else
				(a_value = dtd_standalone_defaulted_low_level)  or else
				(a_value = dtd_standalone_white_space_low_level)  or else
				(a_value = dtd_unknown_attribute_low_level)  or else
				(a_value = dtd_unknown_elem_low_level)  or else
				(a_value = dtd_unknown_entity_low_level)  or else
				(a_value = dtd_unknown_id_low_level)  or else
				(a_value = dtd_unknown_notation_low_level)  or else
				(a_value = dtd_xmlid_type_low_level)  or else
				(a_value = dtd_xmlid_value_low_level)  or else
				(a_value = err_attlist_not_finished_low_level)  or else
				(a_value = err_attlist_not_started_low_level)  or else
				(a_value = err_attribute_not_finished_low_level)  or else
				(a_value = err_attribute_not_started_low_level)  or else
				(a_value = err_attribute_redefined_low_level)  or else
				(a_value = err_attribute_without_value_low_level)  or else
				(a_value = err_cdata_not_finished_low_level)  or else
				(a_value = err_charref_at_eof_low_level)  or else
				(a_value = err_charref_in_dtd_low_level)  or else
				(a_value = err_charref_in_epilog_low_level)  or else
				(a_value = err_charref_in_prolog_low_level)  or else
				(a_value = err_comment_not_finished_low_level)  or else
				(a_value = err_condsec_invalid_low_level)  or else
				(a_value = err_condsec_invalid_keyword_low_level)  or else
				(a_value = err_condsec_not_finished_low_level)  or else
				(a_value = err_condsec_not_started_low_level)  or else
				(a_value = err_doctype_not_finished_low_level)  or else
				(a_value = err_document_empty_low_level)  or else
				(a_value = err_document_end_low_level)  or else
				(a_value = err_document_start_low_level)  or else
				(a_value = err_elemcontent_not_finished_low_level)  or else
				(a_value = err_elemcontent_not_started_low_level)  or else
				(a_value = err_encoding_name_low_level)  or else
				(a_value = err_entity_boundary_low_level)  or else
				(a_value = err_entity_char_error_low_level)  or else
				(a_value = err_entity_is_external_low_level)  or else
				(a_value = err_entity_is_parameter_low_level)  or else
				(a_value = err_entity_loop_low_level)  or else
				(a_value = err_entity_not_finished_low_level)  or else
				(a_value = err_entity_not_started_low_level)  or else
				(a_value = err_entity_pe_internal_low_level)  or else
				(a_value = err_entity_processing_low_level)  or else
				(a_value = err_entityref_at_eof_low_level)  or else
				(a_value = err_entityref_in_dtd_low_level)  or else
				(a_value = err_entityref_in_epilog_low_level)  or else
				(a_value = err_entityref_in_prolog_low_level)  or else
				(a_value = err_entityref_no_name_low_level)  or else
				(a_value = err_entityref_semicol_missing_low_level)  or else
				(a_value = err_equal_required_low_level)  or else
				(a_value = err_ext_entity_standalone_low_level)  or else
				(a_value = err_ext_subset_not_finished_low_level)  or else
				(a_value = err_extra_content_low_level)  or else
				(a_value = err_gt_required_low_level)  or else
				(a_value = err_hyphen_in_comment_low_level)  or else
				(a_value = err_internal_error_low_level)  or else
				(a_value = err_invalid_char_low_level)  or else
				(a_value = err_invalid_charref_low_level)  or else
				(a_value = err_invalid_dec_charref_low_level)  or else
				(a_value = err_invalid_encoding_low_level)  or else
				(a_value = err_invalid_hex_charref_low_level)  or else
				(a_value = err_invalid_uri_low_level)  or else
				(a_value = err_literal_not_finished_low_level)  or else
				(a_value = err_literal_not_started_low_level)  or else
				(a_value = err_lt_in_attribute_low_level)  or else
				(a_value = err_lt_required_low_level)  or else
				(a_value = err_ltslash_required_low_level)  or else
				(a_value = err_misplaced_cdata_end_low_level)  or else
				(a_value = err_missing_encoding_low_level)  or else
				(a_value = err_mixed_not_finished_low_level)  or else
				(a_value = err_mixed_not_started_low_level)  or else
				(a_value = err_name_required_low_level)  or else
				(a_value = err_name_too_long_low_level)  or else
				(a_value = err_nmtoken_required_low_level)  or else
				(a_value = err_no_dtd_low_level)  or else
				(a_value = err_no_memory_low_level)  or else
				(a_value = err_not_standalone_low_level)  or else
				(a_value = err_not_well_balanced_low_level)  or else
				(a_value = err_notation_not_finished_low_level)  or else
				(a_value = err_notation_not_started_low_level)  or else
				(a_value = err_notation_processing_low_level)  or else
				(a_value = err_ns_decl_error_low_level)  or else
				(a_value = err_ok_low_level)  or else
				(a_value = err_pcdata_required_low_level)  or else
				(a_value = err_peref_at_eof_low_level)  or else
				(a_value = err_peref_in_epilog_low_level)  or else
				(a_value = err_peref_in_int_subset_low_level)  or else
				(a_value = err_peref_in_prolog_low_level)  or else
				(a_value = err_peref_no_name_low_level)  or else
				(a_value = err_peref_semicol_missing_low_level)  or else
				(a_value = err_pi_not_finished_low_level)  or else
				(a_value = err_pi_not_started_low_level)  or else
				(a_value = err_pubid_required_low_level)  or else
				(a_value = err_reserved_xml_name_low_level)  or else
				(a_value = err_separator_required_low_level)  or else
				(a_value = err_space_required_low_level)  or else
				(a_value = err_standalone_value_low_level)  or else
				(a_value = err_string_not_closed_low_level)  or else
				(a_value = err_string_not_started_low_level)  or else
				(a_value = err_tag_name_mismatch_low_level)  or else
				(a_value = err_tag_not_finished_low_level)  or else
				(a_value = err_undeclared_entity_low_level)  or else
				(a_value = err_unknown_encoding_low_level)  or else
				(a_value = err_unknown_version_low_level)  or else
				(a_value = err_unparsed_entity_low_level)  or else
				(a_value = err_unsupported_encoding_low_level)  or else
				(a_value = err_uri_fragment_low_level)  or else
				(a_value = err_uri_required_low_level)  or else
				(a_value = err_user_stop_low_level)  or else
				(a_value = err_value_required_low_level)  or else
				(a_value = err_version_mismatch_low_level)  or else
				(a_value = err_version_missing_low_level)  or else
				(a_value = err_xmldecl_not_finished_low_level)  or else
				(a_value = err_xmldecl_not_started_low_level)  or else
				(a_value = ftp_accnt_low_level)  or else
				(a_value = ftp_epsv_answer_low_level)  or else
				(a_value = ftp_pasv_answer_low_level)  or else
				(a_value = ftp_url_syntax_low_level)  or else
				(a_value = html_strucure_error_low_level)  or else
				(a_value = html_unknown_tag_low_level)  or else
				(a_value = http_unknown_host_low_level)  or else
				(a_value = http_url_syntax_low_level)  or else
				(a_value = http_use_ip_low_level)  or else
				(a_value = i18n_conv_failed_low_level)  or else
				(a_value = i18n_excess_handler_low_level)  or else
				(a_value = i18n_no_handler_low_level)  or else
				(a_value = i18n_no_name_low_level)  or else
				(a_value = i18n_no_output_low_level)  or else
				(a_value = io_buffer_full_low_level)  or else
				(a_value = io_eacces_low_level)  or else
				(a_value = io_eaddrinuse_low_level)  or else
				(a_value = io_eafnosupport_low_level)  or else
				(a_value = io_eagain_low_level)  or else
				(a_value = io_ealready_low_level)  or else
				(a_value = io_ebadf_low_level)  or else
				(a_value = io_ebadmsg_low_level)  or else
				(a_value = io_ebusy_low_level)  or else
				(a_value = io_ecanceled_low_level)  or else
				(a_value = io_echild_low_level)  or else
				(a_value = io_econnrefused_low_level)  or else
				(a_value = io_edeadlk_low_level)  or else
				(a_value = io_edom_low_level)  or else
				(a_value = io_eexist_low_level)  or else
				(a_value = io_efault_low_level)  or else
				(a_value = io_efbig_low_level)  or else
				(a_value = io_einprogress_low_level)  or else
				(a_value = io_eintr_low_level)  or else
				(a_value = io_einval_low_level)  or else
				(a_value = io_eio_low_level)  or else
				(a_value = io_eisconn_low_level)  or else
				(a_value = io_eisdir_low_level)  or else
				(a_value = io_emfile_low_level)  or else
				(a_value = io_emlink_low_level)  or else
				(a_value = io_emsgsize_low_level)  or else
				(a_value = io_enametoolong_low_level)  or else
				(a_value = io_encoder_low_level)  or else
				(a_value = io_enetunreach_low_level)  or else
				(a_value = io_enfile_low_level)  or else
				(a_value = io_enodev_low_level)  or else
				(a_value = io_enoent_low_level)  or else
				(a_value = io_enoexec_low_level)  or else
				(a_value = io_enolck_low_level)  or else
				(a_value = io_enomem_low_level)  or else
				(a_value = io_enospc_low_level)  or else
				(a_value = io_enosys_low_level)  or else
				(a_value = io_enotdir_low_level)  or else
				(a_value = io_enotempty_low_level)  or else
				(a_value = io_enotsock_low_level)  or else
				(a_value = io_enotsup_low_level)  or else
				(a_value = io_enotty_low_level)  or else
				(a_value = io_enxio_low_level)  or else
				(a_value = io_eperm_low_level)  or else
				(a_value = io_epipe_low_level)  or else
				(a_value = io_erange_low_level)  or else
				(a_value = io_erofs_low_level)  or else
				(a_value = io_espipe_low_level)  or else
				(a_value = io_esrch_low_level)  or else
				(a_value = io_etimedout_low_level)  or else
				(a_value = io_exdev_low_level)  or else
				(a_value = io_flush_low_level)  or else
				(a_value = io_load_error_low_level)  or else
				(a_value = io_network_attempt_low_level)  or else
				(a_value = io_no_input_low_level)  or else
				(a_value = io_unknown_low_level)  or else
				(a_value = io_write_low_level)  or else
				(a_value = module_close_low_level)  or else
				(a_value = module_open_low_level)  or else
				(a_value = ns_err_attribute_redefined_low_level)  or else
				(a_value = ns_err_colon_low_level)  or else
				(a_value = ns_err_empty_low_level)  or else
				(a_value = ns_err_qname_low_level)  or else
				(a_value = ns_err_undefined_namespace_low_level)  or else
				(a_value = ns_err_xml_namespace_low_level)  or else
				(a_value = regexp_compile_error_low_level)  or else
				(a_value = rngp_anyname_attr_ancestor_low_level)  or else
				(a_value = rngp_attr_conflict_low_level)  or else
				(a_value = rngp_attribute_children_low_level)  or else
				(a_value = rngp_attribute_content_low_level)  or else
				(a_value = rngp_attribute_empty_low_level)  or else
				(a_value = rngp_attribute_noop_low_level)  or else
				(a_value = rngp_choice_content_low_level)  or else
				(a_value = rngp_choice_empty_low_level)  or else
				(a_value = rngp_create_failure_low_level)  or else
				(a_value = rngp_data_content_low_level)  or else
				(a_value = rngp_def_choice_and_interleave_low_level)  or else
				(a_value = rngp_define_create_failed_low_level)  or else
				(a_value = rngp_define_empty_low_level)  or else
				(a_value = rngp_define_missing_low_level)  or else
				(a_value = rngp_define_name_missing_low_level)  or else
				(a_value = rngp_elem_content_empty_low_level)  or else
				(a_value = rngp_elem_content_error_low_level)  or else
				(a_value = rngp_elem_text_conflict_low_level)  or else
				(a_value = rngp_element_content_low_level)  or else
				(a_value = rngp_element_empty_low_level)  or else
				(a_value = rngp_element_name_low_level)  or else
				(a_value = rngp_element_no_content_low_level)  or else
				(a_value = rngp_empty_low_level)  or else
				(a_value = rngp_empty_construct_low_level)  or else
				(a_value = rngp_empty_content_low_level)  or else
				(a_value = rngp_empty_not_empty_low_level)  or else
				(a_value = rngp_error_type_lib_low_level)  or else
				(a_value = rngp_except_empty_low_level)  or else
				(a_value = rngp_except_missing_low_level)  or else
				(a_value = rngp_except_multiple_low_level)  or else
				(a_value = rngp_except_no_content_low_level)  or else
				(a_value = rngp_external_ref_failure_low_level)  or else
				(a_value = rngp_externalref_emtpy_low_level)  or else
				(a_value = rngp_externalref_recurse_low_level)  or else
				(a_value = rngp_forbidden_attribute_low_level)  or else
				(a_value = rngp_foreign_element_low_level)  or else
				(a_value = rngp_grammar_content_low_level)  or else
				(a_value = rngp_grammar_empty_low_level)  or else
				(a_value = rngp_grammar_missing_low_level)  or else
				(a_value = rngp_grammar_no_start_low_level)  or else
				(a_value = rngp_group_attr_conflict_low_level)  or else
				(a_value = rngp_href_error_low_level)  or else
				(a_value = rngp_include_empty_low_level)  or else
				(a_value = rngp_include_failure_low_level)  or else
				(a_value = rngp_include_recurse_low_level)  or else
				(a_value = rngp_interleave_add_low_level)  or else
				(a_value = rngp_interleave_create_failed_low_level)  or else
				(a_value = rngp_interleave_empty_low_level)  or else
				(a_value = rngp_interleave_no_content_low_level)  or else
				(a_value = rngp_invalid_define_name_low_level)  or else
				(a_value = rngp_invalid_uri_low_level)  or else
				(a_value = rngp_invalid_value_low_level)  or else
				(a_value = rngp_missing_href_low_level)  or else
				(a_value = rngp_name_missing_low_level)  or else
				(a_value = rngp_need_combine_low_level)  or else
				(a_value = rngp_notallowed_not_empty_low_level)  or else
				(a_value = rngp_nsname_attr_ancestor_low_level)  or else
				(a_value = rngp_nsname_no_ns_low_level)  or else
				(a_value = rngp_param_forbidden_low_level)  or else
				(a_value = rngp_param_name_missing_low_level)  or else
				(a_value = rngp_parentref_create_failed_low_level)  or else
				(a_value = rngp_parentref_name_invalid_low_level)  or else
				(a_value = rngp_parentref_no_name_low_level)  or else
				(a_value = rngp_parentref_no_parent_low_level)  or else
				(a_value = rngp_parentref_not_empty_low_level)  or else
				(a_value = rngp_parse_error_low_level)  or else
				(a_value = rngp_pat_anyname_except_anyname_low_level)  or else
				(a_value = rngp_pat_attr_attr_low_level)  or else
				(a_value = rngp_pat_attr_elem_low_level)  or else
				(a_value = rngp_pat_data_except_attr_low_level)  or else
				(a_value = rngp_pat_data_except_elem_low_level)  or else
				(a_value = rngp_pat_data_except_empty_low_level)  or else
				(a_value = rngp_pat_data_except_group_low_level)  or else
				(a_value = rngp_pat_data_except_interleave_low_level)  or else
				(a_value = rngp_pat_data_except_list_low_level)  or else
				(a_value = rngp_pat_data_except_onemore_low_level)  or else
				(a_value = rngp_pat_data_except_ref_low_level)  or else
				(a_value = rngp_pat_data_except_text_low_level)  or else
				(a_value = rngp_pat_list_attr_low_level)  or else
				(a_value = rngp_pat_list_elem_low_level)  or else
				(a_value = rngp_pat_list_interleave_low_level)  or else
				(a_value = rngp_pat_list_list_low_level)  or else
				(a_value = rngp_pat_list_ref_low_level)  or else
				(a_value = rngp_pat_list_text_low_level)  or else
				(a_value = rngp_pat_nsname_except_anyname_low_level)  or else
				(a_value = rngp_pat_nsname_except_nsname_low_level)  or else
				(a_value = rngp_pat_onemore_group_attr_low_level)  or else
				(a_value = rngp_pat_onemore_interleave_attr_low_level)  or else
				(a_value = rngp_pat_start_attr_low_level)  or else
				(a_value = rngp_pat_start_data_low_level)  or else
				(a_value = rngp_pat_start_empty_low_level)  or else
				(a_value = rngp_pat_start_group_low_level)  or else
				(a_value = rngp_pat_start_interleave_low_level)  or else
				(a_value = rngp_pat_start_list_low_level)  or else
				(a_value = rngp_pat_start_onemore_low_level)  or else
				(a_value = rngp_pat_start_text_low_level)  or else
				(a_value = rngp_pat_start_value_low_level)  or else
				(a_value = rngp_prefix_undefined_low_level)  or else
				(a_value = rngp_ref_create_failed_low_level)  or else
				(a_value = rngp_ref_cycle_low_level)  or else
				(a_value = rngp_ref_name_invalid_low_level)  or else
				(a_value = rngp_ref_no_def_low_level)  or else
				(a_value = rngp_ref_no_name_low_level)  or else
				(a_value = rngp_ref_not_empty_low_level)  or else
				(a_value = rngp_start_choice_and_interleave_low_level)  or else
				(a_value = rngp_start_content_low_level)  or else
				(a_value = rngp_start_empty_low_level)  or else
				(a_value = rngp_start_missing_low_level)  or else
				(a_value = rngp_text_expected_low_level)  or else
				(a_value = rngp_text_has_child_low_level)  or else
				(a_value = rngp_type_missing_low_level)  or else
				(a_value = rngp_type_not_found_low_level)  or else
				(a_value = rngp_type_value_low_level)  or else
				(a_value = rngp_unknown_attribute_low_level)  or else
				(a_value = rngp_unknown_combine_low_level)  or else
				(a_value = rngp_unknown_construct_low_level)  or else
				(a_value = rngp_unknown_type_lib_low_level)  or else
				(a_value = rngp_uri_fragment_low_level)  or else
				(a_value = rngp_uri_not_absolute_low_level)  or else
				(a_value = rngp_value_empty_low_level)  or else
				(a_value = rngp_value_no_content_low_level)  or else
				(a_value = rngp_xml_ns_low_level)  or else
				(a_value = rngp_xmlns_name_low_level)  or else
				(a_value = save_char_invalid_low_level)  or else
				(a_value = save_no_doctype_low_level)  or else
				(a_value = save_not_utf8_low_level)  or else
				(a_value = save_unknown_encoding_low_level)  or else
				(a_value = schemap_a_props_correct_2_low_level)  or else
				(a_value = schemap_a_props_correct_3_low_level)  or else
				(a_value = schemap_ag_props_correct_low_level)  or else
				(a_value = schemap_attr_noname_noref_low_level)  or else
				(a_value = schemap_attrformdefault_value_low_level)  or else
				(a_value = schemap_attrgrp_noname_noref_low_level)  or else
				(a_value = schemap_au_props_correct_low_level)  or else
				(a_value = schemap_au_props_correct_2_low_level)  or else
				(a_value = schemap_c_props_correct_low_level)  or else
				(a_value = schemap_complextype_noname_noref_low_level)  or else
				(a_value = schemap_cos_all_limited_low_level)  or else
				(a_value = schemap_cos_ct_extends_1_1_low_level)  or else
				(a_value = schemap_cos_ct_extends_1_2_low_level)  or else
				(a_value = schemap_cos_ct_extends_1_3_low_level)  or else
				(a_value = schemap_cos_st_derived_ok_2_1_low_level)  or else
				(a_value = schemap_cos_st_derived_ok_2_2_low_level)  or else
				(a_value = schemap_cos_st_restricts_1_1_low_level)  or else
				(a_value = schemap_cos_st_restricts_1_2_low_level)  or else
				(a_value = schemap_cos_st_restricts_1_3_1_low_level)  or else
				(a_value = schemap_cos_st_restricts_1_3_2_low_level)  or else
				(a_value = schemap_cos_st_restricts_2_1_low_level)  or else
				(a_value = schemap_cos_st_restricts_2_3_1_1_low_level)  or else
				(a_value = schemap_cos_st_restricts_2_3_1_2_low_level)  or else
				(a_value = schemap_cos_st_restricts_2_3_2_1_low_level)  or else
				(a_value = schemap_cos_st_restricts_2_3_2_2_low_level)  or else
				(a_value = schemap_cos_st_restricts_2_3_2_3_low_level)  or else
				(a_value = schemap_cos_st_restricts_2_3_2_4_low_level)  or else
				(a_value = schemap_cos_st_restricts_2_3_2_5_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_1_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_1_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_1_2_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_2_1_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_2_2_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_2_3_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_2_4_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_2_5_low_level)  or else
				(a_value = schemap_cos_valid_default_1_low_level)  or else
				(a_value = schemap_cos_valid_default_2_1_low_level)  or else
				(a_value = schemap_cos_valid_default_2_2_1_low_level)  or else
				(a_value = schemap_cos_valid_default_2_2_2_low_level)  or else
				(a_value = schemap_ct_props_correct_1_low_level)  or else
				(a_value = schemap_ct_props_correct_2_low_level)  or else
				(a_value = schemap_ct_props_correct_3_low_level)  or else
				(a_value = schemap_ct_props_correct_4_low_level)  or else
				(a_value = schemap_ct_props_correct_5_low_level)  or else
				(a_value = schemap_cvc_simple_type_low_level)  or else
				(a_value = schemap_def_and_prefix_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_1_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_2_1_1_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_2_1_2_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_2_1_3_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_2_2_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_3_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_4_1_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_4_2_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_4_3_low_level)  or else
				(a_value = schemap_e_props_correct_2_low_level)  or else
				(a_value = schemap_e_props_correct_3_low_level)  or else
				(a_value = schemap_e_props_correct_4_low_level)  or else
				(a_value = schemap_e_props_correct_5_low_level)  or else
				(a_value = schemap_e_props_correct_6_low_level)  or else
				(a_value = schemap_elem_default_fixed_low_level)  or else
				(a_value = schemap_elem_noname_noref_low_level)  or else
				(a_value = schemap_elemformdefault_value_low_level)  or else
				(a_value = schemap_extension_no_base_low_level)  or else
				(a_value = schemap_facet_no_value_low_level)  or else
				(a_value = schemap_failed_build_import_low_level)  or else
				(a_value = schemap_failed_load_low_level)  or else
				(a_value = schemap_failed_parse_low_level)  or else
				(a_value = schemap_group_noname_noref_low_level)  or else
				(a_value = schemap_import_namespace_not_uri_low_level)  or else
				(a_value = schemap_import_redefine_nsname_low_level)  or else
				(a_value = schemap_import_schema_not_uri_low_level)  or else
				(a_value = schemap_include_schema_no_uri_low_level)  or else
				(a_value = schemap_include_schema_not_uri_low_level)  or else
				(a_value = schemap_internal_low_level)  or else
				(a_value = schemap_intersection_not_expressible_low_level)  or else
				(a_value = schemap_invalid_attr_combination_low_level)  or else
				(a_value = schemap_invalid_attr_inline_combination_low_level)  or else
				(a_value = schemap_invalid_attr_name_low_level)  or else
				(a_value = schemap_invalid_attr_use_low_level)  or else
				(a_value = schemap_invalid_boolean_low_level)  or else
				(a_value = schemap_invalid_enum_low_level)  or else
				(a_value = schemap_invalid_facet_low_level)  or else
				(a_value = schemap_invalid_facet_value_low_level)  or else
				(a_value = schemap_invalid_maxoccurs_low_level)  or else
				(a_value = schemap_invalid_minoccurs_low_level)  or else
				(a_value = schemap_invalid_ref_and_subtype_low_level)  or else
				(a_value = schemap_invalid_white_space_low_level)  or else
				(a_value = schemap_mg_props_correct_1_low_level)  or else
				(a_value = schemap_mg_props_correct_2_low_level)  or else
				(a_value = schemap_missing_simpletype_child_low_level)  or else
				(a_value = schemap_no_xmlns_low_level)  or else
				(a_value = schemap_no_xsi_low_level)  or else
				(a_value = schemap_noattr_noref_low_level)  or else
				(a_value = schemap_noroot_low_level)  or else
				(a_value = schemap_not_deterministic_low_level)  or else
				(a_value = schemap_not_schema_low_level)  or else
				(a_value = schemap_notation_no_name_low_level)  or else
				(a_value = schemap_nothing_to_parse_low_level)  or else
				(a_value = schemap_notype_noref_low_level)  or else
				(a_value = schemap_p_props_correct_1_low_level)  or else
				(a_value = schemap_p_props_correct_2_1_low_level)  or else
				(a_value = schemap_p_props_correct_2_2_low_level)  or else
				(a_value = schemap_prefix_undefined_low_level)  or else
				(a_value = schemap_recursive_low_level)  or else
				(a_value = schemap_redefined_attr_low_level)  or else
				(a_value = schemap_redefined_attrgroup_low_level)  or else
				(a_value = schemap_redefined_element_low_level)  or else
				(a_value = schemap_redefined_group_low_level)  or else
				(a_value = schemap_redefined_notation_low_level)  or else
				(a_value = schemap_redefined_type_low_level)  or else
				(a_value = schemap_ref_and_content_low_level)  or else
				(a_value = schemap_ref_and_subtype_low_level)  or else
				(a_value = schemap_regexp_invalid_low_level)  or else
				(a_value = schemap_restriction_noname_noref_low_level)  or else
				(a_value = schemap_s4s_attr_invalid_value_low_level)  or else
				(a_value = schemap_s4s_attr_missing_low_level)  or else
				(a_value = schemap_s4s_attr_not_allowed_low_level)  or else
				(a_value = schemap_s4s_elem_missing_low_level)  or else
				(a_value = schemap_s4s_elem_not_allowed_low_level)  or else
				(a_value = schemap_simpletype_noname_low_level)  or else
				(a_value = schemap_src_attribute_1_low_level)  or else
				(a_value = schemap_src_attribute_2_low_level)  or else
				(a_value = schemap_src_attribute_3_1_low_level)  or else
				(a_value = schemap_src_attribute_3_2_low_level)  or else
				(a_value = schemap_src_attribute_4_low_level)  or else
				(a_value = schemap_src_attribute_group_1_low_level)  or else
				(a_value = schemap_src_attribute_group_2_low_level)  or else
				(a_value = schemap_src_attribute_group_3_low_level)  or else
				(a_value = schemap_src_ct_1_low_level)  or else
				(a_value = schemap_src_element_1_low_level)  or else
				(a_value = schemap_src_element_2_1_low_level)  or else
				(a_value = schemap_src_element_2_2_low_level)  or else
				(a_value = schemap_src_element_3_low_level)  or else
				(a_value = schemap_src_import_low_level)  or else
				(a_value = schemap_src_import_1_1_low_level)  or else
				(a_value = schemap_src_import_1_2_low_level)  or else
				(a_value = schemap_src_import_2_low_level)  or else
				(a_value = schemap_src_import_2_1_low_level)  or else
				(a_value = schemap_src_import_2_2_low_level)  or else
				(a_value = schemap_src_import_3_1_low_level)  or else
				(a_value = schemap_src_import_3_2_low_level)  or else
				(a_value = schemap_src_include_low_level)  or else
				(a_value = schemap_src_list_itemtype_or_simpletype_low_level)  or else
				(a_value = schemap_src_redefine_low_level)  or else
				(a_value = schemap_src_resolve_low_level)  or else
				(a_value = schemap_src_restriction_base_or_simpletype_low_level)  or else
				(a_value = schemap_src_simple_type_1_low_level)  or else
				(a_value = schemap_src_simple_type_2_low_level)  or else
				(a_value = schemap_src_simple_type_3_low_level)  or else
				(a_value = schemap_src_simple_type_4_low_level)  or else
				(a_value = schemap_src_union_membertypes_or_simpletypes_low_level)  or else
				(a_value = schemap_st_props_correct_1_low_level)  or else
				(a_value = schemap_st_props_correct_2_low_level)  or else
				(a_value = schemap_st_props_correct_3_low_level)  or else
				(a_value = schemap_supernumerous_list_item_type_low_level)  or else
				(a_value = schemap_type_and_subtype_low_level)  or else
				(a_value = schemap_union_not_expressible_low_level)  or else
				(a_value = schemap_unknown_all_child_low_level)  or else
				(a_value = schemap_unknown_anyattribute_child_low_level)  or else
				(a_value = schemap_unknown_attr_child_low_level)  or else
				(a_value = schemap_unknown_attrgrp_child_low_level)  or else
				(a_value = schemap_unknown_attribute_group_low_level)  or else
				(a_value = schemap_unknown_base_type_low_level)  or else
				(a_value = schemap_unknown_choice_child_low_level)  or else
				(a_value = schemap_unknown_complexcontent_child_low_level)  or else
				(a_value = schemap_unknown_complextype_child_low_level)  or else
				(a_value = schemap_unknown_elem_child_low_level)  or else
				(a_value = schemap_unknown_extension_child_low_level)  or else
				(a_value = schemap_unknown_facet_child_low_level)  or else
				(a_value = schemap_unknown_facet_type_low_level)  or else
				(a_value = schemap_unknown_group_child_low_level)  or else
				(a_value = schemap_unknown_import_child_low_level)  or else
				(a_value = schemap_unknown_include_child_low_level)  or else
				(a_value = schemap_unknown_list_child_low_level)  or else
				(a_value = schemap_unknown_member_type_low_level)  or else
				(a_value = schemap_unknown_notation_child_low_level)  or else
				(a_value = schemap_unknown_prefix_low_level)  or else
				(a_value = schemap_unknown_processcontent_child_low_level)  or else
				(a_value = schemap_unknown_ref_low_level)  or else
				(a_value = schemap_unknown_restriction_child_low_level)  or else
				(a_value = schemap_unknown_schemas_child_low_level)  or else
				(a_value = schemap_unknown_sequence_child_low_level)  or else
				(a_value = schemap_unknown_simplecontent_child_low_level)  or else
				(a_value = schemap_unknown_simpletype_child_low_level)  or else
				(a_value = schemap_unknown_type_low_level)  or else
				(a_value = schemap_unknown_union_child_low_level)  or else
				(a_value = schemap_warn_attr_pointless_proh_low_level)  or else
				(a_value = schemap_warn_attr_redecl_proh_low_level)  or else
				(a_value = schemap_warn_skip_schema_low_level)  or else
				(a_value = schemap_warn_unlocated_schema_low_level)  or else
				(a_value = schemap_wildcard_invalid_ns_member_low_level)  or else
				(a_value = schematronv_assert_low_level)  or else
				(a_value = schematronv_report_low_level)  or else
				(a_value = schemav_attrinvalid_low_level)  or else
				(a_value = schemav_attrunknown_low_level)  or else
				(a_value = schemav_construct_low_level)  or else
				(a_value = schemav_cvc_attribute_1_low_level)  or else
				(a_value = schemav_cvc_attribute_2_low_level)  or else
				(a_value = schemav_cvc_attribute_3_low_level)  or else
				(a_value = schemav_cvc_attribute_4_low_level)  or else
				(a_value = schemav_cvc_au_low_level)  or else
				(a_value = schemav_cvc_complex_type_1_low_level)  or else
				(a_value = schemav_cvc_complex_type_2_1_low_level)  or else
				(a_value = schemav_cvc_complex_type_2_2_low_level)  or else
				(a_value = schemav_cvc_complex_type_2_3_low_level)  or else
				(a_value = schemav_cvc_complex_type_2_4_low_level)  or else
				(a_value = schemav_cvc_complex_type_3_1_low_level)  or else
				(a_value = schemav_cvc_complex_type_3_2_1_low_level)  or else
				(a_value = schemav_cvc_complex_type_3_2_2_low_level)  or else
				(a_value = schemav_cvc_complex_type_4_low_level)  or else
				(a_value = schemav_cvc_complex_type_5_1_low_level)  or else
				(a_value = schemav_cvc_complex_type_5_2_low_level)  or else
				(a_value = schemav_cvc_datatype_valid_1_2_1_low_level)  or else
				(a_value = schemav_cvc_datatype_valid_1_2_2_low_level)  or else
				(a_value = schemav_cvc_datatype_valid_1_2_3_low_level)  or else
				(a_value = schemav_cvc_elt_1_low_level)  or else
				(a_value = schemav_cvc_elt_2_low_level)  or else
				(a_value = schemav_cvc_elt_3_1_low_level)  or else
				(a_value = schemav_cvc_elt_3_2_1_low_level)  or else
				(a_value = schemav_cvc_elt_3_2_2_low_level)  or else
				(a_value = schemav_cvc_elt_4_1_low_level)  or else
				(a_value = schemav_cvc_elt_4_2_low_level)  or else
				(a_value = schemav_cvc_elt_4_3_low_level)  or else
				(a_value = schemav_cvc_elt_5_1_1_low_level)  or else
				(a_value = schemav_cvc_elt_5_1_2_low_level)  or else
				(a_value = schemav_cvc_elt_5_2_1_low_level)  or else
				(a_value = schemav_cvc_elt_5_2_2_1_low_level)  or else
				(a_value = schemav_cvc_elt_5_2_2_2_1_low_level)  or else
				(a_value = schemav_cvc_elt_5_2_2_2_2_low_level)  or else
				(a_value = schemav_cvc_elt_6_low_level)  or else
				(a_value = schemav_cvc_elt_7_low_level)  or else
				(a_value = schemav_cvc_enumeration_valid_low_level)  or else
				(a_value = schemav_cvc_facet_valid_low_level)  or else
				(a_value = schemav_cvc_fractiondigits_valid_low_level)  or else
				(a_value = schemav_cvc_idc_low_level)  or else
				(a_value = schemav_cvc_length_valid_low_level)  or else
				(a_value = schemav_cvc_maxexclusive_valid_low_level)  or else
				(a_value = schemav_cvc_maxinclusive_valid_low_level)  or else
				(a_value = schemav_cvc_maxlength_valid_low_level)  or else
				(a_value = schemav_cvc_minexclusive_valid_low_level)  or else
				(a_value = schemav_cvc_mininclusive_valid_low_level)  or else
				(a_value = schemav_cvc_minlength_valid_low_level)  or else
				(a_value = schemav_cvc_pattern_valid_low_level)  or else
				(a_value = schemav_cvc_totaldigits_valid_low_level)  or else
				(a_value = schemav_cvc_type_1_low_level)  or else
				(a_value = schemav_cvc_type_2_low_level)  or else
				(a_value = schemav_cvc_type_3_1_1_low_level)  or else
				(a_value = schemav_cvc_type_3_1_2_low_level)  or else
				(a_value = schemav_cvc_wildcard_low_level)  or else
				(a_value = schemav_document_element_missing_low_level)  or else
				(a_value = schemav_elemcont_low_level)  or else
				(a_value = schemav_element_content_low_level)  or else
				(a_value = schemav_extracontent_low_level)  or else
				(a_value = schemav_facet_low_level)  or else
				(a_value = schemav_havedefault_low_level)  or else
				(a_value = schemav_internal_low_level)  or else
				(a_value = schemav_invalidattr_low_level)  or else
				(a_value = schemav_invalidelem_low_level)  or else
				(a_value = schemav_isabstract_low_level)  or else
				(a_value = schemav_misc_low_level)  or else
				(a_value = schemav_missing_low_level)  or else
				(a_value = schemav_norollback_low_level)  or else
				(a_value = schemav_noroot_low_level)  or else
				(a_value = schemav_notdeterminist_low_level)  or else
				(a_value = schemav_notempty_low_level)  or else
				(a_value = schemav_notnillable_low_level)  or else
				(a_value = schemav_notsimple_low_level)  or else
				(a_value = schemav_nottoplevel_low_level)  or else
				(a_value = schemav_notype_low_level)  or else
				(a_value = schemav_undeclaredelem_low_level)  or else
				(a_value = schemav_value_low_level)  or else
				(a_value = schemav_wrongelem_low_level)  or else
				(a_value = tree_invalid_dec_low_level)  or else
				(a_value = tree_invalid_hex_low_level)  or else
				(a_value = tree_not_utf8_low_level)  or else
				(a_value = tree_unterminated_entity_low_level)  or else
				(a_value = war_catalog_pi_low_level)  or else
				(a_value = war_entity_redefined_low_level)  or else
				(a_value = war_lang_value_low_level)  or else
				(a_value = war_ns_column_low_level)  or else
				(a_value = war_ns_uri_low_level)  or else
				(a_value = war_ns_uri_relative_low_level)  or else
				(a_value = war_space_value_low_level)  or else
				(a_value = war_undeclared_entity_low_level)  or else
				(a_value = war_unknown_version_low_level)  or else
				(a_value = xinclude_build_failed_low_level)  or else
				(a_value = xinclude_deprecated_ns_low_level)  or else
				(a_value = xinclude_entity_def_mismatch_low_level)  or else
				(a_value = xinclude_fallback_not_in_include_low_level)  or else
				(a_value = xinclude_fallbacks_in_include_low_level)  or else
				(a_value = xinclude_fragment_id_low_level)  or else
				(a_value = xinclude_href_uri_low_level)  or else
				(a_value = xinclude_include_in_include_low_level)  or else
				(a_value = xinclude_invalid_char_low_level)  or else
				(a_value = xinclude_multiple_root_low_level)  or else
				(a_value = xinclude_no_fallback_low_level)  or else
				(a_value = xinclude_no_href_low_level)  or else
				(a_value = xinclude_parse_value_low_level)  or else
				(a_value = xinclude_recursion_low_level)  or else
				(a_value = xinclude_text_document_low_level)  or else
				(a_value = xinclude_text_fragment_low_level)  or else
				(a_value = xinclude_unknown_encoding_low_level)  or else
				(a_value = xinclude_xptr_failed_low_level)  or else
				(a_value = xinclude_xptr_result_low_level)  or else
				(a_value = xpath_encoding_error_low_level)  or else
				(a_value = xpath_expr_error_low_level)  or else
				(a_value = xpath_expression_ok_low_level)  or else
				(a_value = xpath_invalid_arity_low_level)  or else
				(a_value = xpath_invalid_char_error_low_level)  or else
				(a_value = xpath_invalid_ctxt_position_low_level)  or else
				(a_value = xpath_invalid_ctxt_size_low_level)  or else
				(a_value = xpath_invalid_operand_low_level)  or else
				(a_value = xpath_invalid_predicate_error_low_level)  or else
				(a_value = xpath_invalid_type_low_level)  or else
				(a_value = xpath_memory_error_low_level)  or else
				(a_value = xpath_number_error_low_level)  or else
				(a_value = xpath_start_literal_error_low_level)  or else
				(a_value = xpath_unclosed_error_low_level)  or else
				(a_value = xpath_undef_prefix_error_low_level)  or else
				(a_value = xpath_undef_variable_error_low_level)  or else
				(a_value = xpath_unfinished_literal_error_low_level)  or else
				(a_value = xpath_unknown_func_error_low_level)  or else
				(a_value = xpath_variable_ref_error_low_level)  or else
				(a_value = xptr_childseq_start_low_level)  or else
				(a_value = xptr_eval_failed_low_level)  or else
				(a_value = xptr_extra_objects_low_level)  or else
				(a_value = xptr_resource_error_low_level)  or else
				(a_value = xptr_sub_resource_error_low_level)  or else
				(a_value = xptr_syntax_error_low_level)  or else
				(a_value = xptr_unknown_scheme_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_buf_overflow
               do
                       value := buf_overflow_low_level
               end

	set_c14n_create_ctxt
               do
                       value := c14n_create_ctxt_low_level
               end

	set_c14n_create_stack
               do
                       value := c14n_create_stack_low_level
               end

	set_c14n_invalid_node
               do
                       value := c14n_invalid_node_low_level
               end

	set_c14n_relative_namespace
               do
                       value := c14n_relative_namespace_low_level
               end

	set_c14n_requires_utf8
               do
                       value := c14n_requires_utf8_low_level
               end

	set_c14n_unknow_node
               do
                       value := c14n_unknow_node_low_level
               end

	set_catalog_entry_broken
               do
                       value := catalog_entry_broken_low_level
               end

	set_catalog_missing_attr
               do
                       value := catalog_missing_attr_low_level
               end

	set_catalog_not_catalog
               do
                       value := catalog_not_catalog_low_level
               end

	set_catalog_prefer_value
               do
                       value := catalog_prefer_value_low_level
               end

	set_catalog_recursion
               do
                       value := catalog_recursion_low_level
               end

	set_check_entity_type
               do
                       value := check_entity_type_low_level
               end

	set_check_found_attribute
               do
                       value := check_found_attribute_low_level
               end

	set_check_found_cdata
               do
                       value := check_found_cdata_low_level
               end

	set_check_found_comment
               do
                       value := check_found_comment_low_level
               end

	set_check_found_doctype
               do
                       value := check_found_doctype_low_level
               end

	set_check_found_element
               do
                       value := check_found_element_low_level
               end

	set_check_found_entity
               do
                       value := check_found_entity_low_level
               end

	set_check_found_entityref
               do
                       value := check_found_entityref_low_level
               end

	set_check_found_fragment
               do
                       value := check_found_fragment_low_level
               end

	set_check_found_notation
               do
                       value := check_found_notation_low_level
               end

	set_check_found_pi
               do
                       value := check_found_pi_low_level
               end

	set_check_found_text
               do
                       value := check_found_text_low_level
               end

	set_check_name_not_null
               do
                       value := check_name_not_null_low_level
               end

	set_check_no_dict
               do
                       value := check_no_dict_low_level
               end

	set_check_no_doc
               do
                       value := check_no_doc_low_level
               end

	set_check_no_elem
               do
                       value := check_no_elem_low_level
               end

	set_check_no_href
               do
                       value := check_no_href_low_level
               end

	set_check_no_name
               do
                       value := check_no_name_low_level
               end

	set_check_no_next
               do
                       value := check_no_next_low_level
               end

	set_check_no_parent
               do
                       value := check_no_parent_low_level
               end

	set_check_no_prev
               do
                       value := check_no_prev_low_level
               end

	set_check_not_attr
               do
                       value := check_not_attr_low_level
               end

	set_check_not_attr_decl
               do
                       value := check_not_attr_decl_low_level
               end

	set_check_not_dtd
               do
                       value := check_not_dtd_low_level
               end

	set_check_not_elem_decl
               do
                       value := check_not_elem_decl_low_level
               end

	set_check_not_entity_decl
               do
                       value := check_not_entity_decl_low_level
               end

	set_check_not_ncname
               do
                       value := check_not_ncname_low_level
               end

	set_check_not_ns_decl
               do
                       value := check_not_ns_decl_low_level
               end

	set_check_not_utf8
               do
                       value := check_not_utf8_low_level
               end

	set_check_ns_ancestor
               do
                       value := check_ns_ancestor_low_level
               end

	set_check_ns_scope
               do
                       value := check_ns_scope_low_level
               end

	set_check_outside_dict
               do
                       value := check_outside_dict_low_level
               end

	set_check_unknown_node
               do
                       value := check_unknown_node_low_level
               end

	set_check_wrong_doc
               do
                       value := check_wrong_doc_low_level
               end

	set_check_wrong_name
               do
                       value := check_wrong_name_low_level
               end

	set_check_wrong_next
               do
                       value := check_wrong_next_low_level
               end

	set_check_wrong_parent
               do
                       value := check_wrong_parent_low_level
               end

	set_check_wrong_prev
               do
                       value := check_wrong_prev_low_level
               end

	set_dtd_attribute_default
               do
                       value := dtd_attribute_default_low_level
               end

	set_dtd_attribute_redefined
               do
                       value := dtd_attribute_redefined_low_level
               end

	set_dtd_attribute_value
               do
                       value := dtd_attribute_value_low_level
               end

	set_dtd_content_error
               do
                       value := dtd_content_error_low_level
               end

	set_dtd_content_model
               do
                       value := dtd_content_model_low_level
               end

	set_dtd_content_not_determinist
               do
                       value := dtd_content_not_determinist_low_level
               end

	set_dtd_different_prefix
               do
                       value := dtd_different_prefix_low_level
               end

	set_dtd_dup_token
               do
                       value := dtd_dup_token_low_level
               end

	set_dtd_elem_default_namespace
               do
                       value := dtd_elem_default_namespace_low_level
               end

	set_dtd_elem_namespace
               do
                       value := dtd_elem_namespace_low_level
               end

	set_dtd_elem_redefined
               do
                       value := dtd_elem_redefined_low_level
               end

	set_dtd_empty_notation
               do
                       value := dtd_empty_notation_low_level
               end

	set_dtd_entity_type
               do
                       value := dtd_entity_type_low_level
               end

	set_dtd_id_fixed
               do
                       value := dtd_id_fixed_low_level
               end

	set_dtd_id_redefined
               do
                       value := dtd_id_redefined_low_level
               end

	set_dtd_id_subset
               do
                       value := dtd_id_subset_low_level
               end

	set_dtd_invalid_child
               do
                       value := dtd_invalid_child_low_level
               end

	set_dtd_invalid_default
               do
                       value := dtd_invalid_default_low_level
               end

	set_dtd_load_error
               do
                       value := dtd_load_error_low_level
               end

	set_dtd_missing_attribute
               do
                       value := dtd_missing_attribute_low_level
               end

	set_dtd_mixed_corrupt
               do
                       value := dtd_mixed_corrupt_low_level
               end

	set_dtd_multiple_id
               do
                       value := dtd_multiple_id_low_level
               end

	set_dtd_no_doc
               do
                       value := dtd_no_doc_low_level
               end

	set_dtd_no_dtd
               do
                       value := dtd_no_dtd_low_level
               end

	set_dtd_no_elem_name
               do
                       value := dtd_no_elem_name_low_level
               end

	set_dtd_no_prefix
               do
                       value := dtd_no_prefix_low_level
               end

	set_dtd_no_root
               do
                       value := dtd_no_root_low_level
               end

	set_dtd_not_empty
               do
                       value := dtd_not_empty_low_level
               end

	set_dtd_not_pcdata
               do
                       value := dtd_not_pcdata_low_level
               end

	set_dtd_not_standalone
               do
                       value := dtd_not_standalone_low_level
               end

	set_dtd_notation_redefined
               do
                       value := dtd_notation_redefined_low_level
               end

	set_dtd_notation_value
               do
                       value := dtd_notation_value_low_level
               end

	set_dtd_root_name
               do
                       value := dtd_root_name_low_level
               end

	set_dtd_standalone_defaulted
               do
                       value := dtd_standalone_defaulted_low_level
               end

	set_dtd_standalone_white_space
               do
                       value := dtd_standalone_white_space_low_level
               end

	set_dtd_unknown_attribute
               do
                       value := dtd_unknown_attribute_low_level
               end

	set_dtd_unknown_elem
               do
                       value := dtd_unknown_elem_low_level
               end

	set_dtd_unknown_entity
               do
                       value := dtd_unknown_entity_low_level
               end

	set_dtd_unknown_id
               do
                       value := dtd_unknown_id_low_level
               end

	set_dtd_unknown_notation
               do
                       value := dtd_unknown_notation_low_level
               end

	set_dtd_xmlid_type
               do
                       value := dtd_xmlid_type_low_level
               end

	set_dtd_xmlid_value
               do
                       value := dtd_xmlid_value_low_level
               end

	set_err_attlist_not_finished
               do
                       value := err_attlist_not_finished_low_level
               end

	set_err_attlist_not_started
               do
                       value := err_attlist_not_started_low_level
               end

	set_err_attribute_not_finished
               do
                       value := err_attribute_not_finished_low_level
               end

	set_err_attribute_not_started
               do
                       value := err_attribute_not_started_low_level
               end

	set_err_attribute_redefined
               do
                       value := err_attribute_redefined_low_level
               end

	set_err_attribute_without_value
               do
                       value := err_attribute_without_value_low_level
               end

	set_err_cdata_not_finished
               do
                       value := err_cdata_not_finished_low_level
               end

	set_err_charref_at_eof
               do
                       value := err_charref_at_eof_low_level
               end

	set_err_charref_in_dtd
               do
                       value := err_charref_in_dtd_low_level
               end

	set_err_charref_in_epilog
               do
                       value := err_charref_in_epilog_low_level
               end

	set_err_charref_in_prolog
               do
                       value := err_charref_in_prolog_low_level
               end

	set_err_comment_not_finished
               do
                       value := err_comment_not_finished_low_level
               end

	set_err_condsec_invalid
               do
                       value := err_condsec_invalid_low_level
               end

	set_err_condsec_invalid_keyword
               do
                       value := err_condsec_invalid_keyword_low_level
               end

	set_err_condsec_not_finished
               do
                       value := err_condsec_not_finished_low_level
               end

	set_err_condsec_not_started
               do
                       value := err_condsec_not_started_low_level
               end

	set_err_doctype_not_finished
               do
                       value := err_doctype_not_finished_low_level
               end

	set_err_document_empty
               do
                       value := err_document_empty_low_level
               end

	set_err_document_end
               do
                       value := err_document_end_low_level
               end

	set_err_document_start
               do
                       value := err_document_start_low_level
               end

	set_err_elemcontent_not_finished
               do
                       value := err_elemcontent_not_finished_low_level
               end

	set_err_elemcontent_not_started
               do
                       value := err_elemcontent_not_started_low_level
               end

	set_err_encoding_name
               do
                       value := err_encoding_name_low_level
               end

	set_err_entity_boundary
               do
                       value := err_entity_boundary_low_level
               end

	set_err_entity_char_error
               do
                       value := err_entity_char_error_low_level
               end

	set_err_entity_is_external
               do
                       value := err_entity_is_external_low_level
               end

	set_err_entity_is_parameter
               do
                       value := err_entity_is_parameter_low_level
               end

	set_err_entity_loop
               do
                       value := err_entity_loop_low_level
               end

	set_err_entity_not_finished
               do
                       value := err_entity_not_finished_low_level
               end

	set_err_entity_not_started
               do
                       value := err_entity_not_started_low_level
               end

	set_err_entity_pe_internal
               do
                       value := err_entity_pe_internal_low_level
               end

	set_err_entity_processing
               do
                       value := err_entity_processing_low_level
               end

	set_err_entityref_at_eof
               do
                       value := err_entityref_at_eof_low_level
               end

	set_err_entityref_in_dtd
               do
                       value := err_entityref_in_dtd_low_level
               end

	set_err_entityref_in_epilog
               do
                       value := err_entityref_in_epilog_low_level
               end

	set_err_entityref_in_prolog
               do
                       value := err_entityref_in_prolog_low_level
               end

	set_err_entityref_no_name
               do
                       value := err_entityref_no_name_low_level
               end

	set_err_entityref_semicol_missing
               do
                       value := err_entityref_semicol_missing_low_level
               end

	set_err_equal_required
               do
                       value := err_equal_required_low_level
               end

	set_err_ext_entity_standalone
               do
                       value := err_ext_entity_standalone_low_level
               end

	set_err_ext_subset_not_finished
               do
                       value := err_ext_subset_not_finished_low_level
               end

	set_err_extra_content
               do
                       value := err_extra_content_low_level
               end

	set_err_gt_required
               do
                       value := err_gt_required_low_level
               end

	set_err_hyphen_in_comment
               do
                       value := err_hyphen_in_comment_low_level
               end

	set_err_internal_error
               do
                       value := err_internal_error_low_level
               end

	set_err_invalid_char
               do
                       value := err_invalid_char_low_level
               end

	set_err_invalid_charref
               do
                       value := err_invalid_charref_low_level
               end

	set_err_invalid_dec_charref
               do
                       value := err_invalid_dec_charref_low_level
               end

	set_err_invalid_encoding
               do
                       value := err_invalid_encoding_low_level
               end

	set_err_invalid_hex_charref
               do
                       value := err_invalid_hex_charref_low_level
               end

	set_err_invalid_uri
               do
                       value := err_invalid_uri_low_level
               end

	set_err_literal_not_finished
               do
                       value := err_literal_not_finished_low_level
               end

	set_err_literal_not_started
               do
                       value := err_literal_not_started_low_level
               end

	set_err_lt_in_attribute
               do
                       value := err_lt_in_attribute_low_level
               end

	set_err_lt_required
               do
                       value := err_lt_required_low_level
               end

	set_err_ltslash_required
               do
                       value := err_ltslash_required_low_level
               end

	set_err_misplaced_cdata_end
               do
                       value := err_misplaced_cdata_end_low_level
               end

	set_err_missing_encoding
               do
                       value := err_missing_encoding_low_level
               end

	set_err_mixed_not_finished
               do
                       value := err_mixed_not_finished_low_level
               end

	set_err_mixed_not_started
               do
                       value := err_mixed_not_started_low_level
               end

	set_err_name_required
               do
                       value := err_name_required_low_level
               end

	set_err_name_too_long
               do
                       value := err_name_too_long_low_level
               end

	set_err_nmtoken_required
               do
                       value := err_nmtoken_required_low_level
               end

	set_err_no_dtd
               do
                       value := err_no_dtd_low_level
               end

	set_err_no_memory
               do
                       value := err_no_memory_low_level
               end

	set_err_not_standalone
               do
                       value := err_not_standalone_low_level
               end

	set_err_not_well_balanced
               do
                       value := err_not_well_balanced_low_level
               end

	set_err_notation_not_finished
               do
                       value := err_notation_not_finished_low_level
               end

	set_err_notation_not_started
               do
                       value := err_notation_not_started_low_level
               end

	set_err_notation_processing
               do
                       value := err_notation_processing_low_level
               end

	set_err_ns_decl_error
               do
                       value := err_ns_decl_error_low_level
               end

	set_err_ok
               do
                       value := err_ok_low_level
               end

	set_err_pcdata_required
               do
                       value := err_pcdata_required_low_level
               end

	set_err_peref_at_eof
               do
                       value := err_peref_at_eof_low_level
               end

	set_err_peref_in_epilog
               do
                       value := err_peref_in_epilog_low_level
               end

	set_err_peref_in_int_subset
               do
                       value := err_peref_in_int_subset_low_level
               end

	set_err_peref_in_prolog
               do
                       value := err_peref_in_prolog_low_level
               end

	set_err_peref_no_name
               do
                       value := err_peref_no_name_low_level
               end

	set_err_peref_semicol_missing
               do
                       value := err_peref_semicol_missing_low_level
               end

	set_err_pi_not_finished
               do
                       value := err_pi_not_finished_low_level
               end

	set_err_pi_not_started
               do
                       value := err_pi_not_started_low_level
               end

	set_err_pubid_required
               do
                       value := err_pubid_required_low_level
               end

	set_err_reserved_xml_name
               do
                       value := err_reserved_xml_name_low_level
               end

	set_err_separator_required
               do
                       value := err_separator_required_low_level
               end

	set_err_space_required
               do
                       value := err_space_required_low_level
               end

	set_err_standalone_value
               do
                       value := err_standalone_value_low_level
               end

	set_err_string_not_closed
               do
                       value := err_string_not_closed_low_level
               end

	set_err_string_not_started
               do
                       value := err_string_not_started_low_level
               end

	set_err_tag_name_mismatch
               do
                       value := err_tag_name_mismatch_low_level
               end

	set_err_tag_not_finished
               do
                       value := err_tag_not_finished_low_level
               end

	set_err_undeclared_entity
               do
                       value := err_undeclared_entity_low_level
               end

	set_err_unknown_encoding
               do
                       value := err_unknown_encoding_low_level
               end

	set_err_unknown_version
               do
                       value := err_unknown_version_low_level
               end

	set_err_unparsed_entity
               do
                       value := err_unparsed_entity_low_level
               end

	set_err_unsupported_encoding
               do
                       value := err_unsupported_encoding_low_level
               end

	set_err_uri_fragment
               do
                       value := err_uri_fragment_low_level
               end

	set_err_uri_required
               do
                       value := err_uri_required_low_level
               end

	set_err_user_stop
               do
                       value := err_user_stop_low_level
               end

	set_err_value_required
               do
                       value := err_value_required_low_level
               end

	set_err_version_mismatch
               do
                       value := err_version_mismatch_low_level
               end

	set_err_version_missing
               do
                       value := err_version_missing_low_level
               end

	set_err_xmldecl_not_finished
               do
                       value := err_xmldecl_not_finished_low_level
               end

	set_err_xmldecl_not_started
               do
                       value := err_xmldecl_not_started_low_level
               end

	set_ftp_accnt
               do
                       value := ftp_accnt_low_level
               end

	set_ftp_epsv_answer
               do
                       value := ftp_epsv_answer_low_level
               end

	set_ftp_pasv_answer
               do
                       value := ftp_pasv_answer_low_level
               end

	set_ftp_url_syntax
               do
                       value := ftp_url_syntax_low_level
               end

	set_html_strucure_error
               do
                       value := html_strucure_error_low_level
               end

	set_html_unknown_tag
               do
                       value := html_unknown_tag_low_level
               end

	set_http_unknown_host
               do
                       value := http_unknown_host_low_level
               end

	set_http_url_syntax
               do
                       value := http_url_syntax_low_level
               end

	set_http_use_ip
               do
                       value := http_use_ip_low_level
               end

	set_i18n_conv_failed
               do
                       value := i18n_conv_failed_low_level
               end

	set_i18n_excess_handler
               do
                       value := i18n_excess_handler_low_level
               end

	set_i18n_no_handler
               do
                       value := i18n_no_handler_low_level
               end

	set_i18n_no_name
               do
                       value := i18n_no_name_low_level
               end

	set_i18n_no_output
               do
                       value := i18n_no_output_low_level
               end

	set_io_buffer_full
               do
                       value := io_buffer_full_low_level
               end

	set_io_eacces
               do
                       value := io_eacces_low_level
               end

	set_io_eaddrinuse
               do
                       value := io_eaddrinuse_low_level
               end

	set_io_eafnosupport
               do
                       value := io_eafnosupport_low_level
               end

	set_io_eagain
               do
                       value := io_eagain_low_level
               end

	set_io_ealready
               do
                       value := io_ealready_low_level
               end

	set_io_ebadf
               do
                       value := io_ebadf_low_level
               end

	set_io_ebadmsg
               do
                       value := io_ebadmsg_low_level
               end

	set_io_ebusy
               do
                       value := io_ebusy_low_level
               end

	set_io_ecanceled
               do
                       value := io_ecanceled_low_level
               end

	set_io_echild
               do
                       value := io_echild_low_level
               end

	set_io_econnrefused
               do
                       value := io_econnrefused_low_level
               end

	set_io_edeadlk
               do
                       value := io_edeadlk_low_level
               end

	set_io_edom
               do
                       value := io_edom_low_level
               end

	set_io_eexist
               do
                       value := io_eexist_low_level
               end

	set_io_efault
               do
                       value := io_efault_low_level
               end

	set_io_efbig
               do
                       value := io_efbig_low_level
               end

	set_io_einprogress
               do
                       value := io_einprogress_low_level
               end

	set_io_eintr
               do
                       value := io_eintr_low_level
               end

	set_io_einval
               do
                       value := io_einval_low_level
               end

	set_io_eio
               do
                       value := io_eio_low_level
               end

	set_io_eisconn
               do
                       value := io_eisconn_low_level
               end

	set_io_eisdir
               do
                       value := io_eisdir_low_level
               end

	set_io_emfile
               do
                       value := io_emfile_low_level
               end

	set_io_emlink
               do
                       value := io_emlink_low_level
               end

	set_io_emsgsize
               do
                       value := io_emsgsize_low_level
               end

	set_io_enametoolong
               do
                       value := io_enametoolong_low_level
               end

	set_io_encoder
               do
                       value := io_encoder_low_level
               end

	set_io_enetunreach
               do
                       value := io_enetunreach_low_level
               end

	set_io_enfile
               do
                       value := io_enfile_low_level
               end

	set_io_enodev
               do
                       value := io_enodev_low_level
               end

	set_io_enoent
               do
                       value := io_enoent_low_level
               end

	set_io_enoexec
               do
                       value := io_enoexec_low_level
               end

	set_io_enolck
               do
                       value := io_enolck_low_level
               end

	set_io_enomem
               do
                       value := io_enomem_low_level
               end

	set_io_enospc
               do
                       value := io_enospc_low_level
               end

	set_io_enosys
               do
                       value := io_enosys_low_level
               end

	set_io_enotdir
               do
                       value := io_enotdir_low_level
               end

	set_io_enotempty
               do
                       value := io_enotempty_low_level
               end

	set_io_enotsock
               do
                       value := io_enotsock_low_level
               end

	set_io_enotsup
               do
                       value := io_enotsup_low_level
               end

	set_io_enotty
               do
                       value := io_enotty_low_level
               end

	set_io_enxio
               do
                       value := io_enxio_low_level
               end

	set_io_eperm
               do
                       value := io_eperm_low_level
               end

	set_io_epipe
               do
                       value := io_epipe_low_level
               end

	set_io_erange
               do
                       value := io_erange_low_level
               end

	set_io_erofs
               do
                       value := io_erofs_low_level
               end

	set_io_espipe
               do
                       value := io_espipe_low_level
               end

	set_io_esrch
               do
                       value := io_esrch_low_level
               end

	set_io_etimedout
               do
                       value := io_etimedout_low_level
               end

	set_io_exdev
               do
                       value := io_exdev_low_level
               end

	set_io_flush
               do
                       value := io_flush_low_level
               end

	set_io_load_error
               do
                       value := io_load_error_low_level
               end

	set_io_network_attempt
               do
                       value := io_network_attempt_low_level
               end

	set_io_no_input
               do
                       value := io_no_input_low_level
               end

	set_io_unknown
               do
                       value := io_unknown_low_level
               end

	set_io_write
               do
                       value := io_write_low_level
               end

	set_module_close
               do
                       value := module_close_low_level
               end

	set_module_open
               do
                       value := module_open_low_level
               end

	set_ns_err_attribute_redefined
               do
                       value := ns_err_attribute_redefined_low_level
               end

	set_ns_err_colon
               do
                       value := ns_err_colon_low_level
               end

	set_ns_err_empty
               do
                       value := ns_err_empty_low_level
               end

	set_ns_err_qname
               do
                       value := ns_err_qname_low_level
               end

	set_ns_err_undefined_namespace
               do
                       value := ns_err_undefined_namespace_low_level
               end

	set_ns_err_xml_namespace
               do
                       value := ns_err_xml_namespace_low_level
               end

	set_regexp_compile_error
               do
                       value := regexp_compile_error_low_level
               end

	set_rngp_anyname_attr_ancestor
               do
                       value := rngp_anyname_attr_ancestor_low_level
               end

	set_rngp_attr_conflict
               do
                       value := rngp_attr_conflict_low_level
               end

	set_rngp_attribute_children
               do
                       value := rngp_attribute_children_low_level
               end

	set_rngp_attribute_content
               do
                       value := rngp_attribute_content_low_level
               end

	set_rngp_attribute_empty
               do
                       value := rngp_attribute_empty_low_level
               end

	set_rngp_attribute_noop
               do
                       value := rngp_attribute_noop_low_level
               end

	set_rngp_choice_content
               do
                       value := rngp_choice_content_low_level
               end

	set_rngp_choice_empty
               do
                       value := rngp_choice_empty_low_level
               end

	set_rngp_create_failure
               do
                       value := rngp_create_failure_low_level
               end

	set_rngp_data_content
               do
                       value := rngp_data_content_low_level
               end

	set_rngp_def_choice_and_interleave
               do
                       value := rngp_def_choice_and_interleave_low_level
               end

	set_rngp_define_create_failed
               do
                       value := rngp_define_create_failed_low_level
               end

	set_rngp_define_empty
               do
                       value := rngp_define_empty_low_level
               end

	set_rngp_define_missing
               do
                       value := rngp_define_missing_low_level
               end

	set_rngp_define_name_missing
               do
                       value := rngp_define_name_missing_low_level
               end

	set_rngp_elem_content_empty
               do
                       value := rngp_elem_content_empty_low_level
               end

	set_rngp_elem_content_error
               do
                       value := rngp_elem_content_error_low_level
               end

	set_rngp_elem_text_conflict
               do
                       value := rngp_elem_text_conflict_low_level
               end

	set_rngp_element_content
               do
                       value := rngp_element_content_low_level
               end

	set_rngp_element_empty
               do
                       value := rngp_element_empty_low_level
               end

	set_rngp_element_name
               do
                       value := rngp_element_name_low_level
               end

	set_rngp_element_no_content
               do
                       value := rngp_element_no_content_low_level
               end

	set_rngp_empty
               do
                       value := rngp_empty_low_level
               end

	set_rngp_empty_construct
               do
                       value := rngp_empty_construct_low_level
               end

	set_rngp_empty_content
               do
                       value := rngp_empty_content_low_level
               end

	set_rngp_empty_not_empty
               do
                       value := rngp_empty_not_empty_low_level
               end

	set_rngp_error_type_lib
               do
                       value := rngp_error_type_lib_low_level
               end

	set_rngp_except_empty
               do
                       value := rngp_except_empty_low_level
               end

	set_rngp_except_missing
               do
                       value := rngp_except_missing_low_level
               end

	set_rngp_except_multiple
               do
                       value := rngp_except_multiple_low_level
               end

	set_rngp_except_no_content
               do
                       value := rngp_except_no_content_low_level
               end

	set_rngp_external_ref_failure
               do
                       value := rngp_external_ref_failure_low_level
               end

	set_rngp_externalref_emtpy
               do
                       value := rngp_externalref_emtpy_low_level
               end

	set_rngp_externalref_recurse
               do
                       value := rngp_externalref_recurse_low_level
               end

	set_rngp_forbidden_attribute
               do
                       value := rngp_forbidden_attribute_low_level
               end

	set_rngp_foreign_element
               do
                       value := rngp_foreign_element_low_level
               end

	set_rngp_grammar_content
               do
                       value := rngp_grammar_content_low_level
               end

	set_rngp_grammar_empty
               do
                       value := rngp_grammar_empty_low_level
               end

	set_rngp_grammar_missing
               do
                       value := rngp_grammar_missing_low_level
               end

	set_rngp_grammar_no_start
               do
                       value := rngp_grammar_no_start_low_level
               end

	set_rngp_group_attr_conflict
               do
                       value := rngp_group_attr_conflict_low_level
               end

	set_rngp_href_error
               do
                       value := rngp_href_error_low_level
               end

	set_rngp_include_empty
               do
                       value := rngp_include_empty_low_level
               end

	set_rngp_include_failure
               do
                       value := rngp_include_failure_low_level
               end

	set_rngp_include_recurse
               do
                       value := rngp_include_recurse_low_level
               end

	set_rngp_interleave_add
               do
                       value := rngp_interleave_add_low_level
               end

	set_rngp_interleave_create_failed
               do
                       value := rngp_interleave_create_failed_low_level
               end

	set_rngp_interleave_empty
               do
                       value := rngp_interleave_empty_low_level
               end

	set_rngp_interleave_no_content
               do
                       value := rngp_interleave_no_content_low_level
               end

	set_rngp_invalid_define_name
               do
                       value := rngp_invalid_define_name_low_level
               end

	set_rngp_invalid_uri
               do
                       value := rngp_invalid_uri_low_level
               end

	set_rngp_invalid_value
               do
                       value := rngp_invalid_value_low_level
               end

	set_rngp_missing_href
               do
                       value := rngp_missing_href_low_level
               end

	set_rngp_name_missing
               do
                       value := rngp_name_missing_low_level
               end

	set_rngp_need_combine
               do
                       value := rngp_need_combine_low_level
               end

	set_rngp_notallowed_not_empty
               do
                       value := rngp_notallowed_not_empty_low_level
               end

	set_rngp_nsname_attr_ancestor
               do
                       value := rngp_nsname_attr_ancestor_low_level
               end

	set_rngp_nsname_no_ns
               do
                       value := rngp_nsname_no_ns_low_level
               end

	set_rngp_param_forbidden
               do
                       value := rngp_param_forbidden_low_level
               end

	set_rngp_param_name_missing
               do
                       value := rngp_param_name_missing_low_level
               end

	set_rngp_parentref_create_failed
               do
                       value := rngp_parentref_create_failed_low_level
               end

	set_rngp_parentref_name_invalid
               do
                       value := rngp_parentref_name_invalid_low_level
               end

	set_rngp_parentref_no_name
               do
                       value := rngp_parentref_no_name_low_level
               end

	set_rngp_parentref_no_parent
               do
                       value := rngp_parentref_no_parent_low_level
               end

	set_rngp_parentref_not_empty
               do
                       value := rngp_parentref_not_empty_low_level
               end

	set_rngp_parse_error
               do
                       value := rngp_parse_error_low_level
               end

	set_rngp_pat_anyname_except_anyname
               do
                       value := rngp_pat_anyname_except_anyname_low_level
               end

	set_rngp_pat_attr_attr
               do
                       value := rngp_pat_attr_attr_low_level
               end

	set_rngp_pat_attr_elem
               do
                       value := rngp_pat_attr_elem_low_level
               end

	set_rngp_pat_data_except_attr
               do
                       value := rngp_pat_data_except_attr_low_level
               end

	set_rngp_pat_data_except_elem
               do
                       value := rngp_pat_data_except_elem_low_level
               end

	set_rngp_pat_data_except_empty
               do
                       value := rngp_pat_data_except_empty_low_level
               end

	set_rngp_pat_data_except_group
               do
                       value := rngp_pat_data_except_group_low_level
               end

	set_rngp_pat_data_except_interleave
               do
                       value := rngp_pat_data_except_interleave_low_level
               end

	set_rngp_pat_data_except_list
               do
                       value := rngp_pat_data_except_list_low_level
               end

	set_rngp_pat_data_except_onemore
               do
                       value := rngp_pat_data_except_onemore_low_level
               end

	set_rngp_pat_data_except_ref
               do
                       value := rngp_pat_data_except_ref_low_level
               end

	set_rngp_pat_data_except_text
               do
                       value := rngp_pat_data_except_text_low_level
               end

	set_rngp_pat_list_attr
               do
                       value := rngp_pat_list_attr_low_level
               end

	set_rngp_pat_list_elem
               do
                       value := rngp_pat_list_elem_low_level
               end

	set_rngp_pat_list_interleave
               do
                       value := rngp_pat_list_interleave_low_level
               end

	set_rngp_pat_list_list
               do
                       value := rngp_pat_list_list_low_level
               end

	set_rngp_pat_list_ref
               do
                       value := rngp_pat_list_ref_low_level
               end

	set_rngp_pat_list_text
               do
                       value := rngp_pat_list_text_low_level
               end

	set_rngp_pat_nsname_except_anyname
               do
                       value := rngp_pat_nsname_except_anyname_low_level
               end

	set_rngp_pat_nsname_except_nsname
               do
                       value := rngp_pat_nsname_except_nsname_low_level
               end

	set_rngp_pat_onemore_group_attr
               do
                       value := rngp_pat_onemore_group_attr_low_level
               end

	set_rngp_pat_onemore_interleave_attr
               do
                       value := rngp_pat_onemore_interleave_attr_low_level
               end

	set_rngp_pat_start_attr
               do
                       value := rngp_pat_start_attr_low_level
               end

	set_rngp_pat_start_data
               do
                       value := rngp_pat_start_data_low_level
               end

	set_rngp_pat_start_empty
               do
                       value := rngp_pat_start_empty_low_level
               end

	set_rngp_pat_start_group
               do
                       value := rngp_pat_start_group_low_level
               end

	set_rngp_pat_start_interleave
               do
                       value := rngp_pat_start_interleave_low_level
               end

	set_rngp_pat_start_list
               do
                       value := rngp_pat_start_list_low_level
               end

	set_rngp_pat_start_onemore
               do
                       value := rngp_pat_start_onemore_low_level
               end

	set_rngp_pat_start_text
               do
                       value := rngp_pat_start_text_low_level
               end

	set_rngp_pat_start_value
               do
                       value := rngp_pat_start_value_low_level
               end

	set_rngp_prefix_undefined
               do
                       value := rngp_prefix_undefined_low_level
               end

	set_rngp_ref_create_failed
               do
                       value := rngp_ref_create_failed_low_level
               end

	set_rngp_ref_cycle
               do
                       value := rngp_ref_cycle_low_level
               end

	set_rngp_ref_name_invalid
               do
                       value := rngp_ref_name_invalid_low_level
               end

	set_rngp_ref_no_def
               do
                       value := rngp_ref_no_def_low_level
               end

	set_rngp_ref_no_name
               do
                       value := rngp_ref_no_name_low_level
               end

	set_rngp_ref_not_empty
               do
                       value := rngp_ref_not_empty_low_level
               end

	set_rngp_start_choice_and_interleave
               do
                       value := rngp_start_choice_and_interleave_low_level
               end

	set_rngp_start_content
               do
                       value := rngp_start_content_low_level
               end

	set_rngp_start_empty
               do
                       value := rngp_start_empty_low_level
               end

	set_rngp_start_missing
               do
                       value := rngp_start_missing_low_level
               end

	set_rngp_text_expected
               do
                       value := rngp_text_expected_low_level
               end

	set_rngp_text_has_child
               do
                       value := rngp_text_has_child_low_level
               end

	set_rngp_type_missing
               do
                       value := rngp_type_missing_low_level
               end

	set_rngp_type_not_found
               do
                       value := rngp_type_not_found_low_level
               end

	set_rngp_type_value
               do
                       value := rngp_type_value_low_level
               end

	set_rngp_unknown_attribute
               do
                       value := rngp_unknown_attribute_low_level
               end

	set_rngp_unknown_combine
               do
                       value := rngp_unknown_combine_low_level
               end

	set_rngp_unknown_construct
               do
                       value := rngp_unknown_construct_low_level
               end

	set_rngp_unknown_type_lib
               do
                       value := rngp_unknown_type_lib_low_level
               end

	set_rngp_uri_fragment
               do
                       value := rngp_uri_fragment_low_level
               end

	set_rngp_uri_not_absolute
               do
                       value := rngp_uri_not_absolute_low_level
               end

	set_rngp_value_empty
               do
                       value := rngp_value_empty_low_level
               end

	set_rngp_value_no_content
               do
                       value := rngp_value_no_content_low_level
               end

	set_rngp_xml_ns
               do
                       value := rngp_xml_ns_low_level
               end

	set_rngp_xmlns_name
               do
                       value := rngp_xmlns_name_low_level
               end

	set_save_char_invalid
               do
                       value := save_char_invalid_low_level
               end

	set_save_no_doctype
               do
                       value := save_no_doctype_low_level
               end

	set_save_not_utf8
               do
                       value := save_not_utf8_low_level
               end

	set_save_unknown_encoding
               do
                       value := save_unknown_encoding_low_level
               end

	set_schemap_a_props_correct_2
               do
                       value := schemap_a_props_correct_2_low_level
               end

	set_schemap_a_props_correct_3
               do
                       value := schemap_a_props_correct_3_low_level
               end

	set_schemap_ag_props_correct
               do
                       value := schemap_ag_props_correct_low_level
               end

	set_schemap_attr_noname_noref
               do
                       value := schemap_attr_noname_noref_low_level
               end

	set_schemap_attrformdefault_value
               do
                       value := schemap_attrformdefault_value_low_level
               end

	set_schemap_attrgrp_noname_noref
               do
                       value := schemap_attrgrp_noname_noref_low_level
               end

	set_schemap_au_props_correct
               do
                       value := schemap_au_props_correct_low_level
               end

	set_schemap_au_props_correct_2
               do
                       value := schemap_au_props_correct_2_low_level
               end

	set_schemap_c_props_correct
               do
                       value := schemap_c_props_correct_low_level
               end

	set_schemap_complextype_noname_noref
               do
                       value := schemap_complextype_noname_noref_low_level
               end

	set_schemap_cos_all_limited
               do
                       value := schemap_cos_all_limited_low_level
               end

	set_schemap_cos_ct_extends_1_1
               do
                       value := schemap_cos_ct_extends_1_1_low_level
               end

	set_schemap_cos_ct_extends_1_2
               do
                       value := schemap_cos_ct_extends_1_2_low_level
               end

	set_schemap_cos_ct_extends_1_3
               do
                       value := schemap_cos_ct_extends_1_3_low_level
               end

	set_schemap_cos_st_derived_ok_2_1
               do
                       value := schemap_cos_st_derived_ok_2_1_low_level
               end

	set_schemap_cos_st_derived_ok_2_2
               do
                       value := schemap_cos_st_derived_ok_2_2_low_level
               end

	set_schemap_cos_st_restricts_1_1
               do
                       value := schemap_cos_st_restricts_1_1_low_level
               end

	set_schemap_cos_st_restricts_1_2
               do
                       value := schemap_cos_st_restricts_1_2_low_level
               end

	set_schemap_cos_st_restricts_1_3_1
               do
                       value := schemap_cos_st_restricts_1_3_1_low_level
               end

	set_schemap_cos_st_restricts_1_3_2
               do
                       value := schemap_cos_st_restricts_1_3_2_low_level
               end

	set_schemap_cos_st_restricts_2_1
               do
                       value := schemap_cos_st_restricts_2_1_low_level
               end

	set_schemap_cos_st_restricts_2_3_1_1
               do
                       value := schemap_cos_st_restricts_2_3_1_1_low_level
               end

	set_schemap_cos_st_restricts_2_3_1_2
               do
                       value := schemap_cos_st_restricts_2_3_1_2_low_level
               end

	set_schemap_cos_st_restricts_2_3_2_1
               do
                       value := schemap_cos_st_restricts_2_3_2_1_low_level
               end

	set_schemap_cos_st_restricts_2_3_2_2
               do
                       value := schemap_cos_st_restricts_2_3_2_2_low_level
               end

	set_schemap_cos_st_restricts_2_3_2_3
               do
                       value := schemap_cos_st_restricts_2_3_2_3_low_level
               end

	set_schemap_cos_st_restricts_2_3_2_4
               do
                       value := schemap_cos_st_restricts_2_3_2_4_low_level
               end

	set_schemap_cos_st_restricts_2_3_2_5
               do
                       value := schemap_cos_st_restricts_2_3_2_5_low_level
               end

	set_schemap_cos_st_restricts_3_1
               do
                       value := schemap_cos_st_restricts_3_1_low_level
               end

	set_schemap_cos_st_restricts_3_3_1
               do
                       value := schemap_cos_st_restricts_3_3_1_low_level
               end

	set_schemap_cos_st_restricts_3_3_1_2
               do
                       value := schemap_cos_st_restricts_3_3_1_2_low_level
               end

	set_schemap_cos_st_restricts_3_3_2_1
               do
                       value := schemap_cos_st_restricts_3_3_2_1_low_level
               end

	set_schemap_cos_st_restricts_3_3_2_2
               do
                       value := schemap_cos_st_restricts_3_3_2_2_low_level
               end

	set_schemap_cos_st_restricts_3_3_2_3
               do
                       value := schemap_cos_st_restricts_3_3_2_3_low_level
               end

	set_schemap_cos_st_restricts_3_3_2_4
               do
                       value := schemap_cos_st_restricts_3_3_2_4_low_level
               end

	set_schemap_cos_st_restricts_3_3_2_5
               do
                       value := schemap_cos_st_restricts_3_3_2_5_low_level
               end

	set_schemap_cos_valid_default_1
               do
                       value := schemap_cos_valid_default_1_low_level
               end

	set_schemap_cos_valid_default_2_1
               do
                       value := schemap_cos_valid_default_2_1_low_level
               end

	set_schemap_cos_valid_default_2_2_1
               do
                       value := schemap_cos_valid_default_2_2_1_low_level
               end

	set_schemap_cos_valid_default_2_2_2
               do
                       value := schemap_cos_valid_default_2_2_2_low_level
               end

	set_schemap_ct_props_correct_1
               do
                       value := schemap_ct_props_correct_1_low_level
               end

	set_schemap_ct_props_correct_2
               do
                       value := schemap_ct_props_correct_2_low_level
               end

	set_schemap_ct_props_correct_3
               do
                       value := schemap_ct_props_correct_3_low_level
               end

	set_schemap_ct_props_correct_4
               do
                       value := schemap_ct_props_correct_4_low_level
               end

	set_schemap_ct_props_correct_5
               do
                       value := schemap_ct_props_correct_5_low_level
               end

	set_schemap_cvc_simple_type
               do
                       value := schemap_cvc_simple_type_low_level
               end

	set_schemap_def_and_prefix
               do
                       value := schemap_def_and_prefix_low_level
               end

	set_schemap_derivation_ok_restriction_1
               do
                       value := schemap_derivation_ok_restriction_1_low_level
               end

	set_schemap_derivation_ok_restriction_2_1_1
               do
                       value := schemap_derivation_ok_restriction_2_1_1_low_level
               end

	set_schemap_derivation_ok_restriction_2_1_2
               do
                       value := schemap_derivation_ok_restriction_2_1_2_low_level
               end

	set_schemap_derivation_ok_restriction_2_1_3
               do
                       value := schemap_derivation_ok_restriction_2_1_3_low_level
               end

	set_schemap_derivation_ok_restriction_2_2
               do
                       value := schemap_derivation_ok_restriction_2_2_low_level
               end

	set_schemap_derivation_ok_restriction_3
               do
                       value := schemap_derivation_ok_restriction_3_low_level
               end

	set_schemap_derivation_ok_restriction_4_1
               do
                       value := schemap_derivation_ok_restriction_4_1_low_level
               end

	set_schemap_derivation_ok_restriction_4_2
               do
                       value := schemap_derivation_ok_restriction_4_2_low_level
               end

	set_schemap_derivation_ok_restriction_4_3
               do
                       value := schemap_derivation_ok_restriction_4_3_low_level
               end

	set_schemap_e_props_correct_2
               do
                       value := schemap_e_props_correct_2_low_level
               end

	set_schemap_e_props_correct_3
               do
                       value := schemap_e_props_correct_3_low_level
               end

	set_schemap_e_props_correct_4
               do
                       value := schemap_e_props_correct_4_low_level
               end

	set_schemap_e_props_correct_5
               do
                       value := schemap_e_props_correct_5_low_level
               end

	set_schemap_e_props_correct_6
               do
                       value := schemap_e_props_correct_6_low_level
               end

	set_schemap_elem_default_fixed
               do
                       value := schemap_elem_default_fixed_low_level
               end

	set_schemap_elem_noname_noref
               do
                       value := schemap_elem_noname_noref_low_level
               end

	set_schemap_elemformdefault_value
               do
                       value := schemap_elemformdefault_value_low_level
               end

	set_schemap_extension_no_base
               do
                       value := schemap_extension_no_base_low_level
               end

	set_schemap_facet_no_value
               do
                       value := schemap_facet_no_value_low_level
               end

	set_schemap_failed_build_import
               do
                       value := schemap_failed_build_import_low_level
               end

	set_schemap_failed_load
               do
                       value := schemap_failed_load_low_level
               end

	set_schemap_failed_parse
               do
                       value := schemap_failed_parse_low_level
               end

	set_schemap_group_noname_noref
               do
                       value := schemap_group_noname_noref_low_level
               end

	set_schemap_import_namespace_not_uri
               do
                       value := schemap_import_namespace_not_uri_low_level
               end

	set_schemap_import_redefine_nsname
               do
                       value := schemap_import_redefine_nsname_low_level
               end

	set_schemap_import_schema_not_uri
               do
                       value := schemap_import_schema_not_uri_low_level
               end

	set_schemap_include_schema_no_uri
               do
                       value := schemap_include_schema_no_uri_low_level
               end

	set_schemap_include_schema_not_uri
               do
                       value := schemap_include_schema_not_uri_low_level
               end

	set_schemap_internal
               do
                       value := schemap_internal_low_level
               end

	set_schemap_intersection_not_expressible
               do
                       value := schemap_intersection_not_expressible_low_level
               end

	set_schemap_invalid_attr_combination
               do
                       value := schemap_invalid_attr_combination_low_level
               end

	set_schemap_invalid_attr_inline_combination
               do
                       value := schemap_invalid_attr_inline_combination_low_level
               end

	set_schemap_invalid_attr_name
               do
                       value := schemap_invalid_attr_name_low_level
               end

	set_schemap_invalid_attr_use
               do
                       value := schemap_invalid_attr_use_low_level
               end

	set_schemap_invalid_boolean
               do
                       value := schemap_invalid_boolean_low_level
               end

	set_schemap_invalid_enum
               do
                       value := schemap_invalid_enum_low_level
               end

	set_schemap_invalid_facet
               do
                       value := schemap_invalid_facet_low_level
               end

	set_schemap_invalid_facet_value
               do
                       value := schemap_invalid_facet_value_low_level
               end

	set_schemap_invalid_maxoccurs
               do
                       value := schemap_invalid_maxoccurs_low_level
               end

	set_schemap_invalid_minoccurs
               do
                       value := schemap_invalid_minoccurs_low_level
               end

	set_schemap_invalid_ref_and_subtype
               do
                       value := schemap_invalid_ref_and_subtype_low_level
               end

	set_schemap_invalid_white_space
               do
                       value := schemap_invalid_white_space_low_level
               end

	set_schemap_mg_props_correct_1
               do
                       value := schemap_mg_props_correct_1_low_level
               end

	set_schemap_mg_props_correct_2
               do
                       value := schemap_mg_props_correct_2_low_level
               end

	set_schemap_missing_simpletype_child
               do
                       value := schemap_missing_simpletype_child_low_level
               end

	set_schemap_no_xmlns
               do
                       value := schemap_no_xmlns_low_level
               end

	set_schemap_no_xsi
               do
                       value := schemap_no_xsi_low_level
               end

	set_schemap_noattr_noref
               do
                       value := schemap_noattr_noref_low_level
               end

	set_schemap_noroot
               do
                       value := schemap_noroot_low_level
               end

	set_schemap_not_deterministic
               do
                       value := schemap_not_deterministic_low_level
               end

	set_schemap_not_schema
               do
                       value := schemap_not_schema_low_level
               end

	set_schemap_notation_no_name
               do
                       value := schemap_notation_no_name_low_level
               end

	set_schemap_nothing_to_parse
               do
                       value := schemap_nothing_to_parse_low_level
               end

	set_schemap_notype_noref
               do
                       value := schemap_notype_noref_low_level
               end

	set_schemap_p_props_correct_1
               do
                       value := schemap_p_props_correct_1_low_level
               end

	set_schemap_p_props_correct_2_1
               do
                       value := schemap_p_props_correct_2_1_low_level
               end

	set_schemap_p_props_correct_2_2
               do
                       value := schemap_p_props_correct_2_2_low_level
               end

	set_schemap_prefix_undefined
               do
                       value := schemap_prefix_undefined_low_level
               end

	set_schemap_recursive
               do
                       value := schemap_recursive_low_level
               end

	set_schemap_redefined_attr
               do
                       value := schemap_redefined_attr_low_level
               end

	set_schemap_redefined_attrgroup
               do
                       value := schemap_redefined_attrgroup_low_level
               end

	set_schemap_redefined_element
               do
                       value := schemap_redefined_element_low_level
               end

	set_schemap_redefined_group
               do
                       value := schemap_redefined_group_low_level
               end

	set_schemap_redefined_notation
               do
                       value := schemap_redefined_notation_low_level
               end

	set_schemap_redefined_type
               do
                       value := schemap_redefined_type_low_level
               end

	set_schemap_ref_and_content
               do
                       value := schemap_ref_and_content_low_level
               end

	set_schemap_ref_and_subtype
               do
                       value := schemap_ref_and_subtype_low_level
               end

	set_schemap_regexp_invalid
               do
                       value := schemap_regexp_invalid_low_level
               end

	set_schemap_restriction_noname_noref
               do
                       value := schemap_restriction_noname_noref_low_level
               end

	set_schemap_s4s_attr_invalid_value
               do
                       value := schemap_s4s_attr_invalid_value_low_level
               end

	set_schemap_s4s_attr_missing
               do
                       value := schemap_s4s_attr_missing_low_level
               end

	set_schemap_s4s_attr_not_allowed
               do
                       value := schemap_s4s_attr_not_allowed_low_level
               end

	set_schemap_s4s_elem_missing
               do
                       value := schemap_s4s_elem_missing_low_level
               end

	set_schemap_s4s_elem_not_allowed
               do
                       value := schemap_s4s_elem_not_allowed_low_level
               end

	set_schemap_simpletype_noname
               do
                       value := schemap_simpletype_noname_low_level
               end

	set_schemap_src_attribute_1
               do
                       value := schemap_src_attribute_1_low_level
               end

	set_schemap_src_attribute_2
               do
                       value := schemap_src_attribute_2_low_level
               end

	set_schemap_src_attribute_3_1
               do
                       value := schemap_src_attribute_3_1_low_level
               end

	set_schemap_src_attribute_3_2
               do
                       value := schemap_src_attribute_3_2_low_level
               end

	set_schemap_src_attribute_4
               do
                       value := schemap_src_attribute_4_low_level
               end

	set_schemap_src_attribute_group_1
               do
                       value := schemap_src_attribute_group_1_low_level
               end

	set_schemap_src_attribute_group_2
               do
                       value := schemap_src_attribute_group_2_low_level
               end

	set_schemap_src_attribute_group_3
               do
                       value := schemap_src_attribute_group_3_low_level
               end

	set_schemap_src_ct_1
               do
                       value := schemap_src_ct_1_low_level
               end

	set_schemap_src_element_1
               do
                       value := schemap_src_element_1_low_level
               end

	set_schemap_src_element_2_1
               do
                       value := schemap_src_element_2_1_low_level
               end

	set_schemap_src_element_2_2
               do
                       value := schemap_src_element_2_2_low_level
               end

	set_schemap_src_element_3
               do
                       value := schemap_src_element_3_low_level
               end

	set_schemap_src_import
               do
                       value := schemap_src_import_low_level
               end

	set_schemap_src_import_1_1
               do
                       value := schemap_src_import_1_1_low_level
               end

	set_schemap_src_import_1_2
               do
                       value := schemap_src_import_1_2_low_level
               end

	set_schemap_src_import_2
               do
                       value := schemap_src_import_2_low_level
               end

	set_schemap_src_import_2_1
               do
                       value := schemap_src_import_2_1_low_level
               end

	set_schemap_src_import_2_2
               do
                       value := schemap_src_import_2_2_low_level
               end

	set_schemap_src_import_3_1
               do
                       value := schemap_src_import_3_1_low_level
               end

	set_schemap_src_import_3_2
               do
                       value := schemap_src_import_3_2_low_level
               end

	set_schemap_src_include
               do
                       value := schemap_src_include_low_level
               end

	set_schemap_src_list_itemtype_or_simpletype
               do
                       value := schemap_src_list_itemtype_or_simpletype_low_level
               end

	set_schemap_src_redefine
               do
                       value := schemap_src_redefine_low_level
               end

	set_schemap_src_resolve
               do
                       value := schemap_src_resolve_low_level
               end

	set_schemap_src_restriction_base_or_simpletype
               do
                       value := schemap_src_restriction_base_or_simpletype_low_level
               end

	set_schemap_src_simple_type_1
               do
                       value := schemap_src_simple_type_1_low_level
               end

	set_schemap_src_simple_type_2
               do
                       value := schemap_src_simple_type_2_low_level
               end

	set_schemap_src_simple_type_3
               do
                       value := schemap_src_simple_type_3_low_level
               end

	set_schemap_src_simple_type_4
               do
                       value := schemap_src_simple_type_4_low_level
               end

	set_schemap_src_union_membertypes_or_simpletypes
               do
                       value := schemap_src_union_membertypes_or_simpletypes_low_level
               end

	set_schemap_st_props_correct_1
               do
                       value := schemap_st_props_correct_1_low_level
               end

	set_schemap_st_props_correct_2
               do
                       value := schemap_st_props_correct_2_low_level
               end

	set_schemap_st_props_correct_3
               do
                       value := schemap_st_props_correct_3_low_level
               end

	set_schemap_supernumerous_list_item_type
               do
                       value := schemap_supernumerous_list_item_type_low_level
               end

	set_schemap_type_and_subtype
               do
                       value := schemap_type_and_subtype_low_level
               end

	set_schemap_union_not_expressible
               do
                       value := schemap_union_not_expressible_low_level
               end

	set_schemap_unknown_all_child
               do
                       value := schemap_unknown_all_child_low_level
               end

	set_schemap_unknown_anyattribute_child
               do
                       value := schemap_unknown_anyattribute_child_low_level
               end

	set_schemap_unknown_attr_child
               do
                       value := schemap_unknown_attr_child_low_level
               end

	set_schemap_unknown_attrgrp_child
               do
                       value := schemap_unknown_attrgrp_child_low_level
               end

	set_schemap_unknown_attribute_group
               do
                       value := schemap_unknown_attribute_group_low_level
               end

	set_schemap_unknown_base_type
               do
                       value := schemap_unknown_base_type_low_level
               end

	set_schemap_unknown_choice_child
               do
                       value := schemap_unknown_choice_child_low_level
               end

	set_schemap_unknown_complexcontent_child
               do
                       value := schemap_unknown_complexcontent_child_low_level
               end

	set_schemap_unknown_complextype_child
               do
                       value := schemap_unknown_complextype_child_low_level
               end

	set_schemap_unknown_elem_child
               do
                       value := schemap_unknown_elem_child_low_level
               end

	set_schemap_unknown_extension_child
               do
                       value := schemap_unknown_extension_child_low_level
               end

	set_schemap_unknown_facet_child
               do
                       value := schemap_unknown_facet_child_low_level
               end

	set_schemap_unknown_facet_type
               do
                       value := schemap_unknown_facet_type_low_level
               end

	set_schemap_unknown_group_child
               do
                       value := schemap_unknown_group_child_low_level
               end

	set_schemap_unknown_import_child
               do
                       value := schemap_unknown_import_child_low_level
               end

	set_schemap_unknown_include_child
               do
                       value := schemap_unknown_include_child_low_level
               end

	set_schemap_unknown_list_child
               do
                       value := schemap_unknown_list_child_low_level
               end

	set_schemap_unknown_member_type
               do
                       value := schemap_unknown_member_type_low_level
               end

	set_schemap_unknown_notation_child
               do
                       value := schemap_unknown_notation_child_low_level
               end

	set_schemap_unknown_prefix
               do
                       value := schemap_unknown_prefix_low_level
               end

	set_schemap_unknown_processcontent_child
               do
                       value := schemap_unknown_processcontent_child_low_level
               end

	set_schemap_unknown_ref
               do
                       value := schemap_unknown_ref_low_level
               end

	set_schemap_unknown_restriction_child
               do
                       value := schemap_unknown_restriction_child_low_level
               end

	set_schemap_unknown_schemas_child
               do
                       value := schemap_unknown_schemas_child_low_level
               end

	set_schemap_unknown_sequence_child
               do
                       value := schemap_unknown_sequence_child_low_level
               end

	set_schemap_unknown_simplecontent_child
               do
                       value := schemap_unknown_simplecontent_child_low_level
               end

	set_schemap_unknown_simpletype_child
               do
                       value := schemap_unknown_simpletype_child_low_level
               end

	set_schemap_unknown_type
               do
                       value := schemap_unknown_type_low_level
               end

	set_schemap_unknown_union_child
               do
                       value := schemap_unknown_union_child_low_level
               end

	set_schemap_warn_attr_pointless_proh
               do
                       value := schemap_warn_attr_pointless_proh_low_level
               end

	set_schemap_warn_attr_redecl_proh
               do
                       value := schemap_warn_attr_redecl_proh_low_level
               end

	set_schemap_warn_skip_schema
               do
                       value := schemap_warn_skip_schema_low_level
               end

	set_schemap_warn_unlocated_schema
               do
                       value := schemap_warn_unlocated_schema_low_level
               end

	set_schemap_wildcard_invalid_ns_member
               do
                       value := schemap_wildcard_invalid_ns_member_low_level
               end

	set_schematronv_assert
               do
                       value := schematronv_assert_low_level
               end

	set_schematronv_report
               do
                       value := schematronv_report_low_level
               end

	set_schemav_attrinvalid
               do
                       value := schemav_attrinvalid_low_level
               end

	set_schemav_attrunknown
               do
                       value := schemav_attrunknown_low_level
               end

	set_schemav_construct
               do
                       value := schemav_construct_low_level
               end

	set_schemav_cvc_attribute_1
               do
                       value := schemav_cvc_attribute_1_low_level
               end

	set_schemav_cvc_attribute_2
               do
                       value := schemav_cvc_attribute_2_low_level
               end

	set_schemav_cvc_attribute_3
               do
                       value := schemav_cvc_attribute_3_low_level
               end

	set_schemav_cvc_attribute_4
               do
                       value := schemav_cvc_attribute_4_low_level
               end

	set_schemav_cvc_au
               do
                       value := schemav_cvc_au_low_level
               end

	set_schemav_cvc_complex_type_1
               do
                       value := schemav_cvc_complex_type_1_low_level
               end

	set_schemav_cvc_complex_type_2_1
               do
                       value := schemav_cvc_complex_type_2_1_low_level
               end

	set_schemav_cvc_complex_type_2_2
               do
                       value := schemav_cvc_complex_type_2_2_low_level
               end

	set_schemav_cvc_complex_type_2_3
               do
                       value := schemav_cvc_complex_type_2_3_low_level
               end

	set_schemav_cvc_complex_type_2_4
               do
                       value := schemav_cvc_complex_type_2_4_low_level
               end

	set_schemav_cvc_complex_type_3_1
               do
                       value := schemav_cvc_complex_type_3_1_low_level
               end

	set_schemav_cvc_complex_type_3_2_1
               do
                       value := schemav_cvc_complex_type_3_2_1_low_level
               end

	set_schemav_cvc_complex_type_3_2_2
               do
                       value := schemav_cvc_complex_type_3_2_2_low_level
               end

	set_schemav_cvc_complex_type_4
               do
                       value := schemav_cvc_complex_type_4_low_level
               end

	set_schemav_cvc_complex_type_5_1
               do
                       value := schemav_cvc_complex_type_5_1_low_level
               end

	set_schemav_cvc_complex_type_5_2
               do
                       value := schemav_cvc_complex_type_5_2_low_level
               end

	set_schemav_cvc_datatype_valid_1_2_1
               do
                       value := schemav_cvc_datatype_valid_1_2_1_low_level
               end

	set_schemav_cvc_datatype_valid_1_2_2
               do
                       value := schemav_cvc_datatype_valid_1_2_2_low_level
               end

	set_schemav_cvc_datatype_valid_1_2_3
               do
                       value := schemav_cvc_datatype_valid_1_2_3_low_level
               end

	set_schemav_cvc_elt_1
               do
                       value := schemav_cvc_elt_1_low_level
               end

	set_schemav_cvc_elt_2
               do
                       value := schemav_cvc_elt_2_low_level
               end

	set_schemav_cvc_elt_3_1
               do
                       value := schemav_cvc_elt_3_1_low_level
               end

	set_schemav_cvc_elt_3_2_1
               do
                       value := schemav_cvc_elt_3_2_1_low_level
               end

	set_schemav_cvc_elt_3_2_2
               do
                       value := schemav_cvc_elt_3_2_2_low_level
               end

	set_schemav_cvc_elt_4_1
               do
                       value := schemav_cvc_elt_4_1_low_level
               end

	set_schemav_cvc_elt_4_2
               do
                       value := schemav_cvc_elt_4_2_low_level
               end

	set_schemav_cvc_elt_4_3
               do
                       value := schemav_cvc_elt_4_3_low_level
               end

	set_schemav_cvc_elt_5_1_1
               do
                       value := schemav_cvc_elt_5_1_1_low_level
               end

	set_schemav_cvc_elt_5_1_2
               do
                       value := schemav_cvc_elt_5_1_2_low_level
               end

	set_schemav_cvc_elt_5_2_1
               do
                       value := schemav_cvc_elt_5_2_1_low_level
               end

	set_schemav_cvc_elt_5_2_2_1
               do
                       value := schemav_cvc_elt_5_2_2_1_low_level
               end

	set_schemav_cvc_elt_5_2_2_2_1
               do
                       value := schemav_cvc_elt_5_2_2_2_1_low_level
               end

	set_schemav_cvc_elt_5_2_2_2_2
               do
                       value := schemav_cvc_elt_5_2_2_2_2_low_level
               end

	set_schemav_cvc_elt_6
               do
                       value := schemav_cvc_elt_6_low_level
               end

	set_schemav_cvc_elt_7
               do
                       value := schemav_cvc_elt_7_low_level
               end

	set_schemav_cvc_enumeration_valid
               do
                       value := schemav_cvc_enumeration_valid_low_level
               end

	set_schemav_cvc_facet_valid
               do
                       value := schemav_cvc_facet_valid_low_level
               end

	set_schemav_cvc_fractiondigits_valid
               do
                       value := schemav_cvc_fractiondigits_valid_low_level
               end

	set_schemav_cvc_idc
               do
                       value := schemav_cvc_idc_low_level
               end

	set_schemav_cvc_length_valid
               do
                       value := schemav_cvc_length_valid_low_level
               end

	set_schemav_cvc_maxexclusive_valid
               do
                       value := schemav_cvc_maxexclusive_valid_low_level
               end

	set_schemav_cvc_maxinclusive_valid
               do
                       value := schemav_cvc_maxinclusive_valid_low_level
               end

	set_schemav_cvc_maxlength_valid
               do
                       value := schemav_cvc_maxlength_valid_low_level
               end

	set_schemav_cvc_minexclusive_valid
               do
                       value := schemav_cvc_minexclusive_valid_low_level
               end

	set_schemav_cvc_mininclusive_valid
               do
                       value := schemav_cvc_mininclusive_valid_low_level
               end

	set_schemav_cvc_minlength_valid
               do
                       value := schemav_cvc_minlength_valid_low_level
               end

	set_schemav_cvc_pattern_valid
               do
                       value := schemav_cvc_pattern_valid_low_level
               end

	set_schemav_cvc_totaldigits_valid
               do
                       value := schemav_cvc_totaldigits_valid_low_level
               end

	set_schemav_cvc_type_1
               do
                       value := schemav_cvc_type_1_low_level
               end

	set_schemav_cvc_type_2
               do
                       value := schemav_cvc_type_2_low_level
               end

	set_schemav_cvc_type_3_1_1
               do
                       value := schemav_cvc_type_3_1_1_low_level
               end

	set_schemav_cvc_type_3_1_2
               do
                       value := schemav_cvc_type_3_1_2_low_level
               end

	set_schemav_cvc_wildcard
               do
                       value := schemav_cvc_wildcard_low_level
               end

	set_schemav_document_element_missing
               do
                       value := schemav_document_element_missing_low_level
               end

	set_schemav_elemcont
               do
                       value := schemav_elemcont_low_level
               end

	set_schemav_element_content
               do
                       value := schemav_element_content_low_level
               end

	set_schemav_extracontent
               do
                       value := schemav_extracontent_low_level
               end

	set_schemav_facet
               do
                       value := schemav_facet_low_level
               end

	set_schemav_havedefault
               do
                       value := schemav_havedefault_low_level
               end

	set_schemav_internal
               do
                       value := schemav_internal_low_level
               end

	set_schemav_invalidattr
               do
                       value := schemav_invalidattr_low_level
               end

	set_schemav_invalidelem
               do
                       value := schemav_invalidelem_low_level
               end

	set_schemav_isabstract
               do
                       value := schemav_isabstract_low_level
               end

	set_schemav_misc
               do
                       value := schemav_misc_low_level
               end

	set_schemav_missing
               do
                       value := schemav_missing_low_level
               end

	set_schemav_norollback
               do
                       value := schemav_norollback_low_level
               end

	set_schemav_noroot
               do
                       value := schemav_noroot_low_level
               end

	set_schemav_notdeterminist
               do
                       value := schemav_notdeterminist_low_level
               end

	set_schemav_notempty
               do
                       value := schemav_notempty_low_level
               end

	set_schemav_notnillable
               do
                       value := schemav_notnillable_low_level
               end

	set_schemav_notsimple
               do
                       value := schemav_notsimple_low_level
               end

	set_schemav_nottoplevel
               do
                       value := schemav_nottoplevel_low_level
               end

	set_schemav_notype
               do
                       value := schemav_notype_low_level
               end

	set_schemav_undeclaredelem
               do
                       value := schemav_undeclaredelem_low_level
               end

	set_schemav_value
               do
                       value := schemav_value_low_level
               end

	set_schemav_wrongelem
               do
                       value := schemav_wrongelem_low_level
               end

	set_tree_invalid_dec
               do
                       value := tree_invalid_dec_low_level
               end

	set_tree_invalid_hex
               do
                       value := tree_invalid_hex_low_level
               end

	set_tree_not_utf8
               do
                       value := tree_not_utf8_low_level
               end

	set_tree_unterminated_entity
               do
                       value := tree_unterminated_entity_low_level
               end

	set_war_catalog_pi
               do
                       value := war_catalog_pi_low_level
               end

	set_war_entity_redefined
               do
                       value := war_entity_redefined_low_level
               end

	set_war_lang_value
               do
                       value := war_lang_value_low_level
               end

	set_war_ns_column
               do
                       value := war_ns_column_low_level
               end

	set_war_ns_uri
               do
                       value := war_ns_uri_low_level
               end

	set_war_ns_uri_relative
               do
                       value := war_ns_uri_relative_low_level
               end

	set_war_space_value
               do
                       value := war_space_value_low_level
               end

	set_war_undeclared_entity
               do
                       value := war_undeclared_entity_low_level
               end

	set_war_unknown_version
               do
                       value := war_unknown_version_low_level
               end

	set_xinclude_build_failed
               do
                       value := xinclude_build_failed_low_level
               end

	set_xinclude_deprecated_ns
               do
                       value := xinclude_deprecated_ns_low_level
               end

	set_xinclude_entity_def_mismatch
               do
                       value := xinclude_entity_def_mismatch_low_level
               end

	set_xinclude_fallback_not_in_include
               do
                       value := xinclude_fallback_not_in_include_low_level
               end

	set_xinclude_fallbacks_in_include
               do
                       value := xinclude_fallbacks_in_include_low_level
               end

	set_xinclude_fragment_id
               do
                       value := xinclude_fragment_id_low_level
               end

	set_xinclude_href_uri
               do
                       value := xinclude_href_uri_low_level
               end

	set_xinclude_include_in_include
               do
                       value := xinclude_include_in_include_low_level
               end

	set_xinclude_invalid_char
               do
                       value := xinclude_invalid_char_low_level
               end

	set_xinclude_multiple_root
               do
                       value := xinclude_multiple_root_low_level
               end

	set_xinclude_no_fallback
               do
                       value := xinclude_no_fallback_low_level
               end

	set_xinclude_no_href
               do
                       value := xinclude_no_href_low_level
               end

	set_xinclude_parse_value
               do
                       value := xinclude_parse_value_low_level
               end

	set_xinclude_recursion
               do
                       value := xinclude_recursion_low_level
               end

	set_xinclude_text_document
               do
                       value := xinclude_text_document_low_level
               end

	set_xinclude_text_fragment
               do
                       value := xinclude_text_fragment_low_level
               end

	set_xinclude_unknown_encoding
               do
                       value := xinclude_unknown_encoding_low_level
               end

	set_xinclude_xptr_failed
               do
                       value := xinclude_xptr_failed_low_level
               end

	set_xinclude_xptr_result
               do
                       value := xinclude_xptr_result_low_level
               end

	set_xpath_encoding_error
               do
                       value := xpath_encoding_error_low_level
               end

	set_xpath_expr_error
               do
                       value := xpath_expr_error_low_level
               end

	set_xpath_expression_ok
               do
                       value := xpath_expression_ok_low_level
               end

	set_xpath_invalid_arity
               do
                       value := xpath_invalid_arity_low_level
               end

	set_xpath_invalid_char_error
               do
                       value := xpath_invalid_char_error_low_level
               end

	set_xpath_invalid_ctxt_position
               do
                       value := xpath_invalid_ctxt_position_low_level
               end

	set_xpath_invalid_ctxt_size
               do
                       value := xpath_invalid_ctxt_size_low_level
               end

	set_xpath_invalid_operand
               do
                       value := xpath_invalid_operand_low_level
               end

	set_xpath_invalid_predicate_error
               do
                       value := xpath_invalid_predicate_error_low_level
               end

	set_xpath_invalid_type
               do
                       value := xpath_invalid_type_low_level
               end

	set_xpath_memory_error
               do
                       value := xpath_memory_error_low_level
               end

	set_xpath_number_error
               do
                       value := xpath_number_error_low_level
               end

	set_xpath_start_literal_error
               do
                       value := xpath_start_literal_error_low_level
               end

	set_xpath_unclosed_error
               do
                       value := xpath_unclosed_error_low_level
               end

	set_xpath_undef_prefix_error
               do
                       value := xpath_undef_prefix_error_low_level
               end

	set_xpath_undef_variable_error
               do
                       value := xpath_undef_variable_error_low_level
               end

	set_xpath_unfinished_literal_error
               do
                       value := xpath_unfinished_literal_error_low_level
               end

	set_xpath_unknown_func_error
               do
                       value := xpath_unknown_func_error_low_level
               end

	set_xpath_variable_ref_error
               do
                       value := xpath_variable_ref_error_low_level
               end

	set_xptr_childseq_start
               do
                       value := xptr_childseq_start_low_level
               end

	set_xptr_eval_failed
               do
                       value := xptr_eval_failed_low_level
               end

	set_xptr_extra_objects
               do
                       value := xptr_extra_objects_low_level
               end

	set_xptr_resource_error
               do
                       value := xptr_resource_error_low_level
               end

	set_xptr_sub_resource_error
               do
                       value := xptr_sub_resource_error_low_level
               end

	set_xptr_syntax_error
               do
                       value := xptr_syntax_error_low_level
               end

	set_xptr_unknown_scheme
               do
                       value := xptr_unknown_scheme_low_level
               end

feature {ANY} -- Queries
       is_buf_overflow: BOOLEAN
               do
                       Result := (value=buf_overflow_low_level)
               end

       is_c14n_create_ctxt: BOOLEAN
               do
                       Result := (value=c14n_create_ctxt_low_level)
               end

       is_c14n_create_stack: BOOLEAN
               do
                       Result := (value=c14n_create_stack_low_level)
               end

       is_c14n_invalid_node: BOOLEAN
               do
                       Result := (value=c14n_invalid_node_low_level)
               end

       is_c14n_relative_namespace: BOOLEAN
               do
                       Result := (value=c14n_relative_namespace_low_level)
               end

       is_c14n_requires_utf8: BOOLEAN
               do
                       Result := (value=c14n_requires_utf8_low_level)
               end

       is_c14n_unknow_node: BOOLEAN
               do
                       Result := (value=c14n_unknow_node_low_level)
               end

       is_catalog_entry_broken: BOOLEAN
               do
                       Result := (value=catalog_entry_broken_low_level)
               end

       is_catalog_missing_attr: BOOLEAN
               do
                       Result := (value=catalog_missing_attr_low_level)
               end

       is_catalog_not_catalog: BOOLEAN
               do
                       Result := (value=catalog_not_catalog_low_level)
               end

       is_catalog_prefer_value: BOOLEAN
               do
                       Result := (value=catalog_prefer_value_low_level)
               end

       is_catalog_recursion: BOOLEAN
               do
                       Result := (value=catalog_recursion_low_level)
               end

       is_check_entity_type: BOOLEAN
               do
                       Result := (value=check_entity_type_low_level)
               end

       is_check_found_attribute: BOOLEAN
               do
                       Result := (value=check_found_attribute_low_level)
               end

       is_check_found_cdata: BOOLEAN
               do
                       Result := (value=check_found_cdata_low_level)
               end

       is_check_found_comment: BOOLEAN
               do
                       Result := (value=check_found_comment_low_level)
               end

       is_check_found_doctype: BOOLEAN
               do
                       Result := (value=check_found_doctype_low_level)
               end

       is_check_found_element: BOOLEAN
               do
                       Result := (value=check_found_element_low_level)
               end

       is_check_found_entity: BOOLEAN
               do
                       Result := (value=check_found_entity_low_level)
               end

       is_check_found_entityref: BOOLEAN
               do
                       Result := (value=check_found_entityref_low_level)
               end

       is_check_found_fragment: BOOLEAN
               do
                       Result := (value=check_found_fragment_low_level)
               end

       is_check_found_notation: BOOLEAN
               do
                       Result := (value=check_found_notation_low_level)
               end

       is_check_found_pi: BOOLEAN
               do
                       Result := (value=check_found_pi_low_level)
               end

       is_check_found_text: BOOLEAN
               do
                       Result := (value=check_found_text_low_level)
               end

       is_check_name_not_null: BOOLEAN
               do
                       Result := (value=check_name_not_null_low_level)
               end

       is_check_no_dict: BOOLEAN
               do
                       Result := (value=check_no_dict_low_level)
               end

       is_check_no_doc: BOOLEAN
               do
                       Result := (value=check_no_doc_low_level)
               end

       is_check_no_elem: BOOLEAN
               do
                       Result := (value=check_no_elem_low_level)
               end

       is_check_no_href: BOOLEAN
               do
                       Result := (value=check_no_href_low_level)
               end

       is_check_no_name: BOOLEAN
               do
                       Result := (value=check_no_name_low_level)
               end

       is_check_no_next: BOOLEAN
               do
                       Result := (value=check_no_next_low_level)
               end

       is_check_no_parent: BOOLEAN
               do
                       Result := (value=check_no_parent_low_level)
               end

       is_check_no_prev: BOOLEAN
               do
                       Result := (value=check_no_prev_low_level)
               end

       is_check_not_attr: BOOLEAN
               do
                       Result := (value=check_not_attr_low_level)
               end

       is_check_not_attr_decl: BOOLEAN
               do
                       Result := (value=check_not_attr_decl_low_level)
               end

       is_check_not_dtd: BOOLEAN
               do
                       Result := (value=check_not_dtd_low_level)
               end

       is_check_not_elem_decl: BOOLEAN
               do
                       Result := (value=check_not_elem_decl_low_level)
               end

       is_check_not_entity_decl: BOOLEAN
               do
                       Result := (value=check_not_entity_decl_low_level)
               end

       is_check_not_ncname: BOOLEAN
               do
                       Result := (value=check_not_ncname_low_level)
               end

       is_check_not_ns_decl: BOOLEAN
               do
                       Result := (value=check_not_ns_decl_low_level)
               end

       is_check_not_utf8: BOOLEAN
               do
                       Result := (value=check_not_utf8_low_level)
               end

       is_check_ns_ancestor: BOOLEAN
               do
                       Result := (value=check_ns_ancestor_low_level)
               end

       is_check_ns_scope: BOOLEAN
               do
                       Result := (value=check_ns_scope_low_level)
               end

       is_check_outside_dict: BOOLEAN
               do
                       Result := (value=check_outside_dict_low_level)
               end

       is_check_unknown_node: BOOLEAN
               do
                       Result := (value=check_unknown_node_low_level)
               end

       is_check_wrong_doc: BOOLEAN
               do
                       Result := (value=check_wrong_doc_low_level)
               end

       is_check_wrong_name: BOOLEAN
               do
                       Result := (value=check_wrong_name_low_level)
               end

       is_check_wrong_next: BOOLEAN
               do
                       Result := (value=check_wrong_next_low_level)
               end

       is_check_wrong_parent: BOOLEAN
               do
                       Result := (value=check_wrong_parent_low_level)
               end

       is_check_wrong_prev: BOOLEAN
               do
                       Result := (value=check_wrong_prev_low_level)
               end

       is_dtd_attribute_default: BOOLEAN
               do
                       Result := (value=dtd_attribute_default_low_level)
               end

       is_dtd_attribute_redefined: BOOLEAN
               do
                       Result := (value=dtd_attribute_redefined_low_level)
               end

       is_dtd_attribute_value: BOOLEAN
               do
                       Result := (value=dtd_attribute_value_low_level)
               end

       is_dtd_content_error: BOOLEAN
               do
                       Result := (value=dtd_content_error_low_level)
               end

       is_dtd_content_model: BOOLEAN
               do
                       Result := (value=dtd_content_model_low_level)
               end

       is_dtd_content_not_determinist: BOOLEAN
               do
                       Result := (value=dtd_content_not_determinist_low_level)
               end

       is_dtd_different_prefix: BOOLEAN
               do
                       Result := (value=dtd_different_prefix_low_level)
               end

       is_dtd_dup_token: BOOLEAN
               do
                       Result := (value=dtd_dup_token_low_level)
               end

       is_dtd_elem_default_namespace: BOOLEAN
               do
                       Result := (value=dtd_elem_default_namespace_low_level)
               end

       is_dtd_elem_namespace: BOOLEAN
               do
                       Result := (value=dtd_elem_namespace_low_level)
               end

       is_dtd_elem_redefined: BOOLEAN
               do
                       Result := (value=dtd_elem_redefined_low_level)
               end

       is_dtd_empty_notation: BOOLEAN
               do
                       Result := (value=dtd_empty_notation_low_level)
               end

       is_dtd_entity_type: BOOLEAN
               do
                       Result := (value=dtd_entity_type_low_level)
               end

       is_dtd_id_fixed: BOOLEAN
               do
                       Result := (value=dtd_id_fixed_low_level)
               end

       is_dtd_id_redefined: BOOLEAN
               do
                       Result := (value=dtd_id_redefined_low_level)
               end

       is_dtd_id_subset: BOOLEAN
               do
                       Result := (value=dtd_id_subset_low_level)
               end

       is_dtd_invalid_child: BOOLEAN
               do
                       Result := (value=dtd_invalid_child_low_level)
               end

       is_dtd_invalid_default: BOOLEAN
               do
                       Result := (value=dtd_invalid_default_low_level)
               end

       is_dtd_load_error: BOOLEAN
               do
                       Result := (value=dtd_load_error_low_level)
               end

       is_dtd_missing_attribute: BOOLEAN
               do
                       Result := (value=dtd_missing_attribute_low_level)
               end

       is_dtd_mixed_corrupt: BOOLEAN
               do
                       Result := (value=dtd_mixed_corrupt_low_level)
               end

       is_dtd_multiple_id: BOOLEAN
               do
                       Result := (value=dtd_multiple_id_low_level)
               end

       is_dtd_no_doc: BOOLEAN
               do
                       Result := (value=dtd_no_doc_low_level)
               end

       is_dtd_no_dtd: BOOLEAN
               do
                       Result := (value=dtd_no_dtd_low_level)
               end

       is_dtd_no_elem_name: BOOLEAN
               do
                       Result := (value=dtd_no_elem_name_low_level)
               end

       is_dtd_no_prefix: BOOLEAN
               do
                       Result := (value=dtd_no_prefix_low_level)
               end

       is_dtd_no_root: BOOLEAN
               do
                       Result := (value=dtd_no_root_low_level)
               end

       is_dtd_not_empty: BOOLEAN
               do
                       Result := (value=dtd_not_empty_low_level)
               end

       is_dtd_not_pcdata: BOOLEAN
               do
                       Result := (value=dtd_not_pcdata_low_level)
               end

       is_dtd_not_standalone: BOOLEAN
               do
                       Result := (value=dtd_not_standalone_low_level)
               end

       is_dtd_notation_redefined: BOOLEAN
               do
                       Result := (value=dtd_notation_redefined_low_level)
               end

       is_dtd_notation_value: BOOLEAN
               do
                       Result := (value=dtd_notation_value_low_level)
               end

       is_dtd_root_name: BOOLEAN
               do
                       Result := (value=dtd_root_name_low_level)
               end

       is_dtd_standalone_defaulted: BOOLEAN
               do
                       Result := (value=dtd_standalone_defaulted_low_level)
               end

       is_dtd_standalone_white_space: BOOLEAN
               do
                       Result := (value=dtd_standalone_white_space_low_level)
               end

       is_dtd_unknown_attribute: BOOLEAN
               do
                       Result := (value=dtd_unknown_attribute_low_level)
               end

       is_dtd_unknown_elem: BOOLEAN
               do
                       Result := (value=dtd_unknown_elem_low_level)
               end

       is_dtd_unknown_entity: BOOLEAN
               do
                       Result := (value=dtd_unknown_entity_low_level)
               end

       is_dtd_unknown_id: BOOLEAN
               do
                       Result := (value=dtd_unknown_id_low_level)
               end

       is_dtd_unknown_notation: BOOLEAN
               do
                       Result := (value=dtd_unknown_notation_low_level)
               end

       is_dtd_xmlid_type: BOOLEAN
               do
                       Result := (value=dtd_xmlid_type_low_level)
               end

       is_dtd_xmlid_value: BOOLEAN
               do
                       Result := (value=dtd_xmlid_value_low_level)
               end

       is_err_attlist_not_finished: BOOLEAN
               do
                       Result := (value=err_attlist_not_finished_low_level)
               end

       is_err_attlist_not_started: BOOLEAN
               do
                       Result := (value=err_attlist_not_started_low_level)
               end

       is_err_attribute_not_finished: BOOLEAN
               do
                       Result := (value=err_attribute_not_finished_low_level)
               end

       is_err_attribute_not_started: BOOLEAN
               do
                       Result := (value=err_attribute_not_started_low_level)
               end

       is_err_attribute_redefined: BOOLEAN
               do
                       Result := (value=err_attribute_redefined_low_level)
               end

       is_err_attribute_without_value: BOOLEAN
               do
                       Result := (value=err_attribute_without_value_low_level)
               end

       is_err_cdata_not_finished: BOOLEAN
               do
                       Result := (value=err_cdata_not_finished_low_level)
               end

       is_err_charref_at_eof: BOOLEAN
               do
                       Result := (value=err_charref_at_eof_low_level)
               end

       is_err_charref_in_dtd: BOOLEAN
               do
                       Result := (value=err_charref_in_dtd_low_level)
               end

       is_err_charref_in_epilog: BOOLEAN
               do
                       Result := (value=err_charref_in_epilog_low_level)
               end

       is_err_charref_in_prolog: BOOLEAN
               do
                       Result := (value=err_charref_in_prolog_low_level)
               end

       is_err_comment_not_finished: BOOLEAN
               do
                       Result := (value=err_comment_not_finished_low_level)
               end

       is_err_condsec_invalid: BOOLEAN
               do
                       Result := (value=err_condsec_invalid_low_level)
               end

       is_err_condsec_invalid_keyword: BOOLEAN
               do
                       Result := (value=err_condsec_invalid_keyword_low_level)
               end

       is_err_condsec_not_finished: BOOLEAN
               do
                       Result := (value=err_condsec_not_finished_low_level)
               end

       is_err_condsec_not_started: BOOLEAN
               do
                       Result := (value=err_condsec_not_started_low_level)
               end

       is_err_doctype_not_finished: BOOLEAN
               do
                       Result := (value=err_doctype_not_finished_low_level)
               end

       is_err_document_empty: BOOLEAN
               do
                       Result := (value=err_document_empty_low_level)
               end

       is_err_document_end: BOOLEAN
               do
                       Result := (value=err_document_end_low_level)
               end

       is_err_document_start: BOOLEAN
               do
                       Result := (value=err_document_start_low_level)
               end

       is_err_elemcontent_not_finished: BOOLEAN
               do
                       Result := (value=err_elemcontent_not_finished_low_level)
               end

       is_err_elemcontent_not_started: BOOLEAN
               do
                       Result := (value=err_elemcontent_not_started_low_level)
               end

       is_err_encoding_name: BOOLEAN
               do
                       Result := (value=err_encoding_name_low_level)
               end

       is_err_entity_boundary: BOOLEAN
               do
                       Result := (value=err_entity_boundary_low_level)
               end

       is_err_entity_char_error: BOOLEAN
               do
                       Result := (value=err_entity_char_error_low_level)
               end

       is_err_entity_is_external: BOOLEAN
               do
                       Result := (value=err_entity_is_external_low_level)
               end

       is_err_entity_is_parameter: BOOLEAN
               do
                       Result := (value=err_entity_is_parameter_low_level)
               end

       is_err_entity_loop: BOOLEAN
               do
                       Result := (value=err_entity_loop_low_level)
               end

       is_err_entity_not_finished: BOOLEAN
               do
                       Result := (value=err_entity_not_finished_low_level)
               end

       is_err_entity_not_started: BOOLEAN
               do
                       Result := (value=err_entity_not_started_low_level)
               end

       is_err_entity_pe_internal: BOOLEAN
               do
                       Result := (value=err_entity_pe_internal_low_level)
               end

       is_err_entity_processing: BOOLEAN
               do
                       Result := (value=err_entity_processing_low_level)
               end

       is_err_entityref_at_eof: BOOLEAN
               do
                       Result := (value=err_entityref_at_eof_low_level)
               end

       is_err_entityref_in_dtd: BOOLEAN
               do
                       Result := (value=err_entityref_in_dtd_low_level)
               end

       is_err_entityref_in_epilog: BOOLEAN
               do
                       Result := (value=err_entityref_in_epilog_low_level)
               end

       is_err_entityref_in_prolog: BOOLEAN
               do
                       Result := (value=err_entityref_in_prolog_low_level)
               end

       is_err_entityref_no_name: BOOLEAN
               do
                       Result := (value=err_entityref_no_name_low_level)
               end

       is_err_entityref_semicol_missing: BOOLEAN
               do
                       Result := (value=err_entityref_semicol_missing_low_level)
               end

       is_err_equal_required: BOOLEAN
               do
                       Result := (value=err_equal_required_low_level)
               end

       is_err_ext_entity_standalone: BOOLEAN
               do
                       Result := (value=err_ext_entity_standalone_low_level)
               end

       is_err_ext_subset_not_finished: BOOLEAN
               do
                       Result := (value=err_ext_subset_not_finished_low_level)
               end

       is_err_extra_content: BOOLEAN
               do
                       Result := (value=err_extra_content_low_level)
               end

       is_err_gt_required: BOOLEAN
               do
                       Result := (value=err_gt_required_low_level)
               end

       is_err_hyphen_in_comment: BOOLEAN
               do
                       Result := (value=err_hyphen_in_comment_low_level)
               end

       is_err_internal_error: BOOLEAN
               do
                       Result := (value=err_internal_error_low_level)
               end

       is_err_invalid_char: BOOLEAN
               do
                       Result := (value=err_invalid_char_low_level)
               end

       is_err_invalid_charref: BOOLEAN
               do
                       Result := (value=err_invalid_charref_low_level)
               end

       is_err_invalid_dec_charref: BOOLEAN
               do
                       Result := (value=err_invalid_dec_charref_low_level)
               end

       is_err_invalid_encoding: BOOLEAN
               do
                       Result := (value=err_invalid_encoding_low_level)
               end

       is_err_invalid_hex_charref: BOOLEAN
               do
                       Result := (value=err_invalid_hex_charref_low_level)
               end

       is_err_invalid_uri: BOOLEAN
               do
                       Result := (value=err_invalid_uri_low_level)
               end

       is_err_literal_not_finished: BOOLEAN
               do
                       Result := (value=err_literal_not_finished_low_level)
               end

       is_err_literal_not_started: BOOLEAN
               do
                       Result := (value=err_literal_not_started_low_level)
               end

       is_err_lt_in_attribute: BOOLEAN
               do
                       Result := (value=err_lt_in_attribute_low_level)
               end

       is_err_lt_required: BOOLEAN
               do
                       Result := (value=err_lt_required_low_level)
               end

       is_err_ltslash_required: BOOLEAN
               do
                       Result := (value=err_ltslash_required_low_level)
               end

       is_err_misplaced_cdata_end: BOOLEAN
               do
                       Result := (value=err_misplaced_cdata_end_low_level)
               end

       is_err_missing_encoding: BOOLEAN
               do
                       Result := (value=err_missing_encoding_low_level)
               end

       is_err_mixed_not_finished: BOOLEAN
               do
                       Result := (value=err_mixed_not_finished_low_level)
               end

       is_err_mixed_not_started: BOOLEAN
               do
                       Result := (value=err_mixed_not_started_low_level)
               end

       is_err_name_required: BOOLEAN
               do
                       Result := (value=err_name_required_low_level)
               end

       is_err_name_too_long: BOOLEAN
               do
                       Result := (value=err_name_too_long_low_level)
               end

       is_err_nmtoken_required: BOOLEAN
               do
                       Result := (value=err_nmtoken_required_low_level)
               end

       is_err_no_dtd: BOOLEAN
               do
                       Result := (value=err_no_dtd_low_level)
               end

       is_err_no_memory: BOOLEAN
               do
                       Result := (value=err_no_memory_low_level)
               end

       is_err_not_standalone: BOOLEAN
               do
                       Result := (value=err_not_standalone_low_level)
               end

       is_err_not_well_balanced: BOOLEAN
               do
                       Result := (value=err_not_well_balanced_low_level)
               end

       is_err_notation_not_finished: BOOLEAN
               do
                       Result := (value=err_notation_not_finished_low_level)
               end

       is_err_notation_not_started: BOOLEAN
               do
                       Result := (value=err_notation_not_started_low_level)
               end

       is_err_notation_processing: BOOLEAN
               do
                       Result := (value=err_notation_processing_low_level)
               end

       is_err_ns_decl_error: BOOLEAN
               do
                       Result := (value=err_ns_decl_error_low_level)
               end

       is_err_ok: BOOLEAN
               do
                       Result := (value=err_ok_low_level)
               end

       is_err_pcdata_required: BOOLEAN
               do
                       Result := (value=err_pcdata_required_low_level)
               end

       is_err_peref_at_eof: BOOLEAN
               do
                       Result := (value=err_peref_at_eof_low_level)
               end

       is_err_peref_in_epilog: BOOLEAN
               do
                       Result := (value=err_peref_in_epilog_low_level)
               end

       is_err_peref_in_int_subset: BOOLEAN
               do
                       Result := (value=err_peref_in_int_subset_low_level)
               end

       is_err_peref_in_prolog: BOOLEAN
               do
                       Result := (value=err_peref_in_prolog_low_level)
               end

       is_err_peref_no_name: BOOLEAN
               do
                       Result := (value=err_peref_no_name_low_level)
               end

       is_err_peref_semicol_missing: BOOLEAN
               do
                       Result := (value=err_peref_semicol_missing_low_level)
               end

       is_err_pi_not_finished: BOOLEAN
               do
                       Result := (value=err_pi_not_finished_low_level)
               end

       is_err_pi_not_started: BOOLEAN
               do
                       Result := (value=err_pi_not_started_low_level)
               end

       is_err_pubid_required: BOOLEAN
               do
                       Result := (value=err_pubid_required_low_level)
               end

       is_err_reserved_xml_name: BOOLEAN
               do
                       Result := (value=err_reserved_xml_name_low_level)
               end

       is_err_separator_required: BOOLEAN
               do
                       Result := (value=err_separator_required_low_level)
               end

       is_err_space_required: BOOLEAN
               do
                       Result := (value=err_space_required_low_level)
               end

       is_err_standalone_value: BOOLEAN
               do
                       Result := (value=err_standalone_value_low_level)
               end

       is_err_string_not_closed: BOOLEAN
               do
                       Result := (value=err_string_not_closed_low_level)
               end

       is_err_string_not_started: BOOLEAN
               do
                       Result := (value=err_string_not_started_low_level)
               end

       is_err_tag_name_mismatch: BOOLEAN
               do
                       Result := (value=err_tag_name_mismatch_low_level)
               end

       is_err_tag_not_finished: BOOLEAN
               do
                       Result := (value=err_tag_not_finished_low_level)
               end

       is_err_undeclared_entity: BOOLEAN
               do
                       Result := (value=err_undeclared_entity_low_level)
               end

       is_err_unknown_encoding: BOOLEAN
               do
                       Result := (value=err_unknown_encoding_low_level)
               end

       is_err_unknown_version: BOOLEAN
               do
                       Result := (value=err_unknown_version_low_level)
               end

       is_err_unparsed_entity: BOOLEAN
               do
                       Result := (value=err_unparsed_entity_low_level)
               end

       is_err_unsupported_encoding: BOOLEAN
               do
                       Result := (value=err_unsupported_encoding_low_level)
               end

       is_err_uri_fragment: BOOLEAN
               do
                       Result := (value=err_uri_fragment_low_level)
               end

       is_err_uri_required: BOOLEAN
               do
                       Result := (value=err_uri_required_low_level)
               end

       is_err_user_stop: BOOLEAN
               do
                       Result := (value=err_user_stop_low_level)
               end

       is_err_value_required: BOOLEAN
               do
                       Result := (value=err_value_required_low_level)
               end

       is_err_version_mismatch: BOOLEAN
               do
                       Result := (value=err_version_mismatch_low_level)
               end

       is_err_version_missing: BOOLEAN
               do
                       Result := (value=err_version_missing_low_level)
               end

       is_err_xmldecl_not_finished: BOOLEAN
               do
                       Result := (value=err_xmldecl_not_finished_low_level)
               end

       is_err_xmldecl_not_started: BOOLEAN
               do
                       Result := (value=err_xmldecl_not_started_low_level)
               end

       is_ftp_accnt: BOOLEAN
               do
                       Result := (value=ftp_accnt_low_level)
               end

       is_ftp_epsv_answer: BOOLEAN
               do
                       Result := (value=ftp_epsv_answer_low_level)
               end

       is_ftp_pasv_answer: BOOLEAN
               do
                       Result := (value=ftp_pasv_answer_low_level)
               end

       is_ftp_url_syntax: BOOLEAN
               do
                       Result := (value=ftp_url_syntax_low_level)
               end

       is_html_strucure_error: BOOLEAN
               do
                       Result := (value=html_strucure_error_low_level)
               end

       is_html_unknown_tag: BOOLEAN
               do
                       Result := (value=html_unknown_tag_low_level)
               end

       is_http_unknown_host: BOOLEAN
               do
                       Result := (value=http_unknown_host_low_level)
               end

       is_http_url_syntax: BOOLEAN
               do
                       Result := (value=http_url_syntax_low_level)
               end

       is_http_use_ip: BOOLEAN
               do
                       Result := (value=http_use_ip_low_level)
               end

       is_i18n_conv_failed: BOOLEAN
               do
                       Result := (value=i18n_conv_failed_low_level)
               end

       is_i18n_excess_handler: BOOLEAN
               do
                       Result := (value=i18n_excess_handler_low_level)
               end

       is_i18n_no_handler: BOOLEAN
               do
                       Result := (value=i18n_no_handler_low_level)
               end

       is_i18n_no_name: BOOLEAN
               do
                       Result := (value=i18n_no_name_low_level)
               end

       is_i18n_no_output: BOOLEAN
               do
                       Result := (value=i18n_no_output_low_level)
               end

       is_io_buffer_full: BOOLEAN
               do
                       Result := (value=io_buffer_full_low_level)
               end

       is_io_eacces: BOOLEAN
               do
                       Result := (value=io_eacces_low_level)
               end

       is_io_eaddrinuse: BOOLEAN
               do
                       Result := (value=io_eaddrinuse_low_level)
               end

       is_io_eafnosupport: BOOLEAN
               do
                       Result := (value=io_eafnosupport_low_level)
               end

       is_io_eagain: BOOLEAN
               do
                       Result := (value=io_eagain_low_level)
               end

       is_io_ealready: BOOLEAN
               do
                       Result := (value=io_ealready_low_level)
               end

       is_io_ebadf: BOOLEAN
               do
                       Result := (value=io_ebadf_low_level)
               end

       is_io_ebadmsg: BOOLEAN
               do
                       Result := (value=io_ebadmsg_low_level)
               end

       is_io_ebusy: BOOLEAN
               do
                       Result := (value=io_ebusy_low_level)
               end

       is_io_ecanceled: BOOLEAN
               do
                       Result := (value=io_ecanceled_low_level)
               end

       is_io_echild: BOOLEAN
               do
                       Result := (value=io_echild_low_level)
               end

       is_io_econnrefused: BOOLEAN
               do
                       Result := (value=io_econnrefused_low_level)
               end

       is_io_edeadlk: BOOLEAN
               do
                       Result := (value=io_edeadlk_low_level)
               end

       is_io_edom: BOOLEAN
               do
                       Result := (value=io_edom_low_level)
               end

       is_io_eexist: BOOLEAN
               do
                       Result := (value=io_eexist_low_level)
               end

       is_io_efault: BOOLEAN
               do
                       Result := (value=io_efault_low_level)
               end

       is_io_efbig: BOOLEAN
               do
                       Result := (value=io_efbig_low_level)
               end

       is_io_einprogress: BOOLEAN
               do
                       Result := (value=io_einprogress_low_level)
               end

       is_io_eintr: BOOLEAN
               do
                       Result := (value=io_eintr_low_level)
               end

       is_io_einval: BOOLEAN
               do
                       Result := (value=io_einval_low_level)
               end

       is_io_eio: BOOLEAN
               do
                       Result := (value=io_eio_low_level)
               end

       is_io_eisconn: BOOLEAN
               do
                       Result := (value=io_eisconn_low_level)
               end

       is_io_eisdir: BOOLEAN
               do
                       Result := (value=io_eisdir_low_level)
               end

       is_io_emfile: BOOLEAN
               do
                       Result := (value=io_emfile_low_level)
               end

       is_io_emlink: BOOLEAN
               do
                       Result := (value=io_emlink_low_level)
               end

       is_io_emsgsize: BOOLEAN
               do
                       Result := (value=io_emsgsize_low_level)
               end

       is_io_enametoolong: BOOLEAN
               do
                       Result := (value=io_enametoolong_low_level)
               end

       is_io_encoder: BOOLEAN
               do
                       Result := (value=io_encoder_low_level)
               end

       is_io_enetunreach: BOOLEAN
               do
                       Result := (value=io_enetunreach_low_level)
               end

       is_io_enfile: BOOLEAN
               do
                       Result := (value=io_enfile_low_level)
               end

       is_io_enodev: BOOLEAN
               do
                       Result := (value=io_enodev_low_level)
               end

       is_io_enoent: BOOLEAN
               do
                       Result := (value=io_enoent_low_level)
               end

       is_io_enoexec: BOOLEAN
               do
                       Result := (value=io_enoexec_low_level)
               end

       is_io_enolck: BOOLEAN
               do
                       Result := (value=io_enolck_low_level)
               end

       is_io_enomem: BOOLEAN
               do
                       Result := (value=io_enomem_low_level)
               end

       is_io_enospc: BOOLEAN
               do
                       Result := (value=io_enospc_low_level)
               end

       is_io_enosys: BOOLEAN
               do
                       Result := (value=io_enosys_low_level)
               end

       is_io_enotdir: BOOLEAN
               do
                       Result := (value=io_enotdir_low_level)
               end

       is_io_enotempty: BOOLEAN
               do
                       Result := (value=io_enotempty_low_level)
               end

       is_io_enotsock: BOOLEAN
               do
                       Result := (value=io_enotsock_low_level)
               end

       is_io_enotsup: BOOLEAN
               do
                       Result := (value=io_enotsup_low_level)
               end

       is_io_enotty: BOOLEAN
               do
                       Result := (value=io_enotty_low_level)
               end

       is_io_enxio: BOOLEAN
               do
                       Result := (value=io_enxio_low_level)
               end

       is_io_eperm: BOOLEAN
               do
                       Result := (value=io_eperm_low_level)
               end

       is_io_epipe: BOOLEAN
               do
                       Result := (value=io_epipe_low_level)
               end

       is_io_erange: BOOLEAN
               do
                       Result := (value=io_erange_low_level)
               end

       is_io_erofs: BOOLEAN
               do
                       Result := (value=io_erofs_low_level)
               end

       is_io_espipe: BOOLEAN
               do
                       Result := (value=io_espipe_low_level)
               end

       is_io_esrch: BOOLEAN
               do
                       Result := (value=io_esrch_low_level)
               end

       is_io_etimedout: BOOLEAN
               do
                       Result := (value=io_etimedout_low_level)
               end

       is_io_exdev: BOOLEAN
               do
                       Result := (value=io_exdev_low_level)
               end

       is_io_flush: BOOLEAN
               do
                       Result := (value=io_flush_low_level)
               end

       is_io_load_error: BOOLEAN
               do
                       Result := (value=io_load_error_low_level)
               end

       is_io_network_attempt: BOOLEAN
               do
                       Result := (value=io_network_attempt_low_level)
               end

       is_io_no_input: BOOLEAN
               do
                       Result := (value=io_no_input_low_level)
               end

       is_io_unknown: BOOLEAN
               do
                       Result := (value=io_unknown_low_level)
               end

       is_io_write: BOOLEAN
               do
                       Result := (value=io_write_low_level)
               end

       is_module_close: BOOLEAN
               do
                       Result := (value=module_close_low_level)
               end

       is_module_open: BOOLEAN
               do
                       Result := (value=module_open_low_level)
               end

       is_ns_err_attribute_redefined: BOOLEAN
               do
                       Result := (value=ns_err_attribute_redefined_low_level)
               end

       is_ns_err_colon: BOOLEAN
               do
                       Result := (value=ns_err_colon_low_level)
               end

       is_ns_err_empty: BOOLEAN
               do
                       Result := (value=ns_err_empty_low_level)
               end

       is_ns_err_qname: BOOLEAN
               do
                       Result := (value=ns_err_qname_low_level)
               end

       is_ns_err_undefined_namespace: BOOLEAN
               do
                       Result := (value=ns_err_undefined_namespace_low_level)
               end

       is_ns_err_xml_namespace: BOOLEAN
               do
                       Result := (value=ns_err_xml_namespace_low_level)
               end

       is_regexp_compile_error: BOOLEAN
               do
                       Result := (value=regexp_compile_error_low_level)
               end

       is_rngp_anyname_attr_ancestor: BOOLEAN
               do
                       Result := (value=rngp_anyname_attr_ancestor_low_level)
               end

       is_rngp_attr_conflict: BOOLEAN
               do
                       Result := (value=rngp_attr_conflict_low_level)
               end

       is_rngp_attribute_children: BOOLEAN
               do
                       Result := (value=rngp_attribute_children_low_level)
               end

       is_rngp_attribute_content: BOOLEAN
               do
                       Result := (value=rngp_attribute_content_low_level)
               end

       is_rngp_attribute_empty: BOOLEAN
               do
                       Result := (value=rngp_attribute_empty_low_level)
               end

       is_rngp_attribute_noop: BOOLEAN
               do
                       Result := (value=rngp_attribute_noop_low_level)
               end

       is_rngp_choice_content: BOOLEAN
               do
                       Result := (value=rngp_choice_content_low_level)
               end

       is_rngp_choice_empty: BOOLEAN
               do
                       Result := (value=rngp_choice_empty_low_level)
               end

       is_rngp_create_failure: BOOLEAN
               do
                       Result := (value=rngp_create_failure_low_level)
               end

       is_rngp_data_content: BOOLEAN
               do
                       Result := (value=rngp_data_content_low_level)
               end

       is_rngp_def_choice_and_interleave: BOOLEAN
               do
                       Result := (value=rngp_def_choice_and_interleave_low_level)
               end

       is_rngp_define_create_failed: BOOLEAN
               do
                       Result := (value=rngp_define_create_failed_low_level)
               end

       is_rngp_define_empty: BOOLEAN
               do
                       Result := (value=rngp_define_empty_low_level)
               end

       is_rngp_define_missing: BOOLEAN
               do
                       Result := (value=rngp_define_missing_low_level)
               end

       is_rngp_define_name_missing: BOOLEAN
               do
                       Result := (value=rngp_define_name_missing_low_level)
               end

       is_rngp_elem_content_empty: BOOLEAN
               do
                       Result := (value=rngp_elem_content_empty_low_level)
               end

       is_rngp_elem_content_error: BOOLEAN
               do
                       Result := (value=rngp_elem_content_error_low_level)
               end

       is_rngp_elem_text_conflict: BOOLEAN
               do
                       Result := (value=rngp_elem_text_conflict_low_level)
               end

       is_rngp_element_content: BOOLEAN
               do
                       Result := (value=rngp_element_content_low_level)
               end

       is_rngp_element_empty: BOOLEAN
               do
                       Result := (value=rngp_element_empty_low_level)
               end

       is_rngp_element_name: BOOLEAN
               do
                       Result := (value=rngp_element_name_low_level)
               end

       is_rngp_element_no_content: BOOLEAN
               do
                       Result := (value=rngp_element_no_content_low_level)
               end

       is_rngp_empty: BOOLEAN
               do
                       Result := (value=rngp_empty_low_level)
               end

       is_rngp_empty_construct: BOOLEAN
               do
                       Result := (value=rngp_empty_construct_low_level)
               end

       is_rngp_empty_content: BOOLEAN
               do
                       Result := (value=rngp_empty_content_low_level)
               end

       is_rngp_empty_not_empty: BOOLEAN
               do
                       Result := (value=rngp_empty_not_empty_low_level)
               end

       is_rngp_error_type_lib: BOOLEAN
               do
                       Result := (value=rngp_error_type_lib_low_level)
               end

       is_rngp_except_empty: BOOLEAN
               do
                       Result := (value=rngp_except_empty_low_level)
               end

       is_rngp_except_missing: BOOLEAN
               do
                       Result := (value=rngp_except_missing_low_level)
               end

       is_rngp_except_multiple: BOOLEAN
               do
                       Result := (value=rngp_except_multiple_low_level)
               end

       is_rngp_except_no_content: BOOLEAN
               do
                       Result := (value=rngp_except_no_content_low_level)
               end

       is_rngp_external_ref_failure: BOOLEAN
               do
                       Result := (value=rngp_external_ref_failure_low_level)
               end

       is_rngp_externalref_emtpy: BOOLEAN
               do
                       Result := (value=rngp_externalref_emtpy_low_level)
               end

       is_rngp_externalref_recurse: BOOLEAN
               do
                       Result := (value=rngp_externalref_recurse_low_level)
               end

       is_rngp_forbidden_attribute: BOOLEAN
               do
                       Result := (value=rngp_forbidden_attribute_low_level)
               end

       is_rngp_foreign_element: BOOLEAN
               do
                       Result := (value=rngp_foreign_element_low_level)
               end

       is_rngp_grammar_content: BOOLEAN
               do
                       Result := (value=rngp_grammar_content_low_level)
               end

       is_rngp_grammar_empty: BOOLEAN
               do
                       Result := (value=rngp_grammar_empty_low_level)
               end

       is_rngp_grammar_missing: BOOLEAN
               do
                       Result := (value=rngp_grammar_missing_low_level)
               end

       is_rngp_grammar_no_start: BOOLEAN
               do
                       Result := (value=rngp_grammar_no_start_low_level)
               end

       is_rngp_group_attr_conflict: BOOLEAN
               do
                       Result := (value=rngp_group_attr_conflict_low_level)
               end

       is_rngp_href_error: BOOLEAN
               do
                       Result := (value=rngp_href_error_low_level)
               end

       is_rngp_include_empty: BOOLEAN
               do
                       Result := (value=rngp_include_empty_low_level)
               end

       is_rngp_include_failure: BOOLEAN
               do
                       Result := (value=rngp_include_failure_low_level)
               end

       is_rngp_include_recurse: BOOLEAN
               do
                       Result := (value=rngp_include_recurse_low_level)
               end

       is_rngp_interleave_add: BOOLEAN
               do
                       Result := (value=rngp_interleave_add_low_level)
               end

       is_rngp_interleave_create_failed: BOOLEAN
               do
                       Result := (value=rngp_interleave_create_failed_low_level)
               end

       is_rngp_interleave_empty: BOOLEAN
               do
                       Result := (value=rngp_interleave_empty_low_level)
               end

       is_rngp_interleave_no_content: BOOLEAN
               do
                       Result := (value=rngp_interleave_no_content_low_level)
               end

       is_rngp_invalid_define_name: BOOLEAN
               do
                       Result := (value=rngp_invalid_define_name_low_level)
               end

       is_rngp_invalid_uri: BOOLEAN
               do
                       Result := (value=rngp_invalid_uri_low_level)
               end

       is_rngp_invalid_value: BOOLEAN
               do
                       Result := (value=rngp_invalid_value_low_level)
               end

       is_rngp_missing_href: BOOLEAN
               do
                       Result := (value=rngp_missing_href_low_level)
               end

       is_rngp_name_missing: BOOLEAN
               do
                       Result := (value=rngp_name_missing_low_level)
               end

       is_rngp_need_combine: BOOLEAN
               do
                       Result := (value=rngp_need_combine_low_level)
               end

       is_rngp_notallowed_not_empty: BOOLEAN
               do
                       Result := (value=rngp_notallowed_not_empty_low_level)
               end

       is_rngp_nsname_attr_ancestor: BOOLEAN
               do
                       Result := (value=rngp_nsname_attr_ancestor_low_level)
               end

       is_rngp_nsname_no_ns: BOOLEAN
               do
                       Result := (value=rngp_nsname_no_ns_low_level)
               end

       is_rngp_param_forbidden: BOOLEAN
               do
                       Result := (value=rngp_param_forbidden_low_level)
               end

       is_rngp_param_name_missing: BOOLEAN
               do
                       Result := (value=rngp_param_name_missing_low_level)
               end

       is_rngp_parentref_create_failed: BOOLEAN
               do
                       Result := (value=rngp_parentref_create_failed_low_level)
               end

       is_rngp_parentref_name_invalid: BOOLEAN
               do
                       Result := (value=rngp_parentref_name_invalid_low_level)
               end

       is_rngp_parentref_no_name: BOOLEAN
               do
                       Result := (value=rngp_parentref_no_name_low_level)
               end

       is_rngp_parentref_no_parent: BOOLEAN
               do
                       Result := (value=rngp_parentref_no_parent_low_level)
               end

       is_rngp_parentref_not_empty: BOOLEAN
               do
                       Result := (value=rngp_parentref_not_empty_low_level)
               end

       is_rngp_parse_error: BOOLEAN
               do
                       Result := (value=rngp_parse_error_low_level)
               end

       is_rngp_pat_anyname_except_anyname: BOOLEAN
               do
                       Result := (value=rngp_pat_anyname_except_anyname_low_level)
               end

       is_rngp_pat_attr_attr: BOOLEAN
               do
                       Result := (value=rngp_pat_attr_attr_low_level)
               end

       is_rngp_pat_attr_elem: BOOLEAN
               do
                       Result := (value=rngp_pat_attr_elem_low_level)
               end

       is_rngp_pat_data_except_attr: BOOLEAN
               do
                       Result := (value=rngp_pat_data_except_attr_low_level)
               end

       is_rngp_pat_data_except_elem: BOOLEAN
               do
                       Result := (value=rngp_pat_data_except_elem_low_level)
               end

       is_rngp_pat_data_except_empty: BOOLEAN
               do
                       Result := (value=rngp_pat_data_except_empty_low_level)
               end

       is_rngp_pat_data_except_group: BOOLEAN
               do
                       Result := (value=rngp_pat_data_except_group_low_level)
               end

       is_rngp_pat_data_except_interleave: BOOLEAN
               do
                       Result := (value=rngp_pat_data_except_interleave_low_level)
               end

       is_rngp_pat_data_except_list: BOOLEAN
               do
                       Result := (value=rngp_pat_data_except_list_low_level)
               end

       is_rngp_pat_data_except_onemore: BOOLEAN
               do
                       Result := (value=rngp_pat_data_except_onemore_low_level)
               end

       is_rngp_pat_data_except_ref: BOOLEAN
               do
                       Result := (value=rngp_pat_data_except_ref_low_level)
               end

       is_rngp_pat_data_except_text: BOOLEAN
               do
                       Result := (value=rngp_pat_data_except_text_low_level)
               end

       is_rngp_pat_list_attr: BOOLEAN
               do
                       Result := (value=rngp_pat_list_attr_low_level)
               end

       is_rngp_pat_list_elem: BOOLEAN
               do
                       Result := (value=rngp_pat_list_elem_low_level)
               end

       is_rngp_pat_list_interleave: BOOLEAN
               do
                       Result := (value=rngp_pat_list_interleave_low_level)
               end

       is_rngp_pat_list_list: BOOLEAN
               do
                       Result := (value=rngp_pat_list_list_low_level)
               end

       is_rngp_pat_list_ref: BOOLEAN
               do
                       Result := (value=rngp_pat_list_ref_low_level)
               end

       is_rngp_pat_list_text: BOOLEAN
               do
                       Result := (value=rngp_pat_list_text_low_level)
               end

       is_rngp_pat_nsname_except_anyname: BOOLEAN
               do
                       Result := (value=rngp_pat_nsname_except_anyname_low_level)
               end

       is_rngp_pat_nsname_except_nsname: BOOLEAN
               do
                       Result := (value=rngp_pat_nsname_except_nsname_low_level)
               end

       is_rngp_pat_onemore_group_attr: BOOLEAN
               do
                       Result := (value=rngp_pat_onemore_group_attr_low_level)
               end

       is_rngp_pat_onemore_interleave_attr: BOOLEAN
               do
                       Result := (value=rngp_pat_onemore_interleave_attr_low_level)
               end

       is_rngp_pat_start_attr: BOOLEAN
               do
                       Result := (value=rngp_pat_start_attr_low_level)
               end

       is_rngp_pat_start_data: BOOLEAN
               do
                       Result := (value=rngp_pat_start_data_low_level)
               end

       is_rngp_pat_start_empty: BOOLEAN
               do
                       Result := (value=rngp_pat_start_empty_low_level)
               end

       is_rngp_pat_start_group: BOOLEAN
               do
                       Result := (value=rngp_pat_start_group_low_level)
               end

       is_rngp_pat_start_interleave: BOOLEAN
               do
                       Result := (value=rngp_pat_start_interleave_low_level)
               end

       is_rngp_pat_start_list: BOOLEAN
               do
                       Result := (value=rngp_pat_start_list_low_level)
               end

       is_rngp_pat_start_onemore: BOOLEAN
               do
                       Result := (value=rngp_pat_start_onemore_low_level)
               end

       is_rngp_pat_start_text: BOOLEAN
               do
                       Result := (value=rngp_pat_start_text_low_level)
               end

       is_rngp_pat_start_value: BOOLEAN
               do
                       Result := (value=rngp_pat_start_value_low_level)
               end

       is_rngp_prefix_undefined: BOOLEAN
               do
                       Result := (value=rngp_prefix_undefined_low_level)
               end

       is_rngp_ref_create_failed: BOOLEAN
               do
                       Result := (value=rngp_ref_create_failed_low_level)
               end

       is_rngp_ref_cycle: BOOLEAN
               do
                       Result := (value=rngp_ref_cycle_low_level)
               end

       is_rngp_ref_name_invalid: BOOLEAN
               do
                       Result := (value=rngp_ref_name_invalid_low_level)
               end

       is_rngp_ref_no_def: BOOLEAN
               do
                       Result := (value=rngp_ref_no_def_low_level)
               end

       is_rngp_ref_no_name: BOOLEAN
               do
                       Result := (value=rngp_ref_no_name_low_level)
               end

       is_rngp_ref_not_empty: BOOLEAN
               do
                       Result := (value=rngp_ref_not_empty_low_level)
               end

       is_rngp_start_choice_and_interleave: BOOLEAN
               do
                       Result := (value=rngp_start_choice_and_interleave_low_level)
               end

       is_rngp_start_content: BOOLEAN
               do
                       Result := (value=rngp_start_content_low_level)
               end

       is_rngp_start_empty: BOOLEAN
               do
                       Result := (value=rngp_start_empty_low_level)
               end

       is_rngp_start_missing: BOOLEAN
               do
                       Result := (value=rngp_start_missing_low_level)
               end

       is_rngp_text_expected: BOOLEAN
               do
                       Result := (value=rngp_text_expected_low_level)
               end

       is_rngp_text_has_child: BOOLEAN
               do
                       Result := (value=rngp_text_has_child_low_level)
               end

       is_rngp_type_missing: BOOLEAN
               do
                       Result := (value=rngp_type_missing_low_level)
               end

       is_rngp_type_not_found: BOOLEAN
               do
                       Result := (value=rngp_type_not_found_low_level)
               end

       is_rngp_type_value: BOOLEAN
               do
                       Result := (value=rngp_type_value_low_level)
               end

       is_rngp_unknown_attribute: BOOLEAN
               do
                       Result := (value=rngp_unknown_attribute_low_level)
               end

       is_rngp_unknown_combine: BOOLEAN
               do
                       Result := (value=rngp_unknown_combine_low_level)
               end

       is_rngp_unknown_construct: BOOLEAN
               do
                       Result := (value=rngp_unknown_construct_low_level)
               end

       is_rngp_unknown_type_lib: BOOLEAN
               do
                       Result := (value=rngp_unknown_type_lib_low_level)
               end

       is_rngp_uri_fragment: BOOLEAN
               do
                       Result := (value=rngp_uri_fragment_low_level)
               end

       is_rngp_uri_not_absolute: BOOLEAN
               do
                       Result := (value=rngp_uri_not_absolute_low_level)
               end

       is_rngp_value_empty: BOOLEAN
               do
                       Result := (value=rngp_value_empty_low_level)
               end

       is_rngp_value_no_content: BOOLEAN
               do
                       Result := (value=rngp_value_no_content_low_level)
               end

       is_rngp_xml_ns: BOOLEAN
               do
                       Result := (value=rngp_xml_ns_low_level)
               end

       is_rngp_xmlns_name: BOOLEAN
               do
                       Result := (value=rngp_xmlns_name_low_level)
               end

       is_save_char_invalid: BOOLEAN
               do
                       Result := (value=save_char_invalid_low_level)
               end

       is_save_no_doctype: BOOLEAN
               do
                       Result := (value=save_no_doctype_low_level)
               end

       is_save_not_utf8: BOOLEAN
               do
                       Result := (value=save_not_utf8_low_level)
               end

       is_save_unknown_encoding: BOOLEAN
               do
                       Result := (value=save_unknown_encoding_low_level)
               end

       is_schemap_a_props_correct_2: BOOLEAN
               do
                       Result := (value=schemap_a_props_correct_2_low_level)
               end

       is_schemap_a_props_correct_3: BOOLEAN
               do
                       Result := (value=schemap_a_props_correct_3_low_level)
               end

       is_schemap_ag_props_correct: BOOLEAN
               do
                       Result := (value=schemap_ag_props_correct_low_level)
               end

       is_schemap_attr_noname_noref: BOOLEAN
               do
                       Result := (value=schemap_attr_noname_noref_low_level)
               end

       is_schemap_attrformdefault_value: BOOLEAN
               do
                       Result := (value=schemap_attrformdefault_value_low_level)
               end

       is_schemap_attrgrp_noname_noref: BOOLEAN
               do
                       Result := (value=schemap_attrgrp_noname_noref_low_level)
               end

       is_schemap_au_props_correct: BOOLEAN
               do
                       Result := (value=schemap_au_props_correct_low_level)
               end

       is_schemap_au_props_correct_2: BOOLEAN
               do
                       Result := (value=schemap_au_props_correct_2_low_level)
               end

       is_schemap_c_props_correct: BOOLEAN
               do
                       Result := (value=schemap_c_props_correct_low_level)
               end

       is_schemap_complextype_noname_noref: BOOLEAN
               do
                       Result := (value=schemap_complextype_noname_noref_low_level)
               end

       is_schemap_cos_all_limited: BOOLEAN
               do
                       Result := (value=schemap_cos_all_limited_low_level)
               end

       is_schemap_cos_ct_extends_1_1: BOOLEAN
               do
                       Result := (value=schemap_cos_ct_extends_1_1_low_level)
               end

       is_schemap_cos_ct_extends_1_2: BOOLEAN
               do
                       Result := (value=schemap_cos_ct_extends_1_2_low_level)
               end

       is_schemap_cos_ct_extends_1_3: BOOLEAN
               do
                       Result := (value=schemap_cos_ct_extends_1_3_low_level)
               end

       is_schemap_cos_st_derived_ok_2_1: BOOLEAN
               do
                       Result := (value=schemap_cos_st_derived_ok_2_1_low_level)
               end

       is_schemap_cos_st_derived_ok_2_2: BOOLEAN
               do
                       Result := (value=schemap_cos_st_derived_ok_2_2_low_level)
               end

       is_schemap_cos_st_restricts_1_1: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_1_1_low_level)
               end

       is_schemap_cos_st_restricts_1_2: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_1_2_low_level)
               end

       is_schemap_cos_st_restricts_1_3_1: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_1_3_1_low_level)
               end

       is_schemap_cos_st_restricts_1_3_2: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_1_3_2_low_level)
               end

       is_schemap_cos_st_restricts_2_1: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_2_1_low_level)
               end

       is_schemap_cos_st_restricts_2_3_1_1: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_2_3_1_1_low_level)
               end

       is_schemap_cos_st_restricts_2_3_1_2: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_2_3_1_2_low_level)
               end

       is_schemap_cos_st_restricts_2_3_2_1: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_2_3_2_1_low_level)
               end

       is_schemap_cos_st_restricts_2_3_2_2: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_2_3_2_2_low_level)
               end

       is_schemap_cos_st_restricts_2_3_2_3: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_2_3_2_3_low_level)
               end

       is_schemap_cos_st_restricts_2_3_2_4: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_2_3_2_4_low_level)
               end

       is_schemap_cos_st_restricts_2_3_2_5: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_2_3_2_5_low_level)
               end

       is_schemap_cos_st_restricts_3_1: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_3_1_low_level)
               end

       is_schemap_cos_st_restricts_3_3_1: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_3_3_1_low_level)
               end

       is_schemap_cos_st_restricts_3_3_1_2: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_3_3_1_2_low_level)
               end

       is_schemap_cos_st_restricts_3_3_2_1: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_3_3_2_1_low_level)
               end

       is_schemap_cos_st_restricts_3_3_2_2: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_3_3_2_2_low_level)
               end

       is_schemap_cos_st_restricts_3_3_2_3: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_3_3_2_3_low_level)
               end

       is_schemap_cos_st_restricts_3_3_2_4: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_3_3_2_4_low_level)
               end

       is_schemap_cos_st_restricts_3_3_2_5: BOOLEAN
               do
                       Result := (value=schemap_cos_st_restricts_3_3_2_5_low_level)
               end

       is_schemap_cos_valid_default_1: BOOLEAN
               do
                       Result := (value=schemap_cos_valid_default_1_low_level)
               end

       is_schemap_cos_valid_default_2_1: BOOLEAN
               do
                       Result := (value=schemap_cos_valid_default_2_1_low_level)
               end

       is_schemap_cos_valid_default_2_2_1: BOOLEAN
               do
                       Result := (value=schemap_cos_valid_default_2_2_1_low_level)
               end

       is_schemap_cos_valid_default_2_2_2: BOOLEAN
               do
                       Result := (value=schemap_cos_valid_default_2_2_2_low_level)
               end

       is_schemap_ct_props_correct_1: BOOLEAN
               do
                       Result := (value=schemap_ct_props_correct_1_low_level)
               end

       is_schemap_ct_props_correct_2: BOOLEAN
               do
                       Result := (value=schemap_ct_props_correct_2_low_level)
               end

       is_schemap_ct_props_correct_3: BOOLEAN
               do
                       Result := (value=schemap_ct_props_correct_3_low_level)
               end

       is_schemap_ct_props_correct_4: BOOLEAN
               do
                       Result := (value=schemap_ct_props_correct_4_low_level)
               end

       is_schemap_ct_props_correct_5: BOOLEAN
               do
                       Result := (value=schemap_ct_props_correct_5_low_level)
               end

       is_schemap_cvc_simple_type: BOOLEAN
               do
                       Result := (value=schemap_cvc_simple_type_low_level)
               end

       is_schemap_def_and_prefix: BOOLEAN
               do
                       Result := (value=schemap_def_and_prefix_low_level)
               end

       is_schemap_derivation_ok_restriction_1: BOOLEAN
               do
                       Result := (value=schemap_derivation_ok_restriction_1_low_level)
               end

       is_schemap_derivation_ok_restriction_2_1_1: BOOLEAN
               do
                       Result := (value=schemap_derivation_ok_restriction_2_1_1_low_level)
               end

       is_schemap_derivation_ok_restriction_2_1_2: BOOLEAN
               do
                       Result := (value=schemap_derivation_ok_restriction_2_1_2_low_level)
               end

       is_schemap_derivation_ok_restriction_2_1_3: BOOLEAN
               do
                       Result := (value=schemap_derivation_ok_restriction_2_1_3_low_level)
               end

       is_schemap_derivation_ok_restriction_2_2: BOOLEAN
               do
                       Result := (value=schemap_derivation_ok_restriction_2_2_low_level)
               end

       is_schemap_derivation_ok_restriction_3: BOOLEAN
               do
                       Result := (value=schemap_derivation_ok_restriction_3_low_level)
               end

       is_schemap_derivation_ok_restriction_4_1: BOOLEAN
               do
                       Result := (value=schemap_derivation_ok_restriction_4_1_low_level)
               end

       is_schemap_derivation_ok_restriction_4_2: BOOLEAN
               do
                       Result := (value=schemap_derivation_ok_restriction_4_2_low_level)
               end

       is_schemap_derivation_ok_restriction_4_3: BOOLEAN
               do
                       Result := (value=schemap_derivation_ok_restriction_4_3_low_level)
               end

       is_schemap_e_props_correct_2: BOOLEAN
               do
                       Result := (value=schemap_e_props_correct_2_low_level)
               end

       is_schemap_e_props_correct_3: BOOLEAN
               do
                       Result := (value=schemap_e_props_correct_3_low_level)
               end

       is_schemap_e_props_correct_4: BOOLEAN
               do
                       Result := (value=schemap_e_props_correct_4_low_level)
               end

       is_schemap_e_props_correct_5: BOOLEAN
               do
                       Result := (value=schemap_e_props_correct_5_low_level)
               end

       is_schemap_e_props_correct_6: BOOLEAN
               do
                       Result := (value=schemap_e_props_correct_6_low_level)
               end

       is_schemap_elem_default_fixed: BOOLEAN
               do
                       Result := (value=schemap_elem_default_fixed_low_level)
               end

       is_schemap_elem_noname_noref: BOOLEAN
               do
                       Result := (value=schemap_elem_noname_noref_low_level)
               end

       is_schemap_elemformdefault_value: BOOLEAN
               do
                       Result := (value=schemap_elemformdefault_value_low_level)
               end

       is_schemap_extension_no_base: BOOLEAN
               do
                       Result := (value=schemap_extension_no_base_low_level)
               end

       is_schemap_facet_no_value: BOOLEAN
               do
                       Result := (value=schemap_facet_no_value_low_level)
               end

       is_schemap_failed_build_import: BOOLEAN
               do
                       Result := (value=schemap_failed_build_import_low_level)
               end

       is_schemap_failed_load: BOOLEAN
               do
                       Result := (value=schemap_failed_load_low_level)
               end

       is_schemap_failed_parse: BOOLEAN
               do
                       Result := (value=schemap_failed_parse_low_level)
               end

       is_schemap_group_noname_noref: BOOLEAN
               do
                       Result := (value=schemap_group_noname_noref_low_level)
               end

       is_schemap_import_namespace_not_uri: BOOLEAN
               do
                       Result := (value=schemap_import_namespace_not_uri_low_level)
               end

       is_schemap_import_redefine_nsname: BOOLEAN
               do
                       Result := (value=schemap_import_redefine_nsname_low_level)
               end

       is_schemap_import_schema_not_uri: BOOLEAN
               do
                       Result := (value=schemap_import_schema_not_uri_low_level)
               end

       is_schemap_include_schema_no_uri: BOOLEAN
               do
                       Result := (value=schemap_include_schema_no_uri_low_level)
               end

       is_schemap_include_schema_not_uri: BOOLEAN
               do
                       Result := (value=schemap_include_schema_not_uri_low_level)
               end

       is_schemap_internal: BOOLEAN
               do
                       Result := (value=schemap_internal_low_level)
               end

       is_schemap_intersection_not_expressible: BOOLEAN
               do
                       Result := (value=schemap_intersection_not_expressible_low_level)
               end

       is_schemap_invalid_attr_combination: BOOLEAN
               do
                       Result := (value=schemap_invalid_attr_combination_low_level)
               end

       is_schemap_invalid_attr_inline_combination: BOOLEAN
               do
                       Result := (value=schemap_invalid_attr_inline_combination_low_level)
               end

       is_schemap_invalid_attr_name: BOOLEAN
               do
                       Result := (value=schemap_invalid_attr_name_low_level)
               end

       is_schemap_invalid_attr_use: BOOLEAN
               do
                       Result := (value=schemap_invalid_attr_use_low_level)
               end

       is_schemap_invalid_boolean: BOOLEAN
               do
                       Result := (value=schemap_invalid_boolean_low_level)
               end

       is_schemap_invalid_enum: BOOLEAN
               do
                       Result := (value=schemap_invalid_enum_low_level)
               end

       is_schemap_invalid_facet: BOOLEAN
               do
                       Result := (value=schemap_invalid_facet_low_level)
               end

       is_schemap_invalid_facet_value: BOOLEAN
               do
                       Result := (value=schemap_invalid_facet_value_low_level)
               end

       is_schemap_invalid_maxoccurs: BOOLEAN
               do
                       Result := (value=schemap_invalid_maxoccurs_low_level)
               end

       is_schemap_invalid_minoccurs: BOOLEAN
               do
                       Result := (value=schemap_invalid_minoccurs_low_level)
               end

       is_schemap_invalid_ref_and_subtype: BOOLEAN
               do
                       Result := (value=schemap_invalid_ref_and_subtype_low_level)
               end

       is_schemap_invalid_white_space: BOOLEAN
               do
                       Result := (value=schemap_invalid_white_space_low_level)
               end

       is_schemap_mg_props_correct_1: BOOLEAN
               do
                       Result := (value=schemap_mg_props_correct_1_low_level)
               end

       is_schemap_mg_props_correct_2: BOOLEAN
               do
                       Result := (value=schemap_mg_props_correct_2_low_level)
               end

       is_schemap_missing_simpletype_child: BOOLEAN
               do
                       Result := (value=schemap_missing_simpletype_child_low_level)
               end

       is_schemap_no_xmlns: BOOLEAN
               do
                       Result := (value=schemap_no_xmlns_low_level)
               end

       is_schemap_no_xsi: BOOLEAN
               do
                       Result := (value=schemap_no_xsi_low_level)
               end

       is_schemap_noattr_noref: BOOLEAN
               do
                       Result := (value=schemap_noattr_noref_low_level)
               end

       is_schemap_noroot: BOOLEAN
               do
                       Result := (value=schemap_noroot_low_level)
               end

       is_schemap_not_deterministic: BOOLEAN
               do
                       Result := (value=schemap_not_deterministic_low_level)
               end

       is_schemap_not_schema: BOOLEAN
               do
                       Result := (value=schemap_not_schema_low_level)
               end

       is_schemap_notation_no_name: BOOLEAN
               do
                       Result := (value=schemap_notation_no_name_low_level)
               end

       is_schemap_nothing_to_parse: BOOLEAN
               do
                       Result := (value=schemap_nothing_to_parse_low_level)
               end

       is_schemap_notype_noref: BOOLEAN
               do
                       Result := (value=schemap_notype_noref_low_level)
               end

       is_schemap_p_props_correct_1: BOOLEAN
               do
                       Result := (value=schemap_p_props_correct_1_low_level)
               end

       is_schemap_p_props_correct_2_1: BOOLEAN
               do
                       Result := (value=schemap_p_props_correct_2_1_low_level)
               end

       is_schemap_p_props_correct_2_2: BOOLEAN
               do
                       Result := (value=schemap_p_props_correct_2_2_low_level)
               end

       is_schemap_prefix_undefined: BOOLEAN
               do
                       Result := (value=schemap_prefix_undefined_low_level)
               end

       is_schemap_recursive: BOOLEAN
               do
                       Result := (value=schemap_recursive_low_level)
               end

       is_schemap_redefined_attr: BOOLEAN
               do
                       Result := (value=schemap_redefined_attr_low_level)
               end

       is_schemap_redefined_attrgroup: BOOLEAN
               do
                       Result := (value=schemap_redefined_attrgroup_low_level)
               end

       is_schemap_redefined_element: BOOLEAN
               do
                       Result := (value=schemap_redefined_element_low_level)
               end

       is_schemap_redefined_group: BOOLEAN
               do
                       Result := (value=schemap_redefined_group_low_level)
               end

       is_schemap_redefined_notation: BOOLEAN
               do
                       Result := (value=schemap_redefined_notation_low_level)
               end

       is_schemap_redefined_type: BOOLEAN
               do
                       Result := (value=schemap_redefined_type_low_level)
               end

       is_schemap_ref_and_content: BOOLEAN
               do
                       Result := (value=schemap_ref_and_content_low_level)
               end

       is_schemap_ref_and_subtype: BOOLEAN
               do
                       Result := (value=schemap_ref_and_subtype_low_level)
               end

       is_schemap_regexp_invalid: BOOLEAN
               do
                       Result := (value=schemap_regexp_invalid_low_level)
               end

       is_schemap_restriction_noname_noref: BOOLEAN
               do
                       Result := (value=schemap_restriction_noname_noref_low_level)
               end

       is_schemap_s4s_attr_invalid_value: BOOLEAN
               do
                       Result := (value=schemap_s4s_attr_invalid_value_low_level)
               end

       is_schemap_s4s_attr_missing: BOOLEAN
               do
                       Result := (value=schemap_s4s_attr_missing_low_level)
               end

       is_schemap_s4s_attr_not_allowed: BOOLEAN
               do
                       Result := (value=schemap_s4s_attr_not_allowed_low_level)
               end

       is_schemap_s4s_elem_missing: BOOLEAN
               do
                       Result := (value=schemap_s4s_elem_missing_low_level)
               end

       is_schemap_s4s_elem_not_allowed: BOOLEAN
               do
                       Result := (value=schemap_s4s_elem_not_allowed_low_level)
               end

       is_schemap_simpletype_noname: BOOLEAN
               do
                       Result := (value=schemap_simpletype_noname_low_level)
               end

       is_schemap_src_attribute_1: BOOLEAN
               do
                       Result := (value=schemap_src_attribute_1_low_level)
               end

       is_schemap_src_attribute_2: BOOLEAN
               do
                       Result := (value=schemap_src_attribute_2_low_level)
               end

       is_schemap_src_attribute_3_1: BOOLEAN
               do
                       Result := (value=schemap_src_attribute_3_1_low_level)
               end

       is_schemap_src_attribute_3_2: BOOLEAN
               do
                       Result := (value=schemap_src_attribute_3_2_low_level)
               end

       is_schemap_src_attribute_4: BOOLEAN
               do
                       Result := (value=schemap_src_attribute_4_low_level)
               end

       is_schemap_src_attribute_group_1: BOOLEAN
               do
                       Result := (value=schemap_src_attribute_group_1_low_level)
               end

       is_schemap_src_attribute_group_2: BOOLEAN
               do
                       Result := (value=schemap_src_attribute_group_2_low_level)
               end

       is_schemap_src_attribute_group_3: BOOLEAN
               do
                       Result := (value=schemap_src_attribute_group_3_low_level)
               end

       is_schemap_src_ct_1: BOOLEAN
               do
                       Result := (value=schemap_src_ct_1_low_level)
               end

       is_schemap_src_element_1: BOOLEAN
               do
                       Result := (value=schemap_src_element_1_low_level)
               end

       is_schemap_src_element_2_1: BOOLEAN
               do
                       Result := (value=schemap_src_element_2_1_low_level)
               end

       is_schemap_src_element_2_2: BOOLEAN
               do
                       Result := (value=schemap_src_element_2_2_low_level)
               end

       is_schemap_src_element_3: BOOLEAN
               do
                       Result := (value=schemap_src_element_3_low_level)
               end

       is_schemap_src_import: BOOLEAN
               do
                       Result := (value=schemap_src_import_low_level)
               end

       is_schemap_src_import_1_1: BOOLEAN
               do
                       Result := (value=schemap_src_import_1_1_low_level)
               end

       is_schemap_src_import_1_2: BOOLEAN
               do
                       Result := (value=schemap_src_import_1_2_low_level)
               end

       is_schemap_src_import_2: BOOLEAN
               do
                       Result := (value=schemap_src_import_2_low_level)
               end

       is_schemap_src_import_2_1: BOOLEAN
               do
                       Result := (value=schemap_src_import_2_1_low_level)
               end

       is_schemap_src_import_2_2: BOOLEAN
               do
                       Result := (value=schemap_src_import_2_2_low_level)
               end

       is_schemap_src_import_3_1: BOOLEAN
               do
                       Result := (value=schemap_src_import_3_1_low_level)
               end

       is_schemap_src_import_3_2: BOOLEAN
               do
                       Result := (value=schemap_src_import_3_2_low_level)
               end

       is_schemap_src_include: BOOLEAN
               do
                       Result := (value=schemap_src_include_low_level)
               end

       is_schemap_src_list_itemtype_or_simpletype: BOOLEAN
               do
                       Result := (value=schemap_src_list_itemtype_or_simpletype_low_level)
               end

       is_schemap_src_redefine: BOOLEAN
               do
                       Result := (value=schemap_src_redefine_low_level)
               end

       is_schemap_src_resolve: BOOLEAN
               do
                       Result := (value=schemap_src_resolve_low_level)
               end

       is_schemap_src_restriction_base_or_simpletype: BOOLEAN
               do
                       Result := (value=schemap_src_restriction_base_or_simpletype_low_level)
               end

       is_schemap_src_simple_type_1: BOOLEAN
               do
                       Result := (value=schemap_src_simple_type_1_low_level)
               end

       is_schemap_src_simple_type_2: BOOLEAN
               do
                       Result := (value=schemap_src_simple_type_2_low_level)
               end

       is_schemap_src_simple_type_3: BOOLEAN
               do
                       Result := (value=schemap_src_simple_type_3_low_level)
               end

       is_schemap_src_simple_type_4: BOOLEAN
               do
                       Result := (value=schemap_src_simple_type_4_low_level)
               end

       is_schemap_src_union_membertypes_or_simpletypes: BOOLEAN
               do
                       Result := (value=schemap_src_union_membertypes_or_simpletypes_low_level)
               end

       is_schemap_st_props_correct_1: BOOLEAN
               do
                       Result := (value=schemap_st_props_correct_1_low_level)
               end

       is_schemap_st_props_correct_2: BOOLEAN
               do
                       Result := (value=schemap_st_props_correct_2_low_level)
               end

       is_schemap_st_props_correct_3: BOOLEAN
               do
                       Result := (value=schemap_st_props_correct_3_low_level)
               end

       is_schemap_supernumerous_list_item_type: BOOLEAN
               do
                       Result := (value=schemap_supernumerous_list_item_type_low_level)
               end

       is_schemap_type_and_subtype: BOOLEAN
               do
                       Result := (value=schemap_type_and_subtype_low_level)
               end

       is_schemap_union_not_expressible: BOOLEAN
               do
                       Result := (value=schemap_union_not_expressible_low_level)
               end

       is_schemap_unknown_all_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_all_child_low_level)
               end

       is_schemap_unknown_anyattribute_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_anyattribute_child_low_level)
               end

       is_schemap_unknown_attr_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_attr_child_low_level)
               end

       is_schemap_unknown_attrgrp_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_attrgrp_child_low_level)
               end

       is_schemap_unknown_attribute_group: BOOLEAN
               do
                       Result := (value=schemap_unknown_attribute_group_low_level)
               end

       is_schemap_unknown_base_type: BOOLEAN
               do
                       Result := (value=schemap_unknown_base_type_low_level)
               end

       is_schemap_unknown_choice_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_choice_child_low_level)
               end

       is_schemap_unknown_complexcontent_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_complexcontent_child_low_level)
               end

       is_schemap_unknown_complextype_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_complextype_child_low_level)
               end

       is_schemap_unknown_elem_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_elem_child_low_level)
               end

       is_schemap_unknown_extension_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_extension_child_low_level)
               end

       is_schemap_unknown_facet_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_facet_child_low_level)
               end

       is_schemap_unknown_facet_type: BOOLEAN
               do
                       Result := (value=schemap_unknown_facet_type_low_level)
               end

       is_schemap_unknown_group_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_group_child_low_level)
               end

       is_schemap_unknown_import_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_import_child_low_level)
               end

       is_schemap_unknown_include_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_include_child_low_level)
               end

       is_schemap_unknown_list_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_list_child_low_level)
               end

       is_schemap_unknown_member_type: BOOLEAN
               do
                       Result := (value=schemap_unknown_member_type_low_level)
               end

       is_schemap_unknown_notation_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_notation_child_low_level)
               end

       is_schemap_unknown_prefix: BOOLEAN
               do
                       Result := (value=schemap_unknown_prefix_low_level)
               end

       is_schemap_unknown_processcontent_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_processcontent_child_low_level)
               end

       is_schemap_unknown_ref: BOOLEAN
               do
                       Result := (value=schemap_unknown_ref_low_level)
               end

       is_schemap_unknown_restriction_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_restriction_child_low_level)
               end

       is_schemap_unknown_schemas_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_schemas_child_low_level)
               end

       is_schemap_unknown_sequence_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_sequence_child_low_level)
               end

       is_schemap_unknown_simplecontent_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_simplecontent_child_low_level)
               end

       is_schemap_unknown_simpletype_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_simpletype_child_low_level)
               end

       is_schemap_unknown_type: BOOLEAN
               do
                       Result := (value=schemap_unknown_type_low_level)
               end

       is_schemap_unknown_union_child: BOOLEAN
               do
                       Result := (value=schemap_unknown_union_child_low_level)
               end

       is_schemap_warn_attr_pointless_proh: BOOLEAN
               do
                       Result := (value=schemap_warn_attr_pointless_proh_low_level)
               end

       is_schemap_warn_attr_redecl_proh: BOOLEAN
               do
                       Result := (value=schemap_warn_attr_redecl_proh_low_level)
               end

       is_schemap_warn_skip_schema: BOOLEAN
               do
                       Result := (value=schemap_warn_skip_schema_low_level)
               end

       is_schemap_warn_unlocated_schema: BOOLEAN
               do
                       Result := (value=schemap_warn_unlocated_schema_low_level)
               end

       is_schemap_wildcard_invalid_ns_member: BOOLEAN
               do
                       Result := (value=schemap_wildcard_invalid_ns_member_low_level)
               end

       is_schematronv_assert: BOOLEAN
               do
                       Result := (value=schematronv_assert_low_level)
               end

       is_schematronv_report: BOOLEAN
               do
                       Result := (value=schematronv_report_low_level)
               end

       is_schemav_attrinvalid: BOOLEAN
               do
                       Result := (value=schemav_attrinvalid_low_level)
               end

       is_schemav_attrunknown: BOOLEAN
               do
                       Result := (value=schemav_attrunknown_low_level)
               end

       is_schemav_construct: BOOLEAN
               do
                       Result := (value=schemav_construct_low_level)
               end

       is_schemav_cvc_attribute_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_attribute_1_low_level)
               end

       is_schemav_cvc_attribute_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_attribute_2_low_level)
               end

       is_schemav_cvc_attribute_3: BOOLEAN
               do
                       Result := (value=schemav_cvc_attribute_3_low_level)
               end

       is_schemav_cvc_attribute_4: BOOLEAN
               do
                       Result := (value=schemav_cvc_attribute_4_low_level)
               end

       is_schemav_cvc_au: BOOLEAN
               do
                       Result := (value=schemav_cvc_au_low_level)
               end

       is_schemav_cvc_complex_type_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_1_low_level)
               end

       is_schemav_cvc_complex_type_2_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_2_1_low_level)
               end

       is_schemav_cvc_complex_type_2_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_2_2_low_level)
               end

       is_schemav_cvc_complex_type_2_3: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_2_3_low_level)
               end

       is_schemav_cvc_complex_type_2_4: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_2_4_low_level)
               end

       is_schemav_cvc_complex_type_3_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_3_1_low_level)
               end

       is_schemav_cvc_complex_type_3_2_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_3_2_1_low_level)
               end

       is_schemav_cvc_complex_type_3_2_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_3_2_2_low_level)
               end

       is_schemav_cvc_complex_type_4: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_4_low_level)
               end

       is_schemav_cvc_complex_type_5_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_5_1_low_level)
               end

       is_schemav_cvc_complex_type_5_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_complex_type_5_2_low_level)
               end

       is_schemav_cvc_datatype_valid_1_2_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_datatype_valid_1_2_1_low_level)
               end

       is_schemav_cvc_datatype_valid_1_2_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_datatype_valid_1_2_2_low_level)
               end

       is_schemav_cvc_datatype_valid_1_2_3: BOOLEAN
               do
                       Result := (value=schemav_cvc_datatype_valid_1_2_3_low_level)
               end

       is_schemav_cvc_elt_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_1_low_level)
               end

       is_schemav_cvc_elt_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_2_low_level)
               end

       is_schemav_cvc_elt_3_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_3_1_low_level)
               end

       is_schemav_cvc_elt_3_2_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_3_2_1_low_level)
               end

       is_schemav_cvc_elt_3_2_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_3_2_2_low_level)
               end

       is_schemav_cvc_elt_4_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_4_1_low_level)
               end

       is_schemav_cvc_elt_4_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_4_2_low_level)
               end

       is_schemav_cvc_elt_4_3: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_4_3_low_level)
               end

       is_schemav_cvc_elt_5_1_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_5_1_1_low_level)
               end

       is_schemav_cvc_elt_5_1_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_5_1_2_low_level)
               end

       is_schemav_cvc_elt_5_2_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_5_2_1_low_level)
               end

       is_schemav_cvc_elt_5_2_2_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_5_2_2_1_low_level)
               end

       is_schemav_cvc_elt_5_2_2_2_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_5_2_2_2_1_low_level)
               end

       is_schemav_cvc_elt_5_2_2_2_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_5_2_2_2_2_low_level)
               end

       is_schemav_cvc_elt_6: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_6_low_level)
               end

       is_schemav_cvc_elt_7: BOOLEAN
               do
                       Result := (value=schemav_cvc_elt_7_low_level)
               end

       is_schemav_cvc_enumeration_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_enumeration_valid_low_level)
               end

       is_schemav_cvc_facet_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_facet_valid_low_level)
               end

       is_schemav_cvc_fractiondigits_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_fractiondigits_valid_low_level)
               end

       is_schemav_cvc_idc: BOOLEAN
               do
                       Result := (value=schemav_cvc_idc_low_level)
               end

       is_schemav_cvc_length_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_length_valid_low_level)
               end

       is_schemav_cvc_maxexclusive_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_maxexclusive_valid_low_level)
               end

       is_schemav_cvc_maxinclusive_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_maxinclusive_valid_low_level)
               end

       is_schemav_cvc_maxlength_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_maxlength_valid_low_level)
               end

       is_schemav_cvc_minexclusive_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_minexclusive_valid_low_level)
               end

       is_schemav_cvc_mininclusive_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_mininclusive_valid_low_level)
               end

       is_schemav_cvc_minlength_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_minlength_valid_low_level)
               end

       is_schemav_cvc_pattern_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_pattern_valid_low_level)
               end

       is_schemav_cvc_totaldigits_valid: BOOLEAN
               do
                       Result := (value=schemav_cvc_totaldigits_valid_low_level)
               end

       is_schemav_cvc_type_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_type_1_low_level)
               end

       is_schemav_cvc_type_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_type_2_low_level)
               end

       is_schemav_cvc_type_3_1_1: BOOLEAN
               do
                       Result := (value=schemav_cvc_type_3_1_1_low_level)
               end

       is_schemav_cvc_type_3_1_2: BOOLEAN
               do
                       Result := (value=schemav_cvc_type_3_1_2_low_level)
               end

       is_schemav_cvc_wildcard: BOOLEAN
               do
                       Result := (value=schemav_cvc_wildcard_low_level)
               end

       is_schemav_document_element_missing: BOOLEAN
               do
                       Result := (value=schemav_document_element_missing_low_level)
               end

       is_schemav_elemcont: BOOLEAN
               do
                       Result := (value=schemav_elemcont_low_level)
               end

       is_schemav_element_content: BOOLEAN
               do
                       Result := (value=schemav_element_content_low_level)
               end

       is_schemav_extracontent: BOOLEAN
               do
                       Result := (value=schemav_extracontent_low_level)
               end

       is_schemav_facet: BOOLEAN
               do
                       Result := (value=schemav_facet_low_level)
               end

       is_schemav_havedefault: BOOLEAN
               do
                       Result := (value=schemav_havedefault_low_level)
               end

       is_schemav_internal: BOOLEAN
               do
                       Result := (value=schemav_internal_low_level)
               end

       is_schemav_invalidattr: BOOLEAN
               do
                       Result := (value=schemav_invalidattr_low_level)
               end

       is_schemav_invalidelem: BOOLEAN
               do
                       Result := (value=schemav_invalidelem_low_level)
               end

       is_schemav_isabstract: BOOLEAN
               do
                       Result := (value=schemav_isabstract_low_level)
               end

       is_schemav_misc: BOOLEAN
               do
                       Result := (value=schemav_misc_low_level)
               end

       is_schemav_missing: BOOLEAN
               do
                       Result := (value=schemav_missing_low_level)
               end

       is_schemav_norollback: BOOLEAN
               do
                       Result := (value=schemav_norollback_low_level)
               end

       is_schemav_noroot: BOOLEAN
               do
                       Result := (value=schemav_noroot_low_level)
               end

       is_schemav_notdeterminist: BOOLEAN
               do
                       Result := (value=schemav_notdeterminist_low_level)
               end

       is_schemav_notempty: BOOLEAN
               do
                       Result := (value=schemav_notempty_low_level)
               end

       is_schemav_notnillable: BOOLEAN
               do
                       Result := (value=schemav_notnillable_low_level)
               end

       is_schemav_notsimple: BOOLEAN
               do
                       Result := (value=schemav_notsimple_low_level)
               end

       is_schemav_nottoplevel: BOOLEAN
               do
                       Result := (value=schemav_nottoplevel_low_level)
               end

       is_schemav_notype: BOOLEAN
               do
                       Result := (value=schemav_notype_low_level)
               end

       is_schemav_undeclaredelem: BOOLEAN
               do
                       Result := (value=schemav_undeclaredelem_low_level)
               end

       is_schemav_value: BOOLEAN
               do
                       Result := (value=schemav_value_low_level)
               end

       is_schemav_wrongelem: BOOLEAN
               do
                       Result := (value=schemav_wrongelem_low_level)
               end

       is_tree_invalid_dec: BOOLEAN
               do
                       Result := (value=tree_invalid_dec_low_level)
               end

       is_tree_invalid_hex: BOOLEAN
               do
                       Result := (value=tree_invalid_hex_low_level)
               end

       is_tree_not_utf8: BOOLEAN
               do
                       Result := (value=tree_not_utf8_low_level)
               end

       is_tree_unterminated_entity: BOOLEAN
               do
                       Result := (value=tree_unterminated_entity_low_level)
               end

       is_war_catalog_pi: BOOLEAN
               do
                       Result := (value=war_catalog_pi_low_level)
               end

       is_war_entity_redefined: BOOLEAN
               do
                       Result := (value=war_entity_redefined_low_level)
               end

       is_war_lang_value: BOOLEAN
               do
                       Result := (value=war_lang_value_low_level)
               end

       is_war_ns_column: BOOLEAN
               do
                       Result := (value=war_ns_column_low_level)
               end

       is_war_ns_uri: BOOLEAN
               do
                       Result := (value=war_ns_uri_low_level)
               end

       is_war_ns_uri_relative: BOOLEAN
               do
                       Result := (value=war_ns_uri_relative_low_level)
               end

       is_war_space_value: BOOLEAN
               do
                       Result := (value=war_space_value_low_level)
               end

       is_war_undeclared_entity: BOOLEAN
               do
                       Result := (value=war_undeclared_entity_low_level)
               end

       is_war_unknown_version: BOOLEAN
               do
                       Result := (value=war_unknown_version_low_level)
               end

       is_xinclude_build_failed: BOOLEAN
               do
                       Result := (value=xinclude_build_failed_low_level)
               end

       is_xinclude_deprecated_ns: BOOLEAN
               do
                       Result := (value=xinclude_deprecated_ns_low_level)
               end

       is_xinclude_entity_def_mismatch: BOOLEAN
               do
                       Result := (value=xinclude_entity_def_mismatch_low_level)
               end

       is_xinclude_fallback_not_in_include: BOOLEAN
               do
                       Result := (value=xinclude_fallback_not_in_include_low_level)
               end

       is_xinclude_fallbacks_in_include: BOOLEAN
               do
                       Result := (value=xinclude_fallbacks_in_include_low_level)
               end

       is_xinclude_fragment_id: BOOLEAN
               do
                       Result := (value=xinclude_fragment_id_low_level)
               end

       is_xinclude_href_uri: BOOLEAN
               do
                       Result := (value=xinclude_href_uri_low_level)
               end

       is_xinclude_include_in_include: BOOLEAN
               do
                       Result := (value=xinclude_include_in_include_low_level)
               end

       is_xinclude_invalid_char: BOOLEAN
               do
                       Result := (value=xinclude_invalid_char_low_level)
               end

       is_xinclude_multiple_root: BOOLEAN
               do
                       Result := (value=xinclude_multiple_root_low_level)
               end

       is_xinclude_no_fallback: BOOLEAN
               do
                       Result := (value=xinclude_no_fallback_low_level)
               end

       is_xinclude_no_href: BOOLEAN
               do
                       Result := (value=xinclude_no_href_low_level)
               end

       is_xinclude_parse_value: BOOLEAN
               do
                       Result := (value=xinclude_parse_value_low_level)
               end

       is_xinclude_recursion: BOOLEAN
               do
                       Result := (value=xinclude_recursion_low_level)
               end

       is_xinclude_text_document: BOOLEAN
               do
                       Result := (value=xinclude_text_document_low_level)
               end

       is_xinclude_text_fragment: BOOLEAN
               do
                       Result := (value=xinclude_text_fragment_low_level)
               end

       is_xinclude_unknown_encoding: BOOLEAN
               do
                       Result := (value=xinclude_unknown_encoding_low_level)
               end

       is_xinclude_xptr_failed: BOOLEAN
               do
                       Result := (value=xinclude_xptr_failed_low_level)
               end

       is_xinclude_xptr_result: BOOLEAN
               do
                       Result := (value=xinclude_xptr_result_low_level)
               end

       is_xpath_encoding_error: BOOLEAN
               do
                       Result := (value=xpath_encoding_error_low_level)
               end

       is_xpath_expr_error: BOOLEAN
               do
                       Result := (value=xpath_expr_error_low_level)
               end

       is_xpath_expression_ok: BOOLEAN
               do
                       Result := (value=xpath_expression_ok_low_level)
               end

       is_xpath_invalid_arity: BOOLEAN
               do
                       Result := (value=xpath_invalid_arity_low_level)
               end

       is_xpath_invalid_char_error: BOOLEAN
               do
                       Result := (value=xpath_invalid_char_error_low_level)
               end

       is_xpath_invalid_ctxt_position: BOOLEAN
               do
                       Result := (value=xpath_invalid_ctxt_position_low_level)
               end

       is_xpath_invalid_ctxt_size: BOOLEAN
               do
                       Result := (value=xpath_invalid_ctxt_size_low_level)
               end

       is_xpath_invalid_operand: BOOLEAN
               do
                       Result := (value=xpath_invalid_operand_low_level)
               end

       is_xpath_invalid_predicate_error: BOOLEAN
               do
                       Result := (value=xpath_invalid_predicate_error_low_level)
               end

       is_xpath_invalid_type: BOOLEAN
               do
                       Result := (value=xpath_invalid_type_low_level)
               end

       is_xpath_memory_error: BOOLEAN
               do
                       Result := (value=xpath_memory_error_low_level)
               end

       is_xpath_number_error: BOOLEAN
               do
                       Result := (value=xpath_number_error_low_level)
               end

       is_xpath_start_literal_error: BOOLEAN
               do
                       Result := (value=xpath_start_literal_error_low_level)
               end

       is_xpath_unclosed_error: BOOLEAN
               do
                       Result := (value=xpath_unclosed_error_low_level)
               end

       is_xpath_undef_prefix_error: BOOLEAN
               do
                       Result := (value=xpath_undef_prefix_error_low_level)
               end

       is_xpath_undef_variable_error: BOOLEAN
               do
                       Result := (value=xpath_undef_variable_error_low_level)
               end

       is_xpath_unfinished_literal_error: BOOLEAN
               do
                       Result := (value=xpath_unfinished_literal_error_low_level)
               end

       is_xpath_unknown_func_error: BOOLEAN
               do
                       Result := (value=xpath_unknown_func_error_low_level)
               end

       is_xpath_variable_ref_error: BOOLEAN
               do
                       Result := (value=xpath_variable_ref_error_low_level)
               end

       is_xptr_childseq_start: BOOLEAN
               do
                       Result := (value=xptr_childseq_start_low_level)
               end

       is_xptr_eval_failed: BOOLEAN
               do
                       Result := (value=xptr_eval_failed_low_level)
               end

       is_xptr_extra_objects: BOOLEAN
               do
                       Result := (value=xptr_extra_objects_low_level)
               end

       is_xptr_resource_error: BOOLEAN
               do
                       Result := (value=xptr_resource_error_low_level)
               end

       is_xptr_sub_resource_error: BOOLEAN
               do
                       Result := (value=xptr_sub_resource_error_low_level)
               end

       is_xptr_syntax_error: BOOLEAN
               do
                       Result := (value=xptr_syntax_error_low_level)
               end

       is_xptr_unknown_scheme: BOOLEAN
               do
                       Result := (value=xptr_unknown_scheme_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     buf_overflow_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_BUF_OVERFLOW"
                       }"
               end

     c14n_create_ctxt_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_C14N_CREATE_CTXT"
                       }"
               end

     c14n_create_stack_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_C14N_CREATE_STACK"
                       }"
               end

     c14n_invalid_node_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_C14N_INVALID_NODE"
                       }"
               end

     c14n_relative_namespace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_C14N_RELATIVE_NAMESPACE"
                       }"
               end

     c14n_requires_utf8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_C14N_REQUIRES_UTF8"
                       }"
               end

     c14n_unknow_node_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_C14N_UNKNOW_NODE"
                       }"
               end

     catalog_entry_broken_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CATALOG_ENTRY_BROKEN"
                       }"
               end

     catalog_missing_attr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CATALOG_MISSING_ATTR"
                       }"
               end

     catalog_not_catalog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CATALOG_NOT_CATALOG"
                       }"
               end

     catalog_prefer_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CATALOG_PREFER_VALUE"
                       }"
               end

     catalog_recursion_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CATALOG_RECURSION"
                       }"
               end

     check_entity_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_ENTITY_TYPE"
                       }"
               end

     check_found_attribute_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_ATTRIBUTE"
                       }"
               end

     check_found_cdata_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_CDATA"
                       }"
               end

     check_found_comment_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_COMMENT"
                       }"
               end

     check_found_doctype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_DOCTYPE"
                       }"
               end

     check_found_element_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_ELEMENT"
                       }"
               end

     check_found_entity_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_ENTITY"
                       }"
               end

     check_found_entityref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_ENTITYREF"
                       }"
               end

     check_found_fragment_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_FRAGMENT"
                       }"
               end

     check_found_notation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_NOTATION"
                       }"
               end

     check_found_pi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_PI"
                       }"
               end

     check_found_text_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_FOUND_TEXT"
                       }"
               end

     check_name_not_null_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NAME_NOT_NULL"
                       }"
               end

     check_no_dict_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NO_DICT"
                       }"
               end

     check_no_doc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NO_DOC"
                       }"
               end

     check_no_elem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NO_ELEM"
                       }"
               end

     check_no_href_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NO_HREF"
                       }"
               end

     check_no_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NO_NAME"
                       }"
               end

     check_no_next_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NO_NEXT"
                       }"
               end

     check_no_parent_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NO_PARENT"
                       }"
               end

     check_no_prev_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NO_PREV"
                       }"
               end

     check_not_attr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NOT_ATTR"
                       }"
               end

     check_not_attr_decl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NOT_ATTR_DECL"
                       }"
               end

     check_not_dtd_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NOT_DTD"
                       }"
               end

     check_not_elem_decl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NOT_ELEM_DECL"
                       }"
               end

     check_not_entity_decl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NOT_ENTITY_DECL"
                       }"
               end

     check_not_ncname_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NOT_NCNAME"
                       }"
               end

     check_not_ns_decl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NOT_NS_DECL"
                       }"
               end

     check_not_utf8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NOT_UTF8"
                       }"
               end

     check_ns_ancestor_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NS_ANCESTOR"
                       }"
               end

     check_ns_scope_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_NS_SCOPE"
                       }"
               end

     check_outside_dict_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_OUTSIDE_DICT"
                       }"
               end

     check_unknown_node_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_UNKNOWN_NODE"
                       }"
               end

     check_wrong_doc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_WRONG_DOC"
                       }"
               end

     check_wrong_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_WRONG_NAME"
                       }"
               end

     check_wrong_next_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_WRONG_NEXT"
                       }"
               end

     check_wrong_parent_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_WRONG_PARENT"
                       }"
               end

     check_wrong_prev_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_CHECK_WRONG_PREV"
                       }"
               end

     dtd_attribute_default_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ATTRIBUTE_DEFAULT"
                       }"
               end

     dtd_attribute_redefined_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ATTRIBUTE_REDEFINED"
                       }"
               end

     dtd_attribute_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ATTRIBUTE_VALUE"
                       }"
               end

     dtd_content_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_CONTENT_ERROR"
                       }"
               end

     dtd_content_model_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_CONTENT_MODEL"
                       }"
               end

     dtd_content_not_determinist_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_CONTENT_NOT_DETERMINIST"
                       }"
               end

     dtd_different_prefix_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_DIFFERENT_PREFIX"
                       }"
               end

     dtd_dup_token_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_DUP_TOKEN"
                       }"
               end

     dtd_elem_default_namespace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ELEM_DEFAULT_NAMESPACE"
                       }"
               end

     dtd_elem_namespace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ELEM_NAMESPACE"
                       }"
               end

     dtd_elem_redefined_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ELEM_REDEFINED"
                       }"
               end

     dtd_empty_notation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_EMPTY_NOTATION"
                       }"
               end

     dtd_entity_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ENTITY_TYPE"
                       }"
               end

     dtd_id_fixed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ID_FIXED"
                       }"
               end

     dtd_id_redefined_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ID_REDEFINED"
                       }"
               end

     dtd_id_subset_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ID_SUBSET"
                       }"
               end

     dtd_invalid_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_INVALID_CHILD"
                       }"
               end

     dtd_invalid_default_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_INVALID_DEFAULT"
                       }"
               end

     dtd_load_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_LOAD_ERROR"
                       }"
               end

     dtd_missing_attribute_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_MISSING_ATTRIBUTE"
                       }"
               end

     dtd_mixed_corrupt_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_MIXED_CORRUPT"
                       }"
               end

     dtd_multiple_id_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_MULTIPLE_ID"
                       }"
               end

     dtd_no_doc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_NO_DOC"
                       }"
               end

     dtd_no_dtd_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_NO_DTD"
                       }"
               end

     dtd_no_elem_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_NO_ELEM_NAME"
                       }"
               end

     dtd_no_prefix_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_NO_PREFIX"
                       }"
               end

     dtd_no_root_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_NO_ROOT"
                       }"
               end

     dtd_not_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_NOT_EMPTY"
                       }"
               end

     dtd_not_pcdata_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_NOT_PCDATA"
                       }"
               end

     dtd_not_standalone_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_NOT_STANDALONE"
                       }"
               end

     dtd_notation_redefined_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_NOTATION_REDEFINED"
                       }"
               end

     dtd_notation_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_NOTATION_VALUE"
                       }"
               end

     dtd_root_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_ROOT_NAME"
                       }"
               end

     dtd_standalone_defaulted_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_STANDALONE_DEFAULTED"
                       }"
               end

     dtd_standalone_white_space_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_STANDALONE_WHITE_SPACE"
                       }"
               end

     dtd_unknown_attribute_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_UNKNOWN_ATTRIBUTE"
                       }"
               end

     dtd_unknown_elem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_UNKNOWN_ELEM"
                       }"
               end

     dtd_unknown_entity_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_UNKNOWN_ENTITY"
                       }"
               end

     dtd_unknown_id_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_UNKNOWN_ID"
                       }"
               end

     dtd_unknown_notation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_UNKNOWN_NOTATION"
                       }"
               end

     dtd_xmlid_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_XMLID_TYPE"
                       }"
               end

     dtd_xmlid_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_DTD_XMLID_VALUE"
                       }"
               end

     err_attlist_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ATTLIST_NOT_FINISHED"
                       }"
               end

     err_attlist_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ATTLIST_NOT_STARTED"
                       }"
               end

     err_attribute_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ATTRIBUTE_NOT_FINISHED"
                       }"
               end

     err_attribute_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ATTRIBUTE_NOT_STARTED"
                       }"
               end

     err_attribute_redefined_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ATTRIBUTE_REDEFINED"
                       }"
               end

     err_attribute_without_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ATTRIBUTE_WITHOUT_VALUE"
                       }"
               end

     err_cdata_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_CDATA_NOT_FINISHED"
                       }"
               end

     err_charref_at_eof_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_CHARREF_AT_EOF"
                       }"
               end

     err_charref_in_dtd_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_CHARREF_IN_DTD"
                       }"
               end

     err_charref_in_epilog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_CHARREF_IN_EPILOG"
                       }"
               end

     err_charref_in_prolog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_CHARREF_IN_PROLOG"
                       }"
               end

     err_comment_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_COMMENT_NOT_FINISHED"
                       }"
               end

     err_condsec_invalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_CONDSEC_INVALID"
                       }"
               end

     err_condsec_invalid_keyword_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_CONDSEC_INVALID_KEYWORD"
                       }"
               end

     err_condsec_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_CONDSEC_NOT_FINISHED"
                       }"
               end

     err_condsec_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_CONDSEC_NOT_STARTED"
                       }"
               end

     err_doctype_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_DOCTYPE_NOT_FINISHED"
                       }"
               end

     err_document_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_DOCUMENT_EMPTY"
                       }"
               end

     err_document_end_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_DOCUMENT_END"
                       }"
               end

     err_document_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_DOCUMENT_START"
                       }"
               end

     err_elemcontent_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ELEMCONTENT_NOT_FINISHED"
                       }"
               end

     err_elemcontent_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ELEMCONTENT_NOT_STARTED"
                       }"
               end

     err_encoding_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENCODING_NAME"
                       }"
               end

     err_entity_boundary_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITY_BOUNDARY"
                       }"
               end

     err_entity_char_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITY_CHAR_ERROR"
                       }"
               end

     err_entity_is_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITY_IS_EXTERNAL"
                       }"
               end

     err_entity_is_parameter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITY_IS_PARAMETER"
                       }"
               end

     err_entity_loop_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITY_LOOP"
                       }"
               end

     err_entity_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITY_NOT_FINISHED"
                       }"
               end

     err_entity_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITY_NOT_STARTED"
                       }"
               end

     err_entity_pe_internal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITY_PE_INTERNAL"
                       }"
               end

     err_entity_processing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITY_PROCESSING"
                       }"
               end

     err_entityref_at_eof_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITYREF_AT_EOF"
                       }"
               end

     err_entityref_in_dtd_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITYREF_IN_DTD"
                       }"
               end

     err_entityref_in_epilog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITYREF_IN_EPILOG"
                       }"
               end

     err_entityref_in_prolog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITYREF_IN_PROLOG"
                       }"
               end

     err_entityref_no_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITYREF_NO_NAME"
                       }"
               end

     err_entityref_semicol_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_ENTITYREF_SEMICOL_MISSING"
                       }"
               end

     err_equal_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_EQUAL_REQUIRED"
                       }"
               end

     err_ext_entity_standalone_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_EXT_ENTITY_STANDALONE"
                       }"
               end

     err_ext_subset_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_EXT_SUBSET_NOT_FINISHED"
                       }"
               end

     err_extra_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_EXTRA_CONTENT"
                       }"
               end

     err_gt_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_GT_REQUIRED"
                       }"
               end

     err_hyphen_in_comment_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_HYPHEN_IN_COMMENT"
                       }"
               end

     err_internal_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_INTERNAL_ERROR"
                       }"
               end

     err_invalid_char_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_INVALID_CHAR"
                       }"
               end

     err_invalid_charref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_INVALID_CHARREF"
                       }"
               end

     err_invalid_dec_charref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_INVALID_DEC_CHARREF"
                       }"
               end

     err_invalid_encoding_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_INVALID_ENCODING"
                       }"
               end

     err_invalid_hex_charref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_INVALID_HEX_CHARREF"
                       }"
               end

     err_invalid_uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_INVALID_URI"
                       }"
               end

     err_literal_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_LITERAL_NOT_FINISHED"
                       }"
               end

     err_literal_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_LITERAL_NOT_STARTED"
                       }"
               end

     err_lt_in_attribute_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_LT_IN_ATTRIBUTE"
                       }"
               end

     err_lt_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_LT_REQUIRED"
                       }"
               end

     err_ltslash_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_LTSLASH_REQUIRED"
                       }"
               end

     err_misplaced_cdata_end_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_MISPLACED_CDATA_END"
                       }"
               end

     err_missing_encoding_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_MISSING_ENCODING"
                       }"
               end

     err_mixed_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_MIXED_NOT_FINISHED"
                       }"
               end

     err_mixed_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_MIXED_NOT_STARTED"
                       }"
               end

     err_name_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NAME_REQUIRED"
                       }"
               end

     err_name_too_long_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NAME_TOO_LONG"
                       }"
               end

     err_nmtoken_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NMTOKEN_REQUIRED"
                       }"
               end

     err_no_dtd_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NO_DTD"
                       }"
               end

     err_no_memory_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NO_MEMORY"
                       }"
               end

     err_not_standalone_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NOT_STANDALONE"
                       }"
               end

     err_not_well_balanced_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NOT_WELL_BALANCED"
                       }"
               end

     err_notation_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NOTATION_NOT_FINISHED"
                       }"
               end

     err_notation_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NOTATION_NOT_STARTED"
                       }"
               end

     err_notation_processing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NOTATION_PROCESSING"
                       }"
               end

     err_ns_decl_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_NS_DECL_ERROR"
                       }"
               end

     err_ok_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_OK"
                       }"
               end

     err_pcdata_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_PCDATA_REQUIRED"
                       }"
               end

     err_peref_at_eof_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_PEREF_AT_EOF"
                       }"
               end

     err_peref_in_epilog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_PEREF_IN_EPILOG"
                       }"
               end

     err_peref_in_int_subset_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_PEREF_IN_INT_SUBSET"
                       }"
               end

     err_peref_in_prolog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_PEREF_IN_PROLOG"
                       }"
               end

     err_peref_no_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_PEREF_NO_NAME"
                       }"
               end

     err_peref_semicol_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_PEREF_SEMICOL_MISSING"
                       }"
               end

     err_pi_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_PI_NOT_FINISHED"
                       }"
               end

     err_pi_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_PI_NOT_STARTED"
                       }"
               end

     err_pubid_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_PUBID_REQUIRED"
                       }"
               end

     err_reserved_xml_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_RESERVED_XML_NAME"
                       }"
               end

     err_separator_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_SEPARATOR_REQUIRED"
                       }"
               end

     err_space_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_SPACE_REQUIRED"
                       }"
               end

     err_standalone_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_STANDALONE_VALUE"
                       }"
               end

     err_string_not_closed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_STRING_NOT_CLOSED"
                       }"
               end

     err_string_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_STRING_NOT_STARTED"
                       }"
               end

     err_tag_name_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_TAG_NAME_MISMATCH"
                       }"
               end

     err_tag_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_TAG_NOT_FINISHED"
                       }"
               end

     err_undeclared_entity_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_UNDECLARED_ENTITY"
                       }"
               end

     err_unknown_encoding_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_UNKNOWN_ENCODING"
                       }"
               end

     err_unknown_version_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_UNKNOWN_VERSION"
                       }"
               end

     err_unparsed_entity_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_UNPARSED_ENTITY"
                       }"
               end

     err_unsupported_encoding_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_UNSUPPORTED_ENCODING"
                       }"
               end

     err_uri_fragment_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_URI_FRAGMENT"
                       }"
               end

     err_uri_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_URI_REQUIRED"
                       }"
               end

     err_user_stop_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_USER_STOP"
                       }"
               end

     err_value_required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_VALUE_REQUIRED"
                       }"
               end

     err_version_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_VERSION_MISMATCH"
                       }"
               end

     err_version_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_VERSION_MISSING"
                       }"
               end

     err_xmldecl_not_finished_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_XMLDECL_NOT_FINISHED"
                       }"
               end

     err_xmldecl_not_started_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ERR_XMLDECL_NOT_STARTED"
                       }"
               end

     ftp_accnt_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FTP_ACCNT"
                       }"
               end

     ftp_epsv_answer_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FTP_EPSV_ANSWER"
                       }"
               end

     ftp_pasv_answer_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FTP_PASV_ANSWER"
                       }"
               end

     ftp_url_syntax_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FTP_URL_SYNTAX"
                       }"
               end

     html_strucure_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_HTML_STRUCURE_ERROR"
                       }"
               end

     html_unknown_tag_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_HTML_UNKNOWN_TAG"
                       }"
               end

     http_unknown_host_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_HTTP_UNKNOWN_HOST"
                       }"
               end

     http_url_syntax_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_HTTP_URL_SYNTAX"
                       }"
               end

     http_use_ip_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_HTTP_USE_IP"
                       }"
               end

     i18n_conv_failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_I18N_CONV_FAILED"
                       }"
               end

     i18n_excess_handler_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_I18N_EXCESS_HANDLER"
                       }"
               end

     i18n_no_handler_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_I18N_NO_HANDLER"
                       }"
               end

     i18n_no_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_I18N_NO_NAME"
                       }"
               end

     i18n_no_output_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_I18N_NO_OUTPUT"
                       }"
               end

     io_buffer_full_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_BUFFER_FULL"
                       }"
               end

     io_eacces_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EACCES"
                       }"
               end

     io_eaddrinuse_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EADDRINUSE"
                       }"
               end

     io_eafnosupport_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EAFNOSUPPORT"
                       }"
               end

     io_eagain_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EAGAIN"
                       }"
               end

     io_ealready_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EALREADY"
                       }"
               end

     io_ebadf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EBADF"
                       }"
               end

     io_ebadmsg_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EBADMSG"
                       }"
               end

     io_ebusy_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EBUSY"
                       }"
               end

     io_ecanceled_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ECANCELED"
                       }"
               end

     io_echild_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ECHILD"
                       }"
               end

     io_econnrefused_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ECONNREFUSED"
                       }"
               end

     io_edeadlk_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EDEADLK"
                       }"
               end

     io_edom_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EDOM"
                       }"
               end

     io_eexist_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EEXIST"
                       }"
               end

     io_efault_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EFAULT"
                       }"
               end

     io_efbig_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EFBIG"
                       }"
               end

     io_einprogress_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EINPROGRESS"
                       }"
               end

     io_eintr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EINTR"
                       }"
               end

     io_einval_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EINVAL"
                       }"
               end

     io_eio_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EIO"
                       }"
               end

     io_eisconn_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EISCONN"
                       }"
               end

     io_eisdir_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EISDIR"
                       }"
               end

     io_emfile_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EMFILE"
                       }"
               end

     io_emlink_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EMLINK"
                       }"
               end

     io_emsgsize_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EMSGSIZE"
                       }"
               end

     io_enametoolong_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENAMETOOLONG"
                       }"
               end

     io_encoder_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENCODER"
                       }"
               end

     io_enetunreach_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENETUNREACH"
                       }"
               end

     io_enfile_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENFILE"
                       }"
               end

     io_enodev_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENODEV"
                       }"
               end

     io_enoent_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOENT"
                       }"
               end

     io_enoexec_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOEXEC"
                       }"
               end

     io_enolck_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOLCK"
                       }"
               end

     io_enomem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOMEM"
                       }"
               end

     io_enospc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOSPC"
                       }"
               end

     io_enosys_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOSYS"
                       }"
               end

     io_enotdir_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOTDIR"
                       }"
               end

     io_enotempty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOTEMPTY"
                       }"
               end

     io_enotsock_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOTSOCK"
                       }"
               end

     io_enotsup_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOTSUP"
                       }"
               end

     io_enotty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENOTTY"
                       }"
               end

     io_enxio_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ENXIO"
                       }"
               end

     io_eperm_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EPERM"
                       }"
               end

     io_epipe_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EPIPE"
                       }"
               end

     io_erange_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ERANGE"
                       }"
               end

     io_erofs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EROFS"
                       }"
               end

     io_espipe_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ESPIPE"
                       }"
               end

     io_esrch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ESRCH"
                       }"
               end

     io_etimedout_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_ETIMEDOUT"
                       }"
               end

     io_exdev_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_EXDEV"
                       }"
               end

     io_flush_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_FLUSH"
                       }"
               end

     io_load_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_LOAD_ERROR"
                       }"
               end

     io_network_attempt_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_NETWORK_ATTEMPT"
                       }"
               end

     io_no_input_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_NO_INPUT"
                       }"
               end

     io_unknown_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_UNKNOWN"
                       }"
               end

     io_write_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_IO_WRITE"
                       }"
               end

     module_close_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_MODULE_CLOSE"
                       }"
               end

     module_open_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_MODULE_OPEN"
                       }"
               end

     ns_err_attribute_redefined_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_NS_ERR_ATTRIBUTE_REDEFINED"
                       }"
               end

     ns_err_colon_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_NS_ERR_COLON"
                       }"
               end

     ns_err_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_NS_ERR_EMPTY"
                       }"
               end

     ns_err_qname_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_NS_ERR_QNAME"
                       }"
               end

     ns_err_undefined_namespace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_NS_ERR_UNDEFINED_NAMESPACE"
                       }"
               end

     ns_err_xml_namespace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_NS_ERR_XML_NAMESPACE"
                       }"
               end

     regexp_compile_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_REGEXP_COMPILE_ERROR"
                       }"
               end

     rngp_anyname_attr_ancestor_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ANYNAME_ATTR_ANCESTOR"
                       }"
               end

     rngp_attr_conflict_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ATTR_CONFLICT"
                       }"
               end

     rngp_attribute_children_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ATTRIBUTE_CHILDREN"
                       }"
               end

     rngp_attribute_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ATTRIBUTE_CONTENT"
                       }"
               end

     rngp_attribute_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ATTRIBUTE_EMPTY"
                       }"
               end

     rngp_attribute_noop_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ATTRIBUTE_NOOP"
                       }"
               end

     rngp_choice_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_CHOICE_CONTENT"
                       }"
               end

     rngp_choice_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_CHOICE_EMPTY"
                       }"
               end

     rngp_create_failure_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_CREATE_FAILURE"
                       }"
               end

     rngp_data_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_DATA_CONTENT"
                       }"
               end

     rngp_def_choice_and_interleave_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_DEF_CHOICE_AND_INTERLEAVE"
                       }"
               end

     rngp_define_create_failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_DEFINE_CREATE_FAILED"
                       }"
               end

     rngp_define_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_DEFINE_EMPTY"
                       }"
               end

     rngp_define_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_DEFINE_MISSING"
                       }"
               end

     rngp_define_name_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_DEFINE_NAME_MISSING"
                       }"
               end

     rngp_elem_content_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ELEM_CONTENT_EMPTY"
                       }"
               end

     rngp_elem_content_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ELEM_CONTENT_ERROR"
                       }"
               end

     rngp_elem_text_conflict_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ELEM_TEXT_CONFLICT"
                       }"
               end

     rngp_element_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ELEMENT_CONTENT"
                       }"
               end

     rngp_element_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ELEMENT_EMPTY"
                       }"
               end

     rngp_element_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ELEMENT_NAME"
                       }"
               end

     rngp_element_no_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ELEMENT_NO_CONTENT"
                       }"
               end

     rngp_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EMPTY"
                       }"
               end

     rngp_empty_construct_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EMPTY_CONSTRUCT"
                       }"
               end

     rngp_empty_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EMPTY_CONTENT"
                       }"
               end

     rngp_empty_not_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EMPTY_NOT_EMPTY"
                       }"
               end

     rngp_error_type_lib_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_ERROR_TYPE_LIB"
                       }"
               end

     rngp_except_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EXCEPT_EMPTY"
                       }"
               end

     rngp_except_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EXCEPT_MISSING"
                       }"
               end

     rngp_except_multiple_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EXCEPT_MULTIPLE"
                       }"
               end

     rngp_except_no_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EXCEPT_NO_CONTENT"
                       }"
               end

     rngp_external_ref_failure_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EXTERNAL_REF_FAILURE"
                       }"
               end

     rngp_externalref_emtpy_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EXTERNALREF_EMTPY"
                       }"
               end

     rngp_externalref_recurse_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_EXTERNALREF_RECURSE"
                       }"
               end

     rngp_forbidden_attribute_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_FORBIDDEN_ATTRIBUTE"
                       }"
               end

     rngp_foreign_element_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_FOREIGN_ELEMENT"
                       }"
               end

     rngp_grammar_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_GRAMMAR_CONTENT"
                       }"
               end

     rngp_grammar_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_GRAMMAR_EMPTY"
                       }"
               end

     rngp_grammar_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_GRAMMAR_MISSING"
                       }"
               end

     rngp_grammar_no_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_GRAMMAR_NO_START"
                       }"
               end

     rngp_group_attr_conflict_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_GROUP_ATTR_CONFLICT"
                       }"
               end

     rngp_href_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_HREF_ERROR"
                       }"
               end

     rngp_include_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_INCLUDE_EMPTY"
                       }"
               end

     rngp_include_failure_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_INCLUDE_FAILURE"
                       }"
               end

     rngp_include_recurse_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_INCLUDE_RECURSE"
                       }"
               end

     rngp_interleave_add_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_INTERLEAVE_ADD"
                       }"
               end

     rngp_interleave_create_failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_INTERLEAVE_CREATE_FAILED"
                       }"
               end

     rngp_interleave_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_INTERLEAVE_EMPTY"
                       }"
               end

     rngp_interleave_no_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_INTERLEAVE_NO_CONTENT"
                       }"
               end

     rngp_invalid_define_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_INVALID_DEFINE_NAME"
                       }"
               end

     rngp_invalid_uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_INVALID_URI"
                       }"
               end

     rngp_invalid_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_INVALID_VALUE"
                       }"
               end

     rngp_missing_href_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_MISSING_HREF"
                       }"
               end

     rngp_name_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_NAME_MISSING"
                       }"
               end

     rngp_need_combine_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_NEED_COMBINE"
                       }"
               end

     rngp_notallowed_not_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_NOTALLOWED_NOT_EMPTY"
                       }"
               end

     rngp_nsname_attr_ancestor_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_NSNAME_ATTR_ANCESTOR"
                       }"
               end

     rngp_nsname_no_ns_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_NSNAME_NO_NS"
                       }"
               end

     rngp_param_forbidden_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PARAM_FORBIDDEN"
                       }"
               end

     rngp_param_name_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PARAM_NAME_MISSING"
                       }"
               end

     rngp_parentref_create_failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PARENTREF_CREATE_FAILED"
                       }"
               end

     rngp_parentref_name_invalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PARENTREF_NAME_INVALID"
                       }"
               end

     rngp_parentref_no_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PARENTREF_NO_NAME"
                       }"
               end

     rngp_parentref_no_parent_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PARENTREF_NO_PARENT"
                       }"
               end

     rngp_parentref_not_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PARENTREF_NOT_EMPTY"
                       }"
               end

     rngp_parse_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PARSE_ERROR"
                       }"
               end

     rngp_pat_anyname_except_anyname_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_ANYNAME_EXCEPT_ANYNAME"
                       }"
               end

     rngp_pat_attr_attr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_ATTR_ATTR"
                       }"
               end

     rngp_pat_attr_elem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_ATTR_ELEM"
                       }"
               end

     rngp_pat_data_except_attr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_DATA_EXCEPT_ATTR"
                       }"
               end

     rngp_pat_data_except_elem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_DATA_EXCEPT_ELEM"
                       }"
               end

     rngp_pat_data_except_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_DATA_EXCEPT_EMPTY"
                       }"
               end

     rngp_pat_data_except_group_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_DATA_EXCEPT_GROUP"
                       }"
               end

     rngp_pat_data_except_interleave_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_DATA_EXCEPT_INTERLEAVE"
                       }"
               end

     rngp_pat_data_except_list_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_DATA_EXCEPT_LIST"
                       }"
               end

     rngp_pat_data_except_onemore_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_DATA_EXCEPT_ONEMORE"
                       }"
               end

     rngp_pat_data_except_ref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_DATA_EXCEPT_REF"
                       }"
               end

     rngp_pat_data_except_text_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_DATA_EXCEPT_TEXT"
                       }"
               end

     rngp_pat_list_attr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_LIST_ATTR"
                       }"
               end

     rngp_pat_list_elem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_LIST_ELEM"
                       }"
               end

     rngp_pat_list_interleave_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_LIST_INTERLEAVE"
                       }"
               end

     rngp_pat_list_list_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_LIST_LIST"
                       }"
               end

     rngp_pat_list_ref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_LIST_REF"
                       }"
               end

     rngp_pat_list_text_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_LIST_TEXT"
                       }"
               end

     rngp_pat_nsname_except_anyname_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_NSNAME_EXCEPT_ANYNAME"
                       }"
               end

     rngp_pat_nsname_except_nsname_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_NSNAME_EXCEPT_NSNAME"
                       }"
               end

     rngp_pat_onemore_group_attr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_ONEMORE_GROUP_ATTR"
                       }"
               end

     rngp_pat_onemore_interleave_attr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_ONEMORE_INTERLEAVE_ATTR"
                       }"
               end

     rngp_pat_start_attr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_START_ATTR"
                       }"
               end

     rngp_pat_start_data_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_START_DATA"
                       }"
               end

     rngp_pat_start_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_START_EMPTY"
                       }"
               end

     rngp_pat_start_group_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_START_GROUP"
                       }"
               end

     rngp_pat_start_interleave_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_START_INTERLEAVE"
                       }"
               end

     rngp_pat_start_list_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_START_LIST"
                       }"
               end

     rngp_pat_start_onemore_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_START_ONEMORE"
                       }"
               end

     rngp_pat_start_text_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_START_TEXT"
                       }"
               end

     rngp_pat_start_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PAT_START_VALUE"
                       }"
               end

     rngp_prefix_undefined_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_PREFIX_UNDEFINED"
                       }"
               end

     rngp_ref_create_failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_REF_CREATE_FAILED"
                       }"
               end

     rngp_ref_cycle_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_REF_CYCLE"
                       }"
               end

     rngp_ref_name_invalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_REF_NAME_INVALID"
                       }"
               end

     rngp_ref_no_def_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_REF_NO_DEF"
                       }"
               end

     rngp_ref_no_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_REF_NO_NAME"
                       }"
               end

     rngp_ref_not_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_REF_NOT_EMPTY"
                       }"
               end

     rngp_start_choice_and_interleave_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_START_CHOICE_AND_INTERLEAVE"
                       }"
               end

     rngp_start_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_START_CONTENT"
                       }"
               end

     rngp_start_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_START_EMPTY"
                       }"
               end

     rngp_start_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_START_MISSING"
                       }"
               end

     rngp_text_expected_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_TEXT_EXPECTED"
                       }"
               end

     rngp_text_has_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_TEXT_HAS_CHILD"
                       }"
               end

     rngp_type_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_TYPE_MISSING"
                       }"
               end

     rngp_type_not_found_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_TYPE_NOT_FOUND"
                       }"
               end

     rngp_type_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_TYPE_VALUE"
                       }"
               end

     rngp_unknown_attribute_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_UNKNOWN_ATTRIBUTE"
                       }"
               end

     rngp_unknown_combine_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_UNKNOWN_COMBINE"
                       }"
               end

     rngp_unknown_construct_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_UNKNOWN_CONSTRUCT"
                       }"
               end

     rngp_unknown_type_lib_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_UNKNOWN_TYPE_LIB"
                       }"
               end

     rngp_uri_fragment_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_URI_FRAGMENT"
                       }"
               end

     rngp_uri_not_absolute_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_URI_NOT_ABSOLUTE"
                       }"
               end

     rngp_value_empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_VALUE_EMPTY"
                       }"
               end

     rngp_value_no_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_VALUE_NO_CONTENT"
                       }"
               end

     rngp_xml_ns_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_XML_NS"
                       }"
               end

     rngp_xmlns_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_RNGP_XMLNS_NAME"
                       }"
               end

     save_char_invalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SAVE_CHAR_INVALID"
                       }"
               end

     save_no_doctype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SAVE_NO_DOCTYPE"
                       }"
               end

     save_not_utf8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SAVE_NOT_UTF8"
                       }"
               end

     save_unknown_encoding_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SAVE_UNKNOWN_ENCODING"
                       }"
               end

     schemap_a_props_correct_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_A_PROPS_CORRECT_2"
                       }"
               end

     schemap_a_props_correct_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_A_PROPS_CORRECT_3"
                       }"
               end

     schemap_ag_props_correct_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_AG_PROPS_CORRECT"
                       }"
               end

     schemap_attr_noname_noref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_ATTR_NONAME_NOREF"
                       }"
               end

     schemap_attrformdefault_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_ATTRFORMDEFAULT_VALUE"
                       }"
               end

     schemap_attrgrp_noname_noref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_ATTRGRP_NONAME_NOREF"
                       }"
               end

     schemap_au_props_correct_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_AU_PROPS_CORRECT"
                       }"
               end

     schemap_au_props_correct_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_AU_PROPS_CORRECT_2"
                       }"
               end

     schemap_c_props_correct_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_C_PROPS_CORRECT"
                       }"
               end

     schemap_complextype_noname_noref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COMPLEXTYPE_NONAME_NOREF"
                       }"
               end

     schemap_cos_all_limited_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ALL_LIMITED"
                       }"
               end

     schemap_cos_ct_extends_1_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_CT_EXTENDS_1_1"
                       }"
               end

     schemap_cos_ct_extends_1_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_CT_EXTENDS_1_2"
                       }"
               end

     schemap_cos_ct_extends_1_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_CT_EXTENDS_1_3"
                       }"
               end

     schemap_cos_st_derived_ok_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_DERIVED_OK_2_1"
                       }"
               end

     schemap_cos_st_derived_ok_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_DERIVED_OK_2_2"
                       }"
               end

     schemap_cos_st_restricts_1_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_1_1"
                       }"
               end

     schemap_cos_st_restricts_1_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_1_2"
                       }"
               end

     schemap_cos_st_restricts_1_3_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_1_3_1"
                       }"
               end

     schemap_cos_st_restricts_1_3_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_1_3_2"
                       }"
               end

     schemap_cos_st_restricts_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_1"
                       }"
               end

     schemap_cos_st_restricts_2_3_1_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_1"
                       }"
               end

     schemap_cos_st_restricts_2_3_1_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_2"
                       }"
               end

     schemap_cos_st_restricts_2_3_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_1"
                       }"
               end

     schemap_cos_st_restricts_2_3_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_2"
                       }"
               end

     schemap_cos_st_restricts_2_3_2_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_3"
                       }"
               end

     schemap_cos_st_restricts_2_3_2_4_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_4"
                       }"
               end

     schemap_cos_st_restricts_2_3_2_5_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_5"
                       }"
               end

     schemap_cos_st_restricts_3_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_1"
                       }"
               end

     schemap_cos_st_restricts_3_3_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1"
                       }"
               end

     schemap_cos_st_restricts_3_3_1_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1_2"
                       }"
               end

     schemap_cos_st_restricts_3_3_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_1"
                       }"
               end

     schemap_cos_st_restricts_3_3_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_2"
                       }"
               end

     schemap_cos_st_restricts_3_3_2_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_3"
                       }"
               end

     schemap_cos_st_restricts_3_3_2_4_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_4"
                       }"
               end

     schemap_cos_st_restricts_3_3_2_5_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_5"
                       }"
               end

     schemap_cos_valid_default_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_VALID_DEFAULT_1"
                       }"
               end

     schemap_cos_valid_default_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_VALID_DEFAULT_2_1"
                       }"
               end

     schemap_cos_valid_default_2_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_VALID_DEFAULT_2_2_1"
                       }"
               end

     schemap_cos_valid_default_2_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_COS_VALID_DEFAULT_2_2_2"
                       }"
               end

     schemap_ct_props_correct_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_CT_PROPS_CORRECT_1"
                       }"
               end

     schemap_ct_props_correct_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_CT_PROPS_CORRECT_2"
                       }"
               end

     schemap_ct_props_correct_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_CT_PROPS_CORRECT_3"
                       }"
               end

     schemap_ct_props_correct_4_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_CT_PROPS_CORRECT_4"
                       }"
               end

     schemap_ct_props_correct_5_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_CT_PROPS_CORRECT_5"
                       }"
               end

     schemap_cvc_simple_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_CVC_SIMPLE_TYPE"
                       }"
               end

     schemap_def_and_prefix_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_DEF_AND_PREFIX"
                       }"
               end

     schemap_derivation_ok_restriction_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_1"
                       }"
               end

     schemap_derivation_ok_restriction_2_1_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_1"
                       }"
               end

     schemap_derivation_ok_restriction_2_1_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_2"
                       }"
               end

     schemap_derivation_ok_restriction_2_1_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_3"
                       }"
               end

     schemap_derivation_ok_restriction_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_2"
                       }"
               end

     schemap_derivation_ok_restriction_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_3"
                       }"
               end

     schemap_derivation_ok_restriction_4_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_1"
                       }"
               end

     schemap_derivation_ok_restriction_4_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_2"
                       }"
               end

     schemap_derivation_ok_restriction_4_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_3"
                       }"
               end

     schemap_e_props_correct_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_E_PROPS_CORRECT_2"
                       }"
               end

     schemap_e_props_correct_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_E_PROPS_CORRECT_3"
                       }"
               end

     schemap_e_props_correct_4_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_E_PROPS_CORRECT_4"
                       }"
               end

     schemap_e_props_correct_5_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_E_PROPS_CORRECT_5"
                       }"
               end

     schemap_e_props_correct_6_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_E_PROPS_CORRECT_6"
                       }"
               end

     schemap_elem_default_fixed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_ELEM_DEFAULT_FIXED"
                       }"
               end

     schemap_elem_noname_noref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_ELEM_NONAME_NOREF"
                       }"
               end

     schemap_elemformdefault_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_ELEMFORMDEFAULT_VALUE"
                       }"
               end

     schemap_extension_no_base_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_EXTENSION_NO_BASE"
                       }"
               end

     schemap_facet_no_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_FACET_NO_VALUE"
                       }"
               end

     schemap_failed_build_import_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_FAILED_BUILD_IMPORT"
                       }"
               end

     schemap_failed_load_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_FAILED_LOAD"
                       }"
               end

     schemap_failed_parse_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_FAILED_PARSE"
                       }"
               end

     schemap_group_noname_noref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_GROUP_NONAME_NOREF"
                       }"
               end

     schemap_import_namespace_not_uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_IMPORT_NAMESPACE_NOT_URI"
                       }"
               end

     schemap_import_redefine_nsname_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_IMPORT_REDEFINE_NSNAME"
                       }"
               end

     schemap_import_schema_not_uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_IMPORT_SCHEMA_NOT_URI"
                       }"
               end

     schemap_include_schema_no_uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INCLUDE_SCHEMA_NO_URI"
                       }"
               end

     schemap_include_schema_not_uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INCLUDE_SCHEMA_NOT_URI"
                       }"
               end

     schemap_internal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INTERNAL"
                       }"
               end

     schemap_intersection_not_expressible_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INTERSECTION_NOT_EXPRESSIBLE"
                       }"
               end

     schemap_invalid_attr_combination_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_ATTR_COMBINATION"
                       }"
               end

     schemap_invalid_attr_inline_combination_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_ATTR_INLINE_COMBINATION"
                       }"
               end

     schemap_invalid_attr_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_ATTR_NAME"
                       }"
               end

     schemap_invalid_attr_use_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_ATTR_USE"
                       }"
               end

     schemap_invalid_boolean_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_BOOLEAN"
                       }"
               end

     schemap_invalid_enum_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_ENUM"
                       }"
               end

     schemap_invalid_facet_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_FACET"
                       }"
               end

     schemap_invalid_facet_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_FACET_VALUE"
                       }"
               end

     schemap_invalid_maxoccurs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_MAXOCCURS"
                       }"
               end

     schemap_invalid_minoccurs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_MINOCCURS"
                       }"
               end

     schemap_invalid_ref_and_subtype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_REF_AND_SUBTYPE"
                       }"
               end

     schemap_invalid_white_space_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_INVALID_WHITE_SPACE"
                       }"
               end

     schemap_mg_props_correct_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_MG_PROPS_CORRECT_1"
                       }"
               end

     schemap_mg_props_correct_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_MG_PROPS_CORRECT_2"
                       }"
               end

     schemap_missing_simpletype_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_MISSING_SIMPLETYPE_CHILD"
                       }"
               end

     schemap_no_xmlns_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_NO_XMLNS"
                       }"
               end

     schemap_no_xsi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_NO_XSI"
                       }"
               end

     schemap_noattr_noref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_NOATTR_NOREF"
                       }"
               end

     schemap_noroot_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_NOROOT"
                       }"
               end

     schemap_not_deterministic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_NOT_DETERMINISTIC"
                       }"
               end

     schemap_not_schema_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_NOT_SCHEMA"
                       }"
               end

     schemap_notation_no_name_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_NOTATION_NO_NAME"
                       }"
               end

     schemap_nothing_to_parse_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_NOTHING_TO_PARSE"
                       }"
               end

     schemap_notype_noref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_NOTYPE_NOREF"
                       }"
               end

     schemap_p_props_correct_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_P_PROPS_CORRECT_1"
                       }"
               end

     schemap_p_props_correct_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_P_PROPS_CORRECT_2_1"
                       }"
               end

     schemap_p_props_correct_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_P_PROPS_CORRECT_2_2"
                       }"
               end

     schemap_prefix_undefined_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_PREFIX_UNDEFINED"
                       }"
               end

     schemap_recursive_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_RECURSIVE"
                       }"
               end

     schemap_redefined_attr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_REDEFINED_ATTR"
                       }"
               end

     schemap_redefined_attrgroup_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_REDEFINED_ATTRGROUP"
                       }"
               end

     schemap_redefined_element_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_REDEFINED_ELEMENT"
                       }"
               end

     schemap_redefined_group_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_REDEFINED_GROUP"
                       }"
               end

     schemap_redefined_notation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_REDEFINED_NOTATION"
                       }"
               end

     schemap_redefined_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_REDEFINED_TYPE"
                       }"
               end

     schemap_ref_and_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_REF_AND_CONTENT"
                       }"
               end

     schemap_ref_and_subtype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_REF_AND_SUBTYPE"
                       }"
               end

     schemap_regexp_invalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_REGEXP_INVALID"
                       }"
               end

     schemap_restriction_noname_noref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_RESTRICTION_NONAME_NOREF"
                       }"
               end

     schemap_s4s_attr_invalid_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_S4S_ATTR_INVALID_VALUE"
                       }"
               end

     schemap_s4s_attr_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_S4S_ATTR_MISSING"
                       }"
               end

     schemap_s4s_attr_not_allowed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_S4S_ATTR_NOT_ALLOWED"
                       }"
               end

     schemap_s4s_elem_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_S4S_ELEM_MISSING"
                       }"
               end

     schemap_s4s_elem_not_allowed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_S4S_ELEM_NOT_ALLOWED"
                       }"
               end

     schemap_simpletype_noname_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SIMPLETYPE_NONAME"
                       }"
               end

     schemap_src_attribute_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_1"
                       }"
               end

     schemap_src_attribute_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_2"
                       }"
               end

     schemap_src_attribute_3_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_3_1"
                       }"
               end

     schemap_src_attribute_3_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_3_2"
                       }"
               end

     schemap_src_attribute_4_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_4"
                       }"
               end

     schemap_src_attribute_group_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_1"
                       }"
               end

     schemap_src_attribute_group_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_2"
                       }"
               end

     schemap_src_attribute_group_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_3"
                       }"
               end

     schemap_src_ct_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_CT_1"
                       }"
               end

     schemap_src_element_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ELEMENT_1"
                       }"
               end

     schemap_src_element_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ELEMENT_2_1"
                       }"
               end

     schemap_src_element_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ELEMENT_2_2"
                       }"
               end

     schemap_src_element_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_ELEMENT_3"
                       }"
               end

     schemap_src_import_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_IMPORT"
                       }"
               end

     schemap_src_import_1_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_IMPORT_1_1"
                       }"
               end

     schemap_src_import_1_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_IMPORT_1_2"
                       }"
               end

     schemap_src_import_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_IMPORT_2"
                       }"
               end

     schemap_src_import_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_IMPORT_2_1"
                       }"
               end

     schemap_src_import_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_IMPORT_2_2"
                       }"
               end

     schemap_src_import_3_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_IMPORT_3_1"
                       }"
               end

     schemap_src_import_3_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_IMPORT_3_2"
                       }"
               end

     schemap_src_include_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_INCLUDE"
                       }"
               end

     schemap_src_list_itemtype_or_simpletype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_LIST_ITEMTYPE_OR_SIMPLETYPE"
                       }"
               end

     schemap_src_redefine_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_REDEFINE"
                       }"
               end

     schemap_src_resolve_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_RESOLVE"
                       }"
               end

     schemap_src_restriction_base_or_simpletype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_RESTRICTION_BASE_OR_SIMPLETYPE"
                       }"
               end

     schemap_src_simple_type_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_SIMPLE_TYPE_1"
                       }"
               end

     schemap_src_simple_type_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_SIMPLE_TYPE_2"
                       }"
               end

     schemap_src_simple_type_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_SIMPLE_TYPE_3"
                       }"
               end

     schemap_src_simple_type_4_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_SIMPLE_TYPE_4"
                       }"
               end

     schemap_src_union_membertypes_or_simpletypes_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SRC_UNION_MEMBERTYPES_OR_SIMPLETYPES"
                       }"
               end

     schemap_st_props_correct_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_ST_PROPS_CORRECT_1"
                       }"
               end

     schemap_st_props_correct_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_ST_PROPS_CORRECT_2"
                       }"
               end

     schemap_st_props_correct_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_ST_PROPS_CORRECT_3"
                       }"
               end

     schemap_supernumerous_list_item_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_SUPERNUMEROUS_LIST_ITEM_TYPE"
                       }"
               end

     schemap_type_and_subtype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_TYPE_AND_SUBTYPE"
                       }"
               end

     schemap_union_not_expressible_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNION_NOT_EXPRESSIBLE"
                       }"
               end

     schemap_unknown_all_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_ALL_CHILD"
                       }"
               end

     schemap_unknown_anyattribute_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_ANYATTRIBUTE_CHILD"
                       }"
               end

     schemap_unknown_attr_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_ATTR_CHILD"
                       }"
               end

     schemap_unknown_attrgrp_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_ATTRGRP_CHILD"
                       }"
               end

     schemap_unknown_attribute_group_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_ATTRIBUTE_GROUP"
                       }"
               end

     schemap_unknown_base_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_BASE_TYPE"
                       }"
               end

     schemap_unknown_choice_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_CHOICE_CHILD"
                       }"
               end

     schemap_unknown_complexcontent_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_COMPLEXCONTENT_CHILD"
                       }"
               end

     schemap_unknown_complextype_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_COMPLEXTYPE_CHILD"
                       }"
               end

     schemap_unknown_elem_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_ELEM_CHILD"
                       }"
               end

     schemap_unknown_extension_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_EXTENSION_CHILD"
                       }"
               end

     schemap_unknown_facet_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_FACET_CHILD"
                       }"
               end

     schemap_unknown_facet_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_FACET_TYPE"
                       }"
               end

     schemap_unknown_group_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_GROUP_CHILD"
                       }"
               end

     schemap_unknown_import_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_IMPORT_CHILD"
                       }"
               end

     schemap_unknown_include_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_INCLUDE_CHILD"
                       }"
               end

     schemap_unknown_list_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_LIST_CHILD"
                       }"
               end

     schemap_unknown_member_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_MEMBER_TYPE"
                       }"
               end

     schemap_unknown_notation_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_NOTATION_CHILD"
                       }"
               end

     schemap_unknown_prefix_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_PREFIX"
                       }"
               end

     schemap_unknown_processcontent_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_PROCESSCONTENT_CHILD"
                       }"
               end

     schemap_unknown_ref_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_REF"
                       }"
               end

     schemap_unknown_restriction_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_RESTRICTION_CHILD"
                       }"
               end

     schemap_unknown_schemas_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_SCHEMAS_CHILD"
                       }"
               end

     schemap_unknown_sequence_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_SEQUENCE_CHILD"
                       }"
               end

     schemap_unknown_simplecontent_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_SIMPLECONTENT_CHILD"
                       }"
               end

     schemap_unknown_simpletype_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_SIMPLETYPE_CHILD"
                       }"
               end

     schemap_unknown_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_TYPE"
                       }"
               end

     schemap_unknown_union_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_UNKNOWN_UNION_CHILD"
                       }"
               end

     schemap_warn_attr_pointless_proh_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_WARN_ATTR_POINTLESS_PROH"
                       }"
               end

     schemap_warn_attr_redecl_proh_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_WARN_ATTR_REDECL_PROH"
                       }"
               end

     schemap_warn_skip_schema_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_WARN_SKIP_SCHEMA"
                       }"
               end

     schemap_warn_unlocated_schema_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_WARN_UNLOCATED_SCHEMA"
                       }"
               end

     schemap_wildcard_invalid_ns_member_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAP_WILDCARD_INVALID_NS_MEMBER"
                       }"
               end

     schematronv_assert_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMATRONV_ASSERT"
                       }"
               end

     schematronv_report_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMATRONV_REPORT"
                       }"
               end

     schemav_attrinvalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_ATTRINVALID"
                       }"
               end

     schemav_attrunknown_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_ATTRUNKNOWN"
                       }"
               end

     schemav_construct_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CONSTRUCT"
                       }"
               end

     schemav_cvc_attribute_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ATTRIBUTE_1"
                       }"
               end

     schemav_cvc_attribute_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ATTRIBUTE_2"
                       }"
               end

     schemav_cvc_attribute_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ATTRIBUTE_3"
                       }"
               end

     schemav_cvc_attribute_4_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ATTRIBUTE_4"
                       }"
               end

     schemav_cvc_au_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_AU"
                       }"
               end

     schemav_cvc_complex_type_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_1"
                       }"
               end

     schemav_cvc_complex_type_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_1"
                       }"
               end

     schemav_cvc_complex_type_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_2"
                       }"
               end

     schemav_cvc_complex_type_2_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_3"
                       }"
               end

     schemav_cvc_complex_type_2_4_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_4"
                       }"
               end

     schemav_cvc_complex_type_3_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_3_1"
                       }"
               end

     schemav_cvc_complex_type_3_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_1"
                       }"
               end

     schemav_cvc_complex_type_3_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_2"
                       }"
               end

     schemav_cvc_complex_type_4_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_4"
                       }"
               end

     schemav_cvc_complex_type_5_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_5_1"
                       }"
               end

     schemav_cvc_complex_type_5_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_5_2"
                       }"
               end

     schemav_cvc_datatype_valid_1_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_1"
                       }"
               end

     schemav_cvc_datatype_valid_1_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_2"
                       }"
               end

     schemav_cvc_datatype_valid_1_2_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_3"
                       }"
               end

     schemav_cvc_elt_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_1"
                       }"
               end

     schemav_cvc_elt_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_2"
                       }"
               end

     schemav_cvc_elt_3_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_3_1"
                       }"
               end

     schemav_cvc_elt_3_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_3_2_1"
                       }"
               end

     schemav_cvc_elt_3_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_3_2_2"
                       }"
               end

     schemav_cvc_elt_4_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_4_1"
                       }"
               end

     schemav_cvc_elt_4_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_4_2"
                       }"
               end

     schemav_cvc_elt_4_3_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_4_3"
                       }"
               end

     schemav_cvc_elt_5_1_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_5_1_1"
                       }"
               end

     schemav_cvc_elt_5_1_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_5_1_2"
                       }"
               end

     schemav_cvc_elt_5_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_5_2_1"
                       }"
               end

     schemav_cvc_elt_5_2_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_5_2_2_1"
                       }"
               end

     schemav_cvc_elt_5_2_2_2_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_5_2_2_2_1"
                       }"
               end

     schemav_cvc_elt_5_2_2_2_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_5_2_2_2_2"
                       }"
               end

     schemav_cvc_elt_6_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_6"
                       }"
               end

     schemav_cvc_elt_7_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ELT_7"
                       }"
               end

     schemav_cvc_enumeration_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_ENUMERATION_VALID"
                       }"
               end

     schemav_cvc_facet_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_FACET_VALID"
                       }"
               end

     schemav_cvc_fractiondigits_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_FRACTIONDIGITS_VALID"
                       }"
               end

     schemav_cvc_idc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_IDC"
                       }"
               end

     schemav_cvc_length_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_LENGTH_VALID"
                       }"
               end

     schemav_cvc_maxexclusive_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_MAXEXCLUSIVE_VALID"
                       }"
               end

     schemav_cvc_maxinclusive_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_MAXINCLUSIVE_VALID"
                       }"
               end

     schemav_cvc_maxlength_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_MAXLENGTH_VALID"
                       }"
               end

     schemav_cvc_minexclusive_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_MINEXCLUSIVE_VALID"
                       }"
               end

     schemav_cvc_mininclusive_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_MININCLUSIVE_VALID"
                       }"
               end

     schemav_cvc_minlength_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_MINLENGTH_VALID"
                       }"
               end

     schemav_cvc_pattern_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_PATTERN_VALID"
                       }"
               end

     schemav_cvc_totaldigits_valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_TOTALDIGITS_VALID"
                       }"
               end

     schemav_cvc_type_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_TYPE_1"
                       }"
               end

     schemav_cvc_type_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_TYPE_2"
                       }"
               end

     schemav_cvc_type_3_1_1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_TYPE_3_1_1"
                       }"
               end

     schemav_cvc_type_3_1_2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_TYPE_3_1_2"
                       }"
               end

     schemav_cvc_wildcard_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_CVC_WILDCARD"
                       }"
               end

     schemav_document_element_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_DOCUMENT_ELEMENT_MISSING"
                       }"
               end

     schemav_elemcont_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_ELEMCONT"
                       }"
               end

     schemav_element_content_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_ELEMENT_CONTENT"
                       }"
               end

     schemav_extracontent_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_EXTRACONTENT"
                       }"
               end

     schemav_facet_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_FACET"
                       }"
               end

     schemav_havedefault_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_HAVEDEFAULT"
                       }"
               end

     schemav_internal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_INTERNAL"
                       }"
               end

     schemav_invalidattr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_INVALIDATTR"
                       }"
               end

     schemav_invalidelem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_INVALIDELEM"
                       }"
               end

     schemav_isabstract_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_ISABSTRACT"
                       }"
               end

     schemav_misc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_MISC"
                       }"
               end

     schemav_missing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_MISSING"
                       }"
               end

     schemav_norollback_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_NOROLLBACK"
                       }"
               end

     schemav_noroot_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_NOROOT"
                       }"
               end

     schemav_notdeterminist_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_NOTDETERMINIST"
                       }"
               end

     schemav_notempty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_NOTEMPTY"
                       }"
               end

     schemav_notnillable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_NOTNILLABLE"
                       }"
               end

     schemav_notsimple_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_NOTSIMPLE"
                       }"
               end

     schemav_nottoplevel_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_NOTTOPLEVEL"
                       }"
               end

     schemav_notype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_NOTYPE"
                       }"
               end

     schemav_undeclaredelem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_UNDECLAREDELEM"
                       }"
               end

     schemav_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_VALUE"
                       }"
               end

     schemav_wrongelem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_SCHEMAV_WRONGELEM"
                       }"
               end

     tree_invalid_dec_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_TREE_INVALID_DEC"
                       }"
               end

     tree_invalid_hex_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_TREE_INVALID_HEX"
                       }"
               end

     tree_not_utf8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_TREE_NOT_UTF8"
                       }"
               end

     tree_unterminated_entity_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_TREE_UNTERMINATED_ENTITY"
                       }"
               end

     war_catalog_pi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WAR_CATALOG_PI"
                       }"
               end

     war_entity_redefined_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WAR_ENTITY_REDEFINED"
                       }"
               end

     war_lang_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WAR_LANG_VALUE"
                       }"
               end

     war_ns_column_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WAR_NS_COLUMN"
                       }"
               end

     war_ns_uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WAR_NS_URI"
                       }"
               end

     war_ns_uri_relative_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WAR_NS_URI_RELATIVE"
                       }"
               end

     war_space_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WAR_SPACE_VALUE"
                       }"
               end

     war_undeclared_entity_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WAR_UNDECLARED_ENTITY"
                       }"
               end

     war_unknown_version_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WAR_UNKNOWN_VERSION"
                       }"
               end

     xinclude_build_failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_BUILD_FAILED"
                       }"
               end

     xinclude_deprecated_ns_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_DEPRECATED_NS"
                       }"
               end

     xinclude_entity_def_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_ENTITY_DEF_MISMATCH"
                       }"
               end

     xinclude_fallback_not_in_include_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_FALLBACK_NOT_IN_INCLUDE"
                       }"
               end

     xinclude_fallbacks_in_include_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_FALLBACKS_IN_INCLUDE"
                       }"
               end

     xinclude_fragment_id_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_FRAGMENT_ID"
                       }"
               end

     xinclude_href_uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_HREF_URI"
                       }"
               end

     xinclude_include_in_include_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_INCLUDE_IN_INCLUDE"
                       }"
               end

     xinclude_invalid_char_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_INVALID_CHAR"
                       }"
               end

     xinclude_multiple_root_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_MULTIPLE_ROOT"
                       }"
               end

     xinclude_no_fallback_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_NO_FALLBACK"
                       }"
               end

     xinclude_no_href_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_NO_HREF"
                       }"
               end

     xinclude_parse_value_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_PARSE_VALUE"
                       }"
               end

     xinclude_recursion_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_RECURSION"
                       }"
               end

     xinclude_text_document_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_TEXT_DOCUMENT"
                       }"
               end

     xinclude_text_fragment_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_TEXT_FRAGMENT"
                       }"
               end

     xinclude_unknown_encoding_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_UNKNOWN_ENCODING"
                       }"
               end

     xinclude_xptr_failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_XPTR_FAILED"
                       }"
               end

     xinclude_xptr_result_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XINCLUDE_XPTR_RESULT"
                       }"
               end

     xpath_encoding_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_ENCODING_ERROR"
                       }"
               end

     xpath_expr_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_EXPR_ERROR"
                       }"
               end

     xpath_expression_ok_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_EXPRESSION_OK"
                       }"
               end

     xpath_invalid_arity_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_INVALID_ARITY"
                       }"
               end

     xpath_invalid_char_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_INVALID_CHAR_ERROR"
                       }"
               end

     xpath_invalid_ctxt_position_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_INVALID_CTXT_POSITION"
                       }"
               end

     xpath_invalid_ctxt_size_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_INVALID_CTXT_SIZE"
                       }"
               end

     xpath_invalid_operand_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_INVALID_OPERAND"
                       }"
               end

     xpath_invalid_predicate_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_INVALID_PREDICATE_ERROR"
                       }"
               end

     xpath_invalid_type_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_INVALID_TYPE"
                       }"
               end

     xpath_memory_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_MEMORY_ERROR"
                       }"
               end

     xpath_number_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_NUMBER_ERROR"
                       }"
               end

     xpath_start_literal_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_START_LITERAL_ERROR"
                       }"
               end

     xpath_unclosed_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_UNCLOSED_ERROR"
                       }"
               end

     xpath_undef_prefix_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_UNDEF_PREFIX_ERROR"
                       }"
               end

     xpath_undef_variable_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_UNDEF_VARIABLE_ERROR"
                       }"
               end

     xpath_unfinished_literal_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_UNFINISHED_LITERAL_ERROR"
                       }"
               end

     xpath_unknown_func_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_UNKNOWN_FUNC_ERROR"
                       }"
               end

     xpath_variable_ref_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPATH_VARIABLE_REF_ERROR"
                       }"
               end

     xptr_childseq_start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPTR_CHILDSEQ_START"
                       }"
               end

     xptr_eval_failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPTR_EVAL_FAILED"
                       }"
               end

     xptr_extra_objects_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPTR_EXTRA_OBJECTS"
                       }"
               end

     xptr_resource_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPTR_RESOURCE_ERROR"
                       }"
               end

     xptr_sub_resource_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPTR_SUB_RESOURCE_ERROR"
                       }"
               end

     xptr_syntax_error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPTR_SYNTAX_ERROR"
                       }"
               end

     xptr_unknown_scheme_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_XPTR_UNKNOWN_SCHEME"
                       }"
               end


end -- class XML_PARSER_ERRORS_ENUM
