-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_MODEL_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_model_dump_as_string (a_model: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_dump (a_model: POINTER; a_to_stream: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_import_from_file (a_model: POINTER; a_file: POINTER; a_cols_trans: POINTER; an_options: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_import_from_string (a_model: POINTER; a_string: POINTER; a_cols_trans: POINTER; an_options: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_import_from_model (a_to: POINTER; a_from: POINTER; an_overwrite: INTEGER_32; a_cols_trans: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_export_to_file (a_model: POINTER; a_format: INTEGER_32; a_file: POINTER; a_cols: POINTER; a_nb_cols: INTEGER_32; a_rows: POINTER; a_nb_rows: INTEGER_32; an_options: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_export_to_string (a_model: POINTER; a_format: INTEGER_32; a_cols: POINTER; a_nb_cols: INTEGER_32; a_rows: POINTER; a_nb_rows: INTEGER_32; an_options: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_send_hint (a_model: POINTER; a_hint: INTEGER_32; a_hint_value: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_row_from_values (a_model: POINTER; a_values: POINTER; a_cols_index: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_remove_row (a_model: POINTER; a_row: INTEGER_32; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_append_values (a_model: POINTER; a_values: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_append_row (a_model: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_set_values (a_model: POINTER; a_row: INTEGER_32; a_values: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_set_value_at (a_model: POINTER; a_col: INTEGER_32; a_row: INTEGER_32; a_value: POINTER; an_error: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_thaw (a_model: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_freeze (a_model: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_create_iter (a_model: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_attributes_at (a_model: POINTER; a_col: INTEGER_32; a_row: INTEGER_32): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_value_at_col_name (a_model: POINTER; a_column_name: POINTER; a_row: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_value_at (a_model: POINTER; a_col: INTEGER_32; a_row: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_set_column_title (a_model: POINTER; a_col: INTEGER_32; a_title: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_column_title (a_model: POINTER; a_col: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_set_column_name (a_model: POINTER; a_col: INTEGER_32; a_name: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_column_name (a_model: POINTER; a_col: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_column_index_by_name (a_model: POINTER; a_name: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_describe_column (a_model: POINTER; a_col: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_n_columns (a_model: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_n_rows (a_model: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_access_flags (a_model: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_is_updatable (a_model: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
