-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_undeclare_condition (a_query: POINTER; a_cond: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_declare_condition (a_query: POINTER; a_cond: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_fields_by_target (a_query: POINTER; a_target: POINTER; a_visible_fields_only: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_order_fields_using_join_conds (a_query: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_expand_all_field (a_query: POINTER; a_target: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_first_field_for_target (a_query: POINTER; a_target: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_field_by_ref_field (a_query: POINTER; a_target: POINTER; a_ref_field: POINTER; a_field_state: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_field_by_param_name (a_query: POINTER; a_param_name: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_field_by_sql_naming (a_query: POINTER; a_sql_name: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_all_fields (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_add_field_from_sql (a_query: POINTER; a_field: POINTER; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_order_by_field (a_query: POINTER; a_field: POINTER; an_ascendant: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_set_order_by_field (a_query: POINTER; a_field: POINTER; an_order: INTEGER_32; an_ascendant: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_query_append_condition (a_query: POINTER; a_cond: POINTER; an_append_as_and: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_main_conditions (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_condition (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_set_condition (a_query: POINTER; a_cond: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_del_join (a_query: POINTER; a_join: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_add_join (a_query: POINTER; a_join: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_join_by_targets (a_query: POINTER; a_target1: POINTER; a_target2: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_joins (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_target_pkfields (a_query: POINTER; a_target: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_target_by_alias (a_query: POINTER; an_alias_or_name: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_target_by_xml_id (a_query: POINTER; a_xml_id: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_targets (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_del_target (a_query: POINTER; a_target: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_add_target (a_query: POINTER; a_target: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_param_sources (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_del_param_source (a_query: POINTER; a_param_source: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_add_param_source (a_query: POINTER; a_param_source: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_del_sub_query (a_query: POINTER; a_sub_query: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_add_sub_query (a_query: POINTER; a_sub_query: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_sub_queries (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_sql_text (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_set_sql_text (a_query: POINTER; a_sql: POINTER; an_error: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_execute (a_query: POINTER; a_params: POINTER; an_iter_model_only_requested: INTEGER_32; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_parameter_list (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_parameters (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_parent_query (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_well_formed (a_query: POINTER; a_context: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_modify_query (a_query: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_delete_query (a_query: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_update_query (a_query: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_insert_query (a_query: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_select_query (a_query: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_query_type_string (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_query_type (a_query: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_set_query_type (a_query: POINTER; a_type: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_query_new_from_sql (a_dict: POINTER; a_sql: POINTER; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_new_copy (an_orig: POINTER; a_replacements: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_new (a_dict: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
