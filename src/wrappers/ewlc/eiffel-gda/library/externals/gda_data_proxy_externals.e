-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_PROXY_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_proxy_get_filtered_n_rows (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_set_ordering_column (a_proxy: POINTER; a_col: INTEGER_32; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_filter_expr (a_proxy: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_set_filter_expr (a_proxy: POINTER; a_filter_expr: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_sample_end (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_sample_start (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_set_sample_start (a_proxy: POINTER; a_sample_start: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_sample_size (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_set_sample_size (a_proxy: POINTER; a_sample_size: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_cancel_all_changes (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_apply_all_changes (a_proxy: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_cancel_row_changes (a_proxy: POINTER; a_proxy_row: INTEGER_32; a_col: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_apply_row_changes (a_proxy: POINTER; a_proxy_row: INTEGER_32; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_n_modified_rows (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_n_new_rows (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_has_changed (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_row_has_changed (a_proxy: POINTER; a_proxy_row: INTEGER_32): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_find_row_from_values (a_proxy: POINTER; a_values: POINTER; a_cols_index: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_row_is_inserted (a_proxy: POINTER; a_proxy_row: INTEGER_32): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_row_is_deleted (a_proxy: POINTER; a_proxy_row: INTEGER_32): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_undelete (a_proxy: POINTER; a_proxy_row: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_delete (a_proxy: POINTER; a_proxy_row: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_proxied_model_row (a_proxy: POINTER; a_proxy_row: INTEGER_32): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_alter_value_attributes (a_proxy: POINTER; a_proxy_row: INTEGER_32; a_col: INTEGER_32; an_alter_flags: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_value_attributes (a_proxy: POINTER; a_proxy_row: INTEGER_32; a_col: INTEGER_32): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_values (a_proxy: POINTER; a_proxy_row: INTEGER_32; a_cols_index: POINTER; a_n_cols: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_is_read_only (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_proxied_model_n_rows (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_proxied_model_n_cols (a_proxy: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_proxied_model (a_proxy: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_new (a_model: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_proxy_error_quark: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
