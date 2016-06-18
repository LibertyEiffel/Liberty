-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_PARSER_ERRORS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_err_ok) or else 
				(a_value = xml_err_internal_error) or else 
				(a_value = xml_err_no_memory) or else 
				(a_value = xml_err_document_start) or else 
				(a_value = xml_err_document_empty) or else 
				(a_value = xml_err_document_end) or else 
				(a_value = xml_err_invalid_hex_charref) or else 
				(a_value = xml_err_invalid_dec_charref) or else 
				(a_value = xml_err_invalid_charref) or else 
				(a_value = xml_err_invalid_char) or else 
				(a_value = xml_err_charref_at_eof) or else 
				(a_value = xml_err_charref_in_prolog) or else 
				(a_value = xml_err_charref_in_epilog) or else 
				(a_value = xml_err_charref_in_dtd) or else 
				(a_value = xml_err_entityref_at_eof) or else 
				(a_value = xml_err_entityref_in_prolog) or else 
				(a_value = xml_err_entityref_in_epilog) or else 
				(a_value = xml_err_entityref_in_dtd) or else 
				(a_value = xml_err_peref_at_eof) or else 
				(a_value = xml_err_peref_in_prolog) or else 
				(a_value = xml_err_peref_in_epilog) or else 
				(a_value = xml_err_peref_in_int_subset) or else 
				(a_value = xml_err_entityref_no_name) or else 
				(a_value = xml_err_entityref_semicol_missing) or else 
				(a_value = xml_err_peref_no_name) or else 
				(a_value = xml_err_peref_semicol_missing) or else 
				(a_value = xml_err_undeclared_entity) or else 
				(a_value = xml_war_undeclared_entity) or else 
				(a_value = xml_err_unparsed_entity) or else 
				(a_value = xml_err_entity_is_external) or else 
				(a_value = xml_err_entity_is_parameter) or else 
				(a_value = xml_err_unknown_encoding) or else 
				(a_value = xml_err_unsupported_encoding) or else 
				(a_value = xml_err_string_not_started) or else 
				(a_value = xml_err_string_not_closed) or else 
				(a_value = xml_err_ns_decl_error) or else 
				(a_value = xml_err_entity_not_started) or else 
				(a_value = xml_err_entity_not_finished) or else 
				(a_value = xml_err_lt_in_attribute) or else 
				(a_value = xml_err_attribute_not_started) or else 
				(a_value = xml_err_attribute_not_finished) or else 
				(a_value = xml_err_attribute_without_value) or else 
				(a_value = xml_err_attribute_redefined) or else 
				(a_value = xml_err_literal_not_started) or else 
				(a_value = xml_err_literal_not_finished) or else 
				(a_value = xml_err_comment_not_finished) or else 
				(a_value = xml_err_pi_not_started) or else 
				(a_value = xml_err_pi_not_finished) or else 
				(a_value = xml_err_notation_not_started) or else 
				(a_value = xml_err_notation_not_finished) or else 
				(a_value = xml_err_attlist_not_started) or else 
				(a_value = xml_err_attlist_not_finished) or else 
				(a_value = xml_err_mixed_not_started) or else 
				(a_value = xml_err_mixed_not_finished) or else 
				(a_value = xml_err_elemcontent_not_started) or else 
				(a_value = xml_err_elemcontent_not_finished) or else 
				(a_value = xml_err_xmldecl_not_started) or else 
				(a_value = xml_err_xmldecl_not_finished) or else 
				(a_value = xml_err_condsec_not_started) or else 
				(a_value = xml_err_condsec_not_finished) or else 
				(a_value = xml_err_ext_subset_not_finished) or else 
				(a_value = xml_err_doctype_not_finished) or else 
				(a_value = xml_err_misplaced_cdata_end) or else 
				(a_value = xml_err_cdata_not_finished) or else 
				(a_value = xml_err_reserved_xml_name) or else 
				(a_value = xml_err_space_required) or else 
				(a_value = xml_err_separator_required) or else 
				(a_value = xml_err_nmtoken_required) or else 
				(a_value = xml_err_name_required) or else 
				(a_value = xml_err_pcdata_required) or else 
				(a_value = xml_err_uri_required) or else 
				(a_value = xml_err_pubid_required) or else 
				(a_value = xml_err_lt_required) or else 
				(a_value = xml_err_gt_required) or else 
				(a_value = xml_err_ltslash_required) or else 
				(a_value = xml_err_equal_required) or else 
				(a_value = xml_err_tag_name_mismatch) or else 
				(a_value = xml_err_tag_not_finished) or else 
				(a_value = xml_err_standalone_value) or else 
				(a_value = xml_err_encoding_name) or else 
				(a_value = xml_err_hyphen_in_comment) or else 
				(a_value = xml_err_invalid_encoding) or else 
				(a_value = xml_err_ext_entity_standalone) or else 
				(a_value = xml_err_condsec_invalid) or else 
				(a_value = xml_err_value_required) or else 
				(a_value = xml_err_not_well_balanced) or else 
				(a_value = xml_err_extra_content) or else 
				(a_value = xml_err_entity_char_error) or else 
				(a_value = xml_err_entity_pe_internal) or else 
				(a_value = xml_err_entity_loop) or else 
				(a_value = xml_err_entity_boundary) or else 
				(a_value = xml_err_invalid_uri) or else 
				(a_value = xml_err_uri_fragment) or else 
				(a_value = xml_war_catalog_pi) or else 
				(a_value = xml_err_no_dtd) or else 
				(a_value = xml_err_condsec_invalid_keyword) or else 
				(a_value = xml_err_version_missing) or else 
				(a_value = xml_war_unknown_version) or else 
				(a_value = xml_war_lang_value) or else 
				(a_value = xml_war_ns_uri) or else 
				(a_value = xml_war_ns_uri_relative) or else 
				(a_value = xml_err_missing_encoding) or else 
				(a_value = xml_war_space_value) or else 
				(a_value = xml_err_not_standalone) or else 
				(a_value = xml_err_entity_processing) or else 
				(a_value = xml_err_notation_processing) or else 
				(a_value = xml_war_ns_column) or else 
				(a_value = xml_war_entity_redefined) or else 
				(a_value = xml_ns_err_xml_namespace) or else 
				(a_value = xml_ns_err_undefined_namespace) or else 
				(a_value = xml_ns_err_qname) or else 
				(a_value = xml_ns_err_attribute_redefined) or else 
				(a_value = xml_ns_err_empty) or else 
				(a_value = xml_dtd_attribute_default) or else 
				(a_value = xml_dtd_attribute_redefined) or else 
				(a_value = xml_dtd_attribute_value) or else 
				(a_value = xml_dtd_content_error) or else 
				(a_value = xml_dtd_content_model) or else 
				(a_value = xml_dtd_content_not_determinist) or else 
				(a_value = xml_dtd_different_prefix) or else 
				(a_value = xml_dtd_elem_default_namespace) or else 
				(a_value = xml_dtd_elem_namespace) or else 
				(a_value = xml_dtd_elem_redefined) or else 
				(a_value = xml_dtd_empty_notation) or else 
				(a_value = xml_dtd_entity_type) or else 
				(a_value = xml_dtd_id_fixed) or else 
				(a_value = xml_dtd_id_redefined) or else 
				(a_value = xml_dtd_id_subset) or else 
				(a_value = xml_dtd_invalid_child) or else 
				(a_value = xml_dtd_invalid_default) or else 
				(a_value = xml_dtd_load_error) or else 
				(a_value = xml_dtd_missing_attribute) or else 
				(a_value = xml_dtd_mixed_corrupt) or else 
				(a_value = xml_dtd_multiple_id) or else 
				(a_value = xml_dtd_no_doc) or else 
				(a_value = xml_dtd_no_dtd) or else 
				(a_value = xml_dtd_no_elem_name) or else 
				(a_value = xml_dtd_no_prefix) or else 
				(a_value = xml_dtd_no_root) or else 
				(a_value = xml_dtd_notation_redefined) or else 
				(a_value = xml_dtd_notation_value) or else 
				(a_value = xml_dtd_not_empty) or else 
				(a_value = xml_dtd_not_pcdata) or else 
				(a_value = xml_dtd_not_standalone) or else 
				(a_value = xml_dtd_root_name) or else 
				(a_value = xml_dtd_standalone_white_space) or else 
				(a_value = xml_dtd_unknown_attribute) or else 
				(a_value = xml_dtd_unknown_elem) or else 
				(a_value = xml_dtd_unknown_entity) or else 
				(a_value = xml_dtd_unknown_id) or else 
				(a_value = xml_dtd_unknown_notation) or else 
				(a_value = xml_dtd_standalone_defaulted) or else 
				(a_value = xml_dtd_xmlid_value) or else 
				(a_value = xml_dtd_xmlid_type) or else 
				(a_value = xml_html_strucure_error) or else 
				(a_value = xml_html_unknown_tag) or else 
				(a_value = xml_rngp_anyname_attr_ancestor) or else 
				(a_value = xml_rngp_attr_conflict) or else 
				(a_value = xml_rngp_attribute_children) or else 
				(a_value = xml_rngp_attribute_content) or else 
				(a_value = xml_rngp_attribute_empty) or else 
				(a_value = xml_rngp_attribute_noop) or else 
				(a_value = xml_rngp_choice_content) or else 
				(a_value = xml_rngp_choice_empty) or else 
				(a_value = xml_rngp_create_failure) or else 
				(a_value = xml_rngp_data_content) or else 
				(a_value = xml_rngp_def_choice_and_interleave) or else 
				(a_value = xml_rngp_define_create_failed) or else 
				(a_value = xml_rngp_define_empty) or else 
				(a_value = xml_rngp_define_missing) or else 
				(a_value = xml_rngp_define_name_missing) or else 
				(a_value = xml_rngp_elem_content_empty) or else 
				(a_value = xml_rngp_elem_content_error) or else 
				(a_value = xml_rngp_element_empty) or else 
				(a_value = xml_rngp_element_content) or else 
				(a_value = xml_rngp_element_name) or else 
				(a_value = xml_rngp_element_no_content) or else 
				(a_value = xml_rngp_elem_text_conflict) or else 
				(a_value = xml_rngp_empty) or else 
				(a_value = xml_rngp_empty_construct) or else 
				(a_value = xml_rngp_empty_content) or else 
				(a_value = xml_rngp_empty_not_empty) or else 
				(a_value = xml_rngp_error_type_lib) or else 
				(a_value = xml_rngp_except_empty) or else 
				(a_value = xml_rngp_except_missing) or else 
				(a_value = xml_rngp_except_multiple) or else 
				(a_value = xml_rngp_except_no_content) or else 
				(a_value = xml_rngp_externalref_emtpy) or else 
				(a_value = xml_rngp_external_ref_failure) or else 
				(a_value = xml_rngp_externalref_recurse) or else 
				(a_value = xml_rngp_forbidden_attribute) or else 
				(a_value = xml_rngp_foreign_element) or else 
				(a_value = xml_rngp_grammar_content) or else 
				(a_value = xml_rngp_grammar_empty) or else 
				(a_value = xml_rngp_grammar_missing) or else 
				(a_value = xml_rngp_grammar_no_start) or else 
				(a_value = xml_rngp_group_attr_conflict) or else 
				(a_value = xml_rngp_href_error) or else 
				(a_value = xml_rngp_include_empty) or else 
				(a_value = xml_rngp_include_failure) or else 
				(a_value = xml_rngp_include_recurse) or else 
				(a_value = xml_rngp_interleave_add) or else 
				(a_value = xml_rngp_interleave_create_failed) or else 
				(a_value = xml_rngp_interleave_empty) or else 
				(a_value = xml_rngp_interleave_no_content) or else 
				(a_value = xml_rngp_invalid_define_name) or else 
				(a_value = xml_rngp_invalid_uri) or else 
				(a_value = xml_rngp_invalid_value) or else 
				(a_value = xml_rngp_missing_href) or else 
				(a_value = xml_rngp_name_missing) or else 
				(a_value = xml_rngp_need_combine) or else 
				(a_value = xml_rngp_notallowed_not_empty) or else 
				(a_value = xml_rngp_nsname_attr_ancestor) or else 
				(a_value = xml_rngp_nsname_no_ns) or else 
				(a_value = xml_rngp_param_forbidden) or else 
				(a_value = xml_rngp_param_name_missing) or else 
				(a_value = xml_rngp_parentref_create_failed) or else 
				(a_value = xml_rngp_parentref_name_invalid) or else 
				(a_value = xml_rngp_parentref_no_name) or else 
				(a_value = xml_rngp_parentref_no_parent) or else 
				(a_value = xml_rngp_parentref_not_empty) or else 
				(a_value = xml_rngp_parse_error) or else 
				(a_value = xml_rngp_pat_anyname_except_anyname) or else 
				(a_value = xml_rngp_pat_attr_attr) or else 
				(a_value = xml_rngp_pat_attr_elem) or else 
				(a_value = xml_rngp_pat_data_except_attr) or else 
				(a_value = xml_rngp_pat_data_except_elem) or else 
				(a_value = xml_rngp_pat_data_except_empty) or else 
				(a_value = xml_rngp_pat_data_except_group) or else 
				(a_value = xml_rngp_pat_data_except_interleave) or else 
				(a_value = xml_rngp_pat_data_except_list) or else 
				(a_value = xml_rngp_pat_data_except_onemore) or else 
				(a_value = xml_rngp_pat_data_except_ref) or else 
				(a_value = xml_rngp_pat_data_except_text) or else 
				(a_value = xml_rngp_pat_list_attr) or else 
				(a_value = xml_rngp_pat_list_elem) or else 
				(a_value = xml_rngp_pat_list_interleave) or else 
				(a_value = xml_rngp_pat_list_list) or else 
				(a_value = xml_rngp_pat_list_ref) or else 
				(a_value = xml_rngp_pat_list_text) or else 
				(a_value = xml_rngp_pat_nsname_except_anyname) or else 
				(a_value = xml_rngp_pat_nsname_except_nsname) or else 
				(a_value = xml_rngp_pat_onemore_group_attr) or else 
				(a_value = xml_rngp_pat_onemore_interleave_attr) or else 
				(a_value = xml_rngp_pat_start_attr) or else 
				(a_value = xml_rngp_pat_start_data) or else 
				(a_value = xml_rngp_pat_start_empty) or else 
				(a_value = xml_rngp_pat_start_group) or else 
				(a_value = xml_rngp_pat_start_interleave) or else 
				(a_value = xml_rngp_pat_start_list) or else 
				(a_value = xml_rngp_pat_start_onemore) or else 
				(a_value = xml_rngp_pat_start_text) or else 
				(a_value = xml_rngp_pat_start_value) or else 
				(a_value = xml_rngp_prefix_undefined) or else 
				(a_value = xml_rngp_ref_create_failed) or else 
				(a_value = xml_rngp_ref_cycle) or else 
				(a_value = xml_rngp_ref_name_invalid) or else 
				(a_value = xml_rngp_ref_no_def) or else 
				(a_value = xml_rngp_ref_no_name) or else 
				(a_value = xml_rngp_ref_not_empty) or else 
				(a_value = xml_rngp_start_choice_and_interleave) or else 
				(a_value = xml_rngp_start_content) or else 
				(a_value = xml_rngp_start_empty) or else 
				(a_value = xml_rngp_start_missing) or else 
				(a_value = xml_rngp_text_expected) or else 
				(a_value = xml_rngp_text_has_child) or else 
				(a_value = xml_rngp_type_missing) or else 
				(a_value = xml_rngp_type_not_found) or else 
				(a_value = xml_rngp_type_value) or else 
				(a_value = xml_rngp_unknown_attribute) or else 
				(a_value = xml_rngp_unknown_combine) or else 
				(a_value = xml_rngp_unknown_construct) or else 
				(a_value = xml_rngp_unknown_type_lib) or else 
				(a_value = xml_rngp_uri_fragment) or else 
				(a_value = xml_rngp_uri_not_absolute) or else 
				(a_value = xml_rngp_value_empty) or else 
				(a_value = xml_rngp_value_no_content) or else 
				(a_value = xml_rngp_xmlns_name) or else 
				(a_value = xml_rngp_xml_ns) or else 
				(a_value = xml_xpath_expression_ok) or else 
				(a_value = xml_xpath_number_error) or else 
				(a_value = xml_xpath_unfinished_literal_error) or else 
				(a_value = xml_xpath_start_literal_error) or else 
				(a_value = xml_xpath_variable_ref_error) or else 
				(a_value = xml_xpath_undef_variable_error) or else 
				(a_value = xml_xpath_invalid_predicate_error) or else 
				(a_value = xml_xpath_expr_error) or else 
				(a_value = xml_xpath_unclosed_error) or else 
				(a_value = xml_xpath_unknown_func_error) or else 
				(a_value = xml_xpath_invalid_operand) or else 
				(a_value = xml_xpath_invalid_type) or else 
				(a_value = xml_xpath_invalid_arity) or else 
				(a_value = xml_xpath_invalid_ctxt_size) or else 
				(a_value = xml_xpath_invalid_ctxt_position) or else 
				(a_value = xml_xpath_memory_error) or else 
				(a_value = xml_xptr_syntax_error) or else 
				(a_value = xml_xptr_resource_error) or else 
				(a_value = xml_xptr_sub_resource_error) or else 
				(a_value = xml_xpath_undef_prefix_error) or else 
				(a_value = xml_xpath_encoding_error) or else 
				(a_value = xml_xpath_invalid_char_error) or else 
				(a_value = xml_tree_invalid_hex) or else 
				(a_value = xml_tree_invalid_dec) or else 
				(a_value = xml_tree_unterminated_entity) or else 
				(a_value = xml_save_not_utf8) or else 
				(a_value = xml_save_char_invalid) or else 
				(a_value = xml_save_no_doctype) or else 
				(a_value = xml_save_unknown_encoding) or else 
				(a_value = xml_regexp_compile_error) or else 
				(a_value = xml_io_unknown) or else 
				(a_value = xml_io_eacces) or else 
				(a_value = xml_io_eagain) or else 
				(a_value = xml_io_ebadf) or else 
				(a_value = xml_io_ebadmsg) or else 
				(a_value = xml_io_ebusy) or else 
				(a_value = xml_io_ecanceled) or else 
				(a_value = xml_io_echild) or else 
				(a_value = xml_io_edeadlk) or else 
				(a_value = xml_io_edom) or else 
				(a_value = xml_io_eexist) or else 
				(a_value = xml_io_efault) or else 
				(a_value = xml_io_efbig) or else 
				(a_value = xml_io_einprogress) or else 
				(a_value = xml_io_eintr) or else 
				(a_value = xml_io_einval) or else 
				(a_value = xml_io_eio) or else 
				(a_value = xml_io_eisdir) or else 
				(a_value = xml_io_emfile) or else 
				(a_value = xml_io_emlink) or else 
				(a_value = xml_io_emsgsize) or else 
				(a_value = xml_io_enametoolong) or else 
				(a_value = xml_io_enfile) or else 
				(a_value = xml_io_enodev) or else 
				(a_value = xml_io_enoent) or else 
				(a_value = xml_io_enoexec) or else 
				(a_value = xml_io_enolck) or else 
				(a_value = xml_io_enomem) or else 
				(a_value = xml_io_enospc) or else 
				(a_value = xml_io_enosys) or else 
				(a_value = xml_io_enotdir) or else 
				(a_value = xml_io_enotempty) or else 
				(a_value = xml_io_enotsup) or else 
				(a_value = xml_io_enotty) or else 
				(a_value = xml_io_enxio) or else 
				(a_value = xml_io_eperm) or else 
				(a_value = xml_io_epipe) or else 
				(a_value = xml_io_erange) or else 
				(a_value = xml_io_erofs) or else 
				(a_value = xml_io_espipe) or else 
				(a_value = xml_io_esrch) or else 
				(a_value = xml_io_etimedout) or else 
				(a_value = xml_io_exdev) or else 
				(a_value = xml_io_network_attempt) or else 
				(a_value = xml_io_encoder) or else 
				(a_value = xml_io_flush) or else 
				(a_value = xml_io_write) or else 
				(a_value = xml_io_no_input) or else 
				(a_value = xml_io_buffer_full) or else 
				(a_value = xml_io_load_error) or else 
				(a_value = xml_io_enotsock) or else 
				(a_value = xml_io_eisconn) or else 
				(a_value = xml_io_econnrefused) or else 
				(a_value = xml_io_enetunreach) or else 
				(a_value = xml_io_eaddrinuse) or else 
				(a_value = xml_io_ealready) or else 
				(a_value = xml_io_eafnosupport) or else 
				(a_value = xml_xinclude_recursion) or else 
				(a_value = xml_xinclude_parse_value) or else 
				(a_value = xml_xinclude_entity_def_mismatch) or else 
				(a_value = xml_xinclude_no_href) or else 
				(a_value = xml_xinclude_no_fallback) or else 
				(a_value = xml_xinclude_href_uri) or else 
				(a_value = xml_xinclude_text_fragment) or else 
				(a_value = xml_xinclude_text_document) or else 
				(a_value = xml_xinclude_invalid_char) or else 
				(a_value = xml_xinclude_build_failed) or else 
				(a_value = xml_xinclude_unknown_encoding) or else 
				(a_value = xml_xinclude_multiple_root) or else 
				(a_value = xml_xinclude_xptr_failed) or else 
				(a_value = xml_xinclude_xptr_result) or else 
				(a_value = xml_xinclude_include_in_include) or else 
				(a_value = xml_xinclude_fallbacks_in_include) or else 
				(a_value = xml_xinclude_fallback_not_in_include) or else 
				(a_value = xml_xinclude_deprecated_ns) or else 
				(a_value = xml_xinclude_fragment_id) or else 
				(a_value = xml_catalog_missing_attr) or else 
				(a_value = xml_catalog_entry_broken) or else 
				(a_value = xml_catalog_prefer_value) or else 
				(a_value = xml_catalog_not_catalog) or else 
				(a_value = xml_catalog_recursion) or else 
				(a_value = xml_schemap_prefix_undefined) or else 
				(a_value = xml_schemap_attrformdefault_value) or else 
				(a_value = xml_schemap_attrgrp_noname_noref) or else 
				(a_value = xml_schemap_attr_noname_noref) or else 
				(a_value = xml_schemap_complextype_noname_noref) or else 
				(a_value = xml_schemap_elemformdefault_value) or else 
				(a_value = xml_schemap_elem_noname_noref) or else 
				(a_value = xml_schemap_extension_no_base) or else 
				(a_value = xml_schemap_facet_no_value) or else 
				(a_value = xml_schemap_failed_build_import) or else 
				(a_value = xml_schemap_group_noname_noref) or else 
				(a_value = xml_schemap_import_namespace_not_uri) or else 
				(a_value = xml_schemap_import_redefine_nsname) or else 
				(a_value = xml_schemap_import_schema_not_uri) or else 
				(a_value = xml_schemap_invalid_boolean) or else 
				(a_value = xml_schemap_invalid_enum) or else 
				(a_value = xml_schemap_invalid_facet) or else 
				(a_value = xml_schemap_invalid_facet_value) or else 
				(a_value = xml_schemap_invalid_maxoccurs) or else 
				(a_value = xml_schemap_invalid_minoccurs) or else 
				(a_value = xml_schemap_invalid_ref_and_subtype) or else 
				(a_value = xml_schemap_invalid_white_space) or else 
				(a_value = xml_schemap_noattr_noref) or else 
				(a_value = xml_schemap_notation_no_name) or else 
				(a_value = xml_schemap_notype_noref) or else 
				(a_value = xml_schemap_ref_and_subtype) or else 
				(a_value = xml_schemap_restriction_noname_noref) or else 
				(a_value = xml_schemap_simpletype_noname) or else 
				(a_value = xml_schemap_type_and_subtype) or else 
				(a_value = xml_schemap_unknown_all_child) or else 
				(a_value = xml_schemap_unknown_anyattribute_child) or else 
				(a_value = xml_schemap_unknown_attr_child) or else 
				(a_value = xml_schemap_unknown_attrgrp_child) or else 
				(a_value = xml_schemap_unknown_attribute_group) or else 
				(a_value = xml_schemap_unknown_base_type) or else 
				(a_value = xml_schemap_unknown_choice_child) or else 
				(a_value = xml_schemap_unknown_complexcontent_child) or else 
				(a_value = xml_schemap_unknown_complextype_child) or else 
				(a_value = xml_schemap_unknown_elem_child) or else 
				(a_value = xml_schemap_unknown_extension_child) or else 
				(a_value = xml_schemap_unknown_facet_child) or else 
				(a_value = xml_schemap_unknown_facet_type) or else 
				(a_value = xml_schemap_unknown_group_child) or else 
				(a_value = xml_schemap_unknown_import_child) or else 
				(a_value = xml_schemap_unknown_list_child) or else 
				(a_value = xml_schemap_unknown_notation_child) or else 
				(a_value = xml_schemap_unknown_processcontent_child) or else 
				(a_value = xml_schemap_unknown_ref) or else 
				(a_value = xml_schemap_unknown_restriction_child) or else 
				(a_value = xml_schemap_unknown_schemas_child) or else 
				(a_value = xml_schemap_unknown_sequence_child) or else 
				(a_value = xml_schemap_unknown_simplecontent_child) or else 
				(a_value = xml_schemap_unknown_simpletype_child) or else 
				(a_value = xml_schemap_unknown_type) or else 
				(a_value = xml_schemap_unknown_union_child) or else 
				(a_value = xml_schemap_elem_default_fixed) or else 
				(a_value = xml_schemap_regexp_invalid) or else 
				(a_value = xml_schemap_failed_load) or else 
				(a_value = xml_schemap_nothing_to_parse) or else 
				(a_value = xml_schemap_noroot) or else 
				(a_value = xml_schemap_redefined_group) or else 
				(a_value = xml_schemap_redefined_type) or else 
				(a_value = xml_schemap_redefined_element) or else 
				(a_value = xml_schemap_redefined_attrgroup) or else 
				(a_value = xml_schemap_redefined_attr) or else 
				(a_value = xml_schemap_redefined_notation) or else 
				(a_value = xml_schemap_failed_parse) or else 
				(a_value = xml_schemap_unknown_prefix) or else 
				(a_value = xml_schemap_def_and_prefix) or else 
				(a_value = xml_schemap_unknown_include_child) or else 
				(a_value = xml_schemap_include_schema_not_uri) or else 
				(a_value = xml_schemap_include_schema_no_uri) or else 
				(a_value = xml_schemap_not_schema) or else 
				(a_value = xml_schemap_unknown_member_type) or else 
				(a_value = xml_schemap_invalid_attr_use) or else 
				(a_value = xml_schemap_recursive) or else 
				(a_value = xml_schemap_supernumerous_list_item_type) or else 
				(a_value = xml_schemap_invalid_attr_combination) or else 
				(a_value = xml_schemap_invalid_attr_inline_combination) or else 
				(a_value = xml_schemap_missing_simpletype_child) or else 
				(a_value = xml_schemap_invalid_attr_name) or else 
				(a_value = xml_schemap_ref_and_content) or else 
				(a_value = xml_schemap_ct_props_correct_1) or else 
				(a_value = xml_schemap_ct_props_correct_2) or else 
				(a_value = xml_schemap_ct_props_correct_3) or else 
				(a_value = xml_schemap_ct_props_correct_4) or else 
				(a_value = xml_schemap_ct_props_correct_5) or else 
				(a_value = xml_schemap_derivation_ok_restriction_1) or else 
				(a_value = xml_schemap_derivation_ok_restriction_2_1_1) or else 
				(a_value = xml_schemap_derivation_ok_restriction_2_1_2) or else 
				(a_value = xml_schemap_derivation_ok_restriction_2_2) or else 
				(a_value = xml_schemap_derivation_ok_restriction_3) or else 
				(a_value = xml_schemap_wildcard_invalid_ns_member) or else 
				(a_value = xml_schemap_intersection_not_expressible) or else 
				(a_value = xml_schemap_union_not_expressible) or else 
				(a_value = xml_schemap_src_import_3_1) or else 
				(a_value = xml_schemap_src_import_3_2) or else 
				(a_value = xml_schemap_derivation_ok_restriction_4_1) or else 
				(a_value = xml_schemap_derivation_ok_restriction_4_2) or else 
				(a_value = xml_schemap_derivation_ok_restriction_4_3) or else 
				(a_value = xml_schemap_cos_ct_extends_1_3) or else 
				(a_value = xml_schemav_noroot) or else 
				(a_value = xml_schemav_undeclaredelem) or else 
				(a_value = xml_schemav_nottoplevel) or else 
				(a_value = xml_schemav_missing) or else 
				(a_value = xml_schemav_wrongelem) or else 
				(a_value = xml_schemav_notype) or else 
				(a_value = xml_schemav_norollback) or else 
				(a_value = xml_schemav_isabstract) or else 
				(a_value = xml_schemav_notempty) or else 
				(a_value = xml_schemav_elemcont) or else 
				(a_value = xml_schemav_havedefault) or else 
				(a_value = xml_schemav_notnillable) or else 
				(a_value = xml_schemav_extracontent) or else 
				(a_value = xml_schemav_invalidattr) or else 
				(a_value = xml_schemav_invalidelem) or else 
				(a_value = xml_schemav_notdeterminist) or else 
				(a_value = xml_schemav_construct) or else 
				(a_value = xml_schemav_internal) or else 
				(a_value = xml_schemav_notsimple) or else 
				(a_value = xml_schemav_attrunknown) or else 
				(a_value = xml_schemav_attrinvalid) or else 
				(a_value = xml_schemav_value) or else 
				(a_value = xml_schemav_facet) or else 
				(a_value = xml_schemav_cvc_datatype_valid_1_2_1) or else 
				(a_value = xml_schemav_cvc_datatype_valid_1_2_2) or else 
				(a_value = xml_schemav_cvc_datatype_valid_1_2_3) or else 
				(a_value = xml_schemav_cvc_type_3_1_1) or else 
				(a_value = xml_schemav_cvc_type_3_1_2) or else 
				(a_value = xml_schemav_cvc_facet_valid) or else 
				(a_value = xml_schemav_cvc_length_valid) or else 
				(a_value = xml_schemav_cvc_minlength_valid) or else 
				(a_value = xml_schemav_cvc_maxlength_valid) or else 
				(a_value = xml_schemav_cvc_mininclusive_valid) or else 
				(a_value = xml_schemav_cvc_maxinclusive_valid) or else 
				(a_value = xml_schemav_cvc_minexclusive_valid) or else 
				(a_value = xml_schemav_cvc_maxexclusive_valid) or else 
				(a_value = xml_schemav_cvc_totaldigits_valid) or else 
				(a_value = xml_schemav_cvc_fractiondigits_valid) or else 
				(a_value = xml_schemav_cvc_pattern_valid) or else 
				(a_value = xml_schemav_cvc_enumeration_valid) or else 
				(a_value = xml_schemav_cvc_complex_type_2_1) or else 
				(a_value = xml_schemav_cvc_complex_type_2_2) or else 
				(a_value = xml_schemav_cvc_complex_type_2_3) or else 
				(a_value = xml_schemav_cvc_complex_type_2_4) or else 
				(a_value = xml_schemav_cvc_elt_1) or else 
				(a_value = xml_schemav_cvc_elt_2) or else 
				(a_value = xml_schemav_cvc_elt_3_1) or else 
				(a_value = xml_schemav_cvc_elt_3_2_1) or else 
				(a_value = xml_schemav_cvc_elt_3_2_2) or else 
				(a_value = xml_schemav_cvc_elt_4_1) or else 
				(a_value = xml_schemav_cvc_elt_4_2) or else 
				(a_value = xml_schemav_cvc_elt_4_3) or else 
				(a_value = xml_schemav_cvc_elt_5_1_1) or else 
				(a_value = xml_schemav_cvc_elt_5_1_2) or else 
				(a_value = xml_schemav_cvc_elt_5_2_1) or else 
				(a_value = xml_schemav_cvc_elt_5_2_2_1) or else 
				(a_value = xml_schemav_cvc_elt_5_2_2_2_1) or else 
				(a_value = xml_schemav_cvc_elt_5_2_2_2_2) or else 
				(a_value = xml_schemav_cvc_elt_6) or else 
				(a_value = xml_schemav_cvc_elt_7) or else 
				(a_value = xml_schemav_cvc_attribute_1) or else 
				(a_value = xml_schemav_cvc_attribute_2) or else 
				(a_value = xml_schemav_cvc_attribute_3) or else 
				(a_value = xml_schemav_cvc_attribute_4) or else 
				(a_value = xml_schemav_cvc_complex_type_3_1) or else 
				(a_value = xml_schemav_cvc_complex_type_3_2_1) or else 
				(a_value = xml_schemav_cvc_complex_type_3_2_2) or else 
				(a_value = xml_schemav_cvc_complex_type_4) or else 
				(a_value = xml_schemav_cvc_complex_type_5_1) or else 
				(a_value = xml_schemav_cvc_complex_type_5_2) or else 
				(a_value = xml_schemav_element_content) or else 
				(a_value = xml_schemav_document_element_missing) or else 
				(a_value = xml_schemav_cvc_complex_type_1) or else 
				(a_value = xml_schemav_cvc_au) or else 
				(a_value = xml_schemav_cvc_type_1) or else 
				(a_value = xml_schemav_cvc_type_2) or else 
				(a_value = xml_schemav_cvc_idc) or else 
				(a_value = xml_schemav_cvc_wildcard) or else 
				(a_value = xml_schemav_misc) or else 
				(a_value = xml_xptr_unknown_scheme) or else 
				(a_value = xml_xptr_childseq_start) or else 
				(a_value = xml_xptr_eval_failed) or else 
				(a_value = xml_xptr_extra_objects) or else 
				(a_value = xml_c14n_create_ctxt) or else 
				(a_value = xml_c14n_requires_utf8) or else 
				(a_value = xml_c14n_create_stack) or else 
				(a_value = xml_c14n_invalid_node) or else 
				(a_value = xml_c14n_unknow_node) or else 
				(a_value = xml_c14n_relative_namespace) or else 
				(a_value = xml_ftp_pasv_answer) or else 
				(a_value = xml_ftp_epsv_answer) or else 
				(a_value = xml_ftp_accnt) or else 
				(a_value = xml_ftp_url_syntax) or else 
				(a_value = xml_http_url_syntax) or else 
				(a_value = xml_http_use_ip) or else 
				(a_value = xml_http_unknown_host) or else 
				(a_value = xml_schemap_src_simple_type_1) or else 
				(a_value = xml_schemap_src_simple_type_2) or else 
				(a_value = xml_schemap_src_simple_type_3) or else 
				(a_value = xml_schemap_src_simple_type_4) or else 
				(a_value = xml_schemap_src_resolve) or else 
				(a_value = xml_schemap_src_restriction_base_or_simpletype) or else 
				(a_value = xml_schemap_src_list_itemtype_or_simpletype) or else 
				(a_value = xml_schemap_src_union_membertypes_or_simpletypes) or else 
				(a_value = xml_schemap_st_props_correct_1) or else 
				(a_value = xml_schemap_st_props_correct_2) or else 
				(a_value = xml_schemap_st_props_correct_3) or else 
				(a_value = xml_schemap_cos_st_restricts_1_1) or else 
				(a_value = xml_schemap_cos_st_restricts_1_2) or else 
				(a_value = xml_schemap_cos_st_restricts_1_3_1) or else 
				(a_value = xml_schemap_cos_st_restricts_1_3_2) or else 
				(a_value = xml_schemap_cos_st_restricts_2_1) or else 
				(a_value = xml_schemap_cos_st_restricts_2_3_1_1) or else 
				(a_value = xml_schemap_cos_st_restricts_2_3_1_2) or else 
				(a_value = xml_schemap_cos_st_restricts_2_3_2_1) or else 
				(a_value = xml_schemap_cos_st_restricts_2_3_2_2) or else 
				(a_value = xml_schemap_cos_st_restricts_2_3_2_3) or else 
				(a_value = xml_schemap_cos_st_restricts_2_3_2_4) or else 
				(a_value = xml_schemap_cos_st_restricts_2_3_2_5) or else 
				(a_value = xml_schemap_cos_st_restricts_3_1) or else 
				(a_value = xml_schemap_cos_st_restricts_3_3_1) or else 
				(a_value = xml_schemap_cos_st_restricts_3_3_1_2) or else 
				(a_value = xml_schemap_cos_st_restricts_3_3_2_2) or else 
				(a_value = xml_schemap_cos_st_restricts_3_3_2_1) or else 
				(a_value = xml_schemap_cos_st_restricts_3_3_2_3) or else 
				(a_value = xml_schemap_cos_st_restricts_3_3_2_4) or else 
				(a_value = xml_schemap_cos_st_restricts_3_3_2_5) or else 
				(a_value = xml_schemap_cos_st_derived_ok_2_1) or else 
				(a_value = xml_schemap_cos_st_derived_ok_2_2) or else 
				(a_value = xml_schemap_s4s_elem_not_allowed) or else 
				(a_value = xml_schemap_s4s_elem_missing) or else 
				(a_value = xml_schemap_s4s_attr_not_allowed) or else 
				(a_value = xml_schemap_s4s_attr_missing) or else 
				(a_value = xml_schemap_s4s_attr_invalid_value) or else 
				(a_value = xml_schemap_src_element_1) or else 
				(a_value = xml_schemap_src_element_2_1) or else 
				(a_value = xml_schemap_src_element_2_2) or else 
				(a_value = xml_schemap_src_element_3) or else 
				(a_value = xml_schemap_p_props_correct_1) or else 
				(a_value = xml_schemap_p_props_correct_2_1) or else 
				(a_value = xml_schemap_p_props_correct_2_2) or else 
				(a_value = xml_schemap_e_props_correct_2) or else 
				(a_value = xml_schemap_e_props_correct_3) or else 
				(a_value = xml_schemap_e_props_correct_4) or else 
				(a_value = xml_schemap_e_props_correct_5) or else 
				(a_value = xml_schemap_e_props_correct_6) or else 
				(a_value = xml_schemap_src_include) or else 
				(a_value = xml_schemap_src_attribute_1) or else 
				(a_value = xml_schemap_src_attribute_2) or else 
				(a_value = xml_schemap_src_attribute_3_1) or else 
				(a_value = xml_schemap_src_attribute_3_2) or else 
				(a_value = xml_schemap_src_attribute_4) or else 
				(a_value = xml_schemap_no_xmlns) or else 
				(a_value = xml_schemap_no_xsi) or else 
				(a_value = xml_schemap_cos_valid_default_1) or else 
				(a_value = xml_schemap_cos_valid_default_2_1) or else 
				(a_value = xml_schemap_cos_valid_default_2_2_1) or else 
				(a_value = xml_schemap_cos_valid_default_2_2_2) or else 
				(a_value = xml_schemap_cvc_simple_type) or else 
				(a_value = xml_schemap_cos_ct_extends_1_1) or else 
				(a_value = xml_schemap_src_import_1_1) or else 
				(a_value = xml_schemap_src_import_1_2) or else 
				(a_value = xml_schemap_src_import_2) or else 
				(a_value = xml_schemap_src_import_2_1) or else 
				(a_value = xml_schemap_src_import_2_2) or else 
				(a_value = xml_schemap_internal) or else 
				(a_value = xml_schemap_not_deterministic) or else 
				(a_value = xml_schemap_src_attribute_group_1) or else 
				(a_value = xml_schemap_src_attribute_group_2) or else 
				(a_value = xml_schemap_src_attribute_group_3) or else 
				(a_value = xml_schemap_mg_props_correct_1) or else 
				(a_value = xml_schemap_mg_props_correct_2) or else 
				(a_value = xml_schemap_src_ct_1) or else 
				(a_value = xml_schemap_derivation_ok_restriction_2_1_3) or else 
				(a_value = xml_schemap_au_props_correct_2) or else 
				(a_value = xml_schemap_a_props_correct_2) or else 
				(a_value = xml_schemap_c_props_correct) or else 
				(a_value = xml_schemap_src_redefine) or else 
				(a_value = xml_schemap_src_import) or else 
				(a_value = xml_schemap_warn_skip_schema) or else 
				(a_value = xml_schemap_warn_unlocated_schema) or else 
				(a_value = xml_schemap_warn_attr_redecl_proh) or else 
				(a_value = xml_schemap_warn_attr_pointless_proh) or else 
				(a_value = xml_schemap_ag_props_correct) or else 
				(a_value = xml_schemap_cos_ct_extends_1_2) or else 
				(a_value = xml_schemap_au_props_correct) or else 
				(a_value = xml_schemap_a_props_correct_3) or else 
				(a_value = xml_schemap_cos_all_limited) or else 
				(a_value = xml_module_open) or else 
				(a_value = xml_module_close) or else 
				(a_value = xml_check_found_element) or else 
				(a_value = xml_check_found_attribute) or else 
				(a_value = xml_check_found_text) or else 
				(a_value = xml_check_found_cdata) or else 
				(a_value = xml_check_found_entityref) or else 
				(a_value = xml_check_found_entity) or else 
				(a_value = xml_check_found_pi) or else 
				(a_value = xml_check_found_comment) or else 
				(a_value = xml_check_found_doctype) or else 
				(a_value = xml_check_found_fragment) or else 
				(a_value = xml_check_found_notation) or else 
				(a_value = xml_check_unknown_node) or else 
				(a_value = xml_check_entity_type) or else 
				(a_value = xml_check_no_parent) or else 
				(a_value = xml_check_no_doc) or else 
				(a_value = xml_check_no_name) or else 
				(a_value = xml_check_no_elem) or else 
				(a_value = xml_check_wrong_doc) or else 
				(a_value = xml_check_no_prev) or else 
				(a_value = xml_check_wrong_prev) or else 
				(a_value = xml_check_no_next) or else 
				(a_value = xml_check_wrong_next) or else 
				(a_value = xml_check_not_dtd) or else 
				(a_value = xml_check_not_attr) or else 
				(a_value = xml_check_not_attr_decl) or else 
				(a_value = xml_check_not_elem_decl) or else 
				(a_value = xml_check_not_entity_decl) or else 
				(a_value = xml_check_not_ns_decl) or else 
				(a_value = xml_check_no_href) or else 
				(a_value = xml_check_wrong_parent) or else 
				(a_value = xml_check_ns_scope) or else 
				(a_value = xml_check_ns_ancestor) or else 
				(a_value = xml_check_not_utf8) or else 
				(a_value = xml_check_no_dict) or else 
				(a_value = xml_check_not_ncname) or else 
				(a_value = xml_check_outside_dict) or else 
				(a_value = xml_check_wrong_name) or else 
				(a_value = xml_check_name_not_null) or else 
				(a_value = xml_i18n_no_name) or else 
				(a_value = xml_i18n_no_handler) or else 
				(a_value = xml_i18n_excess_handler) or else 
				(a_value = xml_i18n_conv_failed) or else 
				(a_value = xml_i18n_no_output))
		end


