-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_UTIL_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_connection_string_split (a_string: POINTER; an_out_cnc_params: POINTER; an_out_provider: POINTER; an_out_username: POINTER; an_out_password: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_dsn_split (a_string: POINTER; an_out_dsn: POINTER; an_out_username: POINTER; an_out_password: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_rfc1738_decode (a_string: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_rfc1738_encode (a_string: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_compute_dml_statements (a_cnc: POINTER; a_select_stmt: POINTER; a_require_pk: INTEGER_32; an_insert_stmt: POINTER; an_update_stmt: POINTER; a_delete_stmt: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_alphanum_to_text (a_text: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_text_to_alphanum (a_text: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_utility_holder_load_attributes (a_holder: POINTER; a_node: POINTER; a_sources: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_utility_data_model_dump_data_to_xml (a_model: POINTER; a_parent: POINTER; a_cols: POINTER; a_nb_cols: INTEGER_32; a_rows: POINTER; a_nb_rows: INTEGER_32; an_use_col_ids: INTEGER_32) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_utility_check_data_model (a_model: POINTER; a_nbcols: INTEGER_32; ): INTEGER_32 is
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_completion_list_get (a_cnc: POINTER; a_text: POINTER; a_start: INTEGER_32; an_end: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_identifier_equal (an_id1: POINTER; an_id2: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_identifier_hash (an_id: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_default_unescape_string (a_string: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_default_escape_string (a_string: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_g_type_from_string (a_str: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_g_type_to_string (a_type: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
