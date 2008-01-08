indexing
	description: "External calls for "
	copyright: "Copyright (C) 2007 $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_CONVENIENT_FUNCTIONS_EXTERNALS

inherit ANY undefine is_equal, copy, fill_tagged_out_memory end

feature {} -- Convenient functions extaernal calls
	gda_open_connection (a_dsn, a_username, a_password: POINTER; some_options: INTEGER; a_error: POINTER): POINTER is
			-- GdaConnection* gda_open_connection (const gchar *dsn, const gchar *username, const gchar *password, GdaConnectionOptions options, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_execute_select_command (a_cnn, a_sql, a_error: POINTER): POINTER is
			-- GdaDataModel* gda_execute_select_command (GdaConnection *cnn, const gchar *sql, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_execute_sql_command (a_cnn, a_sql, a_error: POINTER): INTEGER is
			-- gint gda_execute_sql_command (GdaConnection *cnn, const gchar *sql, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_create_table (a_cnn, a_table_name, a_error: POINTER): INTEGER is
			-- gboolean gda_create_table (GdaConnection *cnn, const gchar *table_name, GError **error, ...);
		external "C use <libgda/libgda.h>"
		end

	gda_drop_table (a_cnn, a_table_name, a_error: POINTER): INTEGER is
			-- gboolean gda_drop_table (GdaConnection *cnn, const gchar *table_name, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_insert_row_into_table (a_cnn, a_table_name, a_error: POINTER): INTEGER is
			-- gboolean gda_insert_row_into_table (GdaConnection *cnn, const gchar *table_name, GError **error, ...);
		external "C use <libgda/libgda.h>"
		end

	gda_insert_row_into_table_from_string (a_cnn, a_table_name, a_error: POINTER): INTEGER is
			-- gboolean gda_insert_row_into_table_from_string (GdaConnection *cnn, const gchar *table_name, GError **error, ...);
		external "C use <libgda/libgda.h>"
		end

	gda_update_value_in_table (a_cnn, a_table_name, a_search_for_column, a_condition, a_column_name, a_new_value, an_error: POINTER): INTEGER is
			-- gboolean gda_update_value_in_table (GdaConnection *cnn, const gchar *table_name, const gchar *search_for_column, const GValue *condition, const gchar *column_name, const GValue *new_value, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_update_values_in_table (a_cnn, a_table_name, a_condition_column_name, a_condition, a_error: POINTER): INTEGER is
			-- gboolean gda_update_values_in_table (GdaConnection *cnn, const gchar *table_name, const gchar *condition_column_name, const GValue *condition, GError **error, ...);
		external "C use <libgda/libgda.h>"
		end

	gda_delete_row_from_table (a_cnn, a_table_name, a_condition_column_name, a_condition, a_error: POINTER): INTEGER is
			-- gboolean gda_delete_row_from_table (GdaConnection *cnn, const gchar *table_name, const gchar *condition_column_name, const GValue *condition, GError **error);
		external "C use <libgda/libgda.h>"
		end
end
