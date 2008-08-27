-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class LIBGDA_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_drop_table (a_cnn: POINTER; a_table_name: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_create_table (a_cnn: POINTER; a_table_name: POINTER; an_error: POINTER; ): INTEGER_32 is
			-- Variadic call
		external "C use <libgda/libgda.h>"
		end

	gda_execute_sql_command (a_cnn: POINTER; a_sql: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_execute_select_command (a_cnn: POINTER; a_sql: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_delete_row_from_table (a_cnn: POINTER; a_table_name: POINTER; a_condition_column_name: POINTER; a_condition: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_update_values_in_table (a_cnn: POINTER; a_table_name: POINTER; a_condition_column_name: POINTER; a_condition: POINTER; an_error: POINTER; ): INTEGER_32 is
			-- Variadic call
		external "C use <libgda/libgda.h>"
		end

	gda_update_value_in_table (a_cnn: POINTER; a_table_name: POINTER; a_search_for_column: POINTER; a_condition: POINTER; a_column_name: POINTER; a_new_value: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_insert_row_into_table_from_string (a_cnn: POINTER; a_table_name: POINTER; an_error: POINTER; ): INTEGER_32 is
			-- Variadic call
		external "C use <libgda/libgda.h>"
		end

	gda_insert_row_into_table (a_cnn: POINTER; a_table_name: POINTER; an_error: POINTER; ): INTEGER_32 is
			-- Variadic call
		external "C use <libgda/libgda.h>"
		end

	gda_open_connection (a_dsn: POINTER; an_username: POINTER; a_password: POINTER; an_options: INTEGER_32; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_main_quit is
		external "C use <libgda/libgda.h>"
		end

	gda_main_run (an_init_func: POINTER; an_user_data: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_get_default_dict: POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_init (an_app_id: POINTER; a_version: POINTER; a_nargs: INTEGER_32; an_args: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_general_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