feature {ANY} -- Setters
	default_create, set_err_ok
		do
			value := xml_err_ok
		end

	set_err_internal_error
		do
			value := xml_err_internal_error
		end

	set_err_no_memory
		do
			value := xml_err_no_memory
		end

	set_err_document_start
		do
			value := xml_err_document_start
		end

	set_err_document_empty
		do
			value := xml_err_document_empty
		end

	set_err_document_end
		do
			value := xml_err_document_end
		end

	set_err_invalid_hex_charref
		do
			value := xml_err_invalid_hex_charref
		end

	set_err_invalid_dec_charref
		do
			value := xml_err_invalid_dec_charref
		end

	set_err_invalid_charref
		do
			value := xml_err_invalid_charref
		end

	set_err_invalid_char
		do
			value := xml_err_invalid_char
		end

	set_err_charref_at_eof
		do
			value := xml_err_charref_at_eof
		end

	set_err_charref_in_prolog
		do
			value := xml_err_charref_in_prolog
		end

	set_err_charref_in_epilog
		do
			value := xml_err_charref_in_epilog
		end

	set_err_charref_in_dtd
		do
			value := xml_err_charref_in_dtd
		end

	set_err_entityref_at_eof
		do
			value := xml_err_entityref_at_eof
		end

	set_err_entityref_in_prolog
		do
			value := xml_err_entityref_in_prolog
		end

	set_err_entityref_in_epilog
		do
			value := xml_err_entityref_in_epilog
		end

	set_err_entityref_in_dtd
		do
			value := xml_err_entityref_in_dtd
		end

	set_err_peref_at_eof
		do
			value := xml_err_peref_at_eof
		end

	set_err_peref_in_prolog
		do
			value := xml_err_peref_in_prolog
		end

	set_err_peref_in_epilog
		do
			value := xml_err_peref_in_epilog
		end

	set_err_peref_in_int_subset
		do
			value := xml_err_peref_in_int_subset
		end

	set_err_entityref_no_name
		do
			value := xml_err_entityref_no_name
		end

	set_err_entityref_semicol_missing
		do
			value := xml_err_entityref_semicol_missing
		end

	set_err_peref_no_name
		do
			value := xml_err_peref_no_name
		end

	set_err_peref_semicol_missing
		do
			value := xml_err_peref_semicol_missing
		end

	set_err_undeclared_entity
		do
			value := xml_err_undeclared_entity
		end

	set_war_undeclared_entity
		do
			value := xml_war_undeclared_entity
		end

	set_err_unparsed_entity
		do
			value := xml_err_unparsed_entity
		end

	set_err_entity_is_external
		do
			value := xml_err_entity_is_external
		end

	set_err_entity_is_parameter
		do
			value := xml_err_entity_is_parameter
		end

	set_err_unknown_encoding
		do
			value := xml_err_unknown_encoding
		end

	set_err_unsupported_encoding
		do
			value := xml_err_unsupported_encoding
		end

	set_err_string_not_started
		do
			value := xml_err_string_not_started
		end

	set_err_string_not_closed
		do
			value := xml_err_string_not_closed
		end

	set_err_ns_decl_error
		do
			value := xml_err_ns_decl_error
		end

	set_err_entity_not_started
		do
			value := xml_err_entity_not_started
		end

	set_err_entity_not_finished
		do
			value := xml_err_entity_not_finished
		end

	set_err_lt_in_attribute
		do
			value := xml_err_lt_in_attribute
		end

	set_err_attribute_not_started
		do
			value := xml_err_attribute_not_started
		end

	set_err_attribute_not_finished
		do
			value := xml_err_attribute_not_finished
		end

	set_err_attribute_without_value
		do
			value := xml_err_attribute_without_value
		end

	set_err_attribute_redefined
		do
			value := xml_err_attribute_redefined
		end

	set_err_literal_not_started
		do
			value := xml_err_literal_not_started
		end

	set_err_literal_not_finished
		do
			value := xml_err_literal_not_finished
		end

	set_err_comment_not_finished
		do
			value := xml_err_comment_not_finished
		end

	set_err_pi_not_started
		do
			value := xml_err_pi_not_started
		end

	set_err_pi_not_finished
		do
			value := xml_err_pi_not_finished
		end

	set_err_notation_not_started
		do
			value := xml_err_notation_not_started
		end

	set_err_notation_not_finished
		do
			value := xml_err_notation_not_finished
		end

	set_err_attlist_not_started
		do
			value := xml_err_attlist_not_started
		end

	set_err_attlist_not_finished
		do
			value := xml_err_attlist_not_finished
		end

	set_err_mixed_not_started
		do
			value := xml_err_mixed_not_started
		end

	set_err_mixed_not_finished
		do
			value := xml_err_mixed_not_finished
		end

	set_err_elemcontent_not_started
		do
			value := xml_err_elemcontent_not_started
		end

	set_err_elemcontent_not_finished
		do
			value := xml_err_elemcontent_not_finished
		end

	set_err_xmldecl_not_started
		do
			value := xml_err_xmldecl_not_started
		end

	set_err_xmldecl_not_finished
		do
			value := xml_err_xmldecl_not_finished
		end

	set_err_condsec_not_started
		do
			value := xml_err_condsec_not_started
		end

	set_err_condsec_not_finished
		do
			value := xml_err_condsec_not_finished
		end

	set_err_ext_subset_not_finished
		do
			value := xml_err_ext_subset_not_finished
		end

	set_err_doctype_not_finished
		do
			value := xml_err_doctype_not_finished
		end

	set_err_misplaced_cdata_end
		do
			value := xml_err_misplaced_cdata_end
		end

	set_err_cdata_not_finished
		do
			value := xml_err_cdata_not_finished
		end

	set_err_reserved_xml_name
		do
			value := xml_err_reserved_xml_name
		end

	set_err_space_required
		do
			value := xml_err_space_required
		end

	set_err_separator_required
		do
			value := xml_err_separator_required
		end

	set_err_nmtoken_required
		do
			value := xml_err_nmtoken_required
		end

	set_err_name_required
		do
			value := xml_err_name_required
		end

	set_err_pcdata_required
		do
			value := xml_err_pcdata_required
		end

	set_err_uri_required
		do
			value := xml_err_uri_required
		end

	set_err_pubid_required
		do
			value := xml_err_pubid_required
		end

	set_err_lt_required
		do
			value := xml_err_lt_required
		end

	set_err_gt_required
		do
			value := xml_err_gt_required
		end

	set_err_ltslash_required
		do
			value := xml_err_ltslash_required
		end

	set_err_equal_required
		do
			value := xml_err_equal_required
		end

	set_err_tag_name_mismatch
		do
			value := xml_err_tag_name_mismatch
		end

	set_err_tag_not_finished
		do
			value := xml_err_tag_not_finished
		end

	set_err_standalone_value
		do
			value := xml_err_standalone_value
		end

	set_err_encoding_name
		do
			value := xml_err_encoding_name
		end

	set_err_hyphen_in_comment
		do
			value := xml_err_hyphen_in_comment
		end

	set_err_invalid_encoding
		do
			value := xml_err_invalid_encoding
		end

	set_err_ext_entity_standalone
		do
			value := xml_err_ext_entity_standalone
		end

	set_err_condsec_invalid
		do
			value := xml_err_condsec_invalid
		end

	set_err_value_required
		do
			value := xml_err_value_required
		end

	set_err_not_well_balanced
		do
			value := xml_err_not_well_balanced
		end

	set_err_extra_content
		do
			value := xml_err_extra_content
		end

	set_err_entity_char_error
		do
			value := xml_err_entity_char_error
		end

	set_err_entity_pe_internal
		do
			value := xml_err_entity_pe_internal
		end

	set_err_entity_loop
		do
			value := xml_err_entity_loop
		end

	set_err_entity_boundary
		do
			value := xml_err_entity_boundary
		end

	set_err_invalid_uri
		do
			value := xml_err_invalid_uri
		end

	set_err_uri_fragment
		do
			value := xml_err_uri_fragment
		end

	set_war_catalog_pi
		do
			value := xml_war_catalog_pi
		end

	set_err_no_dtd
		do
			value := xml_err_no_dtd
		end

	set_err_condsec_invalid_keyword
		do
			value := xml_err_condsec_invalid_keyword
		end

	set_err_version_missing
		do
			value := xml_err_version_missing
		end

	set_war_unknown_version
		do
			value := xml_war_unknown_version
		end

	set_war_lang_value
		do
			value := xml_war_lang_value
		end

	set_war_ns_uri
		do
			value := xml_war_ns_uri
		end

	set_war_ns_uri_relative
		do
			value := xml_war_ns_uri_relative
		end

	set_err_missing_encoding
		do
			value := xml_err_missing_encoding
		end

	set_war_space_value
		do
			value := xml_war_space_value
		end

	set_err_not_standalone
		do
			value := xml_err_not_standalone
		end

	set_err_entity_processing
		do
			value := xml_err_entity_processing
		end

	set_err_notation_processing
		do
			value := xml_err_notation_processing
		end

	set_war_ns_column
		do
			value := xml_war_ns_column
		end

	set_war_entity_redefined
		do
			value := xml_war_entity_redefined
		end

	set_ns_err_xml_namespace
		do
			value := xml_ns_err_xml_namespace
		end

	set_ns_err_undefined_namespace
		do
			value := xml_ns_err_undefined_namespace
		end

	set_ns_err_qname
		do
			value := xml_ns_err_qname
		end

	set_ns_err_attribute_redefined
		do
			value := xml_ns_err_attribute_redefined
		end

	set_ns_err_empty
		do
			value := xml_ns_err_empty
		end

	set_dtd_attribute_default
		do
			value := xml_dtd_attribute_default
		end

	set_dtd_attribute_redefined
		do
			value := xml_dtd_attribute_redefined
		end

	set_dtd_attribute_value
		do
			value := xml_dtd_attribute_value
		end

	set_dtd_content_error
		do
			value := xml_dtd_content_error
		end

	set_dtd_content_model
		do
			value := xml_dtd_content_model
		end

	set_dtd_content_not_determinist
		do
			value := xml_dtd_content_not_determinist
		end

	set_dtd_different_prefix
		do
			value := xml_dtd_different_prefix
		end

	set_dtd_elem_default_namespace
		do
			value := xml_dtd_elem_default_namespace
		end

	set_dtd_elem_namespace
		do
			value := xml_dtd_elem_namespace
		end

	set_dtd_elem_redefined
		do
			value := xml_dtd_elem_redefined
		end

	set_dtd_empty_notation
		do
			value := xml_dtd_empty_notation
		end

	set_dtd_entity_type
		do
			value := xml_dtd_entity_type
		end

	set_dtd_id_fixed
		do
			value := xml_dtd_id_fixed
		end

	set_dtd_id_redefined
		do
			value := xml_dtd_id_redefined
		end

	set_dtd_id_subset
		do
			value := xml_dtd_id_subset
		end

	set_dtd_invalid_child
		do
			value := xml_dtd_invalid_child
		end

	set_dtd_invalid_default
		do
			value := xml_dtd_invalid_default
		end

	set_dtd_load_error
		do
			value := xml_dtd_load_error
		end

	set_dtd_missing_attribute
		do
			value := xml_dtd_missing_attribute
		end

	set_dtd_mixed_corrupt
		do
			value := xml_dtd_mixed_corrupt
		end

	set_dtd_multiple_id
		do
			value := xml_dtd_multiple_id
		end

	set_dtd_no_doc
		do
			value := xml_dtd_no_doc
		end

	set_dtd_no_dtd
		do
			value := xml_dtd_no_dtd
		end

	set_dtd_no_elem_name
		do
			value := xml_dtd_no_elem_name
		end

	set_dtd_no_prefix
		do
			value := xml_dtd_no_prefix
		end

	set_dtd_no_root
		do
			value := xml_dtd_no_root
		end

	set_dtd_notation_redefined
		do
			value := xml_dtd_notation_redefined
		end

	set_dtd_notation_value
		do
			value := xml_dtd_notation_value
		end

	set_dtd_not_empty
		do
			value := xml_dtd_not_empty
		end

	set_dtd_not_pcdata
		do
			value := xml_dtd_not_pcdata
		end

	set_dtd_not_standalone
		do
			value := xml_dtd_not_standalone
		end

	set_dtd_root_name
		do
			value := xml_dtd_root_name
		end

	set_dtd_standalone_white_space
		do
			value := xml_dtd_standalone_white_space
		end

	set_dtd_unknown_attribute
		do
			value := xml_dtd_unknown_attribute
		end

	set_dtd_unknown_elem
		do
			value := xml_dtd_unknown_elem
		end

	set_dtd_unknown_entity
		do
			value := xml_dtd_unknown_entity
		end

	set_dtd_unknown_id
		do
			value := xml_dtd_unknown_id
		end

	set_dtd_unknown_notation
		do
			value := xml_dtd_unknown_notation
		end

	set_dtd_standalone_defaulted
		do
			value := xml_dtd_standalone_defaulted
		end

	set_dtd_xmlid_value
		do
			value := xml_dtd_xmlid_value
		end

	set_dtd_xmlid_type
		do
			value := xml_dtd_xmlid_type
		end

	set_html_strucure_error
		do
			value := xml_html_strucure_error
		end

	set_html_unknown_tag
		do
			value := xml_html_unknown_tag
		end

	set_rngp_anyname_attr_ancestor
		do
			value := xml_rngp_anyname_attr_ancestor
		end

	set_rngp_attr_conflict
		do
			value := xml_rngp_attr_conflict
		end

	set_rngp_attribute_children
		do
			value := xml_rngp_attribute_children
		end

	set_rngp_attribute_content
		do
			value := xml_rngp_attribute_content
		end

	set_rngp_attribute_empty
		do
			value := xml_rngp_attribute_empty
		end

	set_rngp_attribute_noop
		do
			value := xml_rngp_attribute_noop
		end

	set_rngp_choice_content
		do
			value := xml_rngp_choice_content
		end

	set_rngp_choice_empty
		do
			value := xml_rngp_choice_empty
		end

	set_rngp_create_failure
		do
			value := xml_rngp_create_failure
		end

	set_rngp_data_content
		do
			value := xml_rngp_data_content
		end

	set_rngp_def_choice_and_interleave
		do
			value := xml_rngp_def_choice_and_interleave
		end

	set_rngp_define_create_failed
		do
			value := xml_rngp_define_create_failed
		end

	set_rngp_define_empty
		do
			value := xml_rngp_define_empty
		end

	set_rngp_define_missing
		do
			value := xml_rngp_define_missing
		end

	set_rngp_define_name_missing
		do
			value := xml_rngp_define_name_missing
		end

	set_rngp_elem_content_empty
		do
			value := xml_rngp_elem_content_empty
		end

	set_rngp_elem_content_error
		do
			value := xml_rngp_elem_content_error
		end

	set_rngp_element_empty
		do
			value := xml_rngp_element_empty
		end

	set_rngp_element_content
		do
			value := xml_rngp_element_content
		end

	set_rngp_element_name
		do
			value := xml_rngp_element_name
		end

	set_rngp_element_no_content
		do
			value := xml_rngp_element_no_content
		end

	set_rngp_elem_text_conflict
		do
			value := xml_rngp_elem_text_conflict
		end

	set_rngp_empty
		do
			value := xml_rngp_empty
		end

	set_rngp_empty_construct
		do
			value := xml_rngp_empty_construct
		end

	set_rngp_empty_content
		do
			value := xml_rngp_empty_content
		end

	set_rngp_empty_not_empty
		do
			value := xml_rngp_empty_not_empty
		end

	set_rngp_error_type_lib
		do
			value := xml_rngp_error_type_lib
		end

	set_rngp_except_empty
		do
			value := xml_rngp_except_empty
		end

	set_rngp_except_missing
		do
			value := xml_rngp_except_missing
		end

	set_rngp_except_multiple
		do
			value := xml_rngp_except_multiple
		end

	set_rngp_except_no_content
		do
			value := xml_rngp_except_no_content
		end

	set_rngp_externalref_emtpy
		do
			value := xml_rngp_externalref_emtpy
		end

	set_rngp_external_ref_failure
		do
			value := xml_rngp_external_ref_failure
		end

	set_rngp_externalref_recurse
		do
			value := xml_rngp_externalref_recurse
		end

	set_rngp_forbidden_attribute
		do
			value := xml_rngp_forbidden_attribute
		end

	set_rngp_foreign_element
		do
			value := xml_rngp_foreign_element
		end

	set_rngp_grammar_content
		do
			value := xml_rngp_grammar_content
		end

	set_rngp_grammar_empty
		do
			value := xml_rngp_grammar_empty
		end

	set_rngp_grammar_missing
		do
			value := xml_rngp_grammar_missing
		end

	set_rngp_grammar_no_start
		do
			value := xml_rngp_grammar_no_start
		end

	set_rngp_group_attr_conflict
		do
			value := xml_rngp_group_attr_conflict
		end

	set_rngp_href_error
		do
			value := xml_rngp_href_error
		end

	set_rngp_include_empty
		do
			value := xml_rngp_include_empty
		end

	set_rngp_include_failure
		do
			value := xml_rngp_include_failure
		end

	set_rngp_include_recurse
		do
			value := xml_rngp_include_recurse
		end

	set_rngp_interleave_add
		do
			value := xml_rngp_interleave_add
		end

	set_rngp_interleave_create_failed
		do
			value := xml_rngp_interleave_create_failed
		end

	set_rngp_interleave_empty
		do
			value := xml_rngp_interleave_empty
		end

	set_rngp_interleave_no_content
		do
			value := xml_rngp_interleave_no_content
		end

	set_rngp_invalid_define_name
		do
			value := xml_rngp_invalid_define_name
		end

	set_rngp_invalid_uri
		do
			value := xml_rngp_invalid_uri
		end

	set_rngp_invalid_value
		do
			value := xml_rngp_invalid_value
		end

	set_rngp_missing_href
		do
			value := xml_rngp_missing_href
		end

	set_rngp_name_missing
		do
			value := xml_rngp_name_missing
		end

	set_rngp_need_combine
		do
			value := xml_rngp_need_combine
		end

	set_rngp_notallowed_not_empty
		do
			value := xml_rngp_notallowed_not_empty
		end

	set_rngp_nsname_attr_ancestor
		do
			value := xml_rngp_nsname_attr_ancestor
		end

	set_rngp_nsname_no_ns
		do
			value := xml_rngp_nsname_no_ns
		end

	set_rngp_param_forbidden
		do
			value := xml_rngp_param_forbidden
		end

	set_rngp_param_name_missing
		do
			value := xml_rngp_param_name_missing
		end

	set_rngp_parentref_create_failed
		do
			value := xml_rngp_parentref_create_failed
		end

	set_rngp_parentref_name_invalid
		do
			value := xml_rngp_parentref_name_invalid
		end

	set_rngp_parentref_no_name
		do
			value := xml_rngp_parentref_no_name
		end

	set_rngp_parentref_no_parent
		do
			value := xml_rngp_parentref_no_parent
		end

	set_rngp_parentref_not_empty
		do
			value := xml_rngp_parentref_not_empty
		end

	set_rngp_parse_error
		do
			value := xml_rngp_parse_error
		end

	set_rngp_pat_anyname_except_anyname
		do
			value := xml_rngp_pat_anyname_except_anyname
		end

	set_rngp_pat_attr_attr
		do
			value := xml_rngp_pat_attr_attr
		end

	set_rngp_pat_attr_elem
		do
			value := xml_rngp_pat_attr_elem
		end

	set_rngp_pat_data_except_attr
		do
			value := xml_rngp_pat_data_except_attr
		end

	set_rngp_pat_data_except_elem
		do
			value := xml_rngp_pat_data_except_elem
		end

	set_rngp_pat_data_except_empty
		do
			value := xml_rngp_pat_data_except_empty
		end

	set_rngp_pat_data_except_group
		do
			value := xml_rngp_pat_data_except_group
		end

	set_rngp_pat_data_except_interleave
		do
			value := xml_rngp_pat_data_except_interleave
		end

	set_rngp_pat_data_except_list
		do
			value := xml_rngp_pat_data_except_list
		end

	set_rngp_pat_data_except_onemore
		do
			value := xml_rngp_pat_data_except_onemore
		end

	set_rngp_pat_data_except_ref
		do
			value := xml_rngp_pat_data_except_ref
		end

	set_rngp_pat_data_except_text
		do
			value := xml_rngp_pat_data_except_text
		end

	set_rngp_pat_list_attr
		do
			value := xml_rngp_pat_list_attr
		end

	set_rngp_pat_list_elem
		do
			value := xml_rngp_pat_list_elem
		end

	set_rngp_pat_list_interleave
		do
			value := xml_rngp_pat_list_interleave
		end

	set_rngp_pat_list_list
		do
			value := xml_rngp_pat_list_list
		end

	set_rngp_pat_list_ref
		do
			value := xml_rngp_pat_list_ref
		end

	set_rngp_pat_list_text
		do
			value := xml_rngp_pat_list_text
		end

	set_rngp_pat_nsname_except_anyname
		do
			value := xml_rngp_pat_nsname_except_anyname
		end

	set_rngp_pat_nsname_except_nsname
		do
			value := xml_rngp_pat_nsname_except_nsname
		end

	set_rngp_pat_onemore_group_attr
		do
			value := xml_rngp_pat_onemore_group_attr
		end

	set_rngp_pat_onemore_interleave_attr
		do
			value := xml_rngp_pat_onemore_interleave_attr
		end

	set_rngp_pat_start_attr
		do
			value := xml_rngp_pat_start_attr
		end

	set_rngp_pat_start_data
		do
			value := xml_rngp_pat_start_data
		end

	set_rngp_pat_start_empty
		do
			value := xml_rngp_pat_start_empty
		end

	set_rngp_pat_start_group
		do
			value := xml_rngp_pat_start_group
		end

	set_rngp_pat_start_interleave
		do
			value := xml_rngp_pat_start_interleave
		end

	set_rngp_pat_start_list
		do
			value := xml_rngp_pat_start_list
		end

	set_rngp_pat_start_onemore
		do
			value := xml_rngp_pat_start_onemore
		end

	set_rngp_pat_start_text
		do
			value := xml_rngp_pat_start_text
		end

	set_rngp_pat_start_value
		do
			value := xml_rngp_pat_start_value
		end

	set_rngp_prefix_undefined
		do
			value := xml_rngp_prefix_undefined
		end

	set_rngp_ref_create_failed
		do
			value := xml_rngp_ref_create_failed
		end

	set_rngp_ref_cycle
		do
			value := xml_rngp_ref_cycle
		end

	set_rngp_ref_name_invalid
		do
			value := xml_rngp_ref_name_invalid
		end

	set_rngp_ref_no_def
		do
			value := xml_rngp_ref_no_def
		end

	set_rngp_ref_no_name
		do
			value := xml_rngp_ref_no_name
		end

	set_rngp_ref_not_empty
		do
			value := xml_rngp_ref_not_empty
		end

	set_rngp_start_choice_and_interleave
		do
			value := xml_rngp_start_choice_and_interleave
		end

	set_rngp_start_content
		do
			value := xml_rngp_start_content
		end

	set_rngp_start_empty
		do
			value := xml_rngp_start_empty
		end

	set_rngp_start_missing
		do
			value := xml_rngp_start_missing
		end

	set_rngp_text_expected
		do
			value := xml_rngp_text_expected
		end

	set_rngp_text_has_child
		do
			value := xml_rngp_text_has_child
		end

	set_rngp_type_missing
		do
			value := xml_rngp_type_missing
		end

	set_rngp_type_not_found
		do
			value := xml_rngp_type_not_found
		end

	set_rngp_type_value
		do
			value := xml_rngp_type_value
		end

	set_rngp_unknown_attribute
		do
			value := xml_rngp_unknown_attribute
		end

	set_rngp_unknown_combine
		do
			value := xml_rngp_unknown_combine
		end

	set_rngp_unknown_construct
		do
			value := xml_rngp_unknown_construct
		end

	set_rngp_unknown_type_lib
		do
			value := xml_rngp_unknown_type_lib
		end

	set_rngp_uri_fragment
		do
			value := xml_rngp_uri_fragment
		end

	set_rngp_uri_not_absolute
		do
			value := xml_rngp_uri_not_absolute
		end

	set_rngp_value_empty
		do
			value := xml_rngp_value_empty
		end

	set_rngp_value_no_content
		do
			value := xml_rngp_value_no_content
		end

	set_rngp_xmlns_name
		do
			value := xml_rngp_xmlns_name
		end

	set_rngp_xml_ns
		do
			value := xml_rngp_xml_ns
		end

	set_xpath_expression_ok
		do
			value := xml_xpath_expression_ok
		end

	set_xpath_number_error
		do
			value := xml_xpath_number_error
		end

	set_xpath_unfinished_literal_error
		do
			value := xml_xpath_unfinished_literal_error
		end

	set_xpath_start_literal_error
		do
			value := xml_xpath_start_literal_error
		end

	set_xpath_variable_ref_error
		do
			value := xml_xpath_variable_ref_error
		end

	set_xpath_undef_variable_error
		do
			value := xml_xpath_undef_variable_error
		end

	set_xpath_invalid_predicate_error
		do
			value := xml_xpath_invalid_predicate_error
		end

	set_xpath_expr_error
		do
			value := xml_xpath_expr_error
		end

	set_xpath_unclosed_error
		do
			value := xml_xpath_unclosed_error
		end

	set_xpath_unknown_func_error
		do
			value := xml_xpath_unknown_func_error
		end

	set_xpath_invalid_operand
		do
			value := xml_xpath_invalid_operand
		end

	set_xpath_invalid_type
		do
			value := xml_xpath_invalid_type
		end

	set_xpath_invalid_arity
		do
			value := xml_xpath_invalid_arity
		end

	set_xpath_invalid_ctxt_size
		do
			value := xml_xpath_invalid_ctxt_size
		end

	set_xpath_invalid_ctxt_position
		do
			value := xml_xpath_invalid_ctxt_position
		end

	set_xpath_memory_error
		do
			value := xml_xpath_memory_error
		end

	set_xptr_syntax_error
		do
			value := xml_xptr_syntax_error
		end

	set_xptr_resource_error
		do
			value := xml_xptr_resource_error
		end

	set_xptr_sub_resource_error
		do
			value := xml_xptr_sub_resource_error
		end

	set_xpath_undef_prefix_error
		do
			value := xml_xpath_undef_prefix_error
		end

	set_xpath_encoding_error
		do
			value := xml_xpath_encoding_error
		end

	set_xpath_invalid_char_error
		do
			value := xml_xpath_invalid_char_error
		end

	set_tree_invalid_hex
		do
			value := xml_tree_invalid_hex
		end

	set_tree_invalid_dec
		do
			value := xml_tree_invalid_dec
		end

	set_tree_unterminated_entity
		do
			value := xml_tree_unterminated_entity
		end

	set_save_not_utf8
		do
			value := xml_save_not_utf8
		end

	set_save_char_invalid
		do
			value := xml_save_char_invalid
		end

	set_save_no_doctype
		do
			value := xml_save_no_doctype
		end

	set_save_unknown_encoding
		do
			value := xml_save_unknown_encoding
		end

	set_regexp_compile_error
		do
			value := xml_regexp_compile_error
		end

	set_io_unknown
		do
			value := xml_io_unknown
		end

	set_io_eacces
		do
			value := xml_io_eacces
		end

	set_io_eagain
		do
			value := xml_io_eagain
		end

	set_io_ebadf
		do
			value := xml_io_ebadf
		end

	set_io_ebadmsg
		do
			value := xml_io_ebadmsg
		end

	set_io_ebusy
		do
			value := xml_io_ebusy
		end

	set_io_ecanceled
		do
			value := xml_io_ecanceled
		end

	set_io_echild
		do
			value := xml_io_echild
		end

	set_io_edeadlk
		do
			value := xml_io_edeadlk
		end

	set_io_edom
		do
			value := xml_io_edom
		end

	set_io_eexist
		do
			value := xml_io_eexist
		end

	set_io_efault
		do
			value := xml_io_efault
		end

	set_io_efbig
		do
			value := xml_io_efbig
		end

	set_io_einprogress
		do
			value := xml_io_einprogress
		end

	set_io_eintr
		do
			value := xml_io_eintr
		end

	set_io_einval
		do
			value := xml_io_einval
		end

	set_io_eio
		do
			value := xml_io_eio
		end

	set_io_eisdir
		do
			value := xml_io_eisdir
		end

	set_io_emfile
		do
			value := xml_io_emfile
		end

	set_io_emlink
		do
			value := xml_io_emlink
		end

	set_io_emsgsize
		do
			value := xml_io_emsgsize
		end

	set_io_enametoolong
		do
			value := xml_io_enametoolong
		end

	set_io_enfile
		do
			value := xml_io_enfile
		end

	set_io_enodev
		do
			value := xml_io_enodev
		end

	set_io_enoent
		do
			value := xml_io_enoent
		end

	set_io_enoexec
		do
			value := xml_io_enoexec
		end

	set_io_enolck
		do
			value := xml_io_enolck
		end

	set_io_enomem
		do
			value := xml_io_enomem
		end

	set_io_enospc
		do
			value := xml_io_enospc
		end

	set_io_enosys
		do
			value := xml_io_enosys
		end

	set_io_enotdir
		do
			value := xml_io_enotdir
		end

	set_io_enotempty
		do
			value := xml_io_enotempty
		end

	set_io_enotsup
		do
			value := xml_io_enotsup
		end

	set_io_enotty
		do
			value := xml_io_enotty
		end

	set_io_enxio
		do
			value := xml_io_enxio
		end

	set_io_eperm
		do
			value := xml_io_eperm
		end

	set_io_epipe
		do
			value := xml_io_epipe
		end

	set_io_erange
		do
			value := xml_io_erange
		end

	set_io_erofs
		do
			value := xml_io_erofs
		end

	set_io_espipe
		do
			value := xml_io_espipe
		end

	set_io_esrch
		do
			value := xml_io_esrch
		end

	set_io_etimedout
		do
			value := xml_io_etimedout
		end

	set_io_exdev
		do
			value := xml_io_exdev
		end

	set_io_network_attempt
		do
			value := xml_io_network_attempt
		end

	set_io_encoder
		do
			value := xml_io_encoder
		end

	set_io_flush
		do
			value := xml_io_flush
		end

	set_io_write
		do
			value := xml_io_write
		end

	set_io_no_input
		do
			value := xml_io_no_input
		end

	set_io_buffer_full
		do
			value := xml_io_buffer_full
		end

	set_io_load_error
		do
			value := xml_io_load_error
		end

	set_io_enotsock
		do
			value := xml_io_enotsock
		end

	set_io_eisconn
		do
			value := xml_io_eisconn
		end

	set_io_econnrefused
		do
			value := xml_io_econnrefused
		end

	set_io_enetunreach
		do
			value := xml_io_enetunreach
		end

	set_io_eaddrinuse
		do
			value := xml_io_eaddrinuse
		end

	set_io_ealready
		do
			value := xml_io_ealready
		end

	set_io_eafnosupport
		do
			value := xml_io_eafnosupport
		end

	set_xinclude_recursion
		do
			value := xml_xinclude_recursion
		end

	set_xinclude_parse_value
		do
			value := xml_xinclude_parse_value
		end

	set_xinclude_entity_def_mismatch
		do
			value := xml_xinclude_entity_def_mismatch
		end

	set_xinclude_no_href
		do
			value := xml_xinclude_no_href
		end

	set_xinclude_no_fallback
		do
			value := xml_xinclude_no_fallback
		end

	set_xinclude_href_uri
		do
			value := xml_xinclude_href_uri
		end

	set_xinclude_text_fragment
		do
			value := xml_xinclude_text_fragment
		end

	set_xinclude_text_document
		do
			value := xml_xinclude_text_document
		end

	set_xinclude_invalid_char
		do
			value := xml_xinclude_invalid_char
		end

	set_xinclude_build_failed
		do
			value := xml_xinclude_build_failed
		end

	set_xinclude_unknown_encoding
		do
			value := xml_xinclude_unknown_encoding
		end

	set_xinclude_multiple_root
		do
			value := xml_xinclude_multiple_root
		end

	set_xinclude_xptr_failed
		do
			value := xml_xinclude_xptr_failed
		end

	set_xinclude_xptr_result
		do
			value := xml_xinclude_xptr_result
		end

	set_xinclude_include_in_include
		do
			value := xml_xinclude_include_in_include
		end

	set_xinclude_fallbacks_in_include
		do
			value := xml_xinclude_fallbacks_in_include
		end

	set_xinclude_fallback_not_in_include
		do
			value := xml_xinclude_fallback_not_in_include
		end

	set_xinclude_deprecated_ns
		do
			value := xml_xinclude_deprecated_ns
		end

	set_xinclude_fragment_id
		do
			value := xml_xinclude_fragment_id
		end

	set_catalog_missing_attr
		do
			value := xml_catalog_missing_attr
		end

	set_catalog_entry_broken
		do
			value := xml_catalog_entry_broken
		end

	set_catalog_prefer_value
		do
			value := xml_catalog_prefer_value
		end

	set_catalog_not_catalog
		do
			value := xml_catalog_not_catalog
		end

	set_catalog_recursion
		do
			value := xml_catalog_recursion
		end

	set_schemap_prefix_undefined
		do
			value := xml_schemap_prefix_undefined
		end

	set_schemap_attrformdefault_value
		do
			value := xml_schemap_attrformdefault_value
		end

	set_schemap_attrgrp_noname_noref
		do
			value := xml_schemap_attrgrp_noname_noref
		end

	set_schemap_attr_noname_noref
		do
			value := xml_schemap_attr_noname_noref
		end

	set_schemap_complextype_noname_noref
		do
			value := xml_schemap_complextype_noname_noref
		end

	set_schemap_elemformdefault_value
		do
			value := xml_schemap_elemformdefault_value
		end

	set_schemap_elem_noname_noref
		do
			value := xml_schemap_elem_noname_noref
		end

	set_schemap_extension_no_base
		do
			value := xml_schemap_extension_no_base
		end

	set_schemap_facet_no_value
		do
			value := xml_schemap_facet_no_value
		end

	set_schemap_failed_build_import
		do
			value := xml_schemap_failed_build_import
		end

	set_schemap_group_noname_noref
		do
			value := xml_schemap_group_noname_noref
		end

	set_schemap_import_namespace_not_uri
		do
			value := xml_schemap_import_namespace_not_uri
		end

	set_schemap_import_redefine_nsname
		do
			value := xml_schemap_import_redefine_nsname
		end

	set_schemap_import_schema_not_uri
		do
			value := xml_schemap_import_schema_not_uri
		end

	set_schemap_invalid_boolean
		do
			value := xml_schemap_invalid_boolean
		end

	set_schemap_invalid_enum
		do
			value := xml_schemap_invalid_enum
		end

	set_schemap_invalid_facet
		do
			value := xml_schemap_invalid_facet
		end

	set_schemap_invalid_facet_value
		do
			value := xml_schemap_invalid_facet_value
		end

	set_schemap_invalid_maxoccurs
		do
			value := xml_schemap_invalid_maxoccurs
		end

	set_schemap_invalid_minoccurs
		do
			value := xml_schemap_invalid_minoccurs
		end

	set_schemap_invalid_ref_and_subtype
		do
			value := xml_schemap_invalid_ref_and_subtype
		end

	set_schemap_invalid_white_space
		do
			value := xml_schemap_invalid_white_space
		end

	set_schemap_noattr_noref
		do
			value := xml_schemap_noattr_noref
		end

	set_schemap_notation_no_name
		do
			value := xml_schemap_notation_no_name
		end

	set_schemap_notype_noref
		do
			value := xml_schemap_notype_noref
		end

	set_schemap_ref_and_subtype
		do
			value := xml_schemap_ref_and_subtype
		end

	set_schemap_restriction_noname_noref
		do
			value := xml_schemap_restriction_noname_noref
		end

	set_schemap_simpletype_noname
		do
			value := xml_schemap_simpletype_noname
		end

	set_schemap_type_and_subtype
		do
			value := xml_schemap_type_and_subtype
		end

	set_schemap_unknown_all_child
		do
			value := xml_schemap_unknown_all_child
		end

	set_schemap_unknown_anyattribute_child
		do
			value := xml_schemap_unknown_anyattribute_child
		end

	set_schemap_unknown_attr_child
		do
			value := xml_schemap_unknown_attr_child
		end

	set_schemap_unknown_attrgrp_child
		do
			value := xml_schemap_unknown_attrgrp_child
		end

	set_schemap_unknown_attribute_group
		do
			value := xml_schemap_unknown_attribute_group
		end

	set_schemap_unknown_base_type
		do
			value := xml_schemap_unknown_base_type
		end

	set_schemap_unknown_choice_child
		do
			value := xml_schemap_unknown_choice_child
		end

	set_schemap_unknown_complexcontent_child
		do
			value := xml_schemap_unknown_complexcontent_child
		end

	set_schemap_unknown_complextype_child
		do
			value := xml_schemap_unknown_complextype_child
		end

	set_schemap_unknown_elem_child
		do
			value := xml_schemap_unknown_elem_child
		end

	set_schemap_unknown_extension_child
		do
			value := xml_schemap_unknown_extension_child
		end

	set_schemap_unknown_facet_child
		do
			value := xml_schemap_unknown_facet_child
		end

	set_schemap_unknown_facet_type
		do
			value := xml_schemap_unknown_facet_type
		end

	set_schemap_unknown_group_child
		do
			value := xml_schemap_unknown_group_child
		end

	set_schemap_unknown_import_child
		do
			value := xml_schemap_unknown_import_child
		end

	set_schemap_unknown_list_child
		do
			value := xml_schemap_unknown_list_child
		end

	set_schemap_unknown_notation_child
		do
			value := xml_schemap_unknown_notation_child
		end

	set_schemap_unknown_processcontent_child
		do
			value := xml_schemap_unknown_processcontent_child
		end

	set_schemap_unknown_ref
		do
			value := xml_schemap_unknown_ref
		end

	set_schemap_unknown_restriction_child
		do
			value := xml_schemap_unknown_restriction_child
		end

	set_schemap_unknown_schemas_child
		do
			value := xml_schemap_unknown_schemas_child
		end

	set_schemap_unknown_sequence_child
		do
			value := xml_schemap_unknown_sequence_child
		end

	set_schemap_unknown_simplecontent_child
		do
			value := xml_schemap_unknown_simplecontent_child
		end

	set_schemap_unknown_simpletype_child
		do
			value := xml_schemap_unknown_simpletype_child
		end

	set_schemap_unknown_type
		do
			value := xml_schemap_unknown_type
		end

	set_schemap_unknown_union_child
		do
			value := xml_schemap_unknown_union_child
		end

	set_schemap_elem_default_fixed
		do
			value := xml_schemap_elem_default_fixed
		end

	set_schemap_regexp_invalid
		do
			value := xml_schemap_regexp_invalid
		end

	set_schemap_failed_load
		do
			value := xml_schemap_failed_load
		end

	set_schemap_nothing_to_parse
		do
			value := xml_schemap_nothing_to_parse
		end

	set_schemap_noroot
		do
			value := xml_schemap_noroot
		end

	set_schemap_redefined_group
		do
			value := xml_schemap_redefined_group
		end

	set_schemap_redefined_type
		do
			value := xml_schemap_redefined_type
		end

	set_schemap_redefined_element
		do
			value := xml_schemap_redefined_element
		end

	set_schemap_redefined_attrgroup
		do
			value := xml_schemap_redefined_attrgroup
		end

	set_schemap_redefined_attr
		do
			value := xml_schemap_redefined_attr
		end

	set_schemap_redefined_notation
		do
			value := xml_schemap_redefined_notation
		end

	set_schemap_failed_parse
		do
			value := xml_schemap_failed_parse
		end

	set_schemap_unknown_prefix
		do
			value := xml_schemap_unknown_prefix
		end

	set_schemap_def_and_prefix
		do
			value := xml_schemap_def_and_prefix
		end

	set_schemap_unknown_include_child
		do
			value := xml_schemap_unknown_include_child
		end

	set_schemap_include_schema_not_uri
		do
			value := xml_schemap_include_schema_not_uri
		end

	set_schemap_include_schema_no_uri
		do
			value := xml_schemap_include_schema_no_uri
		end

	set_schemap_not_schema
		do
			value := xml_schemap_not_schema
		end

	set_schemap_unknown_member_type
		do
			value := xml_schemap_unknown_member_type
		end

	set_schemap_invalid_attr_use
		do
			value := xml_schemap_invalid_attr_use
		end

	set_schemap_recursive
		do
			value := xml_schemap_recursive
		end

	set_schemap_supernumerous_list_item_type
		do
			value := xml_schemap_supernumerous_list_item_type
		end

	set_schemap_invalid_attr_combination
		do
			value := xml_schemap_invalid_attr_combination
		end

	set_schemap_invalid_attr_inline_combination
		do
			value := xml_schemap_invalid_attr_inline_combination
		end

	set_schemap_missing_simpletype_child
		do
			value := xml_schemap_missing_simpletype_child
		end

	set_schemap_invalid_attr_name
		do
			value := xml_schemap_invalid_attr_name
		end

	set_schemap_ref_and_content
		do
			value := xml_schemap_ref_and_content
		end

	set_schemap_ct_props_correct_1
		do
			value := xml_schemap_ct_props_correct_1
		end

	set_schemap_ct_props_correct_2
		do
			value := xml_schemap_ct_props_correct_2
		end

	set_schemap_ct_props_correct_3
		do
			value := xml_schemap_ct_props_correct_3
		end

	set_schemap_ct_props_correct_4
		do
			value := xml_schemap_ct_props_correct_4
		end

	set_schemap_ct_props_correct_5
		do
			value := xml_schemap_ct_props_correct_5
		end

	set_schemap_derivation_ok_restriction_1
		do
			value := xml_schemap_derivation_ok_restriction_1
		end

	set_schemap_derivation_ok_restriction_2_1_1
		do
			value := xml_schemap_derivation_ok_restriction_2_1_1
		end

	set_schemap_derivation_ok_restriction_2_1_2
		do
			value := xml_schemap_derivation_ok_restriction_2_1_2
		end

	set_schemap_derivation_ok_restriction_2_2
		do
			value := xml_schemap_derivation_ok_restriction_2_2
		end

	set_schemap_derivation_ok_restriction_3
		do
			value := xml_schemap_derivation_ok_restriction_3
		end

	set_schemap_wildcard_invalid_ns_member
		do
			value := xml_schemap_wildcard_invalid_ns_member
		end

	set_schemap_intersection_not_expressible
		do
			value := xml_schemap_intersection_not_expressible
		end

	set_schemap_union_not_expressible
		do
			value := xml_schemap_union_not_expressible
		end

	set_schemap_src_import_3_1
		do
			value := xml_schemap_src_import_3_1
		end

	set_schemap_src_import_3_2
		do
			value := xml_schemap_src_import_3_2
		end

	set_schemap_derivation_ok_restriction_4_1
		do
			value := xml_schemap_derivation_ok_restriction_4_1
		end

	set_schemap_derivation_ok_restriction_4_2
		do
			value := xml_schemap_derivation_ok_restriction_4_2
		end

	set_schemap_derivation_ok_restriction_4_3
		do
			value := xml_schemap_derivation_ok_restriction_4_3
		end

	set_schemap_cos_ct_extends_1_3
		do
			value := xml_schemap_cos_ct_extends_1_3
		end

	set_schemav_noroot
		do
			value := xml_schemav_noroot
		end

	set_schemav_undeclaredelem
		do
			value := xml_schemav_undeclaredelem
		end

	set_schemav_nottoplevel
		do
			value := xml_schemav_nottoplevel
		end

	set_schemav_missing
		do
			value := xml_schemav_missing
		end

	set_schemav_wrongelem
		do
			value := xml_schemav_wrongelem
		end

	set_schemav_notype
		do
			value := xml_schemav_notype
		end

	set_schemav_norollback
		do
			value := xml_schemav_norollback
		end

	set_schemav_isabstract
		do
			value := xml_schemav_isabstract
		end

	set_schemav_notempty
		do
			value := xml_schemav_notempty
		end

	set_schemav_elemcont
		do
			value := xml_schemav_elemcont
		end

	set_schemav_havedefault
		do
			value := xml_schemav_havedefault
		end

	set_schemav_notnillable
		do
			value := xml_schemav_notnillable
		end

	set_schemav_extracontent
		do
			value := xml_schemav_extracontent
		end

	set_schemav_invalidattr
		do
			value := xml_schemav_invalidattr
		end

	set_schemav_invalidelem
		do
			value := xml_schemav_invalidelem
		end

	set_schemav_notdeterminist
		do
			value := xml_schemav_notdeterminist
		end

	set_schemav_construct
		do
			value := xml_schemav_construct
		end

	set_schemav_internal
		do
			value := xml_schemav_internal
		end

	set_schemav_notsimple
		do
			value := xml_schemav_notsimple
		end

	set_schemav_attrunknown
		do
			value := xml_schemav_attrunknown
		end

	set_schemav_attrinvalid
		do
			value := xml_schemav_attrinvalid
		end

	set_schemav_value
		do
			value := xml_schemav_value
		end

	set_schemav_facet
		do
			value := xml_schemav_facet
		end

	set_schemav_cvc_datatype_valid_1_2_1
		do
			value := xml_schemav_cvc_datatype_valid_1_2_1
		end

	set_schemav_cvc_datatype_valid_1_2_2
		do
			value := xml_schemav_cvc_datatype_valid_1_2_2
		end

	set_schemav_cvc_datatype_valid_1_2_3
		do
			value := xml_schemav_cvc_datatype_valid_1_2_3
		end

	set_schemav_cvc_type_3_1_1
		do
			value := xml_schemav_cvc_type_3_1_1
		end

	set_schemav_cvc_type_3_1_2
		do
			value := xml_schemav_cvc_type_3_1_2
		end

	set_schemav_cvc_facet_valid
		do
			value := xml_schemav_cvc_facet_valid
		end

	set_schemav_cvc_length_valid
		do
			value := xml_schemav_cvc_length_valid
		end

	set_schemav_cvc_minlength_valid
		do
			value := xml_schemav_cvc_minlength_valid
		end

	set_schemav_cvc_maxlength_valid
		do
			value := xml_schemav_cvc_maxlength_valid
		end

	set_schemav_cvc_mininclusive_valid
		do
			value := xml_schemav_cvc_mininclusive_valid
		end

	set_schemav_cvc_maxinclusive_valid
		do
			value := xml_schemav_cvc_maxinclusive_valid
		end

	set_schemav_cvc_minexclusive_valid
		do
			value := xml_schemav_cvc_minexclusive_valid
		end

	set_schemav_cvc_maxexclusive_valid
		do
			value := xml_schemav_cvc_maxexclusive_valid
		end

	set_schemav_cvc_totaldigits_valid
		do
			value := xml_schemav_cvc_totaldigits_valid
		end

	set_schemav_cvc_fractiondigits_valid
		do
			value := xml_schemav_cvc_fractiondigits_valid
		end

	set_schemav_cvc_pattern_valid
		do
			value := xml_schemav_cvc_pattern_valid
		end

	set_schemav_cvc_enumeration_valid
		do
			value := xml_schemav_cvc_enumeration_valid
		end

	set_schemav_cvc_complex_type_2_1
		do
			value := xml_schemav_cvc_complex_type_2_1
		end

	set_schemav_cvc_complex_type_2_2
		do
			value := xml_schemav_cvc_complex_type_2_2
		end

	set_schemav_cvc_complex_type_2_3
		do
			value := xml_schemav_cvc_complex_type_2_3
		end

	set_schemav_cvc_complex_type_2_4
		do
			value := xml_schemav_cvc_complex_type_2_4
		end

	set_schemav_cvc_elt_1
		do
			value := xml_schemav_cvc_elt_1
		end

	set_schemav_cvc_elt_2
		do
			value := xml_schemav_cvc_elt_2
		end

	set_schemav_cvc_elt_3_1
		do
			value := xml_schemav_cvc_elt_3_1
		end

	set_schemav_cvc_elt_3_2_1
		do
			value := xml_schemav_cvc_elt_3_2_1
		end

	set_schemav_cvc_elt_3_2_2
		do
			value := xml_schemav_cvc_elt_3_2_2
		end

	set_schemav_cvc_elt_4_1
		do
			value := xml_schemav_cvc_elt_4_1
		end

	set_schemav_cvc_elt_4_2
		do
			value := xml_schemav_cvc_elt_4_2
		end

	set_schemav_cvc_elt_4_3
		do
			value := xml_schemav_cvc_elt_4_3
		end

	set_schemav_cvc_elt_5_1_1
		do
			value := xml_schemav_cvc_elt_5_1_1
		end

	set_schemav_cvc_elt_5_1_2
		do
			value := xml_schemav_cvc_elt_5_1_2
		end

	set_schemav_cvc_elt_5_2_1
		do
			value := xml_schemav_cvc_elt_5_2_1
		end

	set_schemav_cvc_elt_5_2_2_1
		do
			value := xml_schemav_cvc_elt_5_2_2_1
		end

	set_schemav_cvc_elt_5_2_2_2_1
		do
			value := xml_schemav_cvc_elt_5_2_2_2_1
		end

	set_schemav_cvc_elt_5_2_2_2_2
		do
			value := xml_schemav_cvc_elt_5_2_2_2_2
		end

	set_schemav_cvc_elt_6
		do
			value := xml_schemav_cvc_elt_6
		end

	set_schemav_cvc_elt_7
		do
			value := xml_schemav_cvc_elt_7
		end

	set_schemav_cvc_attribute_1
		do
			value := xml_schemav_cvc_attribute_1
		end

	set_schemav_cvc_attribute_2
		do
			value := xml_schemav_cvc_attribute_2
		end

	set_schemav_cvc_attribute_3
		do
			value := xml_schemav_cvc_attribute_3
		end

	set_schemav_cvc_attribute_4
		do
			value := xml_schemav_cvc_attribute_4
		end

	set_schemav_cvc_complex_type_3_1
		do
			value := xml_schemav_cvc_complex_type_3_1
		end

	set_schemav_cvc_complex_type_3_2_1
		do
			value := xml_schemav_cvc_complex_type_3_2_1
		end

	set_schemav_cvc_complex_type_3_2_2
		do
			value := xml_schemav_cvc_complex_type_3_2_2
		end

	set_schemav_cvc_complex_type_4
		do
			value := xml_schemav_cvc_complex_type_4
		end

	set_schemav_cvc_complex_type_5_1
		do
			value := xml_schemav_cvc_complex_type_5_1
		end

	set_schemav_cvc_complex_type_5_2
		do
			value := xml_schemav_cvc_complex_type_5_2
		end

	set_schemav_element_content
		do
			value := xml_schemav_element_content
		end

	set_schemav_document_element_missing
		do
			value := xml_schemav_document_element_missing
		end

	set_schemav_cvc_complex_type_1
		do
			value := xml_schemav_cvc_complex_type_1
		end

	set_schemav_cvc_au
		do
			value := xml_schemav_cvc_au
		end

	set_schemav_cvc_type_1
		do
			value := xml_schemav_cvc_type_1
		end

	set_schemav_cvc_type_2
		do
			value := xml_schemav_cvc_type_2
		end

	set_schemav_cvc_idc
		do
			value := xml_schemav_cvc_idc
		end

	set_schemav_cvc_wildcard
		do
			value := xml_schemav_cvc_wildcard
		end

	set_schemav_misc
		do
			value := xml_schemav_misc
		end

	set_xptr_unknown_scheme
		do
			value := xml_xptr_unknown_scheme
		end

	set_xptr_childseq_start
		do
			value := xml_xptr_childseq_start
		end

	set_xptr_eval_failed
		do
			value := xml_xptr_eval_failed
		end

	set_xptr_extra_objects
		do
			value := xml_xptr_extra_objects
		end

	set_c14n_create_ctxt
		do
			value := xml_c14n_create_ctxt
		end

	set_c14n_requires_utf8
		do
			value := xml_c14n_requires_utf8
		end

	set_c14n_create_stack
		do
			value := xml_c14n_create_stack
		end

	set_c14n_invalid_node
		do
			value := xml_c14n_invalid_node
		end

	set_c14n_unknow_node
		do
			value := xml_c14n_unknow_node
		end

	set_c14n_relative_namespace
		do
			value := xml_c14n_relative_namespace
		end

	set_ftp_pasv_answer
		do
			value := xml_ftp_pasv_answer
		end

	set_ftp_epsv_answer
		do
			value := xml_ftp_epsv_answer
		end

	set_ftp_accnt
		do
			value := xml_ftp_accnt
		end

	set_ftp_url_syntax
		do
			value := xml_ftp_url_syntax
		end

	set_http_url_syntax
		do
			value := xml_http_url_syntax
		end

	set_http_use_ip
		do
			value := xml_http_use_ip
		end

	set_http_unknown_host
		do
			value := xml_http_unknown_host
		end

	set_schemap_src_simple_type_1
		do
			value := xml_schemap_src_simple_type_1
		end

	set_schemap_src_simple_type_2
		do
			value := xml_schemap_src_simple_type_2
		end

	set_schemap_src_simple_type_3
		do
			value := xml_schemap_src_simple_type_3
		end

	set_schemap_src_simple_type_4
		do
			value := xml_schemap_src_simple_type_4
		end

	set_schemap_src_resolve
		do
			value := xml_schemap_src_resolve
		end

	set_schemap_src_restriction_base_or_simpletype
		do
			value := xml_schemap_src_restriction_base_or_simpletype
		end

	set_schemap_src_list_itemtype_or_simpletype
		do
			value := xml_schemap_src_list_itemtype_or_simpletype
		end

	set_schemap_src_union_membertypes_or_simpletypes
		do
			value := xml_schemap_src_union_membertypes_or_simpletypes
		end

	set_schemap_st_props_correct_1
		do
			value := xml_schemap_st_props_correct_1
		end

	set_schemap_st_props_correct_2
		do
			value := xml_schemap_st_props_correct_2
		end

	set_schemap_st_props_correct_3
		do
			value := xml_schemap_st_props_correct_3
		end

	set_schemap_cos_st_restricts_1_1
		do
			value := xml_schemap_cos_st_restricts_1_1
		end

	set_schemap_cos_st_restricts_1_2
		do
			value := xml_schemap_cos_st_restricts_1_2
		end

	set_schemap_cos_st_restricts_1_3_1
		do
			value := xml_schemap_cos_st_restricts_1_3_1
		end

	set_schemap_cos_st_restricts_1_3_2
		do
			value := xml_schemap_cos_st_restricts_1_3_2
		end

	set_schemap_cos_st_restricts_2_1
		do
			value := xml_schemap_cos_st_restricts_2_1
		end

	set_schemap_cos_st_restricts_2_3_1_1
		do
			value := xml_schemap_cos_st_restricts_2_3_1_1
		end

	set_schemap_cos_st_restricts_2_3_1_2
		do
			value := xml_schemap_cos_st_restricts_2_3_1_2
		end

	set_schemap_cos_st_restricts_2_3_2_1
		do
			value := xml_schemap_cos_st_restricts_2_3_2_1
		end

	set_schemap_cos_st_restricts_2_3_2_2
		do
			value := xml_schemap_cos_st_restricts_2_3_2_2
		end

	set_schemap_cos_st_restricts_2_3_2_3
		do
			value := xml_schemap_cos_st_restricts_2_3_2_3
		end

	set_schemap_cos_st_restricts_2_3_2_4
		do
			value := xml_schemap_cos_st_restricts_2_3_2_4
		end

	set_schemap_cos_st_restricts_2_3_2_5
		do
			value := xml_schemap_cos_st_restricts_2_3_2_5
		end

	set_schemap_cos_st_restricts_3_1
		do
			value := xml_schemap_cos_st_restricts_3_1
		end

	set_schemap_cos_st_restricts_3_3_1
		do
			value := xml_schemap_cos_st_restricts_3_3_1
		end

	set_schemap_cos_st_restricts_3_3_1_2
		do
			value := xml_schemap_cos_st_restricts_3_3_1_2
		end

	set_schemap_cos_st_restricts_3_3_2_2
		do
			value := xml_schemap_cos_st_restricts_3_3_2_2
		end

	set_schemap_cos_st_restricts_3_3_2_1
		do
			value := xml_schemap_cos_st_restricts_3_3_2_1
		end

	set_schemap_cos_st_restricts_3_3_2_3
		do
			value := xml_schemap_cos_st_restricts_3_3_2_3
		end

	set_schemap_cos_st_restricts_3_3_2_4
		do
			value := xml_schemap_cos_st_restricts_3_3_2_4
		end

	set_schemap_cos_st_restricts_3_3_2_5
		do
			value := xml_schemap_cos_st_restricts_3_3_2_5
		end

	set_schemap_cos_st_derived_ok_2_1
		do
			value := xml_schemap_cos_st_derived_ok_2_1
		end

	set_schemap_cos_st_derived_ok_2_2
		do
			value := xml_schemap_cos_st_derived_ok_2_2
		end

	set_schemap_s4s_elem_not_allowed
		do
			value := xml_schemap_s4s_elem_not_allowed
		end

	set_schemap_s4s_elem_missing
		do
			value := xml_schemap_s4s_elem_missing
		end

	set_schemap_s4s_attr_not_allowed
		do
			value := xml_schemap_s4s_attr_not_allowed
		end

	set_schemap_s4s_attr_missing
		do
			value := xml_schemap_s4s_attr_missing
		end

	set_schemap_s4s_attr_invalid_value
		do
			value := xml_schemap_s4s_attr_invalid_value
		end

	set_schemap_src_element_1
		do
			value := xml_schemap_src_element_1
		end

	set_schemap_src_element_2_1
		do
			value := xml_schemap_src_element_2_1
		end

	set_schemap_src_element_2_2
		do
			value := xml_schemap_src_element_2_2
		end

	set_schemap_src_element_3
		do
			value := xml_schemap_src_element_3
		end

	set_schemap_p_props_correct_1
		do
			value := xml_schemap_p_props_correct_1
		end

	set_schemap_p_props_correct_2_1
		do
			value := xml_schemap_p_props_correct_2_1
		end

	set_schemap_p_props_correct_2_2
		do
			value := xml_schemap_p_props_correct_2_2
		end

	set_schemap_e_props_correct_2
		do
			value := xml_schemap_e_props_correct_2
		end

	set_schemap_e_props_correct_3
		do
			value := xml_schemap_e_props_correct_3
		end

	set_schemap_e_props_correct_4
		do
			value := xml_schemap_e_props_correct_4
		end

	set_schemap_e_props_correct_5
		do
			value := xml_schemap_e_props_correct_5
		end

	set_schemap_e_props_correct_6
		do
			value := xml_schemap_e_props_correct_6
		end

	set_schemap_src_include
		do
			value := xml_schemap_src_include
		end

	set_schemap_src_attribute_1
		do
			value := xml_schemap_src_attribute_1
		end

	set_schemap_src_attribute_2
		do
			value := xml_schemap_src_attribute_2
		end

	set_schemap_src_attribute_3_1
		do
			value := xml_schemap_src_attribute_3_1
		end

	set_schemap_src_attribute_3_2
		do
			value := xml_schemap_src_attribute_3_2
		end

	set_schemap_src_attribute_4
		do
			value := xml_schemap_src_attribute_4
		end

	set_schemap_no_xmlns
		do
			value := xml_schemap_no_xmlns
		end

	set_schemap_no_xsi
		do
			value := xml_schemap_no_xsi
		end

	set_schemap_cos_valid_default_1
		do
			value := xml_schemap_cos_valid_default_1
		end

	set_schemap_cos_valid_default_2_1
		do
			value := xml_schemap_cos_valid_default_2_1
		end

	set_schemap_cos_valid_default_2_2_1
		do
			value := xml_schemap_cos_valid_default_2_2_1
		end

	set_schemap_cos_valid_default_2_2_2
		do
			value := xml_schemap_cos_valid_default_2_2_2
		end

	set_schemap_cvc_simple_type
		do
			value := xml_schemap_cvc_simple_type
		end

	set_schemap_cos_ct_extends_1_1
		do
			value := xml_schemap_cos_ct_extends_1_1
		end

	set_schemap_src_import_1_1
		do
			value := xml_schemap_src_import_1_1
		end

	set_schemap_src_import_1_2
		do
			value := xml_schemap_src_import_1_2
		end

	set_schemap_src_import_2
		do
			value := xml_schemap_src_import_2
		end

	set_schemap_src_import_2_1
		do
			value := xml_schemap_src_import_2_1
		end

	set_schemap_src_import_2_2
		do
			value := xml_schemap_src_import_2_2
		end

	set_schemap_internal
		do
			value := xml_schemap_internal
		end

	set_schemap_not_deterministic
		do
			value := xml_schemap_not_deterministic
		end

	set_schemap_src_attribute_group_1
		do
			value := xml_schemap_src_attribute_group_1
		end

	set_schemap_src_attribute_group_2
		do
			value := xml_schemap_src_attribute_group_2
		end

	set_schemap_src_attribute_group_3
		do
			value := xml_schemap_src_attribute_group_3
		end

	set_schemap_mg_props_correct_1
		do
			value := xml_schemap_mg_props_correct_1
		end

	set_schemap_mg_props_correct_2
		do
			value := xml_schemap_mg_props_correct_2
		end

	set_schemap_src_ct_1
		do
			value := xml_schemap_src_ct_1
		end

	set_schemap_derivation_ok_restriction_2_1_3
		do
			value := xml_schemap_derivation_ok_restriction_2_1_3
		end

	set_schemap_au_props_correct_2
		do
			value := xml_schemap_au_props_correct_2
		end

	set_schemap_a_props_correct_2
		do
			value := xml_schemap_a_props_correct_2
		end

	set_schemap_c_props_correct
		do
			value := xml_schemap_c_props_correct
		end

	set_schemap_src_redefine
		do
			value := xml_schemap_src_redefine
		end

	set_schemap_src_import
		do
			value := xml_schemap_src_import
		end

	set_schemap_warn_skip_schema
		do
			value := xml_schemap_warn_skip_schema
		end

	set_schemap_warn_unlocated_schema
		do
			value := xml_schemap_warn_unlocated_schema
		end

	set_schemap_warn_attr_redecl_proh
		do
			value := xml_schemap_warn_attr_redecl_proh
		end

	set_schemap_warn_attr_pointless_proh
		do
			value := xml_schemap_warn_attr_pointless_proh
		end

	set_schemap_ag_props_correct
		do
			value := xml_schemap_ag_props_correct
		end

	set_schemap_cos_ct_extends_1_2
		do
			value := xml_schemap_cos_ct_extends_1_2
		end

	set_schemap_au_props_correct
		do
			value := xml_schemap_au_props_correct
		end

	set_schemap_a_props_correct_3
		do
			value := xml_schemap_a_props_correct_3
		end

	set_schemap_cos_all_limited
		do
			value := xml_schemap_cos_all_limited
		end

	set_module_open
		do
			value := xml_module_open
		end

	set_module_close
		do
			value := xml_module_close
		end

	set_check_found_element
		do
			value := xml_check_found_element
		end

	set_check_found_attribute
		do
			value := xml_check_found_attribute
		end

	set_check_found_text
		do
			value := xml_check_found_text
		end

	set_check_found_cdata
		do
			value := xml_check_found_cdata
		end

	set_check_found_entityref
		do
			value := xml_check_found_entityref
		end

	set_check_found_entity
		do
			value := xml_check_found_entity
		end

	set_check_found_pi
		do
			value := xml_check_found_pi
		end

	set_check_found_comment
		do
			value := xml_check_found_comment
		end

	set_check_found_doctype
		do
			value := xml_check_found_doctype
		end

	set_check_found_fragment
		do
			value := xml_check_found_fragment
		end

	set_check_found_notation
		do
			value := xml_check_found_notation
		end

	set_check_unknown_node
		do
			value := xml_check_unknown_node
		end

	set_check_entity_type
		do
			value := xml_check_entity_type
		end

	set_check_no_parent
		do
			value := xml_check_no_parent
		end

	set_check_no_doc
		do
			value := xml_check_no_doc
		end

	set_check_no_name
		do
			value := xml_check_no_name
		end

	set_check_no_elem
		do
			value := xml_check_no_elem
		end

	set_check_wrong_doc
		do
			value := xml_check_wrong_doc
		end

	set_check_no_prev
		do
			value := xml_check_no_prev
		end

	set_check_wrong_prev
		do
			value := xml_check_wrong_prev
		end

	set_check_no_next
		do
			value := xml_check_no_next
		end

	set_check_wrong_next
		do
			value := xml_check_wrong_next
		end

	set_check_not_dtd
		do
			value := xml_check_not_dtd
		end

	set_check_not_attr
		do
			value := xml_check_not_attr
		end

	set_check_not_attr_decl
		do
			value := xml_check_not_attr_decl
		end

	set_check_not_elem_decl
		do
			value := xml_check_not_elem_decl
		end

	set_check_not_entity_decl
		do
			value := xml_check_not_entity_decl
		end

	set_check_not_ns_decl
		do
			value := xml_check_not_ns_decl
		end

	set_check_no_href
		do
			value := xml_check_no_href
		end

	set_check_wrong_parent
		do
			value := xml_check_wrong_parent
		end

	set_check_ns_scope
		do
			value := xml_check_ns_scope
		end

	set_check_ns_ancestor
		do
			value := xml_check_ns_ancestor
		end

	set_check_not_utf8
		do
			value := xml_check_not_utf8
		end

	set_check_no_dict
		do
			value := xml_check_no_dict
		end

	set_check_not_ncname
		do
			value := xml_check_not_ncname
		end

	set_check_outside_dict
		do
			value := xml_check_outside_dict
		end

	set_check_wrong_name
		do
			value := xml_check_wrong_name
		end

	set_check_name_not_null
		do
			value := xml_check_name_not_null
		end

	set_i18n_no_name
		do
			value := xml_i18n_no_name
		end

	set_i18n_no_handler
		do
			value := xml_i18n_no_handler
		end

	set_i18n_excess_handler
		do
			value := xml_i18n_excess_handler
		end

	set_i18n_conv_failed
		do
			value := xml_i18n_conv_failed
		end

	set_i18n_no_output
		do
			value := xml_i18n_no_output
		end


