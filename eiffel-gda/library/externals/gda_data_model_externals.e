indexing
	description: "External calls for GDA_DATA_MODEL"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DATA_MODEL_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls
	gda_data_model_changed (a_model: POINTER) is
			-- void gda_data_model_changed (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_row_inserted (a_model: POINTER; a_row: INTEGER) is
			-- void gda_data_model_row_inserted (GdaDataModel *model, gint row);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_row_updated (a_model: POINTER; a_row: INTEGER) is
			-- void gda_data_model_row_updated (GdaDataModel *model, gint row);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_row_removed (a_model: POINTER; a_row: INTEGER) is
			-- void gda_data_model_row_removed (GdaDataModel *model, gint row);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_freeze (a_model: POINTER) is
			-- void gda_data_model_freeze (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_thaw (a_model: POINTER) is
			-- void gda_data_model_thaw (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
	end

	gda_data_model_get_access_flags (a_model: POINTER): INTEGER is
		--  guint gda_data_model_get_access_flags (GdaDataModel *model);
			-- TODO: Result is a guint, so it should be NATURAL
		external "C use <libgda/libgda.h>"
		ensure natural: Result >= 0
		end
	
	gda_data_model_get_n_rows (a_model: POINTER): INTEGER is
			-- gint gda_data_model_get_n_rows (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_get_n_columns (a_model: POINTER): INTEGER is
			-- gint gda_data_model_get_n_columns (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_describe_column (a_model: POINTER; a_col: INTEGER): POINTER is
		-- GdaColumn* gda_data_model_describe_column (GdaDataModel *model, gint col);
	external "C use <libgda/libgda.h>"
	end

	gda_data_model_get_column_title (a_model: POINTER; a_col: INTEGER): POINTER is
		-- const gchar* gda_data_model_get_column_title (GdaDataModel *model, gint col);
	external "C use <libgda/libgda.h>"
	end

	gda_data_model_set_column_title (a_model: POINTER; a_col: INTEGER; a_title: POINTER) is
		-- void gda_data_model_set_column_title (GdaDataModel *model, gint col, const gchar *title);
	external "C use <libgda/libgda.h>"
	end

	gda_data_model_get_attributes_at (a_model: POINTER; a_col: INTEGER; a_row: INTEGER): INTEGER is
			--  guint gda_data_model_get_attributes_at (GdaDataModel *model, gint col, gint row);
		-- TODO: Result is a guint, so it should be NATURAL
	external "C use <libgda/libgda.h>"
	ensure natural: Result >= 0
	end
	
	gda_data_model_get_value_at (a_model: POINTER; a_col: INTEGER; a_row: INTEGER): POINTER is
			-- const GValue* gda_data_model_get_value_at (GdaDataModel *model, gint col, gint row);
		external "C use <libgda/libgda.h>"
	end
	
	gda_data_model_set_value_at (a_model: POINTER; a_col: INTEGER; a_row: INTEGER; a_value, an_error_handle: POINTER): INTEGER is
			-- gboolean gda_data_model_set_value_at (GdaDataModel *model,
			-- gint col, gint row, const GValue *value, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_set_values (a_model: POINTER; a_row: INTEGER; some_values, an_error_handle: POINTER): INTEGER is
			-- gboolean gda_data_model_set_values (GdaDataModel *model,
			-- gint row, GList *values, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_create_iter (a_model: POINTER): POINTER is
			-- GdaDataModelIter* gda_data_model_create_iter (GdaDataModel
			-- *model);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_move_iter_at_row (a_model, an_iter: POINTER; a_row: INTEGER): INTEGER is
			-- gboolean gda_data_model_move_iter_at_row (GdaDataModel
			-- *model, GdaDataModelIter *iter, gint row);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_move_iter_next (a_model, an_iter: POINTER): INTEGER is
			-- gboolean gda_data_model_move_iter_next (GdaDataModel
			-- *model, GdaDataModelIter *iter);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_move_iter_prev (a_model, an_iter: POINTER): INTEGER is
			-- gboolean gda_data_model_move_iter_prev (GdaDataModel
			-- *model, GdaDataModelIter *iter);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_append_values (a_model, a_values, an_error_handle: POINTER): INTEGER is
			-- gint gda_data_model_append_values (GdaDataModel *model,
			-- const GList *values, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_append_row (a_model: POINTER; an_error_handle: POINTER): INTEGER is
			-- gint gda_data_model_append_row (GdaDataModel *model,
			-- GError **error);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_remove_row (a_model: POINTER; a_row: INTEGER; an_error_handle: POINTER): INTEGER is
			-- gboolean gda_data_model_remove_row (GdaDataModel *model,
			-- gint row, GError **error);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_get_row_from_values (a_model, some_values, cols_index: POINTER): INTEGER is
			-- gint gda_data_model_get_row_from_values (GdaDataModel
			-- *model, GSList *values, gint *cols_index);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_send_hint (a_model: POINTER; an_hint: INTEGER; a_hint_value: POINTER) is
		-- void gda_data_model_send_hint (GdaDataModel *model, GdaDataModelHint hint, const GValue *hint_value);
	external "C use <libgda/libgda.h>"
	end
	
	gda_data_model_export_to_string (a_model: POINTER; an_io_format: INTEGER; some_column_indexes: POINTER; a_nb_cols: INTEGER; some_options: POINTER): POINTER is
			-- gchar* gda_data_model_export_to_string (GdaDataModel
			-- *model, GdaDataModelIOFormat format, const gint *cols,
			-- gint nb_cols, GdaParameterList *options);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_export_to_file (a_model: POINTER; an_io_format: INTEGER; a_file, column_indexes: POINTER; a_nb_cols: INTEGER; some_options, an_error_handle: POINTER): INTEGER is
			-- gboolean gda_data_model_export_to_file (GdaDataModel
			-- *model, GdaDataModelIOFormat format, const gchar *file,
			-- const gint *cols, gint nb_cols, GdaParameterList *options,
			-- GError **error);
		external "C use <libgda/libgda.h>"
		end
	
	-- TODO: needs libxml2 gda_data_model_add_data_from_xml_node
	--	(a_model: POINTER; xmlNodePtr node, an_error_handle: POINTER):
	--	gboolean is gboolean gda_data_model_add_data_from_xml_node
	--	(GdaDataModel *model, xmlNodePtr node, GError **error); external
	--	"C use <libgda/libgda.h>" end

	gda_data_model_import_from_model (destination_model, source_model, cols_trans, an_error_handle: POINTER): INTEGER is
			-- gboolean gda_data_model_import_from_model (GdaDataModel
			-- *to, GdaDataModel *from, GHashTable *cols_trans, GError
			-- **error);
		external "C use <libgda/libgda.h>"
	end
	
	gda_data_model_import_from_string (a_model, a_string, cols_trans, some_options, an_error_handle: POINTER): INTEGER is
			-- gboolean gda_data_model_import_from_string (GdaDataModel
			-- *model, const gchar *string, GHashTable *cols_trans,
			-- GdaParameterList *options, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_import_from_file (a_model, a_file, cols_trans, some_options, an_error_handle: POINTER): INTEGER is
			-- gboolean gda_data_model_import_from_file (GdaDataModel
			-- *model, const gchar *file, GHashTable *cols_trans,
			-- GdaParameterList *options, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_dump (a_model, a_destionation_stream: POINTER) is
			-- void gda_data_model_dump (GdaDataModel *model, FILE
			-- *to_stream);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_dump_as_string (a_model: POINTER): POINTER is
			-- gchar* gda_data_model_dump_as_string (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end
	

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataModel)"
		end
end
