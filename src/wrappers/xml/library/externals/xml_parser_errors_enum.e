-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_PARSER_ERRORS_ENUM

insert ENUM

<<<<<<< HEAD
creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = xml_c14n_create_ctxt_low_level)  or else
				(a_value = xml_c14n_create_stack_low_level)  or else
				(a_value = xml_c14n_invalid_node_low_level)  or else
				(a_value = xml_c14n_relative_namespace_low_level)  or else
				(a_value = xml_c14n_requires_utf8_low_level)  or else
				(a_value = xml_c14n_unknow_node_low_level)  or else
				(a_value = xml_catalog_entry_broken_low_level)  or else
				(a_value = xml_catalog_missing_attr_low_level)  or else
				(a_value = xml_catalog_not_catalog_low_level)  or else
				(a_value = xml_catalog_prefer_value_low_level)  or else
				(a_value = xml_catalog_recursion_low_level)  or else
				(a_value = xml_check_entity_type_low_level)  or else
				(a_value = xml_check_found_attribute_low_level)  or else
				(a_value = xml_check_found_cdata_low_level)  or else
				(a_value = xml_check_found_comment_low_level)  or else
				(a_value = xml_check_found_doctype_low_level)  or else
				(a_value = xml_check_found_element_low_level)  or else
				(a_value = xml_check_found_entity_low_level)  or else
				(a_value = xml_check_found_entityref_low_level)  or else
				(a_value = xml_check_found_fragment_low_level)  or else
				(a_value = xml_check_found_notation_low_level)  or else
				(a_value = xml_check_found_pi_low_level)  or else
				(a_value = xml_check_found_text_low_level)  or else
				(a_value = xml_check_name_not_null_low_level)  or else
				(a_value = xml_check_no_dict_low_level)  or else
				(a_value = xml_check_no_doc_low_level)  or else
				(a_value = xml_check_no_elem_low_level)  or else
				(a_value = xml_check_no_href_low_level)  or else
				(a_value = xml_check_no_name_low_level)  or else
				(a_value = xml_check_no_next_low_level)  or else
				(a_value = xml_check_no_parent_low_level)  or else
				(a_value = xml_check_no_prev_low_level)  or else
				(a_value = xml_check_not_attr_low_level)  or else
				(a_value = xml_check_not_attr_decl_low_level)  or else
				(a_value = xml_check_not_dtd_low_level)  or else
				(a_value = xml_check_not_elem_decl_low_level)  or else
				(a_value = xml_check_not_entity_decl_low_level)  or else
				(a_value = xml_check_not_ncname_low_level)  or else
				(a_value = xml_check_not_ns_decl_low_level)  or else
				(a_value = xml_check_not_utf8_low_level)  or else
				(a_value = xml_check_ns_ancestor_low_level)  or else
				(a_value = xml_check_ns_scope_low_level)  or else
				(a_value = xml_check_outside_dict_low_level)  or else
				(a_value = xml_check_unknown_node_low_level)  or else
				(a_value = xml_check_wrong_doc_low_level)  or else
				(a_value = xml_check_wrong_name_low_level)  or else
				(a_value = xml_check_wrong_next_low_level)  or else
				(a_value = xml_check_wrong_parent_low_level)  or else
				(a_value = xml_check_wrong_prev_low_level)  or else
				(a_value = xml_dtd_attribute_default_low_level)  or else
				(a_value = xml_dtd_attribute_redefined_low_level)  or else
				(a_value = xml_dtd_attribute_value_low_level)  or else
				(a_value = xml_dtd_content_error_low_level)  or else
				(a_value = xml_dtd_content_model_low_level)  or else
				(a_value = xml_dtd_content_not_determinist_low_level)  or else
				(a_value = xml_dtd_different_prefix_low_level)  or else
				(a_value = xml_dtd_dup_token_low_level)  or else
				(a_value = xml_dtd_elem_default_namespace_low_level)  or else
				(a_value = xml_dtd_elem_namespace_low_level)  or else
				(a_value = xml_dtd_elem_redefined_low_level)  or else
				(a_value = xml_dtd_empty_notation_low_level)  or else
				(a_value = xml_dtd_entity_type_low_level)  or else
				(a_value = xml_dtd_id_fixed_low_level)  or else
				(a_value = xml_dtd_id_redefined_low_level)  or else
				(a_value = xml_dtd_id_subset_low_level)  or else
				(a_value = xml_dtd_invalid_child_low_level)  or else
				(a_value = xml_dtd_invalid_default_low_level)  or else
				(a_value = xml_dtd_load_error_low_level)  or else
				(a_value = xml_dtd_missing_attribute_low_level)  or else
				(a_value = xml_dtd_mixed_corrupt_low_level)  or else
				(a_value = xml_dtd_multiple_id_low_level)  or else
				(a_value = xml_dtd_no_doc_low_level)  or else
				(a_value = xml_dtd_no_dtd_low_level)  or else
				(a_value = xml_dtd_no_elem_name_low_level)  or else
				(a_value = xml_dtd_no_prefix_low_level)  or else
				(a_value = xml_dtd_no_root_low_level)  or else
				(a_value = xml_dtd_not_empty_low_level)  or else
				(a_value = xml_dtd_not_pcdata_low_level)  or else
				(a_value = xml_dtd_not_standalone_low_level)  or else
				(a_value = xml_dtd_notation_redefined_low_level)  or else
				(a_value = xml_dtd_notation_value_low_level)  or else
				(a_value = xml_dtd_root_name_low_level)  or else
				(a_value = xml_dtd_standalone_defaulted_low_level)  or else
				(a_value = xml_dtd_standalone_white_space_low_level)  or else
				(a_value = xml_dtd_unknown_attribute_low_level)  or else
				(a_value = xml_dtd_unknown_elem_low_level)  or else
				(a_value = xml_dtd_unknown_entity_low_level)  or else
				(a_value = xml_dtd_unknown_id_low_level)  or else
				(a_value = xml_dtd_unknown_notation_low_level)  or else
				(a_value = xml_dtd_xmlid_type_low_level)  or else
				(a_value = xml_dtd_xmlid_value_low_level)  or else
				(a_value = xml_err_attlist_not_finished_low_level)  or else
				(a_value = xml_err_attlist_not_started_low_level)  or else
				(a_value = xml_err_attribute_not_finished_low_level)  or else
				(a_value = xml_err_attribute_not_started_low_level)  or else
				(a_value = xml_err_attribute_redefined_low_level)  or else
				(a_value = xml_err_attribute_without_value_low_level)  or else
				(a_value = xml_err_cdata_not_finished_low_level)  or else
				(a_value = xml_err_charref_at_eof_low_level)  or else
				(a_value = xml_err_charref_in_dtd_low_level)  or else
				(a_value = xml_err_charref_in_epilog_low_level)  or else
				(a_value = xml_err_charref_in_prolog_low_level)  or else
				(a_value = xml_err_comment_not_finished_low_level)  or else
				(a_value = xml_err_condsec_invalid_low_level)  or else
				(a_value = xml_err_condsec_invalid_keyword_low_level)  or else
				(a_value = xml_err_condsec_not_finished_low_level)  or else
				(a_value = xml_err_condsec_not_started_low_level)  or else
				(a_value = xml_err_doctype_not_finished_low_level)  or else
				(a_value = xml_err_document_empty_low_level)  or else
				(a_value = xml_err_document_end_low_level)  or else
				(a_value = xml_err_document_start_low_level)  or else
				(a_value = xml_err_elemcontent_not_finished_low_level)  or else
				(a_value = xml_err_elemcontent_not_started_low_level)  or else
				(a_value = xml_err_encoding_name_low_level)  or else
				(a_value = xml_err_entity_boundary_low_level)  or else
				(a_value = xml_err_entity_char_error_low_level)  or else
				(a_value = xml_err_entity_is_external_low_level)  or else
				(a_value = xml_err_entity_is_parameter_low_level)  or else
				(a_value = xml_err_entity_loop_low_level)  or else
				(a_value = xml_err_entity_not_finished_low_level)  or else
				(a_value = xml_err_entity_not_started_low_level)  or else
				(a_value = xml_err_entity_pe_internal_low_level)  or else
				(a_value = xml_err_entity_processing_low_level)  or else
				(a_value = xml_err_entityref_at_eof_low_level)  or else
				(a_value = xml_err_entityref_in_dtd_low_level)  or else
				(a_value = xml_err_entityref_in_epilog_low_level)  or else
				(a_value = xml_err_entityref_in_prolog_low_level)  or else
				(a_value = xml_err_entityref_no_name_low_level)  or else
				(a_value = xml_err_entityref_semicol_missing_low_level)  or else
				(a_value = xml_err_equal_required_low_level)  or else
				(a_value = xml_err_ext_entity_standalone_low_level)  or else
				(a_value = xml_err_ext_subset_not_finished_low_level)  or else
				(a_value = xml_err_extra_content_low_level)  or else
				(a_value = xml_err_gt_required_low_level)  or else
				(a_value = xml_err_hyphen_in_comment_low_level)  or else
				(a_value = xml_err_internal_error_low_level)  or else
				(a_value = xml_err_invalid_char_low_level)  or else
				(a_value = xml_err_invalid_charref_low_level)  or else
				(a_value = xml_err_invalid_dec_charref_low_level)  or else
				(a_value = xml_err_invalid_encoding_low_level)  or else
				(a_value = xml_err_invalid_hex_charref_low_level)  or else
				(a_value = xml_err_invalid_uri_low_level)  or else
				(a_value = xml_err_literal_not_finished_low_level)  or else
				(a_value = xml_err_literal_not_started_low_level)  or else
				(a_value = xml_err_lt_in_attribute_low_level)  or else
				(a_value = xml_err_lt_required_low_level)  or else
				(a_value = xml_err_ltslash_required_low_level)  or else
				(a_value = xml_err_misplaced_cdata_end_low_level)  or else
				(a_value = xml_err_missing_encoding_low_level)  or else
				(a_value = xml_err_mixed_not_finished_low_level)  or else
				(a_value = xml_err_mixed_not_started_low_level)  or else
				(a_value = xml_err_name_required_low_level)  or else
				(a_value = xml_err_nmtoken_required_low_level)  or else
				(a_value = xml_err_no_dtd_low_level)  or else
				(a_value = xml_err_no_memory_low_level)  or else
				(a_value = xml_err_not_standalone_low_level)  or else
				(a_value = xml_err_not_well_balanced_low_level)  or else
				(a_value = xml_err_notation_not_finished_low_level)  or else
				(a_value = xml_err_notation_not_started_low_level)  or else
				(a_value = xml_err_notation_processing_low_level)  or else
				(a_value = xml_err_ns_decl_error_low_level)  or else
				(a_value = xml_err_ok_low_level)  or else
				(a_value = xml_err_pcdata_required_low_level)  or else
				(a_value = xml_err_peref_at_eof_low_level)  or else
				(a_value = xml_err_peref_in_epilog_low_level)  or else
				(a_value = xml_err_peref_in_int_subset_low_level)  or else
				(a_value = xml_err_peref_in_prolog_low_level)  or else
				(a_value = xml_err_peref_no_name_low_level)  or else
				(a_value = xml_err_peref_semicol_missing_low_level)  or else
				(a_value = xml_err_pi_not_finished_low_level)  or else
				(a_value = xml_err_pi_not_started_low_level)  or else
				(a_value = xml_err_pubid_required_low_level)  or else
				(a_value = xml_err_reserved_xml_name_low_level)  or else
				(a_value = xml_err_separator_required_low_level)  or else
				(a_value = xml_err_space_required_low_level)  or else
				(a_value = xml_err_standalone_value_low_level)  or else
				(a_value = xml_err_string_not_closed_low_level)  or else
				(a_value = xml_err_string_not_started_low_level)  or else
				(a_value = xml_err_tag_name_mismatch_low_level)  or else
				(a_value = xml_err_tag_not_finished_low_level)  or else
				(a_value = xml_err_undeclared_entity_low_level)  or else
				(a_value = xml_err_unknown_encoding_low_level)  or else
				(a_value = xml_err_unknown_version_low_level)  or else
				(a_value = xml_err_unparsed_entity_low_level)  or else
				(a_value = xml_err_unsupported_encoding_low_level)  or else
				(a_value = xml_err_uri_fragment_low_level)  or else
				(a_value = xml_err_uri_required_low_level)  or else
				(a_value = xml_err_value_required_low_level)  or else
				(a_value = xml_err_version_mismatch_low_level)  or else
				(a_value = xml_err_version_missing_low_level)  or else
				(a_value = xml_err_xmldecl_not_finished_low_level)  or else
				(a_value = xml_err_xmldecl_not_started_low_level)  or else
				(a_value = xml_ftp_accnt_low_level)  or else
				(a_value = xml_ftp_epsv_answer_low_level)  or else
				(a_value = xml_ftp_pasv_answer_low_level)  or else
				(a_value = xml_ftp_url_syntax_low_level)  or else
				(a_value = xml_html_strucure_error_low_level)  or else
				(a_value = xml_html_unknown_tag_low_level)  or else
				(a_value = xml_http_unknown_host_low_level)  or else
				(a_value = xml_http_url_syntax_low_level)  or else
				(a_value = xml_http_use_ip_low_level)  or else
				(a_value = xml_i18n_conv_failed_low_level)  or else
				(a_value = xml_i18n_excess_handler_low_level)  or else
				(a_value = xml_i18n_no_handler_low_level)  or else
				(a_value = xml_i18n_no_name_low_level)  or else
				(a_value = xml_i18n_no_output_low_level)  or else
				(a_value = xml_io_buffer_full_low_level)  or else
				(a_value = xml_io_eacces_low_level)  or else
				(a_value = xml_io_eaddrinuse_low_level)  or else
				(a_value = xml_io_eafnosupport_low_level)  or else
				(a_value = xml_io_eagain_low_level)  or else
				(a_value = xml_io_ealready_low_level)  or else
				(a_value = xml_io_ebadf_low_level)  or else
				(a_value = xml_io_ebadmsg_low_level)  or else
				(a_value = xml_io_ebusy_low_level)  or else
				(a_value = xml_io_ecanceled_low_level)  or else
				(a_value = xml_io_echild_low_level)  or else
				(a_value = xml_io_econnrefused_low_level)  or else
				(a_value = xml_io_edeadlk_low_level)  or else
				(a_value = xml_io_edom_low_level)  or else
				(a_value = xml_io_eexist_low_level)  or else
				(a_value = xml_io_efault_low_level)  or else
				(a_value = xml_io_efbig_low_level)  or else
				(a_value = xml_io_einprogress_low_level)  or else
				(a_value = xml_io_eintr_low_level)  or else
				(a_value = xml_io_einval_low_level)  or else
				(a_value = xml_io_eio_low_level)  or else
				(a_value = xml_io_eisconn_low_level)  or else
				(a_value = xml_io_eisdir_low_level)  or else
				(a_value = xml_io_emfile_low_level)  or else
				(a_value = xml_io_emlink_low_level)  or else
				(a_value = xml_io_emsgsize_low_level)  or else
				(a_value = xml_io_enametoolong_low_level)  or else
				(a_value = xml_io_encoder_low_level)  or else
				(a_value = xml_io_enetunreach_low_level)  or else
				(a_value = xml_io_enfile_low_level)  or else
				(a_value = xml_io_enodev_low_level)  or else
				(a_value = xml_io_enoent_low_level)  or else
				(a_value = xml_io_enoexec_low_level)  or else
				(a_value = xml_io_enolck_low_level)  or else
				(a_value = xml_io_enomem_low_level)  or else
				(a_value = xml_io_enospc_low_level)  or else
				(a_value = xml_io_enosys_low_level)  or else
				(a_value = xml_io_enotdir_low_level)  or else
				(a_value = xml_io_enotempty_low_level)  or else
				(a_value = xml_io_enotsock_low_level)  or else
				(a_value = xml_io_enotsup_low_level)  or else
				(a_value = xml_io_enotty_low_level)  or else
				(a_value = xml_io_enxio_low_level)  or else
				(a_value = xml_io_eperm_low_level)  or else
				(a_value = xml_io_epipe_low_level)  or else
				(a_value = xml_io_erange_low_level)  or else
				(a_value = xml_io_erofs_low_level)  or else
				(a_value = xml_io_espipe_low_level)  or else
				(a_value = xml_io_esrch_low_level)  or else
				(a_value = xml_io_etimedout_low_level)  or else
				(a_value = xml_io_exdev_low_level)  or else
				(a_value = xml_io_flush_low_level)  or else
				(a_value = xml_io_load_error_low_level)  or else
				(a_value = xml_io_network_attempt_low_level)  or else
				(a_value = xml_io_no_input_low_level)  or else
				(a_value = xml_io_unknown_low_level)  or else
				(a_value = xml_io_write_low_level)  or else
				(a_value = xml_module_close_low_level)  or else
				(a_value = xml_module_open_low_level)  or else
				(a_value = xml_ns_err_attribute_redefined_low_level)  or else
				(a_value = xml_ns_err_colon_low_level)  or else
				(a_value = xml_ns_err_empty_low_level)  or else
				(a_value = xml_ns_err_qname_low_level)  or else
				(a_value = xml_ns_err_undefined_namespace_low_level)  or else
				(a_value = xml_ns_err_xml_namespace_low_level)  or else
				(a_value = xml_regexp_compile_error_low_level)  or else
				(a_value = xml_rngp_anyname_attr_ancestor_low_level)  or else
				(a_value = xml_rngp_attr_conflict_low_level)  or else
				(a_value = xml_rngp_attribute_children_low_level)  or else
				(a_value = xml_rngp_attribute_content_low_level)  or else
				(a_value = xml_rngp_attribute_empty_low_level)  or else
				(a_value = xml_rngp_attribute_noop_low_level)  or else
				(a_value = xml_rngp_choice_content_low_level)  or else
				(a_value = xml_rngp_choice_empty_low_level)  or else
				(a_value = xml_rngp_create_failure_low_level)  or else
				(a_value = xml_rngp_data_content_low_level)  or else
				(a_value = xml_rngp_def_choice_and_interleave_low_level)  or else
				(a_value = xml_rngp_define_create_failed_low_level)  or else
				(a_value = xml_rngp_define_empty_low_level)  or else
				(a_value = xml_rngp_define_missing_low_level)  or else
				(a_value = xml_rngp_define_name_missing_low_level)  or else
				(a_value = xml_rngp_elem_content_empty_low_level)  or else
				(a_value = xml_rngp_elem_content_error_low_level)  or else
				(a_value = xml_rngp_elem_text_conflict_low_level)  or else
				(a_value = xml_rngp_element_content_low_level)  or else
				(a_value = xml_rngp_element_empty_low_level)  or else
				(a_value = xml_rngp_element_name_low_level)  or else
				(a_value = xml_rngp_element_no_content_low_level)  or else
				(a_value = xml_rngp_empty_low_level)  or else
				(a_value = xml_rngp_empty_construct_low_level)  or else
				(a_value = xml_rngp_empty_content_low_level)  or else
				(a_value = xml_rngp_empty_not_empty_low_level)  or else
				(a_value = xml_rngp_error_type_lib_low_level)  or else
				(a_value = xml_rngp_except_empty_low_level)  or else
				(a_value = xml_rngp_except_missing_low_level)  or else
				(a_value = xml_rngp_except_multiple_low_level)  or else
				(a_value = xml_rngp_except_no_content_low_level)  or else
				(a_value = xml_rngp_external_ref_failure_low_level)  or else
				(a_value = xml_rngp_externalref_emtpy_low_level)  or else
				(a_value = xml_rngp_externalref_recurse_low_level)  or else
				(a_value = xml_rngp_forbidden_attribute_low_level)  or else
				(a_value = xml_rngp_foreign_element_low_level)  or else
				(a_value = xml_rngp_grammar_content_low_level)  or else
				(a_value = xml_rngp_grammar_empty_low_level)  or else
				(a_value = xml_rngp_grammar_missing_low_level)  or else
				(a_value = xml_rngp_grammar_no_start_low_level)  or else
				(a_value = xml_rngp_group_attr_conflict_low_level)  or else
				(a_value = xml_rngp_href_error_low_level)  or else
				(a_value = xml_rngp_include_empty_low_level)  or else
				(a_value = xml_rngp_include_failure_low_level)  or else
				(a_value = xml_rngp_include_recurse_low_level)  or else
				(a_value = xml_rngp_interleave_add_low_level)  or else
				(a_value = xml_rngp_interleave_create_failed_low_level)  or else
				(a_value = xml_rngp_interleave_empty_low_level)  or else
				(a_value = xml_rngp_interleave_no_content_low_level)  or else
				(a_value = xml_rngp_invalid_define_name_low_level)  or else
				(a_value = xml_rngp_invalid_uri_low_level)  or else
				(a_value = xml_rngp_invalid_value_low_level)  or else
				(a_value = xml_rngp_missing_href_low_level)  or else
				(a_value = xml_rngp_name_missing_low_level)  or else
				(a_value = xml_rngp_need_combine_low_level)  or else
				(a_value = xml_rngp_notallowed_not_empty_low_level)  or else
				(a_value = xml_rngp_nsname_attr_ancestor_low_level)  or else
				(a_value = xml_rngp_nsname_no_ns_low_level)  or else
				(a_value = xml_rngp_param_forbidden_low_level)  or else
				(a_value = xml_rngp_param_name_missing_low_level)  or else
				(a_value = xml_rngp_parentref_create_failed_low_level)  or else
				(a_value = xml_rngp_parentref_name_invalid_low_level)  or else
				(a_value = xml_rngp_parentref_no_name_low_level)  or else
				(a_value = xml_rngp_parentref_no_parent_low_level)  or else
				(a_value = xml_rngp_parentref_not_empty_low_level)  or else
				(a_value = xml_rngp_parse_error_low_level)  or else
				(a_value = xml_rngp_pat_anyname_except_anyname_low_level)  or else
				(a_value = xml_rngp_pat_attr_attr_low_level)  or else
				(a_value = xml_rngp_pat_attr_elem_low_level)  or else
				(a_value = xml_rngp_pat_data_except_attr_low_level)  or else
				(a_value = xml_rngp_pat_data_except_elem_low_level)  or else
				(a_value = xml_rngp_pat_data_except_empty_low_level)  or else
				(a_value = xml_rngp_pat_data_except_group_low_level)  or else
				(a_value = xml_rngp_pat_data_except_interleave_low_level)  or else
				(a_value = xml_rngp_pat_data_except_list_low_level)  or else
				(a_value = xml_rngp_pat_data_except_onemore_low_level)  or else
				(a_value = xml_rngp_pat_data_except_ref_low_level)  or else
				(a_value = xml_rngp_pat_data_except_text_low_level)  or else
				(a_value = xml_rngp_pat_list_attr_low_level)  or else
				(a_value = xml_rngp_pat_list_elem_low_level)  or else
				(a_value = xml_rngp_pat_list_interleave_low_level)  or else
				(a_value = xml_rngp_pat_list_list_low_level)  or else
				(a_value = xml_rngp_pat_list_ref_low_level)  or else
				(a_value = xml_rngp_pat_list_text_low_level)  or else
				(a_value = xml_rngp_pat_nsname_except_anyname_low_level)  or else
				(a_value = xml_rngp_pat_nsname_except_nsname_low_level)  or else
				(a_value = xml_rngp_pat_onemore_group_attr_low_level)  or else
				(a_value = xml_rngp_pat_onemore_interleave_attr_low_level)  or else
				(a_value = xml_rngp_pat_start_attr_low_level)  or else
				(a_value = xml_rngp_pat_start_data_low_level)  or else
				(a_value = xml_rngp_pat_start_empty_low_level)  or else
				(a_value = xml_rngp_pat_start_group_low_level)  or else
				(a_value = xml_rngp_pat_start_interleave_low_level)  or else
				(a_value = xml_rngp_pat_start_list_low_level)  or else
				(a_value = xml_rngp_pat_start_onemore_low_level)  or else
				(a_value = xml_rngp_pat_start_text_low_level)  or else
				(a_value = xml_rngp_pat_start_value_low_level)  or else
				(a_value = xml_rngp_prefix_undefined_low_level)  or else
				(a_value = xml_rngp_ref_create_failed_low_level)  or else
				(a_value = xml_rngp_ref_cycle_low_level)  or else
				(a_value = xml_rngp_ref_name_invalid_low_level)  or else
				(a_value = xml_rngp_ref_no_def_low_level)  or else
				(a_value = xml_rngp_ref_no_name_low_level)  or else
				(a_value = xml_rngp_ref_not_empty_low_level)  or else
				(a_value = xml_rngp_start_choice_and_interleave_low_level)  or else
				(a_value = xml_rngp_start_content_low_level)  or else
				(a_value = xml_rngp_start_empty_low_level)  or else
				(a_value = xml_rngp_start_missing_low_level)  or else
				(a_value = xml_rngp_text_expected_low_level)  or else
				(a_value = xml_rngp_text_has_child_low_level)  or else
				(a_value = xml_rngp_type_missing_low_level)  or else
				(a_value = xml_rngp_type_not_found_low_level)  or else
				(a_value = xml_rngp_type_value_low_level)  or else
				(a_value = xml_rngp_unknown_attribute_low_level)  or else
				(a_value = xml_rngp_unknown_combine_low_level)  or else
				(a_value = xml_rngp_unknown_construct_low_level)  or else
				(a_value = xml_rngp_unknown_type_lib_low_level)  or else
				(a_value = xml_rngp_uri_fragment_low_level)  or else
				(a_value = xml_rngp_uri_not_absolute_low_level)  or else
				(a_value = xml_rngp_value_empty_low_level)  or else
				(a_value = xml_rngp_value_no_content_low_level)  or else
				(a_value = xml_rngp_xml_ns_low_level)  or else
				(a_value = xml_rngp_xmlns_name_low_level)  or else
				(a_value = xml_save_char_invalid_low_level)  or else
				(a_value = xml_save_no_doctype_low_level)  or else
				(a_value = xml_save_not_utf8_low_level)  or else
				(a_value = xml_save_unknown_encoding_low_level)  or else
				(a_value = xml_schemap_a_props_correct_2_low_level)  or else
				(a_value = xml_schemap_a_props_correct_3_low_level)  or else
				(a_value = xml_schemap_ag_props_correct_low_level)  or else
				(a_value = xml_schemap_attr_noname_noref_low_level)  or else
				(a_value = xml_schemap_attrformdefault_value_low_level)  or else
				(a_value = xml_schemap_attrgrp_noname_noref_low_level)  or else
				(a_value = xml_schemap_au_props_correct_low_level)  or else
				(a_value = xml_schemap_au_props_correct_2_low_level)  or else
				(a_value = xml_schemap_c_props_correct_low_level)  or else
				(a_value = xml_schemap_complextype_noname_noref_low_level)  or else
				(a_value = xml_schemap_cos_all_limited_low_level)  or else
				(a_value = xml_schemap_cos_ct_extends_1_1_low_level)  or else
				(a_value = xml_schemap_cos_ct_extends_1_2_low_level)  or else
				(a_value = xml_schemap_cos_ct_extends_1_3_low_level)  or else
				(a_value = xml_schemap_cos_st_derived_ok_2_1_low_level)  or else
				(a_value = xml_schemap_cos_st_derived_ok_2_2_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_1_1_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_1_2_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_1_3_1_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_1_3_2_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_2_1_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_2_3_1_1_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_2_3_1_2_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_2_3_2_1_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_2_3_2_2_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_2_3_2_3_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_2_3_2_4_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_2_3_2_5_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_3_1_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_3_3_1_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_3_3_1_2_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_3_3_2_1_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_3_3_2_2_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_3_3_2_3_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_3_3_2_4_low_level)  or else
				(a_value = xml_schemap_cos_st_restricts_3_3_2_5_low_level)  or else
				(a_value = xml_schemap_cos_valid_default_1_low_level)  or else
				(a_value = xml_schemap_cos_valid_default_2_1_low_level)  or else
				(a_value = xml_schemap_cos_valid_default_2_2_1_low_level)  or else
				(a_value = xml_schemap_cos_valid_default_2_2_2_low_level)  or else
				(a_value = xml_schemap_ct_props_correct_1_low_level)  or else
				(a_value = xml_schemap_ct_props_correct_2_low_level)  or else
				(a_value = xml_schemap_ct_props_correct_3_low_level)  or else
				(a_value = xml_schemap_ct_props_correct_4_low_level)  or else
				(a_value = xml_schemap_ct_props_correct_5_low_level)  or else
				(a_value = xml_schemap_cvc_simple_type_low_level)  or else
				(a_value = xml_schemap_def_and_prefix_low_level)  or else
				(a_value = xml_schemap_derivation_ok_restriction_1_low_level)  or else
				(a_value = xml_schemap_derivation_ok_restriction_2_1_1_low_level)  or else
				(a_value = xml_schemap_derivation_ok_restriction_2_1_2_low_level)  or else
				(a_value = xml_schemap_derivation_ok_restriction_2_1_3_low_level)  or else
				(a_value = xml_schemap_derivation_ok_restriction_2_2_low_level)  or else
				(a_value = xml_schemap_derivation_ok_restriction_3_low_level)  or else
				(a_value = xml_schemap_derivation_ok_restriction_4_1_low_level)  or else
				(a_value = xml_schemap_derivation_ok_restriction_4_2_low_level)  or else
				(a_value = xml_schemap_derivation_ok_restriction_4_3_low_level)  or else
				(a_value = xml_schemap_e_props_correct_2_low_level)  or else
				(a_value = xml_schemap_e_props_correct_3_low_level)  or else
				(a_value = xml_schemap_e_props_correct_4_low_level)  or else
				(a_value = xml_schemap_e_props_correct_5_low_level)  or else
				(a_value = xml_schemap_e_props_correct_6_low_level)  or else
				(a_value = xml_schemap_elem_default_fixed_low_level)  or else
				(a_value = xml_schemap_elem_noname_noref_low_level)  or else
				(a_value = xml_schemap_elemformdefault_value_low_level)  or else
				(a_value = xml_schemap_extension_no_base_low_level)  or else
				(a_value = xml_schemap_facet_no_value_low_level)  or else
				(a_value = xml_schemap_failed_build_import_low_level)  or else
				(a_value = xml_schemap_failed_load_low_level)  or else
				(a_value = xml_schemap_failed_parse_low_level)  or else
				(a_value = xml_schemap_group_noname_noref_low_level)  or else
				(a_value = xml_schemap_import_namespace_not_uri_low_level)  or else
				(a_value = xml_schemap_import_redefine_nsname_low_level)  or else
				(a_value = xml_schemap_import_schema_not_uri_low_level)  or else
				(a_value = xml_schemap_include_schema_no_uri_low_level)  or else
				(a_value = xml_schemap_include_schema_not_uri_low_level)  or else
				(a_value = xml_schemap_internal_low_level)  or else
				(a_value = xml_schemap_intersection_not_expressible_low_level)  or else
				(a_value = xml_schemap_invalid_attr_combination_low_level)  or else
				(a_value = xml_schemap_invalid_attr_inline_combination_low_level)  or else
				(a_value = xml_schemap_invalid_attr_name_low_level)  or else
				(a_value = xml_schemap_invalid_attr_use_low_level)  or else
				(a_value = xml_schemap_invalid_boolean_low_level)  or else
				(a_value = xml_schemap_invalid_enum_low_level)  or else
				(a_value = xml_schemap_invalid_facet_low_level)  or else
				(a_value = xml_schemap_invalid_facet_value_low_level)  or else
				(a_value = xml_schemap_invalid_maxoccurs_low_level)  or else
				(a_value = xml_schemap_invalid_minoccurs_low_level)  or else
				(a_value = xml_schemap_invalid_ref_and_subtype_low_level)  or else
				(a_value = xml_schemap_invalid_white_space_low_level)  or else
				(a_value = xml_schemap_mg_props_correct_1_low_level)  or else
				(a_value = xml_schemap_mg_props_correct_2_low_level)  or else
				(a_value = xml_schemap_missing_simpletype_child_low_level)  or else
				(a_value = xml_schemap_no_xmlns_low_level)  or else
				(a_value = xml_schemap_no_xsi_low_level)  or else
				(a_value = xml_schemap_noattr_noref_low_level)  or else
				(a_value = xml_schemap_noroot_low_level)  or else
				(a_value = xml_schemap_not_deterministic_low_level)  or else
				(a_value = xml_schemap_not_schema_low_level)  or else
				(a_value = xml_schemap_notation_no_name_low_level)  or else
				(a_value = xml_schemap_nothing_to_parse_low_level)  or else
				(a_value = xml_schemap_notype_noref_low_level)  or else
				(a_value = xml_schemap_p_props_correct_1_low_level)  or else
				(a_value = xml_schemap_p_props_correct_2_1_low_level)  or else
				(a_value = xml_schemap_p_props_correct_2_2_low_level)  or else
				(a_value = xml_schemap_prefix_undefined_low_level)  or else
				(a_value = xml_schemap_recursive_low_level)  or else
				(a_value = xml_schemap_redefined_attr_low_level)  or else
				(a_value = xml_schemap_redefined_attrgroup_low_level)  or else
				(a_value = xml_schemap_redefined_element_low_level)  or else
				(a_value = xml_schemap_redefined_group_low_level)  or else
				(a_value = xml_schemap_redefined_notation_low_level)  or else
				(a_value = xml_schemap_redefined_type_low_level)  or else
				(a_value = xml_schemap_ref_and_content_low_level)  or else
				(a_value = xml_schemap_ref_and_subtype_low_level)  or else
				(a_value = xml_schemap_regexp_invalid_low_level)  or else
				(a_value = xml_schemap_restriction_noname_noref_low_level)  or else
				(a_value = xml_schemap_s4s_attr_invalid_value_low_level)  or else
				(a_value = xml_schemap_s4s_attr_missing_low_level)  or else
				(a_value = xml_schemap_s4s_attr_not_allowed_low_level)  or else
				(a_value = xml_schemap_s4s_elem_missing_low_level)  or else
				(a_value = xml_schemap_s4s_elem_not_allowed_low_level)  or else
				(a_value = xml_schemap_simpletype_noname_low_level)  or else
				(a_value = xml_schemap_src_attribute_1_low_level)  or else
				(a_value = xml_schemap_src_attribute_2_low_level)  or else
				(a_value = xml_schemap_src_attribute_3_1_low_level)  or else
				(a_value = xml_schemap_src_attribute_3_2_low_level)  or else
				(a_value = xml_schemap_src_attribute_4_low_level)  or else
				(a_value = xml_schemap_src_attribute_group_1_low_level)  or else
				(a_value = xml_schemap_src_attribute_group_2_low_level)  or else
				(a_value = xml_schemap_src_attribute_group_3_low_level)  or else
				(a_value = xml_schemap_src_ct_1_low_level)  or else
				(a_value = xml_schemap_src_element_1_low_level)  or else
				(a_value = xml_schemap_src_element_2_1_low_level)  or else
				(a_value = xml_schemap_src_element_2_2_low_level)  or else
				(a_value = xml_schemap_src_element_3_low_level)  or else
				(a_value = xml_schemap_src_import_low_level)  or else
				(a_value = xml_schemap_src_import_1_1_low_level)  or else
				(a_value = xml_schemap_src_import_1_2_low_level)  or else
				(a_value = xml_schemap_src_import_2_low_level)  or else
				(a_value = xml_schemap_src_import_2_1_low_level)  or else
				(a_value = xml_schemap_src_import_2_2_low_level)  or else
				(a_value = xml_schemap_src_import_3_1_low_level)  or else
				(a_value = xml_schemap_src_import_3_2_low_level)  or else
				(a_value = xml_schemap_src_include_low_level)  or else
				(a_value = xml_schemap_src_list_itemtype_or_simpletype_low_level)  or else
				(a_value = xml_schemap_src_redefine_low_level)  or else
				(a_value = xml_schemap_src_resolve_low_level)  or else
				(a_value = xml_schemap_src_restriction_base_or_simpletype_low_level)  or else
				(a_value = xml_schemap_src_simple_type_1_low_level)  or else
				(a_value = xml_schemap_src_simple_type_2_low_level)  or else
				(a_value = xml_schemap_src_simple_type_3_low_level)  or else
				(a_value = xml_schemap_src_simple_type_4_low_level)  or else
				(a_value = xml_schemap_src_union_membertypes_or_simpletypes_low_level)  or else
				(a_value = xml_schemap_st_props_correct_1_low_level)  or else
				(a_value = xml_schemap_st_props_correct_2_low_level)  or else
				(a_value = xml_schemap_st_props_correct_3_low_level)  or else
				(a_value = xml_schemap_supernumerous_list_item_type_low_level)  or else
				(a_value = xml_schemap_type_and_subtype_low_level)  or else
				(a_value = xml_schemap_union_not_expressible_low_level)  or else
				(a_value = xml_schemap_unknown_all_child_low_level)  or else
				(a_value = xml_schemap_unknown_anyattribute_child_low_level)  or else
				(a_value = xml_schemap_unknown_attr_child_low_level)  or else
				(a_value = xml_schemap_unknown_attrgrp_child_low_level)  or else
				(a_value = xml_schemap_unknown_attribute_group_low_level)  or else
				(a_value = xml_schemap_unknown_base_type_low_level)  or else
				(a_value = xml_schemap_unknown_choice_child_low_level)  or else
				(a_value = xml_schemap_unknown_complexcontent_child_low_level)  or else
				(a_value = xml_schemap_unknown_complextype_child_low_level)  or else
				(a_value = xml_schemap_unknown_elem_child_low_level)  or else
				(a_value = xml_schemap_unknown_extension_child_low_level)  or else
				(a_value = xml_schemap_unknown_facet_child_low_level)  or else
				(a_value = xml_schemap_unknown_facet_type_low_level)  or else
				(a_value = xml_schemap_unknown_group_child_low_level)  or else
				(a_value = xml_schemap_unknown_import_child_low_level)  or else
				(a_value = xml_schemap_unknown_include_child_low_level)  or else
				(a_value = xml_schemap_unknown_list_child_low_level)  or else
				(a_value = xml_schemap_unknown_member_type_low_level)  or else
				(a_value = xml_schemap_unknown_notation_child_low_level)  or else
				(a_value = xml_schemap_unknown_prefix_low_level)  or else
				(a_value = xml_schemap_unknown_processcontent_child_low_level)  or else
				(a_value = xml_schemap_unknown_ref_low_level)  or else
				(a_value = xml_schemap_unknown_restriction_child_low_level)  or else
				(a_value = xml_schemap_unknown_schemas_child_low_level)  or else
				(a_value = xml_schemap_unknown_sequence_child_low_level)  or else
				(a_value = xml_schemap_unknown_simplecontent_child_low_level)  or else
				(a_value = xml_schemap_unknown_simpletype_child_low_level)  or else
				(a_value = xml_schemap_unknown_type_low_level)  or else
				(a_value = xml_schemap_unknown_union_child_low_level)  or else
				(a_value = xml_schemap_warn_attr_pointless_proh_low_level)  or else
				(a_value = xml_schemap_warn_attr_redecl_proh_low_level)  or else
				(a_value = xml_schemap_warn_skip_schema_low_level)  or else
				(a_value = xml_schemap_warn_unlocated_schema_low_level)  or else
				(a_value = xml_schemap_wildcard_invalid_ns_member_low_level)  or else
				(a_value = xml_schematronv_assert_low_level)  or else
				(a_value = xml_schematronv_report_low_level)  or else
				(a_value = xml_schemav_attrinvalid_low_level)  or else
				(a_value = xml_schemav_attrunknown_low_level)  or else
				(a_value = xml_schemav_construct_low_level)  or else
				(a_value = xml_schemav_cvc_attribute_1_low_level)  or else
				(a_value = xml_schemav_cvc_attribute_2_low_level)  or else
				(a_value = xml_schemav_cvc_attribute_3_low_level)  or else
				(a_value = xml_schemav_cvc_attribute_4_low_level)  or else
				(a_value = xml_schemav_cvc_au_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_1_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_2_1_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_2_2_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_2_3_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_2_4_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_3_1_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_3_2_1_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_3_2_2_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_4_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_5_1_low_level)  or else
				(a_value = xml_schemav_cvc_complex_type_5_2_low_level)  or else
				(a_value = xml_schemav_cvc_datatype_valid_1_2_1_low_level)  or else
				(a_value = xml_schemav_cvc_datatype_valid_1_2_2_low_level)  or else
				(a_value = xml_schemav_cvc_datatype_valid_1_2_3_low_level)  or else
				(a_value = xml_schemav_cvc_elt_1_low_level)  or else
				(a_value = xml_schemav_cvc_elt_2_low_level)  or else
				(a_value = xml_schemav_cvc_elt_3_1_low_level)  or else
				(a_value = xml_schemav_cvc_elt_3_2_1_low_level)  or else
				(a_value = xml_schemav_cvc_elt_3_2_2_low_level)  or else
				(a_value = xml_schemav_cvc_elt_4_1_low_level)  or else
				(a_value = xml_schemav_cvc_elt_4_2_low_level)  or else
				(a_value = xml_schemav_cvc_elt_4_3_low_level)  or else
				(a_value = xml_schemav_cvc_elt_5_1_1_low_level)  or else
				(a_value = xml_schemav_cvc_elt_5_1_2_low_level)  or else
				(a_value = xml_schemav_cvc_elt_5_2_1_low_level)  or else
				(a_value = xml_schemav_cvc_elt_5_2_2_1_low_level)  or else
				(a_value = xml_schemav_cvc_elt_5_2_2_2_1_low_level)  or else
				(a_value = xml_schemav_cvc_elt_5_2_2_2_2_low_level)  or else
				(a_value = xml_schemav_cvc_elt_6_low_level)  or else
				(a_value = xml_schemav_cvc_elt_7_low_level)  or else
				(a_value = xml_schemav_cvc_enumeration_valid_low_level)  or else
				(a_value = xml_schemav_cvc_facet_valid_low_level)  or else
				(a_value = xml_schemav_cvc_fractiondigits_valid_low_level)  or else
				(a_value = xml_schemav_cvc_idc_low_level)  or else
				(a_value = xml_schemav_cvc_length_valid_low_level)  or else
				(a_value = xml_schemav_cvc_maxexclusive_valid_low_level)  or else
				(a_value = xml_schemav_cvc_maxinclusive_valid_low_level)  or else
				(a_value = xml_schemav_cvc_maxlength_valid_low_level)  or else
				(a_value = xml_schemav_cvc_minexclusive_valid_low_level)  or else
				(a_value = xml_schemav_cvc_mininclusive_valid_low_level)  or else
				(a_value = xml_schemav_cvc_minlength_valid_low_level)  or else
				(a_value = xml_schemav_cvc_pattern_valid_low_level)  or else
				(a_value = xml_schemav_cvc_totaldigits_valid_low_level)  or else
				(a_value = xml_schemav_cvc_type_1_low_level)  or else
				(a_value = xml_schemav_cvc_type_2_low_level)  or else
				(a_value = xml_schemav_cvc_type_3_1_1_low_level)  or else
				(a_value = xml_schemav_cvc_type_3_1_2_low_level)  or else
				(a_value = xml_schemav_cvc_wildcard_low_level)  or else
				(a_value = xml_schemav_document_element_missing_low_level)  or else
				(a_value = xml_schemav_elemcont_low_level)  or else
				(a_value = xml_schemav_element_content_low_level)  or else
				(a_value = xml_schemav_extracontent_low_level)  or else
				(a_value = xml_schemav_facet_low_level)  or else
				(a_value = xml_schemav_havedefault_low_level)  or else
				(a_value = xml_schemav_internal_low_level)  or else
				(a_value = xml_schemav_invalidattr_low_level)  or else
				(a_value = xml_schemav_invalidelem_low_level)  or else
				(a_value = xml_schemav_isabstract_low_level)  or else
				(a_value = xml_schemav_misc_low_level)  or else
				(a_value = xml_schemav_missing_low_level)  or else
				(a_value = xml_schemav_norollback_low_level)  or else
				(a_value = xml_schemav_noroot_low_level)  or else
				(a_value = xml_schemav_notdeterminist_low_level)  or else
				(a_value = xml_schemav_notempty_low_level)  or else
				(a_value = xml_schemav_notnillable_low_level)  or else
				(a_value = xml_schemav_notsimple_low_level)  or else
				(a_value = xml_schemav_nottoplevel_low_level)  or else
				(a_value = xml_schemav_notype_low_level)  or else
				(a_value = xml_schemav_undeclaredelem_low_level)  or else
				(a_value = xml_schemav_value_low_level)  or else
				(a_value = xml_schemav_wrongelem_low_level)  or else
				(a_value = xml_tree_invalid_dec_low_level)  or else
				(a_value = xml_tree_invalid_hex_low_level)  or else
				(a_value = xml_tree_not_utf8_low_level)  or else
				(a_value = xml_tree_unterminated_entity_low_level)  or else
				(a_value = xml_war_catalog_pi_low_level)  or else
				(a_value = xml_war_entity_redefined_low_level)  or else
				(a_value = xml_war_lang_value_low_level)  or else
				(a_value = xml_war_ns_column_low_level)  or else
				(a_value = xml_war_ns_uri_low_level)  or else
				(a_value = xml_war_ns_uri_relative_low_level)  or else
				(a_value = xml_war_space_value_low_level)  or else
				(a_value = xml_war_undeclared_entity_low_level)  or else
				(a_value = xml_war_unknown_version_low_level)  or else
				(a_value = xml_xinclude_build_failed_low_level)  or else
				(a_value = xml_xinclude_deprecated_ns_low_level)  or else
				(a_value = xml_xinclude_entity_def_mismatch_low_level)  or else
				(a_value = xml_xinclude_fallback_not_in_include_low_level)  or else
				(a_value = xml_xinclude_fallbacks_in_include_low_level)  or else
				(a_value = xml_xinclude_fragment_id_low_level)  or else
				(a_value = xml_xinclude_href_uri_low_level)  or else
				(a_value = xml_xinclude_include_in_include_low_level)  or else
				(a_value = xml_xinclude_invalid_char_low_level)  or else
				(a_value = xml_xinclude_multiple_root_low_level)  or else
				(a_value = xml_xinclude_no_fallback_low_level)  or else
				(a_value = xml_xinclude_no_href_low_level)  or else
				(a_value = xml_xinclude_parse_value_low_level)  or else
				(a_value = xml_xinclude_recursion_low_level)  or else
				(a_value = xml_xinclude_text_document_low_level)  or else
				(a_value = xml_xinclude_text_fragment_low_level)  or else
				(a_value = xml_xinclude_unknown_encoding_low_level)  or else
				(a_value = xml_xinclude_xptr_failed_low_level)  or else
				(a_value = xml_xinclude_xptr_result_low_level)  or else
				(a_value = xml_xpath_encoding_error_low_level)  or else
				(a_value = xml_xpath_expr_error_low_level)  or else
				(a_value = xml_xpath_expression_ok_low_level)  or else
				(a_value = xml_xpath_invalid_arity_low_level)  or else
				(a_value = xml_xpath_invalid_char_error_low_level)  or else
				(a_value = xml_xpath_invalid_ctxt_position_low_level)  or else
				(a_value = xml_xpath_invalid_ctxt_size_low_level)  or else
				(a_value = xml_xpath_invalid_operand_low_level)  or else
				(a_value = xml_xpath_invalid_predicate_error_low_level)  or else
				(a_value = xml_xpath_invalid_type_low_level)  or else
				(a_value = xml_xpath_memory_error_low_level)  or else
				(a_value = xml_xpath_number_error_low_level)  or else
				(a_value = xml_xpath_start_literal_error_low_level)  or else
				(a_value = xml_xpath_unclosed_error_low_level)  or else
				(a_value = xml_xpath_undef_prefix_error_low_level)  or else
				(a_value = xml_xpath_undef_variable_error_low_level)  or else
				(a_value = xml_xpath_unfinished_literal_error_low_level)  or else
				(a_value = xml_xpath_unknown_func_error_low_level)  or else
				(a_value = xml_xpath_variable_ref_error_low_level)  or else
				(a_value = xml_xptr_childseq_start_low_level)  or else
				(a_value = xml_xptr_eval_failed_low_level)  or else
				(a_value = xml_xptr_extra_objects_low_level)  or else
				(a_value = xml_xptr_resource_error_low_level)  or else
				(a_value = xml_xptr_sub_resource_error_low_level)  or else
				(a_value = xml_xptr_syntax_error_low_level)  or else
				(a_value = xml_xptr_unknown_scheme_low_level) )
=======
create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = err_ok_low_level)  or else
				(a_value = err_internal_error_low_level)  or else
				(a_value = err_no_memory_low_level)  or else
				(a_value = err_document_start_low_level)  or else
				(a_value = err_document_empty_low_level)  or else
				(a_value = err_document_end_low_level)  or else
				(a_value = err_invalid_hex_charref_low_level)  or else
				(a_value = err_invalid_dec_charref_low_level)  or else
				(a_value = err_invalid_charref_low_level)  or else
				(a_value = err_invalid_char_low_level)  or else
				(a_value = err_charref_at_eof_low_level)  or else
				(a_value = err_charref_in_prolog_low_level)  or else
				(a_value = err_charref_in_epilog_low_level)  or else
				(a_value = err_charref_in_dtd_low_level)  or else
				(a_value = err_entityref_at_eof_low_level)  or else
				(a_value = err_entityref_in_prolog_low_level)  or else
				(a_value = err_entityref_in_epilog_low_level)  or else
				(a_value = err_entityref_in_dtd_low_level)  or else
				(a_value = err_peref_at_eof_low_level)  or else
				(a_value = err_peref_in_prolog_low_level)  or else
				(a_value = err_peref_in_epilog_low_level)  or else
				(a_value = err_peref_in_int_subset_low_level)  or else
				(a_value = err_entityref_no_name_low_level)  or else
				(a_value = err_entityref_semicol_missing_low_level)  or else
				(a_value = err_peref_no_name_low_level)  or else
				(a_value = err_peref_semicol_missing_low_level)  or else
				(a_value = err_undeclared_entity_low_level)  or else
				(a_value = war_undeclared_entity_low_level)  or else
				(a_value = err_unparsed_entity_low_level)  or else
				(a_value = err_entity_is_external_low_level)  or else
				(a_value = err_entity_is_parameter_low_level)  or else
				(a_value = err_unknown_encoding_low_level)  or else
				(a_value = err_unsupported_encoding_low_level)  or else
				(a_value = err_string_not_started_low_level)  or else
				(a_value = err_string_not_closed_low_level)  or else
				(a_value = err_ns_decl_error_low_level)  or else
				(a_value = err_entity_not_started_low_level)  or else
				(a_value = err_entity_not_finished_low_level)  or else
				(a_value = err_lt_in_attribute_low_level)  or else
				(a_value = err_attribute_not_started_low_level)  or else
				(a_value = err_attribute_not_finished_low_level)  or else
				(a_value = err_attribute_without_value_low_level)  or else
				(a_value = err_attribute_redefined_low_level)  or else
				(a_value = err_literal_not_started_low_level)  or else
				(a_value = err_literal_not_finished_low_level)  or else
				(a_value = err_comment_not_finished_low_level)  or else
				(a_value = err_pi_not_started_low_level)  or else
				(a_value = err_pi_not_finished_low_level)  or else
				(a_value = err_notation_not_started_low_level)  or else
				(a_value = err_notation_not_finished_low_level)  or else
				(a_value = err_attlist_not_started_low_level)  or else
				(a_value = err_attlist_not_finished_low_level)  or else
				(a_value = err_mixed_not_started_low_level)  or else
				(a_value = err_mixed_not_finished_low_level)  or else
				(a_value = err_elemcontent_not_started_low_level)  or else
				(a_value = err_elemcontent_not_finished_low_level)  or else
				(a_value = err_xmldecl_not_started_low_level)  or else
				(a_value = err_xmldecl_not_finished_low_level)  or else
				(a_value = err_condsec_not_started_low_level)  or else
				(a_value = err_condsec_not_finished_low_level)  or else
				(a_value = err_ext_subset_not_finished_low_level)  or else
				(a_value = err_doctype_not_finished_low_level)  or else
				(a_value = err_misplaced_cdata_end_low_level)  or else
				(a_value = err_cdata_not_finished_low_level)  or else
				(a_value = err_reserved_xml_name_low_level)  or else
				(a_value = err_space_required_low_level)  or else
				(a_value = err_separator_required_low_level)  or else
				(a_value = err_nmtoken_required_low_level)  or else
				(a_value = err_name_required_low_level)  or else
				(a_value = err_pcdata_required_low_level)  or else
				(a_value = err_uri_required_low_level)  or else
				(a_value = err_pubid_required_low_level)  or else
				(a_value = err_lt_required_low_level)  or else
				(a_value = err_gt_required_low_level)  or else
				(a_value = err_ltslash_required_low_level)  or else
				(a_value = err_equal_required_low_level)  or else
				(a_value = err_tag_name_mismatch_low_level)  or else
				(a_value = err_tag_not_finished_low_level)  or else
				(a_value = err_standalone_value_low_level)  or else
				(a_value = err_encoding_name_low_level)  or else
				(a_value = err_hyphen_in_comment_low_level)  or else
				(a_value = err_invalid_encoding_low_level)  or else
				(a_value = err_ext_entity_standalone_low_level)  or else
				(a_value = err_condsec_invalid_low_level)  or else
				(a_value = err_value_required_low_level)  or else
				(a_value = err_not_well_balanced_low_level)  or else
				(a_value = err_extra_content_low_level)  or else
				(a_value = err_entity_char_error_low_level)  or else
				(a_value = err_entity_pe_internal_low_level)  or else
				(a_value = err_entity_loop_low_level)  or else
				(a_value = err_entity_boundary_low_level)  or else
				(a_value = err_invalid_uri_low_level)  or else
				(a_value = err_uri_fragment_low_level)  or else
				(a_value = war_catalog_pi_low_level)  or else
				(a_value = err_no_dtd_low_level)  or else
				(a_value = err_condsec_invalid_keyword_low_level)  or else
				(a_value = err_version_missing_low_level)  or else
				(a_value = war_unknown_version_low_level)  or else
				(a_value = war_lang_value_low_level)  or else
				(a_value = war_ns_uri_low_level)  or else
				(a_value = war_ns_uri_relative_low_level)  or else
				(a_value = err_missing_encoding_low_level)  or else
				(a_value = war_space_value_low_level)  or else
				(a_value = err_not_standalone_low_level)  or else
				(a_value = err_entity_processing_low_level)  or else
				(a_value = err_notation_processing_low_level)  or else
				(a_value = war_ns_column_low_level)  or else
				(a_value = war_entity_redefined_low_level)  or else
				(a_value = err_unknown_version_low_level)  or else
				(a_value = err_version_mismatch_low_level)  or else
				(a_value = ns_err_xml_namespace_low_level)  or else
				(a_value = ns_err_undefined_namespace_low_level)  or else
				(a_value = ns_err_qname_low_level)  or else
				(a_value = ns_err_attribute_redefined_low_level)  or else
				(a_value = ns_err_empty_low_level)  or else
				(a_value = ns_err_colon_low_level)  or else
				(a_value = dtd_attribute_default_low_level)  or else
				(a_value = dtd_attribute_redefined_low_level)  or else
				(a_value = dtd_attribute_value_low_level)  or else
				(a_value = dtd_content_error_low_level)  or else
				(a_value = dtd_content_model_low_level)  or else
				(a_value = dtd_content_not_determinist_low_level)  or else
				(a_value = dtd_different_prefix_low_level)  or else
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
				(a_value = dtd_notation_redefined_low_level)  or else
				(a_value = dtd_notation_value_low_level)  or else
				(a_value = dtd_not_empty_low_level)  or else
				(a_value = dtd_not_pcdata_low_level)  or else
				(a_value = dtd_not_standalone_low_level)  or else
				(a_value = dtd_root_name_low_level)  or else
				(a_value = dtd_standalone_white_space_low_level)  or else
				(a_value = dtd_unknown_attribute_low_level)  or else
				(a_value = dtd_unknown_elem_low_level)  or else
				(a_value = dtd_unknown_entity_low_level)  or else
				(a_value = dtd_unknown_id_low_level)  or else
				(a_value = dtd_unknown_notation_low_level)  or else
				(a_value = dtd_standalone_defaulted_low_level)  or else
				(a_value = dtd_xmlid_value_low_level)  or else
				(a_value = dtd_xmlid_type_low_level)  or else
				(a_value = dtd_dup_token_low_level)  or else
				(a_value = html_strucure_error_low_level)  or else
				(a_value = html_unknown_tag_low_level)  or else
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
				(a_value = rngp_element_empty_low_level)  or else
				(a_value = rngp_element_content_low_level)  or else
				(a_value = rngp_element_name_low_level)  or else
				(a_value = rngp_element_no_content_low_level)  or else
				(a_value = rngp_elem_text_conflict_low_level)  or else
				(a_value = rngp_empty_low_level)  or else
				(a_value = rngp_empty_construct_low_level)  or else
				(a_value = rngp_empty_content_low_level)  or else
				(a_value = rngp_empty_not_empty_low_level)  or else
				(a_value = rngp_error_type_lib_low_level)  or else
				(a_value = rngp_except_empty_low_level)  or else
				(a_value = rngp_except_missing_low_level)  or else
				(a_value = rngp_except_multiple_low_level)  or else
				(a_value = rngp_except_no_content_low_level)  or else
				(a_value = rngp_externalref_emtpy_low_level)  or else
				(a_value = rngp_external_ref_failure_low_level)  or else
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
				(a_value = rngp_xmlns_name_low_level)  or else
				(a_value = rngp_xml_ns_low_level)  or else
				(a_value = xpath_expression_ok_low_level)  or else
				(a_value = xpath_number_error_low_level)  or else
				(a_value = xpath_unfinished_literal_error_low_level)  or else
				(a_value = xpath_start_literal_error_low_level)  or else
				(a_value = xpath_variable_ref_error_low_level)  or else
				(a_value = xpath_undef_variable_error_low_level)  or else
				(a_value = xpath_invalid_predicate_error_low_level)  or else
				(a_value = xpath_expr_error_low_level)  or else
				(a_value = xpath_unclosed_error_low_level)  or else
				(a_value = xpath_unknown_func_error_low_level)  or else
				(a_value = xpath_invalid_operand_low_level)  or else
				(a_value = xpath_invalid_type_low_level)  or else
				(a_value = xpath_invalid_arity_low_level)  or else
				(a_value = xpath_invalid_ctxt_size_low_level)  or else
				(a_value = xpath_invalid_ctxt_position_low_level)  or else
				(a_value = xpath_memory_error_low_level)  or else
				(a_value = xptr_syntax_error_low_level)  or else
				(a_value = xptr_resource_error_low_level)  or else
				(a_value = xptr_sub_resource_error_low_level)  or else
				(a_value = xpath_undef_prefix_error_low_level)  or else
				(a_value = xpath_encoding_error_low_level)  or else
				(a_value = xpath_invalid_char_error_low_level)  or else
				(a_value = tree_invalid_hex_low_level)  or else
				(a_value = tree_invalid_dec_low_level)  or else
				(a_value = tree_unterminated_entity_low_level)  or else
				(a_value = tree_not_utf8_low_level)  or else
				(a_value = save_not_utf8_low_level)  or else
				(a_value = save_char_invalid_low_level)  or else
				(a_value = save_no_doctype_low_level)  or else
				(a_value = save_unknown_encoding_low_level)  or else
				(a_value = regexp_compile_error_low_level)  or else
				(a_value = io_unknown_low_level)  or else
				(a_value = io_eacces_low_level)  or else
				(a_value = io_eagain_low_level)  or else
				(a_value = io_ebadf_low_level)  or else
				(a_value = io_ebadmsg_low_level)  or else
				(a_value = io_ebusy_low_level)  or else
				(a_value = io_ecanceled_low_level)  or else
				(a_value = io_echild_low_level)  or else
				(a_value = io_edeadlk_low_level)  or else
				(a_value = io_edom_low_level)  or else
				(a_value = io_eexist_low_level)  or else
				(a_value = io_efault_low_level)  or else
				(a_value = io_efbig_low_level)  or else
				(a_value = io_einprogress_low_level)  or else
				(a_value = io_eintr_low_level)  or else
				(a_value = io_einval_low_level)  or else
				(a_value = io_eio_low_level)  or else
				(a_value = io_eisdir_low_level)  or else
				(a_value = io_emfile_low_level)  or else
				(a_value = io_emlink_low_level)  or else
				(a_value = io_emsgsize_low_level)  or else
				(a_value = io_enametoolong_low_level)  or else
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
				(a_value = io_network_attempt_low_level)  or else
				(a_value = io_encoder_low_level)  or else
				(a_value = io_flush_low_level)  or else
				(a_value = io_write_low_level)  or else
				(a_value = io_no_input_low_level)  or else
				(a_value = io_buffer_full_low_level)  or else
				(a_value = io_load_error_low_level)  or else
				(a_value = io_enotsock_low_level)  or else
				(a_value = io_eisconn_low_level)  or else
				(a_value = io_econnrefused_low_level)  or else
				(a_value = io_enetunreach_low_level)  or else
				(a_value = io_eaddrinuse_low_level)  or else
				(a_value = io_ealready_low_level)  or else
				(a_value = io_eafnosupport_low_level)  or else
				(a_value = xinclude_recursion_low_level)  or else
				(a_value = xinclude_parse_value_low_level)  or else
				(a_value = xinclude_entity_def_mismatch_low_level)  or else
				(a_value = xinclude_no_href_low_level)  or else
				(a_value = xinclude_no_fallback_low_level)  or else
				(a_value = xinclude_href_uri_low_level)  or else
				(a_value = xinclude_text_fragment_low_level)  or else
				(a_value = xinclude_text_document_low_level)  or else
				(a_value = xinclude_invalid_char_low_level)  or else
				(a_value = xinclude_build_failed_low_level)  or else
				(a_value = xinclude_unknown_encoding_low_level)  or else
				(a_value = xinclude_multiple_root_low_level)  or else
				(a_value = xinclude_xptr_failed_low_level)  or else
				(a_value = xinclude_xptr_result_low_level)  or else
				(a_value = xinclude_include_in_include_low_level)  or else
				(a_value = xinclude_fallbacks_in_include_low_level)  or else
				(a_value = xinclude_fallback_not_in_include_low_level)  or else
				(a_value = xinclude_deprecated_ns_low_level)  or else
				(a_value = xinclude_fragment_id_low_level)  or else
				(a_value = catalog_missing_attr_low_level)  or else
				(a_value = catalog_entry_broken_low_level)  or else
				(a_value = catalog_prefer_value_low_level)  or else
				(a_value = catalog_not_catalog_low_level)  or else
				(a_value = catalog_recursion_low_level)  or else
				(a_value = schemap_prefix_undefined_low_level)  or else
				(a_value = schemap_attrformdefault_value_low_level)  or else
				(a_value = schemap_attrgrp_noname_noref_low_level)  or else
				(a_value = schemap_attr_noname_noref_low_level)  or else
				(a_value = schemap_complextype_noname_noref_low_level)  or else
				(a_value = schemap_elemformdefault_value_low_level)  or else
				(a_value = schemap_elem_noname_noref_low_level)  or else
				(a_value = schemap_extension_no_base_low_level)  or else
				(a_value = schemap_facet_no_value_low_level)  or else
				(a_value = schemap_failed_build_import_low_level)  or else
				(a_value = schemap_group_noname_noref_low_level)  or else
				(a_value = schemap_import_namespace_not_uri_low_level)  or else
				(a_value = schemap_import_redefine_nsname_low_level)  or else
				(a_value = schemap_import_schema_not_uri_low_level)  or else
				(a_value = schemap_invalid_boolean_low_level)  or else
				(a_value = schemap_invalid_enum_low_level)  or else
				(a_value = schemap_invalid_facet_low_level)  or else
				(a_value = schemap_invalid_facet_value_low_level)  or else
				(a_value = schemap_invalid_maxoccurs_low_level)  or else
				(a_value = schemap_invalid_minoccurs_low_level)  or else
				(a_value = schemap_invalid_ref_and_subtype_low_level)  or else
				(a_value = schemap_invalid_white_space_low_level)  or else
				(a_value = schemap_noattr_noref_low_level)  or else
				(a_value = schemap_notation_no_name_low_level)  or else
				(a_value = schemap_notype_noref_low_level)  or else
				(a_value = schemap_ref_and_subtype_low_level)  or else
				(a_value = schemap_restriction_noname_noref_low_level)  or else
				(a_value = schemap_simpletype_noname_low_level)  or else
				(a_value = schemap_type_and_subtype_low_level)  or else
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
				(a_value = schemap_unknown_list_child_low_level)  or else
				(a_value = schemap_unknown_notation_child_low_level)  or else
				(a_value = schemap_unknown_processcontent_child_low_level)  or else
				(a_value = schemap_unknown_ref_low_level)  or else
				(a_value = schemap_unknown_restriction_child_low_level)  or else
				(a_value = schemap_unknown_schemas_child_low_level)  or else
				(a_value = schemap_unknown_sequence_child_low_level)  or else
				(a_value = schemap_unknown_simplecontent_child_low_level)  or else
				(a_value = schemap_unknown_simpletype_child_low_level)  or else
				(a_value = schemap_unknown_type_low_level)  or else
				(a_value = schemap_unknown_union_child_low_level)  or else
				(a_value = schemap_elem_default_fixed_low_level)  or else
				(a_value = schemap_regexp_invalid_low_level)  or else
				(a_value = schemap_failed_load_low_level)  or else
				(a_value = schemap_nothing_to_parse_low_level)  or else
				(a_value = schemap_noroot_low_level)  or else
				(a_value = schemap_redefined_group_low_level)  or else
				(a_value = schemap_redefined_type_low_level)  or else
				(a_value = schemap_redefined_element_low_level)  or else
				(a_value = schemap_redefined_attrgroup_low_level)  or else
				(a_value = schemap_redefined_attr_low_level)  or else
				(a_value = schemap_redefined_notation_low_level)  or else
				(a_value = schemap_failed_parse_low_level)  or else
				(a_value = schemap_unknown_prefix_low_level)  or else
				(a_value = schemap_def_and_prefix_low_level)  or else
				(a_value = schemap_unknown_include_child_low_level)  or else
				(a_value = schemap_include_schema_not_uri_low_level)  or else
				(a_value = schemap_include_schema_no_uri_low_level)  or else
				(a_value = schemap_not_schema_low_level)  or else
				(a_value = schemap_unknown_member_type_low_level)  or else
				(a_value = schemap_invalid_attr_use_low_level)  or else
				(a_value = schemap_recursive_low_level)  or else
				(a_value = schemap_supernumerous_list_item_type_low_level)  or else
				(a_value = schemap_invalid_attr_combination_low_level)  or else
				(a_value = schemap_invalid_attr_inline_combination_low_level)  or else
				(a_value = schemap_missing_simpletype_child_low_level)  or else
				(a_value = schemap_invalid_attr_name_low_level)  or else
				(a_value = schemap_ref_and_content_low_level)  or else
				(a_value = schemap_ct_props_correct_1_low_level)  or else
				(a_value = schemap_ct_props_correct_2_low_level)  or else
				(a_value = schemap_ct_props_correct_3_low_level)  or else
				(a_value = schemap_ct_props_correct_4_low_level)  or else
				(a_value = schemap_ct_props_correct_5_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_1_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_2_1_1_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_2_1_2_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_2_2_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_3_low_level)  or else
				(a_value = schemap_wildcard_invalid_ns_member_low_level)  or else
				(a_value = schemap_intersection_not_expressible_low_level)  or else
				(a_value = schemap_union_not_expressible_low_level)  or else
				(a_value = schemap_src_import_3_1_low_level)  or else
				(a_value = schemap_src_import_3_2_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_4_1_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_4_2_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_4_3_low_level)  or else
				(a_value = schemap_cos_ct_extends_1_3_low_level)  or else
				(a_value = schemav_noroot_low_level)  or else
				(a_value = schemav_undeclaredelem_low_level)  or else
				(a_value = schemav_nottoplevel_low_level)  or else
				(a_value = schemav_missing_low_level)  or else
				(a_value = schemav_wrongelem_low_level)  or else
				(a_value = schemav_notype_low_level)  or else
				(a_value = schemav_norollback_low_level)  or else
				(a_value = schemav_isabstract_low_level)  or else
				(a_value = schemav_notempty_low_level)  or else
				(a_value = schemav_elemcont_low_level)  or else
				(a_value = schemav_havedefault_low_level)  or else
				(a_value = schemav_notnillable_low_level)  or else
				(a_value = schemav_extracontent_low_level)  or else
				(a_value = schemav_invalidattr_low_level)  or else
				(a_value = schemav_invalidelem_low_level)  or else
				(a_value = schemav_notdeterminist_low_level)  or else
				(a_value = schemav_construct_low_level)  or else
				(a_value = schemav_internal_low_level)  or else
				(a_value = schemav_notsimple_low_level)  or else
				(a_value = schemav_attrunknown_low_level)  or else
				(a_value = schemav_attrinvalid_low_level)  or else
				(a_value = schemav_value_low_level)  or else
				(a_value = schemav_facet_low_level)  or else
				(a_value = schemav_cvc_datatype_valid_1_2_1_low_level)  or else
				(a_value = schemav_cvc_datatype_valid_1_2_2_low_level)  or else
				(a_value = schemav_cvc_datatype_valid_1_2_3_low_level)  or else
				(a_value = schemav_cvc_type_3_1_1_low_level)  or else
				(a_value = schemav_cvc_type_3_1_2_low_level)  or else
				(a_value = schemav_cvc_facet_valid_low_level)  or else
				(a_value = schemav_cvc_length_valid_low_level)  or else
				(a_value = schemav_cvc_minlength_valid_low_level)  or else
				(a_value = schemav_cvc_maxlength_valid_low_level)  or else
				(a_value = schemav_cvc_mininclusive_valid_low_level)  or else
				(a_value = schemav_cvc_maxinclusive_valid_low_level)  or else
				(a_value = schemav_cvc_minexclusive_valid_low_level)  or else
				(a_value = schemav_cvc_maxexclusive_valid_low_level)  or else
				(a_value = schemav_cvc_totaldigits_valid_low_level)  or else
				(a_value = schemav_cvc_fractiondigits_valid_low_level)  or else
				(a_value = schemav_cvc_pattern_valid_low_level)  or else
				(a_value = schemav_cvc_enumeration_valid_low_level)  or else
				(a_value = schemav_cvc_complex_type_2_1_low_level)  or else
				(a_value = schemav_cvc_complex_type_2_2_low_level)  or else
				(a_value = schemav_cvc_complex_type_2_3_low_level)  or else
				(a_value = schemav_cvc_complex_type_2_4_low_level)  or else
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
				(a_value = schemav_cvc_attribute_1_low_level)  or else
				(a_value = schemav_cvc_attribute_2_low_level)  or else
				(a_value = schemav_cvc_attribute_3_low_level)  or else
				(a_value = schemav_cvc_attribute_4_low_level)  or else
				(a_value = schemav_cvc_complex_type_3_1_low_level)  or else
				(a_value = schemav_cvc_complex_type_3_2_1_low_level)  or else
				(a_value = schemav_cvc_complex_type_3_2_2_low_level)  or else
				(a_value = schemav_cvc_complex_type_4_low_level)  or else
				(a_value = schemav_cvc_complex_type_5_1_low_level)  or else
				(a_value = schemav_cvc_complex_type_5_2_low_level)  or else
				(a_value = schemav_element_content_low_level)  or else
				(a_value = schemav_document_element_missing_low_level)  or else
				(a_value = schemav_cvc_complex_type_1_low_level)  or else
				(a_value = schemav_cvc_au_low_level)  or else
				(a_value = schemav_cvc_type_1_low_level)  or else
				(a_value = schemav_cvc_type_2_low_level)  or else
				(a_value = schemav_cvc_idc_low_level)  or else
				(a_value = schemav_cvc_wildcard_low_level)  or else
				(a_value = schemav_misc_low_level)  or else
				(a_value = xptr_unknown_scheme_low_level)  or else
				(a_value = xptr_childseq_start_low_level)  or else
				(a_value = xptr_eval_failed_low_level)  or else
				(a_value = xptr_extra_objects_low_level)  or else
				(a_value = c14n_create_ctxt_low_level)  or else
				(a_value = c14n_requires_utf8_low_level)  or else
				(a_value = c14n_create_stack_low_level)  or else
				(a_value = c14n_invalid_node_low_level)  or else
				(a_value = c14n_unknow_node_low_level)  or else
				(a_value = c14n_relative_namespace_low_level)  or else
				(a_value = ftp_pasv_answer_low_level)  or else
				(a_value = ftp_epsv_answer_low_level)  or else
				(a_value = ftp_accnt_low_level)  or else
				(a_value = ftp_url_syntax_low_level)  or else
				(a_value = http_url_syntax_low_level)  or else
				(a_value = http_use_ip_low_level)  or else
				(a_value = http_unknown_host_low_level)  or else
				(a_value = schemap_src_simple_type_1_low_level)  or else
				(a_value = schemap_src_simple_type_2_low_level)  or else
				(a_value = schemap_src_simple_type_3_low_level)  or else
				(a_value = schemap_src_simple_type_4_low_level)  or else
				(a_value = schemap_src_resolve_low_level)  or else
				(a_value = schemap_src_restriction_base_or_simpletype_low_level)  or else
				(a_value = schemap_src_list_itemtype_or_simpletype_low_level)  or else
				(a_value = schemap_src_union_membertypes_or_simpletypes_low_level)  or else
				(a_value = schemap_st_props_correct_1_low_level)  or else
				(a_value = schemap_st_props_correct_2_low_level)  or else
				(a_value = schemap_st_props_correct_3_low_level)  or else
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
				(a_value = schemap_cos_st_restricts_3_3_2_2_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_2_1_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_2_3_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_2_4_low_level)  or else
				(a_value = schemap_cos_st_restricts_3_3_2_5_low_level)  or else
				(a_value = schemap_cos_st_derived_ok_2_1_low_level)  or else
				(a_value = schemap_cos_st_derived_ok_2_2_low_level)  or else
				(a_value = schemap_s4s_elem_not_allowed_low_level)  or else
				(a_value = schemap_s4s_elem_missing_low_level)  or else
				(a_value = schemap_s4s_attr_not_allowed_low_level)  or else
				(a_value = schemap_s4s_attr_missing_low_level)  or else
				(a_value = schemap_s4s_attr_invalid_value_low_level)  or else
				(a_value = schemap_src_element_1_low_level)  or else
				(a_value = schemap_src_element_2_1_low_level)  or else
				(a_value = schemap_src_element_2_2_low_level)  or else
				(a_value = schemap_src_element_3_low_level)  or else
				(a_value = schemap_p_props_correct_1_low_level)  or else
				(a_value = schemap_p_props_correct_2_1_low_level)  or else
				(a_value = schemap_p_props_correct_2_2_low_level)  or else
				(a_value = schemap_e_props_correct_2_low_level)  or else
				(a_value = schemap_e_props_correct_3_low_level)  or else
				(a_value = schemap_e_props_correct_4_low_level)  or else
				(a_value = schemap_e_props_correct_5_low_level)  or else
				(a_value = schemap_e_props_correct_6_low_level)  or else
				(a_value = schemap_src_include_low_level)  or else
				(a_value = schemap_src_attribute_1_low_level)  or else
				(a_value = schemap_src_attribute_2_low_level)  or else
				(a_value = schemap_src_attribute_3_1_low_level)  or else
				(a_value = schemap_src_attribute_3_2_low_level)  or else
				(a_value = schemap_src_attribute_4_low_level)  or else
				(a_value = schemap_no_xmlns_low_level)  or else
				(a_value = schemap_no_xsi_low_level)  or else
				(a_value = schemap_cos_valid_default_1_low_level)  or else
				(a_value = schemap_cos_valid_default_2_1_low_level)  or else
				(a_value = schemap_cos_valid_default_2_2_1_low_level)  or else
				(a_value = schemap_cos_valid_default_2_2_2_low_level)  or else
				(a_value = schemap_cvc_simple_type_low_level)  or else
				(a_value = schemap_cos_ct_extends_1_1_low_level)  or else
				(a_value = schemap_src_import_1_1_low_level)  or else
				(a_value = schemap_src_import_1_2_low_level)  or else
				(a_value = schemap_src_import_2_low_level)  or else
				(a_value = schemap_src_import_2_1_low_level)  or else
				(a_value = schemap_src_import_2_2_low_level)  or else
				(a_value = schemap_internal_low_level)  or else
				(a_value = schemap_not_deterministic_low_level)  or else
				(a_value = schemap_src_attribute_group_1_low_level)  or else
				(a_value = schemap_src_attribute_group_2_low_level)  or else
				(a_value = schemap_src_attribute_group_3_low_level)  or else
				(a_value = schemap_mg_props_correct_1_low_level)  or else
				(a_value = schemap_mg_props_correct_2_low_level)  or else
				(a_value = schemap_src_ct_1_low_level)  or else
				(a_value = schemap_derivation_ok_restriction_2_1_3_low_level)  or else
				(a_value = schemap_au_props_correct_2_low_level)  or else
				(a_value = schemap_a_props_correct_2_low_level)  or else
				(a_value = schemap_c_props_correct_low_level)  or else
				(a_value = schemap_src_redefine_low_level)  or else
				(a_value = schemap_src_import_low_level)  or else
				(a_value = schemap_warn_skip_schema_low_level)  or else
				(a_value = schemap_warn_unlocated_schema_low_level)  or else
				(a_value = schemap_warn_attr_redecl_proh_low_level)  or else
				(a_value = schemap_warn_attr_pointless_proh_low_level)  or else
				(a_value = schemap_ag_props_correct_low_level)  or else
				(a_value = schemap_cos_ct_extends_1_2_low_level)  or else
				(a_value = schemap_au_props_correct_low_level)  or else
				(a_value = schemap_a_props_correct_3_low_level)  or else
				(a_value = schemap_cos_all_limited_low_level)  or else
				(a_value = schematronv_assert_low_level)  or else
				(a_value = schematronv_report_low_level)  or else
				(a_value = module_open_low_level)  or else
				(a_value = module_close_low_level)  or else
				(a_value = check_found_element_low_level)  or else
				(a_value = check_found_attribute_low_level)  or else
				(a_value = check_found_text_low_level)  or else
				(a_value = check_found_cdata_low_level)  or else
				(a_value = check_found_entityref_low_level)  or else
				(a_value = check_found_entity_low_level)  or else
				(a_value = check_found_pi_low_level)  or else
				(a_value = check_found_comment_low_level)  or else
				(a_value = check_found_doctype_low_level)  or else
				(a_value = check_found_fragment_low_level)  or else
				(a_value = check_found_notation_low_level)  or else
				(a_value = check_unknown_node_low_level)  or else
				(a_value = check_entity_type_low_level)  or else
				(a_value = check_no_parent_low_level)  or else
				(a_value = check_no_doc_low_level)  or else
				(a_value = check_no_name_low_level)  or else
				(a_value = check_no_elem_low_level)  or else
				(a_value = check_wrong_doc_low_level)  or else
				(a_value = check_no_prev_low_level)  or else
				(a_value = check_wrong_prev_low_level)  or else
				(a_value = check_no_next_low_level)  or else
				(a_value = check_wrong_next_low_level)  or else
				(a_value = check_not_dtd_low_level)  or else
				(a_value = check_not_attr_low_level)  or else
				(a_value = check_not_attr_decl_low_level)  or else
				(a_value = check_not_elem_decl_low_level)  or else
				(a_value = check_not_entity_decl_low_level)  or else
				(a_value = check_not_ns_decl_low_level)  or else
				(a_value = check_no_href_low_level)  or else
				(a_value = check_wrong_parent_low_level)  or else
				(a_value = check_ns_scope_low_level)  or else
				(a_value = check_ns_ancestor_low_level)  or else
				(a_value = check_not_utf8_low_level)  or else
				(a_value = check_no_dict_low_level)  or else
				(a_value = check_not_ncname_low_level)  or else
				(a_value = check_outside_dict_low_level)  or else
				(a_value = check_wrong_name_low_level)  or else
				(a_value = check_name_not_null_low_level)  or else
				(a_value = i18n_no_name_low_level)  or else
				(a_value = i18n_no_handler_low_level)  or else
				(a_value = i18n_excess_handler_low_level)  or else
				(a_value = i18n_conv_failed_low_level)  or else
				(a_value = i18n_no_output_low_level) )
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		end

feature {ANY} -- Setters
	default_create,
	set_xml_c14n_create_ctxt is
		do
			value := xml_c14n_create_ctxt_low_level
		end

	set_xml_c14n_create_stack is
		do
			value := xml_c14n_create_stack_low_level
		end

	set_xml_c14n_invalid_node is
		do
			value := xml_c14n_invalid_node_low_level
		end

	set_xml_c14n_relative_namespace is
		do
			value := xml_c14n_relative_namespace_low_level
		end

	set_xml_c14n_requires_utf8 is
		do
			value := xml_c14n_requires_utf8_low_level
		end

	set_xml_c14n_unknow_node is
		do
			value := xml_c14n_unknow_node_low_level
		end

	set_xml_catalog_entry_broken is
		do
			value := xml_catalog_entry_broken_low_level
		end

	set_xml_catalog_missing_attr is
		do
			value := xml_catalog_missing_attr_low_level
		end

	set_xml_catalog_not_catalog is
		do
			value := xml_catalog_not_catalog_low_level
		end

	set_xml_catalog_prefer_value is
		do
			value := xml_catalog_prefer_value_low_level
		end

	set_xml_catalog_recursion is
		do
			value := xml_catalog_recursion_low_level
		end

	set_xml_check_entity_type is
		do
			value := xml_check_entity_type_low_level
		end

	set_xml_check_found_attribute is
		do
			value := xml_check_found_attribute_low_level
		end

	set_xml_check_found_cdata is
		do
			value := xml_check_found_cdata_low_level
		end

	set_xml_check_found_comment is
		do
			value := xml_check_found_comment_low_level
		end

	set_xml_check_found_doctype is
		do
			value := xml_check_found_doctype_low_level
		end

	set_xml_check_found_element is
		do
			value := xml_check_found_element_low_level
		end

	set_xml_check_found_entity is
		do
			value := xml_check_found_entity_low_level
		end

	set_xml_check_found_entityref is
		do
			value := xml_check_found_entityref_low_level
		end

	set_xml_check_found_fragment is
		do
			value := xml_check_found_fragment_low_level
		end

	set_xml_check_found_notation is
		do
			value := xml_check_found_notation_low_level
		end

	set_xml_check_found_pi is
		do
			value := xml_check_found_pi_low_level
		end

	set_xml_check_found_text is
		do
			value := xml_check_found_text_low_level
		end

	set_xml_check_name_not_null is
		do
			value := xml_check_name_not_null_low_level
		end

	set_xml_check_no_dict is
		do
			value := xml_check_no_dict_low_level
		end

	set_xml_check_no_doc is
		do
			value := xml_check_no_doc_low_level
		end

	set_xml_check_no_elem is
		do
			value := xml_check_no_elem_low_level
		end

	set_xml_check_no_href is
		do
			value := xml_check_no_href_low_level
		end

	set_xml_check_no_name is
		do
			value := xml_check_no_name_low_level
		end

	set_xml_check_no_next is
		do
			value := xml_check_no_next_low_level
		end

	set_xml_check_no_parent is
		do
			value := xml_check_no_parent_low_level
		end

	set_xml_check_no_prev is
		do
			value := xml_check_no_prev_low_level
		end

	set_xml_check_not_attr is
		do
			value := xml_check_not_attr_low_level
		end

	set_xml_check_not_attr_decl is
		do
			value := xml_check_not_attr_decl_low_level
		end

	set_xml_check_not_dtd is
		do
			value := xml_check_not_dtd_low_level
		end

	set_xml_check_not_elem_decl is
		do
			value := xml_check_not_elem_decl_low_level
		end

	set_xml_check_not_entity_decl is
		do
			value := xml_check_not_entity_decl_low_level
		end

	set_xml_check_not_ncname is
		do
			value := xml_check_not_ncname_low_level
		end

	set_xml_check_not_ns_decl is
		do
			value := xml_check_not_ns_decl_low_level
		end

	set_xml_check_not_utf8 is
		do
			value := xml_check_not_utf8_low_level
		end

	set_xml_check_ns_ancestor is
		do
			value := xml_check_ns_ancestor_low_level
		end

	set_xml_check_ns_scope is
		do
			value := xml_check_ns_scope_low_level
		end

	set_xml_check_outside_dict is
		do
			value := xml_check_outside_dict_low_level
		end

	set_xml_check_unknown_node is
		do
			value := xml_check_unknown_node_low_level
		end

	set_xml_check_wrong_doc is
		do
			value := xml_check_wrong_doc_low_level
		end

	set_xml_check_wrong_name is
		do
			value := xml_check_wrong_name_low_level
		end

	set_xml_check_wrong_next is
		do
			value := xml_check_wrong_next_low_level
		end

	set_xml_check_wrong_parent is
		do
			value := xml_check_wrong_parent_low_level
		end

	set_xml_check_wrong_prev is
		do
			value := xml_check_wrong_prev_low_level
		end

	set_xml_dtd_attribute_default is
		do
			value := xml_dtd_attribute_default_low_level
		end

	set_xml_dtd_attribute_redefined is
		do
			value := xml_dtd_attribute_redefined_low_level
		end

	set_xml_dtd_attribute_value is
		do
			value := xml_dtd_attribute_value_low_level
		end

	set_xml_dtd_content_error is
		do
			value := xml_dtd_content_error_low_level
		end

	set_xml_dtd_content_model is
		do
			value := xml_dtd_content_model_low_level
		end

	set_xml_dtd_content_not_determinist is
		do
			value := xml_dtd_content_not_determinist_low_level
		end

	set_xml_dtd_different_prefix is
		do
			value := xml_dtd_different_prefix_low_level
		end

	set_xml_dtd_dup_token is
		do
			value := xml_dtd_dup_token_low_level
		end

	set_xml_dtd_elem_default_namespace is
		do
			value := xml_dtd_elem_default_namespace_low_level
		end

	set_xml_dtd_elem_namespace is
		do
			value := xml_dtd_elem_namespace_low_level
		end

	set_xml_dtd_elem_redefined is
		do
			value := xml_dtd_elem_redefined_low_level
		end

	set_xml_dtd_empty_notation is
		do
			value := xml_dtd_empty_notation_low_level
		end

	set_xml_dtd_entity_type is
		do
			value := xml_dtd_entity_type_low_level
		end

	set_xml_dtd_id_fixed is
		do
			value := xml_dtd_id_fixed_low_level
		end

	set_xml_dtd_id_redefined is
		do
			value := xml_dtd_id_redefined_low_level
		end

	set_xml_dtd_id_subset is
		do
			value := xml_dtd_id_subset_low_level
		end

	set_xml_dtd_invalid_child is
		do
			value := xml_dtd_invalid_child_low_level
		end

	set_xml_dtd_invalid_default is
		do
			value := xml_dtd_invalid_default_low_level
		end

	set_xml_dtd_load_error is
		do
			value := xml_dtd_load_error_low_level
		end

	set_xml_dtd_missing_attribute is
		do
			value := xml_dtd_missing_attribute_low_level
		end

	set_xml_dtd_mixed_corrupt is
		do
			value := xml_dtd_mixed_corrupt_low_level
		end

	set_xml_dtd_multiple_id is
		do
			value := xml_dtd_multiple_id_low_level
		end

	set_xml_dtd_no_doc is
		do
			value := xml_dtd_no_doc_low_level
		end

	set_xml_dtd_no_dtd is
		do
			value := xml_dtd_no_dtd_low_level
		end

	set_xml_dtd_no_elem_name is
		do
			value := xml_dtd_no_elem_name_low_level
		end

	set_xml_dtd_no_prefix is
		do
			value := xml_dtd_no_prefix_low_level
		end

	set_xml_dtd_no_root is
		do
			value := xml_dtd_no_root_low_level
		end

	set_xml_dtd_not_empty is
		do
			value := xml_dtd_not_empty_low_level
		end

	set_xml_dtd_not_pcdata is
		do
			value := xml_dtd_not_pcdata_low_level
		end

	set_xml_dtd_not_standalone is
		do
			value := xml_dtd_not_standalone_low_level
		end

	set_xml_dtd_notation_redefined is
		do
			value := xml_dtd_notation_redefined_low_level
		end

	set_xml_dtd_notation_value is
		do
			value := xml_dtd_notation_value_low_level
		end

	set_xml_dtd_root_name is
		do
			value := xml_dtd_root_name_low_level
		end

	set_xml_dtd_standalone_defaulted is
		do
			value := xml_dtd_standalone_defaulted_low_level
		end

	set_xml_dtd_standalone_white_space is
		do
			value := xml_dtd_standalone_white_space_low_level
		end

	set_xml_dtd_unknown_attribute is
		do
			value := xml_dtd_unknown_attribute_low_level
		end

	set_xml_dtd_unknown_elem is
		do
			value := xml_dtd_unknown_elem_low_level
		end

	set_xml_dtd_unknown_entity is
		do
			value := xml_dtd_unknown_entity_low_level
		end

	set_xml_dtd_unknown_id is
		do
			value := xml_dtd_unknown_id_low_level
		end

	set_xml_dtd_unknown_notation is
		do
			value := xml_dtd_unknown_notation_low_level
		end

	set_xml_dtd_xmlid_type is
		do
			value := xml_dtd_xmlid_type_low_level
		end

	set_xml_dtd_xmlid_value is
		do
			value := xml_dtd_xmlid_value_low_level
		end

	set_xml_err_attlist_not_finished is
		do
			value := xml_err_attlist_not_finished_low_level
		end

	set_xml_err_attlist_not_started is
		do
			value := xml_err_attlist_not_started_low_level
		end

	set_xml_err_attribute_not_finished is
		do
			value := xml_err_attribute_not_finished_low_level
		end

	set_xml_err_attribute_not_started is
		do
			value := xml_err_attribute_not_started_low_level
		end

	set_xml_err_attribute_redefined is
		do
			value := xml_err_attribute_redefined_low_level
		end

	set_xml_err_attribute_without_value is
		do
			value := xml_err_attribute_without_value_low_level
		end

	set_xml_err_cdata_not_finished is
		do
			value := xml_err_cdata_not_finished_low_level
		end

	set_xml_err_charref_at_eof is
		do
			value := xml_err_charref_at_eof_low_level
		end

	set_xml_err_charref_in_dtd is
		do
			value := xml_err_charref_in_dtd_low_level
		end

	set_xml_err_charref_in_epilog is
		do
			value := xml_err_charref_in_epilog_low_level
		end

	set_xml_err_charref_in_prolog is
		do
			value := xml_err_charref_in_prolog_low_level
		end

	set_xml_err_comment_not_finished is
		do
			value := xml_err_comment_not_finished_low_level
		end

	set_xml_err_condsec_invalid is
		do
			value := xml_err_condsec_invalid_low_level
		end

	set_xml_err_condsec_invalid_keyword is
		do
			value := xml_err_condsec_invalid_keyword_low_level
		end

	set_xml_err_condsec_not_finished is
		do
			value := xml_err_condsec_not_finished_low_level
		end

	set_xml_err_condsec_not_started is
		do
			value := xml_err_condsec_not_started_low_level
		end

	set_xml_err_doctype_not_finished is
		do
			value := xml_err_doctype_not_finished_low_level
		end

	set_xml_err_document_empty is
		do
			value := xml_err_document_empty_low_level
		end

	set_xml_err_document_end is
		do
			value := xml_err_document_end_low_level
		end

	set_xml_err_document_start is
		do
			value := xml_err_document_start_low_level
		end

	set_xml_err_elemcontent_not_finished is
		do
			value := xml_err_elemcontent_not_finished_low_level
		end

	set_xml_err_elemcontent_not_started is
		do
			value := xml_err_elemcontent_not_started_low_level
		end

	set_xml_err_encoding_name is
		do
			value := xml_err_encoding_name_low_level
		end

	set_xml_err_entity_boundary is
		do
			value := xml_err_entity_boundary_low_level
		end

	set_xml_err_entity_char_error is
		do
			value := xml_err_entity_char_error_low_level
		end

	set_xml_err_entity_is_external is
		do
			value := xml_err_entity_is_external_low_level
		end

	set_xml_err_entity_is_parameter is
		do
			value := xml_err_entity_is_parameter_low_level
		end

	set_xml_err_entity_loop is
		do
			value := xml_err_entity_loop_low_level
		end

	set_xml_err_entity_not_finished is
		do
			value := xml_err_entity_not_finished_low_level
		end

	set_xml_err_entity_not_started is
		do
			value := xml_err_entity_not_started_low_level
		end

	set_xml_err_entity_pe_internal is
		do
			value := xml_err_entity_pe_internal_low_level
		end

	set_xml_err_entity_processing is
		do
			value := xml_err_entity_processing_low_level
		end

	set_xml_err_entityref_at_eof is
		do
			value := xml_err_entityref_at_eof_low_level
		end

	set_xml_err_entityref_in_dtd is
		do
			value := xml_err_entityref_in_dtd_low_level
		end

	set_xml_err_entityref_in_epilog is
		do
			value := xml_err_entityref_in_epilog_low_level
		end

	set_xml_err_entityref_in_prolog is
		do
			value := xml_err_entityref_in_prolog_low_level
		end

	set_xml_err_entityref_no_name is
		do
			value := xml_err_entityref_no_name_low_level
		end

	set_xml_err_entityref_semicol_missing is
		do
			value := xml_err_entityref_semicol_missing_low_level
		end

	set_xml_err_equal_required is
		do
			value := xml_err_equal_required_low_level
		end

	set_xml_err_ext_entity_standalone is
		do
			value := xml_err_ext_entity_standalone_low_level
		end

	set_xml_err_ext_subset_not_finished is
		do
			value := xml_err_ext_subset_not_finished_low_level
		end

	set_xml_err_extra_content is
		do
			value := xml_err_extra_content_low_level
		end

	set_xml_err_gt_required is
		do
			value := xml_err_gt_required_low_level
		end

	set_xml_err_hyphen_in_comment is
		do
			value := xml_err_hyphen_in_comment_low_level
		end

	set_xml_err_internal_error is
		do
			value := xml_err_internal_error_low_level
		end

	set_xml_err_invalid_char is
		do
			value := xml_err_invalid_char_low_level
		end

	set_xml_err_invalid_charref is
		do
			value := xml_err_invalid_charref_low_level
		end

	set_xml_err_invalid_dec_charref is
		do
			value := xml_err_invalid_dec_charref_low_level
		end

	set_xml_err_invalid_encoding is
		do
			value := xml_err_invalid_encoding_low_level
		end

	set_xml_err_invalid_hex_charref is
		do
			value := xml_err_invalid_hex_charref_low_level
		end

	set_xml_err_invalid_uri is
		do
			value := xml_err_invalid_uri_low_level
		end

	set_xml_err_literal_not_finished is
		do
			value := xml_err_literal_not_finished_low_level
		end

	set_xml_err_literal_not_started is
		do
			value := xml_err_literal_not_started_low_level
		end

	set_xml_err_lt_in_attribute is
		do
			value := xml_err_lt_in_attribute_low_level
		end

	set_xml_err_lt_required is
		do
			value := xml_err_lt_required_low_level
		end

	set_xml_err_ltslash_required is
		do
			value := xml_err_ltslash_required_low_level
		end

	set_xml_err_misplaced_cdata_end is
		do
			value := xml_err_misplaced_cdata_end_low_level
		end

	set_xml_err_missing_encoding is
		do
			value := xml_err_missing_encoding_low_level
		end

	set_xml_err_mixed_not_finished is
		do
			value := xml_err_mixed_not_finished_low_level
		end

	set_xml_err_mixed_not_started is
		do
			value := xml_err_mixed_not_started_low_level
		end

	set_xml_err_name_required is
		do
			value := xml_err_name_required_low_level
		end

	set_xml_err_nmtoken_required is
		do
			value := xml_err_nmtoken_required_low_level
		end

	set_xml_err_no_dtd is
		do
			value := xml_err_no_dtd_low_level
		end

	set_xml_err_no_memory is
		do
			value := xml_err_no_memory_low_level
		end

	set_xml_err_not_standalone is
		do
			value := xml_err_not_standalone_low_level
		end

	set_xml_err_not_well_balanced is
		do
			value := xml_err_not_well_balanced_low_level
		end

	set_xml_err_notation_not_finished is
		do
			value := xml_err_notation_not_finished_low_level
		end

	set_xml_err_notation_not_started is
		do
			value := xml_err_notation_not_started_low_level
		end

	set_xml_err_notation_processing is
		do
			value := xml_err_notation_processing_low_level
		end

	set_xml_err_ns_decl_error is
		do
			value := xml_err_ns_decl_error_low_level
		end

	set_xml_err_ok is
		do
			value := xml_err_ok_low_level
		end

	set_xml_err_pcdata_required is
		do
			value := xml_err_pcdata_required_low_level
		end

	set_xml_err_peref_at_eof is
		do
			value := xml_err_peref_at_eof_low_level
		end

	set_xml_err_peref_in_epilog is
		do
			value := xml_err_peref_in_epilog_low_level
		end

	set_xml_err_peref_in_int_subset is
		do
			value := xml_err_peref_in_int_subset_low_level
		end

	set_xml_err_peref_in_prolog is
		do
			value := xml_err_peref_in_prolog_low_level
		end

	set_xml_err_peref_no_name is
		do
			value := xml_err_peref_no_name_low_level
		end

	set_xml_err_peref_semicol_missing is
		do
			value := xml_err_peref_semicol_missing_low_level
		end

	set_xml_err_pi_not_finished is
		do
			value := xml_err_pi_not_finished_low_level
		end

	set_xml_err_pi_not_started is
		do
			value := xml_err_pi_not_started_low_level
		end

	set_xml_err_pubid_required is
		do
			value := xml_err_pubid_required_low_level
		end

	set_xml_err_reserved_xml_name is
		do
			value := xml_err_reserved_xml_name_low_level
		end

	set_xml_err_separator_required is
		do
			value := xml_err_separator_required_low_level
		end

	set_xml_err_space_required is
		do
			value := xml_err_space_required_low_level
		end

	set_xml_err_standalone_value is
		do
			value := xml_err_standalone_value_low_level
		end

	set_xml_err_string_not_closed is
		do
			value := xml_err_string_not_closed_low_level
		end

	set_xml_err_string_not_started is
		do
			value := xml_err_string_not_started_low_level
		end

	set_xml_err_tag_name_mismatch is
		do
			value := xml_err_tag_name_mismatch_low_level
		end

	set_xml_err_tag_not_finished is
		do
			value := xml_err_tag_not_finished_low_level
		end

	set_xml_err_undeclared_entity is
		do
			value := xml_err_undeclared_entity_low_level
		end

	set_xml_err_unknown_encoding is
		do
			value := xml_err_unknown_encoding_low_level
		end

	set_xml_err_unknown_version is
		do
			value := xml_err_unknown_version_low_level
		end

	set_xml_err_unparsed_entity is
		do
			value := xml_err_unparsed_entity_low_level
		end

	set_xml_err_unsupported_encoding is
		do
			value := xml_err_unsupported_encoding_low_level
		end

	set_xml_err_uri_fragment is
		do
			value := xml_err_uri_fragment_low_level
		end

	set_xml_err_uri_required is
		do
			value := xml_err_uri_required_low_level
		end

	set_xml_err_value_required is
		do
			value := xml_err_value_required_low_level
		end

	set_xml_err_version_mismatch is
		do
			value := xml_err_version_mismatch_low_level
		end

	set_xml_err_version_missing is
		do
			value := xml_err_version_missing_low_level
		end

	set_xml_err_xmldecl_not_finished is
		do
			value := xml_err_xmldecl_not_finished_low_level
		end

	set_xml_err_xmldecl_not_started is
		do
			value := xml_err_xmldecl_not_started_low_level
		end

	set_xml_ftp_accnt is
		do
			value := xml_ftp_accnt_low_level
		end

	set_xml_ftp_epsv_answer is
		do
			value := xml_ftp_epsv_answer_low_level
		end

	set_xml_ftp_pasv_answer is
		do
			value := xml_ftp_pasv_answer_low_level
		end

	set_xml_ftp_url_syntax is
		do
			value := xml_ftp_url_syntax_low_level
		end

	set_xml_html_strucure_error is
		do
			value := xml_html_strucure_error_low_level
		end

	set_xml_html_unknown_tag is
		do
			value := xml_html_unknown_tag_low_level
		end

	set_xml_http_unknown_host is
		do
			value := xml_http_unknown_host_low_level
		end

	set_xml_http_url_syntax is
		do
			value := xml_http_url_syntax_low_level
		end

	set_xml_http_use_ip is
		do
			value := xml_http_use_ip_low_level
		end

	set_xml_i18n_conv_failed is
		do
			value := xml_i18n_conv_failed_low_level
		end

	set_xml_i18n_excess_handler is
		do
			value := xml_i18n_excess_handler_low_level
		end

	set_xml_i18n_no_handler is
		do
			value := xml_i18n_no_handler_low_level
		end

	set_xml_i18n_no_name is
		do
			value := xml_i18n_no_name_low_level
		end

	set_xml_i18n_no_output is
		do
			value := xml_i18n_no_output_low_level
		end

	set_xml_io_buffer_full is
		do
			value := xml_io_buffer_full_low_level
		end

	set_xml_io_eacces is
		do
			value := xml_io_eacces_low_level
		end

	set_xml_io_eaddrinuse is
		do
			value := xml_io_eaddrinuse_low_level
		end

	set_xml_io_eafnosupport is
		do
			value := xml_io_eafnosupport_low_level
		end

	set_xml_io_eagain is
		do
			value := xml_io_eagain_low_level
		end

	set_xml_io_ealready is
		do
			value := xml_io_ealready_low_level
		end

	set_xml_io_ebadf is
		do
			value := xml_io_ebadf_low_level
		end

	set_xml_io_ebadmsg is
		do
			value := xml_io_ebadmsg_low_level
		end

	set_xml_io_ebusy is
		do
			value := xml_io_ebusy_low_level
		end

	set_xml_io_ecanceled is
		do
			value := xml_io_ecanceled_low_level
		end

	set_xml_io_echild is
		do
			value := xml_io_echild_low_level
		end

	set_xml_io_econnrefused is
		do
			value := xml_io_econnrefused_low_level
		end

	set_xml_io_edeadlk is
		do
			value := xml_io_edeadlk_low_level
		end

	set_xml_io_edom is
		do
			value := xml_io_edom_low_level
		end

	set_xml_io_eexist is
		do
			value := xml_io_eexist_low_level
		end

	set_xml_io_efault is
		do
			value := xml_io_efault_low_level
		end

	set_xml_io_efbig is
		do
			value := xml_io_efbig_low_level
		end

	set_xml_io_einprogress is
		do
			value := xml_io_einprogress_low_level
		end

	set_xml_io_eintr is
		do
			value := xml_io_eintr_low_level
		end

	set_xml_io_einval is
		do
			value := xml_io_einval_low_level
		end

	set_xml_io_eio is
		do
			value := xml_io_eio_low_level
		end

	set_xml_io_eisconn is
		do
			value := xml_io_eisconn_low_level
		end

	set_xml_io_eisdir is
		do
			value := xml_io_eisdir_low_level
		end

	set_xml_io_emfile is
		do
			value := xml_io_emfile_low_level
		end

	set_xml_io_emlink is
		do
			value := xml_io_emlink_low_level
		end

	set_xml_io_emsgsize is
		do
			value := xml_io_emsgsize_low_level
		end

	set_xml_io_enametoolong is
		do
			value := xml_io_enametoolong_low_level
		end

	set_xml_io_encoder is
		do
			value := xml_io_encoder_low_level
		end

	set_xml_io_enetunreach is
		do
			value := xml_io_enetunreach_low_level
		end

	set_xml_io_enfile is
		do
			value := xml_io_enfile_low_level
		end

	set_xml_io_enodev is
		do
			value := xml_io_enodev_low_level
		end

	set_xml_io_enoent is
		do
			value := xml_io_enoent_low_level
		end

	set_xml_io_enoexec is
		do
			value := xml_io_enoexec_low_level
		end

	set_xml_io_enolck is
		do
			value := xml_io_enolck_low_level
		end

	set_xml_io_enomem is
		do
			value := xml_io_enomem_low_level
		end

	set_xml_io_enospc is
		do
			value := xml_io_enospc_low_level
		end

	set_xml_io_enosys is
		do
			value := xml_io_enosys_low_level
		end

	set_xml_io_enotdir is
		do
			value := xml_io_enotdir_low_level
		end

	set_xml_io_enotempty is
		do
			value := xml_io_enotempty_low_level
		end

	set_xml_io_enotsock is
		do
			value := xml_io_enotsock_low_level
		end

	set_xml_io_enotsup is
		do
			value := xml_io_enotsup_low_level
		end

	set_xml_io_enotty is
		do
			value := xml_io_enotty_low_level
		end

	set_xml_io_enxio is
		do
			value := xml_io_enxio_low_level
		end

	set_xml_io_eperm is
		do
			value := xml_io_eperm_low_level
		end

	set_xml_io_epipe is
		do
			value := xml_io_epipe_low_level
		end

	set_xml_io_erange is
		do
			value := xml_io_erange_low_level
		end

	set_xml_io_erofs is
		do
			value := xml_io_erofs_low_level
		end

	set_xml_io_espipe is
		do
			value := xml_io_espipe_low_level
		end

	set_xml_io_esrch is
		do
			value := xml_io_esrch_low_level
		end

	set_xml_io_etimedout is
		do
			value := xml_io_etimedout_low_level
		end

	set_xml_io_exdev is
		do
			value := xml_io_exdev_low_level
		end

	set_xml_io_flush is
		do
			value := xml_io_flush_low_level
		end

	set_xml_io_load_error is
		do
			value := xml_io_load_error_low_level
		end

	set_xml_io_network_attempt is
		do
			value := xml_io_network_attempt_low_level
		end

	set_xml_io_no_input is
		do
			value := xml_io_no_input_low_level
		end

	set_xml_io_unknown is
		do
			value := xml_io_unknown_low_level
		end

	set_xml_io_write is
		do
			value := xml_io_write_low_level
		end

	set_xml_module_close is
		do
			value := xml_module_close_low_level
		end

	set_xml_module_open is
		do
			value := xml_module_open_low_level
		end

	set_xml_ns_err_attribute_redefined is
		do
			value := xml_ns_err_attribute_redefined_low_level
		end

	set_xml_ns_err_colon is
		do
			value := xml_ns_err_colon_low_level
		end

	set_xml_ns_err_empty is
		do
			value := xml_ns_err_empty_low_level
		end

	set_xml_ns_err_qname is
		do
			value := xml_ns_err_qname_low_level
		end

	set_xml_ns_err_undefined_namespace is
		do
			value := xml_ns_err_undefined_namespace_low_level
		end

	set_xml_ns_err_xml_namespace is
		do
			value := xml_ns_err_xml_namespace_low_level
		end

	set_xml_regexp_compile_error is
		do
			value := xml_regexp_compile_error_low_level
		end

	set_xml_rngp_anyname_attr_ancestor is
		do
			value := xml_rngp_anyname_attr_ancestor_low_level
		end

	set_xml_rngp_attr_conflict is
		do
			value := xml_rngp_attr_conflict_low_level
		end

	set_xml_rngp_attribute_children is
		do
			value := xml_rngp_attribute_children_low_level
		end

	set_xml_rngp_attribute_content is
		do
			value := xml_rngp_attribute_content_low_level
		end

	set_xml_rngp_attribute_empty is
		do
			value := xml_rngp_attribute_empty_low_level
		end

	set_xml_rngp_attribute_noop is
		do
			value := xml_rngp_attribute_noop_low_level
		end

	set_xml_rngp_choice_content is
		do
			value := xml_rngp_choice_content_low_level
		end

	set_xml_rngp_choice_empty is
		do
			value := xml_rngp_choice_empty_low_level
		end

	set_xml_rngp_create_failure is
		do
			value := xml_rngp_create_failure_low_level
		end

	set_xml_rngp_data_content is
		do
			value := xml_rngp_data_content_low_level
		end

	set_xml_rngp_def_choice_and_interleave is
		do
			value := xml_rngp_def_choice_and_interleave_low_level
		end

	set_xml_rngp_define_create_failed is
		do
			value := xml_rngp_define_create_failed_low_level
		end

	set_xml_rngp_define_empty is
		do
			value := xml_rngp_define_empty_low_level
		end

	set_xml_rngp_define_missing is
		do
			value := xml_rngp_define_missing_low_level
		end

	set_xml_rngp_define_name_missing is
		do
			value := xml_rngp_define_name_missing_low_level
		end

	set_xml_rngp_elem_content_empty is
		do
			value := xml_rngp_elem_content_empty_low_level
		end

	set_xml_rngp_elem_content_error is
		do
			value := xml_rngp_elem_content_error_low_level
		end

	set_xml_rngp_elem_text_conflict is
		do
			value := xml_rngp_elem_text_conflict_low_level
		end

	set_xml_rngp_element_content is
		do
			value := xml_rngp_element_content_low_level
		end

	set_xml_rngp_element_empty is
		do
			value := xml_rngp_element_empty_low_level
		end

	set_xml_rngp_element_name is
		do
			value := xml_rngp_element_name_low_level
		end

	set_xml_rngp_element_no_content is
		do
			value := xml_rngp_element_no_content_low_level
		end

	set_xml_rngp_empty is
		do
			value := xml_rngp_empty_low_level
		end

	set_xml_rngp_empty_construct is
		do
			value := xml_rngp_empty_construct_low_level
		end

	set_xml_rngp_empty_content is
		do
			value := xml_rngp_empty_content_low_level
		end

	set_xml_rngp_empty_not_empty is
		do
			value := xml_rngp_empty_not_empty_low_level
		end

	set_xml_rngp_error_type_lib is
		do
			value := xml_rngp_error_type_lib_low_level
		end

	set_xml_rngp_except_empty is
		do
			value := xml_rngp_except_empty_low_level
		end

	set_xml_rngp_except_missing is
		do
			value := xml_rngp_except_missing_low_level
		end

	set_xml_rngp_except_multiple is
		do
			value := xml_rngp_except_multiple_low_level
		end

	set_xml_rngp_except_no_content is
		do
			value := xml_rngp_except_no_content_low_level
		end

	set_xml_rngp_external_ref_failure is
		do
			value := xml_rngp_external_ref_failure_low_level
		end

	set_xml_rngp_externalref_emtpy is
		do
			value := xml_rngp_externalref_emtpy_low_level
		end

	set_xml_rngp_externalref_recurse is
		do
			value := xml_rngp_externalref_recurse_low_level
		end

	set_xml_rngp_forbidden_attribute is
		do
			value := xml_rngp_forbidden_attribute_low_level
		end

	set_xml_rngp_foreign_element is
		do
			value := xml_rngp_foreign_element_low_level
		end

	set_xml_rngp_grammar_content is
		do
			value := xml_rngp_grammar_content_low_level
		end

	set_xml_rngp_grammar_empty is
		do
			value := xml_rngp_grammar_empty_low_level
		end

	set_xml_rngp_grammar_missing is
		do
			value := xml_rngp_grammar_missing_low_level
		end

	set_xml_rngp_grammar_no_start is
		do
			value := xml_rngp_grammar_no_start_low_level
		end

	set_xml_rngp_group_attr_conflict is
		do
			value := xml_rngp_group_attr_conflict_low_level
		end

	set_xml_rngp_href_error is
		do
			value := xml_rngp_href_error_low_level
		end

	set_xml_rngp_include_empty is
		do
			value := xml_rngp_include_empty_low_level
		end

	set_xml_rngp_include_failure is
		do
			value := xml_rngp_include_failure_low_level
		end

	set_xml_rngp_include_recurse is
		do
			value := xml_rngp_include_recurse_low_level
		end

	set_xml_rngp_interleave_add is
		do
			value := xml_rngp_interleave_add_low_level
		end

	set_xml_rngp_interleave_create_failed is
		do
			value := xml_rngp_interleave_create_failed_low_level
		end

	set_xml_rngp_interleave_empty is
		do
			value := xml_rngp_interleave_empty_low_level
		end

	set_xml_rngp_interleave_no_content is
		do
			value := xml_rngp_interleave_no_content_low_level
		end

	set_xml_rngp_invalid_define_name is
		do
			value := xml_rngp_invalid_define_name_low_level
		end

	set_xml_rngp_invalid_uri is
		do
			value := xml_rngp_invalid_uri_low_level
		end

	set_xml_rngp_invalid_value is
		do
			value := xml_rngp_invalid_value_low_level
		end

	set_xml_rngp_missing_href is
		do
			value := xml_rngp_missing_href_low_level
		end

	set_xml_rngp_name_missing is
		do
			value := xml_rngp_name_missing_low_level
		end

	set_xml_rngp_need_combine is
		do
			value := xml_rngp_need_combine_low_level
		end

	set_xml_rngp_notallowed_not_empty is
		do
			value := xml_rngp_notallowed_not_empty_low_level
		end

	set_xml_rngp_nsname_attr_ancestor is
		do
			value := xml_rngp_nsname_attr_ancestor_low_level
		end

	set_xml_rngp_nsname_no_ns is
		do
			value := xml_rngp_nsname_no_ns_low_level
		end

	set_xml_rngp_param_forbidden is
		do
			value := xml_rngp_param_forbidden_low_level
		end

	set_xml_rngp_param_name_missing is
		do
			value := xml_rngp_param_name_missing_low_level
		end

	set_xml_rngp_parentref_create_failed is
		do
			value := xml_rngp_parentref_create_failed_low_level
		end

	set_xml_rngp_parentref_name_invalid is
		do
			value := xml_rngp_parentref_name_invalid_low_level
		end

	set_xml_rngp_parentref_no_name is
		do
			value := xml_rngp_parentref_no_name_low_level
		end

	set_xml_rngp_parentref_no_parent is
		do
			value := xml_rngp_parentref_no_parent_low_level
		end

	set_xml_rngp_parentref_not_empty is
		do
			value := xml_rngp_parentref_not_empty_low_level
		end

	set_xml_rngp_parse_error is
		do
			value := xml_rngp_parse_error_low_level
		end

	set_xml_rngp_pat_anyname_except_anyname is
		do
			value := xml_rngp_pat_anyname_except_anyname_low_level
		end

	set_xml_rngp_pat_attr_attr is
		do
			value := xml_rngp_pat_attr_attr_low_level
		end

	set_xml_rngp_pat_attr_elem is
		do
			value := xml_rngp_pat_attr_elem_low_level
		end

	set_xml_rngp_pat_data_except_attr is
		do
			value := xml_rngp_pat_data_except_attr_low_level
		end

	set_xml_rngp_pat_data_except_elem is
		do
			value := xml_rngp_pat_data_except_elem_low_level
		end

	set_xml_rngp_pat_data_except_empty is
		do
			value := xml_rngp_pat_data_except_empty_low_level
		end

	set_xml_rngp_pat_data_except_group is
		do
			value := xml_rngp_pat_data_except_group_low_level
		end

	set_xml_rngp_pat_data_except_interleave is
		do
			value := xml_rngp_pat_data_except_interleave_low_level
		end

	set_xml_rngp_pat_data_except_list is
		do
			value := xml_rngp_pat_data_except_list_low_level
		end

	set_xml_rngp_pat_data_except_onemore is
		do
			value := xml_rngp_pat_data_except_onemore_low_level
		end

	set_xml_rngp_pat_data_except_ref is
		do
			value := xml_rngp_pat_data_except_ref_low_level
		end

	set_xml_rngp_pat_data_except_text is
		do
			value := xml_rngp_pat_data_except_text_low_level
		end

	set_xml_rngp_pat_list_attr is
		do
			value := xml_rngp_pat_list_attr_low_level
		end

	set_xml_rngp_pat_list_elem is
		do
			value := xml_rngp_pat_list_elem_low_level
		end

	set_xml_rngp_pat_list_interleave is
		do
			value := xml_rngp_pat_list_interleave_low_level
		end

	set_xml_rngp_pat_list_list is
		do
			value := xml_rngp_pat_list_list_low_level
		end

	set_xml_rngp_pat_list_ref is
		do
			value := xml_rngp_pat_list_ref_low_level
		end

	set_xml_rngp_pat_list_text is
		do
			value := xml_rngp_pat_list_text_low_level
		end

	set_xml_rngp_pat_nsname_except_anyname is
		do
			value := xml_rngp_pat_nsname_except_anyname_low_level
		end

	set_xml_rngp_pat_nsname_except_nsname is
		do
			value := xml_rngp_pat_nsname_except_nsname_low_level
		end

	set_xml_rngp_pat_onemore_group_attr is
		do
			value := xml_rngp_pat_onemore_group_attr_low_level
		end

	set_xml_rngp_pat_onemore_interleave_attr is
		do
			value := xml_rngp_pat_onemore_interleave_attr_low_level
		end

	set_xml_rngp_pat_start_attr is
		do
			value := xml_rngp_pat_start_attr_low_level
		end

	set_xml_rngp_pat_start_data is
		do
			value := xml_rngp_pat_start_data_low_level
		end

	set_xml_rngp_pat_start_empty is
		do
			value := xml_rngp_pat_start_empty_low_level
		end

	set_xml_rngp_pat_start_group is
		do
			value := xml_rngp_pat_start_group_low_level
		end

	set_xml_rngp_pat_start_interleave is
		do
			value := xml_rngp_pat_start_interleave_low_level
		end

	set_xml_rngp_pat_start_list is
		do
			value := xml_rngp_pat_start_list_low_level
		end

	set_xml_rngp_pat_start_onemore is
		do
			value := xml_rngp_pat_start_onemore_low_level
		end

	set_xml_rngp_pat_start_text is
		do
			value := xml_rngp_pat_start_text_low_level
		end

	set_xml_rngp_pat_start_value is
		do
			value := xml_rngp_pat_start_value_low_level
		end

	set_xml_rngp_prefix_undefined is
		do
			value := xml_rngp_prefix_undefined_low_level
		end

	set_xml_rngp_ref_create_failed is
		do
			value := xml_rngp_ref_create_failed_low_level
		end

	set_xml_rngp_ref_cycle is
		do
			value := xml_rngp_ref_cycle_low_level
		end

	set_xml_rngp_ref_name_invalid is
		do
			value := xml_rngp_ref_name_invalid_low_level
		end

	set_xml_rngp_ref_no_def is
		do
			value := xml_rngp_ref_no_def_low_level
		end

	set_xml_rngp_ref_no_name is
		do
			value := xml_rngp_ref_no_name_low_level
		end

	set_xml_rngp_ref_not_empty is
		do
			value := xml_rngp_ref_not_empty_low_level
		end

	set_xml_rngp_start_choice_and_interleave is
		do
			value := xml_rngp_start_choice_and_interleave_low_level
		end

	set_xml_rngp_start_content is
		do
			value := xml_rngp_start_content_low_level
		end

	set_xml_rngp_start_empty is
		do
			value := xml_rngp_start_empty_low_level
		end

	set_xml_rngp_start_missing is
		do
			value := xml_rngp_start_missing_low_level
		end

	set_xml_rngp_text_expected is
		do
			value := xml_rngp_text_expected_low_level
		end

	set_xml_rngp_text_has_child is
		do
			value := xml_rngp_text_has_child_low_level
		end

	set_xml_rngp_type_missing is
		do
			value := xml_rngp_type_missing_low_level
		end

	set_xml_rngp_type_not_found is
		do
			value := xml_rngp_type_not_found_low_level
		end

	set_xml_rngp_type_value is
		do
			value := xml_rngp_type_value_low_level
		end

	set_xml_rngp_unknown_attribute is
		do
			value := xml_rngp_unknown_attribute_low_level
		end

	set_xml_rngp_unknown_combine is
		do
			value := xml_rngp_unknown_combine_low_level
		end

	set_xml_rngp_unknown_construct is
		do
			value := xml_rngp_unknown_construct_low_level
		end

	set_xml_rngp_unknown_type_lib is
		do
			value := xml_rngp_unknown_type_lib_low_level
		end

	set_xml_rngp_uri_fragment is
		do
			value := xml_rngp_uri_fragment_low_level
		end

	set_xml_rngp_uri_not_absolute is
		do
			value := xml_rngp_uri_not_absolute_low_level
		end

	set_xml_rngp_value_empty is
		do
			value := xml_rngp_value_empty_low_level
		end

	set_xml_rngp_value_no_content is
		do
			value := xml_rngp_value_no_content_low_level
		end

	set_xml_rngp_xml_ns is
		do
			value := xml_rngp_xml_ns_low_level
		end

	set_xml_rngp_xmlns_name is
		do
			value := xml_rngp_xmlns_name_low_level
		end

	set_xml_save_char_invalid is
		do
			value := xml_save_char_invalid_low_level
		end

	set_xml_save_no_doctype is
		do
			value := xml_save_no_doctype_low_level
		end

	set_xml_save_not_utf8 is
		do
			value := xml_save_not_utf8_low_level
		end

	set_xml_save_unknown_encoding is
		do
			value := xml_save_unknown_encoding_low_level
		end

	set_xml_schemap_a_props_correct_2 is
		do
			value := xml_schemap_a_props_correct_2_low_level
		end

	set_xml_schemap_a_props_correct_3 is
		do
			value := xml_schemap_a_props_correct_3_low_level
		end

	set_xml_schemap_ag_props_correct is
		do
			value := xml_schemap_ag_props_correct_low_level
		end

	set_xml_schemap_attr_noname_noref is
		do
			value := xml_schemap_attr_noname_noref_low_level
		end

	set_xml_schemap_attrformdefault_value is
		do
			value := xml_schemap_attrformdefault_value_low_level
		end

	set_xml_schemap_attrgrp_noname_noref is
		do
			value := xml_schemap_attrgrp_noname_noref_low_level
		end

	set_xml_schemap_au_props_correct is
		do
			value := xml_schemap_au_props_correct_low_level
		end

	set_xml_schemap_au_props_correct_2 is
		do
			value := xml_schemap_au_props_correct_2_low_level
		end

	set_xml_schemap_c_props_correct is
		do
			value := xml_schemap_c_props_correct_low_level
		end

	set_xml_schemap_complextype_noname_noref is
		do
			value := xml_schemap_complextype_noname_noref_low_level
		end

	set_xml_schemap_cos_all_limited is
		do
			value := xml_schemap_cos_all_limited_low_level
		end

	set_xml_schemap_cos_ct_extends_1_1 is
		do
			value := xml_schemap_cos_ct_extends_1_1_low_level
		end

	set_xml_schemap_cos_ct_extends_1_2 is
		do
			value := xml_schemap_cos_ct_extends_1_2_low_level
		end

	set_xml_schemap_cos_ct_extends_1_3 is
		do
			value := xml_schemap_cos_ct_extends_1_3_low_level
		end

	set_xml_schemap_cos_st_derived_ok_2_1 is
		do
			value := xml_schemap_cos_st_derived_ok_2_1_low_level
		end

	set_xml_schemap_cos_st_derived_ok_2_2 is
		do
			value := xml_schemap_cos_st_derived_ok_2_2_low_level
		end

	set_xml_schemap_cos_st_restricts_1_1 is
		do
			value := xml_schemap_cos_st_restricts_1_1_low_level
		end

	set_xml_schemap_cos_st_restricts_1_2 is
		do
			value := xml_schemap_cos_st_restricts_1_2_low_level
		end

	set_xml_schemap_cos_st_restricts_1_3_1 is
		do
			value := xml_schemap_cos_st_restricts_1_3_1_low_level
		end

	set_xml_schemap_cos_st_restricts_1_3_2 is
		do
			value := xml_schemap_cos_st_restricts_1_3_2_low_level
		end

	set_xml_schemap_cos_st_restricts_2_1 is
		do
			value := xml_schemap_cos_st_restricts_2_1_low_level
		end

	set_xml_schemap_cos_st_restricts_2_3_1_1 is
		do
			value := xml_schemap_cos_st_restricts_2_3_1_1_low_level
		end

	set_xml_schemap_cos_st_restricts_2_3_1_2 is
		do
			value := xml_schemap_cos_st_restricts_2_3_1_2_low_level
		end

	set_xml_schemap_cos_st_restricts_2_3_2_1 is
		do
			value := xml_schemap_cos_st_restricts_2_3_2_1_low_level
		end

	set_xml_schemap_cos_st_restricts_2_3_2_2 is
		do
			value := xml_schemap_cos_st_restricts_2_3_2_2_low_level
		end

	set_xml_schemap_cos_st_restricts_2_3_2_3 is
		do
			value := xml_schemap_cos_st_restricts_2_3_2_3_low_level
		end

	set_xml_schemap_cos_st_restricts_2_3_2_4 is
		do
			value := xml_schemap_cos_st_restricts_2_3_2_4_low_level
		end

	set_xml_schemap_cos_st_restricts_2_3_2_5 is
		do
			value := xml_schemap_cos_st_restricts_2_3_2_5_low_level
		end

	set_xml_schemap_cos_st_restricts_3_1 is
		do
			value := xml_schemap_cos_st_restricts_3_1_low_level
		end

	set_xml_schemap_cos_st_restricts_3_3_1 is
		do
			value := xml_schemap_cos_st_restricts_3_3_1_low_level
		end

	set_xml_schemap_cos_st_restricts_3_3_1_2 is
		do
			value := xml_schemap_cos_st_restricts_3_3_1_2_low_level
		end

	set_xml_schemap_cos_st_restricts_3_3_2_1 is
		do
			value := xml_schemap_cos_st_restricts_3_3_2_1_low_level
		end

	set_xml_schemap_cos_st_restricts_3_3_2_2 is
		do
			value := xml_schemap_cos_st_restricts_3_3_2_2_low_level
		end

	set_xml_schemap_cos_st_restricts_3_3_2_3 is
		do
			value := xml_schemap_cos_st_restricts_3_3_2_3_low_level
		end

	set_xml_schemap_cos_st_restricts_3_3_2_4 is
		do
			value := xml_schemap_cos_st_restricts_3_3_2_4_low_level
		end

	set_xml_schemap_cos_st_restricts_3_3_2_5 is
		do
			value := xml_schemap_cos_st_restricts_3_3_2_5_low_level
		end

	set_xml_schemap_cos_valid_default_1 is
		do
			value := xml_schemap_cos_valid_default_1_low_level
		end

	set_xml_schemap_cos_valid_default_2_1 is
		do
			value := xml_schemap_cos_valid_default_2_1_low_level
		end

	set_xml_schemap_cos_valid_default_2_2_1 is
		do
			value := xml_schemap_cos_valid_default_2_2_1_low_level
		end

	set_xml_schemap_cos_valid_default_2_2_2 is
		do
			value := xml_schemap_cos_valid_default_2_2_2_low_level
		end

	set_xml_schemap_ct_props_correct_1 is
		do
			value := xml_schemap_ct_props_correct_1_low_level
		end

	set_xml_schemap_ct_props_correct_2 is
		do
			value := xml_schemap_ct_props_correct_2_low_level
		end

	set_xml_schemap_ct_props_correct_3 is
		do
			value := xml_schemap_ct_props_correct_3_low_level
		end

	set_xml_schemap_ct_props_correct_4 is
		do
			value := xml_schemap_ct_props_correct_4_low_level
		end

	set_xml_schemap_ct_props_correct_5 is
		do
			value := xml_schemap_ct_props_correct_5_low_level
		end

	set_xml_schemap_cvc_simple_type is
		do
			value := xml_schemap_cvc_simple_type_low_level
		end

	set_xml_schemap_def_and_prefix is
		do
			value := xml_schemap_def_and_prefix_low_level
		end

	set_xml_schemap_derivation_ok_restriction_1 is
		do
			value := xml_schemap_derivation_ok_restriction_1_low_level
		end

	set_xml_schemap_derivation_ok_restriction_2_1_1 is
		do
			value := xml_schemap_derivation_ok_restriction_2_1_1_low_level
		end

	set_xml_schemap_derivation_ok_restriction_2_1_2 is
		do
			value := xml_schemap_derivation_ok_restriction_2_1_2_low_level
		end

	set_xml_schemap_derivation_ok_restriction_2_1_3 is
		do
			value := xml_schemap_derivation_ok_restriction_2_1_3_low_level
		end

	set_xml_schemap_derivation_ok_restriction_2_2 is
		do
			value := xml_schemap_derivation_ok_restriction_2_2_low_level
		end

	set_xml_schemap_derivation_ok_restriction_3 is
		do
			value := xml_schemap_derivation_ok_restriction_3_low_level
		end

	set_xml_schemap_derivation_ok_restriction_4_1 is
		do
			value := xml_schemap_derivation_ok_restriction_4_1_low_level
		end

	set_xml_schemap_derivation_ok_restriction_4_2 is
		do
			value := xml_schemap_derivation_ok_restriction_4_2_low_level
		end

	set_xml_schemap_derivation_ok_restriction_4_3 is
		do
			value := xml_schemap_derivation_ok_restriction_4_3_low_level
		end

	set_xml_schemap_e_props_correct_2 is
		do
			value := xml_schemap_e_props_correct_2_low_level
		end

	set_xml_schemap_e_props_correct_3 is
		do
			value := xml_schemap_e_props_correct_3_low_level
		end

	set_xml_schemap_e_props_correct_4 is
		do
			value := xml_schemap_e_props_correct_4_low_level
		end

	set_xml_schemap_e_props_correct_5 is
		do
			value := xml_schemap_e_props_correct_5_low_level
		end

	set_xml_schemap_e_props_correct_6 is
		do
			value := xml_schemap_e_props_correct_6_low_level
		end

	set_xml_schemap_elem_default_fixed is
		do
			value := xml_schemap_elem_default_fixed_low_level
		end

	set_xml_schemap_elem_noname_noref is
		do
			value := xml_schemap_elem_noname_noref_low_level
		end

	set_xml_schemap_elemformdefault_value is
		do
			value := xml_schemap_elemformdefault_value_low_level
		end

	set_xml_schemap_extension_no_base is
		do
			value := xml_schemap_extension_no_base_low_level
		end

	set_xml_schemap_facet_no_value is
		do
			value := xml_schemap_facet_no_value_low_level
		end

	set_xml_schemap_failed_build_import is
		do
			value := xml_schemap_failed_build_import_low_level
		end

	set_xml_schemap_failed_load is
		do
			value := xml_schemap_failed_load_low_level
		end

	set_xml_schemap_failed_parse is
		do
			value := xml_schemap_failed_parse_low_level
		end

	set_xml_schemap_group_noname_noref is
		do
			value := xml_schemap_group_noname_noref_low_level
		end

	set_xml_schemap_import_namespace_not_uri is
		do
			value := xml_schemap_import_namespace_not_uri_low_level
		end

	set_xml_schemap_import_redefine_nsname is
		do
			value := xml_schemap_import_redefine_nsname_low_level
		end

	set_xml_schemap_import_schema_not_uri is
		do
			value := xml_schemap_import_schema_not_uri_low_level
		end

	set_xml_schemap_include_schema_no_uri is
		do
			value := xml_schemap_include_schema_no_uri_low_level
		end

	set_xml_schemap_include_schema_not_uri is
		do
			value := xml_schemap_include_schema_not_uri_low_level
		end

	set_xml_schemap_internal is
		do
			value := xml_schemap_internal_low_level
		end

	set_xml_schemap_intersection_not_expressible is
		do
			value := xml_schemap_intersection_not_expressible_low_level
		end

	set_xml_schemap_invalid_attr_combination is
		do
			value := xml_schemap_invalid_attr_combination_low_level
		end

	set_xml_schemap_invalid_attr_inline_combination is
		do
			value := xml_schemap_invalid_attr_inline_combination_low_level
		end

	set_xml_schemap_invalid_attr_name is
		do
			value := xml_schemap_invalid_attr_name_low_level
		end

	set_xml_schemap_invalid_attr_use is
		do
			value := xml_schemap_invalid_attr_use_low_level
		end

	set_xml_schemap_invalid_boolean is
		do
			value := xml_schemap_invalid_boolean_low_level
		end

	set_xml_schemap_invalid_enum is
		do
			value := xml_schemap_invalid_enum_low_level
		end

	set_xml_schemap_invalid_facet is
		do
			value := xml_schemap_invalid_facet_low_level
		end

	set_xml_schemap_invalid_facet_value is
		do
			value := xml_schemap_invalid_facet_value_low_level
		end

	set_xml_schemap_invalid_maxoccurs is
		do
			value := xml_schemap_invalid_maxoccurs_low_level
		end

	set_xml_schemap_invalid_minoccurs is
		do
			value := xml_schemap_invalid_minoccurs_low_level
		end

	set_xml_schemap_invalid_ref_and_subtype is
		do
			value := xml_schemap_invalid_ref_and_subtype_low_level
		end

	set_xml_schemap_invalid_white_space is
		do
			value := xml_schemap_invalid_white_space_low_level
		end

	set_xml_schemap_mg_props_correct_1 is
		do
			value := xml_schemap_mg_props_correct_1_low_level
		end

	set_xml_schemap_mg_props_correct_2 is
		do
			value := xml_schemap_mg_props_correct_2_low_level
		end

	set_xml_schemap_missing_simpletype_child is
		do
			value := xml_schemap_missing_simpletype_child_low_level
		end

	set_xml_schemap_no_xmlns is
		do
			value := xml_schemap_no_xmlns_low_level
		end

	set_xml_schemap_no_xsi is
		do
			value := xml_schemap_no_xsi_low_level
		end

	set_xml_schemap_noattr_noref is
		do
			value := xml_schemap_noattr_noref_low_level
		end

	set_xml_schemap_noroot is
		do
			value := xml_schemap_noroot_low_level
		end

	set_xml_schemap_not_deterministic is
		do
			value := xml_schemap_not_deterministic_low_level
		end

	set_xml_schemap_not_schema is
		do
			value := xml_schemap_not_schema_low_level
		end

	set_xml_schemap_notation_no_name is
		do
			value := xml_schemap_notation_no_name_low_level
		end

	set_xml_schemap_nothing_to_parse is
		do
			value := xml_schemap_nothing_to_parse_low_level
		end

	set_xml_schemap_notype_noref is
		do
			value := xml_schemap_notype_noref_low_level
		end

	set_xml_schemap_p_props_correct_1 is
		do
			value := xml_schemap_p_props_correct_1_low_level
		end

	set_xml_schemap_p_props_correct_2_1 is
		do
			value := xml_schemap_p_props_correct_2_1_low_level
		end

	set_xml_schemap_p_props_correct_2_2 is
		do
			value := xml_schemap_p_props_correct_2_2_low_level
		end

	set_xml_schemap_prefix_undefined is
		do
			value := xml_schemap_prefix_undefined_low_level
		end

	set_xml_schemap_recursive is
		do
			value := xml_schemap_recursive_low_level
		end

	set_xml_schemap_redefined_attr is
		do
			value := xml_schemap_redefined_attr_low_level
		end

	set_xml_schemap_redefined_attrgroup is
		do
			value := xml_schemap_redefined_attrgroup_low_level
		end

	set_xml_schemap_redefined_element is
		do
			value := xml_schemap_redefined_element_low_level
		end

	set_xml_schemap_redefined_group is
		do
			value := xml_schemap_redefined_group_low_level
		end

	set_xml_schemap_redefined_notation is
		do
			value := xml_schemap_redefined_notation_low_level
		end

	set_xml_schemap_redefined_type is
		do
			value := xml_schemap_redefined_type_low_level
		end

	set_xml_schemap_ref_and_content is
		do
			value := xml_schemap_ref_and_content_low_level
		end

	set_xml_schemap_ref_and_subtype is
		do
			value := xml_schemap_ref_and_subtype_low_level
		end

	set_xml_schemap_regexp_invalid is
		do
			value := xml_schemap_regexp_invalid_low_level
		end

	set_xml_schemap_restriction_noname_noref is
		do
			value := xml_schemap_restriction_noname_noref_low_level
		end

	set_xml_schemap_s4s_attr_invalid_value is
		do
			value := xml_schemap_s4s_attr_invalid_value_low_level
		end

	set_xml_schemap_s4s_attr_missing is
		do
			value := xml_schemap_s4s_attr_missing_low_level
		end

	set_xml_schemap_s4s_attr_not_allowed is
		do
			value := xml_schemap_s4s_attr_not_allowed_low_level
		end

	set_xml_schemap_s4s_elem_missing is
		do
			value := xml_schemap_s4s_elem_missing_low_level
		end

	set_xml_schemap_s4s_elem_not_allowed is
		do
			value := xml_schemap_s4s_elem_not_allowed_low_level
		end

	set_xml_schemap_simpletype_noname is
		do
			value := xml_schemap_simpletype_noname_low_level
		end

	set_xml_schemap_src_attribute_1 is
		do
			value := xml_schemap_src_attribute_1_low_level
		end

	set_xml_schemap_src_attribute_2 is
		do
			value := xml_schemap_src_attribute_2_low_level
		end

	set_xml_schemap_src_attribute_3_1 is
		do
			value := xml_schemap_src_attribute_3_1_low_level
		end

	set_xml_schemap_src_attribute_3_2 is
		do
			value := xml_schemap_src_attribute_3_2_low_level
		end

	set_xml_schemap_src_attribute_4 is
		do
			value := xml_schemap_src_attribute_4_low_level
		end

	set_xml_schemap_src_attribute_group_1 is
		do
			value := xml_schemap_src_attribute_group_1_low_level
		end

	set_xml_schemap_src_attribute_group_2 is
		do
			value := xml_schemap_src_attribute_group_2_low_level
		end

	set_xml_schemap_src_attribute_group_3 is
		do
			value := xml_schemap_src_attribute_group_3_low_level
		end

	set_xml_schemap_src_ct_1 is
		do
			value := xml_schemap_src_ct_1_low_level
		end

	set_xml_schemap_src_element_1 is
		do
			value := xml_schemap_src_element_1_low_level
		end

	set_xml_schemap_src_element_2_1 is
		do
			value := xml_schemap_src_element_2_1_low_level
		end

	set_xml_schemap_src_element_2_2 is
		do
			value := xml_schemap_src_element_2_2_low_level
		end

	set_xml_schemap_src_element_3 is
		do
			value := xml_schemap_src_element_3_low_level
		end

	set_xml_schemap_src_import is
		do
			value := xml_schemap_src_import_low_level
		end

	set_xml_schemap_src_import_1_1 is
		do
			value := xml_schemap_src_import_1_1_low_level
		end

	set_xml_schemap_src_import_1_2 is
		do
			value := xml_schemap_src_import_1_2_low_level
		end

	set_xml_schemap_src_import_2 is
		do
			value := xml_schemap_src_import_2_low_level
		end

	set_xml_schemap_src_import_2_1 is
		do
			value := xml_schemap_src_import_2_1_low_level
		end

	set_xml_schemap_src_import_2_2 is
		do
			value := xml_schemap_src_import_2_2_low_level
		end

	set_xml_schemap_src_import_3_1 is
		do
			value := xml_schemap_src_import_3_1_low_level
		end

	set_xml_schemap_src_import_3_2 is
		do
			value := xml_schemap_src_import_3_2_low_level
		end

	set_xml_schemap_src_include is
		do
			value := xml_schemap_src_include_low_level
		end

	set_xml_schemap_src_list_itemtype_or_simpletype is
		do
			value := xml_schemap_src_list_itemtype_or_simpletype_low_level
		end

	set_xml_schemap_src_redefine is
		do
			value := xml_schemap_src_redefine_low_level
		end

	set_xml_schemap_src_resolve is
		do
			value := xml_schemap_src_resolve_low_level
		end

	set_xml_schemap_src_restriction_base_or_simpletype is
		do
			value := xml_schemap_src_restriction_base_or_simpletype_low_level
		end

	set_xml_schemap_src_simple_type_1 is
		do
			value := xml_schemap_src_simple_type_1_low_level
		end

	set_xml_schemap_src_simple_type_2 is
		do
			value := xml_schemap_src_simple_type_2_low_level
		end

	set_xml_schemap_src_simple_type_3 is
		do
			value := xml_schemap_src_simple_type_3_low_level
		end

	set_xml_schemap_src_simple_type_4 is
		do
			value := xml_schemap_src_simple_type_4_low_level
		end

	set_xml_schemap_src_union_membertypes_or_simpletypes is
		do
			value := xml_schemap_src_union_membertypes_or_simpletypes_low_level
		end

	set_xml_schemap_st_props_correct_1 is
		do
			value := xml_schemap_st_props_correct_1_low_level
		end

	set_xml_schemap_st_props_correct_2 is
		do
			value := xml_schemap_st_props_correct_2_low_level
		end

	set_xml_schemap_st_props_correct_3 is
		do
			value := xml_schemap_st_props_correct_3_low_level
		end

	set_xml_schemap_supernumerous_list_item_type is
		do
			value := xml_schemap_supernumerous_list_item_type_low_level
		end

	set_xml_schemap_type_and_subtype is
		do
			value := xml_schemap_type_and_subtype_low_level
		end

	set_xml_schemap_union_not_expressible is
		do
			value := xml_schemap_union_not_expressible_low_level
		end

	set_xml_schemap_unknown_all_child is
		do
			value := xml_schemap_unknown_all_child_low_level
		end

	set_xml_schemap_unknown_anyattribute_child is
		do
			value := xml_schemap_unknown_anyattribute_child_low_level
		end

	set_xml_schemap_unknown_attr_child is
		do
			value := xml_schemap_unknown_attr_child_low_level
		end

	set_xml_schemap_unknown_attrgrp_child is
		do
			value := xml_schemap_unknown_attrgrp_child_low_level
		end

	set_xml_schemap_unknown_attribute_group is
		do
			value := xml_schemap_unknown_attribute_group_low_level
		end

	set_xml_schemap_unknown_base_type is
		do
			value := xml_schemap_unknown_base_type_low_level
		end

	set_xml_schemap_unknown_choice_child is
		do
			value := xml_schemap_unknown_choice_child_low_level
		end

	set_xml_schemap_unknown_complexcontent_child is
		do
			value := xml_schemap_unknown_complexcontent_child_low_level
		end

	set_xml_schemap_unknown_complextype_child is
		do
			value := xml_schemap_unknown_complextype_child_low_level
		end

	set_xml_schemap_unknown_elem_child is
		do
			value := xml_schemap_unknown_elem_child_low_level
		end

	set_xml_schemap_unknown_extension_child is
		do
			value := xml_schemap_unknown_extension_child_low_level
		end

	set_xml_schemap_unknown_facet_child is
		do
			value := xml_schemap_unknown_facet_child_low_level
		end

	set_xml_schemap_unknown_facet_type is
		do
			value := xml_schemap_unknown_facet_type_low_level
		end

	set_xml_schemap_unknown_group_child is
		do
			value := xml_schemap_unknown_group_child_low_level
		end

	set_xml_schemap_unknown_import_child is
		do
			value := xml_schemap_unknown_import_child_low_level
		end

	set_xml_schemap_unknown_include_child is
		do
			value := xml_schemap_unknown_include_child_low_level
		end

	set_xml_schemap_unknown_list_child is
		do
			value := xml_schemap_unknown_list_child_low_level
		end

	set_xml_schemap_unknown_member_type is
		do
			value := xml_schemap_unknown_member_type_low_level
		end

	set_xml_schemap_unknown_notation_child is
		do
			value := xml_schemap_unknown_notation_child_low_level
		end

	set_xml_schemap_unknown_prefix is
		do
			value := xml_schemap_unknown_prefix_low_level
		end

	set_xml_schemap_unknown_processcontent_child is
		do
			value := xml_schemap_unknown_processcontent_child_low_level
		end

	set_xml_schemap_unknown_ref is
		do
			value := xml_schemap_unknown_ref_low_level
		end

	set_xml_schemap_unknown_restriction_child is
		do
			value := xml_schemap_unknown_restriction_child_low_level
		end

	set_xml_schemap_unknown_schemas_child is
		do
			value := xml_schemap_unknown_schemas_child_low_level
		end

	set_xml_schemap_unknown_sequence_child is
		do
			value := xml_schemap_unknown_sequence_child_low_level
		end

	set_xml_schemap_unknown_simplecontent_child is
		do
			value := xml_schemap_unknown_simplecontent_child_low_level
		end

	set_xml_schemap_unknown_simpletype_child is
		do
			value := xml_schemap_unknown_simpletype_child_low_level
		end

	set_xml_schemap_unknown_type is
		do
			value := xml_schemap_unknown_type_low_level
		end

	set_xml_schemap_unknown_union_child is
		do
			value := xml_schemap_unknown_union_child_low_level
		end

	set_xml_schemap_warn_attr_pointless_proh is
		do
			value := xml_schemap_warn_attr_pointless_proh_low_level
		end

	set_xml_schemap_warn_attr_redecl_proh is
		do
			value := xml_schemap_warn_attr_redecl_proh_low_level
		end

	set_xml_schemap_warn_skip_schema is
		do
			value := xml_schemap_warn_skip_schema_low_level
		end

	set_xml_schemap_warn_unlocated_schema is
		do
			value := xml_schemap_warn_unlocated_schema_low_level
		end

	set_xml_schemap_wildcard_invalid_ns_member is
		do
			value := xml_schemap_wildcard_invalid_ns_member_low_level
		end

	set_xml_schematronv_assert is
		do
			value := xml_schematronv_assert_low_level
		end

	set_xml_schematronv_report is
		do
			value := xml_schematronv_report_low_level
		end

	set_xml_schemav_attrinvalid is
		do
			value := xml_schemav_attrinvalid_low_level
		end

	set_xml_schemav_attrunknown is
		do
			value := xml_schemav_attrunknown_low_level
		end

	set_xml_schemav_construct is
		do
			value := xml_schemav_construct_low_level
		end

	set_xml_schemav_cvc_attribute_1 is
		do
			value := xml_schemav_cvc_attribute_1_low_level
		end

	set_xml_schemav_cvc_attribute_2 is
		do
			value := xml_schemav_cvc_attribute_2_low_level
		end

	set_xml_schemav_cvc_attribute_3 is
		do
			value := xml_schemav_cvc_attribute_3_low_level
		end

	set_xml_schemav_cvc_attribute_4 is
		do
			value := xml_schemav_cvc_attribute_4_low_level
		end

	set_xml_schemav_cvc_au is
		do
			value := xml_schemav_cvc_au_low_level
		end

	set_xml_schemav_cvc_complex_type_1 is
		do
			value := xml_schemav_cvc_complex_type_1_low_level
		end

	set_xml_schemav_cvc_complex_type_2_1 is
		do
			value := xml_schemav_cvc_complex_type_2_1_low_level
		end

	set_xml_schemav_cvc_complex_type_2_2 is
		do
			value := xml_schemav_cvc_complex_type_2_2_low_level
		end

	set_xml_schemav_cvc_complex_type_2_3 is
		do
			value := xml_schemav_cvc_complex_type_2_3_low_level
		end

	set_xml_schemav_cvc_complex_type_2_4 is
		do
			value := xml_schemav_cvc_complex_type_2_4_low_level
		end

	set_xml_schemav_cvc_complex_type_3_1 is
		do
			value := xml_schemav_cvc_complex_type_3_1_low_level
		end

	set_xml_schemav_cvc_complex_type_3_2_1 is
		do
			value := xml_schemav_cvc_complex_type_3_2_1_low_level
		end

	set_xml_schemav_cvc_complex_type_3_2_2 is
		do
			value := xml_schemav_cvc_complex_type_3_2_2_low_level
		end

	set_xml_schemav_cvc_complex_type_4 is
		do
			value := xml_schemav_cvc_complex_type_4_low_level
		end

	set_xml_schemav_cvc_complex_type_5_1 is
		do
			value := xml_schemav_cvc_complex_type_5_1_low_level
		end

	set_xml_schemav_cvc_complex_type_5_2 is
		do
			value := xml_schemav_cvc_complex_type_5_2_low_level
		end

	set_xml_schemav_cvc_datatype_valid_1_2_1 is
		do
			value := xml_schemav_cvc_datatype_valid_1_2_1_low_level
		end

	set_xml_schemav_cvc_datatype_valid_1_2_2 is
		do
			value := xml_schemav_cvc_datatype_valid_1_2_2_low_level
		end

	set_xml_schemav_cvc_datatype_valid_1_2_3 is
		do
			value := xml_schemav_cvc_datatype_valid_1_2_3_low_level
		end

	set_xml_schemav_cvc_elt_1 is
		do
			value := xml_schemav_cvc_elt_1_low_level
		end

	set_xml_schemav_cvc_elt_2 is
		do
			value := xml_schemav_cvc_elt_2_low_level
		end

	set_xml_schemav_cvc_elt_3_1 is
		do
			value := xml_schemav_cvc_elt_3_1_low_level
		end

	set_xml_schemav_cvc_elt_3_2_1 is
		do
			value := xml_schemav_cvc_elt_3_2_1_low_level
		end

	set_xml_schemav_cvc_elt_3_2_2 is
		do
			value := xml_schemav_cvc_elt_3_2_2_low_level
		end

	set_xml_schemav_cvc_elt_4_1 is
		do
			value := xml_schemav_cvc_elt_4_1_low_level
		end

	set_xml_schemav_cvc_elt_4_2 is
		do
			value := xml_schemav_cvc_elt_4_2_low_level
		end

	set_xml_schemav_cvc_elt_4_3 is
		do
			value := xml_schemav_cvc_elt_4_3_low_level
		end

	set_xml_schemav_cvc_elt_5_1_1 is
		do
			value := xml_schemav_cvc_elt_5_1_1_low_level
		end

	set_xml_schemav_cvc_elt_5_1_2 is
		do
			value := xml_schemav_cvc_elt_5_1_2_low_level
		end

	set_xml_schemav_cvc_elt_5_2_1 is
		do
			value := xml_schemav_cvc_elt_5_2_1_low_level
		end

	set_xml_schemav_cvc_elt_5_2_2_1 is
		do
			value := xml_schemav_cvc_elt_5_2_2_1_low_level
		end

	set_xml_schemav_cvc_elt_5_2_2_2_1 is
		do
			value := xml_schemav_cvc_elt_5_2_2_2_1_low_level
		end

	set_xml_schemav_cvc_elt_5_2_2_2_2 is
		do
			value := xml_schemav_cvc_elt_5_2_2_2_2_low_level
		end

	set_xml_schemav_cvc_elt_6 is
		do
			value := xml_schemav_cvc_elt_6_low_level
		end

	set_xml_schemav_cvc_elt_7 is
		do
			value := xml_schemav_cvc_elt_7_low_level
		end

	set_xml_schemav_cvc_enumeration_valid is
		do
			value := xml_schemav_cvc_enumeration_valid_low_level
		end

	set_xml_schemav_cvc_facet_valid is
		do
			value := xml_schemav_cvc_facet_valid_low_level
		end

	set_xml_schemav_cvc_fractiondigits_valid is
		do
			value := xml_schemav_cvc_fractiondigits_valid_low_level
		end

	set_xml_schemav_cvc_idc is
		do
			value := xml_schemav_cvc_idc_low_level
		end

	set_xml_schemav_cvc_length_valid is
		do
			value := xml_schemav_cvc_length_valid_low_level
		end

	set_xml_schemav_cvc_maxexclusive_valid is
		do
			value := xml_schemav_cvc_maxexclusive_valid_low_level
		end

	set_xml_schemav_cvc_maxinclusive_valid is
		do
			value := xml_schemav_cvc_maxinclusive_valid_low_level
		end

	set_xml_schemav_cvc_maxlength_valid is
		do
			value := xml_schemav_cvc_maxlength_valid_low_level
		end

	set_xml_schemav_cvc_minexclusive_valid is
		do
			value := xml_schemav_cvc_minexclusive_valid_low_level
		end

	set_xml_schemav_cvc_mininclusive_valid is
		do
			value := xml_schemav_cvc_mininclusive_valid_low_level
		end

	set_xml_schemav_cvc_minlength_valid is
		do
			value := xml_schemav_cvc_minlength_valid_low_level
		end

	set_xml_schemav_cvc_pattern_valid is
		do
			value := xml_schemav_cvc_pattern_valid_low_level
		end

	set_xml_schemav_cvc_totaldigits_valid is
		do
			value := xml_schemav_cvc_totaldigits_valid_low_level
		end

	set_xml_schemav_cvc_type_1 is
		do
			value := xml_schemav_cvc_type_1_low_level
		end

	set_xml_schemav_cvc_type_2 is
		do
			value := xml_schemav_cvc_type_2_low_level
		end

	set_xml_schemav_cvc_type_3_1_1 is
		do
			value := xml_schemav_cvc_type_3_1_1_low_level
		end

	set_xml_schemav_cvc_type_3_1_2 is
		do
			value := xml_schemav_cvc_type_3_1_2_low_level
		end

	set_xml_schemav_cvc_wildcard is
		do
			value := xml_schemav_cvc_wildcard_low_level
		end

	set_xml_schemav_document_element_missing is
		do
			value := xml_schemav_document_element_missing_low_level
		end

	set_xml_schemav_elemcont is
		do
			value := xml_schemav_elemcont_low_level
		end

	set_xml_schemav_element_content is
		do
			value := xml_schemav_element_content_low_level
		end

	set_xml_schemav_extracontent is
		do
			value := xml_schemav_extracontent_low_level
		end

	set_xml_schemav_facet is
		do
			value := xml_schemav_facet_low_level
		end

	set_xml_schemav_havedefault is
		do
			value := xml_schemav_havedefault_low_level
		end

	set_xml_schemav_internal is
		do
			value := xml_schemav_internal_low_level
		end

	set_xml_schemav_invalidattr is
		do
			value := xml_schemav_invalidattr_low_level
		end

	set_xml_schemav_invalidelem is
		do
			value := xml_schemav_invalidelem_low_level
		end

	set_xml_schemav_isabstract is
		do
			value := xml_schemav_isabstract_low_level
		end

	set_xml_schemav_misc is
		do
			value := xml_schemav_misc_low_level
		end

	set_xml_schemav_missing is
		do
			value := xml_schemav_missing_low_level
		end

	set_xml_schemav_norollback is
		do
			value := xml_schemav_norollback_low_level
		end

	set_xml_schemav_noroot is
		do
			value := xml_schemav_noroot_low_level
		end

	set_xml_schemav_notdeterminist is
		do
			value := xml_schemav_notdeterminist_low_level
		end

	set_xml_schemav_notempty is
		do
			value := xml_schemav_notempty_low_level
		end

	set_xml_schemav_notnillable is
		do
			value := xml_schemav_notnillable_low_level
		end

	set_xml_schemav_notsimple is
		do
			value := xml_schemav_notsimple_low_level
		end

	set_xml_schemav_nottoplevel is
		do
			value := xml_schemav_nottoplevel_low_level
		end

	set_xml_schemav_notype is
		do
			value := xml_schemav_notype_low_level
		end

	set_xml_schemav_undeclaredelem is
		do
			value := xml_schemav_undeclaredelem_low_level
		end

	set_xml_schemav_value is
		do
			value := xml_schemav_value_low_level
		end

	set_xml_schemav_wrongelem is
		do
			value := xml_schemav_wrongelem_low_level
		end

	set_xml_tree_invalid_dec is
		do
			value := xml_tree_invalid_dec_low_level
		end

	set_xml_tree_invalid_hex is
		do
			value := xml_tree_invalid_hex_low_level
		end

	set_xml_tree_not_utf8 is
		do
			value := xml_tree_not_utf8_low_level
		end

	set_xml_tree_unterminated_entity is
		do
			value := xml_tree_unterminated_entity_low_level
		end

	set_xml_war_catalog_pi is
		do
			value := xml_war_catalog_pi_low_level
		end

	set_xml_war_entity_redefined is
		do
			value := xml_war_entity_redefined_low_level
		end

	set_xml_war_lang_value is
		do
			value := xml_war_lang_value_low_level
		end

	set_xml_war_ns_column is
		do
			value := xml_war_ns_column_low_level
		end

	set_xml_war_ns_uri is
		do
			value := xml_war_ns_uri_low_level
		end

	set_xml_war_ns_uri_relative is
		do
			value := xml_war_ns_uri_relative_low_level
		end

	set_xml_war_space_value is
		do
			value := xml_war_space_value_low_level
		end

	set_xml_war_undeclared_entity is
		do
			value := xml_war_undeclared_entity_low_level
		end

	set_xml_war_unknown_version is
		do
			value := xml_war_unknown_version_low_level
		end

	set_xml_xinclude_build_failed is
		do
			value := xml_xinclude_build_failed_low_level
		end

	set_xml_xinclude_deprecated_ns is
		do
			value := xml_xinclude_deprecated_ns_low_level
		end

	set_xml_xinclude_entity_def_mismatch is
		do
			value := xml_xinclude_entity_def_mismatch_low_level
		end

	set_xml_xinclude_fallback_not_in_include is
		do
			value := xml_xinclude_fallback_not_in_include_low_level
		end

	set_xml_xinclude_fallbacks_in_include is
		do
			value := xml_xinclude_fallbacks_in_include_low_level
		end

	set_xml_xinclude_fragment_id is
		do
			value := xml_xinclude_fragment_id_low_level
		end

	set_xml_xinclude_href_uri is
		do
			value := xml_xinclude_href_uri_low_level
		end

	set_xml_xinclude_include_in_include is
		do
			value := xml_xinclude_include_in_include_low_level
		end

	set_xml_xinclude_invalid_char is
		do
			value := xml_xinclude_invalid_char_low_level
		end

	set_xml_xinclude_multiple_root is
		do
			value := xml_xinclude_multiple_root_low_level
		end

	set_xml_xinclude_no_fallback is
		do
			value := xml_xinclude_no_fallback_low_level
		end

	set_xml_xinclude_no_href is
		do
			value := xml_xinclude_no_href_low_level
		end

	set_xml_xinclude_parse_value is
		do
			value := xml_xinclude_parse_value_low_level
		end

	set_xml_xinclude_recursion is
		do
			value := xml_xinclude_recursion_low_level
		end

	set_xml_xinclude_text_document is
		do
			value := xml_xinclude_text_document_low_level
		end

	set_xml_xinclude_text_fragment is
		do
			value := xml_xinclude_text_fragment_low_level
		end

	set_xml_xinclude_unknown_encoding is
		do
			value := xml_xinclude_unknown_encoding_low_level
		end

	set_xml_xinclude_xptr_failed is
		do
			value := xml_xinclude_xptr_failed_low_level
		end

	set_xml_xinclude_xptr_result is
		do
			value := xml_xinclude_xptr_result_low_level
		end

	set_xml_xpath_encoding_error is
		do
			value := xml_xpath_encoding_error_low_level
		end

	set_xml_xpath_expr_error is
		do
			value := xml_xpath_expr_error_low_level
		end

	set_xml_xpath_expression_ok is
		do
			value := xml_xpath_expression_ok_low_level
		end

	set_xml_xpath_invalid_arity is
		do
			value := xml_xpath_invalid_arity_low_level
		end

	set_xml_xpath_invalid_char_error is
		do
			value := xml_xpath_invalid_char_error_low_level
		end

	set_xml_xpath_invalid_ctxt_position is
		do
			value := xml_xpath_invalid_ctxt_position_low_level
		end

	set_xml_xpath_invalid_ctxt_size is
		do
			value := xml_xpath_invalid_ctxt_size_low_level
		end

	set_xml_xpath_invalid_operand is
		do
			value := xml_xpath_invalid_operand_low_level
		end

	set_xml_xpath_invalid_predicate_error is
		do
			value := xml_xpath_invalid_predicate_error_low_level
		end

	set_xml_xpath_invalid_type is
		do
			value := xml_xpath_invalid_type_low_level
		end

	set_xml_xpath_memory_error is
		do
			value := xml_xpath_memory_error_low_level
		end

	set_xml_xpath_number_error is
		do
			value := xml_xpath_number_error_low_level
		end

	set_xml_xpath_start_literal_error is
		do
			value := xml_xpath_start_literal_error_low_level
		end

	set_xml_xpath_unclosed_error is
		do
			value := xml_xpath_unclosed_error_low_level
		end

	set_xml_xpath_undef_prefix_error is
		do
			value := xml_xpath_undef_prefix_error_low_level
		end

	set_xml_xpath_undef_variable_error is
		do
			value := xml_xpath_undef_variable_error_low_level
		end

	set_xml_xpath_unfinished_literal_error is
		do
			value := xml_xpath_unfinished_literal_error_low_level
		end

	set_xml_xpath_unknown_func_error is
		do
			value := xml_xpath_unknown_func_error_low_level
		end

	set_xml_xpath_variable_ref_error is
		do
			value := xml_xpath_variable_ref_error_low_level
		end

	set_xml_xptr_childseq_start is
		do
			value := xml_xptr_childseq_start_low_level
		end

	set_xml_xptr_eval_failed is
		do
			value := xml_xptr_eval_failed_low_level
		end

	set_xml_xptr_extra_objects is
		do
			value := xml_xptr_extra_objects_low_level
		end

	set_xml_xptr_resource_error is
		do
			value := xml_xptr_resource_error_low_level
		end

	set_xml_xptr_sub_resource_error is
		do
			value := xml_xptr_sub_resource_error_low_level
		end

	set_xml_xptr_syntax_error is
		do
			value := xml_xptr_syntax_error_low_level
		end

	set_xml_xptr_unknown_scheme is
		do
			value := xml_xptr_unknown_scheme_low_level
		end

<<<<<<< HEAD
feature -- Queries
	is_xml_c14n_create_ctxt: BOOLEAN is
=======
feature {ANY} -- Queries
	err_ok: BOOLEAN is
>>>>>>> c5fc6163e0cda7bb1c1dc8df91c46c66ff334c0a
		do
			Result := (value=xml_c14n_create_ctxt_low_level)
		end

	is_xml_c14n_create_stack: BOOLEAN is
		do
			Result := (value=xml_c14n_create_stack_low_level)
		end

	is_xml_c14n_invalid_node: BOOLEAN is
		do
			Result := (value=xml_c14n_invalid_node_low_level)
		end

	is_xml_c14n_relative_namespace: BOOLEAN is
		do
			Result := (value=xml_c14n_relative_namespace_low_level)
		end

	is_xml_c14n_requires_utf8: BOOLEAN is
		do
			Result := (value=xml_c14n_requires_utf8_low_level)
		end

	is_xml_c14n_unknow_node: BOOLEAN is
		do
			Result := (value=xml_c14n_unknow_node_low_level)
		end

	is_xml_catalog_entry_broken: BOOLEAN is
		do
			Result := (value=xml_catalog_entry_broken_low_level)
		end

	is_xml_catalog_missing_attr: BOOLEAN is
		do
			Result := (value=xml_catalog_missing_attr_low_level)
		end

	is_xml_catalog_not_catalog: BOOLEAN is
		do
			Result := (value=xml_catalog_not_catalog_low_level)
		end

	is_xml_catalog_prefer_value: BOOLEAN is
		do
			Result := (value=xml_catalog_prefer_value_low_level)
		end

	is_xml_catalog_recursion: BOOLEAN is
		do
			Result := (value=xml_catalog_recursion_low_level)
		end

	is_xml_check_entity_type: BOOLEAN is
		do
			Result := (value=xml_check_entity_type_low_level)
		end

	is_xml_check_found_attribute: BOOLEAN is
		do
			Result := (value=xml_check_found_attribute_low_level)
		end

	is_xml_check_found_cdata: BOOLEAN is
		do
			Result := (value=xml_check_found_cdata_low_level)
		end

	is_xml_check_found_comment: BOOLEAN is
		do
			Result := (value=xml_check_found_comment_low_level)
		end

	is_xml_check_found_doctype: BOOLEAN is
		do
			Result := (value=xml_check_found_doctype_low_level)
		end

	is_xml_check_found_element: BOOLEAN is
		do
			Result := (value=xml_check_found_element_low_level)
		end

	is_xml_check_found_entity: BOOLEAN is
		do
			Result := (value=xml_check_found_entity_low_level)
		end

	is_xml_check_found_entityref: BOOLEAN is
		do
			Result := (value=xml_check_found_entityref_low_level)
		end

	is_xml_check_found_fragment: BOOLEAN is
		do
			Result := (value=xml_check_found_fragment_low_level)
		end

	is_xml_check_found_notation: BOOLEAN is
		do
			Result := (value=xml_check_found_notation_low_level)
		end

	is_xml_check_found_pi: BOOLEAN is
		do
			Result := (value=xml_check_found_pi_low_level)
		end

	is_xml_check_found_text: BOOLEAN is
		do
			Result := (value=xml_check_found_text_low_level)
		end

	is_xml_check_name_not_null: BOOLEAN is
		do
			Result := (value=xml_check_name_not_null_low_level)
		end

	is_xml_check_no_dict: BOOLEAN is
		do
			Result := (value=xml_check_no_dict_low_level)
		end

	is_xml_check_no_doc: BOOLEAN is
		do
			Result := (value=xml_check_no_doc_low_level)
		end

	is_xml_check_no_elem: BOOLEAN is
		do
			Result := (value=xml_check_no_elem_low_level)
		end

	is_xml_check_no_href: BOOLEAN is
		do
			Result := (value=xml_check_no_href_low_level)
		end

	is_xml_check_no_name: BOOLEAN is
		do
			Result := (value=xml_check_no_name_low_level)
		end

	is_xml_check_no_next: BOOLEAN is
		do
			Result := (value=xml_check_no_next_low_level)
		end

	is_xml_check_no_parent: BOOLEAN is
		do
			Result := (value=xml_check_no_parent_low_level)
		end

	is_xml_check_no_prev: BOOLEAN is
		do
			Result := (value=xml_check_no_prev_low_level)
		end

	is_xml_check_not_attr: BOOLEAN is
		do
			Result := (value=xml_check_not_attr_low_level)
		end

	is_xml_check_not_attr_decl: BOOLEAN is
		do
			Result := (value=xml_check_not_attr_decl_low_level)
		end

	is_xml_check_not_dtd: BOOLEAN is
		do
			Result := (value=xml_check_not_dtd_low_level)
		end

	is_xml_check_not_elem_decl: BOOLEAN is
		do
			Result := (value=xml_check_not_elem_decl_low_level)
		end

	is_xml_check_not_entity_decl: BOOLEAN is
		do
			Result := (value=xml_check_not_entity_decl_low_level)
		end

	is_xml_check_not_ncname: BOOLEAN is
		do
			Result := (value=xml_check_not_ncname_low_level)
		end

	is_xml_check_not_ns_decl: BOOLEAN is
		do
			Result := (value=xml_check_not_ns_decl_low_level)
		end

	is_xml_check_not_utf8: BOOLEAN is
		do
			Result := (value=xml_check_not_utf8_low_level)
		end

	is_xml_check_ns_ancestor: BOOLEAN is
		do
			Result := (value=xml_check_ns_ancestor_low_level)
		end

	is_xml_check_ns_scope: BOOLEAN is
		do
			Result := (value=xml_check_ns_scope_low_level)
		end

	is_xml_check_outside_dict: BOOLEAN is
		do
			Result := (value=xml_check_outside_dict_low_level)
		end

	is_xml_check_unknown_node: BOOLEAN is
		do
			Result := (value=xml_check_unknown_node_low_level)
		end

	is_xml_check_wrong_doc: BOOLEAN is
		do
			Result := (value=xml_check_wrong_doc_low_level)
		end

	is_xml_check_wrong_name: BOOLEAN is
		do
			Result := (value=xml_check_wrong_name_low_level)
		end

	is_xml_check_wrong_next: BOOLEAN is
		do
			Result := (value=xml_check_wrong_next_low_level)
		end

	is_xml_check_wrong_parent: BOOLEAN is
		do
			Result := (value=xml_check_wrong_parent_low_level)
		end

	is_xml_check_wrong_prev: BOOLEAN is
		do
			Result := (value=xml_check_wrong_prev_low_level)
		end

	is_xml_dtd_attribute_default: BOOLEAN is
		do
			Result := (value=xml_dtd_attribute_default_low_level)
		end

	is_xml_dtd_attribute_redefined: BOOLEAN is
		do
			Result := (value=xml_dtd_attribute_redefined_low_level)
		end

	is_xml_dtd_attribute_value: BOOLEAN is
		do
			Result := (value=xml_dtd_attribute_value_low_level)
		end

	is_xml_dtd_content_error: BOOLEAN is
		do
			Result := (value=xml_dtd_content_error_low_level)
		end

	is_xml_dtd_content_model: BOOLEAN is
		do
			Result := (value=xml_dtd_content_model_low_level)
		end

	is_xml_dtd_content_not_determinist: BOOLEAN is
		do
			Result := (value=xml_dtd_content_not_determinist_low_level)
		end

	is_xml_dtd_different_prefix: BOOLEAN is
		do
			Result := (value=xml_dtd_different_prefix_low_level)
		end

	is_xml_dtd_dup_token: BOOLEAN is
		do
			Result := (value=xml_dtd_dup_token_low_level)
		end

	is_xml_dtd_elem_default_namespace: BOOLEAN is
		do
			Result := (value=xml_dtd_elem_default_namespace_low_level)
		end

	is_xml_dtd_elem_namespace: BOOLEAN is
		do
			Result := (value=xml_dtd_elem_namespace_low_level)
		end

	is_xml_dtd_elem_redefined: BOOLEAN is
		do
			Result := (value=xml_dtd_elem_redefined_low_level)
		end

	is_xml_dtd_empty_notation: BOOLEAN is
		do
			Result := (value=xml_dtd_empty_notation_low_level)
		end

	is_xml_dtd_entity_type: BOOLEAN is
		do
			Result := (value=xml_dtd_entity_type_low_level)
		end

	is_xml_dtd_id_fixed: BOOLEAN is
		do
			Result := (value=xml_dtd_id_fixed_low_level)
		end

	is_xml_dtd_id_redefined: BOOLEAN is
		do
			Result := (value=xml_dtd_id_redefined_low_level)
		end

	is_xml_dtd_id_subset: BOOLEAN is
		do
			Result := (value=xml_dtd_id_subset_low_level)
		end

	is_xml_dtd_invalid_child: BOOLEAN is
		do
			Result := (value=xml_dtd_invalid_child_low_level)
		end

	is_xml_dtd_invalid_default: BOOLEAN is
		do
			Result := (value=xml_dtd_invalid_default_low_level)
		end

	is_xml_dtd_load_error: BOOLEAN is
		do
			Result := (value=xml_dtd_load_error_low_level)
		end

	is_xml_dtd_missing_attribute: BOOLEAN is
		do
			Result := (value=xml_dtd_missing_attribute_low_level)
		end

	is_xml_dtd_mixed_corrupt: BOOLEAN is
		do
			Result := (value=xml_dtd_mixed_corrupt_low_level)
		end

	is_xml_dtd_multiple_id: BOOLEAN is
		do
			Result := (value=xml_dtd_multiple_id_low_level)
		end

	is_xml_dtd_no_doc: BOOLEAN is
		do
			Result := (value=xml_dtd_no_doc_low_level)
		end

	is_xml_dtd_no_dtd: BOOLEAN is
		do
			Result := (value=xml_dtd_no_dtd_low_level)
		end

	is_xml_dtd_no_elem_name: BOOLEAN is
		do
			Result := (value=xml_dtd_no_elem_name_low_level)
		end

	is_xml_dtd_no_prefix: BOOLEAN is
		do
			Result := (value=xml_dtd_no_prefix_low_level)
		end

	is_xml_dtd_no_root: BOOLEAN is
		do
			Result := (value=xml_dtd_no_root_low_level)
		end

	is_xml_dtd_not_empty: BOOLEAN is
		do
			Result := (value=xml_dtd_not_empty_low_level)
		end

	is_xml_dtd_not_pcdata: BOOLEAN is
		do
			Result := (value=xml_dtd_not_pcdata_low_level)
		end

	is_xml_dtd_not_standalone: BOOLEAN is
		do
			Result := (value=xml_dtd_not_standalone_low_level)
		end

	is_xml_dtd_notation_redefined: BOOLEAN is
		do
			Result := (value=xml_dtd_notation_redefined_low_level)
		end

	is_xml_dtd_notation_value: BOOLEAN is
		do
			Result := (value=xml_dtd_notation_value_low_level)
		end

	is_xml_dtd_root_name: BOOLEAN is
		do
			Result := (value=xml_dtd_root_name_low_level)
		end

	is_xml_dtd_standalone_defaulted: BOOLEAN is
		do
			Result := (value=xml_dtd_standalone_defaulted_low_level)
		end

	is_xml_dtd_standalone_white_space: BOOLEAN is
		do
			Result := (value=xml_dtd_standalone_white_space_low_level)
		end

	is_xml_dtd_unknown_attribute: BOOLEAN is
		do
			Result := (value=xml_dtd_unknown_attribute_low_level)
		end

	is_xml_dtd_unknown_elem: BOOLEAN is
		do
			Result := (value=xml_dtd_unknown_elem_low_level)
		end

	is_xml_dtd_unknown_entity: BOOLEAN is
		do
			Result := (value=xml_dtd_unknown_entity_low_level)
		end

	is_xml_dtd_unknown_id: BOOLEAN is
		do
			Result := (value=xml_dtd_unknown_id_low_level)
		end

	is_xml_dtd_unknown_notation: BOOLEAN is
		do
			Result := (value=xml_dtd_unknown_notation_low_level)
		end

	is_xml_dtd_xmlid_type: BOOLEAN is
		do
			Result := (value=xml_dtd_xmlid_type_low_level)
		end

	is_xml_dtd_xmlid_value: BOOLEAN is
		do
			Result := (value=xml_dtd_xmlid_value_low_level)
		end

	is_xml_err_attlist_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_attlist_not_finished_low_level)
		end

	is_xml_err_attlist_not_started: BOOLEAN is
		do
			Result := (value=xml_err_attlist_not_started_low_level)
		end

	is_xml_err_attribute_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_attribute_not_finished_low_level)
		end

	is_xml_err_attribute_not_started: BOOLEAN is
		do
			Result := (value=xml_err_attribute_not_started_low_level)
		end

	is_xml_err_attribute_redefined: BOOLEAN is
		do
			Result := (value=xml_err_attribute_redefined_low_level)
		end

	is_xml_err_attribute_without_value: BOOLEAN is
		do
			Result := (value=xml_err_attribute_without_value_low_level)
		end

	is_xml_err_cdata_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_cdata_not_finished_low_level)
		end

	is_xml_err_charref_at_eof: BOOLEAN is
		do
			Result := (value=xml_err_charref_at_eof_low_level)
		end

	is_xml_err_charref_in_dtd: BOOLEAN is
		do
			Result := (value=xml_err_charref_in_dtd_low_level)
		end

	is_xml_err_charref_in_epilog: BOOLEAN is
		do
			Result := (value=xml_err_charref_in_epilog_low_level)
		end

	is_xml_err_charref_in_prolog: BOOLEAN is
		do
			Result := (value=xml_err_charref_in_prolog_low_level)
		end

	is_xml_err_comment_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_comment_not_finished_low_level)
		end

	is_xml_err_condsec_invalid: BOOLEAN is
		do
			Result := (value=xml_err_condsec_invalid_low_level)
		end

	is_xml_err_condsec_invalid_keyword: BOOLEAN is
		do
			Result := (value=xml_err_condsec_invalid_keyword_low_level)
		end

	is_xml_err_condsec_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_condsec_not_finished_low_level)
		end

	is_xml_err_condsec_not_started: BOOLEAN is
		do
			Result := (value=xml_err_condsec_not_started_low_level)
		end

	is_xml_err_doctype_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_doctype_not_finished_low_level)
		end

	is_xml_err_document_empty: BOOLEAN is
		do
			Result := (value=xml_err_document_empty_low_level)
		end

	is_xml_err_document_end: BOOLEAN is
		do
			Result := (value=xml_err_document_end_low_level)
		end

	is_xml_err_document_start: BOOLEAN is
		do
			Result := (value=xml_err_document_start_low_level)
		end

	is_xml_err_elemcontent_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_elemcontent_not_finished_low_level)
		end

	is_xml_err_elemcontent_not_started: BOOLEAN is
		do
			Result := (value=xml_err_elemcontent_not_started_low_level)
		end

	is_xml_err_encoding_name: BOOLEAN is
		do
			Result := (value=xml_err_encoding_name_low_level)
		end

	is_xml_err_entity_boundary: BOOLEAN is
		do
			Result := (value=xml_err_entity_boundary_low_level)
		end

	is_xml_err_entity_char_error: BOOLEAN is
		do
			Result := (value=xml_err_entity_char_error_low_level)
		end

	is_xml_err_entity_is_external: BOOLEAN is
		do
			Result := (value=xml_err_entity_is_external_low_level)
		end

	is_xml_err_entity_is_parameter: BOOLEAN is
		do
			Result := (value=xml_err_entity_is_parameter_low_level)
		end

	is_xml_err_entity_loop: BOOLEAN is
		do
			Result := (value=xml_err_entity_loop_low_level)
		end

	is_xml_err_entity_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_entity_not_finished_low_level)
		end

	is_xml_err_entity_not_started: BOOLEAN is
		do
			Result := (value=xml_err_entity_not_started_low_level)
		end

	is_xml_err_entity_pe_internal: BOOLEAN is
		do
			Result := (value=xml_err_entity_pe_internal_low_level)
		end

	is_xml_err_entity_processing: BOOLEAN is
		do
			Result := (value=xml_err_entity_processing_low_level)
		end

	is_xml_err_entityref_at_eof: BOOLEAN is
		do
			Result := (value=xml_err_entityref_at_eof_low_level)
		end

	is_xml_err_entityref_in_dtd: BOOLEAN is
		do
			Result := (value=xml_err_entityref_in_dtd_low_level)
		end

	is_xml_err_entityref_in_epilog: BOOLEAN is
		do
			Result := (value=xml_err_entityref_in_epilog_low_level)
		end

	is_xml_err_entityref_in_prolog: BOOLEAN is
		do
			Result := (value=xml_err_entityref_in_prolog_low_level)
		end

	is_xml_err_entityref_no_name: BOOLEAN is
		do
			Result := (value=xml_err_entityref_no_name_low_level)
		end

	is_xml_err_entityref_semicol_missing: BOOLEAN is
		do
			Result := (value=xml_err_entityref_semicol_missing_low_level)
		end

	is_xml_err_equal_required: BOOLEAN is
		do
			Result := (value=xml_err_equal_required_low_level)
		end

	is_xml_err_ext_entity_standalone: BOOLEAN is
		do
			Result := (value=xml_err_ext_entity_standalone_low_level)
		end

	is_xml_err_ext_subset_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_ext_subset_not_finished_low_level)
		end

	is_xml_err_extra_content: BOOLEAN is
		do
			Result := (value=xml_err_extra_content_low_level)
		end

	is_xml_err_gt_required: BOOLEAN is
		do
			Result := (value=xml_err_gt_required_low_level)
		end

	is_xml_err_hyphen_in_comment: BOOLEAN is
		do
			Result := (value=xml_err_hyphen_in_comment_low_level)
		end

	is_xml_err_internal_error: BOOLEAN is
		do
			Result := (value=xml_err_internal_error_low_level)
		end

	is_xml_err_invalid_char: BOOLEAN is
		do
			Result := (value=xml_err_invalid_char_low_level)
		end

	is_xml_err_invalid_charref: BOOLEAN is
		do
			Result := (value=xml_err_invalid_charref_low_level)
		end

	is_xml_err_invalid_dec_charref: BOOLEAN is
		do
			Result := (value=xml_err_invalid_dec_charref_low_level)
		end

	is_xml_err_invalid_encoding: BOOLEAN is
		do
			Result := (value=xml_err_invalid_encoding_low_level)
		end

	is_xml_err_invalid_hex_charref: BOOLEAN is
		do
			Result := (value=xml_err_invalid_hex_charref_low_level)
		end

	is_xml_err_invalid_uri: BOOLEAN is
		do
			Result := (value=xml_err_invalid_uri_low_level)
		end

	is_xml_err_literal_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_literal_not_finished_low_level)
		end

	is_xml_err_literal_not_started: BOOLEAN is
		do
			Result := (value=xml_err_literal_not_started_low_level)
		end

	is_xml_err_lt_in_attribute: BOOLEAN is
		do
			Result := (value=xml_err_lt_in_attribute_low_level)
		end

	is_xml_err_lt_required: BOOLEAN is
		do
			Result := (value=xml_err_lt_required_low_level)
		end

	is_xml_err_ltslash_required: BOOLEAN is
		do
			Result := (value=xml_err_ltslash_required_low_level)
		end

	is_xml_err_misplaced_cdata_end: BOOLEAN is
		do
			Result := (value=xml_err_misplaced_cdata_end_low_level)
		end

	is_xml_err_missing_encoding: BOOLEAN is
		do
			Result := (value=xml_err_missing_encoding_low_level)
		end

	is_xml_err_mixed_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_mixed_not_finished_low_level)
		end

	is_xml_err_mixed_not_started: BOOLEAN is
		do
			Result := (value=xml_err_mixed_not_started_low_level)
		end

	is_xml_err_name_required: BOOLEAN is
		do
			Result := (value=xml_err_name_required_low_level)
		end

	is_xml_err_nmtoken_required: BOOLEAN is
		do
			Result := (value=xml_err_nmtoken_required_low_level)
		end

	is_xml_err_no_dtd: BOOLEAN is
		do
			Result := (value=xml_err_no_dtd_low_level)
		end

	is_xml_err_no_memory: BOOLEAN is
		do
			Result := (value=xml_err_no_memory_low_level)
		end

	is_xml_err_not_standalone: BOOLEAN is
		do
			Result := (value=xml_err_not_standalone_low_level)
		end

	is_xml_err_not_well_balanced: BOOLEAN is
		do
			Result := (value=xml_err_not_well_balanced_low_level)
		end

	is_xml_err_notation_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_notation_not_finished_low_level)
		end

	is_xml_err_notation_not_started: BOOLEAN is
		do
			Result := (value=xml_err_notation_not_started_low_level)
		end

	is_xml_err_notation_processing: BOOLEAN is
		do
			Result := (value=xml_err_notation_processing_low_level)
		end

	is_xml_err_ns_decl_error: BOOLEAN is
		do
			Result := (value=xml_err_ns_decl_error_low_level)
		end

	is_xml_err_ok: BOOLEAN is
		do
			Result := (value=xml_err_ok_low_level)
		end

	is_xml_err_pcdata_required: BOOLEAN is
		do
			Result := (value=xml_err_pcdata_required_low_level)
		end

	is_xml_err_peref_at_eof: BOOLEAN is
		do
			Result := (value=xml_err_peref_at_eof_low_level)
		end

	is_xml_err_peref_in_epilog: BOOLEAN is
		do
			Result := (value=xml_err_peref_in_epilog_low_level)
		end

	is_xml_err_peref_in_int_subset: BOOLEAN is
		do
			Result := (value=xml_err_peref_in_int_subset_low_level)
		end

	is_xml_err_peref_in_prolog: BOOLEAN is
		do
			Result := (value=xml_err_peref_in_prolog_low_level)
		end

	is_xml_err_peref_no_name: BOOLEAN is
		do
			Result := (value=xml_err_peref_no_name_low_level)
		end

	is_xml_err_peref_semicol_missing: BOOLEAN is
		do
			Result := (value=xml_err_peref_semicol_missing_low_level)
		end

	is_xml_err_pi_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_pi_not_finished_low_level)
		end

	is_xml_err_pi_not_started: BOOLEAN is
		do
			Result := (value=xml_err_pi_not_started_low_level)
		end

	is_xml_err_pubid_required: BOOLEAN is
		do
			Result := (value=xml_err_pubid_required_low_level)
		end

	is_xml_err_reserved_xml_name: BOOLEAN is
		do
			Result := (value=xml_err_reserved_xml_name_low_level)
		end

	is_xml_err_separator_required: BOOLEAN is
		do
			Result := (value=xml_err_separator_required_low_level)
		end

	is_xml_err_space_required: BOOLEAN is
		do
			Result := (value=xml_err_space_required_low_level)
		end

	is_xml_err_standalone_value: BOOLEAN is
		do
			Result := (value=xml_err_standalone_value_low_level)
		end

	is_xml_err_string_not_closed: BOOLEAN is
		do
			Result := (value=xml_err_string_not_closed_low_level)
		end

	is_xml_err_string_not_started: BOOLEAN is
		do
			Result := (value=xml_err_string_not_started_low_level)
		end

	is_xml_err_tag_name_mismatch: BOOLEAN is
		do
			Result := (value=xml_err_tag_name_mismatch_low_level)
		end

	is_xml_err_tag_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_tag_not_finished_low_level)
		end

	is_xml_err_undeclared_entity: BOOLEAN is
		do
			Result := (value=xml_err_undeclared_entity_low_level)
		end

	is_xml_err_unknown_encoding: BOOLEAN is
		do
			Result := (value=xml_err_unknown_encoding_low_level)
		end

	is_xml_err_unknown_version: BOOLEAN is
		do
			Result := (value=xml_err_unknown_version_low_level)
		end

	is_xml_err_unparsed_entity: BOOLEAN is
		do
			Result := (value=xml_err_unparsed_entity_low_level)
		end

	is_xml_err_unsupported_encoding: BOOLEAN is
		do
			Result := (value=xml_err_unsupported_encoding_low_level)
		end

	is_xml_err_uri_fragment: BOOLEAN is
		do
			Result := (value=xml_err_uri_fragment_low_level)
		end

	is_xml_err_uri_required: BOOLEAN is
		do
			Result := (value=xml_err_uri_required_low_level)
		end

	is_xml_err_value_required: BOOLEAN is
		do
			Result := (value=xml_err_value_required_low_level)
		end

	is_xml_err_version_mismatch: BOOLEAN is
		do
			Result := (value=xml_err_version_mismatch_low_level)
		end

	is_xml_err_version_missing: BOOLEAN is
		do
			Result := (value=xml_err_version_missing_low_level)
		end

	is_xml_err_xmldecl_not_finished: BOOLEAN is
		do
			Result := (value=xml_err_xmldecl_not_finished_low_level)
		end

	is_xml_err_xmldecl_not_started: BOOLEAN is
		do
			Result := (value=xml_err_xmldecl_not_started_low_level)
		end

	is_xml_ftp_accnt: BOOLEAN is
		do
			Result := (value=xml_ftp_accnt_low_level)
		end

	is_xml_ftp_epsv_answer: BOOLEAN is
		do
			Result := (value=xml_ftp_epsv_answer_low_level)
		end

	is_xml_ftp_pasv_answer: BOOLEAN is
		do
			Result := (value=xml_ftp_pasv_answer_low_level)
		end

	is_xml_ftp_url_syntax: BOOLEAN is
		do
			Result := (value=xml_ftp_url_syntax_low_level)
		end

	is_xml_html_strucure_error: BOOLEAN is
		do
			Result := (value=xml_html_strucure_error_low_level)
		end

	is_xml_html_unknown_tag: BOOLEAN is
		do
			Result := (value=xml_html_unknown_tag_low_level)
		end

	is_xml_http_unknown_host: BOOLEAN is
		do
			Result := (value=xml_http_unknown_host_low_level)
		end

	is_xml_http_url_syntax: BOOLEAN is
		do
			Result := (value=xml_http_url_syntax_low_level)
		end

	is_xml_http_use_ip: BOOLEAN is
		do
			Result := (value=xml_http_use_ip_low_level)
		end

	is_xml_i18n_conv_failed: BOOLEAN is
		do
			Result := (value=xml_i18n_conv_failed_low_level)
		end

	is_xml_i18n_excess_handler: BOOLEAN is
		do
			Result := (value=xml_i18n_excess_handler_low_level)
		end

	is_xml_i18n_no_handler: BOOLEAN is
		do
			Result := (value=xml_i18n_no_handler_low_level)
		end

	is_xml_i18n_no_name: BOOLEAN is
		do
			Result := (value=xml_i18n_no_name_low_level)
		end

	is_xml_i18n_no_output: BOOLEAN is
		do
			Result := (value=xml_i18n_no_output_low_level)
		end

	is_xml_io_buffer_full: BOOLEAN is
		do
			Result := (value=xml_io_buffer_full_low_level)
		end

	is_xml_io_eacces: BOOLEAN is
		do
			Result := (value=xml_io_eacces_low_level)
		end

	is_xml_io_eaddrinuse: BOOLEAN is
		do
			Result := (value=xml_io_eaddrinuse_low_level)
		end

	is_xml_io_eafnosupport: BOOLEAN is
		do
			Result := (value=xml_io_eafnosupport_low_level)
		end

	is_xml_io_eagain: BOOLEAN is
		do
			Result := (value=xml_io_eagain_low_level)
		end

	is_xml_io_ealready: BOOLEAN is
		do
			Result := (value=xml_io_ealready_low_level)
		end

	is_xml_io_ebadf: BOOLEAN is
		do
			Result := (value=xml_io_ebadf_low_level)
		end

	is_xml_io_ebadmsg: BOOLEAN is
		do
			Result := (value=xml_io_ebadmsg_low_level)
		end

	is_xml_io_ebusy: BOOLEAN is
		do
			Result := (value=xml_io_ebusy_low_level)
		end

	is_xml_io_ecanceled: BOOLEAN is
		do
			Result := (value=xml_io_ecanceled_low_level)
		end

	is_xml_io_echild: BOOLEAN is
		do
			Result := (value=xml_io_echild_low_level)
		end

	is_xml_io_econnrefused: BOOLEAN is
		do
			Result := (value=xml_io_econnrefused_low_level)
		end

	is_xml_io_edeadlk: BOOLEAN is
		do
			Result := (value=xml_io_edeadlk_low_level)
		end

	is_xml_io_edom: BOOLEAN is
		do
			Result := (value=xml_io_edom_low_level)
		end

	is_xml_io_eexist: BOOLEAN is
		do
			Result := (value=xml_io_eexist_low_level)
		end

	is_xml_io_efault: BOOLEAN is
		do
			Result := (value=xml_io_efault_low_level)
		end

	is_xml_io_efbig: BOOLEAN is
		do
			Result := (value=xml_io_efbig_low_level)
		end

	is_xml_io_einprogress: BOOLEAN is
		do
			Result := (value=xml_io_einprogress_low_level)
		end

	is_xml_io_eintr: BOOLEAN is
		do
			Result := (value=xml_io_eintr_low_level)
		end

	is_xml_io_einval: BOOLEAN is
		do
			Result := (value=xml_io_einval_low_level)
		end

	is_xml_io_eio: BOOLEAN is
		do
			Result := (value=xml_io_eio_low_level)
		end

	is_xml_io_eisconn: BOOLEAN is
		do
			Result := (value=xml_io_eisconn_low_level)
		end

	is_xml_io_eisdir: BOOLEAN is
		do
			Result := (value=xml_io_eisdir_low_level)
		end

	is_xml_io_emfile: BOOLEAN is
		do
			Result := (value=xml_io_emfile_low_level)
		end

	is_xml_io_emlink: BOOLEAN is
		do
			Result := (value=xml_io_emlink_low_level)
		end

	is_xml_io_emsgsize: BOOLEAN is
		do
			Result := (value=xml_io_emsgsize_low_level)
		end

	is_xml_io_enametoolong: BOOLEAN is
		do
			Result := (value=xml_io_enametoolong_low_level)
		end

	is_xml_io_encoder: BOOLEAN is
		do
			Result := (value=xml_io_encoder_low_level)
		end

	is_xml_io_enetunreach: BOOLEAN is
		do
			Result := (value=xml_io_enetunreach_low_level)
		end

	is_xml_io_enfile: BOOLEAN is
		do
			Result := (value=xml_io_enfile_low_level)
		end

	is_xml_io_enodev: BOOLEAN is
		do
			Result := (value=xml_io_enodev_low_level)
		end

	is_xml_io_enoent: BOOLEAN is
		do
			Result := (value=xml_io_enoent_low_level)
		end

	is_xml_io_enoexec: BOOLEAN is
		do
			Result := (value=xml_io_enoexec_low_level)
		end

	is_xml_io_enolck: BOOLEAN is
		do
			Result := (value=xml_io_enolck_low_level)
		end

	is_xml_io_enomem: BOOLEAN is
		do
			Result := (value=xml_io_enomem_low_level)
		end

	is_xml_io_enospc: BOOLEAN is
		do
			Result := (value=xml_io_enospc_low_level)
		end

	is_xml_io_enosys: BOOLEAN is
		do
			Result := (value=xml_io_enosys_low_level)
		end

	is_xml_io_enotdir: BOOLEAN is
		do
			Result := (value=xml_io_enotdir_low_level)
		end

	is_xml_io_enotempty: BOOLEAN is
		do
			Result := (value=xml_io_enotempty_low_level)
		end

	is_xml_io_enotsock: BOOLEAN is
		do
			Result := (value=xml_io_enotsock_low_level)
		end

	is_xml_io_enotsup: BOOLEAN is
		do
			Result := (value=xml_io_enotsup_low_level)
		end

	is_xml_io_enotty: BOOLEAN is
		do
			Result := (value=xml_io_enotty_low_level)
		end

	is_xml_io_enxio: BOOLEAN is
		do
			Result := (value=xml_io_enxio_low_level)
		end

	is_xml_io_eperm: BOOLEAN is
		do
			Result := (value=xml_io_eperm_low_level)
		end

	is_xml_io_epipe: BOOLEAN is
		do
			Result := (value=xml_io_epipe_low_level)
		end

	is_xml_io_erange: BOOLEAN is
		do
			Result := (value=xml_io_erange_low_level)
		end

	is_xml_io_erofs: BOOLEAN is
		do
			Result := (value=xml_io_erofs_low_level)
		end

	is_xml_io_espipe: BOOLEAN is
		do
			Result := (value=xml_io_espipe_low_level)
		end

	is_xml_io_esrch: BOOLEAN is
		do
			Result := (value=xml_io_esrch_low_level)
		end

	is_xml_io_etimedout: BOOLEAN is
		do
			Result := (value=xml_io_etimedout_low_level)
		end

	is_xml_io_exdev: BOOLEAN is
		do
			Result := (value=xml_io_exdev_low_level)
		end

	is_xml_io_flush: BOOLEAN is
		do
			Result := (value=xml_io_flush_low_level)
		end

	is_xml_io_load_error: BOOLEAN is
		do
			Result := (value=xml_io_load_error_low_level)
		end

	is_xml_io_network_attempt: BOOLEAN is
		do
			Result := (value=xml_io_network_attempt_low_level)
		end

	is_xml_io_no_input: BOOLEAN is
		do
			Result := (value=xml_io_no_input_low_level)
		end

	is_xml_io_unknown: BOOLEAN is
		do
			Result := (value=xml_io_unknown_low_level)
		end

	is_xml_io_write: BOOLEAN is
		do
			Result := (value=xml_io_write_low_level)
		end

	is_xml_module_close: BOOLEAN is
		do
			Result := (value=xml_module_close_low_level)
		end

	is_xml_module_open: BOOLEAN is
		do
			Result := (value=xml_module_open_low_level)
		end

	is_xml_ns_err_attribute_redefined: BOOLEAN is
		do
			Result := (value=xml_ns_err_attribute_redefined_low_level)
		end

	is_xml_ns_err_colon: BOOLEAN is
		do
			Result := (value=xml_ns_err_colon_low_level)
		end

	is_xml_ns_err_empty: BOOLEAN is
		do
			Result := (value=xml_ns_err_empty_low_level)
		end

	is_xml_ns_err_qname: BOOLEAN is
		do
			Result := (value=xml_ns_err_qname_low_level)
		end

	is_xml_ns_err_undefined_namespace: BOOLEAN is
		do
			Result := (value=xml_ns_err_undefined_namespace_low_level)
		end

	is_xml_ns_err_xml_namespace: BOOLEAN is
		do
			Result := (value=xml_ns_err_xml_namespace_low_level)
		end

	is_xml_regexp_compile_error: BOOLEAN is
		do
			Result := (value=xml_regexp_compile_error_low_level)
		end

	is_xml_rngp_anyname_attr_ancestor: BOOLEAN is
		do
			Result := (value=xml_rngp_anyname_attr_ancestor_low_level)
		end

	is_xml_rngp_attr_conflict: BOOLEAN is
		do
			Result := (value=xml_rngp_attr_conflict_low_level)
		end

	is_xml_rngp_attribute_children: BOOLEAN is
		do
			Result := (value=xml_rngp_attribute_children_low_level)
		end

	is_xml_rngp_attribute_content: BOOLEAN is
		do
			Result := (value=xml_rngp_attribute_content_low_level)
		end

	is_xml_rngp_attribute_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_attribute_empty_low_level)
		end

	is_xml_rngp_attribute_noop: BOOLEAN is
		do
			Result := (value=xml_rngp_attribute_noop_low_level)
		end

	is_xml_rngp_choice_content: BOOLEAN is
		do
			Result := (value=xml_rngp_choice_content_low_level)
		end

	is_xml_rngp_choice_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_choice_empty_low_level)
		end

	is_xml_rngp_create_failure: BOOLEAN is
		do
			Result := (value=xml_rngp_create_failure_low_level)
		end

	is_xml_rngp_data_content: BOOLEAN is
		do
			Result := (value=xml_rngp_data_content_low_level)
		end

	is_xml_rngp_def_choice_and_interleave: BOOLEAN is
		do
			Result := (value=xml_rngp_def_choice_and_interleave_low_level)
		end

	is_xml_rngp_define_create_failed: BOOLEAN is
		do
			Result := (value=xml_rngp_define_create_failed_low_level)
		end

	is_xml_rngp_define_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_define_empty_low_level)
		end

	is_xml_rngp_define_missing: BOOLEAN is
		do
			Result := (value=xml_rngp_define_missing_low_level)
		end

	is_xml_rngp_define_name_missing: BOOLEAN is
		do
			Result := (value=xml_rngp_define_name_missing_low_level)
		end

	is_xml_rngp_elem_content_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_elem_content_empty_low_level)
		end

	is_xml_rngp_elem_content_error: BOOLEAN is
		do
			Result := (value=xml_rngp_elem_content_error_low_level)
		end

	is_xml_rngp_elem_text_conflict: BOOLEAN is
		do
			Result := (value=xml_rngp_elem_text_conflict_low_level)
		end

	is_xml_rngp_element_content: BOOLEAN is
		do
			Result := (value=xml_rngp_element_content_low_level)
		end

	is_xml_rngp_element_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_element_empty_low_level)
		end

	is_xml_rngp_element_name: BOOLEAN is
		do
			Result := (value=xml_rngp_element_name_low_level)
		end

	is_xml_rngp_element_no_content: BOOLEAN is
		do
			Result := (value=xml_rngp_element_no_content_low_level)
		end

	is_xml_rngp_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_empty_low_level)
		end

	is_xml_rngp_empty_construct: BOOLEAN is
		do
			Result := (value=xml_rngp_empty_construct_low_level)
		end

	is_xml_rngp_empty_content: BOOLEAN is
		do
			Result := (value=xml_rngp_empty_content_low_level)
		end

	is_xml_rngp_empty_not_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_empty_not_empty_low_level)
		end

	is_xml_rngp_error_type_lib: BOOLEAN is
		do
			Result := (value=xml_rngp_error_type_lib_low_level)
		end

	is_xml_rngp_except_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_except_empty_low_level)
		end

	is_xml_rngp_except_missing: BOOLEAN is
		do
			Result := (value=xml_rngp_except_missing_low_level)
		end

	is_xml_rngp_except_multiple: BOOLEAN is
		do
			Result := (value=xml_rngp_except_multiple_low_level)
		end

	is_xml_rngp_except_no_content: BOOLEAN is
		do
			Result := (value=xml_rngp_except_no_content_low_level)
		end

	is_xml_rngp_external_ref_failure: BOOLEAN is
		do
			Result := (value=xml_rngp_external_ref_failure_low_level)
		end

	is_xml_rngp_externalref_emtpy: BOOLEAN is
		do
			Result := (value=xml_rngp_externalref_emtpy_low_level)
		end

	is_xml_rngp_externalref_recurse: BOOLEAN is
		do
			Result := (value=xml_rngp_externalref_recurse_low_level)
		end

	is_xml_rngp_forbidden_attribute: BOOLEAN is
		do
			Result := (value=xml_rngp_forbidden_attribute_low_level)
		end

	is_xml_rngp_foreign_element: BOOLEAN is
		do
			Result := (value=xml_rngp_foreign_element_low_level)
		end

	is_xml_rngp_grammar_content: BOOLEAN is
		do
			Result := (value=xml_rngp_grammar_content_low_level)
		end

	is_xml_rngp_grammar_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_grammar_empty_low_level)
		end

	is_xml_rngp_grammar_missing: BOOLEAN is
		do
			Result := (value=xml_rngp_grammar_missing_low_level)
		end

	is_xml_rngp_grammar_no_start: BOOLEAN is
		do
			Result := (value=xml_rngp_grammar_no_start_low_level)
		end

	is_xml_rngp_group_attr_conflict: BOOLEAN is
		do
			Result := (value=xml_rngp_group_attr_conflict_low_level)
		end

	is_xml_rngp_href_error: BOOLEAN is
		do
			Result := (value=xml_rngp_href_error_low_level)
		end

	is_xml_rngp_include_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_include_empty_low_level)
		end

	is_xml_rngp_include_failure: BOOLEAN is
		do
			Result := (value=xml_rngp_include_failure_low_level)
		end

	is_xml_rngp_include_recurse: BOOLEAN is
		do
			Result := (value=xml_rngp_include_recurse_low_level)
		end

	is_xml_rngp_interleave_add: BOOLEAN is
		do
			Result := (value=xml_rngp_interleave_add_low_level)
		end

	is_xml_rngp_interleave_create_failed: BOOLEAN is
		do
			Result := (value=xml_rngp_interleave_create_failed_low_level)
		end

	is_xml_rngp_interleave_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_interleave_empty_low_level)
		end

	is_xml_rngp_interleave_no_content: BOOLEAN is
		do
			Result := (value=xml_rngp_interleave_no_content_low_level)
		end

	is_xml_rngp_invalid_define_name: BOOLEAN is
		do
			Result := (value=xml_rngp_invalid_define_name_low_level)
		end

	is_xml_rngp_invalid_uri: BOOLEAN is
		do
			Result := (value=xml_rngp_invalid_uri_low_level)
		end

	is_xml_rngp_invalid_value: BOOLEAN is
		do
			Result := (value=xml_rngp_invalid_value_low_level)
		end

	is_xml_rngp_missing_href: BOOLEAN is
		do
			Result := (value=xml_rngp_missing_href_low_level)
		end

	is_xml_rngp_name_missing: BOOLEAN is
		do
			Result := (value=xml_rngp_name_missing_low_level)
		end

	is_xml_rngp_need_combine: BOOLEAN is
		do
			Result := (value=xml_rngp_need_combine_low_level)
		end

	is_xml_rngp_notallowed_not_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_notallowed_not_empty_low_level)
		end

	is_xml_rngp_nsname_attr_ancestor: BOOLEAN is
		do
			Result := (value=xml_rngp_nsname_attr_ancestor_low_level)
		end

	is_xml_rngp_nsname_no_ns: BOOLEAN is
		do
			Result := (value=xml_rngp_nsname_no_ns_low_level)
		end

	is_xml_rngp_param_forbidden: BOOLEAN is
		do
			Result := (value=xml_rngp_param_forbidden_low_level)
		end

	is_xml_rngp_param_name_missing: BOOLEAN is
		do
			Result := (value=xml_rngp_param_name_missing_low_level)
		end

	is_xml_rngp_parentref_create_failed: BOOLEAN is
		do
			Result := (value=xml_rngp_parentref_create_failed_low_level)
		end

	is_xml_rngp_parentref_name_invalid: BOOLEAN is
		do
			Result := (value=xml_rngp_parentref_name_invalid_low_level)
		end

	is_xml_rngp_parentref_no_name: BOOLEAN is
		do
			Result := (value=xml_rngp_parentref_no_name_low_level)
		end

	is_xml_rngp_parentref_no_parent: BOOLEAN is
		do
			Result := (value=xml_rngp_parentref_no_parent_low_level)
		end

	is_xml_rngp_parentref_not_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_parentref_not_empty_low_level)
		end

	is_xml_rngp_parse_error: BOOLEAN is
		do
			Result := (value=xml_rngp_parse_error_low_level)
		end

	is_xml_rngp_pat_anyname_except_anyname: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_anyname_except_anyname_low_level)
		end

	is_xml_rngp_pat_attr_attr: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_attr_attr_low_level)
		end

	is_xml_rngp_pat_attr_elem: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_attr_elem_low_level)
		end

	is_xml_rngp_pat_data_except_attr: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_data_except_attr_low_level)
		end

	is_xml_rngp_pat_data_except_elem: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_data_except_elem_low_level)
		end

	is_xml_rngp_pat_data_except_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_data_except_empty_low_level)
		end

	is_xml_rngp_pat_data_except_group: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_data_except_group_low_level)
		end

	is_xml_rngp_pat_data_except_interleave: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_data_except_interleave_low_level)
		end

	is_xml_rngp_pat_data_except_list: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_data_except_list_low_level)
		end

	is_xml_rngp_pat_data_except_onemore: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_data_except_onemore_low_level)
		end

	is_xml_rngp_pat_data_except_ref: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_data_except_ref_low_level)
		end

	is_xml_rngp_pat_data_except_text: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_data_except_text_low_level)
		end

	is_xml_rngp_pat_list_attr: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_list_attr_low_level)
		end

	is_xml_rngp_pat_list_elem: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_list_elem_low_level)
		end

	is_xml_rngp_pat_list_interleave: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_list_interleave_low_level)
		end

	is_xml_rngp_pat_list_list: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_list_list_low_level)
		end

	is_xml_rngp_pat_list_ref: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_list_ref_low_level)
		end

	is_xml_rngp_pat_list_text: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_list_text_low_level)
		end

	is_xml_rngp_pat_nsname_except_anyname: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_nsname_except_anyname_low_level)
		end

	is_xml_rngp_pat_nsname_except_nsname: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_nsname_except_nsname_low_level)
		end

	is_xml_rngp_pat_onemore_group_attr: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_onemore_group_attr_low_level)
		end

	is_xml_rngp_pat_onemore_interleave_attr: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_onemore_interleave_attr_low_level)
		end

	is_xml_rngp_pat_start_attr: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_start_attr_low_level)
		end

	is_xml_rngp_pat_start_data: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_start_data_low_level)
		end

	is_xml_rngp_pat_start_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_start_empty_low_level)
		end

	is_xml_rngp_pat_start_group: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_start_group_low_level)
		end

	is_xml_rngp_pat_start_interleave: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_start_interleave_low_level)
		end

	is_xml_rngp_pat_start_list: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_start_list_low_level)
		end

	is_xml_rngp_pat_start_onemore: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_start_onemore_low_level)
		end

	is_xml_rngp_pat_start_text: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_start_text_low_level)
		end

	is_xml_rngp_pat_start_value: BOOLEAN is
		do
			Result := (value=xml_rngp_pat_start_value_low_level)
		end

	is_xml_rngp_prefix_undefined: BOOLEAN is
		do
			Result := (value=xml_rngp_prefix_undefined_low_level)
		end

	is_xml_rngp_ref_create_failed: BOOLEAN is
		do
			Result := (value=xml_rngp_ref_create_failed_low_level)
		end

	is_xml_rngp_ref_cycle: BOOLEAN is
		do
			Result := (value=xml_rngp_ref_cycle_low_level)
		end

	is_xml_rngp_ref_name_invalid: BOOLEAN is
		do
			Result := (value=xml_rngp_ref_name_invalid_low_level)
		end

	is_xml_rngp_ref_no_def: BOOLEAN is
		do
			Result := (value=xml_rngp_ref_no_def_low_level)
		end

	is_xml_rngp_ref_no_name: BOOLEAN is
		do
			Result := (value=xml_rngp_ref_no_name_low_level)
		end

	is_xml_rngp_ref_not_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_ref_not_empty_low_level)
		end

	is_xml_rngp_start_choice_and_interleave: BOOLEAN is
		do
			Result := (value=xml_rngp_start_choice_and_interleave_low_level)
		end

	is_xml_rngp_start_content: BOOLEAN is
		do
			Result := (value=xml_rngp_start_content_low_level)
		end

	is_xml_rngp_start_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_start_empty_low_level)
		end

	is_xml_rngp_start_missing: BOOLEAN is
		do
			Result := (value=xml_rngp_start_missing_low_level)
		end

	is_xml_rngp_text_expected: BOOLEAN is
		do
			Result := (value=xml_rngp_text_expected_low_level)
		end

	is_xml_rngp_text_has_child: BOOLEAN is
		do
			Result := (value=xml_rngp_text_has_child_low_level)
		end

	is_xml_rngp_type_missing: BOOLEAN is
		do
			Result := (value=xml_rngp_type_missing_low_level)
		end

	is_xml_rngp_type_not_found: BOOLEAN is
		do
			Result := (value=xml_rngp_type_not_found_low_level)
		end

	is_xml_rngp_type_value: BOOLEAN is
		do
			Result := (value=xml_rngp_type_value_low_level)
		end

	is_xml_rngp_unknown_attribute: BOOLEAN is
		do
			Result := (value=xml_rngp_unknown_attribute_low_level)
		end

	is_xml_rngp_unknown_combine: BOOLEAN is
		do
			Result := (value=xml_rngp_unknown_combine_low_level)
		end

	is_xml_rngp_unknown_construct: BOOLEAN is
		do
			Result := (value=xml_rngp_unknown_construct_low_level)
		end

	is_xml_rngp_unknown_type_lib: BOOLEAN is
		do
			Result := (value=xml_rngp_unknown_type_lib_low_level)
		end

	is_xml_rngp_uri_fragment: BOOLEAN is
		do
			Result := (value=xml_rngp_uri_fragment_low_level)
		end

	is_xml_rngp_uri_not_absolute: BOOLEAN is
		do
			Result := (value=xml_rngp_uri_not_absolute_low_level)
		end

	is_xml_rngp_value_empty: BOOLEAN is
		do
			Result := (value=xml_rngp_value_empty_low_level)
		end

	is_xml_rngp_value_no_content: BOOLEAN is
		do
			Result := (value=xml_rngp_value_no_content_low_level)
		end

	is_xml_rngp_xml_ns: BOOLEAN is
		do
			Result := (value=xml_rngp_xml_ns_low_level)
		end

	is_xml_rngp_xmlns_name: BOOLEAN is
		do
			Result := (value=xml_rngp_xmlns_name_low_level)
		end

	is_xml_save_char_invalid: BOOLEAN is
		do
			Result := (value=xml_save_char_invalid_low_level)
		end

	is_xml_save_no_doctype: BOOLEAN is
		do
			Result := (value=xml_save_no_doctype_low_level)
		end

	is_xml_save_not_utf8: BOOLEAN is
		do
			Result := (value=xml_save_not_utf8_low_level)
		end

	is_xml_save_unknown_encoding: BOOLEAN is
		do
			Result := (value=xml_save_unknown_encoding_low_level)
		end

	is_xml_schemap_a_props_correct_2: BOOLEAN is
		do
			Result := (value=xml_schemap_a_props_correct_2_low_level)
		end

	is_xml_schemap_a_props_correct_3: BOOLEAN is
		do
			Result := (value=xml_schemap_a_props_correct_3_low_level)
		end

	is_xml_schemap_ag_props_correct: BOOLEAN is
		do
			Result := (value=xml_schemap_ag_props_correct_low_level)
		end

	is_xml_schemap_attr_noname_noref: BOOLEAN is
		do
			Result := (value=xml_schemap_attr_noname_noref_low_level)
		end

	is_xml_schemap_attrformdefault_value: BOOLEAN is
		do
			Result := (value=xml_schemap_attrformdefault_value_low_level)
		end

	is_xml_schemap_attrgrp_noname_noref: BOOLEAN is
		do
			Result := (value=xml_schemap_attrgrp_noname_noref_low_level)
		end

	is_xml_schemap_au_props_correct: BOOLEAN is
		do
			Result := (value=xml_schemap_au_props_correct_low_level)
		end

	is_xml_schemap_au_props_correct_2: BOOLEAN is
		do
			Result := (value=xml_schemap_au_props_correct_2_low_level)
		end

	is_xml_schemap_c_props_correct: BOOLEAN is
		do
			Result := (value=xml_schemap_c_props_correct_low_level)
		end

	is_xml_schemap_complextype_noname_noref: BOOLEAN is
		do
			Result := (value=xml_schemap_complextype_noname_noref_low_level)
		end

	is_xml_schemap_cos_all_limited: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_all_limited_low_level)
		end

	is_xml_schemap_cos_ct_extends_1_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_ct_extends_1_1_low_level)
		end

	is_xml_schemap_cos_ct_extends_1_2: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_ct_extends_1_2_low_level)
		end

	is_xml_schemap_cos_ct_extends_1_3: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_ct_extends_1_3_low_level)
		end

	is_xml_schemap_cos_st_derived_ok_2_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_derived_ok_2_1_low_level)
		end

	is_xml_schemap_cos_st_derived_ok_2_2: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_derived_ok_2_2_low_level)
		end

	is_xml_schemap_cos_st_restricts_1_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_1_1_low_level)
		end

	is_xml_schemap_cos_st_restricts_1_2: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_1_2_low_level)
		end

	is_xml_schemap_cos_st_restricts_1_3_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_1_3_1_low_level)
		end

	is_xml_schemap_cos_st_restricts_1_3_2: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_1_3_2_low_level)
		end

	is_xml_schemap_cos_st_restricts_2_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_2_1_low_level)
		end

	is_xml_schemap_cos_st_restricts_2_3_1_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_1_1_low_level)
		end

	is_xml_schemap_cos_st_restricts_2_3_1_2: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_1_2_low_level)
		end

	is_xml_schemap_cos_st_restricts_2_3_2_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_2_1_low_level)
		end

	is_xml_schemap_cos_st_restricts_2_3_2_2: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_2_2_low_level)
		end

	is_xml_schemap_cos_st_restricts_2_3_2_3: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_2_3_low_level)
		end

	is_xml_schemap_cos_st_restricts_2_3_2_4: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_2_4_low_level)
		end

	is_xml_schemap_cos_st_restricts_2_3_2_5: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_2_5_low_level)
		end

	is_xml_schemap_cos_st_restricts_3_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_3_1_low_level)
		end

	is_xml_schemap_cos_st_restricts_3_3_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_1_low_level)
		end

	is_xml_schemap_cos_st_restricts_3_3_1_2: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_1_2_low_level)
		end

	is_xml_schemap_cos_st_restricts_3_3_2_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_2_1_low_level)
		end

	is_xml_schemap_cos_st_restricts_3_3_2_2: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_2_2_low_level)
		end

	is_xml_schemap_cos_st_restricts_3_3_2_3: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_2_3_low_level)
		end

	is_xml_schemap_cos_st_restricts_3_3_2_4: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_2_4_low_level)
		end

	is_xml_schemap_cos_st_restricts_3_3_2_5: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_2_5_low_level)
		end

	is_xml_schemap_cos_valid_default_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_valid_default_1_low_level)
		end

	is_xml_schemap_cos_valid_default_2_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_valid_default_2_1_low_level)
		end

	is_xml_schemap_cos_valid_default_2_2_1: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_valid_default_2_2_1_low_level)
		end

	is_xml_schemap_cos_valid_default_2_2_2: BOOLEAN is
		do
			Result := (value=xml_schemap_cos_valid_default_2_2_2_low_level)
		end

	is_xml_schemap_ct_props_correct_1: BOOLEAN is
		do
			Result := (value=xml_schemap_ct_props_correct_1_low_level)
		end

	is_xml_schemap_ct_props_correct_2: BOOLEAN is
		do
			Result := (value=xml_schemap_ct_props_correct_2_low_level)
		end

	is_xml_schemap_ct_props_correct_3: BOOLEAN is
		do
			Result := (value=xml_schemap_ct_props_correct_3_low_level)
		end

	is_xml_schemap_ct_props_correct_4: BOOLEAN is
		do
			Result := (value=xml_schemap_ct_props_correct_4_low_level)
		end

	is_xml_schemap_ct_props_correct_5: BOOLEAN is
		do
			Result := (value=xml_schemap_ct_props_correct_5_low_level)
		end

	is_xml_schemap_cvc_simple_type: BOOLEAN is
		do
			Result := (value=xml_schemap_cvc_simple_type_low_level)
		end

	is_xml_schemap_def_and_prefix: BOOLEAN is
		do
			Result := (value=xml_schemap_def_and_prefix_low_level)
		end

	is_xml_schemap_derivation_ok_restriction_1: BOOLEAN is
		do
			Result := (value=xml_schemap_derivation_ok_restriction_1_low_level)
		end

	is_xml_schemap_derivation_ok_restriction_2_1_1: BOOLEAN is
		do
			Result := (value=xml_schemap_derivation_ok_restriction_2_1_1_low_level)
		end

	is_xml_schemap_derivation_ok_restriction_2_1_2: BOOLEAN is
		do
			Result := (value=xml_schemap_derivation_ok_restriction_2_1_2_low_level)
		end

	is_xml_schemap_derivation_ok_restriction_2_1_3: BOOLEAN is
		do
			Result := (value=xml_schemap_derivation_ok_restriction_2_1_3_low_level)
		end

	is_xml_schemap_derivation_ok_restriction_2_2: BOOLEAN is
		do
			Result := (value=xml_schemap_derivation_ok_restriction_2_2_low_level)
		end

	is_xml_schemap_derivation_ok_restriction_3: BOOLEAN is
		do
			Result := (value=xml_schemap_derivation_ok_restriction_3_low_level)
		end

	is_xml_schemap_derivation_ok_restriction_4_1: BOOLEAN is
		do
			Result := (value=xml_schemap_derivation_ok_restriction_4_1_low_level)
		end

	is_xml_schemap_derivation_ok_restriction_4_2: BOOLEAN is
		do
			Result := (value=xml_schemap_derivation_ok_restriction_4_2_low_level)
		end

	is_xml_schemap_derivation_ok_restriction_4_3: BOOLEAN is
		do
			Result := (value=xml_schemap_derivation_ok_restriction_4_3_low_level)
		end

	is_xml_schemap_e_props_correct_2: BOOLEAN is
		do
			Result := (value=xml_schemap_e_props_correct_2_low_level)
		end

	is_xml_schemap_e_props_correct_3: BOOLEAN is
		do
			Result := (value=xml_schemap_e_props_correct_3_low_level)
		end

	is_xml_schemap_e_props_correct_4: BOOLEAN is
		do
			Result := (value=xml_schemap_e_props_correct_4_low_level)
		end

	is_xml_schemap_e_props_correct_5: BOOLEAN is
		do
			Result := (value=xml_schemap_e_props_correct_5_low_level)
		end

	is_xml_schemap_e_props_correct_6: BOOLEAN is
		do
			Result := (value=xml_schemap_e_props_correct_6_low_level)
		end

	is_xml_schemap_elem_default_fixed: BOOLEAN is
		do
			Result := (value=xml_schemap_elem_default_fixed_low_level)
		end

	is_xml_schemap_elem_noname_noref: BOOLEAN is
		do
			Result := (value=xml_schemap_elem_noname_noref_low_level)
		end

	is_xml_schemap_elemformdefault_value: BOOLEAN is
		do
			Result := (value=xml_schemap_elemformdefault_value_low_level)
		end

	is_xml_schemap_extension_no_base: BOOLEAN is
		do
			Result := (value=xml_schemap_extension_no_base_low_level)
		end

	is_xml_schemap_facet_no_value: BOOLEAN is
		do
			Result := (value=xml_schemap_facet_no_value_low_level)
		end

	is_xml_schemap_failed_build_import: BOOLEAN is
		do
			Result := (value=xml_schemap_failed_build_import_low_level)
		end

	is_xml_schemap_failed_load: BOOLEAN is
		do
			Result := (value=xml_schemap_failed_load_low_level)
		end

	is_xml_schemap_failed_parse: BOOLEAN is
		do
			Result := (value=xml_schemap_failed_parse_low_level)
		end

	is_xml_schemap_group_noname_noref: BOOLEAN is
		do
			Result := (value=xml_schemap_group_noname_noref_low_level)
		end

	is_xml_schemap_import_namespace_not_uri: BOOLEAN is
		do
			Result := (value=xml_schemap_import_namespace_not_uri_low_level)
		end

	is_xml_schemap_import_redefine_nsname: BOOLEAN is
		do
			Result := (value=xml_schemap_import_redefine_nsname_low_level)
		end

	is_xml_schemap_import_schema_not_uri: BOOLEAN is
		do
			Result := (value=xml_schemap_import_schema_not_uri_low_level)
		end

	is_xml_schemap_include_schema_no_uri: BOOLEAN is
		do
			Result := (value=xml_schemap_include_schema_no_uri_low_level)
		end

	is_xml_schemap_include_schema_not_uri: BOOLEAN is
		do
			Result := (value=xml_schemap_include_schema_not_uri_low_level)
		end

	is_xml_schemap_internal: BOOLEAN is
		do
			Result := (value=xml_schemap_internal_low_level)
		end

	is_xml_schemap_intersection_not_expressible: BOOLEAN is
		do
			Result := (value=xml_schemap_intersection_not_expressible_low_level)
		end

	is_xml_schemap_invalid_attr_combination: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_attr_combination_low_level)
		end

	is_xml_schemap_invalid_attr_inline_combination: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_attr_inline_combination_low_level)
		end

	is_xml_schemap_invalid_attr_name: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_attr_name_low_level)
		end

	is_xml_schemap_invalid_attr_use: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_attr_use_low_level)
		end

	is_xml_schemap_invalid_boolean: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_boolean_low_level)
		end

	is_xml_schemap_invalid_enum: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_enum_low_level)
		end

	is_xml_schemap_invalid_facet: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_facet_low_level)
		end

	is_xml_schemap_invalid_facet_value: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_facet_value_low_level)
		end

	is_xml_schemap_invalid_maxoccurs: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_maxoccurs_low_level)
		end

	is_xml_schemap_invalid_minoccurs: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_minoccurs_low_level)
		end

	is_xml_schemap_invalid_ref_and_subtype: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_ref_and_subtype_low_level)
		end

	is_xml_schemap_invalid_white_space: BOOLEAN is
		do
			Result := (value=xml_schemap_invalid_white_space_low_level)
		end

	is_xml_schemap_mg_props_correct_1: BOOLEAN is
		do
			Result := (value=xml_schemap_mg_props_correct_1_low_level)
		end

	is_xml_schemap_mg_props_correct_2: BOOLEAN is
		do
			Result := (value=xml_schemap_mg_props_correct_2_low_level)
		end

	is_xml_schemap_missing_simpletype_child: BOOLEAN is
		do
			Result := (value=xml_schemap_missing_simpletype_child_low_level)
		end

	is_xml_schemap_no_xmlns: BOOLEAN is
		do
			Result := (value=xml_schemap_no_xmlns_low_level)
		end

	is_xml_schemap_no_xsi: BOOLEAN is
		do
			Result := (value=xml_schemap_no_xsi_low_level)
		end

	is_xml_schemap_noattr_noref: BOOLEAN is
		do
			Result := (value=xml_schemap_noattr_noref_low_level)
		end

	is_xml_schemap_noroot: BOOLEAN is
		do
			Result := (value=xml_schemap_noroot_low_level)
		end

	is_xml_schemap_not_deterministic: BOOLEAN is
		do
			Result := (value=xml_schemap_not_deterministic_low_level)
		end

	is_xml_schemap_not_schema: BOOLEAN is
		do
			Result := (value=xml_schemap_not_schema_low_level)
		end

	is_xml_schemap_notation_no_name: BOOLEAN is
		do
			Result := (value=xml_schemap_notation_no_name_low_level)
		end

	is_xml_schemap_nothing_to_parse: BOOLEAN is
		do
			Result := (value=xml_schemap_nothing_to_parse_low_level)
		end

	is_xml_schemap_notype_noref: BOOLEAN is
		do
			Result := (value=xml_schemap_notype_noref_low_level)
		end

	is_xml_schemap_p_props_correct_1: BOOLEAN is
		do
			Result := (value=xml_schemap_p_props_correct_1_low_level)
		end

	is_xml_schemap_p_props_correct_2_1: BOOLEAN is
		do
			Result := (value=xml_schemap_p_props_correct_2_1_low_level)
		end

	is_xml_schemap_p_props_correct_2_2: BOOLEAN is
		do
			Result := (value=xml_schemap_p_props_correct_2_2_low_level)
		end

	is_xml_schemap_prefix_undefined: BOOLEAN is
		do
			Result := (value=xml_schemap_prefix_undefined_low_level)
		end

	is_xml_schemap_recursive: BOOLEAN is
		do
			Result := (value=xml_schemap_recursive_low_level)
		end

	is_xml_schemap_redefined_attr: BOOLEAN is
		do
			Result := (value=xml_schemap_redefined_attr_low_level)
		end

	is_xml_schemap_redefined_attrgroup: BOOLEAN is
		do
			Result := (value=xml_schemap_redefined_attrgroup_low_level)
		end

	is_xml_schemap_redefined_element: BOOLEAN is
		do
			Result := (value=xml_schemap_redefined_element_low_level)
		end

	is_xml_schemap_redefined_group: BOOLEAN is
		do
			Result := (value=xml_schemap_redefined_group_low_level)
		end

	is_xml_schemap_redefined_notation: BOOLEAN is
		do
			Result := (value=xml_schemap_redefined_notation_low_level)
		end

	is_xml_schemap_redefined_type: BOOLEAN is
		do
			Result := (value=xml_schemap_redefined_type_low_level)
		end

	is_xml_schemap_ref_and_content: BOOLEAN is
		do
			Result := (value=xml_schemap_ref_and_content_low_level)
		end

	is_xml_schemap_ref_and_subtype: BOOLEAN is
		do
			Result := (value=xml_schemap_ref_and_subtype_low_level)
		end

	is_xml_schemap_regexp_invalid: BOOLEAN is
		do
			Result := (value=xml_schemap_regexp_invalid_low_level)
		end

	is_xml_schemap_restriction_noname_noref: BOOLEAN is
		do
			Result := (value=xml_schemap_restriction_noname_noref_low_level)
		end

	is_xml_schemap_s4s_attr_invalid_value: BOOLEAN is
		do
			Result := (value=xml_schemap_s4s_attr_invalid_value_low_level)
		end

	is_xml_schemap_s4s_attr_missing: BOOLEAN is
		do
			Result := (value=xml_schemap_s4s_attr_missing_low_level)
		end

	is_xml_schemap_s4s_attr_not_allowed: BOOLEAN is
		do
			Result := (value=xml_schemap_s4s_attr_not_allowed_low_level)
		end

	is_xml_schemap_s4s_elem_missing: BOOLEAN is
		do
			Result := (value=xml_schemap_s4s_elem_missing_low_level)
		end

	is_xml_schemap_s4s_elem_not_allowed: BOOLEAN is
		do
			Result := (value=xml_schemap_s4s_elem_not_allowed_low_level)
		end

	is_xml_schemap_simpletype_noname: BOOLEAN is
		do
			Result := (value=xml_schemap_simpletype_noname_low_level)
		end

	is_xml_schemap_src_attribute_1: BOOLEAN is
		do
			Result := (value=xml_schemap_src_attribute_1_low_level)
		end

	is_xml_schemap_src_attribute_2: BOOLEAN is
		do
			Result := (value=xml_schemap_src_attribute_2_low_level)
		end

	is_xml_schemap_src_attribute_3_1: BOOLEAN is
		do
			Result := (value=xml_schemap_src_attribute_3_1_low_level)
		end

	is_xml_schemap_src_attribute_3_2: BOOLEAN is
		do
			Result := (value=xml_schemap_src_attribute_3_2_low_level)
		end

	is_xml_schemap_src_attribute_4: BOOLEAN is
		do
			Result := (value=xml_schemap_src_attribute_4_low_level)
		end

	is_xml_schemap_src_attribute_group_1: BOOLEAN is
		do
			Result := (value=xml_schemap_src_attribute_group_1_low_level)
		end

	is_xml_schemap_src_attribute_group_2: BOOLEAN is
		do
			Result := (value=xml_schemap_src_attribute_group_2_low_level)
		end

	is_xml_schemap_src_attribute_group_3: BOOLEAN is
		do
			Result := (value=xml_schemap_src_attribute_group_3_low_level)
		end

	is_xml_schemap_src_ct_1: BOOLEAN is
		do
			Result := (value=xml_schemap_src_ct_1_low_level)
		end

	is_xml_schemap_src_element_1: BOOLEAN is
		do
			Result := (value=xml_schemap_src_element_1_low_level)
		end

	is_xml_schemap_src_element_2_1: BOOLEAN is
		do
			Result := (value=xml_schemap_src_element_2_1_low_level)
		end

	is_xml_schemap_src_element_2_2: BOOLEAN is
		do
			Result := (value=xml_schemap_src_element_2_2_low_level)
		end

	is_xml_schemap_src_element_3: BOOLEAN is
		do
			Result := (value=xml_schemap_src_element_3_low_level)
		end

	is_xml_schemap_src_import: BOOLEAN is
		do
			Result := (value=xml_schemap_src_import_low_level)
		end

	is_xml_schemap_src_import_1_1: BOOLEAN is
		do
			Result := (value=xml_schemap_src_import_1_1_low_level)
		end

	is_xml_schemap_src_import_1_2: BOOLEAN is
		do
			Result := (value=xml_schemap_src_import_1_2_low_level)
		end

	is_xml_schemap_src_import_2: BOOLEAN is
		do
			Result := (value=xml_schemap_src_import_2_low_level)
		end

	is_xml_schemap_src_import_2_1: BOOLEAN is
		do
			Result := (value=xml_schemap_src_import_2_1_low_level)
		end

	is_xml_schemap_src_import_2_2: BOOLEAN is
		do
			Result := (value=xml_schemap_src_import_2_2_low_level)
		end

	is_xml_schemap_src_import_3_1: BOOLEAN is
		do
			Result := (value=xml_schemap_src_import_3_1_low_level)
		end

	is_xml_schemap_src_import_3_2: BOOLEAN is
		do
			Result := (value=xml_schemap_src_import_3_2_low_level)
		end

	is_xml_schemap_src_include: BOOLEAN is
		do
			Result := (value=xml_schemap_src_include_low_level)
		end

	is_xml_schemap_src_list_itemtype_or_simpletype: BOOLEAN is
		do
			Result := (value=xml_schemap_src_list_itemtype_or_simpletype_low_level)
		end

	is_xml_schemap_src_redefine: BOOLEAN is
		do
			Result := (value=xml_schemap_src_redefine_low_level)
		end

	is_xml_schemap_src_resolve: BOOLEAN is
		do
			Result := (value=xml_schemap_src_resolve_low_level)
		end

	is_xml_schemap_src_restriction_base_or_simpletype: BOOLEAN is
		do
			Result := (value=xml_schemap_src_restriction_base_or_simpletype_low_level)
		end

	is_xml_schemap_src_simple_type_1: BOOLEAN is
		do
			Result := (value=xml_schemap_src_simple_type_1_low_level)
		end

	is_xml_schemap_src_simple_type_2: BOOLEAN is
		do
			Result := (value=xml_schemap_src_simple_type_2_low_level)
		end

	is_xml_schemap_src_simple_type_3: BOOLEAN is
		do
			Result := (value=xml_schemap_src_simple_type_3_low_level)
		end

	is_xml_schemap_src_simple_type_4: BOOLEAN is
		do
			Result := (value=xml_schemap_src_simple_type_4_low_level)
		end

	is_xml_schemap_src_union_membertypes_or_simpletypes: BOOLEAN is
		do
			Result := (value=xml_schemap_src_union_membertypes_or_simpletypes_low_level)
		end

	is_xml_schemap_st_props_correct_1: BOOLEAN is
		do
			Result := (value=xml_schemap_st_props_correct_1_low_level)
		end

	is_xml_schemap_st_props_correct_2: BOOLEAN is
		do
			Result := (value=xml_schemap_st_props_correct_2_low_level)
		end

	is_xml_schemap_st_props_correct_3: BOOLEAN is
		do
			Result := (value=xml_schemap_st_props_correct_3_low_level)
		end

	is_xml_schemap_supernumerous_list_item_type: BOOLEAN is
		do
			Result := (value=xml_schemap_supernumerous_list_item_type_low_level)
		end

	is_xml_schemap_type_and_subtype: BOOLEAN is
		do
			Result := (value=xml_schemap_type_and_subtype_low_level)
		end

	is_xml_schemap_union_not_expressible: BOOLEAN is
		do
			Result := (value=xml_schemap_union_not_expressible_low_level)
		end

	is_xml_schemap_unknown_all_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_all_child_low_level)
		end

	is_xml_schemap_unknown_anyattribute_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_anyattribute_child_low_level)
		end

	is_xml_schemap_unknown_attr_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_attr_child_low_level)
		end

	is_xml_schemap_unknown_attrgrp_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_attrgrp_child_low_level)
		end

	is_xml_schemap_unknown_attribute_group: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_attribute_group_low_level)
		end

	is_xml_schemap_unknown_base_type: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_base_type_low_level)
		end

	is_xml_schemap_unknown_choice_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_choice_child_low_level)
		end

	is_xml_schemap_unknown_complexcontent_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_complexcontent_child_low_level)
		end

	is_xml_schemap_unknown_complextype_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_complextype_child_low_level)
		end

	is_xml_schemap_unknown_elem_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_elem_child_low_level)
		end

	is_xml_schemap_unknown_extension_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_extension_child_low_level)
		end

	is_xml_schemap_unknown_facet_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_facet_child_low_level)
		end

	is_xml_schemap_unknown_facet_type: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_facet_type_low_level)
		end

	is_xml_schemap_unknown_group_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_group_child_low_level)
		end

	is_xml_schemap_unknown_import_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_import_child_low_level)
		end

	is_xml_schemap_unknown_include_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_include_child_low_level)
		end

	is_xml_schemap_unknown_list_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_list_child_low_level)
		end

	is_xml_schemap_unknown_member_type: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_member_type_low_level)
		end

	is_xml_schemap_unknown_notation_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_notation_child_low_level)
		end

	is_xml_schemap_unknown_prefix: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_prefix_low_level)
		end

	is_xml_schemap_unknown_processcontent_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_processcontent_child_low_level)
		end

	is_xml_schemap_unknown_ref: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_ref_low_level)
		end

	is_xml_schemap_unknown_restriction_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_restriction_child_low_level)
		end

	is_xml_schemap_unknown_schemas_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_schemas_child_low_level)
		end

	is_xml_schemap_unknown_sequence_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_sequence_child_low_level)
		end

	is_xml_schemap_unknown_simplecontent_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_simplecontent_child_low_level)
		end

	is_xml_schemap_unknown_simpletype_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_simpletype_child_low_level)
		end

	is_xml_schemap_unknown_type: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_type_low_level)
		end

	is_xml_schemap_unknown_union_child: BOOLEAN is
		do
			Result := (value=xml_schemap_unknown_union_child_low_level)
		end

	is_xml_schemap_warn_attr_pointless_proh: BOOLEAN is
		do
			Result := (value=xml_schemap_warn_attr_pointless_proh_low_level)
		end

	is_xml_schemap_warn_attr_redecl_proh: BOOLEAN is
		do
			Result := (value=xml_schemap_warn_attr_redecl_proh_low_level)
		end

	is_xml_schemap_warn_skip_schema: BOOLEAN is
		do
			Result := (value=xml_schemap_warn_skip_schema_low_level)
		end

	is_xml_schemap_warn_unlocated_schema: BOOLEAN is
		do
			Result := (value=xml_schemap_warn_unlocated_schema_low_level)
		end

	is_xml_schemap_wildcard_invalid_ns_member: BOOLEAN is
		do
			Result := (value=xml_schemap_wildcard_invalid_ns_member_low_level)
		end

	is_xml_schematronv_assert: BOOLEAN is
		do
			Result := (value=xml_schematronv_assert_low_level)
		end

	is_xml_schematronv_report: BOOLEAN is
		do
			Result := (value=xml_schematronv_report_low_level)
		end

	is_xml_schemav_attrinvalid: BOOLEAN is
		do
			Result := (value=xml_schemav_attrinvalid_low_level)
		end

	is_xml_schemav_attrunknown: BOOLEAN is
		do
			Result := (value=xml_schemav_attrunknown_low_level)
		end

	is_xml_schemav_construct: BOOLEAN is
		do
			Result := (value=xml_schemav_construct_low_level)
		end

	is_xml_schemav_cvc_attribute_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_attribute_1_low_level)
		end

	is_xml_schemav_cvc_attribute_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_attribute_2_low_level)
		end

	is_xml_schemav_cvc_attribute_3: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_attribute_3_low_level)
		end

	is_xml_schemav_cvc_attribute_4: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_attribute_4_low_level)
		end

	is_xml_schemav_cvc_au: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_au_low_level)
		end

	is_xml_schemav_cvc_complex_type_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_1_low_level)
		end

	is_xml_schemav_cvc_complex_type_2_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_2_1_low_level)
		end

	is_xml_schemav_cvc_complex_type_2_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_2_2_low_level)
		end

	is_xml_schemav_cvc_complex_type_2_3: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_2_3_low_level)
		end

	is_xml_schemav_cvc_complex_type_2_4: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_2_4_low_level)
		end

	is_xml_schemav_cvc_complex_type_3_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_3_1_low_level)
		end

	is_xml_schemav_cvc_complex_type_3_2_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_3_2_1_low_level)
		end

	is_xml_schemav_cvc_complex_type_3_2_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_3_2_2_low_level)
		end

	is_xml_schemav_cvc_complex_type_4: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_4_low_level)
		end

	is_xml_schemav_cvc_complex_type_5_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_5_1_low_level)
		end

	is_xml_schemav_cvc_complex_type_5_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_complex_type_5_2_low_level)
		end

	is_xml_schemav_cvc_datatype_valid_1_2_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_datatype_valid_1_2_1_low_level)
		end

	is_xml_schemav_cvc_datatype_valid_1_2_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_datatype_valid_1_2_2_low_level)
		end

	is_xml_schemav_cvc_datatype_valid_1_2_3: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_datatype_valid_1_2_3_low_level)
		end

	is_xml_schemav_cvc_elt_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_1_low_level)
		end

	is_xml_schemav_cvc_elt_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_2_low_level)
		end

	is_xml_schemav_cvc_elt_3_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_3_1_low_level)
		end

	is_xml_schemav_cvc_elt_3_2_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_3_2_1_low_level)
		end

	is_xml_schemav_cvc_elt_3_2_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_3_2_2_low_level)
		end

	is_xml_schemav_cvc_elt_4_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_4_1_low_level)
		end

	is_xml_schemav_cvc_elt_4_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_4_2_low_level)
		end

	is_xml_schemav_cvc_elt_4_3: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_4_3_low_level)
		end

	is_xml_schemav_cvc_elt_5_1_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_5_1_1_low_level)
		end

	is_xml_schemav_cvc_elt_5_1_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_5_1_2_low_level)
		end

	is_xml_schemav_cvc_elt_5_2_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_5_2_1_low_level)
		end

	is_xml_schemav_cvc_elt_5_2_2_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_5_2_2_1_low_level)
		end

	is_xml_schemav_cvc_elt_5_2_2_2_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_5_2_2_2_1_low_level)
		end

	is_xml_schemav_cvc_elt_5_2_2_2_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_5_2_2_2_2_low_level)
		end

	is_xml_schemav_cvc_elt_6: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_6_low_level)
		end

	is_xml_schemav_cvc_elt_7: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_elt_7_low_level)
		end

	is_xml_schemav_cvc_enumeration_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_enumeration_valid_low_level)
		end

	is_xml_schemav_cvc_facet_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_facet_valid_low_level)
		end

	is_xml_schemav_cvc_fractiondigits_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_fractiondigits_valid_low_level)
		end

	is_xml_schemav_cvc_idc: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_idc_low_level)
		end

	is_xml_schemav_cvc_length_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_length_valid_low_level)
		end

	is_xml_schemav_cvc_maxexclusive_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_maxexclusive_valid_low_level)
		end

	is_xml_schemav_cvc_maxinclusive_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_maxinclusive_valid_low_level)
		end

	is_xml_schemav_cvc_maxlength_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_maxlength_valid_low_level)
		end

	is_xml_schemav_cvc_minexclusive_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_minexclusive_valid_low_level)
		end

	is_xml_schemav_cvc_mininclusive_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_mininclusive_valid_low_level)
		end

	is_xml_schemav_cvc_minlength_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_minlength_valid_low_level)
		end

	is_xml_schemav_cvc_pattern_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_pattern_valid_low_level)
		end

	is_xml_schemav_cvc_totaldigits_valid: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_totaldigits_valid_low_level)
		end

	is_xml_schemav_cvc_type_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_type_1_low_level)
		end

	is_xml_schemav_cvc_type_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_type_2_low_level)
		end

	is_xml_schemav_cvc_type_3_1_1: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_type_3_1_1_low_level)
		end

	is_xml_schemav_cvc_type_3_1_2: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_type_3_1_2_low_level)
		end

	is_xml_schemav_cvc_wildcard: BOOLEAN is
		do
			Result := (value=xml_schemav_cvc_wildcard_low_level)
		end

	is_xml_schemav_document_element_missing: BOOLEAN is
		do
			Result := (value=xml_schemav_document_element_missing_low_level)
		end

	is_xml_schemav_elemcont: BOOLEAN is
		do
			Result := (value=xml_schemav_elemcont_low_level)
		end

	is_xml_schemav_element_content: BOOLEAN is
		do
			Result := (value=xml_schemav_element_content_low_level)
		end

	is_xml_schemav_extracontent: BOOLEAN is
		do
			Result := (value=xml_schemav_extracontent_low_level)
		end

	is_xml_schemav_facet: BOOLEAN is
		do
			Result := (value=xml_schemav_facet_low_level)
		end

	is_xml_schemav_havedefault: BOOLEAN is
		do
			Result := (value=xml_schemav_havedefault_low_level)
		end

	is_xml_schemav_internal: BOOLEAN is
		do
			Result := (value=xml_schemav_internal_low_level)
		end

	is_xml_schemav_invalidattr: BOOLEAN is
		do
			Result := (value=xml_schemav_invalidattr_low_level)
		end

	is_xml_schemav_invalidelem: BOOLEAN is
		do
			Result := (value=xml_schemav_invalidelem_low_level)
		end

	is_xml_schemav_isabstract: BOOLEAN is
		do
			Result := (value=xml_schemav_isabstract_low_level)
		end

	is_xml_schemav_misc: BOOLEAN is
		do
			Result := (value=xml_schemav_misc_low_level)
		end

	is_xml_schemav_missing: BOOLEAN is
		do
			Result := (value=xml_schemav_missing_low_level)
		end

	is_xml_schemav_norollback: BOOLEAN is
		do
			Result := (value=xml_schemav_norollback_low_level)
		end

	is_xml_schemav_noroot: BOOLEAN is
		do
			Result := (value=xml_schemav_noroot_low_level)
		end

	is_xml_schemav_notdeterminist: BOOLEAN is
		do
			Result := (value=xml_schemav_notdeterminist_low_level)
		end

	is_xml_schemav_notempty: BOOLEAN is
		do
			Result := (value=xml_schemav_notempty_low_level)
		end

	is_xml_schemav_notnillable: BOOLEAN is
		do
			Result := (value=xml_schemav_notnillable_low_level)
		end

	is_xml_schemav_notsimple: BOOLEAN is
		do
			Result := (value=xml_schemav_notsimple_low_level)
		end

	is_xml_schemav_nottoplevel: BOOLEAN is
		do
			Result := (value=xml_schemav_nottoplevel_low_level)
		end

	is_xml_schemav_notype: BOOLEAN is
		do
			Result := (value=xml_schemav_notype_low_level)
		end

	is_xml_schemav_undeclaredelem: BOOLEAN is
		do
			Result := (value=xml_schemav_undeclaredelem_low_level)
		end

	is_xml_schemav_value: BOOLEAN is
		do
			Result := (value=xml_schemav_value_low_level)
		end

	is_xml_schemav_wrongelem: BOOLEAN is
		do
			Result := (value=xml_schemav_wrongelem_low_level)
		end

	is_xml_tree_invalid_dec: BOOLEAN is
		do
			Result := (value=xml_tree_invalid_dec_low_level)
		end

	is_xml_tree_invalid_hex: BOOLEAN is
		do
			Result := (value=xml_tree_invalid_hex_low_level)
		end

	is_xml_tree_not_utf8: BOOLEAN is
		do
			Result := (value=xml_tree_not_utf8_low_level)
		end

	is_xml_tree_unterminated_entity: BOOLEAN is
		do
			Result := (value=xml_tree_unterminated_entity_low_level)
		end

	is_xml_war_catalog_pi: BOOLEAN is
		do
			Result := (value=xml_war_catalog_pi_low_level)
		end

	is_xml_war_entity_redefined: BOOLEAN is
		do
			Result := (value=xml_war_entity_redefined_low_level)
		end

	is_xml_war_lang_value: BOOLEAN is
		do
			Result := (value=xml_war_lang_value_low_level)
		end

	is_xml_war_ns_column: BOOLEAN is
		do
			Result := (value=xml_war_ns_column_low_level)
		end

	is_xml_war_ns_uri: BOOLEAN is
		do
			Result := (value=xml_war_ns_uri_low_level)
		end

	is_xml_war_ns_uri_relative: BOOLEAN is
		do
			Result := (value=xml_war_ns_uri_relative_low_level)
		end

	is_xml_war_space_value: BOOLEAN is
		do
			Result := (value=xml_war_space_value_low_level)
		end

	is_xml_war_undeclared_entity: BOOLEAN is
		do
			Result := (value=xml_war_undeclared_entity_low_level)
		end

	is_xml_war_unknown_version: BOOLEAN is
		do
			Result := (value=xml_war_unknown_version_low_level)
		end

	is_xml_xinclude_build_failed: BOOLEAN is
		do
			Result := (value=xml_xinclude_build_failed_low_level)
		end

	is_xml_xinclude_deprecated_ns: BOOLEAN is
		do
			Result := (value=xml_xinclude_deprecated_ns_low_level)
		end

	is_xml_xinclude_entity_def_mismatch: BOOLEAN is
		do
			Result := (value=xml_xinclude_entity_def_mismatch_low_level)
		end

	is_xml_xinclude_fallback_not_in_include: BOOLEAN is
		do
			Result := (value=xml_xinclude_fallback_not_in_include_low_level)
		end

	is_xml_xinclude_fallbacks_in_include: BOOLEAN is
		do
			Result := (value=xml_xinclude_fallbacks_in_include_low_level)
		end

	is_xml_xinclude_fragment_id: BOOLEAN is
		do
			Result := (value=xml_xinclude_fragment_id_low_level)
		end

	is_xml_xinclude_href_uri: BOOLEAN is
		do
			Result := (value=xml_xinclude_href_uri_low_level)
		end

	is_xml_xinclude_include_in_include: BOOLEAN is
		do
			Result := (value=xml_xinclude_include_in_include_low_level)
		end

	is_xml_xinclude_invalid_char: BOOLEAN is
		do
			Result := (value=xml_xinclude_invalid_char_low_level)
		end

	is_xml_xinclude_multiple_root: BOOLEAN is
		do
			Result := (value=xml_xinclude_multiple_root_low_level)
		end

	is_xml_xinclude_no_fallback: BOOLEAN is
		do
			Result := (value=xml_xinclude_no_fallback_low_level)
		end

	is_xml_xinclude_no_href: BOOLEAN is
		do
			Result := (value=xml_xinclude_no_href_low_level)
		end

	is_xml_xinclude_parse_value: BOOLEAN is
		do
			Result := (value=xml_xinclude_parse_value_low_level)
		end

	is_xml_xinclude_recursion: BOOLEAN is
		do
			Result := (value=xml_xinclude_recursion_low_level)
		end

	is_xml_xinclude_text_document: BOOLEAN is
		do
			Result := (value=xml_xinclude_text_document_low_level)
		end

	is_xml_xinclude_text_fragment: BOOLEAN is
		do
			Result := (value=xml_xinclude_text_fragment_low_level)
		end

	is_xml_xinclude_unknown_encoding: BOOLEAN is
		do
			Result := (value=xml_xinclude_unknown_encoding_low_level)
		end

	is_xml_xinclude_xptr_failed: BOOLEAN is
		do
			Result := (value=xml_xinclude_xptr_failed_low_level)
		end

	is_xml_xinclude_xptr_result: BOOLEAN is
		do
			Result := (value=xml_xinclude_xptr_result_low_level)
		end

	is_xml_xpath_encoding_error: BOOLEAN is
		do
			Result := (value=xml_xpath_encoding_error_low_level)
		end

	is_xml_xpath_expr_error: BOOLEAN is
		do
			Result := (value=xml_xpath_expr_error_low_level)
		end

	is_xml_xpath_expression_ok: BOOLEAN is
		do
			Result := (value=xml_xpath_expression_ok_low_level)
		end

	is_xml_xpath_invalid_arity: BOOLEAN is
		do
			Result := (value=xml_xpath_invalid_arity_low_level)
		end

	is_xml_xpath_invalid_char_error: BOOLEAN is
		do
			Result := (value=xml_xpath_invalid_char_error_low_level)
		end

	is_xml_xpath_invalid_ctxt_position: BOOLEAN is
		do
			Result := (value=xml_xpath_invalid_ctxt_position_low_level)
		end

	is_xml_xpath_invalid_ctxt_size: BOOLEAN is
		do
			Result := (value=xml_xpath_invalid_ctxt_size_low_level)
		end

	is_xml_xpath_invalid_operand: BOOLEAN is
		do
			Result := (value=xml_xpath_invalid_operand_low_level)
		end

	is_xml_xpath_invalid_predicate_error: BOOLEAN is
		do
			Result := (value=xml_xpath_invalid_predicate_error_low_level)
		end

	is_xml_xpath_invalid_type: BOOLEAN is
		do
			Result := (value=xml_xpath_invalid_type_low_level)
		end

	is_xml_xpath_memory_error: BOOLEAN is
		do
			Result := (value=xml_xpath_memory_error_low_level)
		end

	is_xml_xpath_number_error: BOOLEAN is
		do
			Result := (value=xml_xpath_number_error_low_level)
		end

	is_xml_xpath_start_literal_error: BOOLEAN is
		do
			Result := (value=xml_xpath_start_literal_error_low_level)
		end

	is_xml_xpath_unclosed_error: BOOLEAN is
		do
			Result := (value=xml_xpath_unclosed_error_low_level)
		end

	is_xml_xpath_undef_prefix_error: BOOLEAN is
		do
			Result := (value=xml_xpath_undef_prefix_error_low_level)
		end

	is_xml_xpath_undef_variable_error: BOOLEAN is
		do
			Result := (value=xml_xpath_undef_variable_error_low_level)
		end

	is_xml_xpath_unfinished_literal_error: BOOLEAN is
		do
			Result := (value=xml_xpath_unfinished_literal_error_low_level)
		end

	is_xml_xpath_unknown_func_error: BOOLEAN is
		do
			Result := (value=xml_xpath_unknown_func_error_low_level)
		end

	is_xml_xpath_variable_ref_error: BOOLEAN is
		do
			Result := (value=xml_xpath_variable_ref_error_low_level)
		end

	is_xml_xptr_childseq_start: BOOLEAN is
		do
			Result := (value=xml_xptr_childseq_start_low_level)
		end

	is_xml_xptr_eval_failed: BOOLEAN is
		do
			Result := (value=xml_xptr_eval_failed_low_level)
		end

	is_xml_xptr_extra_objects: BOOLEAN is
		do
			Result := (value=xml_xptr_extra_objects_low_level)
		end

	is_xml_xptr_resource_error: BOOLEAN is
		do
			Result := (value=xml_xptr_resource_error_low_level)
		end

	is_xml_xptr_sub_resource_error: BOOLEAN is
		do
			Result := (value=xml_xptr_sub_resource_error_low_level)
		end

	is_xml_xptr_syntax_error: BOOLEAN is
		do
			Result := (value=xml_xptr_syntax_error_low_level)
		end

	is_xml_xptr_unknown_scheme: BOOLEAN is
		do
			Result := (value=xml_xptr_unknown_scheme_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_c14n_create_ctxt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_C14N_CREATE_CTXT"
 			}"
 		end

	xml_c14n_create_stack_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_C14N_CREATE_STACK"
 			}"
 		end

	xml_c14n_invalid_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_C14N_INVALID_NODE"
 			}"
 		end

	xml_c14n_relative_namespace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_C14N_RELATIVE_NAMESPACE"
 			}"
 		end

	xml_c14n_requires_utf8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_C14N_REQUIRES_UTF8"
 			}"
 		end

	xml_c14n_unknow_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_C14N_UNKNOW_NODE"
 			}"
 		end

	xml_catalog_entry_broken_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CATALOG_ENTRY_BROKEN"
 			}"
 		end

	xml_catalog_missing_attr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CATALOG_MISSING_ATTR"
 			}"
 		end

	xml_catalog_not_catalog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CATALOG_NOT_CATALOG"
 			}"
 		end

	xml_catalog_prefer_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CATALOG_PREFER_VALUE"
 			}"
 		end

	xml_catalog_recursion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CATALOG_RECURSION"
 			}"
 		end

	xml_check_entity_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_ENTITY_TYPE"
 			}"
 		end

	xml_check_found_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_ATTRIBUTE"
 			}"
 		end

	xml_check_found_cdata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_CDATA"
 			}"
 		end

	xml_check_found_comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_COMMENT"
 			}"
 		end

	xml_check_found_doctype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_DOCTYPE"
 			}"
 		end

	xml_check_found_element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_ELEMENT"
 			}"
 		end

	xml_check_found_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_ENTITY"
 			}"
 		end

	xml_check_found_entityref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_ENTITYREF"
 			}"
 		end

	xml_check_found_fragment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_FRAGMENT"
 			}"
 		end

	xml_check_found_notation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_NOTATION"
 			}"
 		end

	xml_check_found_pi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_PI"
 			}"
 		end

	xml_check_found_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_FOUND_TEXT"
 			}"
 		end

	xml_check_name_not_null_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NAME_NOT_NULL"
 			}"
 		end

	xml_check_no_dict_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NO_DICT"
 			}"
 		end

	xml_check_no_doc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NO_DOC"
 			}"
 		end

	xml_check_no_elem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NO_ELEM"
 			}"
 		end

	xml_check_no_href_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NO_HREF"
 			}"
 		end

	xml_check_no_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NO_NAME"
 			}"
 		end

	xml_check_no_next_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NO_NEXT"
 			}"
 		end

	xml_check_no_parent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NO_PARENT"
 			}"
 		end

	xml_check_no_prev_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NO_PREV"
 			}"
 		end

	xml_check_not_attr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NOT_ATTR"
 			}"
 		end

	xml_check_not_attr_decl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NOT_ATTR_DECL"
 			}"
 		end

	xml_check_not_dtd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NOT_DTD"
 			}"
 		end

	xml_check_not_elem_decl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NOT_ELEM_DECL"
 			}"
 		end

	xml_check_not_entity_decl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NOT_ENTITY_DECL"
 			}"
 		end

	xml_check_not_ncname_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NOT_NCNAME"
 			}"
 		end

	xml_check_not_ns_decl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NOT_NS_DECL"
 			}"
 		end

	xml_check_not_utf8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NOT_UTF8"
 			}"
 		end

	xml_check_ns_ancestor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NS_ANCESTOR"
 			}"
 		end

	xml_check_ns_scope_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_NS_SCOPE"
 			}"
 		end

	xml_check_outside_dict_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_OUTSIDE_DICT"
 			}"
 		end

	xml_check_unknown_node_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_UNKNOWN_NODE"
 			}"
 		end

	xml_check_wrong_doc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_WRONG_DOC"
 			}"
 		end

	xml_check_wrong_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_WRONG_NAME"
 			}"
 		end

	xml_check_wrong_next_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_WRONG_NEXT"
 			}"
 		end

	xml_check_wrong_parent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_WRONG_PARENT"
 			}"
 		end

	xml_check_wrong_prev_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_CHECK_WRONG_PREV"
 			}"
 		end

	xml_dtd_attribute_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ATTRIBUTE_DEFAULT"
 			}"
 		end

	xml_dtd_attribute_redefined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ATTRIBUTE_REDEFINED"
 			}"
 		end

	xml_dtd_attribute_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ATTRIBUTE_VALUE"
 			}"
 		end

	xml_dtd_content_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_CONTENT_ERROR"
 			}"
 		end

	xml_dtd_content_model_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_CONTENT_MODEL"
 			}"
 		end

	xml_dtd_content_not_determinist_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_CONTENT_NOT_DETERMINIST"
 			}"
 		end

	xml_dtd_different_prefix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_DIFFERENT_PREFIX"
 			}"
 		end

	xml_dtd_dup_token_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_DUP_TOKEN"
 			}"
 		end

	xml_dtd_elem_default_namespace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ELEM_DEFAULT_NAMESPACE"
 			}"
 		end

	xml_dtd_elem_namespace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ELEM_NAMESPACE"
 			}"
 		end

	xml_dtd_elem_redefined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ELEM_REDEFINED"
 			}"
 		end

	xml_dtd_empty_notation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_EMPTY_NOTATION"
 			}"
 		end

	xml_dtd_entity_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ENTITY_TYPE"
 			}"
 		end

	xml_dtd_id_fixed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ID_FIXED"
 			}"
 		end

	xml_dtd_id_redefined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ID_REDEFINED"
 			}"
 		end

	xml_dtd_id_subset_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ID_SUBSET"
 			}"
 		end

	xml_dtd_invalid_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_INVALID_CHILD"
 			}"
 		end

	xml_dtd_invalid_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_INVALID_DEFAULT"
 			}"
 		end

	xml_dtd_load_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_LOAD_ERROR"
 			}"
 		end

	xml_dtd_missing_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_MISSING_ATTRIBUTE"
 			}"
 		end

	xml_dtd_mixed_corrupt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_MIXED_CORRUPT"
 			}"
 		end

	xml_dtd_multiple_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_MULTIPLE_ID"
 			}"
 		end

	xml_dtd_no_doc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NO_DOC"
 			}"
 		end

	xml_dtd_no_dtd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NO_DTD"
 			}"
 		end

	xml_dtd_no_elem_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NO_ELEM_NAME"
 			}"
 		end

	xml_dtd_no_prefix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NO_PREFIX"
 			}"
 		end

	xml_dtd_no_root_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NO_ROOT"
 			}"
 		end

	xml_dtd_not_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NOT_EMPTY"
 			}"
 		end

	xml_dtd_not_pcdata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NOT_PCDATA"
 			}"
 		end

	xml_dtd_not_standalone_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NOT_STANDALONE"
 			}"
 		end

	xml_dtd_notation_redefined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NOTATION_REDEFINED"
 			}"
 		end

	xml_dtd_notation_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_NOTATION_VALUE"
 			}"
 		end

	xml_dtd_root_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_ROOT_NAME"
 			}"
 		end

	xml_dtd_standalone_defaulted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_STANDALONE_DEFAULTED"
 			}"
 		end

	xml_dtd_standalone_white_space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_STANDALONE_WHITE_SPACE"
 			}"
 		end

	xml_dtd_unknown_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_UNKNOWN_ATTRIBUTE"
 			}"
 		end

	xml_dtd_unknown_elem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_UNKNOWN_ELEM"
 			}"
 		end

	xml_dtd_unknown_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_UNKNOWN_ENTITY"
 			}"
 		end

	xml_dtd_unknown_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_UNKNOWN_ID"
 			}"
 		end

	xml_dtd_unknown_notation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_UNKNOWN_NOTATION"
 			}"
 		end

	xml_dtd_xmlid_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_XMLID_TYPE"
 			}"
 		end

	xml_dtd_xmlid_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_DTD_XMLID_VALUE"
 			}"
 		end

	xml_err_attlist_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ATTLIST_NOT_FINISHED"
 			}"
 		end

	xml_err_attlist_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ATTLIST_NOT_STARTED"
 			}"
 		end

	xml_err_attribute_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ATTRIBUTE_NOT_FINISHED"
 			}"
 		end

	xml_err_attribute_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ATTRIBUTE_NOT_STARTED"
 			}"
 		end

	xml_err_attribute_redefined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ATTRIBUTE_REDEFINED"
 			}"
 		end

	xml_err_attribute_without_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ATTRIBUTE_WITHOUT_VALUE"
 			}"
 		end

	xml_err_cdata_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_CDATA_NOT_FINISHED"
 			}"
 		end

	xml_err_charref_at_eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_CHARREF_AT_EOF"
 			}"
 		end

	xml_err_charref_in_dtd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_CHARREF_IN_DTD"
 			}"
 		end

	xml_err_charref_in_epilog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_CHARREF_IN_EPILOG"
 			}"
 		end

	xml_err_charref_in_prolog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_CHARREF_IN_PROLOG"
 			}"
 		end

	xml_err_comment_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_COMMENT_NOT_FINISHED"
 			}"
 		end

	xml_err_condsec_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_CONDSEC_INVALID"
 			}"
 		end

	xml_err_condsec_invalid_keyword_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_CONDSEC_INVALID_KEYWORD"
 			}"
 		end

	xml_err_condsec_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_CONDSEC_NOT_FINISHED"
 			}"
 		end

	xml_err_condsec_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_CONDSEC_NOT_STARTED"
 			}"
 		end

	xml_err_doctype_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_DOCTYPE_NOT_FINISHED"
 			}"
 		end

	xml_err_document_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_DOCUMENT_EMPTY"
 			}"
 		end

	xml_err_document_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_DOCUMENT_END"
 			}"
 		end

	xml_err_document_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_DOCUMENT_START"
 			}"
 		end

	xml_err_elemcontent_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ELEMCONTENT_NOT_FINISHED"
 			}"
 		end

	xml_err_elemcontent_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ELEMCONTENT_NOT_STARTED"
 			}"
 		end

	xml_err_encoding_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENCODING_NAME"
 			}"
 		end

	xml_err_entity_boundary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITY_BOUNDARY"
 			}"
 		end

	xml_err_entity_char_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITY_CHAR_ERROR"
 			}"
 		end

	xml_err_entity_is_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITY_IS_EXTERNAL"
 			}"
 		end

	xml_err_entity_is_parameter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITY_IS_PARAMETER"
 			}"
 		end

	xml_err_entity_loop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITY_LOOP"
 			}"
 		end

	xml_err_entity_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITY_NOT_FINISHED"
 			}"
 		end

	xml_err_entity_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITY_NOT_STARTED"
 			}"
 		end

	xml_err_entity_pe_internal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITY_PE_INTERNAL"
 			}"
 		end

	xml_err_entity_processing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITY_PROCESSING"
 			}"
 		end

	xml_err_entityref_at_eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITYREF_AT_EOF"
 			}"
 		end

	xml_err_entityref_in_dtd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITYREF_IN_DTD"
 			}"
 		end

	xml_err_entityref_in_epilog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITYREF_IN_EPILOG"
 			}"
 		end

	xml_err_entityref_in_prolog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITYREF_IN_PROLOG"
 			}"
 		end

	xml_err_entityref_no_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITYREF_NO_NAME"
 			}"
 		end

	xml_err_entityref_semicol_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ENTITYREF_SEMICOL_MISSING"
 			}"
 		end

	xml_err_equal_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_EQUAL_REQUIRED"
 			}"
 		end

	xml_err_ext_entity_standalone_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_EXT_ENTITY_STANDALONE"
 			}"
 		end

	xml_err_ext_subset_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_EXT_SUBSET_NOT_FINISHED"
 			}"
 		end

	xml_err_extra_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_EXTRA_CONTENT"
 			}"
 		end

	xml_err_gt_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_GT_REQUIRED"
 			}"
 		end

	xml_err_hyphen_in_comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_HYPHEN_IN_COMMENT"
 			}"
 		end

	xml_err_internal_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_INTERNAL_ERROR"
 			}"
 		end

	xml_err_invalid_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_INVALID_CHAR"
 			}"
 		end

	xml_err_invalid_charref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_INVALID_CHARREF"
 			}"
 		end

	xml_err_invalid_dec_charref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_INVALID_DEC_CHARREF"
 			}"
 		end

	xml_err_invalid_encoding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_INVALID_ENCODING"
 			}"
 		end

	xml_err_invalid_hex_charref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_INVALID_HEX_CHARREF"
 			}"
 		end

	xml_err_invalid_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_INVALID_URI"
 			}"
 		end

	xml_err_literal_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_LITERAL_NOT_FINISHED"
 			}"
 		end

	xml_err_literal_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_LITERAL_NOT_STARTED"
 			}"
 		end

	xml_err_lt_in_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_LT_IN_ATTRIBUTE"
 			}"
 		end

	xml_err_lt_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_LT_REQUIRED"
 			}"
 		end

	xml_err_ltslash_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_LTSLASH_REQUIRED"
 			}"
 		end

	xml_err_misplaced_cdata_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_MISPLACED_CDATA_END"
 			}"
 		end

	xml_err_missing_encoding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_MISSING_ENCODING"
 			}"
 		end

	xml_err_mixed_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_MIXED_NOT_FINISHED"
 			}"
 		end

	xml_err_mixed_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_MIXED_NOT_STARTED"
 			}"
 		end

	xml_err_name_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NAME_REQUIRED"
 			}"
 		end

	xml_err_nmtoken_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NMTOKEN_REQUIRED"
 			}"
 		end

	xml_err_no_dtd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NO_DTD"
 			}"
 		end

	xml_err_no_memory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NO_MEMORY"
 			}"
 		end

	xml_err_not_standalone_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NOT_STANDALONE"
 			}"
 		end

	xml_err_not_well_balanced_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NOT_WELL_BALANCED"
 			}"
 		end

	xml_err_notation_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NOTATION_NOT_FINISHED"
 			}"
 		end

	xml_err_notation_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NOTATION_NOT_STARTED"
 			}"
 		end

	xml_err_notation_processing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NOTATION_PROCESSING"
 			}"
 		end

	xml_err_ns_decl_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NS_DECL_ERROR"
 			}"
 		end

	xml_err_ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_OK"
 			}"
 		end

	xml_err_pcdata_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_PCDATA_REQUIRED"
 			}"
 		end

	xml_err_peref_at_eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_PEREF_AT_EOF"
 			}"
 		end

	xml_err_peref_in_epilog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_PEREF_IN_EPILOG"
 			}"
 		end

	xml_err_peref_in_int_subset_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_PEREF_IN_INT_SUBSET"
 			}"
 		end

	xml_err_peref_in_prolog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_PEREF_IN_PROLOG"
 			}"
 		end

	xml_err_peref_no_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_PEREF_NO_NAME"
 			}"
 		end

	xml_err_peref_semicol_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_PEREF_SEMICOL_MISSING"
 			}"
 		end

	xml_err_pi_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_PI_NOT_FINISHED"
 			}"
 		end

	xml_err_pi_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_PI_NOT_STARTED"
 			}"
 		end

	xml_err_pubid_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_PUBID_REQUIRED"
 			}"
 		end

	xml_err_reserved_xml_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_RESERVED_XML_NAME"
 			}"
 		end

	xml_err_separator_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_SEPARATOR_REQUIRED"
 			}"
 		end

	xml_err_space_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_SPACE_REQUIRED"
 			}"
 		end

	xml_err_standalone_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_STANDALONE_VALUE"
 			}"
 		end

	xml_err_string_not_closed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_STRING_NOT_CLOSED"
 			}"
 		end

	xml_err_string_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_STRING_NOT_STARTED"
 			}"
 		end

	xml_err_tag_name_mismatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_TAG_NAME_MISMATCH"
 			}"
 		end

	xml_err_tag_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_TAG_NOT_FINISHED"
 			}"
 		end

	xml_err_undeclared_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_UNDECLARED_ENTITY"
 			}"
 		end

	xml_err_unknown_encoding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_UNKNOWN_ENCODING"
 			}"
 		end

	xml_err_unknown_version_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_UNKNOWN_VERSION"
 			}"
 		end

	xml_err_unparsed_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_UNPARSED_ENTITY"
 			}"
 		end

	xml_err_unsupported_encoding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_UNSUPPORTED_ENCODING"
 			}"
 		end

	xml_err_uri_fragment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_URI_FRAGMENT"
 			}"
 		end

	xml_err_uri_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_URI_REQUIRED"
 			}"
 		end

	xml_err_value_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_VALUE_REQUIRED"
 			}"
 		end

	xml_err_version_mismatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_VERSION_MISMATCH"
 			}"
 		end

	xml_err_version_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_VERSION_MISSING"
 			}"
 		end

	xml_err_xmldecl_not_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_XMLDECL_NOT_FINISHED"
 			}"
 		end

	xml_err_xmldecl_not_started_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_XMLDECL_NOT_STARTED"
 			}"
 		end

	xml_ftp_accnt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FTP_ACCNT"
 			}"
 		end

	xml_ftp_epsv_answer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FTP_EPSV_ANSWER"
 			}"
 		end

	xml_ftp_pasv_answer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FTP_PASV_ANSWER"
 			}"
 		end

	xml_ftp_url_syntax_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FTP_URL_SYNTAX"
 			}"
 		end

	xml_html_strucure_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_HTML_STRUCURE_ERROR"
 			}"
 		end

	xml_html_unknown_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_HTML_UNKNOWN_TAG"
 			}"
 		end

	xml_http_unknown_host_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_HTTP_UNKNOWN_HOST"
 			}"
 		end

	xml_http_url_syntax_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_HTTP_URL_SYNTAX"
 			}"
 		end

	xml_http_use_ip_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_HTTP_USE_IP"
 			}"
 		end

	xml_i18n_conv_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_I18N_CONV_FAILED"
 			}"
 		end

	xml_i18n_excess_handler_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_I18N_EXCESS_HANDLER"
 			}"
 		end

	xml_i18n_no_handler_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_I18N_NO_HANDLER"
 			}"
 		end

	xml_i18n_no_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_I18N_NO_NAME"
 			}"
 		end

	xml_i18n_no_output_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_I18N_NO_OUTPUT"
 			}"
 		end

	xml_io_buffer_full_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_BUFFER_FULL"
 			}"
 		end

	xml_io_eacces_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EACCES"
 			}"
 		end

	xml_io_eaddrinuse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EADDRINUSE"
 			}"
 		end

	xml_io_eafnosupport_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EAFNOSUPPORT"
 			}"
 		end

	xml_io_eagain_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EAGAIN"
 			}"
 		end

	xml_io_ealready_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EALREADY"
 			}"
 		end

	xml_io_ebadf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EBADF"
 			}"
 		end

	xml_io_ebadmsg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EBADMSG"
 			}"
 		end

	xml_io_ebusy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EBUSY"
 			}"
 		end

	xml_io_ecanceled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ECANCELED"
 			}"
 		end

	xml_io_echild_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ECHILD"
 			}"
 		end

	xml_io_econnrefused_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ECONNREFUSED"
 			}"
 		end

	xml_io_edeadlk_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EDEADLK"
 			}"
 		end

	xml_io_edom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EDOM"
 			}"
 		end

	xml_io_eexist_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EEXIST"
 			}"
 		end

	xml_io_efault_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EFAULT"
 			}"
 		end

	xml_io_efbig_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EFBIG"
 			}"
 		end

	xml_io_einprogress_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EINPROGRESS"
 			}"
 		end

	xml_io_eintr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EINTR"
 			}"
 		end

	xml_io_einval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EINVAL"
 			}"
 		end

	xml_io_eio_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EIO"
 			}"
 		end

	xml_io_eisconn_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EISCONN"
 			}"
 		end

	xml_io_eisdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EISDIR"
 			}"
 		end

	xml_io_emfile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EMFILE"
 			}"
 		end

	xml_io_emlink_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EMLINK"
 			}"
 		end

	xml_io_emsgsize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EMSGSIZE"
 			}"
 		end

	xml_io_enametoolong_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENAMETOOLONG"
 			}"
 		end

	xml_io_encoder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENCODER"
 			}"
 		end

	xml_io_enetunreach_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENETUNREACH"
 			}"
 		end

	xml_io_enfile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENFILE"
 			}"
 		end

	xml_io_enodev_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENODEV"
 			}"
 		end

	xml_io_enoent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOENT"
 			}"
 		end

	xml_io_enoexec_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOEXEC"
 			}"
 		end

	xml_io_enolck_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOLCK"
 			}"
 		end

	xml_io_enomem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOMEM"
 			}"
 		end

	xml_io_enospc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOSPC"
 			}"
 		end

	xml_io_enosys_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOSYS"
 			}"
 		end

	xml_io_enotdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOTDIR"
 			}"
 		end

	xml_io_enotempty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOTEMPTY"
 			}"
 		end

	xml_io_enotsock_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOTSOCK"
 			}"
 		end

	xml_io_enotsup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOTSUP"
 			}"
 		end

	xml_io_enotty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENOTTY"
 			}"
 		end

	xml_io_enxio_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ENXIO"
 			}"
 		end

	xml_io_eperm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EPERM"
 			}"
 		end

	xml_io_epipe_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EPIPE"
 			}"
 		end

	xml_io_erange_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ERANGE"
 			}"
 		end

	xml_io_erofs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EROFS"
 			}"
 		end

	xml_io_espipe_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ESPIPE"
 			}"
 		end

	xml_io_esrch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ESRCH"
 			}"
 		end

	xml_io_etimedout_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_ETIMEDOUT"
 			}"
 		end

	xml_io_exdev_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_EXDEV"
 			}"
 		end

	xml_io_flush_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_FLUSH"
 			}"
 		end

	xml_io_load_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_LOAD_ERROR"
 			}"
 		end

	xml_io_network_attempt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_NETWORK_ATTEMPT"
 			}"
 		end

	xml_io_no_input_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_NO_INPUT"
 			}"
 		end

	xml_io_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_UNKNOWN"
 			}"
 		end

	xml_io_write_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_IO_WRITE"
 			}"
 		end

	xml_module_close_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_MODULE_CLOSE"
 			}"
 		end

	xml_module_open_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_MODULE_OPEN"
 			}"
 		end

	xml_ns_err_attribute_redefined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_NS_ERR_ATTRIBUTE_REDEFINED"
 			}"
 		end

	xml_ns_err_colon_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_NS_ERR_COLON"
 			}"
 		end

	xml_ns_err_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_NS_ERR_EMPTY"
 			}"
 		end

	xml_ns_err_qname_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_NS_ERR_QNAME"
 			}"
 		end

	xml_ns_err_undefined_namespace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_NS_ERR_UNDEFINED_NAMESPACE"
 			}"
 		end

	xml_ns_err_xml_namespace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_NS_ERR_XML_NAMESPACE"
 			}"
 		end

	xml_regexp_compile_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_REGEXP_COMPILE_ERROR"
 			}"
 		end

	xml_rngp_anyname_attr_ancestor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ANYNAME_ATTR_ANCESTOR"
 			}"
 		end

	xml_rngp_attr_conflict_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ATTR_CONFLICT"
 			}"
 		end

	xml_rngp_attribute_children_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ATTRIBUTE_CHILDREN"
 			}"
 		end

	xml_rngp_attribute_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ATTRIBUTE_CONTENT"
 			}"
 		end

	xml_rngp_attribute_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ATTRIBUTE_EMPTY"
 			}"
 		end

	xml_rngp_attribute_noop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ATTRIBUTE_NOOP"
 			}"
 		end

	xml_rngp_choice_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_CHOICE_CONTENT"
 			}"
 		end

	xml_rngp_choice_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_CHOICE_EMPTY"
 			}"
 		end

	xml_rngp_create_failure_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_CREATE_FAILURE"
 			}"
 		end

	xml_rngp_data_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_DATA_CONTENT"
 			}"
 		end

	xml_rngp_def_choice_and_interleave_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_DEF_CHOICE_AND_INTERLEAVE"
 			}"
 		end

	xml_rngp_define_create_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_DEFINE_CREATE_FAILED"
 			}"
 		end

	xml_rngp_define_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_DEFINE_EMPTY"
 			}"
 		end

	xml_rngp_define_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_DEFINE_MISSING"
 			}"
 		end

	xml_rngp_define_name_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_DEFINE_NAME_MISSING"
 			}"
 		end

	xml_rngp_elem_content_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ELEM_CONTENT_EMPTY"
 			}"
 		end

	xml_rngp_elem_content_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ELEM_CONTENT_ERROR"
 			}"
 		end

	xml_rngp_elem_text_conflict_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ELEM_TEXT_CONFLICT"
 			}"
 		end

	xml_rngp_element_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ELEMENT_CONTENT"
 			}"
 		end

	xml_rngp_element_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ELEMENT_EMPTY"
 			}"
 		end

	xml_rngp_element_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ELEMENT_NAME"
 			}"
 		end

	xml_rngp_element_no_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ELEMENT_NO_CONTENT"
 			}"
 		end

	xml_rngp_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EMPTY"
 			}"
 		end

	xml_rngp_empty_construct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EMPTY_CONSTRUCT"
 			}"
 		end

	xml_rngp_empty_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EMPTY_CONTENT"
 			}"
 		end

	xml_rngp_empty_not_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EMPTY_NOT_EMPTY"
 			}"
 		end

	xml_rngp_error_type_lib_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_ERROR_TYPE_LIB"
 			}"
 		end

	xml_rngp_except_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EXCEPT_EMPTY"
 			}"
 		end

	xml_rngp_except_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EXCEPT_MISSING"
 			}"
 		end

	xml_rngp_except_multiple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EXCEPT_MULTIPLE"
 			}"
 		end

	xml_rngp_except_no_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EXCEPT_NO_CONTENT"
 			}"
 		end

	xml_rngp_external_ref_failure_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EXTERNAL_REF_FAILURE"
 			}"
 		end

	xml_rngp_externalref_emtpy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EXTERNALREF_EMTPY"
 			}"
 		end

	xml_rngp_externalref_recurse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_EXTERNALREF_RECURSE"
 			}"
 		end

	xml_rngp_forbidden_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_FORBIDDEN_ATTRIBUTE"
 			}"
 		end

	xml_rngp_foreign_element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_FOREIGN_ELEMENT"
 			}"
 		end

	xml_rngp_grammar_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_GRAMMAR_CONTENT"
 			}"
 		end

	xml_rngp_grammar_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_GRAMMAR_EMPTY"
 			}"
 		end

	xml_rngp_grammar_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_GRAMMAR_MISSING"
 			}"
 		end

	xml_rngp_grammar_no_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_GRAMMAR_NO_START"
 			}"
 		end

	xml_rngp_group_attr_conflict_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_GROUP_ATTR_CONFLICT"
 			}"
 		end

	xml_rngp_href_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_HREF_ERROR"
 			}"
 		end

	xml_rngp_include_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_INCLUDE_EMPTY"
 			}"
 		end

	xml_rngp_include_failure_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_INCLUDE_FAILURE"
 			}"
 		end

	xml_rngp_include_recurse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_INCLUDE_RECURSE"
 			}"
 		end

	xml_rngp_interleave_add_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_INTERLEAVE_ADD"
 			}"
 		end

	xml_rngp_interleave_create_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_INTERLEAVE_CREATE_FAILED"
 			}"
 		end

	xml_rngp_interleave_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_INTERLEAVE_EMPTY"
 			}"
 		end

	xml_rngp_interleave_no_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_INTERLEAVE_NO_CONTENT"
 			}"
 		end

	xml_rngp_invalid_define_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_INVALID_DEFINE_NAME"
 			}"
 		end

	xml_rngp_invalid_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_INVALID_URI"
 			}"
 		end

	xml_rngp_invalid_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_INVALID_VALUE"
 			}"
 		end

	xml_rngp_missing_href_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_MISSING_HREF"
 			}"
 		end

	xml_rngp_name_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_NAME_MISSING"
 			}"
 		end

	xml_rngp_need_combine_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_NEED_COMBINE"
 			}"
 		end

	xml_rngp_notallowed_not_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_NOTALLOWED_NOT_EMPTY"
 			}"
 		end

	xml_rngp_nsname_attr_ancestor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_NSNAME_ATTR_ANCESTOR"
 			}"
 		end

	xml_rngp_nsname_no_ns_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_NSNAME_NO_NS"
 			}"
 		end

	xml_rngp_param_forbidden_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PARAM_FORBIDDEN"
 			}"
 		end

	xml_rngp_param_name_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PARAM_NAME_MISSING"
 			}"
 		end

	xml_rngp_parentref_create_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PARENTREF_CREATE_FAILED"
 			}"
 		end

	xml_rngp_parentref_name_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PARENTREF_NAME_INVALID"
 			}"
 		end

	xml_rngp_parentref_no_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PARENTREF_NO_NAME"
 			}"
 		end

	xml_rngp_parentref_no_parent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PARENTREF_NO_PARENT"
 			}"
 		end

	xml_rngp_parentref_not_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PARENTREF_NOT_EMPTY"
 			}"
 		end

	xml_rngp_parse_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PARSE_ERROR"
 			}"
 		end

	xml_rngp_pat_anyname_except_anyname_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_ANYNAME_EXCEPT_ANYNAME"
 			}"
 		end

	xml_rngp_pat_attr_attr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_ATTR_ATTR"
 			}"
 		end

	xml_rngp_pat_attr_elem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_ATTR_ELEM"
 			}"
 		end

	xml_rngp_pat_data_except_attr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_DATA_EXCEPT_ATTR"
 			}"
 		end

	xml_rngp_pat_data_except_elem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_DATA_EXCEPT_ELEM"
 			}"
 		end

	xml_rngp_pat_data_except_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_DATA_EXCEPT_EMPTY"
 			}"
 		end

	xml_rngp_pat_data_except_group_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_DATA_EXCEPT_GROUP"
 			}"
 		end

	xml_rngp_pat_data_except_interleave_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_DATA_EXCEPT_INTERLEAVE"
 			}"
 		end

	xml_rngp_pat_data_except_list_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_DATA_EXCEPT_LIST"
 			}"
 		end

	xml_rngp_pat_data_except_onemore_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_DATA_EXCEPT_ONEMORE"
 			}"
 		end

	xml_rngp_pat_data_except_ref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_DATA_EXCEPT_REF"
 			}"
 		end

	xml_rngp_pat_data_except_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_DATA_EXCEPT_TEXT"
 			}"
 		end

	xml_rngp_pat_list_attr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_LIST_ATTR"
 			}"
 		end

	xml_rngp_pat_list_elem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_LIST_ELEM"
 			}"
 		end

	xml_rngp_pat_list_interleave_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_LIST_INTERLEAVE"
 			}"
 		end

	xml_rngp_pat_list_list_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_LIST_LIST"
 			}"
 		end

	xml_rngp_pat_list_ref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_LIST_REF"
 			}"
 		end

	xml_rngp_pat_list_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_LIST_TEXT"
 			}"
 		end

	xml_rngp_pat_nsname_except_anyname_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_NSNAME_EXCEPT_ANYNAME"
 			}"
 		end

	xml_rngp_pat_nsname_except_nsname_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_NSNAME_EXCEPT_NSNAME"
 			}"
 		end

	xml_rngp_pat_onemore_group_attr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_ONEMORE_GROUP_ATTR"
 			}"
 		end

	xml_rngp_pat_onemore_interleave_attr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_ONEMORE_INTERLEAVE_ATTR"
 			}"
 		end

	xml_rngp_pat_start_attr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_START_ATTR"
 			}"
 		end

	xml_rngp_pat_start_data_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_START_DATA"
 			}"
 		end

	xml_rngp_pat_start_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_START_EMPTY"
 			}"
 		end

	xml_rngp_pat_start_group_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_START_GROUP"
 			}"
 		end

	xml_rngp_pat_start_interleave_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_START_INTERLEAVE"
 			}"
 		end

	xml_rngp_pat_start_list_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_START_LIST"
 			}"
 		end

	xml_rngp_pat_start_onemore_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_START_ONEMORE"
 			}"
 		end

	xml_rngp_pat_start_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_START_TEXT"
 			}"
 		end

	xml_rngp_pat_start_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PAT_START_VALUE"
 			}"
 		end

	xml_rngp_prefix_undefined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_PREFIX_UNDEFINED"
 			}"
 		end

	xml_rngp_ref_create_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_REF_CREATE_FAILED"
 			}"
 		end

	xml_rngp_ref_cycle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_REF_CYCLE"
 			}"
 		end

	xml_rngp_ref_name_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_REF_NAME_INVALID"
 			}"
 		end

	xml_rngp_ref_no_def_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_REF_NO_DEF"
 			}"
 		end

	xml_rngp_ref_no_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_REF_NO_NAME"
 			}"
 		end

	xml_rngp_ref_not_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_REF_NOT_EMPTY"
 			}"
 		end

	xml_rngp_start_choice_and_interleave_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_START_CHOICE_AND_INTERLEAVE"
 			}"
 		end

	xml_rngp_start_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_START_CONTENT"
 			}"
 		end

	xml_rngp_start_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_START_EMPTY"
 			}"
 		end

	xml_rngp_start_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_START_MISSING"
 			}"
 		end

	xml_rngp_text_expected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_TEXT_EXPECTED"
 			}"
 		end

	xml_rngp_text_has_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_TEXT_HAS_CHILD"
 			}"
 		end

	xml_rngp_type_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_TYPE_MISSING"
 			}"
 		end

	xml_rngp_type_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_TYPE_NOT_FOUND"
 			}"
 		end

	xml_rngp_type_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_TYPE_VALUE"
 			}"
 		end

	xml_rngp_unknown_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_UNKNOWN_ATTRIBUTE"
 			}"
 		end

	xml_rngp_unknown_combine_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_UNKNOWN_COMBINE"
 			}"
 		end

	xml_rngp_unknown_construct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_UNKNOWN_CONSTRUCT"
 			}"
 		end

	xml_rngp_unknown_type_lib_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_UNKNOWN_TYPE_LIB"
 			}"
 		end

	xml_rngp_uri_fragment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_URI_FRAGMENT"
 			}"
 		end

	xml_rngp_uri_not_absolute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_URI_NOT_ABSOLUTE"
 			}"
 		end

	xml_rngp_value_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_VALUE_EMPTY"
 			}"
 		end

	xml_rngp_value_no_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_VALUE_NO_CONTENT"
 			}"
 		end

	xml_rngp_xml_ns_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_XML_NS"
 			}"
 		end

	xml_rngp_xmlns_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_RNGP_XMLNS_NAME"
 			}"
 		end

	xml_save_char_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SAVE_CHAR_INVALID"
 			}"
 		end

	xml_save_no_doctype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SAVE_NO_DOCTYPE"
 			}"
 		end

	xml_save_not_utf8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SAVE_NOT_UTF8"
 			}"
 		end

	xml_save_unknown_encoding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SAVE_UNKNOWN_ENCODING"
 			}"
 		end

	xml_schemap_a_props_correct_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_A_PROPS_CORRECT_2"
 			}"
 		end

	xml_schemap_a_props_correct_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_A_PROPS_CORRECT_3"
 			}"
 		end

	xml_schemap_ag_props_correct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_AG_PROPS_CORRECT"
 			}"
 		end

	xml_schemap_attr_noname_noref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_ATTR_NONAME_NOREF"
 			}"
 		end

	xml_schemap_attrformdefault_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_ATTRFORMDEFAULT_VALUE"
 			}"
 		end

	xml_schemap_attrgrp_noname_noref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_ATTRGRP_NONAME_NOREF"
 			}"
 		end

	xml_schemap_au_props_correct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_AU_PROPS_CORRECT"
 			}"
 		end

	xml_schemap_au_props_correct_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_AU_PROPS_CORRECT_2"
 			}"
 		end

	xml_schemap_c_props_correct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_C_PROPS_CORRECT"
 			}"
 		end

	xml_schemap_complextype_noname_noref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COMPLEXTYPE_NONAME_NOREF"
 			}"
 		end

	xml_schemap_cos_all_limited_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ALL_LIMITED"
 			}"
 		end

	xml_schemap_cos_ct_extends_1_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_CT_EXTENDS_1_1"
 			}"
 		end

	xml_schemap_cos_ct_extends_1_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_CT_EXTENDS_1_2"
 			}"
 		end

	xml_schemap_cos_ct_extends_1_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_CT_EXTENDS_1_3"
 			}"
 		end

	xml_schemap_cos_st_derived_ok_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_DERIVED_OK_2_1"
 			}"
 		end

	xml_schemap_cos_st_derived_ok_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_DERIVED_OK_2_2"
 			}"
 		end

	xml_schemap_cos_st_restricts_1_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_1_1"
 			}"
 		end

	xml_schemap_cos_st_restricts_1_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_1_2"
 			}"
 		end

	xml_schemap_cos_st_restricts_1_3_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_1_3_1"
 			}"
 		end

	xml_schemap_cos_st_restricts_1_3_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_1_3_2"
 			}"
 		end

	xml_schemap_cos_st_restricts_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_1"
 			}"
 		end

	xml_schemap_cos_st_restricts_2_3_1_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_1"
 			}"
 		end

	xml_schemap_cos_st_restricts_2_3_1_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_2"
 			}"
 		end

	xml_schemap_cos_st_restricts_2_3_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_1"
 			}"
 		end

	xml_schemap_cos_st_restricts_2_3_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_2"
 			}"
 		end

	xml_schemap_cos_st_restricts_2_3_2_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_3"
 			}"
 		end

	xml_schemap_cos_st_restricts_2_3_2_4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_4"
 			}"
 		end

	xml_schemap_cos_st_restricts_2_3_2_5_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_5"
 			}"
 		end

	xml_schemap_cos_st_restricts_3_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_1"
 			}"
 		end

	xml_schemap_cos_st_restricts_3_3_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1"
 			}"
 		end

	xml_schemap_cos_st_restricts_3_3_1_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1_2"
 			}"
 		end

	xml_schemap_cos_st_restricts_3_3_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_1"
 			}"
 		end

	xml_schemap_cos_st_restricts_3_3_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_2"
 			}"
 		end

	xml_schemap_cos_st_restricts_3_3_2_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_3"
 			}"
 		end

	xml_schemap_cos_st_restricts_3_3_2_4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_4"
 			}"
 		end

	xml_schemap_cos_st_restricts_3_3_2_5_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_5"
 			}"
 		end

	xml_schemap_cos_valid_default_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_VALID_DEFAULT_1"
 			}"
 		end

	xml_schemap_cos_valid_default_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_VALID_DEFAULT_2_1"
 			}"
 		end

	xml_schemap_cos_valid_default_2_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_VALID_DEFAULT_2_2_1"
 			}"
 		end

	xml_schemap_cos_valid_default_2_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_COS_VALID_DEFAULT_2_2_2"
 			}"
 		end

	xml_schemap_ct_props_correct_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_CT_PROPS_CORRECT_1"
 			}"
 		end

	xml_schemap_ct_props_correct_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_CT_PROPS_CORRECT_2"
 			}"
 		end

	xml_schemap_ct_props_correct_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_CT_PROPS_CORRECT_3"
 			}"
 		end

	xml_schemap_ct_props_correct_4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_CT_PROPS_CORRECT_4"
 			}"
 		end

	xml_schemap_ct_props_correct_5_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_CT_PROPS_CORRECT_5"
 			}"
 		end

	xml_schemap_cvc_simple_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_CVC_SIMPLE_TYPE"
 			}"
 		end

	xml_schemap_def_and_prefix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_DEF_AND_PREFIX"
 			}"
 		end

	xml_schemap_derivation_ok_restriction_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_1"
 			}"
 		end

	xml_schemap_derivation_ok_restriction_2_1_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_1"
 			}"
 		end

	xml_schemap_derivation_ok_restriction_2_1_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_2"
 			}"
 		end

	xml_schemap_derivation_ok_restriction_2_1_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_3"
 			}"
 		end

	xml_schemap_derivation_ok_restriction_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_2"
 			}"
 		end

	xml_schemap_derivation_ok_restriction_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_3"
 			}"
 		end

	xml_schemap_derivation_ok_restriction_4_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_1"
 			}"
 		end

	xml_schemap_derivation_ok_restriction_4_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_2"
 			}"
 		end

	xml_schemap_derivation_ok_restriction_4_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_3"
 			}"
 		end

	xml_schemap_e_props_correct_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_E_PROPS_CORRECT_2"
 			}"
 		end

	xml_schemap_e_props_correct_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_E_PROPS_CORRECT_3"
 			}"
 		end

	xml_schemap_e_props_correct_4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_E_PROPS_CORRECT_4"
 			}"
 		end

	xml_schemap_e_props_correct_5_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_E_PROPS_CORRECT_5"
 			}"
 		end

	xml_schemap_e_props_correct_6_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_E_PROPS_CORRECT_6"
 			}"
 		end

	xml_schemap_elem_default_fixed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_ELEM_DEFAULT_FIXED"
 			}"
 		end

	xml_schemap_elem_noname_noref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_ELEM_NONAME_NOREF"
 			}"
 		end

	xml_schemap_elemformdefault_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_ELEMFORMDEFAULT_VALUE"
 			}"
 		end

	xml_schemap_extension_no_base_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_EXTENSION_NO_BASE"
 			}"
 		end

	xml_schemap_facet_no_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_FACET_NO_VALUE"
 			}"
 		end

	xml_schemap_failed_build_import_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_FAILED_BUILD_IMPORT"
 			}"
 		end

	xml_schemap_failed_load_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_FAILED_LOAD"
 			}"
 		end

	xml_schemap_failed_parse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_FAILED_PARSE"
 			}"
 		end

	xml_schemap_group_noname_noref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_GROUP_NONAME_NOREF"
 			}"
 		end

	xml_schemap_import_namespace_not_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_IMPORT_NAMESPACE_NOT_URI"
 			}"
 		end

	xml_schemap_import_redefine_nsname_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_IMPORT_REDEFINE_NSNAME"
 			}"
 		end

	xml_schemap_import_schema_not_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_IMPORT_SCHEMA_NOT_URI"
 			}"
 		end

	xml_schemap_include_schema_no_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INCLUDE_SCHEMA_NO_URI"
 			}"
 		end

	xml_schemap_include_schema_not_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INCLUDE_SCHEMA_NOT_URI"
 			}"
 		end

	xml_schemap_internal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INTERNAL"
 			}"
 		end

	xml_schemap_intersection_not_expressible_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INTERSECTION_NOT_EXPRESSIBLE"
 			}"
 		end

	xml_schemap_invalid_attr_combination_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_ATTR_COMBINATION"
 			}"
 		end

	xml_schemap_invalid_attr_inline_combination_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_ATTR_INLINE_COMBINATION"
 			}"
 		end

	xml_schemap_invalid_attr_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_ATTR_NAME"
 			}"
 		end

	xml_schemap_invalid_attr_use_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_ATTR_USE"
 			}"
 		end

	xml_schemap_invalid_boolean_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_BOOLEAN"
 			}"
 		end

	xml_schemap_invalid_enum_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_ENUM"
 			}"
 		end

	xml_schemap_invalid_facet_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_FACET"
 			}"
 		end

	xml_schemap_invalid_facet_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_FACET_VALUE"
 			}"
 		end

	xml_schemap_invalid_maxoccurs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_MAXOCCURS"
 			}"
 		end

	xml_schemap_invalid_minoccurs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_MINOCCURS"
 			}"
 		end

	xml_schemap_invalid_ref_and_subtype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_REF_AND_SUBTYPE"
 			}"
 		end

	xml_schemap_invalid_white_space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_INVALID_WHITE_SPACE"
 			}"
 		end

	xml_schemap_mg_props_correct_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_MG_PROPS_CORRECT_1"
 			}"
 		end

	xml_schemap_mg_props_correct_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_MG_PROPS_CORRECT_2"
 			}"
 		end

	xml_schemap_missing_simpletype_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_MISSING_SIMPLETYPE_CHILD"
 			}"
 		end

	xml_schemap_no_xmlns_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_NO_XMLNS"
 			}"
 		end

	xml_schemap_no_xsi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_NO_XSI"
 			}"
 		end

	xml_schemap_noattr_noref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_NOATTR_NOREF"
 			}"
 		end

	xml_schemap_noroot_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_NOROOT"
 			}"
 		end

	xml_schemap_not_deterministic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_NOT_DETERMINISTIC"
 			}"
 		end

	xml_schemap_not_schema_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_NOT_SCHEMA"
 			}"
 		end

	xml_schemap_notation_no_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_NOTATION_NO_NAME"
 			}"
 		end

	xml_schemap_nothing_to_parse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_NOTHING_TO_PARSE"
 			}"
 		end

	xml_schemap_notype_noref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_NOTYPE_NOREF"
 			}"
 		end

	xml_schemap_p_props_correct_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_P_PROPS_CORRECT_1"
 			}"
 		end

	xml_schemap_p_props_correct_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_P_PROPS_CORRECT_2_1"
 			}"
 		end

	xml_schemap_p_props_correct_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_P_PROPS_CORRECT_2_2"
 			}"
 		end

	xml_schemap_prefix_undefined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_PREFIX_UNDEFINED"
 			}"
 		end

	xml_schemap_recursive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_RECURSIVE"
 			}"
 		end

	xml_schemap_redefined_attr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_REDEFINED_ATTR"
 			}"
 		end

	xml_schemap_redefined_attrgroup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_REDEFINED_ATTRGROUP"
 			}"
 		end

	xml_schemap_redefined_element_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_REDEFINED_ELEMENT"
 			}"
 		end

	xml_schemap_redefined_group_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_REDEFINED_GROUP"
 			}"
 		end

	xml_schemap_redefined_notation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_REDEFINED_NOTATION"
 			}"
 		end

	xml_schemap_redefined_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_REDEFINED_TYPE"
 			}"
 		end

	xml_schemap_ref_and_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_REF_AND_CONTENT"
 			}"
 		end

	xml_schemap_ref_and_subtype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_REF_AND_SUBTYPE"
 			}"
 		end

	xml_schemap_regexp_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_REGEXP_INVALID"
 			}"
 		end

	xml_schemap_restriction_noname_noref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_RESTRICTION_NONAME_NOREF"
 			}"
 		end

	xml_schemap_s4s_attr_invalid_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_S4S_ATTR_INVALID_VALUE"
 			}"
 		end

	xml_schemap_s4s_attr_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_S4S_ATTR_MISSING"
 			}"
 		end

	xml_schemap_s4s_attr_not_allowed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_S4S_ATTR_NOT_ALLOWED"
 			}"
 		end

	xml_schemap_s4s_elem_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_S4S_ELEM_MISSING"
 			}"
 		end

	xml_schemap_s4s_elem_not_allowed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_S4S_ELEM_NOT_ALLOWED"
 			}"
 		end

	xml_schemap_simpletype_noname_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SIMPLETYPE_NONAME"
 			}"
 		end

	xml_schemap_src_attribute_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_1"
 			}"
 		end

	xml_schemap_src_attribute_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_2"
 			}"
 		end

	xml_schemap_src_attribute_3_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_3_1"
 			}"
 		end

	xml_schemap_src_attribute_3_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_3_2"
 			}"
 		end

	xml_schemap_src_attribute_4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_4"
 			}"
 		end

	xml_schemap_src_attribute_group_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_1"
 			}"
 		end

	xml_schemap_src_attribute_group_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_2"
 			}"
 		end

	xml_schemap_src_attribute_group_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_3"
 			}"
 		end

	xml_schemap_src_ct_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_CT_1"
 			}"
 		end

	xml_schemap_src_element_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ELEMENT_1"
 			}"
 		end

	xml_schemap_src_element_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ELEMENT_2_1"
 			}"
 		end

	xml_schemap_src_element_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ELEMENT_2_2"
 			}"
 		end

	xml_schemap_src_element_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_ELEMENT_3"
 			}"
 		end

	xml_schemap_src_import_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_IMPORT"
 			}"
 		end

	xml_schemap_src_import_1_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_IMPORT_1_1"
 			}"
 		end

	xml_schemap_src_import_1_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_IMPORT_1_2"
 			}"
 		end

	xml_schemap_src_import_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_IMPORT_2"
 			}"
 		end

	xml_schemap_src_import_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_IMPORT_2_1"
 			}"
 		end

	xml_schemap_src_import_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_IMPORT_2_2"
 			}"
 		end

	xml_schemap_src_import_3_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_IMPORT_3_1"
 			}"
 		end

	xml_schemap_src_import_3_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_IMPORT_3_2"
 			}"
 		end

	xml_schemap_src_include_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_INCLUDE"
 			}"
 		end

	xml_schemap_src_list_itemtype_or_simpletype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_LIST_ITEMTYPE_OR_SIMPLETYPE"
 			}"
 		end

	xml_schemap_src_redefine_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_REDEFINE"
 			}"
 		end

	xml_schemap_src_resolve_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_RESOLVE"
 			}"
 		end

	xml_schemap_src_restriction_base_or_simpletype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_RESTRICTION_BASE_OR_SIMPLETYPE"
 			}"
 		end

	xml_schemap_src_simple_type_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_SIMPLE_TYPE_1"
 			}"
 		end

	xml_schemap_src_simple_type_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_SIMPLE_TYPE_2"
 			}"
 		end

	xml_schemap_src_simple_type_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_SIMPLE_TYPE_3"
 			}"
 		end

	xml_schemap_src_simple_type_4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_SIMPLE_TYPE_4"
 			}"
 		end

	xml_schemap_src_union_membertypes_or_simpletypes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SRC_UNION_MEMBERTYPES_OR_SIMPLETYPES"
 			}"
 		end

	xml_schemap_st_props_correct_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_ST_PROPS_CORRECT_1"
 			}"
 		end

	xml_schemap_st_props_correct_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_ST_PROPS_CORRECT_2"
 			}"
 		end

	xml_schemap_st_props_correct_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_ST_PROPS_CORRECT_3"
 			}"
 		end

	xml_schemap_supernumerous_list_item_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_SUPERNUMEROUS_LIST_ITEM_TYPE"
 			}"
 		end

	xml_schemap_type_and_subtype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_TYPE_AND_SUBTYPE"
 			}"
 		end

	xml_schemap_union_not_expressible_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNION_NOT_EXPRESSIBLE"
 			}"
 		end

	xml_schemap_unknown_all_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_ALL_CHILD"
 			}"
 		end

	xml_schemap_unknown_anyattribute_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_ANYATTRIBUTE_CHILD"
 			}"
 		end

	xml_schemap_unknown_attr_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_ATTR_CHILD"
 			}"
 		end

	xml_schemap_unknown_attrgrp_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_ATTRGRP_CHILD"
 			}"
 		end

	xml_schemap_unknown_attribute_group_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_ATTRIBUTE_GROUP"
 			}"
 		end

	xml_schemap_unknown_base_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_BASE_TYPE"
 			}"
 		end

	xml_schemap_unknown_choice_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_CHOICE_CHILD"
 			}"
 		end

	xml_schemap_unknown_complexcontent_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_COMPLEXCONTENT_CHILD"
 			}"
 		end

	xml_schemap_unknown_complextype_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_COMPLEXTYPE_CHILD"
 			}"
 		end

	xml_schemap_unknown_elem_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_ELEM_CHILD"
 			}"
 		end

	xml_schemap_unknown_extension_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_EXTENSION_CHILD"
 			}"
 		end

	xml_schemap_unknown_facet_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_FACET_CHILD"
 			}"
 		end

	xml_schemap_unknown_facet_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_FACET_TYPE"
 			}"
 		end

	xml_schemap_unknown_group_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_GROUP_CHILD"
 			}"
 		end

	xml_schemap_unknown_import_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_IMPORT_CHILD"
 			}"
 		end

	xml_schemap_unknown_include_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_INCLUDE_CHILD"
 			}"
 		end

	xml_schemap_unknown_list_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_LIST_CHILD"
 			}"
 		end

	xml_schemap_unknown_member_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_MEMBER_TYPE"
 			}"
 		end

	xml_schemap_unknown_notation_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_NOTATION_CHILD"
 			}"
 		end

	xml_schemap_unknown_prefix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_PREFIX"
 			}"
 		end

	xml_schemap_unknown_processcontent_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_PROCESSCONTENT_CHILD"
 			}"
 		end

	xml_schemap_unknown_ref_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_REF"
 			}"
 		end

	xml_schemap_unknown_restriction_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_RESTRICTION_CHILD"
 			}"
 		end

	xml_schemap_unknown_schemas_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_SCHEMAS_CHILD"
 			}"
 		end

	xml_schemap_unknown_sequence_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_SEQUENCE_CHILD"
 			}"
 		end

	xml_schemap_unknown_simplecontent_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_SIMPLECONTENT_CHILD"
 			}"
 		end

	xml_schemap_unknown_simpletype_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_SIMPLETYPE_CHILD"
 			}"
 		end

	xml_schemap_unknown_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_TYPE"
 			}"
 		end

	xml_schemap_unknown_union_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_UNKNOWN_UNION_CHILD"
 			}"
 		end

	xml_schemap_warn_attr_pointless_proh_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_WARN_ATTR_POINTLESS_PROH"
 			}"
 		end

	xml_schemap_warn_attr_redecl_proh_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_WARN_ATTR_REDECL_PROH"
 			}"
 		end

	xml_schemap_warn_skip_schema_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_WARN_SKIP_SCHEMA"
 			}"
 		end

	xml_schemap_warn_unlocated_schema_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_WARN_UNLOCATED_SCHEMA"
 			}"
 		end

	xml_schemap_wildcard_invalid_ns_member_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAP_WILDCARD_INVALID_NS_MEMBER"
 			}"
 		end

	xml_schematronv_assert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMATRONV_ASSERT"
 			}"
 		end

	xml_schematronv_report_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMATRONV_REPORT"
 			}"
 		end

	xml_schemav_attrinvalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_ATTRINVALID"
 			}"
 		end

	xml_schemav_attrunknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_ATTRUNKNOWN"
 			}"
 		end

	xml_schemav_construct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CONSTRUCT"
 			}"
 		end

	xml_schemav_cvc_attribute_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ATTRIBUTE_1"
 			}"
 		end

	xml_schemav_cvc_attribute_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ATTRIBUTE_2"
 			}"
 		end

	xml_schemav_cvc_attribute_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ATTRIBUTE_3"
 			}"
 		end

	xml_schemav_cvc_attribute_4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ATTRIBUTE_4"
 			}"
 		end

	xml_schemav_cvc_au_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_AU"
 			}"
 		end

	xml_schemav_cvc_complex_type_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_1"
 			}"
 		end

	xml_schemav_cvc_complex_type_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_1"
 			}"
 		end

	xml_schemav_cvc_complex_type_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_2"
 			}"
 		end

	xml_schemav_cvc_complex_type_2_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_3"
 			}"
 		end

	xml_schemav_cvc_complex_type_2_4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_4"
 			}"
 		end

	xml_schemav_cvc_complex_type_3_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_3_1"
 			}"
 		end

	xml_schemav_cvc_complex_type_3_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_1"
 			}"
 		end

	xml_schemav_cvc_complex_type_3_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_2"
 			}"
 		end

	xml_schemav_cvc_complex_type_4_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_4"
 			}"
 		end

	xml_schemav_cvc_complex_type_5_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_5_1"
 			}"
 		end

	xml_schemav_cvc_complex_type_5_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_COMPLEX_TYPE_5_2"
 			}"
 		end

	xml_schemav_cvc_datatype_valid_1_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_1"
 			}"
 		end

	xml_schemav_cvc_datatype_valid_1_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_2"
 			}"
 		end

	xml_schemav_cvc_datatype_valid_1_2_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_3"
 			}"
 		end

	xml_schemav_cvc_elt_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_1"
 			}"
 		end

	xml_schemav_cvc_elt_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_2"
 			}"
 		end

	xml_schemav_cvc_elt_3_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_3_1"
 			}"
 		end

	xml_schemav_cvc_elt_3_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_3_2_1"
 			}"
 		end

	xml_schemav_cvc_elt_3_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_3_2_2"
 			}"
 		end

	xml_schemav_cvc_elt_4_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_4_1"
 			}"
 		end

	xml_schemav_cvc_elt_4_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_4_2"
 			}"
 		end

	xml_schemav_cvc_elt_4_3_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_4_3"
 			}"
 		end

	xml_schemav_cvc_elt_5_1_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_5_1_1"
 			}"
 		end

	xml_schemav_cvc_elt_5_1_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_5_1_2"
 			}"
 		end

	xml_schemav_cvc_elt_5_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_5_2_1"
 			}"
 		end

	xml_schemav_cvc_elt_5_2_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_5_2_2_1"
 			}"
 		end

	xml_schemav_cvc_elt_5_2_2_2_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_5_2_2_2_1"
 			}"
 		end

	xml_schemav_cvc_elt_5_2_2_2_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_5_2_2_2_2"
 			}"
 		end

	xml_schemav_cvc_elt_6_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_6"
 			}"
 		end

	xml_schemav_cvc_elt_7_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ELT_7"
 			}"
 		end

	xml_schemav_cvc_enumeration_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_ENUMERATION_VALID"
 			}"
 		end

	xml_schemav_cvc_facet_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_FACET_VALID"
 			}"
 		end

	xml_schemav_cvc_fractiondigits_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_FRACTIONDIGITS_VALID"
 			}"
 		end

	xml_schemav_cvc_idc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_IDC"
 			}"
 		end

	xml_schemav_cvc_length_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_LENGTH_VALID"
 			}"
 		end

	xml_schemav_cvc_maxexclusive_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_MAXEXCLUSIVE_VALID"
 			}"
 		end

	xml_schemav_cvc_maxinclusive_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_MAXINCLUSIVE_VALID"
 			}"
 		end

	xml_schemav_cvc_maxlength_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_MAXLENGTH_VALID"
 			}"
 		end

	xml_schemav_cvc_minexclusive_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_MINEXCLUSIVE_VALID"
 			}"
 		end

	xml_schemav_cvc_mininclusive_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_MININCLUSIVE_VALID"
 			}"
 		end

	xml_schemav_cvc_minlength_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_MINLENGTH_VALID"
 			}"
 		end

	xml_schemav_cvc_pattern_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_PATTERN_VALID"
 			}"
 		end

	xml_schemav_cvc_totaldigits_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_TOTALDIGITS_VALID"
 			}"
 		end

	xml_schemav_cvc_type_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_TYPE_1"
 			}"
 		end

	xml_schemav_cvc_type_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_TYPE_2"
 			}"
 		end

	xml_schemav_cvc_type_3_1_1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_TYPE_3_1_1"
 			}"
 		end

	xml_schemav_cvc_type_3_1_2_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_TYPE_3_1_2"
 			}"
 		end

	xml_schemav_cvc_wildcard_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_CVC_WILDCARD"
 			}"
 		end

	xml_schemav_document_element_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_DOCUMENT_ELEMENT_MISSING"
 			}"
 		end

	xml_schemav_elemcont_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_ELEMCONT"
 			}"
 		end

	xml_schemav_element_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_ELEMENT_CONTENT"
 			}"
 		end

	xml_schemav_extracontent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_EXTRACONTENT"
 			}"
 		end

	xml_schemav_facet_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_FACET"
 			}"
 		end

	xml_schemav_havedefault_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_HAVEDEFAULT"
 			}"
 		end

	xml_schemav_internal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_INTERNAL"
 			}"
 		end

	xml_schemav_invalidattr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_INVALIDATTR"
 			}"
 		end

	xml_schemav_invalidelem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_INVALIDELEM"
 			}"
 		end

	xml_schemav_isabstract_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_ISABSTRACT"
 			}"
 		end

	xml_schemav_misc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_MISC"
 			}"
 		end

	xml_schemav_missing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_MISSING"
 			}"
 		end

	xml_schemav_norollback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_NOROLLBACK"
 			}"
 		end

	xml_schemav_noroot_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_NOROOT"
 			}"
 		end

	xml_schemav_notdeterminist_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_NOTDETERMINIST"
 			}"
 		end

	xml_schemav_notempty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_NOTEMPTY"
 			}"
 		end

	xml_schemav_notnillable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_NOTNILLABLE"
 			}"
 		end

	xml_schemav_notsimple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_NOTSIMPLE"
 			}"
 		end

	xml_schemav_nottoplevel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_NOTTOPLEVEL"
 			}"
 		end

	xml_schemav_notype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_NOTYPE"
 			}"
 		end

	xml_schemav_undeclaredelem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_UNDECLAREDELEM"
 			}"
 		end

	xml_schemav_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_VALUE"
 			}"
 		end

	xml_schemav_wrongelem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_SCHEMAV_WRONGELEM"
 			}"
 		end

	xml_tree_invalid_dec_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_TREE_INVALID_DEC"
 			}"
 		end

	xml_tree_invalid_hex_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_TREE_INVALID_HEX"
 			}"
 		end

	xml_tree_not_utf8_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_TREE_NOT_UTF8"
 			}"
 		end

	xml_tree_unterminated_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_TREE_UNTERMINATED_ENTITY"
 			}"
 		end

	xml_war_catalog_pi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WAR_CATALOG_PI"
 			}"
 		end

	xml_war_entity_redefined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WAR_ENTITY_REDEFINED"
 			}"
 		end

	xml_war_lang_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WAR_LANG_VALUE"
 			}"
 		end

	xml_war_ns_column_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WAR_NS_COLUMN"
 			}"
 		end

	xml_war_ns_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WAR_NS_URI"
 			}"
 		end

	xml_war_ns_uri_relative_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WAR_NS_URI_RELATIVE"
 			}"
 		end

	xml_war_space_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WAR_SPACE_VALUE"
 			}"
 		end

	xml_war_undeclared_entity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WAR_UNDECLARED_ENTITY"
 			}"
 		end

	xml_war_unknown_version_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WAR_UNKNOWN_VERSION"
 			}"
 		end

	xml_xinclude_build_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_BUILD_FAILED"
 			}"
 		end

	xml_xinclude_deprecated_ns_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_DEPRECATED_NS"
 			}"
 		end

	xml_xinclude_entity_def_mismatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_ENTITY_DEF_MISMATCH"
 			}"
 		end

	xml_xinclude_fallback_not_in_include_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_FALLBACK_NOT_IN_INCLUDE"
 			}"
 		end

	xml_xinclude_fallbacks_in_include_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_FALLBACKS_IN_INCLUDE"
 			}"
 		end

	xml_xinclude_fragment_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_FRAGMENT_ID"
 			}"
 		end

	xml_xinclude_href_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_HREF_URI"
 			}"
 		end

	xml_xinclude_include_in_include_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_INCLUDE_IN_INCLUDE"
 			}"
 		end

	xml_xinclude_invalid_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_INVALID_CHAR"
 			}"
 		end

	xml_xinclude_multiple_root_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_MULTIPLE_ROOT"
 			}"
 		end

	xml_xinclude_no_fallback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_NO_FALLBACK"
 			}"
 		end

	xml_xinclude_no_href_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_NO_HREF"
 			}"
 		end

	xml_xinclude_parse_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_PARSE_VALUE"
 			}"
 		end

	xml_xinclude_recursion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_RECURSION"
 			}"
 		end

	xml_xinclude_text_document_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_TEXT_DOCUMENT"
 			}"
 		end

	xml_xinclude_text_fragment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_TEXT_FRAGMENT"
 			}"
 		end

	xml_xinclude_unknown_encoding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_UNKNOWN_ENCODING"
 			}"
 		end

	xml_xinclude_xptr_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_XPTR_FAILED"
 			}"
 		end

	xml_xinclude_xptr_result_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XINCLUDE_XPTR_RESULT"
 			}"
 		end

	xml_xpath_encoding_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_ENCODING_ERROR"
 			}"
 		end

	xml_xpath_expr_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_EXPR_ERROR"
 			}"
 		end

	xml_xpath_expression_ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_EXPRESSION_OK"
 			}"
 		end

	xml_xpath_invalid_arity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_INVALID_ARITY"
 			}"
 		end

	xml_xpath_invalid_char_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_INVALID_CHAR_ERROR"
 			}"
 		end

	xml_xpath_invalid_ctxt_position_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_INVALID_CTXT_POSITION"
 			}"
 		end

	xml_xpath_invalid_ctxt_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_INVALID_CTXT_SIZE"
 			}"
 		end

	xml_xpath_invalid_operand_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_INVALID_OPERAND"
 			}"
 		end

	xml_xpath_invalid_predicate_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_INVALID_PREDICATE_ERROR"
 			}"
 		end

	xml_xpath_invalid_type_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_INVALID_TYPE"
 			}"
 		end

	xml_xpath_memory_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_MEMORY_ERROR"
 			}"
 		end

	xml_xpath_number_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_NUMBER_ERROR"
 			}"
 		end

	xml_xpath_start_literal_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_START_LITERAL_ERROR"
 			}"
 		end

	xml_xpath_unclosed_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_UNCLOSED_ERROR"
 			}"
 		end

	xml_xpath_undef_prefix_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_UNDEF_PREFIX_ERROR"
 			}"
 		end

	xml_xpath_undef_variable_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_UNDEF_VARIABLE_ERROR"
 			}"
 		end

	xml_xpath_unfinished_literal_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_UNFINISHED_LITERAL_ERROR"
 			}"
 		end

	xml_xpath_unknown_func_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_UNKNOWN_FUNC_ERROR"
 			}"
 		end

	xml_xpath_variable_ref_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPATH_VARIABLE_REF_ERROR"
 			}"
 		end

	xml_xptr_childseq_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPTR_CHILDSEQ_START"
 			}"
 		end

	xml_xptr_eval_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPTR_EVAL_FAILED"
 			}"
 		end

	xml_xptr_extra_objects_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPTR_EXTRA_OBJECTS"
 			}"
 		end

	xml_xptr_resource_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPTR_RESOURCE_ERROR"
 			}"
 		end

	xml_xptr_sub_resource_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPTR_SUB_RESOURCE_ERROR"
 			}"
 		end

	xml_xptr_syntax_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPTR_SYNTAX_ERROR"
 			}"
 		end

	xml_xptr_unknown_scheme_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_XPTR_UNKNOWN_SCHEME"
 			}"
 		end


end -- class XML_PARSER_ERRORS_ENUM