feature {ANY} -- Queries
	is_err_ok: BOOLEAN
		do
			Result := (value=xml_err_ok)
		end

	is_err_internal_error: BOOLEAN
		do
			Result := (value=xml_err_internal_error)
		end

	is_err_no_memory: BOOLEAN
		do
			Result := (value=xml_err_no_memory)
		end

	is_err_document_start: BOOLEAN
		do
			Result := (value=xml_err_document_start)
		end

	is_err_document_empty: BOOLEAN
		do
			Result := (value=xml_err_document_empty)
		end

	is_err_document_end: BOOLEAN
		do
			Result := (value=xml_err_document_end)
		end

	is_err_invalid_hex_charref: BOOLEAN
		do
			Result := (value=xml_err_invalid_hex_charref)
		end

	is_err_invalid_dec_charref: BOOLEAN
		do
			Result := (value=xml_err_invalid_dec_charref)
		end

	is_err_invalid_charref: BOOLEAN
		do
			Result := (value=xml_err_invalid_charref)
		end

	is_err_invalid_char: BOOLEAN
		do
			Result := (value=xml_err_invalid_char)
		end

	is_err_charref_at_eof: BOOLEAN
		do
			Result := (value=xml_err_charref_at_eof)
		end

	is_err_charref_in_prolog: BOOLEAN
		do
			Result := (value=xml_err_charref_in_prolog)
		end

	is_err_charref_in_epilog: BOOLEAN
		do
			Result := (value=xml_err_charref_in_epilog)
		end

	is_err_charref_in_dtd: BOOLEAN
		do
			Result := (value=xml_err_charref_in_dtd)
		end

	is_err_entityref_at_eof: BOOLEAN
		do
			Result := (value=xml_err_entityref_at_eof)
		end

	is_err_entityref_in_prolog: BOOLEAN
		do
			Result := (value=xml_err_entityref_in_prolog)
		end

	is_err_entityref_in_epilog: BOOLEAN
		do
			Result := (value=xml_err_entityref_in_epilog)
		end

	is_err_entityref_in_dtd: BOOLEAN
		do
			Result := (value=xml_err_entityref_in_dtd)
		end

	is_err_peref_at_eof: BOOLEAN
		do
			Result := (value=xml_err_peref_at_eof)
		end

	is_err_peref_in_prolog: BOOLEAN
		do
			Result := (value=xml_err_peref_in_prolog)
		end

	is_err_peref_in_epilog: BOOLEAN
		do
			Result := (value=xml_err_peref_in_epilog)
		end

	is_err_peref_in_int_subset: BOOLEAN
		do
			Result := (value=xml_err_peref_in_int_subset)
		end

	is_err_entityref_no_name: BOOLEAN
		do
			Result := (value=xml_err_entityref_no_name)
		end

	is_err_entityref_semicol_missing: BOOLEAN
		do
			Result := (value=xml_err_entityref_semicol_missing)
		end

	is_err_peref_no_name: BOOLEAN
		do
			Result := (value=xml_err_peref_no_name)
		end

	is_err_peref_semicol_missing: BOOLEAN
		do
			Result := (value=xml_err_peref_semicol_missing)
		end

	is_err_undeclared_entity: BOOLEAN
		do
			Result := (value=xml_err_undeclared_entity)
		end

	is_war_undeclared_entity: BOOLEAN
		do
			Result := (value=xml_war_undeclared_entity)
		end

	is_err_unparsed_entity: BOOLEAN
		do
			Result := (value=xml_err_unparsed_entity)
		end

	is_err_entity_is_external: BOOLEAN
		do
			Result := (value=xml_err_entity_is_external)
		end

	is_err_entity_is_parameter: BOOLEAN
		do
			Result := (value=xml_err_entity_is_parameter)
		end

	is_err_unknown_encoding: BOOLEAN
		do
			Result := (value=xml_err_unknown_encoding)
		end

	is_err_unsupported_encoding: BOOLEAN
		do
			Result := (value=xml_err_unsupported_encoding)
		end

	is_err_string_not_started: BOOLEAN
		do
			Result := (value=xml_err_string_not_started)
		end

	is_err_string_not_closed: BOOLEAN
		do
			Result := (value=xml_err_string_not_closed)
		end

	is_err_ns_decl_error: BOOLEAN
		do
			Result := (value=xml_err_ns_decl_error)
		end

	is_err_entity_not_started: BOOLEAN
		do
			Result := (value=xml_err_entity_not_started)
		end

	is_err_entity_not_finished: BOOLEAN
		do
			Result := (value=xml_err_entity_not_finished)
		end

	is_err_lt_in_attribute: BOOLEAN
		do
			Result := (value=xml_err_lt_in_attribute)
		end

	is_err_attribute_not_started: BOOLEAN
		do
			Result := (value=xml_err_attribute_not_started)
		end

	is_err_attribute_not_finished: BOOLEAN
		do
			Result := (value=xml_err_attribute_not_finished)
		end

	is_err_attribute_without_value: BOOLEAN
		do
			Result := (value=xml_err_attribute_without_value)
		end

	is_err_attribute_redefined: BOOLEAN
		do
			Result := (value=xml_err_attribute_redefined)
		end

	is_err_literal_not_started: BOOLEAN
		do
			Result := (value=xml_err_literal_not_started)
		end

	is_err_literal_not_finished: BOOLEAN
		do
			Result := (value=xml_err_literal_not_finished)
		end

	is_err_comment_not_finished: BOOLEAN
		do
			Result := (value=xml_err_comment_not_finished)
		end

	is_err_pi_not_started: BOOLEAN
		do
			Result := (value=xml_err_pi_not_started)
		end

	is_err_pi_not_finished: BOOLEAN
		do
			Result := (value=xml_err_pi_not_finished)
		end

	is_err_notation_not_started: BOOLEAN
		do
			Result := (value=xml_err_notation_not_started)
		end

	is_err_notation_not_finished: BOOLEAN
		do
			Result := (value=xml_err_notation_not_finished)
		end

	is_err_attlist_not_started: BOOLEAN
		do
			Result := (value=xml_err_attlist_not_started)
		end

	is_err_attlist_not_finished: BOOLEAN
		do
			Result := (value=xml_err_attlist_not_finished)
		end

	is_err_mixed_not_started: BOOLEAN
		do
			Result := (value=xml_err_mixed_not_started)
		end

	is_err_mixed_not_finished: BOOLEAN
		do
			Result := (value=xml_err_mixed_not_finished)
		end

	is_err_elemcontent_not_started: BOOLEAN
		do
			Result := (value=xml_err_elemcontent_not_started)
		end

	is_err_elemcontent_not_finished: BOOLEAN
		do
			Result := (value=xml_err_elemcontent_not_finished)
		end

	is_err_xmldecl_not_started: BOOLEAN
		do
			Result := (value=xml_err_xmldecl_not_started)
		end

	is_err_xmldecl_not_finished: BOOLEAN
		do
			Result := (value=xml_err_xmldecl_not_finished)
		end

	is_err_condsec_not_started: BOOLEAN
		do
			Result := (value=xml_err_condsec_not_started)
		end

	is_err_condsec_not_finished: BOOLEAN
		do
			Result := (value=xml_err_condsec_not_finished)
		end

	is_err_ext_subset_not_finished: BOOLEAN
		do
			Result := (value=xml_err_ext_subset_not_finished)
		end

	is_err_doctype_not_finished: BOOLEAN
		do
			Result := (value=xml_err_doctype_not_finished)
		end

	is_err_misplaced_cdata_end: BOOLEAN
		do
			Result := (value=xml_err_misplaced_cdata_end)
		end

	is_err_cdata_not_finished: BOOLEAN
		do
			Result := (value=xml_err_cdata_not_finished)
		end

	is_err_reserved_xml_name: BOOLEAN
		do
			Result := (value=xml_err_reserved_xml_name)
		end

	is_err_space_required: BOOLEAN
		do
			Result := (value=xml_err_space_required)
		end

	is_err_separator_required: BOOLEAN
		do
			Result := (value=xml_err_separator_required)
		end

	is_err_nmtoken_required: BOOLEAN
		do
			Result := (value=xml_err_nmtoken_required)
		end

	is_err_name_required: BOOLEAN
		do
			Result := (value=xml_err_name_required)
		end

	is_err_pcdata_required: BOOLEAN
		do
			Result := (value=xml_err_pcdata_required)
		end

	is_err_uri_required: BOOLEAN
		do
			Result := (value=xml_err_uri_required)
		end

	is_err_pubid_required: BOOLEAN
		do
			Result := (value=xml_err_pubid_required)
		end

	is_err_lt_required: BOOLEAN
		do
			Result := (value=xml_err_lt_required)
		end

	is_err_gt_required: BOOLEAN
		do
			Result := (value=xml_err_gt_required)
		end

	is_err_ltslash_required: BOOLEAN
		do
			Result := (value=xml_err_ltslash_required)
		end

	is_err_equal_required: BOOLEAN
		do
			Result := (value=xml_err_equal_required)
		end

	is_err_tag_name_mismatch: BOOLEAN
		do
			Result := (value=xml_err_tag_name_mismatch)
		end

	is_err_tag_not_finished: BOOLEAN
		do
			Result := (value=xml_err_tag_not_finished)
		end

	is_err_standalone_value: BOOLEAN
		do
			Result := (value=xml_err_standalone_value)
		end

	is_err_encoding_name: BOOLEAN
		do
			Result := (value=xml_err_encoding_name)
		end

	is_err_hyphen_in_comment: BOOLEAN
		do
			Result := (value=xml_err_hyphen_in_comment)
		end

	is_err_invalid_encoding: BOOLEAN
		do
			Result := (value=xml_err_invalid_encoding)
		end

	is_err_ext_entity_standalone: BOOLEAN
		do
			Result := (value=xml_err_ext_entity_standalone)
		end

	is_err_condsec_invalid: BOOLEAN
		do
			Result := (value=xml_err_condsec_invalid)
		end

	is_err_value_required: BOOLEAN
		do
			Result := (value=xml_err_value_required)
		end

	is_err_not_well_balanced: BOOLEAN
		do
			Result := (value=xml_err_not_well_balanced)
		end

	is_err_extra_content: BOOLEAN
		do
			Result := (value=xml_err_extra_content)
		end

	is_err_entity_char_error: BOOLEAN
		do
			Result := (value=xml_err_entity_char_error)
		end

	is_err_entity_pe_internal: BOOLEAN
		do
			Result := (value=xml_err_entity_pe_internal)
		end

	is_err_entity_loop: BOOLEAN
		do
			Result := (value=xml_err_entity_loop)
		end

	is_err_entity_boundary: BOOLEAN
		do
			Result := (value=xml_err_entity_boundary)
		end

	is_err_invalid_uri: BOOLEAN
		do
			Result := (value=xml_err_invalid_uri)
		end

	is_err_uri_fragment: BOOLEAN
		do
			Result := (value=xml_err_uri_fragment)
		end

	is_war_catalog_pi: BOOLEAN
		do
			Result := (value=xml_war_catalog_pi)
		end

	is_err_no_dtd: BOOLEAN
		do
			Result := (value=xml_err_no_dtd)
		end

	is_err_condsec_invalid_keyword: BOOLEAN
		do
			Result := (value=xml_err_condsec_invalid_keyword)
		end

	is_err_version_missing: BOOLEAN
		do
			Result := (value=xml_err_version_missing)
		end

	is_war_unknown_version: BOOLEAN
		do
			Result := (value=xml_war_unknown_version)
		end

	is_war_lang_value: BOOLEAN
		do
			Result := (value=xml_war_lang_value)
		end

	is_war_ns_uri: BOOLEAN
		do
			Result := (value=xml_war_ns_uri)
		end

	is_war_ns_uri_relative: BOOLEAN
		do
			Result := (value=xml_war_ns_uri_relative)
		end

	is_err_missing_encoding: BOOLEAN
		do
			Result := (value=xml_err_missing_encoding)
		end

	is_war_space_value: BOOLEAN
		do
			Result := (value=xml_war_space_value)
		end

	is_err_not_standalone: BOOLEAN
		do
			Result := (value=xml_err_not_standalone)
		end

	is_err_entity_processing: BOOLEAN
		do
			Result := (value=xml_err_entity_processing)
		end

	is_err_notation_processing: BOOLEAN
		do
			Result := (value=xml_err_notation_processing)
		end

	is_war_ns_column: BOOLEAN
		do
			Result := (value=xml_war_ns_column)
		end

	is_war_entity_redefined: BOOLEAN
		do
			Result := (value=xml_war_entity_redefined)
		end

	is_ns_err_xml_namespace: BOOLEAN
		do
			Result := (value=xml_ns_err_xml_namespace)
		end

	is_ns_err_undefined_namespace: BOOLEAN
		do
			Result := (value=xml_ns_err_undefined_namespace)
		end

	is_ns_err_qname: BOOLEAN
		do
			Result := (value=xml_ns_err_qname)
		end

	is_ns_err_attribute_redefined: BOOLEAN
		do
			Result := (value=xml_ns_err_attribute_redefined)
		end

	is_ns_err_empty: BOOLEAN
		do
			Result := (value=xml_ns_err_empty)
		end

	is_dtd_attribute_default: BOOLEAN
		do
			Result := (value=xml_dtd_attribute_default)
		end

	is_dtd_attribute_redefined: BOOLEAN
		do
			Result := (value=xml_dtd_attribute_redefined)
		end

	is_dtd_attribute_value: BOOLEAN
		do
			Result := (value=xml_dtd_attribute_value)
		end

	is_dtd_content_error: BOOLEAN
		do
			Result := (value=xml_dtd_content_error)
		end

	is_dtd_content_model: BOOLEAN
		do
			Result := (value=xml_dtd_content_model)
		end

	is_dtd_content_not_determinist: BOOLEAN
		do
			Result := (value=xml_dtd_content_not_determinist)
		end

	is_dtd_different_prefix: BOOLEAN
		do
			Result := (value=xml_dtd_different_prefix)
		end

	is_dtd_elem_default_namespace: BOOLEAN
		do
			Result := (value=xml_dtd_elem_default_namespace)
		end

	is_dtd_elem_namespace: BOOLEAN
		do
			Result := (value=xml_dtd_elem_namespace)
		end

	is_dtd_elem_redefined: BOOLEAN
		do
			Result := (value=xml_dtd_elem_redefined)
		end

	is_dtd_empty_notation: BOOLEAN
		do
			Result := (value=xml_dtd_empty_notation)
		end

	is_dtd_entity_type: BOOLEAN
		do
			Result := (value=xml_dtd_entity_type)
		end

	is_dtd_id_fixed: BOOLEAN
		do
			Result := (value=xml_dtd_id_fixed)
		end

	is_dtd_id_redefined: BOOLEAN
		do
			Result := (value=xml_dtd_id_redefined)
		end

	is_dtd_id_subset: BOOLEAN
		do
			Result := (value=xml_dtd_id_subset)
		end

	is_dtd_invalid_child: BOOLEAN
		do
			Result := (value=xml_dtd_invalid_child)
		end

	is_dtd_invalid_default: BOOLEAN
		do
			Result := (value=xml_dtd_invalid_default)
		end

	is_dtd_load_error: BOOLEAN
		do
			Result := (value=xml_dtd_load_error)
		end

	is_dtd_missing_attribute: BOOLEAN
		do
			Result := (value=xml_dtd_missing_attribute)
		end

	is_dtd_mixed_corrupt: BOOLEAN
		do
			Result := (value=xml_dtd_mixed_corrupt)
		end

	is_dtd_multiple_id: BOOLEAN
		do
			Result := (value=xml_dtd_multiple_id)
		end

	is_dtd_no_doc: BOOLEAN
		do
			Result := (value=xml_dtd_no_doc)
		end

	is_dtd_no_dtd: BOOLEAN
		do
			Result := (value=xml_dtd_no_dtd)
		end

	is_dtd_no_elem_name: BOOLEAN
		do
			Result := (value=xml_dtd_no_elem_name)
		end

	is_dtd_no_prefix: BOOLEAN
		do
			Result := (value=xml_dtd_no_prefix)
		end

	is_dtd_no_root: BOOLEAN
		do
			Result := (value=xml_dtd_no_root)
		end

	is_dtd_notation_redefined: BOOLEAN
		do
			Result := (value=xml_dtd_notation_redefined)
		end

	is_dtd_notation_value: BOOLEAN
		do
			Result := (value=xml_dtd_notation_value)
		end

	is_dtd_not_empty: BOOLEAN
		do
			Result := (value=xml_dtd_not_empty)
		end

	is_dtd_not_pcdata: BOOLEAN
		do
			Result := (value=xml_dtd_not_pcdata)
		end

	is_dtd_not_standalone: BOOLEAN
		do
			Result := (value=xml_dtd_not_standalone)
		end

	is_dtd_root_name: BOOLEAN
		do
			Result := (value=xml_dtd_root_name)
		end

	is_dtd_standalone_white_space: BOOLEAN
		do
			Result := (value=xml_dtd_standalone_white_space)
		end

	is_dtd_unknown_attribute: BOOLEAN
		do
			Result := (value=xml_dtd_unknown_attribute)
		end

	is_dtd_unknown_elem: BOOLEAN
		do
			Result := (value=xml_dtd_unknown_elem)
		end

	is_dtd_unknown_entity: BOOLEAN
		do
			Result := (value=xml_dtd_unknown_entity)
		end

	is_dtd_unknown_id: BOOLEAN
		do
			Result := (value=xml_dtd_unknown_id)
		end

	is_dtd_unknown_notation: BOOLEAN
		do
			Result := (value=xml_dtd_unknown_notation)
		end

	is_dtd_standalone_defaulted: BOOLEAN
		do
			Result := (value=xml_dtd_standalone_defaulted)
		end

	is_dtd_xmlid_value: BOOLEAN
		do
			Result := (value=xml_dtd_xmlid_value)
		end

	is_dtd_xmlid_type: BOOLEAN
		do
			Result := (value=xml_dtd_xmlid_type)
		end

	is_html_strucure_error: BOOLEAN
		do
			Result := (value=xml_html_strucure_error)
		end

	is_html_unknown_tag: BOOLEAN
		do
			Result := (value=xml_html_unknown_tag)
		end

	is_rngp_anyname_attr_ancestor: BOOLEAN
		do
			Result := (value=xml_rngp_anyname_attr_ancestor)
		end

	is_rngp_attr_conflict: BOOLEAN
		do
			Result := (value=xml_rngp_attr_conflict)
		end

	is_rngp_attribute_children: BOOLEAN
		do
			Result := (value=xml_rngp_attribute_children)
		end

	is_rngp_attribute_content: BOOLEAN
		do
			Result := (value=xml_rngp_attribute_content)
		end

	is_rngp_attribute_empty: BOOLEAN
		do
			Result := (value=xml_rngp_attribute_empty)
		end

	is_rngp_attribute_noop: BOOLEAN
		do
			Result := (value=xml_rngp_attribute_noop)
		end

	is_rngp_choice_content: BOOLEAN
		do
			Result := (value=xml_rngp_choice_content)
		end

	is_rngp_choice_empty: BOOLEAN
		do
			Result := (value=xml_rngp_choice_empty)
		end

	is_rngp_create_failure: BOOLEAN
		do
			Result := (value=xml_rngp_create_failure)
		end

	is_rngp_data_content: BOOLEAN
		do
			Result := (value=xml_rngp_data_content)
		end

	is_rngp_def_choice_and_interleave: BOOLEAN
		do
			Result := (value=xml_rngp_def_choice_and_interleave)
		end

	is_rngp_define_create_failed: BOOLEAN
		do
			Result := (value=xml_rngp_define_create_failed)
		end

	is_rngp_define_empty: BOOLEAN
		do
			Result := (value=xml_rngp_define_empty)
		end

	is_rngp_define_missing: BOOLEAN
		do
			Result := (value=xml_rngp_define_missing)
		end

	is_rngp_define_name_missing: BOOLEAN
		do
			Result := (value=xml_rngp_define_name_missing)
		end

	is_rngp_elem_content_empty: BOOLEAN
		do
			Result := (value=xml_rngp_elem_content_empty)
		end

	is_rngp_elem_content_error: BOOLEAN
		do
			Result := (value=xml_rngp_elem_content_error)
		end

	is_rngp_element_empty: BOOLEAN
		do
			Result := (value=xml_rngp_element_empty)
		end

	is_rngp_element_content: BOOLEAN
		do
			Result := (value=xml_rngp_element_content)
		end

	is_rngp_element_name: BOOLEAN
		do
			Result := (value=xml_rngp_element_name)
		end

	is_rngp_element_no_content: BOOLEAN
		do
			Result := (value=xml_rngp_element_no_content)
		end

	is_rngp_elem_text_conflict: BOOLEAN
		do
			Result := (value=xml_rngp_elem_text_conflict)
		end

	is_rngp_empty: BOOLEAN
		do
			Result := (value=xml_rngp_empty)
		end

	is_rngp_empty_construct: BOOLEAN
		do
			Result := (value=xml_rngp_empty_construct)
		end

	is_rngp_empty_content: BOOLEAN
		do
			Result := (value=xml_rngp_empty_content)
		end

	is_rngp_empty_not_empty: BOOLEAN
		do
			Result := (value=xml_rngp_empty_not_empty)
		end

	is_rngp_error_type_lib: BOOLEAN
		do
			Result := (value=xml_rngp_error_type_lib)
		end

	is_rngp_except_empty: BOOLEAN
		do
			Result := (value=xml_rngp_except_empty)
		end

	is_rngp_except_missing: BOOLEAN
		do
			Result := (value=xml_rngp_except_missing)
		end

	is_rngp_except_multiple: BOOLEAN
		do
			Result := (value=xml_rngp_except_multiple)
		end

	is_rngp_except_no_content: BOOLEAN
		do
			Result := (value=xml_rngp_except_no_content)
		end

	is_rngp_externalref_emtpy: BOOLEAN
		do
			Result := (value=xml_rngp_externalref_emtpy)
		end

	is_rngp_external_ref_failure: BOOLEAN
		do
			Result := (value=xml_rngp_external_ref_failure)
		end

	is_rngp_externalref_recurse: BOOLEAN
		do
			Result := (value=xml_rngp_externalref_recurse)
		end

	is_rngp_forbidden_attribute: BOOLEAN
		do
			Result := (value=xml_rngp_forbidden_attribute)
		end

	is_rngp_foreign_element: BOOLEAN
		do
			Result := (value=xml_rngp_foreign_element)
		end

	is_rngp_grammar_content: BOOLEAN
		do
			Result := (value=xml_rngp_grammar_content)
		end

	is_rngp_grammar_empty: BOOLEAN
		do
			Result := (value=xml_rngp_grammar_empty)
		end

	is_rngp_grammar_missing: BOOLEAN
		do
			Result := (value=xml_rngp_grammar_missing)
		end

	is_rngp_grammar_no_start: BOOLEAN
		do
			Result := (value=xml_rngp_grammar_no_start)
		end

	is_rngp_group_attr_conflict: BOOLEAN
		do
			Result := (value=xml_rngp_group_attr_conflict)
		end

	is_rngp_href_error: BOOLEAN
		do
			Result := (value=xml_rngp_href_error)
		end

	is_rngp_include_empty: BOOLEAN
		do
			Result := (value=xml_rngp_include_empty)
		end

	is_rngp_include_failure: BOOLEAN
		do
			Result := (value=xml_rngp_include_failure)
		end

	is_rngp_include_recurse: BOOLEAN
		do
			Result := (value=xml_rngp_include_recurse)
		end

	is_rngp_interleave_add: BOOLEAN
		do
			Result := (value=xml_rngp_interleave_add)
		end

	is_rngp_interleave_create_failed: BOOLEAN
		do
			Result := (value=xml_rngp_interleave_create_failed)
		end

	is_rngp_interleave_empty: BOOLEAN
		do
			Result := (value=xml_rngp_interleave_empty)
		end

	is_rngp_interleave_no_content: BOOLEAN
		do
			Result := (value=xml_rngp_interleave_no_content)
		end

	is_rngp_invalid_define_name: BOOLEAN
		do
			Result := (value=xml_rngp_invalid_define_name)
		end

	is_rngp_invalid_uri: BOOLEAN
		do
			Result := (value=xml_rngp_invalid_uri)
		end

	is_rngp_invalid_value: BOOLEAN
		do
			Result := (value=xml_rngp_invalid_value)
		end

	is_rngp_missing_href: BOOLEAN
		do
			Result := (value=xml_rngp_missing_href)
		end

	is_rngp_name_missing: BOOLEAN
		do
			Result := (value=xml_rngp_name_missing)
		end

	is_rngp_need_combine: BOOLEAN
		do
			Result := (value=xml_rngp_need_combine)
		end

	is_rngp_notallowed_not_empty: BOOLEAN
		do
			Result := (value=xml_rngp_notallowed_not_empty)
		end

	is_rngp_nsname_attr_ancestor: BOOLEAN
		do
			Result := (value=xml_rngp_nsname_attr_ancestor)
		end

	is_rngp_nsname_no_ns: BOOLEAN
		do
			Result := (value=xml_rngp_nsname_no_ns)
		end

	is_rngp_param_forbidden: BOOLEAN
		do
			Result := (value=xml_rngp_param_forbidden)
		end

	is_rngp_param_name_missing: BOOLEAN
		do
			Result := (value=xml_rngp_param_name_missing)
		end

	is_rngp_parentref_create_failed: BOOLEAN
		do
			Result := (value=xml_rngp_parentref_create_failed)
		end

	is_rngp_parentref_name_invalid: BOOLEAN
		do
			Result := (value=xml_rngp_parentref_name_invalid)
		end

	is_rngp_parentref_no_name: BOOLEAN
		do
			Result := (value=xml_rngp_parentref_no_name)
		end

	is_rngp_parentref_no_parent: BOOLEAN
		do
			Result := (value=xml_rngp_parentref_no_parent)
		end

	is_rngp_parentref_not_empty: BOOLEAN
		do
			Result := (value=xml_rngp_parentref_not_empty)
		end

	is_rngp_parse_error: BOOLEAN
		do
			Result := (value=xml_rngp_parse_error)
		end

	is_rngp_pat_anyname_except_anyname: BOOLEAN
		do
			Result := (value=xml_rngp_pat_anyname_except_anyname)
		end

	is_rngp_pat_attr_attr: BOOLEAN
		do
			Result := (value=xml_rngp_pat_attr_attr)
		end

	is_rngp_pat_attr_elem: BOOLEAN
		do
			Result := (value=xml_rngp_pat_attr_elem)
		end

	is_rngp_pat_data_except_attr: BOOLEAN
		do
			Result := (value=xml_rngp_pat_data_except_attr)
		end

	is_rngp_pat_data_except_elem: BOOLEAN
		do
			Result := (value=xml_rngp_pat_data_except_elem)
		end

	is_rngp_pat_data_except_empty: BOOLEAN
		do
			Result := (value=xml_rngp_pat_data_except_empty)
		end

	is_rngp_pat_data_except_group: BOOLEAN
		do
			Result := (value=xml_rngp_pat_data_except_group)
		end

	is_rngp_pat_data_except_interleave: BOOLEAN
		do
			Result := (value=xml_rngp_pat_data_except_interleave)
		end

	is_rngp_pat_data_except_list: BOOLEAN
		do
			Result := (value=xml_rngp_pat_data_except_list)
		end

	is_rngp_pat_data_except_onemore: BOOLEAN
		do
			Result := (value=xml_rngp_pat_data_except_onemore)
		end

	is_rngp_pat_data_except_ref: BOOLEAN
		do
			Result := (value=xml_rngp_pat_data_except_ref)
		end

	is_rngp_pat_data_except_text: BOOLEAN
		do
			Result := (value=xml_rngp_pat_data_except_text)
		end

	is_rngp_pat_list_attr: BOOLEAN
		do
			Result := (value=xml_rngp_pat_list_attr)
		end

	is_rngp_pat_list_elem: BOOLEAN
		do
			Result := (value=xml_rngp_pat_list_elem)
		end

	is_rngp_pat_list_interleave: BOOLEAN
		do
			Result := (value=xml_rngp_pat_list_interleave)
		end

	is_rngp_pat_list_list: BOOLEAN
		do
			Result := (value=xml_rngp_pat_list_list)
		end

	is_rngp_pat_list_ref: BOOLEAN
		do
			Result := (value=xml_rngp_pat_list_ref)
		end

	is_rngp_pat_list_text: BOOLEAN
		do
			Result := (value=xml_rngp_pat_list_text)
		end

	is_rngp_pat_nsname_except_anyname: BOOLEAN
		do
			Result := (value=xml_rngp_pat_nsname_except_anyname)
		end

	is_rngp_pat_nsname_except_nsname: BOOLEAN
		do
			Result := (value=xml_rngp_pat_nsname_except_nsname)
		end

	is_rngp_pat_onemore_group_attr: BOOLEAN
		do
			Result := (value=xml_rngp_pat_onemore_group_attr)
		end

	is_rngp_pat_onemore_interleave_attr: BOOLEAN
		do
			Result := (value=xml_rngp_pat_onemore_interleave_attr)
		end

	is_rngp_pat_start_attr: BOOLEAN
		do
			Result := (value=xml_rngp_pat_start_attr)
		end

	is_rngp_pat_start_data: BOOLEAN
		do
			Result := (value=xml_rngp_pat_start_data)
		end

	is_rngp_pat_start_empty: BOOLEAN
		do
			Result := (value=xml_rngp_pat_start_empty)
		end

	is_rngp_pat_start_group: BOOLEAN
		do
			Result := (value=xml_rngp_pat_start_group)
		end

	is_rngp_pat_start_interleave: BOOLEAN
		do
			Result := (value=xml_rngp_pat_start_interleave)
		end

	is_rngp_pat_start_list: BOOLEAN
		do
			Result := (value=xml_rngp_pat_start_list)
		end

	is_rngp_pat_start_onemore: BOOLEAN
		do
			Result := (value=xml_rngp_pat_start_onemore)
		end

	is_rngp_pat_start_text: BOOLEAN
		do
			Result := (value=xml_rngp_pat_start_text)
		end

	is_rngp_pat_start_value: BOOLEAN
		do
			Result := (value=xml_rngp_pat_start_value)
		end

	is_rngp_prefix_undefined: BOOLEAN
		do
			Result := (value=xml_rngp_prefix_undefined)
		end

	is_rngp_ref_create_failed: BOOLEAN
		do
			Result := (value=xml_rngp_ref_create_failed)
		end

	is_rngp_ref_cycle: BOOLEAN
		do
			Result := (value=xml_rngp_ref_cycle)
		end

	is_rngp_ref_name_invalid: BOOLEAN
		do
			Result := (value=xml_rngp_ref_name_invalid)
		end

	is_rngp_ref_no_def: BOOLEAN
		do
			Result := (value=xml_rngp_ref_no_def)
		end

	is_rngp_ref_no_name: BOOLEAN
		do
			Result := (value=xml_rngp_ref_no_name)
		end

	is_rngp_ref_not_empty: BOOLEAN
		do
			Result := (value=xml_rngp_ref_not_empty)
		end

	is_rngp_start_choice_and_interleave: BOOLEAN
		do
			Result := (value=xml_rngp_start_choice_and_interleave)
		end

	is_rngp_start_content: BOOLEAN
		do
			Result := (value=xml_rngp_start_content)
		end

	is_rngp_start_empty: BOOLEAN
		do
			Result := (value=xml_rngp_start_empty)
		end

	is_rngp_start_missing: BOOLEAN
		do
			Result := (value=xml_rngp_start_missing)
		end

	is_rngp_text_expected: BOOLEAN
		do
			Result := (value=xml_rngp_text_expected)
		end

	is_rngp_text_has_child: BOOLEAN
		do
			Result := (value=xml_rngp_text_has_child)
		end

	is_rngp_type_missing: BOOLEAN
		do
			Result := (value=xml_rngp_type_missing)
		end

	is_rngp_type_not_found: BOOLEAN
		do
			Result := (value=xml_rngp_type_not_found)
		end

	is_rngp_type_value: BOOLEAN
		do
			Result := (value=xml_rngp_type_value)
		end

	is_rngp_unknown_attribute: BOOLEAN
		do
			Result := (value=xml_rngp_unknown_attribute)
		end

	is_rngp_unknown_combine: BOOLEAN
		do
			Result := (value=xml_rngp_unknown_combine)
		end

	is_rngp_unknown_construct: BOOLEAN
		do
			Result := (value=xml_rngp_unknown_construct)
		end

	is_rngp_unknown_type_lib: BOOLEAN
		do
			Result := (value=xml_rngp_unknown_type_lib)
		end

	is_rngp_uri_fragment: BOOLEAN
		do
			Result := (value=xml_rngp_uri_fragment)
		end

	is_rngp_uri_not_absolute: BOOLEAN
		do
			Result := (value=xml_rngp_uri_not_absolute)
		end

	is_rngp_value_empty: BOOLEAN
		do
			Result := (value=xml_rngp_value_empty)
		end

	is_rngp_value_no_content: BOOLEAN
		do
			Result := (value=xml_rngp_value_no_content)
		end

	is_rngp_xmlns_name: BOOLEAN
		do
			Result := (value=xml_rngp_xmlns_name)
		end

	is_rngp_xml_ns: BOOLEAN
		do
			Result := (value=xml_rngp_xml_ns)
		end

	is_xpath_expression_ok: BOOLEAN
		do
			Result := (value=xml_xpath_expression_ok)
		end

	is_xpath_number_error: BOOLEAN
		do
			Result := (value=xml_xpath_number_error)
		end

	is_xpath_unfinished_literal_error: BOOLEAN
		do
			Result := (value=xml_xpath_unfinished_literal_error)
		end

	is_xpath_start_literal_error: BOOLEAN
		do
			Result := (value=xml_xpath_start_literal_error)
		end

	is_xpath_variable_ref_error: BOOLEAN
		do
			Result := (value=xml_xpath_variable_ref_error)
		end

	is_xpath_undef_variable_error: BOOLEAN
		do
			Result := (value=xml_xpath_undef_variable_error)
		end

	is_xpath_invalid_predicate_error: BOOLEAN
		do
			Result := (value=xml_xpath_invalid_predicate_error)
		end

	is_xpath_expr_error: BOOLEAN
		do
			Result := (value=xml_xpath_expr_error)
		end

	is_xpath_unclosed_error: BOOLEAN
		do
			Result := (value=xml_xpath_unclosed_error)
		end

	is_xpath_unknown_func_error: BOOLEAN
		do
			Result := (value=xml_xpath_unknown_func_error)
		end

	is_xpath_invalid_operand: BOOLEAN
		do
			Result := (value=xml_xpath_invalid_operand)
		end

	is_xpath_invalid_type: BOOLEAN
		do
			Result := (value=xml_xpath_invalid_type)
		end

	is_xpath_invalid_arity: BOOLEAN
		do
			Result := (value=xml_xpath_invalid_arity)
		end

	is_xpath_invalid_ctxt_size: BOOLEAN
		do
			Result := (value=xml_xpath_invalid_ctxt_size)
		end

	is_xpath_invalid_ctxt_position: BOOLEAN
		do
			Result := (value=xml_xpath_invalid_ctxt_position)
		end

	is_xpath_memory_error: BOOLEAN
		do
			Result := (value=xml_xpath_memory_error)
		end

	is_xptr_syntax_error: BOOLEAN
		do
			Result := (value=xml_xptr_syntax_error)
		end

	is_xptr_resource_error: BOOLEAN
		do
			Result := (value=xml_xptr_resource_error)
		end

	is_xptr_sub_resource_error: BOOLEAN
		do
			Result := (value=xml_xptr_sub_resource_error)
		end

	is_xpath_undef_prefix_error: BOOLEAN
		do
			Result := (value=xml_xpath_undef_prefix_error)
		end

	is_xpath_encoding_error: BOOLEAN
		do
			Result := (value=xml_xpath_encoding_error)
		end

	is_xpath_invalid_char_error: BOOLEAN
		do
			Result := (value=xml_xpath_invalid_char_error)
		end

	is_tree_invalid_hex: BOOLEAN
		do
			Result := (value=xml_tree_invalid_hex)
		end

	is_tree_invalid_dec: BOOLEAN
		do
			Result := (value=xml_tree_invalid_dec)
		end

	is_tree_unterminated_entity: BOOLEAN
		do
			Result := (value=xml_tree_unterminated_entity)
		end

	is_save_not_utf8: BOOLEAN
		do
			Result := (value=xml_save_not_utf8)
		end

	is_save_char_invalid: BOOLEAN
		do
			Result := (value=xml_save_char_invalid)
		end

	is_save_no_doctype: BOOLEAN
		do
			Result := (value=xml_save_no_doctype)
		end

	is_save_unknown_encoding: BOOLEAN
		do
			Result := (value=xml_save_unknown_encoding)
		end

	is_regexp_compile_error: BOOLEAN
		do
			Result := (value=xml_regexp_compile_error)
		end

	is_io_unknown: BOOLEAN
		do
			Result := (value=xml_io_unknown)
		end

	is_io_eacces: BOOLEAN
		do
			Result := (value=xml_io_eacces)
		end

	is_io_eagain: BOOLEAN
		do
			Result := (value=xml_io_eagain)
		end

	is_io_ebadf: BOOLEAN
		do
			Result := (value=xml_io_ebadf)
		end

	is_io_ebadmsg: BOOLEAN
		do
			Result := (value=xml_io_ebadmsg)
		end

	is_io_ebusy: BOOLEAN
		do
			Result := (value=xml_io_ebusy)
		end

	is_io_ecanceled: BOOLEAN
		do
			Result := (value=xml_io_ecanceled)
		end

	is_io_echild: BOOLEAN
		do
			Result := (value=xml_io_echild)
		end

	is_io_edeadlk: BOOLEAN
		do
			Result := (value=xml_io_edeadlk)
		end

	is_io_edom: BOOLEAN
		do
			Result := (value=xml_io_edom)
		end

	is_io_eexist: BOOLEAN
		do
			Result := (value=xml_io_eexist)
		end

	is_io_efault: BOOLEAN
		do
			Result := (value=xml_io_efault)
		end

	is_io_efbig: BOOLEAN
		do
			Result := (value=xml_io_efbig)
		end

	is_io_einprogress: BOOLEAN
		do
			Result := (value=xml_io_einprogress)
		end

	is_io_eintr: BOOLEAN
		do
			Result := (value=xml_io_eintr)
		end

	is_io_einval: BOOLEAN
		do
			Result := (value=xml_io_einval)
		end

	is_io_eio: BOOLEAN
		do
			Result := (value=xml_io_eio)
		end

	is_io_eisdir: BOOLEAN
		do
			Result := (value=xml_io_eisdir)
		end

	is_io_emfile: BOOLEAN
		do
			Result := (value=xml_io_emfile)
		end

	is_io_emlink: BOOLEAN
		do
			Result := (value=xml_io_emlink)
		end

	is_io_emsgsize: BOOLEAN
		do
			Result := (value=xml_io_emsgsize)
		end

	is_io_enametoolong: BOOLEAN
		do
			Result := (value=xml_io_enametoolong)
		end

	is_io_enfile: BOOLEAN
		do
			Result := (value=xml_io_enfile)
		end

	is_io_enodev: BOOLEAN
		do
			Result := (value=xml_io_enodev)
		end

	is_io_enoent: BOOLEAN
		do
			Result := (value=xml_io_enoent)
		end

	is_io_enoexec: BOOLEAN
		do
			Result := (value=xml_io_enoexec)
		end

	is_io_enolck: BOOLEAN
		do
			Result := (value=xml_io_enolck)
		end

	is_io_enomem: BOOLEAN
		do
			Result := (value=xml_io_enomem)
		end

	is_io_enospc: BOOLEAN
		do
			Result := (value=xml_io_enospc)
		end

	is_io_enosys: BOOLEAN
		do
			Result := (value=xml_io_enosys)
		end

	is_io_enotdir: BOOLEAN
		do
			Result := (value=xml_io_enotdir)
		end

	is_io_enotempty: BOOLEAN
		do
			Result := (value=xml_io_enotempty)
		end

	is_io_enotsup: BOOLEAN
		do
			Result := (value=xml_io_enotsup)
		end

	is_io_enotty: BOOLEAN
		do
			Result := (value=xml_io_enotty)
		end

	is_io_enxio: BOOLEAN
		do
			Result := (value=xml_io_enxio)
		end

	is_io_eperm: BOOLEAN
		do
			Result := (value=xml_io_eperm)
		end

	is_io_epipe: BOOLEAN
		do
			Result := (value=xml_io_epipe)
		end

	is_io_erange: BOOLEAN
		do
			Result := (value=xml_io_erange)
		end

	is_io_erofs: BOOLEAN
		do
			Result := (value=xml_io_erofs)
		end

	is_io_espipe: BOOLEAN
		do
			Result := (value=xml_io_espipe)
		end

	is_io_esrch: BOOLEAN
		do
			Result := (value=xml_io_esrch)
		end

	is_io_etimedout: BOOLEAN
		do
			Result := (value=xml_io_etimedout)
		end

	is_io_exdev: BOOLEAN
		do
			Result := (value=xml_io_exdev)
		end

	is_io_network_attempt: BOOLEAN
		do
			Result := (value=xml_io_network_attempt)
		end

	is_io_encoder: BOOLEAN
		do
			Result := (value=xml_io_encoder)
		end

	is_io_flush: BOOLEAN
		do
			Result := (value=xml_io_flush)
		end

	is_io_write: BOOLEAN
		do
			Result := (value=xml_io_write)
		end

	is_io_no_input: BOOLEAN
		do
			Result := (value=xml_io_no_input)
		end

	is_io_buffer_full: BOOLEAN
		do
			Result := (value=xml_io_buffer_full)
		end

	is_io_load_error: BOOLEAN
		do
			Result := (value=xml_io_load_error)
		end

	is_io_enotsock: BOOLEAN
		do
			Result := (value=xml_io_enotsock)
		end

	is_io_eisconn: BOOLEAN
		do
			Result := (value=xml_io_eisconn)
		end

	is_io_econnrefused: BOOLEAN
		do
			Result := (value=xml_io_econnrefused)
		end

	is_io_enetunreach: BOOLEAN
		do
			Result := (value=xml_io_enetunreach)
		end

	is_io_eaddrinuse: BOOLEAN
		do
			Result := (value=xml_io_eaddrinuse)
		end

	is_io_ealready: BOOLEAN
		do
			Result := (value=xml_io_ealready)
		end

	is_io_eafnosupport: BOOLEAN
		do
			Result := (value=xml_io_eafnosupport)
		end

	is_xinclude_recursion: BOOLEAN
		do
			Result := (value=xml_xinclude_recursion)
		end

	is_xinclude_parse_value: BOOLEAN
		do
			Result := (value=xml_xinclude_parse_value)
		end

	is_xinclude_entity_def_mismatch: BOOLEAN
		do
			Result := (value=xml_xinclude_entity_def_mismatch)
		end

	is_xinclude_no_href: BOOLEAN
		do
			Result := (value=xml_xinclude_no_href)
		end

	is_xinclude_no_fallback: BOOLEAN
		do
			Result := (value=xml_xinclude_no_fallback)
		end

	is_xinclude_href_uri: BOOLEAN
		do
			Result := (value=xml_xinclude_href_uri)
		end

	is_xinclude_text_fragment: BOOLEAN
		do
			Result := (value=xml_xinclude_text_fragment)
		end

	is_xinclude_text_document: BOOLEAN
		do
			Result := (value=xml_xinclude_text_document)
		end

	is_xinclude_invalid_char: BOOLEAN
		do
			Result := (value=xml_xinclude_invalid_char)
		end

	is_xinclude_build_failed: BOOLEAN
		do
			Result := (value=xml_xinclude_build_failed)
		end

	is_xinclude_unknown_encoding: BOOLEAN
		do
			Result := (value=xml_xinclude_unknown_encoding)
		end

	is_xinclude_multiple_root: BOOLEAN
		do
			Result := (value=xml_xinclude_multiple_root)
		end

	is_xinclude_xptr_failed: BOOLEAN
		do
			Result := (value=xml_xinclude_xptr_failed)
		end

	is_xinclude_xptr_result: BOOLEAN
		do
			Result := (value=xml_xinclude_xptr_result)
		end

	is_xinclude_include_in_include: BOOLEAN
		do
			Result := (value=xml_xinclude_include_in_include)
		end

	is_xinclude_fallbacks_in_include: BOOLEAN
		do
			Result := (value=xml_xinclude_fallbacks_in_include)
		end

	is_xinclude_fallback_not_in_include: BOOLEAN
		do
			Result := (value=xml_xinclude_fallback_not_in_include)
		end

	is_xinclude_deprecated_ns: BOOLEAN
		do
			Result := (value=xml_xinclude_deprecated_ns)
		end

	is_xinclude_fragment_id: BOOLEAN
		do
			Result := (value=xml_xinclude_fragment_id)
		end

	is_catalog_missing_attr: BOOLEAN
		do
			Result := (value=xml_catalog_missing_attr)
		end

	is_catalog_entry_broken: BOOLEAN
		do
			Result := (value=xml_catalog_entry_broken)
		end

	is_catalog_prefer_value: BOOLEAN
		do
			Result := (value=xml_catalog_prefer_value)
		end

	is_catalog_not_catalog: BOOLEAN
		do
			Result := (value=xml_catalog_not_catalog)
		end

	is_catalog_recursion: BOOLEAN
		do
			Result := (value=xml_catalog_recursion)
		end

	is_schemap_prefix_undefined: BOOLEAN
		do
			Result := (value=xml_schemap_prefix_undefined)
		end

	is_schemap_attrformdefault_value: BOOLEAN
		do
			Result := (value=xml_schemap_attrformdefault_value)
		end

	is_schemap_attrgrp_noname_noref: BOOLEAN
		do
			Result := (value=xml_schemap_attrgrp_noname_noref)
		end

	is_schemap_attr_noname_noref: BOOLEAN
		do
			Result := (value=xml_schemap_attr_noname_noref)
		end

	is_schemap_complextype_noname_noref: BOOLEAN
		do
			Result := (value=xml_schemap_complextype_noname_noref)
		end

	is_schemap_elemformdefault_value: BOOLEAN
		do
			Result := (value=xml_schemap_elemformdefault_value)
		end

	is_schemap_elem_noname_noref: BOOLEAN
		do
			Result := (value=xml_schemap_elem_noname_noref)
		end

	is_schemap_extension_no_base: BOOLEAN
		do
			Result := (value=xml_schemap_extension_no_base)
		end

	is_schemap_facet_no_value: BOOLEAN
		do
			Result := (value=xml_schemap_facet_no_value)
		end

	is_schemap_failed_build_import: BOOLEAN
		do
			Result := (value=xml_schemap_failed_build_import)
		end

	is_schemap_group_noname_noref: BOOLEAN
		do
			Result := (value=xml_schemap_group_noname_noref)
		end

	is_schemap_import_namespace_not_uri: BOOLEAN
		do
			Result := (value=xml_schemap_import_namespace_not_uri)
		end

	is_schemap_import_redefine_nsname: BOOLEAN
		do
			Result := (value=xml_schemap_import_redefine_nsname)
		end

	is_schemap_import_schema_not_uri: BOOLEAN
		do
			Result := (value=xml_schemap_import_schema_not_uri)
		end

	is_schemap_invalid_boolean: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_boolean)
		end

	is_schemap_invalid_enum: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_enum)
		end

	is_schemap_invalid_facet: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_facet)
		end

	is_schemap_invalid_facet_value: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_facet_value)
		end

	is_schemap_invalid_maxoccurs: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_maxoccurs)
		end

	is_schemap_invalid_minoccurs: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_minoccurs)
		end

	is_schemap_invalid_ref_and_subtype: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_ref_and_subtype)
		end

	is_schemap_invalid_white_space: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_white_space)
		end

	is_schemap_noattr_noref: BOOLEAN
		do
			Result := (value=xml_schemap_noattr_noref)
		end

	is_schemap_notation_no_name: BOOLEAN
		do
			Result := (value=xml_schemap_notation_no_name)
		end

	is_schemap_notype_noref: BOOLEAN
		do
			Result := (value=xml_schemap_notype_noref)
		end

	is_schemap_ref_and_subtype: BOOLEAN
		do
			Result := (value=xml_schemap_ref_and_subtype)
		end

	is_schemap_restriction_noname_noref: BOOLEAN
		do
			Result := (value=xml_schemap_restriction_noname_noref)
		end

	is_schemap_simpletype_noname: BOOLEAN
		do
			Result := (value=xml_schemap_simpletype_noname)
		end

	is_schemap_type_and_subtype: BOOLEAN
		do
			Result := (value=xml_schemap_type_and_subtype)
		end

	is_schemap_unknown_all_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_all_child)
		end

	is_schemap_unknown_anyattribute_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_anyattribute_child)
		end

	is_schemap_unknown_attr_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_attr_child)
		end

	is_schemap_unknown_attrgrp_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_attrgrp_child)
		end

	is_schemap_unknown_attribute_group: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_attribute_group)
		end

	is_schemap_unknown_base_type: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_base_type)
		end

	is_schemap_unknown_choice_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_choice_child)
		end

	is_schemap_unknown_complexcontent_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_complexcontent_child)
		end

	is_schemap_unknown_complextype_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_complextype_child)
		end

	is_schemap_unknown_elem_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_elem_child)
		end

	is_schemap_unknown_extension_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_extension_child)
		end

	is_schemap_unknown_facet_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_facet_child)
		end

	is_schemap_unknown_facet_type: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_facet_type)
		end

	is_schemap_unknown_group_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_group_child)
		end

	is_schemap_unknown_import_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_import_child)
		end

	is_schemap_unknown_list_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_list_child)
		end

	is_schemap_unknown_notation_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_notation_child)
		end

	is_schemap_unknown_processcontent_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_processcontent_child)
		end

	is_schemap_unknown_ref: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_ref)
		end

	is_schemap_unknown_restriction_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_restriction_child)
		end

	is_schemap_unknown_schemas_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_schemas_child)
		end

	is_schemap_unknown_sequence_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_sequence_child)
		end

	is_schemap_unknown_simplecontent_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_simplecontent_child)
		end

	is_schemap_unknown_simpletype_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_simpletype_child)
		end

	is_schemap_unknown_type: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_type)
		end

	is_schemap_unknown_union_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_union_child)
		end

	is_schemap_elem_default_fixed: BOOLEAN
		do
			Result := (value=xml_schemap_elem_default_fixed)
		end

	is_schemap_regexp_invalid: BOOLEAN
		do
			Result := (value=xml_schemap_regexp_invalid)
		end

	is_schemap_failed_load: BOOLEAN
		do
			Result := (value=xml_schemap_failed_load)
		end

	is_schemap_nothing_to_parse: BOOLEAN
		do
			Result := (value=xml_schemap_nothing_to_parse)
		end

	is_schemap_noroot: BOOLEAN
		do
			Result := (value=xml_schemap_noroot)
		end

	is_schemap_redefined_group: BOOLEAN
		do
			Result := (value=xml_schemap_redefined_group)
		end

	is_schemap_redefined_type: BOOLEAN
		do
			Result := (value=xml_schemap_redefined_type)
		end

	is_schemap_redefined_element: BOOLEAN
		do
			Result := (value=xml_schemap_redefined_element)
		end

	is_schemap_redefined_attrgroup: BOOLEAN
		do
			Result := (value=xml_schemap_redefined_attrgroup)
		end

	is_schemap_redefined_attr: BOOLEAN
		do
			Result := (value=xml_schemap_redefined_attr)
		end

	is_schemap_redefined_notation: BOOLEAN
		do
			Result := (value=xml_schemap_redefined_notation)
		end

	is_schemap_failed_parse: BOOLEAN
		do
			Result := (value=xml_schemap_failed_parse)
		end

	is_schemap_unknown_prefix: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_prefix)
		end

	is_schemap_def_and_prefix: BOOLEAN
		do
			Result := (value=xml_schemap_def_and_prefix)
		end

	is_schemap_unknown_include_child: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_include_child)
		end

	is_schemap_include_schema_not_uri: BOOLEAN
		do
			Result := (value=xml_schemap_include_schema_not_uri)
		end

	is_schemap_include_schema_no_uri: BOOLEAN
		do
			Result := (value=xml_schemap_include_schema_no_uri)
		end

	is_schemap_not_schema: BOOLEAN
		do
			Result := (value=xml_schemap_not_schema)
		end

	is_schemap_unknown_member_type: BOOLEAN
		do
			Result := (value=xml_schemap_unknown_member_type)
		end

	is_schemap_invalid_attr_use: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_attr_use)
		end

	is_schemap_recursive: BOOLEAN
		do
			Result := (value=xml_schemap_recursive)
		end

	is_schemap_supernumerous_list_item_type: BOOLEAN
		do
			Result := (value=xml_schemap_supernumerous_list_item_type)
		end

	is_schemap_invalid_attr_combination: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_attr_combination)
		end

	is_schemap_invalid_attr_inline_combination: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_attr_inline_combination)
		end

	is_schemap_missing_simpletype_child: BOOLEAN
		do
			Result := (value=xml_schemap_missing_simpletype_child)
		end

	is_schemap_invalid_attr_name: BOOLEAN
		do
			Result := (value=xml_schemap_invalid_attr_name)
		end

	is_schemap_ref_and_content: BOOLEAN
		do
			Result := (value=xml_schemap_ref_and_content)
		end

	is_schemap_ct_props_correct_1: BOOLEAN
		do
			Result := (value=xml_schemap_ct_props_correct_1)
		end

	is_schemap_ct_props_correct_2: BOOLEAN
		do
			Result := (value=xml_schemap_ct_props_correct_2)
		end

	is_schemap_ct_props_correct_3: BOOLEAN
		do
			Result := (value=xml_schemap_ct_props_correct_3)
		end

	is_schemap_ct_props_correct_4: BOOLEAN
		do
			Result := (value=xml_schemap_ct_props_correct_4)
		end

	is_schemap_ct_props_correct_5: BOOLEAN
		do
			Result := (value=xml_schemap_ct_props_correct_5)
		end

	is_schemap_derivation_ok_restriction_1: BOOLEAN
		do
			Result := (value=xml_schemap_derivation_ok_restriction_1)
		end

	is_schemap_derivation_ok_restriction_2_1_1: BOOLEAN
		do
			Result := (value=xml_schemap_derivation_ok_restriction_2_1_1)
		end

	is_schemap_derivation_ok_restriction_2_1_2: BOOLEAN
		do
			Result := (value=xml_schemap_derivation_ok_restriction_2_1_2)
		end

	is_schemap_derivation_ok_restriction_2_2: BOOLEAN
		do
			Result := (value=xml_schemap_derivation_ok_restriction_2_2)
		end

	is_schemap_derivation_ok_restriction_3: BOOLEAN
		do
			Result := (value=xml_schemap_derivation_ok_restriction_3)
		end

	is_schemap_wildcard_invalid_ns_member: BOOLEAN
		do
			Result := (value=xml_schemap_wildcard_invalid_ns_member)
		end

	is_schemap_intersection_not_expressible: BOOLEAN
		do
			Result := (value=xml_schemap_intersection_not_expressible)
		end

	is_schemap_union_not_expressible: BOOLEAN
		do
			Result := (value=xml_schemap_union_not_expressible)
		end

	is_schemap_src_import_3_1: BOOLEAN
		do
			Result := (value=xml_schemap_src_import_3_1)
		end

	is_schemap_src_import_3_2: BOOLEAN
		do
			Result := (value=xml_schemap_src_import_3_2)
		end

	is_schemap_derivation_ok_restriction_4_1: BOOLEAN
		do
			Result := (value=xml_schemap_derivation_ok_restriction_4_1)
		end

	is_schemap_derivation_ok_restriction_4_2: BOOLEAN
		do
			Result := (value=xml_schemap_derivation_ok_restriction_4_2)
		end

	is_schemap_derivation_ok_restriction_4_3: BOOLEAN
		do
			Result := (value=xml_schemap_derivation_ok_restriction_4_3)
		end

	is_schemap_cos_ct_extends_1_3: BOOLEAN
		do
			Result := (value=xml_schemap_cos_ct_extends_1_3)
		end

	is_schemav_noroot: BOOLEAN
		do
			Result := (value=xml_schemav_noroot)
		end

	is_schemav_undeclaredelem: BOOLEAN
		do
			Result := (value=xml_schemav_undeclaredelem)
		end

	is_schemav_nottoplevel: BOOLEAN
		do
			Result := (value=xml_schemav_nottoplevel)
		end

	is_schemav_missing: BOOLEAN
		do
			Result := (value=xml_schemav_missing)
		end

	is_schemav_wrongelem: BOOLEAN
		do
			Result := (value=xml_schemav_wrongelem)
		end

	is_schemav_notype: BOOLEAN
		do
			Result := (value=xml_schemav_notype)
		end

	is_schemav_norollback: BOOLEAN
		do
			Result := (value=xml_schemav_norollback)
		end

	is_schemav_isabstract: BOOLEAN
		do
			Result := (value=xml_schemav_isabstract)
		end

	is_schemav_notempty: BOOLEAN
		do
			Result := (value=xml_schemav_notempty)
		end

	is_schemav_elemcont: BOOLEAN
		do
			Result := (value=xml_schemav_elemcont)
		end

	is_schemav_havedefault: BOOLEAN
		do
			Result := (value=xml_schemav_havedefault)
		end

	is_schemav_notnillable: BOOLEAN
		do
			Result := (value=xml_schemav_notnillable)
		end

	is_schemav_extracontent: BOOLEAN
		do
			Result := (value=xml_schemav_extracontent)
		end

	is_schemav_invalidattr: BOOLEAN
		do
			Result := (value=xml_schemav_invalidattr)
		end

	is_schemav_invalidelem: BOOLEAN
		do
			Result := (value=xml_schemav_invalidelem)
		end

	is_schemav_notdeterminist: BOOLEAN
		do
			Result := (value=xml_schemav_notdeterminist)
		end

	is_schemav_construct: BOOLEAN
		do
			Result := (value=xml_schemav_construct)
		end

	is_schemav_internal: BOOLEAN
		do
			Result := (value=xml_schemav_internal)
		end

	is_schemav_notsimple: BOOLEAN
		do
			Result := (value=xml_schemav_notsimple)
		end

	is_schemav_attrunknown: BOOLEAN
		do
			Result := (value=xml_schemav_attrunknown)
		end

	is_schemav_attrinvalid: BOOLEAN
		do
			Result := (value=xml_schemav_attrinvalid)
		end

	is_schemav_value: BOOLEAN
		do
			Result := (value=xml_schemav_value)
		end

	is_schemav_facet: BOOLEAN
		do
			Result := (value=xml_schemav_facet)
		end

	is_schemav_cvc_datatype_valid_1_2_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_datatype_valid_1_2_1)
		end

	is_schemav_cvc_datatype_valid_1_2_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_datatype_valid_1_2_2)
		end

	is_schemav_cvc_datatype_valid_1_2_3: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_datatype_valid_1_2_3)
		end

	is_schemav_cvc_type_3_1_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_type_3_1_1)
		end

	is_schemav_cvc_type_3_1_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_type_3_1_2)
		end

	is_schemav_cvc_facet_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_facet_valid)
		end

	is_schemav_cvc_length_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_length_valid)
		end

	is_schemav_cvc_minlength_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_minlength_valid)
		end

	is_schemav_cvc_maxlength_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_maxlength_valid)
		end

	is_schemav_cvc_mininclusive_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_mininclusive_valid)
		end

	is_schemav_cvc_maxinclusive_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_maxinclusive_valid)
		end

	is_schemav_cvc_minexclusive_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_minexclusive_valid)
		end

	is_schemav_cvc_maxexclusive_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_maxexclusive_valid)
		end

	is_schemav_cvc_totaldigits_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_totaldigits_valid)
		end

	is_schemav_cvc_fractiondigits_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_fractiondigits_valid)
		end

	is_schemav_cvc_pattern_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_pattern_valid)
		end

	is_schemav_cvc_enumeration_valid: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_enumeration_valid)
		end

	is_schemav_cvc_complex_type_2_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_2_1)
		end

	is_schemav_cvc_complex_type_2_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_2_2)
		end

	is_schemav_cvc_complex_type_2_3: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_2_3)
		end

	is_schemav_cvc_complex_type_2_4: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_2_4)
		end

	is_schemav_cvc_elt_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_1)
		end

	is_schemav_cvc_elt_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_2)
		end

	is_schemav_cvc_elt_3_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_3_1)
		end

	is_schemav_cvc_elt_3_2_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_3_2_1)
		end

	is_schemav_cvc_elt_3_2_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_3_2_2)
		end

	is_schemav_cvc_elt_4_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_4_1)
		end

	is_schemav_cvc_elt_4_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_4_2)
		end

	is_schemav_cvc_elt_4_3: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_4_3)
		end

	is_schemav_cvc_elt_5_1_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_5_1_1)
		end

	is_schemav_cvc_elt_5_1_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_5_1_2)
		end

	is_schemav_cvc_elt_5_2_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_5_2_1)
		end

	is_schemav_cvc_elt_5_2_2_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_5_2_2_1)
		end

	is_schemav_cvc_elt_5_2_2_2_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_5_2_2_2_1)
		end

	is_schemav_cvc_elt_5_2_2_2_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_5_2_2_2_2)
		end

	is_schemav_cvc_elt_6: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_6)
		end

	is_schemav_cvc_elt_7: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_elt_7)
		end

	is_schemav_cvc_attribute_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_attribute_1)
		end

	is_schemav_cvc_attribute_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_attribute_2)
		end

	is_schemav_cvc_attribute_3: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_attribute_3)
		end

	is_schemav_cvc_attribute_4: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_attribute_4)
		end

	is_schemav_cvc_complex_type_3_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_3_1)
		end

	is_schemav_cvc_complex_type_3_2_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_3_2_1)
		end

	is_schemav_cvc_complex_type_3_2_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_3_2_2)
		end

	is_schemav_cvc_complex_type_4: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_4)
		end

	is_schemav_cvc_complex_type_5_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_5_1)
		end

	is_schemav_cvc_complex_type_5_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_5_2)
		end

	is_schemav_element_content: BOOLEAN
		do
			Result := (value=xml_schemav_element_content)
		end

	is_schemav_document_element_missing: BOOLEAN
		do
			Result := (value=xml_schemav_document_element_missing)
		end

	is_schemav_cvc_complex_type_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_complex_type_1)
		end

	is_schemav_cvc_au: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_au)
		end

	is_schemav_cvc_type_1: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_type_1)
		end

	is_schemav_cvc_type_2: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_type_2)
		end

	is_schemav_cvc_idc: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_idc)
		end

	is_schemav_cvc_wildcard: BOOLEAN
		do
			Result := (value=xml_schemav_cvc_wildcard)
		end

	is_schemav_misc: BOOLEAN
		do
			Result := (value=xml_schemav_misc)
		end

	is_xptr_unknown_scheme: BOOLEAN
		do
			Result := (value=xml_xptr_unknown_scheme)
		end

	is_xptr_childseq_start: BOOLEAN
		do
			Result := (value=xml_xptr_childseq_start)
		end

	is_xptr_eval_failed: BOOLEAN
		do
			Result := (value=xml_xptr_eval_failed)
		end

	is_xptr_extra_objects: BOOLEAN
		do
			Result := (value=xml_xptr_extra_objects)
		end

	is_c14n_create_ctxt: BOOLEAN
		do
			Result := (value=xml_c14n_create_ctxt)
		end

	is_c14n_requires_utf8: BOOLEAN
		do
			Result := (value=xml_c14n_requires_utf8)
		end

	is_c14n_create_stack: BOOLEAN
		do
			Result := (value=xml_c14n_create_stack)
		end

	is_c14n_invalid_node: BOOLEAN
		do
			Result := (value=xml_c14n_invalid_node)
		end

	is_c14n_unknow_node: BOOLEAN
		do
			Result := (value=xml_c14n_unknow_node)
		end

	is_c14n_relative_namespace: BOOLEAN
		do
			Result := (value=xml_c14n_relative_namespace)
		end

	is_ftp_pasv_answer: BOOLEAN
		do
			Result := (value=xml_ftp_pasv_answer)
		end

	is_ftp_epsv_answer: BOOLEAN
		do
			Result := (value=xml_ftp_epsv_answer)
		end

	is_ftp_accnt: BOOLEAN
		do
			Result := (value=xml_ftp_accnt)
		end

	is_ftp_url_syntax: BOOLEAN
		do
			Result := (value=xml_ftp_url_syntax)
		end

	is_http_url_syntax: BOOLEAN
		do
			Result := (value=xml_http_url_syntax)
		end

	is_http_use_ip: BOOLEAN
		do
			Result := (value=xml_http_use_ip)
		end

	is_http_unknown_host: BOOLEAN
		do
			Result := (value=xml_http_unknown_host)
		end

	is_schemap_src_simple_type_1: BOOLEAN
		do
			Result := (value=xml_schemap_src_simple_type_1)
		end

	is_schemap_src_simple_type_2: BOOLEAN
		do
			Result := (value=xml_schemap_src_simple_type_2)
		end

	is_schemap_src_simple_type_3: BOOLEAN
		do
			Result := (value=xml_schemap_src_simple_type_3)
		end

	is_schemap_src_simple_type_4: BOOLEAN
		do
			Result := (value=xml_schemap_src_simple_type_4)
		end

	is_schemap_src_resolve: BOOLEAN
		do
			Result := (value=xml_schemap_src_resolve)
		end

	is_schemap_src_restriction_base_or_simpletype: BOOLEAN
		do
			Result := (value=xml_schemap_src_restriction_base_or_simpletype)
		end

	is_schemap_src_list_itemtype_or_simpletype: BOOLEAN
		do
			Result := (value=xml_schemap_src_list_itemtype_or_simpletype)
		end

	is_schemap_src_union_membertypes_or_simpletypes: BOOLEAN
		do
			Result := (value=xml_schemap_src_union_membertypes_or_simpletypes)
		end

	is_schemap_st_props_correct_1: BOOLEAN
		do
			Result := (value=xml_schemap_st_props_correct_1)
		end

	is_schemap_st_props_correct_2: BOOLEAN
		do
			Result := (value=xml_schemap_st_props_correct_2)
		end

	is_schemap_st_props_correct_3: BOOLEAN
		do
			Result := (value=xml_schemap_st_props_correct_3)
		end

	is_schemap_cos_st_restricts_1_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_1_1)
		end

	is_schemap_cos_st_restricts_1_2: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_1_2)
		end

	is_schemap_cos_st_restricts_1_3_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_1_3_1)
		end

	is_schemap_cos_st_restricts_1_3_2: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_1_3_2)
		end

	is_schemap_cos_st_restricts_2_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_2_1)
		end

	is_schemap_cos_st_restricts_2_3_1_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_1_1)
		end

	is_schemap_cos_st_restricts_2_3_1_2: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_1_2)
		end

	is_schemap_cos_st_restricts_2_3_2_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_2_1)
		end

	is_schemap_cos_st_restricts_2_3_2_2: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_2_2)
		end

	is_schemap_cos_st_restricts_2_3_2_3: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_2_3)
		end

	is_schemap_cos_st_restricts_2_3_2_4: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_2_4)
		end

	is_schemap_cos_st_restricts_2_3_2_5: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_2_3_2_5)
		end

	is_schemap_cos_st_restricts_3_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_3_1)
		end

	is_schemap_cos_st_restricts_3_3_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_1)
		end

	is_schemap_cos_st_restricts_3_3_1_2: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_1_2)
		end

	is_schemap_cos_st_restricts_3_3_2_2: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_2_2)
		end

	is_schemap_cos_st_restricts_3_3_2_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_2_1)
		end

	is_schemap_cos_st_restricts_3_3_2_3: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_2_3)
		end

	is_schemap_cos_st_restricts_3_3_2_4: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_2_4)
		end

	is_schemap_cos_st_restricts_3_3_2_5: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_restricts_3_3_2_5)
		end

	is_schemap_cos_st_derived_ok_2_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_derived_ok_2_1)
		end

	is_schemap_cos_st_derived_ok_2_2: BOOLEAN
		do
			Result := (value=xml_schemap_cos_st_derived_ok_2_2)
		end

	is_schemap_s4s_elem_not_allowed: BOOLEAN
		do
			Result := (value=xml_schemap_s4s_elem_not_allowed)
		end

	is_schemap_s4s_elem_missing: BOOLEAN
		do
			Result := (value=xml_schemap_s4s_elem_missing)
		end

	is_schemap_s4s_attr_not_allowed: BOOLEAN
		do
			Result := (value=xml_schemap_s4s_attr_not_allowed)
		end

	is_schemap_s4s_attr_missing: BOOLEAN
		do
			Result := (value=xml_schemap_s4s_attr_missing)
		end

	is_schemap_s4s_attr_invalid_value: BOOLEAN
		do
			Result := (value=xml_schemap_s4s_attr_invalid_value)
		end

	is_schemap_src_element_1: BOOLEAN
		do
			Result := (value=xml_schemap_src_element_1)
		end

	is_schemap_src_element_2_1: BOOLEAN
		do
			Result := (value=xml_schemap_src_element_2_1)
		end

	is_schemap_src_element_2_2: BOOLEAN
		do
			Result := (value=xml_schemap_src_element_2_2)
		end

	is_schemap_src_element_3: BOOLEAN
		do
			Result := (value=xml_schemap_src_element_3)
		end

	is_schemap_p_props_correct_1: BOOLEAN
		do
			Result := (value=xml_schemap_p_props_correct_1)
		end

	is_schemap_p_props_correct_2_1: BOOLEAN
		do
			Result := (value=xml_schemap_p_props_correct_2_1)
		end

	is_schemap_p_props_correct_2_2: BOOLEAN
		do
			Result := (value=xml_schemap_p_props_correct_2_2)
		end

	is_schemap_e_props_correct_2: BOOLEAN
		do
			Result := (value=xml_schemap_e_props_correct_2)
		end

	is_schemap_e_props_correct_3: BOOLEAN
		do
			Result := (value=xml_schemap_e_props_correct_3)
		end

	is_schemap_e_props_correct_4: BOOLEAN
		do
			Result := (value=xml_schemap_e_props_correct_4)
		end

	is_schemap_e_props_correct_5: BOOLEAN
		do
			Result := (value=xml_schemap_e_props_correct_5)
		end

	is_schemap_e_props_correct_6: BOOLEAN
		do
			Result := (value=xml_schemap_e_props_correct_6)
		end

	is_schemap_src_include: BOOLEAN
		do
			Result := (value=xml_schemap_src_include)
		end

	is_schemap_src_attribute_1: BOOLEAN
		do
			Result := (value=xml_schemap_src_attribute_1)
		end

	is_schemap_src_attribute_2: BOOLEAN
		do
			Result := (value=xml_schemap_src_attribute_2)
		end

	is_schemap_src_attribute_3_1: BOOLEAN
		do
			Result := (value=xml_schemap_src_attribute_3_1)
		end

	is_schemap_src_attribute_3_2: BOOLEAN
		do
			Result := (value=xml_schemap_src_attribute_3_2)
		end

	is_schemap_src_attribute_4: BOOLEAN
		do
			Result := (value=xml_schemap_src_attribute_4)
		end

	is_schemap_no_xmlns: BOOLEAN
		do
			Result := (value=xml_schemap_no_xmlns)
		end

	is_schemap_no_xsi: BOOLEAN
		do
			Result := (value=xml_schemap_no_xsi)
		end

	is_schemap_cos_valid_default_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_valid_default_1)
		end

	is_schemap_cos_valid_default_2_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_valid_default_2_1)
		end

	is_schemap_cos_valid_default_2_2_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_valid_default_2_2_1)
		end

	is_schemap_cos_valid_default_2_2_2: BOOLEAN
		do
			Result := (value=xml_schemap_cos_valid_default_2_2_2)
		end

	is_schemap_cvc_simple_type: BOOLEAN
		do
			Result := (value=xml_schemap_cvc_simple_type)
		end

	is_schemap_cos_ct_extends_1_1: BOOLEAN
		do
			Result := (value=xml_schemap_cos_ct_extends_1_1)
		end

	is_schemap_src_import_1_1: BOOLEAN
		do
			Result := (value=xml_schemap_src_import_1_1)
		end

	is_schemap_src_import_1_2: BOOLEAN
		do
			Result := (value=xml_schemap_src_import_1_2)
		end

	is_schemap_src_import_2: BOOLEAN
		do
			Result := (value=xml_schemap_src_import_2)
		end

	is_schemap_src_import_2_1: BOOLEAN
		do
			Result := (value=xml_schemap_src_import_2_1)
		end

	is_schemap_src_import_2_2: BOOLEAN
		do
			Result := (value=xml_schemap_src_import_2_2)
		end

	is_schemap_internal: BOOLEAN
		do
			Result := (value=xml_schemap_internal)
		end

	is_schemap_not_deterministic: BOOLEAN
		do
			Result := (value=xml_schemap_not_deterministic)
		end

	is_schemap_src_attribute_group_1: BOOLEAN
		do
			Result := (value=xml_schemap_src_attribute_group_1)
		end

	is_schemap_src_attribute_group_2: BOOLEAN
		do
			Result := (value=xml_schemap_src_attribute_group_2)
		end

	is_schemap_src_attribute_group_3: BOOLEAN
		do
			Result := (value=xml_schemap_src_attribute_group_3)
		end

	is_schemap_mg_props_correct_1: BOOLEAN
		do
			Result := (value=xml_schemap_mg_props_correct_1)
		end

	is_schemap_mg_props_correct_2: BOOLEAN
		do
			Result := (value=xml_schemap_mg_props_correct_2)
		end

	is_schemap_src_ct_1: BOOLEAN
		do
			Result := (value=xml_schemap_src_ct_1)
		end

	is_schemap_derivation_ok_restriction_2_1_3: BOOLEAN
		do
			Result := (value=xml_schemap_derivation_ok_restriction_2_1_3)
		end

	is_schemap_au_props_correct_2: BOOLEAN
		do
			Result := (value=xml_schemap_au_props_correct_2)
		end

	is_schemap_a_props_correct_2: BOOLEAN
		do
			Result := (value=xml_schemap_a_props_correct_2)
		end

	is_schemap_c_props_correct: BOOLEAN
		do
			Result := (value=xml_schemap_c_props_correct)
		end

	is_schemap_src_redefine: BOOLEAN
		do
			Result := (value=xml_schemap_src_redefine)
		end

	is_schemap_src_import: BOOLEAN
		do
			Result := (value=xml_schemap_src_import)
		end

	is_schemap_warn_skip_schema: BOOLEAN
		do
			Result := (value=xml_schemap_warn_skip_schema)
		end

	is_schemap_warn_unlocated_schema: BOOLEAN
		do
			Result := (value=xml_schemap_warn_unlocated_schema)
		end

	is_schemap_warn_attr_redecl_proh: BOOLEAN
		do
			Result := (value=xml_schemap_warn_attr_redecl_proh)
		end

	is_schemap_warn_attr_pointless_proh: BOOLEAN
		do
			Result := (value=xml_schemap_warn_attr_pointless_proh)
		end

	is_schemap_ag_props_correct: BOOLEAN
		do
			Result := (value=xml_schemap_ag_props_correct)
		end

	is_schemap_cos_ct_extends_1_2: BOOLEAN
		do
			Result := (value=xml_schemap_cos_ct_extends_1_2)
		end

	is_schemap_au_props_correct: BOOLEAN
		do
			Result := (value=xml_schemap_au_props_correct)
		end

	is_schemap_a_props_correct_3: BOOLEAN
		do
			Result := (value=xml_schemap_a_props_correct_3)
		end

	is_schemap_cos_all_limited: BOOLEAN
		do
			Result := (value=xml_schemap_cos_all_limited)
		end

	is_module_open: BOOLEAN
		do
			Result := (value=xml_module_open)
		end

	is_module_close: BOOLEAN
		do
			Result := (value=xml_module_close)
		end

	is_check_found_element: BOOLEAN
		do
			Result := (value=xml_check_found_element)
		end

	is_check_found_attribute: BOOLEAN
		do
			Result := (value=xml_check_found_attribute)
		end

	is_check_found_text: BOOLEAN
		do
			Result := (value=xml_check_found_text)
		end

	is_check_found_cdata: BOOLEAN
		do
			Result := (value=xml_check_found_cdata)
		end

	is_check_found_entityref: BOOLEAN
		do
			Result := (value=xml_check_found_entityref)
		end

	is_check_found_entity: BOOLEAN
		do
			Result := (value=xml_check_found_entity)
		end

	is_check_found_pi: BOOLEAN
		do
			Result := (value=xml_check_found_pi)
		end

	is_check_found_comment: BOOLEAN
		do
			Result := (value=xml_check_found_comment)
		end

	is_check_found_doctype: BOOLEAN
		do
			Result := (value=xml_check_found_doctype)
		end

	is_check_found_fragment: BOOLEAN
		do
			Result := (value=xml_check_found_fragment)
		end

	is_check_found_notation: BOOLEAN
		do
			Result := (value=xml_check_found_notation)
		end

	is_check_unknown_node: BOOLEAN
		do
			Result := (value=xml_check_unknown_node)
		end

	is_check_entity_type: BOOLEAN
		do
			Result := (value=xml_check_entity_type)
		end

	is_check_no_parent: BOOLEAN
		do
			Result := (value=xml_check_no_parent)
		end

	is_check_no_doc: BOOLEAN
		do
			Result := (value=xml_check_no_doc)
		end

	is_check_no_name: BOOLEAN
		do
			Result := (value=xml_check_no_name)
		end

	is_check_no_elem: BOOLEAN
		do
			Result := (value=xml_check_no_elem)
		end

	is_check_wrong_doc: BOOLEAN
		do
			Result := (value=xml_check_wrong_doc)
		end

	is_check_no_prev: BOOLEAN
		do
			Result := (value=xml_check_no_prev)
		end

	is_check_wrong_prev: BOOLEAN
		do
			Result := (value=xml_check_wrong_prev)
		end

	is_check_no_next: BOOLEAN
		do
			Result := (value=xml_check_no_next)
		end

	is_check_wrong_next: BOOLEAN
		do
			Result := (value=xml_check_wrong_next)
		end

	is_check_not_dtd: BOOLEAN
		do
			Result := (value=xml_check_not_dtd)
		end

	is_check_not_attr: BOOLEAN
		do
			Result := (value=xml_check_not_attr)
		end

	is_check_not_attr_decl: BOOLEAN
		do
			Result := (value=xml_check_not_attr_decl)
		end

	is_check_not_elem_decl: BOOLEAN
		do
			Result := (value=xml_check_not_elem_decl)
		end

	is_check_not_entity_decl: BOOLEAN
		do
			Result := (value=xml_check_not_entity_decl)
		end

	is_check_not_ns_decl: BOOLEAN
		do
			Result := (value=xml_check_not_ns_decl)
		end

	is_check_no_href: BOOLEAN
		do
			Result := (value=xml_check_no_href)
		end

	is_check_wrong_parent: BOOLEAN
		do
			Result := (value=xml_check_wrong_parent)
		end

	is_check_ns_scope: BOOLEAN
		do
			Result := (value=xml_check_ns_scope)
		end

	is_check_ns_ancestor: BOOLEAN
		do
			Result := (value=xml_check_ns_ancestor)
		end

	is_check_not_utf8: BOOLEAN
		do
			Result := (value=xml_check_not_utf8)
		end

	is_check_no_dict: BOOLEAN
		do
			Result := (value=xml_check_no_dict)
		end

	is_check_not_ncname: BOOLEAN
		do
			Result := (value=xml_check_not_ncname)
		end

	is_check_outside_dict: BOOLEAN
		do
			Result := (value=xml_check_outside_dict)
		end

	is_check_wrong_name: BOOLEAN
		do
			Result := (value=xml_check_wrong_name)
		end

	is_check_name_not_null: BOOLEAN
		do
			Result := (value=xml_check_name_not_null)
		end

	is_i18n_no_name: BOOLEAN
		do
			Result := (value=xml_i18n_no_name)
		end

	is_i18n_no_handler: BOOLEAN
		do
			Result := (value=xml_i18n_no_handler)
		end

	is_i18n_excess_handler: BOOLEAN
		do
			Result := (value=xml_i18n_excess_handler)
		end

	is_i18n_conv_failed: BOOLEAN
		do
			Result := (value=xml_i18n_conv_failed)
		end

	is_i18n_no_output: BOOLEAN
		do
			Result := (value=xml_i18n_no_output)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_err_ok: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_OK"
		end

	xml_err_internal_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_INTERNAL_ERROR"
		end

	xml_err_no_memory: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NO_MEMORY"
		end

	xml_err_document_start: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_DOCUMENT_START"
		end

	xml_err_document_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_DOCUMENT_EMPTY"
		end

	xml_err_document_end: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_DOCUMENT_END"
		end

	xml_err_invalid_hex_charref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_INVALID_HEX_CHARREF"
		end

	xml_err_invalid_dec_charref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_INVALID_DEC_CHARREF"
		end

	xml_err_invalid_charref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_INVALID_CHARREF"
		end

	xml_err_invalid_char: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_INVALID_CHAR"
		end

	xml_err_charref_at_eof: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_CHARREF_AT_EOF"
		end

	xml_err_charref_in_prolog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_CHARREF_IN_PROLOG"
		end

	xml_err_charref_in_epilog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_CHARREF_IN_EPILOG"
		end

	xml_err_charref_in_dtd: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_CHARREF_IN_DTD"
		end

	xml_err_entityref_at_eof: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITYREF_AT_EOF"
		end

	xml_err_entityref_in_prolog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITYREF_IN_PROLOG"
		end

	xml_err_entityref_in_epilog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITYREF_IN_EPILOG"
		end

	xml_err_entityref_in_dtd: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITYREF_IN_DTD"
		end

	xml_err_peref_at_eof: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_PEREF_AT_EOF"
		end

	xml_err_peref_in_prolog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_PEREF_IN_PROLOG"
		end

	xml_err_peref_in_epilog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_PEREF_IN_EPILOG"
		end

	xml_err_peref_in_int_subset: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_PEREF_IN_INT_SUBSET"
		end

	xml_err_entityref_no_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITYREF_NO_NAME"
		end

	xml_err_entityref_semicol_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITYREF_SEMICOL_MISSING"
		end

	xml_err_peref_no_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_PEREF_NO_NAME"
		end

	xml_err_peref_semicol_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_PEREF_SEMICOL_MISSING"
		end

	xml_err_undeclared_entity: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_UNDECLARED_ENTITY"
		end

	xml_war_undeclared_entity: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WAR_UNDECLARED_ENTITY"
		end

	xml_err_unparsed_entity: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_UNPARSED_ENTITY"
		end

	xml_err_entity_is_external: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITY_IS_EXTERNAL"
		end

	xml_err_entity_is_parameter: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITY_IS_PARAMETER"
		end

	xml_err_unknown_encoding: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_UNKNOWN_ENCODING"
		end

	xml_err_unsupported_encoding: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_UNSUPPORTED_ENCODING"
		end

	xml_err_string_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_STRING_NOT_STARTED"
		end

	xml_err_string_not_closed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_STRING_NOT_CLOSED"
		end

	xml_err_ns_decl_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NS_DECL_ERROR"
		end

	xml_err_entity_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITY_NOT_STARTED"
		end

	xml_err_entity_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITY_NOT_FINISHED"
		end

	xml_err_lt_in_attribute: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_LT_IN_ATTRIBUTE"
		end

	xml_err_attribute_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ATTRIBUTE_NOT_STARTED"
		end

	xml_err_attribute_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ATTRIBUTE_NOT_FINISHED"
		end

	xml_err_attribute_without_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ATTRIBUTE_WITHOUT_VALUE"
		end

	xml_err_attribute_redefined: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ATTRIBUTE_REDEFINED"
		end

	xml_err_literal_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_LITERAL_NOT_STARTED"
		end

	xml_err_literal_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_LITERAL_NOT_FINISHED"
		end

	xml_err_comment_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_COMMENT_NOT_FINISHED"
		end

	xml_err_pi_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_PI_NOT_STARTED"
		end

	xml_err_pi_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_PI_NOT_FINISHED"
		end

	xml_err_notation_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NOTATION_NOT_STARTED"
		end

	xml_err_notation_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NOTATION_NOT_FINISHED"
		end

	xml_err_attlist_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ATTLIST_NOT_STARTED"
		end

	xml_err_attlist_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ATTLIST_NOT_FINISHED"
		end

	xml_err_mixed_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_MIXED_NOT_STARTED"
		end

	xml_err_mixed_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_MIXED_NOT_FINISHED"
		end

	xml_err_elemcontent_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ELEMCONTENT_NOT_STARTED"
		end

	xml_err_elemcontent_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ELEMCONTENT_NOT_FINISHED"
		end

	xml_err_xmldecl_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_XMLDECL_NOT_STARTED"
		end

	xml_err_xmldecl_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_XMLDECL_NOT_FINISHED"
		end

	xml_err_condsec_not_started: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_CONDSEC_NOT_STARTED"
		end

	xml_err_condsec_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_CONDSEC_NOT_FINISHED"
		end

	xml_err_ext_subset_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_EXT_SUBSET_NOT_FINISHED"
		end

	xml_err_doctype_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_DOCTYPE_NOT_FINISHED"
		end

	xml_err_misplaced_cdata_end: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_MISPLACED_CDATA_END"
		end

	xml_err_cdata_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_CDATA_NOT_FINISHED"
		end

	xml_err_reserved_xml_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_RESERVED_XML_NAME"
		end

	xml_err_space_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_SPACE_REQUIRED"
		end

	xml_err_separator_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_SEPARATOR_REQUIRED"
		end

	xml_err_nmtoken_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NMTOKEN_REQUIRED"
		end

	xml_err_name_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NAME_REQUIRED"
		end

	xml_err_pcdata_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_PCDATA_REQUIRED"
		end

	xml_err_uri_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_URI_REQUIRED"
		end

	xml_err_pubid_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_PUBID_REQUIRED"
		end

	xml_err_lt_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_LT_REQUIRED"
		end

	xml_err_gt_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_GT_REQUIRED"
		end

	xml_err_ltslash_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_LTSLASH_REQUIRED"
		end

	xml_err_equal_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_EQUAL_REQUIRED"
		end

	xml_err_tag_name_mismatch: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_TAG_NAME_MISMATCH"
		end

	xml_err_tag_not_finished: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_TAG_NOT_FINISHED"
		end

	xml_err_standalone_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_STANDALONE_VALUE"
		end

	xml_err_encoding_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENCODING_NAME"
		end

	xml_err_hyphen_in_comment: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_HYPHEN_IN_COMMENT"
		end

	xml_err_invalid_encoding: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_INVALID_ENCODING"
		end

	xml_err_ext_entity_standalone: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_EXT_ENTITY_STANDALONE"
		end

	xml_err_condsec_invalid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_CONDSEC_INVALID"
		end

	xml_err_value_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_VALUE_REQUIRED"
		end

	xml_err_not_well_balanced: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NOT_WELL_BALANCED"
		end

	xml_err_extra_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_EXTRA_CONTENT"
		end

	xml_err_entity_char_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITY_CHAR_ERROR"
		end

	xml_err_entity_pe_internal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITY_PE_INTERNAL"
		end

	xml_err_entity_loop: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITY_LOOP"
		end

	xml_err_entity_boundary: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITY_BOUNDARY"
		end

	xml_err_invalid_uri: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_INVALID_URI"
		end

	xml_err_uri_fragment: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_URI_FRAGMENT"
		end

	xml_war_catalog_pi: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WAR_CATALOG_PI"
		end

	xml_err_no_dtd: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NO_DTD"
		end

	xml_err_condsec_invalid_keyword: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_CONDSEC_INVALID_KEYWORD"
		end

	xml_err_version_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_VERSION_MISSING"
		end

	xml_war_unknown_version: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WAR_UNKNOWN_VERSION"
		end

	xml_war_lang_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WAR_LANG_VALUE"
		end

	xml_war_ns_uri: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WAR_NS_URI"
		end

	xml_war_ns_uri_relative: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WAR_NS_URI_RELATIVE"
		end

	xml_err_missing_encoding: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_MISSING_ENCODING"
		end

	xml_war_space_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WAR_SPACE_VALUE"
		end

	xml_err_not_standalone: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NOT_STANDALONE"
		end

	xml_err_entity_processing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ENTITY_PROCESSING"
		end

	xml_err_notation_processing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NOTATION_PROCESSING"
		end

	xml_war_ns_column: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WAR_NS_COLUMN"
		end

	xml_war_entity_redefined: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WAR_ENTITY_REDEFINED"
		end

	xml_ns_err_xml_namespace: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_NS_ERR_XML_NAMESPACE"
		end

	xml_ns_err_undefined_namespace: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_NS_ERR_UNDEFINED_NAMESPACE"
		end

	xml_ns_err_qname: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_NS_ERR_QNAME"
		end

	xml_ns_err_attribute_redefined: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_NS_ERR_ATTRIBUTE_REDEFINED"
		end

	xml_ns_err_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_NS_ERR_EMPTY"
		end

	xml_dtd_attribute_default: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ATTRIBUTE_DEFAULT"
		end

	xml_dtd_attribute_redefined: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ATTRIBUTE_REDEFINED"
		end

	xml_dtd_attribute_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ATTRIBUTE_VALUE"
		end

	xml_dtd_content_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_CONTENT_ERROR"
		end

	xml_dtd_content_model: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_CONTENT_MODEL"
		end

	xml_dtd_content_not_determinist: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_CONTENT_NOT_DETERMINIST"
		end

	xml_dtd_different_prefix: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_DIFFERENT_PREFIX"
		end

	xml_dtd_elem_default_namespace: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ELEM_DEFAULT_NAMESPACE"
		end

	xml_dtd_elem_namespace: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ELEM_NAMESPACE"
		end

	xml_dtd_elem_redefined: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ELEM_REDEFINED"
		end

	xml_dtd_empty_notation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_EMPTY_NOTATION"
		end

	xml_dtd_entity_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ENTITY_TYPE"
		end

	xml_dtd_id_fixed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ID_FIXED"
		end

	xml_dtd_id_redefined: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ID_REDEFINED"
		end

	xml_dtd_id_subset: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ID_SUBSET"
		end

	xml_dtd_invalid_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_INVALID_CHILD"
		end

	xml_dtd_invalid_default: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_INVALID_DEFAULT"
		end

	xml_dtd_load_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_LOAD_ERROR"
		end

	xml_dtd_missing_attribute: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_MISSING_ATTRIBUTE"
		end

	xml_dtd_mixed_corrupt: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_MIXED_CORRUPT"
		end

	xml_dtd_multiple_id: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_MULTIPLE_ID"
		end

	xml_dtd_no_doc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NO_DOC"
		end

	xml_dtd_no_dtd: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NO_DTD"
		end

	xml_dtd_no_elem_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NO_ELEM_NAME"
		end

	xml_dtd_no_prefix: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NO_PREFIX"
		end

	xml_dtd_no_root: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NO_ROOT"
		end

	xml_dtd_notation_redefined: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NOTATION_REDEFINED"
		end

	xml_dtd_notation_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NOTATION_VALUE"
		end

	xml_dtd_not_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NOT_EMPTY"
		end

	xml_dtd_not_pcdata: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NOT_PCDATA"
		end

	xml_dtd_not_standalone: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_NOT_STANDALONE"
		end

	xml_dtd_root_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_ROOT_NAME"
		end

	xml_dtd_standalone_white_space: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_STANDALONE_WHITE_SPACE"
		end

	xml_dtd_unknown_attribute: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_UNKNOWN_ATTRIBUTE"
		end

	xml_dtd_unknown_elem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_UNKNOWN_ELEM"
		end

	xml_dtd_unknown_entity: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_UNKNOWN_ENTITY"
		end

	xml_dtd_unknown_id: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_UNKNOWN_ID"
		end

	xml_dtd_unknown_notation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_UNKNOWN_NOTATION"
		end

	xml_dtd_standalone_defaulted: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_STANDALONE_DEFAULTED"
		end

	xml_dtd_xmlid_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_XMLID_VALUE"
		end

	xml_dtd_xmlid_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_DTD_XMLID_TYPE"
		end

	xml_html_strucure_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_HTML_STRUCURE_ERROR"
		end

	xml_html_unknown_tag: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_HTML_UNKNOWN_TAG"
		end

	xml_rngp_anyname_attr_ancestor: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ANYNAME_ATTR_ANCESTOR"
		end

	xml_rngp_attr_conflict: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ATTR_CONFLICT"
		end

	xml_rngp_attribute_children: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ATTRIBUTE_CHILDREN"
		end

	xml_rngp_attribute_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ATTRIBUTE_CONTENT"
		end

	xml_rngp_attribute_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ATTRIBUTE_EMPTY"
		end

	xml_rngp_attribute_noop: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ATTRIBUTE_NOOP"
		end

	xml_rngp_choice_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_CHOICE_CONTENT"
		end

	xml_rngp_choice_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_CHOICE_EMPTY"
		end

	xml_rngp_create_failure: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_CREATE_FAILURE"
		end

	xml_rngp_data_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_DATA_CONTENT"
		end

	xml_rngp_def_choice_and_interleave: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_DEF_CHOICE_AND_INTERLEAVE"
		end

	xml_rngp_define_create_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_DEFINE_CREATE_FAILED"
		end

	xml_rngp_define_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_DEFINE_EMPTY"
		end

	xml_rngp_define_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_DEFINE_MISSING"
		end

	xml_rngp_define_name_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_DEFINE_NAME_MISSING"
		end

	xml_rngp_elem_content_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ELEM_CONTENT_EMPTY"
		end

	xml_rngp_elem_content_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ELEM_CONTENT_ERROR"
		end

	xml_rngp_element_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ELEMENT_EMPTY"
		end

	xml_rngp_element_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ELEMENT_CONTENT"
		end

	xml_rngp_element_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ELEMENT_NAME"
		end

	xml_rngp_element_no_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ELEMENT_NO_CONTENT"
		end

	xml_rngp_elem_text_conflict: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ELEM_TEXT_CONFLICT"
		end

	xml_rngp_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EMPTY"
		end

	xml_rngp_empty_construct: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EMPTY_CONSTRUCT"
		end

	xml_rngp_empty_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EMPTY_CONTENT"
		end

	xml_rngp_empty_not_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EMPTY_NOT_EMPTY"
		end

	xml_rngp_error_type_lib: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_ERROR_TYPE_LIB"
		end

	xml_rngp_except_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EXCEPT_EMPTY"
		end

	xml_rngp_except_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EXCEPT_MISSING"
		end

	xml_rngp_except_multiple: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EXCEPT_MULTIPLE"
		end

	xml_rngp_except_no_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EXCEPT_NO_CONTENT"
		end

	xml_rngp_externalref_emtpy: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EXTERNALREF_EMTPY"
		end

	xml_rngp_external_ref_failure: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EXTERNAL_REF_FAILURE"
		end

	xml_rngp_externalref_recurse: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_EXTERNALREF_RECURSE"
		end

	xml_rngp_forbidden_attribute: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_FORBIDDEN_ATTRIBUTE"
		end

	xml_rngp_foreign_element: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_FOREIGN_ELEMENT"
		end

	xml_rngp_grammar_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_GRAMMAR_CONTENT"
		end

	xml_rngp_grammar_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_GRAMMAR_EMPTY"
		end

	xml_rngp_grammar_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_GRAMMAR_MISSING"
		end

	xml_rngp_grammar_no_start: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_GRAMMAR_NO_START"
		end

	xml_rngp_group_attr_conflict: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_GROUP_ATTR_CONFLICT"
		end

	xml_rngp_href_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_HREF_ERROR"
		end

	xml_rngp_include_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_INCLUDE_EMPTY"
		end

	xml_rngp_include_failure: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_INCLUDE_FAILURE"
		end

	xml_rngp_include_recurse: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_INCLUDE_RECURSE"
		end

	xml_rngp_interleave_add: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_INTERLEAVE_ADD"
		end

	xml_rngp_interleave_create_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_INTERLEAVE_CREATE_FAILED"
		end

	xml_rngp_interleave_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_INTERLEAVE_EMPTY"
		end

	xml_rngp_interleave_no_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_INTERLEAVE_NO_CONTENT"
		end

	xml_rngp_invalid_define_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_INVALID_DEFINE_NAME"
		end

	xml_rngp_invalid_uri: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_INVALID_URI"
		end

	xml_rngp_invalid_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_INVALID_VALUE"
		end

	xml_rngp_missing_href: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_MISSING_HREF"
		end

	xml_rngp_name_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_NAME_MISSING"
		end

	xml_rngp_need_combine: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_NEED_COMBINE"
		end

	xml_rngp_notallowed_not_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_NOTALLOWED_NOT_EMPTY"
		end

	xml_rngp_nsname_attr_ancestor: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_NSNAME_ATTR_ANCESTOR"
		end

	xml_rngp_nsname_no_ns: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_NSNAME_NO_NS"
		end

	xml_rngp_param_forbidden: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PARAM_FORBIDDEN"
		end

	xml_rngp_param_name_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PARAM_NAME_MISSING"
		end

	xml_rngp_parentref_create_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PARENTREF_CREATE_FAILED"
		end

	xml_rngp_parentref_name_invalid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PARENTREF_NAME_INVALID"
		end

	xml_rngp_parentref_no_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PARENTREF_NO_NAME"
		end

	xml_rngp_parentref_no_parent: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PARENTREF_NO_PARENT"
		end

	xml_rngp_parentref_not_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PARENTREF_NOT_EMPTY"
		end

	xml_rngp_parse_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PARSE_ERROR"
		end

	xml_rngp_pat_anyname_except_anyname: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_ANYNAME_EXCEPT_ANYNAME"
		end

	xml_rngp_pat_attr_attr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_ATTR_ATTR"
		end

	xml_rngp_pat_attr_elem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_ATTR_ELEM"
		end

	xml_rngp_pat_data_except_attr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_DATA_EXCEPT_ATTR"
		end

	xml_rngp_pat_data_except_elem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_DATA_EXCEPT_ELEM"
		end

	xml_rngp_pat_data_except_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_DATA_EXCEPT_EMPTY"
		end

	xml_rngp_pat_data_except_group: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_DATA_EXCEPT_GROUP"
		end

	xml_rngp_pat_data_except_interleave: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_DATA_EXCEPT_INTERLEAVE"
		end

	xml_rngp_pat_data_except_list: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_DATA_EXCEPT_LIST"
		end

	xml_rngp_pat_data_except_onemore: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_DATA_EXCEPT_ONEMORE"
		end

	xml_rngp_pat_data_except_ref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_DATA_EXCEPT_REF"
		end

	xml_rngp_pat_data_except_text: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_DATA_EXCEPT_TEXT"
		end

	xml_rngp_pat_list_attr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_LIST_ATTR"
		end

	xml_rngp_pat_list_elem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_LIST_ELEM"
		end

	xml_rngp_pat_list_interleave: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_LIST_INTERLEAVE"
		end

	xml_rngp_pat_list_list: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_LIST_LIST"
		end

	xml_rngp_pat_list_ref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_LIST_REF"
		end

	xml_rngp_pat_list_text: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_LIST_TEXT"
		end

	xml_rngp_pat_nsname_except_anyname: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_NSNAME_EXCEPT_ANYNAME"
		end

	xml_rngp_pat_nsname_except_nsname: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_NSNAME_EXCEPT_NSNAME"
		end

	xml_rngp_pat_onemore_group_attr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_ONEMORE_GROUP_ATTR"
		end

	xml_rngp_pat_onemore_interleave_attr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_ONEMORE_INTERLEAVE_ATTR"
		end

	xml_rngp_pat_start_attr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_START_ATTR"
		end

	xml_rngp_pat_start_data: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_START_DATA"
		end

	xml_rngp_pat_start_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_START_EMPTY"
		end

	xml_rngp_pat_start_group: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_START_GROUP"
		end

	xml_rngp_pat_start_interleave: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_START_INTERLEAVE"
		end

	xml_rngp_pat_start_list: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_START_LIST"
		end

	xml_rngp_pat_start_onemore: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_START_ONEMORE"
		end

	xml_rngp_pat_start_text: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_START_TEXT"
		end

	xml_rngp_pat_start_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PAT_START_VALUE"
		end

	xml_rngp_prefix_undefined: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_PREFIX_UNDEFINED"
		end

	xml_rngp_ref_create_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_REF_CREATE_FAILED"
		end

	xml_rngp_ref_cycle: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_REF_CYCLE"
		end

	xml_rngp_ref_name_invalid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_REF_NAME_INVALID"
		end

	xml_rngp_ref_no_def: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_REF_NO_DEF"
		end

	xml_rngp_ref_no_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_REF_NO_NAME"
		end

	xml_rngp_ref_not_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_REF_NOT_EMPTY"
		end

	xml_rngp_start_choice_and_interleave: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_START_CHOICE_AND_INTERLEAVE"
		end

	xml_rngp_start_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_START_CONTENT"
		end

	xml_rngp_start_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_START_EMPTY"
		end

	xml_rngp_start_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_START_MISSING"
		end

	xml_rngp_text_expected: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_TEXT_EXPECTED"
		end

	xml_rngp_text_has_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_TEXT_HAS_CHILD"
		end

	xml_rngp_type_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_TYPE_MISSING"
		end

	xml_rngp_type_not_found: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_TYPE_NOT_FOUND"
		end

	xml_rngp_type_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_TYPE_VALUE"
		end

	xml_rngp_unknown_attribute: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_UNKNOWN_ATTRIBUTE"
		end

	xml_rngp_unknown_combine: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_UNKNOWN_COMBINE"
		end

	xml_rngp_unknown_construct: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_UNKNOWN_CONSTRUCT"
		end

	xml_rngp_unknown_type_lib: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_UNKNOWN_TYPE_LIB"
		end

	xml_rngp_uri_fragment: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_URI_FRAGMENT"
		end

	xml_rngp_uri_not_absolute: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_URI_NOT_ABSOLUTE"
		end

	xml_rngp_value_empty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_VALUE_EMPTY"
		end

	xml_rngp_value_no_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_VALUE_NO_CONTENT"
		end

	xml_rngp_xmlns_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_XMLNS_NAME"
		end

	xml_rngp_xml_ns: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_RNGP_XML_NS"
		end

	xml_xpath_expression_ok: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_EXPRESSION_OK"
		end

	xml_xpath_number_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_NUMBER_ERROR"
		end

	xml_xpath_unfinished_literal_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_UNFINISHED_LITERAL_ERROR"
		end

	xml_xpath_start_literal_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_START_LITERAL_ERROR"
		end

	xml_xpath_variable_ref_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_VARIABLE_REF_ERROR"
		end

	xml_xpath_undef_variable_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_UNDEF_VARIABLE_ERROR"
		end

	xml_xpath_invalid_predicate_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_INVALID_PREDICATE_ERROR"
		end

	xml_xpath_expr_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_EXPR_ERROR"
		end

	xml_xpath_unclosed_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_UNCLOSED_ERROR"
		end

	xml_xpath_unknown_func_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_UNKNOWN_FUNC_ERROR"
		end

	xml_xpath_invalid_operand: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_INVALID_OPERAND"
		end

	xml_xpath_invalid_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_INVALID_TYPE"
		end

	xml_xpath_invalid_arity: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_INVALID_ARITY"
		end

	xml_xpath_invalid_ctxt_size: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_INVALID_CTXT_SIZE"
		end

	xml_xpath_invalid_ctxt_position: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_INVALID_CTXT_POSITION"
		end

	xml_xpath_memory_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_MEMORY_ERROR"
		end

	xml_xptr_syntax_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPTR_SYNTAX_ERROR"
		end

	xml_xptr_resource_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPTR_RESOURCE_ERROR"
		end

	xml_xptr_sub_resource_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPTR_SUB_RESOURCE_ERROR"
		end

	xml_xpath_undef_prefix_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_UNDEF_PREFIX_ERROR"
		end

	xml_xpath_encoding_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_ENCODING_ERROR"
		end

	xml_xpath_invalid_char_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPATH_INVALID_CHAR_ERROR"
		end

	xml_tree_invalid_hex: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_TREE_INVALID_HEX"
		end

	xml_tree_invalid_dec: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_TREE_INVALID_DEC"
		end

	xml_tree_unterminated_entity: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_TREE_UNTERMINATED_ENTITY"
		end

	xml_save_not_utf8: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SAVE_NOT_UTF8"
		end

	xml_save_char_invalid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SAVE_CHAR_INVALID"
		end

	xml_save_no_doctype: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SAVE_NO_DOCTYPE"
		end

	xml_save_unknown_encoding: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SAVE_UNKNOWN_ENCODING"
		end

	xml_regexp_compile_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_REGEXP_COMPILE_ERROR"
		end

	xml_io_unknown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_UNKNOWN"
		end

	xml_io_eacces: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EACCES"
		end

	xml_io_eagain: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EAGAIN"
		end

	xml_io_ebadf: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EBADF"
		end

	xml_io_ebadmsg: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EBADMSG"
		end

	xml_io_ebusy: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EBUSY"
		end

	xml_io_ecanceled: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ECANCELED"
		end

	xml_io_echild: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ECHILD"
		end

	xml_io_edeadlk: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EDEADLK"
		end

	xml_io_edom: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EDOM"
		end

	xml_io_eexist: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EEXIST"
		end

	xml_io_efault: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EFAULT"
		end

	xml_io_efbig: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EFBIG"
		end

	xml_io_einprogress: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EINPROGRESS"
		end

	xml_io_eintr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EINTR"
		end

	xml_io_einval: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EINVAL"
		end

	xml_io_eio: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EIO"
		end

	xml_io_eisdir: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EISDIR"
		end

	xml_io_emfile: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EMFILE"
		end

	xml_io_emlink: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EMLINK"
		end

	xml_io_emsgsize: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EMSGSIZE"
		end

	xml_io_enametoolong: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENAMETOOLONG"
		end

	xml_io_enfile: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENFILE"
		end

	xml_io_enodev: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENODEV"
		end

	xml_io_enoent: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOENT"
		end

	xml_io_enoexec: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOEXEC"
		end

	xml_io_enolck: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOLCK"
		end

	xml_io_enomem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOMEM"
		end

	xml_io_enospc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOSPC"
		end

	xml_io_enosys: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOSYS"
		end

	xml_io_enotdir: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOTDIR"
		end

	xml_io_enotempty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOTEMPTY"
		end

	xml_io_enotsup: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOTSUP"
		end

	xml_io_enotty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOTTY"
		end

	xml_io_enxio: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENXIO"
		end

	xml_io_eperm: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EPERM"
		end

	xml_io_epipe: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EPIPE"
		end

	xml_io_erange: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ERANGE"
		end

	xml_io_erofs: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EROFS"
		end

	xml_io_espipe: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ESPIPE"
		end

	xml_io_esrch: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ESRCH"
		end

	xml_io_etimedout: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ETIMEDOUT"
		end

	xml_io_exdev: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EXDEV"
		end

	xml_io_network_attempt: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_NETWORK_ATTEMPT"
		end

	xml_io_encoder: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENCODER"
		end

	xml_io_flush: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_FLUSH"
		end

	xml_io_write: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_WRITE"
		end

	xml_io_no_input: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_NO_INPUT"
		end

	xml_io_buffer_full: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_BUFFER_FULL"
		end

	xml_io_load_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_LOAD_ERROR"
		end

	xml_io_enotsock: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENOTSOCK"
		end

	xml_io_eisconn: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EISCONN"
		end

	xml_io_econnrefused: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ECONNREFUSED"
		end

	xml_io_enetunreach: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_ENETUNREACH"
		end

	xml_io_eaddrinuse: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EADDRINUSE"
		end

	xml_io_ealready: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EALREADY"
		end

	xml_io_eafnosupport: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_IO_EAFNOSUPPORT"
		end

	xml_xinclude_recursion: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_RECURSION"
		end

	xml_xinclude_parse_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_PARSE_VALUE"
		end

	xml_xinclude_entity_def_mismatch: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_ENTITY_DEF_MISMATCH"
		end

	xml_xinclude_no_href: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_NO_HREF"
		end

	xml_xinclude_no_fallback: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_NO_FALLBACK"
		end

	xml_xinclude_href_uri: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_HREF_URI"
		end

	xml_xinclude_text_fragment: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_TEXT_FRAGMENT"
		end

	xml_xinclude_text_document: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_TEXT_DOCUMENT"
		end

	xml_xinclude_invalid_char: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_INVALID_CHAR"
		end

	xml_xinclude_build_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_BUILD_FAILED"
		end

	xml_xinclude_unknown_encoding: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_UNKNOWN_ENCODING"
		end

	xml_xinclude_multiple_root: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_MULTIPLE_ROOT"
		end

	xml_xinclude_xptr_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_XPTR_FAILED"
		end

	xml_xinclude_xptr_result: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_XPTR_RESULT"
		end

	xml_xinclude_include_in_include: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_INCLUDE_IN_INCLUDE"
		end

	xml_xinclude_fallbacks_in_include: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_FALLBACKS_IN_INCLUDE"
		end

	xml_xinclude_fallback_not_in_include: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_FALLBACK_NOT_IN_INCLUDE"
		end

	xml_xinclude_deprecated_ns: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_DEPRECATED_NS"
		end

	xml_xinclude_fragment_id: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XINCLUDE_FRAGMENT_ID"
		end

	xml_catalog_missing_attr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CATALOG_MISSING_ATTR"
		end

	xml_catalog_entry_broken: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CATALOG_ENTRY_BROKEN"
		end

	xml_catalog_prefer_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CATALOG_PREFER_VALUE"
		end

	xml_catalog_not_catalog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CATALOG_NOT_CATALOG"
		end

	xml_catalog_recursion: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CATALOG_RECURSION"
		end

	xml_schemap_prefix_undefined: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_PREFIX_UNDEFINED"
		end

	xml_schemap_attrformdefault_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_ATTRFORMDEFAULT_VALUE"
		end

	xml_schemap_attrgrp_noname_noref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_ATTRGRP_NONAME_NOREF"
		end

	xml_schemap_attr_noname_noref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_ATTR_NONAME_NOREF"
		end

	xml_schemap_complextype_noname_noref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COMPLEXTYPE_NONAME_NOREF"
		end

	xml_schemap_elemformdefault_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_ELEMFORMDEFAULT_VALUE"
		end

	xml_schemap_elem_noname_noref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_ELEM_NONAME_NOREF"
		end

	xml_schemap_extension_no_base: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_EXTENSION_NO_BASE"
		end

	xml_schemap_facet_no_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_FACET_NO_VALUE"
		end

	xml_schemap_failed_build_import: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_FAILED_BUILD_IMPORT"
		end

	xml_schemap_group_noname_noref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_GROUP_NONAME_NOREF"
		end

	xml_schemap_import_namespace_not_uri: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_IMPORT_NAMESPACE_NOT_URI"
		end

	xml_schemap_import_redefine_nsname: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_IMPORT_REDEFINE_NSNAME"
		end

	xml_schemap_import_schema_not_uri: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_IMPORT_SCHEMA_NOT_URI"
		end

	xml_schemap_invalid_boolean: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_BOOLEAN"
		end

	xml_schemap_invalid_enum: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_ENUM"
		end

	xml_schemap_invalid_facet: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_FACET"
		end

	xml_schemap_invalid_facet_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_FACET_VALUE"
		end

	xml_schemap_invalid_maxoccurs: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_MAXOCCURS"
		end

	xml_schemap_invalid_minoccurs: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_MINOCCURS"
		end

	xml_schemap_invalid_ref_and_subtype: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_REF_AND_SUBTYPE"
		end

	xml_schemap_invalid_white_space: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_WHITE_SPACE"
		end

	xml_schemap_noattr_noref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_NOATTR_NOREF"
		end

	xml_schemap_notation_no_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_NOTATION_NO_NAME"
		end

	xml_schemap_notype_noref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_NOTYPE_NOREF"
		end

	xml_schemap_ref_and_subtype: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_REF_AND_SUBTYPE"
		end

	xml_schemap_restriction_noname_noref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_RESTRICTION_NONAME_NOREF"
		end

	xml_schemap_simpletype_noname: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SIMPLETYPE_NONAME"
		end

	xml_schemap_type_and_subtype: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_TYPE_AND_SUBTYPE"
		end

	xml_schemap_unknown_all_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_ALL_CHILD"
		end

	xml_schemap_unknown_anyattribute_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_ANYATTRIBUTE_CHILD"
		end

	xml_schemap_unknown_attr_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_ATTR_CHILD"
		end

	xml_schemap_unknown_attrgrp_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_ATTRGRP_CHILD"
		end

	xml_schemap_unknown_attribute_group: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_ATTRIBUTE_GROUP"
		end

	xml_schemap_unknown_base_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_BASE_TYPE"
		end

	xml_schemap_unknown_choice_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_CHOICE_CHILD"
		end

	xml_schemap_unknown_complexcontent_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_COMPLEXCONTENT_CHILD"
		end

	xml_schemap_unknown_complextype_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_COMPLEXTYPE_CHILD"
		end

	xml_schemap_unknown_elem_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_ELEM_CHILD"
		end

	xml_schemap_unknown_extension_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_EXTENSION_CHILD"
		end

	xml_schemap_unknown_facet_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_FACET_CHILD"
		end

	xml_schemap_unknown_facet_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_FACET_TYPE"
		end

	xml_schemap_unknown_group_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_GROUP_CHILD"
		end

	xml_schemap_unknown_import_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_IMPORT_CHILD"
		end

	xml_schemap_unknown_list_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_LIST_CHILD"
		end

	xml_schemap_unknown_notation_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_NOTATION_CHILD"
		end

	xml_schemap_unknown_processcontent_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_PROCESSCONTENT_CHILD"
		end

	xml_schemap_unknown_ref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_REF"
		end

	xml_schemap_unknown_restriction_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_RESTRICTION_CHILD"
		end

	xml_schemap_unknown_schemas_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_SCHEMAS_CHILD"
		end

	xml_schemap_unknown_sequence_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_SEQUENCE_CHILD"
		end

	xml_schemap_unknown_simplecontent_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_SIMPLECONTENT_CHILD"
		end

	xml_schemap_unknown_simpletype_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_SIMPLETYPE_CHILD"
		end

	xml_schemap_unknown_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_TYPE"
		end

	xml_schemap_unknown_union_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_UNION_CHILD"
		end

	xml_schemap_elem_default_fixed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_ELEM_DEFAULT_FIXED"
		end

	xml_schemap_regexp_invalid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_REGEXP_INVALID"
		end

	xml_schemap_failed_load: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_FAILED_LOAD"
		end

	xml_schemap_nothing_to_parse: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_NOTHING_TO_PARSE"
		end

	xml_schemap_noroot: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_NOROOT"
		end

	xml_schemap_redefined_group: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_REDEFINED_GROUP"
		end

	xml_schemap_redefined_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_REDEFINED_TYPE"
		end

	xml_schemap_redefined_element: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_REDEFINED_ELEMENT"
		end

	xml_schemap_redefined_attrgroup: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_REDEFINED_ATTRGROUP"
		end

	xml_schemap_redefined_attr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_REDEFINED_ATTR"
		end

	xml_schemap_redefined_notation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_REDEFINED_NOTATION"
		end

	xml_schemap_failed_parse: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_FAILED_PARSE"
		end

	xml_schemap_unknown_prefix: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_PREFIX"
		end

	xml_schemap_def_and_prefix: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_DEF_AND_PREFIX"
		end

	xml_schemap_unknown_include_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_INCLUDE_CHILD"
		end

	xml_schemap_include_schema_not_uri: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INCLUDE_SCHEMA_NOT_URI"
		end

	xml_schemap_include_schema_no_uri: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INCLUDE_SCHEMA_NO_URI"
		end

	xml_schemap_not_schema: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_NOT_SCHEMA"
		end

	xml_schemap_unknown_member_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNKNOWN_MEMBER_TYPE"
		end

	xml_schemap_invalid_attr_use: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_ATTR_USE"
		end

	xml_schemap_recursive: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_RECURSIVE"
		end

	xml_schemap_supernumerous_list_item_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SUPERNUMEROUS_LIST_ITEM_TYPE"
		end

	xml_schemap_invalid_attr_combination: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_ATTR_COMBINATION"
		end

	xml_schemap_invalid_attr_inline_combination: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_ATTR_INLINE_COMBINATION"
		end

	xml_schemap_missing_simpletype_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_MISSING_SIMPLETYPE_CHILD"
		end

	xml_schemap_invalid_attr_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INVALID_ATTR_NAME"
		end

	xml_schemap_ref_and_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_REF_AND_CONTENT"
		end

	xml_schemap_ct_props_correct_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_CT_PROPS_CORRECT_1"
		end

	xml_schemap_ct_props_correct_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_CT_PROPS_CORRECT_2"
		end

	xml_schemap_ct_props_correct_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_CT_PROPS_CORRECT_3"
		end

	xml_schemap_ct_props_correct_4: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_CT_PROPS_CORRECT_4"
		end

	xml_schemap_ct_props_correct_5: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_CT_PROPS_CORRECT_5"
		end

	xml_schemap_derivation_ok_restriction_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_1"
		end

	xml_schemap_derivation_ok_restriction_2_1_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_1"
		end

	xml_schemap_derivation_ok_restriction_2_1_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_2"
		end

	xml_schemap_derivation_ok_restriction_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_2"
		end

	xml_schemap_derivation_ok_restriction_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_3"
		end

	xml_schemap_wildcard_invalid_ns_member: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_WILDCARD_INVALID_NS_MEMBER"
		end

	xml_schemap_intersection_not_expressible: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INTERSECTION_NOT_EXPRESSIBLE"
		end

	xml_schemap_union_not_expressible: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_UNION_NOT_EXPRESSIBLE"
		end

	xml_schemap_src_import_3_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_IMPORT_3_1"
		end

	xml_schemap_src_import_3_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_IMPORT_3_2"
		end

	xml_schemap_derivation_ok_restriction_4_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_1"
		end

	xml_schemap_derivation_ok_restriction_4_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_2"
		end

	xml_schemap_derivation_ok_restriction_4_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_3"
		end

	xml_schemap_cos_ct_extends_1_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_CT_EXTENDS_1_3"
		end

	xml_schemav_noroot: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_NOROOT"
		end

	xml_schemav_undeclaredelem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_UNDECLAREDELEM"
		end

	xml_schemav_nottoplevel: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_NOTTOPLEVEL"
		end

	xml_schemav_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_MISSING"
		end

	xml_schemav_wrongelem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_WRONGELEM"
		end

	xml_schemav_notype: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_NOTYPE"
		end

	xml_schemav_norollback: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_NOROLLBACK"
		end

	xml_schemav_isabstract: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_ISABSTRACT"
		end

	xml_schemav_notempty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_NOTEMPTY"
		end

	xml_schemav_elemcont: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_ELEMCONT"
		end

	xml_schemav_havedefault: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_HAVEDEFAULT"
		end

	xml_schemav_notnillable: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_NOTNILLABLE"
		end

	xml_schemav_extracontent: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_EXTRACONTENT"
		end

	xml_schemav_invalidattr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_INVALIDATTR"
		end

	xml_schemav_invalidelem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_INVALIDELEM"
		end

	xml_schemav_notdeterminist: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_NOTDETERMINIST"
		end

	xml_schemav_construct: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CONSTRUCT"
		end

	xml_schemav_internal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_INTERNAL"
		end

	xml_schemav_notsimple: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_NOTSIMPLE"
		end

	xml_schemav_attrunknown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_ATTRUNKNOWN"
		end

	xml_schemav_attrinvalid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_ATTRINVALID"
		end

	xml_schemav_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_VALUE"
		end

	xml_schemav_facet: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_FACET"
		end

	xml_schemav_cvc_datatype_valid_1_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_1"
		end

	xml_schemav_cvc_datatype_valid_1_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_2"
		end

	xml_schemav_cvc_datatype_valid_1_2_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_3"
		end

	xml_schemav_cvc_type_3_1_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_TYPE_3_1_1"
		end

	xml_schemav_cvc_type_3_1_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_TYPE_3_1_2"
		end

	xml_schemav_cvc_facet_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_FACET_VALID"
		end

	xml_schemav_cvc_length_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_LENGTH_VALID"
		end

	xml_schemav_cvc_minlength_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_MINLENGTH_VALID"
		end

	xml_schemav_cvc_maxlength_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_MAXLENGTH_VALID"
		end

	xml_schemav_cvc_mininclusive_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_MININCLUSIVE_VALID"
		end

	xml_schemav_cvc_maxinclusive_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_MAXINCLUSIVE_VALID"
		end

	xml_schemav_cvc_minexclusive_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_MINEXCLUSIVE_VALID"
		end

	xml_schemav_cvc_maxexclusive_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_MAXEXCLUSIVE_VALID"
		end

	xml_schemav_cvc_totaldigits_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_TOTALDIGITS_VALID"
		end

	xml_schemav_cvc_fractiondigits_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_FRACTIONDIGITS_VALID"
		end

	xml_schemav_cvc_pattern_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_PATTERN_VALID"
		end

	xml_schemav_cvc_enumeration_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ENUMERATION_VALID"
		end

	xml_schemav_cvc_complex_type_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_1"
		end

	xml_schemav_cvc_complex_type_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_2"
		end

	xml_schemav_cvc_complex_type_2_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_3"
		end

	xml_schemav_cvc_complex_type_2_4: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_2_4"
		end

	xml_schemav_cvc_elt_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_1"
		end

	xml_schemav_cvc_elt_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_2"
		end

	xml_schemav_cvc_elt_3_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_3_1"
		end

	xml_schemav_cvc_elt_3_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_3_2_1"
		end

	xml_schemav_cvc_elt_3_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_3_2_2"
		end

	xml_schemav_cvc_elt_4_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_4_1"
		end

	xml_schemav_cvc_elt_4_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_4_2"
		end

	xml_schemav_cvc_elt_4_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_4_3"
		end

	xml_schemav_cvc_elt_5_1_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_5_1_1"
		end

	xml_schemav_cvc_elt_5_1_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_5_1_2"
		end

	xml_schemav_cvc_elt_5_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_5_2_1"
		end

	xml_schemav_cvc_elt_5_2_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_5_2_2_1"
		end

	xml_schemav_cvc_elt_5_2_2_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_5_2_2_2_1"
		end

	xml_schemav_cvc_elt_5_2_2_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_5_2_2_2_2"
		end

	xml_schemav_cvc_elt_6: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_6"
		end

	xml_schemav_cvc_elt_7: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ELT_7"
		end

	xml_schemav_cvc_attribute_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ATTRIBUTE_1"
		end

	xml_schemav_cvc_attribute_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ATTRIBUTE_2"
		end

	xml_schemav_cvc_attribute_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ATTRIBUTE_3"
		end

	xml_schemav_cvc_attribute_4: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_ATTRIBUTE_4"
		end

	xml_schemav_cvc_complex_type_3_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_3_1"
		end

	xml_schemav_cvc_complex_type_3_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_1"
		end

	xml_schemav_cvc_complex_type_3_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_2"
		end

	xml_schemav_cvc_complex_type_4: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_4"
		end

	xml_schemav_cvc_complex_type_5_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_5_1"
		end

	xml_schemav_cvc_complex_type_5_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_5_2"
		end

	xml_schemav_element_content: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_ELEMENT_CONTENT"
		end

	xml_schemav_document_element_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_DOCUMENT_ELEMENT_MISSING"
		end

	xml_schemav_cvc_complex_type_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_COMPLEX_TYPE_1"
		end

	xml_schemav_cvc_au: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_AU"
		end

	xml_schemav_cvc_type_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_TYPE_1"
		end

	xml_schemav_cvc_type_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_TYPE_2"
		end

	xml_schemav_cvc_idc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_IDC"
		end

	xml_schemav_cvc_wildcard: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_CVC_WILDCARD"
		end

	xml_schemav_misc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAV_MISC"
		end

	xml_xptr_unknown_scheme: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPTR_UNKNOWN_SCHEME"
		end

	xml_xptr_childseq_start: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPTR_CHILDSEQ_START"
		end

	xml_xptr_eval_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPTR_EVAL_FAILED"
		end

	xml_xptr_extra_objects: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_XPTR_EXTRA_OBJECTS"
		end

	xml_c14n_create_ctxt: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_C14N_CREATE_CTXT"
		end

	xml_c14n_requires_utf8: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_C14N_REQUIRES_UTF8"
		end

	xml_c14n_create_stack: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_C14N_CREATE_STACK"
		end

	xml_c14n_invalid_node: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_C14N_INVALID_NODE"
		end

	xml_c14n_unknow_node: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_C14N_UNKNOW_NODE"
		end

	xml_c14n_relative_namespace: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_C14N_RELATIVE_NAMESPACE"
		end

	xml_ftp_pasv_answer: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FTP_PASV_ANSWER"
		end

	xml_ftp_epsv_answer: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FTP_EPSV_ANSWER"
		end

	xml_ftp_accnt: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FTP_ACCNT"
		end

	xml_ftp_url_syntax: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FTP_URL_SYNTAX"
		end

	xml_http_url_syntax: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_HTTP_URL_SYNTAX"
		end

	xml_http_use_ip: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_HTTP_USE_IP"
		end

	xml_http_unknown_host: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_HTTP_UNKNOWN_HOST"
		end

	xml_schemap_src_simple_type_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_SIMPLE_TYPE_1"
		end

	xml_schemap_src_simple_type_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_SIMPLE_TYPE_2"
		end

	xml_schemap_src_simple_type_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_SIMPLE_TYPE_3"
		end

	xml_schemap_src_simple_type_4: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_SIMPLE_TYPE_4"
		end

	xml_schemap_src_resolve: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_RESOLVE"
		end

	xml_schemap_src_restriction_base_or_simpletype: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_RESTRICTION_BASE_OR_SIMPLETYPE"
		end

	xml_schemap_src_list_itemtype_or_simpletype: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_LIST_ITEMTYPE_OR_SIMPLETYPE"
		end

	xml_schemap_src_union_membertypes_or_simpletypes: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_UNION_MEMBERTYPES_OR_SIMPLETYPES"
		end

	xml_schemap_st_props_correct_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_ST_PROPS_CORRECT_1"
		end

	xml_schemap_st_props_correct_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_ST_PROPS_CORRECT_2"
		end

	xml_schemap_st_props_correct_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_ST_PROPS_CORRECT_3"
		end

	xml_schemap_cos_st_restricts_1_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_1_1"
		end

	xml_schemap_cos_st_restricts_1_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_1_2"
		end

	xml_schemap_cos_st_restricts_1_3_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_1_3_1"
		end

	xml_schemap_cos_st_restricts_1_3_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_1_3_2"
		end

	xml_schemap_cos_st_restricts_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_2_1"
		end

	xml_schemap_cos_st_restricts_2_3_1_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_1"
		end

	xml_schemap_cos_st_restricts_2_3_1_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_2"
		end

	xml_schemap_cos_st_restricts_2_3_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_1"
		end

	xml_schemap_cos_st_restricts_2_3_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_2"
		end

	xml_schemap_cos_st_restricts_2_3_2_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_3"
		end

	xml_schemap_cos_st_restricts_2_3_2_4: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_4"
		end

	xml_schemap_cos_st_restricts_2_3_2_5: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_5"
		end

	xml_schemap_cos_st_restricts_3_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_3_1"
		end

	xml_schemap_cos_st_restricts_3_3_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1"
		end

	xml_schemap_cos_st_restricts_3_3_1_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1_2"
		end

	xml_schemap_cos_st_restricts_3_3_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_2"
		end

	xml_schemap_cos_st_restricts_3_3_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_1"
		end

	xml_schemap_cos_st_restricts_3_3_2_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_3"
		end

	xml_schemap_cos_st_restricts_3_3_2_4: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_4"
		end

	xml_schemap_cos_st_restricts_3_3_2_5: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_5"
		end

	xml_schemap_cos_st_derived_ok_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_DERIVED_OK_2_1"
		end

	xml_schemap_cos_st_derived_ok_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ST_DERIVED_OK_2_2"
		end

	xml_schemap_s4s_elem_not_allowed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_S4S_ELEM_NOT_ALLOWED"
		end

	xml_schemap_s4s_elem_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_S4S_ELEM_MISSING"
		end

	xml_schemap_s4s_attr_not_allowed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_S4S_ATTR_NOT_ALLOWED"
		end

	xml_schemap_s4s_attr_missing: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_S4S_ATTR_MISSING"
		end

	xml_schemap_s4s_attr_invalid_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_S4S_ATTR_INVALID_VALUE"
		end

	xml_schemap_src_element_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ELEMENT_1"
		end

	xml_schemap_src_element_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ELEMENT_2_1"
		end

	xml_schemap_src_element_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ELEMENT_2_2"
		end

	xml_schemap_src_element_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ELEMENT_3"
		end

	xml_schemap_p_props_correct_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_P_PROPS_CORRECT_1"
		end

	xml_schemap_p_props_correct_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_P_PROPS_CORRECT_2_1"
		end

	xml_schemap_p_props_correct_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_P_PROPS_CORRECT_2_2"
		end

	xml_schemap_e_props_correct_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_E_PROPS_CORRECT_2"
		end

	xml_schemap_e_props_correct_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_E_PROPS_CORRECT_3"
		end

	xml_schemap_e_props_correct_4: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_E_PROPS_CORRECT_4"
		end

	xml_schemap_e_props_correct_5: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_E_PROPS_CORRECT_5"
		end

	xml_schemap_e_props_correct_6: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_E_PROPS_CORRECT_6"
		end

	xml_schemap_src_include: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_INCLUDE"
		end

	xml_schemap_src_attribute_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ATTRIBUTE_1"
		end

	xml_schemap_src_attribute_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ATTRIBUTE_2"
		end

	xml_schemap_src_attribute_3_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ATTRIBUTE_3_1"
		end

	xml_schemap_src_attribute_3_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ATTRIBUTE_3_2"
		end

	xml_schemap_src_attribute_4: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ATTRIBUTE_4"
		end

	xml_schemap_no_xmlns: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_NO_XMLNS"
		end

	xml_schemap_no_xsi: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_NO_XSI"
		end

	xml_schemap_cos_valid_default_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_VALID_DEFAULT_1"
		end

	xml_schemap_cos_valid_default_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_VALID_DEFAULT_2_1"
		end

	xml_schemap_cos_valid_default_2_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_VALID_DEFAULT_2_2_1"
		end

	xml_schemap_cos_valid_default_2_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_VALID_DEFAULT_2_2_2"
		end

	xml_schemap_cvc_simple_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_CVC_SIMPLE_TYPE"
		end

	xml_schemap_cos_ct_extends_1_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_CT_EXTENDS_1_1"
		end

	xml_schemap_src_import_1_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_IMPORT_1_1"
		end

	xml_schemap_src_import_1_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_IMPORT_1_2"
		end

	xml_schemap_src_import_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_IMPORT_2"
		end

	xml_schemap_src_import_2_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_IMPORT_2_1"
		end

	xml_schemap_src_import_2_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_IMPORT_2_2"
		end

	xml_schemap_internal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_INTERNAL"
		end

	xml_schemap_not_deterministic: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_NOT_DETERMINISTIC"
		end

	xml_schemap_src_attribute_group_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_1"
		end

	xml_schemap_src_attribute_group_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_2"
		end

	xml_schemap_src_attribute_group_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_3"
		end

	xml_schemap_mg_props_correct_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_MG_PROPS_CORRECT_1"
		end

	xml_schemap_mg_props_correct_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_MG_PROPS_CORRECT_2"
		end

	xml_schemap_src_ct_1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_CT_1"
		end

	xml_schemap_derivation_ok_restriction_2_1_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_3"
		end

	xml_schemap_au_props_correct_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_AU_PROPS_CORRECT_2"
		end

	xml_schemap_a_props_correct_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_A_PROPS_CORRECT_2"
		end

	xml_schemap_c_props_correct: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_C_PROPS_CORRECT"
		end

	xml_schemap_src_redefine: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_REDEFINE"
		end

	xml_schemap_src_import: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_SRC_IMPORT"
		end

	xml_schemap_warn_skip_schema: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_WARN_SKIP_SCHEMA"
		end

	xml_schemap_warn_unlocated_schema: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_WARN_UNLOCATED_SCHEMA"
		end

	xml_schemap_warn_attr_redecl_proh: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_WARN_ATTR_REDECL_PROH"
		end

	xml_schemap_warn_attr_pointless_proh: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_WARN_ATTR_POINTLESS_PROH"
		end

	xml_schemap_ag_props_correct: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_AG_PROPS_CORRECT"
		end

	xml_schemap_cos_ct_extends_1_2: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_CT_EXTENDS_1_2"
		end

	xml_schemap_au_props_correct: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_AU_PROPS_CORRECT"
		end

	xml_schemap_a_props_correct_3: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_A_PROPS_CORRECT_3"
		end

	xml_schemap_cos_all_limited: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_SCHEMAP_COS_ALL_LIMITED"
		end

	xml_module_open: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_MODULE_OPEN"
		end

	xml_module_close: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_MODULE_CLOSE"
		end

	xml_check_found_element: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_ELEMENT"
		end

	xml_check_found_attribute: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_ATTRIBUTE"
		end

	xml_check_found_text: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_TEXT"
		end

	xml_check_found_cdata: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_CDATA"
		end

	xml_check_found_entityref: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_ENTITYREF"
		end

	xml_check_found_entity: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_ENTITY"
		end

	xml_check_found_pi: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_PI"
		end

	xml_check_found_comment: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_COMMENT"
		end

	xml_check_found_doctype: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_DOCTYPE"
		end

	xml_check_found_fragment: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_FRAGMENT"
		end

	xml_check_found_notation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_FOUND_NOTATION"
		end

	xml_check_unknown_node: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_UNKNOWN_NODE"
		end

	xml_check_entity_type: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_ENTITY_TYPE"
		end

	xml_check_no_parent: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NO_PARENT"
		end

	xml_check_no_doc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NO_DOC"
		end

	xml_check_no_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NO_NAME"
		end

	xml_check_no_elem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NO_ELEM"
		end

	xml_check_wrong_doc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_WRONG_DOC"
		end

	xml_check_no_prev: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NO_PREV"
		end

	xml_check_wrong_prev: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_WRONG_PREV"
		end

	xml_check_no_next: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NO_NEXT"
		end

	xml_check_wrong_next: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_WRONG_NEXT"
		end

	xml_check_not_dtd: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NOT_DTD"
		end

	xml_check_not_attr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NOT_ATTR"
		end

	xml_check_not_attr_decl: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NOT_ATTR_DECL"
		end

	xml_check_not_elem_decl: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NOT_ELEM_DECL"
		end

	xml_check_not_entity_decl: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NOT_ENTITY_DECL"
		end

	xml_check_not_ns_decl: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NOT_NS_DECL"
		end

	xml_check_no_href: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NO_HREF"
		end

	xml_check_wrong_parent: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_WRONG_PARENT"
		end

	xml_check_ns_scope: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NS_SCOPE"
		end

	xml_check_ns_ancestor: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NS_ANCESTOR"
		end

	xml_check_not_utf8: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NOT_UTF8"
		end

	xml_check_no_dict: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NO_DICT"
		end

	xml_check_not_ncname: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NOT_NCNAME"
		end

	xml_check_outside_dict: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_OUTSIDE_DICT"
		end

	xml_check_wrong_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_WRONG_NAME"
		end

	xml_check_name_not_null: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_CHECK_NAME_NOT_NULL"
		end

	xml_i18n_no_name: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_I18N_NO_NAME"
		end

	xml_i18n_no_handler: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_I18N_NO_HANDLER"
		end

	xml_i18n_excess_handler: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_I18N_EXCESS_HANDLER"
		end

	xml_i18n_conv_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_I18N_CONV_FAILED"
		end

	xml_i18n_no_output: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_I18N_NO_OUTPUT"
		end


end

