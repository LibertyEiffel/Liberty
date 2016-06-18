-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_PARSING_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_get_field_by_sql_naming_fields (a_query: POINTER; a_sql_name: POINTER; a_fields_list: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	parsed_create_complex_condition (a_query: POINTER; a_pdata: POINTER; a_where: POINTER; a_try_existing_field: INTEGER_32; a_targets_return: POINTER; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	parsed_create_global_query_field (a_query: POINTER; an_add_to_query: INTEGER_32; a_pdata: POINTER; a_field: POINTER; a_try_existing_field: INTEGER_32; a_new_field: POINTER; a_target_return: POINTER; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	parsed_create_delete_query (a_query: POINTER; a_del: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	parsed_create_insert_query (a_query: POINTER; an_insert: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	parsed_create_update_query (a_query: POINTER; an_update: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	parsed_create_select_query (a_query: POINTER; a_select: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	parse_data_compute_targets_hash (a_query: POINTER; a_pdata: POINTER)
		external "C use <libgda/libgda.h>"
		end

	parse_data_destroy (a_pdata: POINTER)
		external "C use <libgda/libgda.h>"
		end

	parse_data_new (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

end
