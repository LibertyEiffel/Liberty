indexing
	description: "   libgda -- Library initialization."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class LIBGDA

insert
	SINGLETON
	SHARED_ARCHETYPE_DICTIONARY[G_OBJECT] 
	
creation  {SHARED_LIBGDA}
	make
	
feature {} -- creation
	make is
		do
			-- Store archetypes
			store_archetype(create {GDA_DICT}.dummy)
		end
	
feature {} -- size
	is_initialized: BOOLEAN
			-- Has the Gnome Data Access library been initialized?
	
	init (an_application_id, a_version: STRING; some_arguments: FAST_ARRAY [STRING]) is
			-- Initializes the GDA library.  `an_application_id': name of
			-- the program. `a_version': revision number of the program.
			-- `some_arguments': list of arguments, usually argv from 
			-- main(). TODO: `some_arguments' is currently ignored. 
			-- Support it.
		require
			id_not_void: an_application_id /= Void
			version_not_void: a_version /= Void
			arguments_not_void: some_arguments /= Void
		once
			-- nargs :   number of arguments, usually argc from main().
			-- args :    list of arguments, usually argv from main().
			gda_init (an_application_id.to_external, a_version.to_external,
						 some_arguments.count, some_arguments.to_external)
			is_initialized := True
		end
	
	run is
			-- Runs the GDA main loop, which is nothing more than the
			-- Bonobo main loop, but with internally added stuff specific
			-- for applications using libgda.
		
			-- You can specify a function to be called after everything
			-- has been correctly initialized (that is, for initializing
			-- your own stuff).

			-- TODO: support for `an_initialization_function', a function to
			-- be called when everything has been initialized.
		do
			gda_main_run (default_pointer, default_pointer)
		end

	quit is
			-- Exits the main loop.
		do
			gda_main_quit
		end

feature {} -- TODO: Convenient functions - Do quickly some actions

	-- GdaConnection*      gda_open_connection                 (const gchar *dsn,
	--                                                          const gchar *username,
	--                                                          const gchar *password,
	--                                                          GdaConnectionOptions options,
	--                                                          GError **error);
	-- GdaDataModel*       gda_execute_select_command          (GdaConnection *cnn,
	--                                                          const gchar *sql,
	--                                                          GError **error);
	-- gint                gda_execute_sql_command             (GdaConnection *cnn,
	--                                                          const gchar *sql,
	--                                                          GError **error);
	-- gboolean            gda_create_table                    (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          GError **error,
	--                                                          ...);
	-- gboolean            gda_drop_table                      (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          GError **error);
	-- gboolean            gda_insert_row_into_table           (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          GError **error,
	--                                                          ...);
	-- gboolean            gda_insert_row_into_table_from_string
	--                                                         (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          GError **error,
	--                                                          ...);
	-- gboolean            gda_update_value_in_table           (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          const gchar *search_for_column,
	--                                                          const GValue *condition,
	--                                                          const gchar *column_name,
	--                                                          const GValue *new_value,
	--                                                          GError **error);
	-- gboolean            gda_update_values_in_table          (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          const gchar *condition_column_name,
	--                                                          const GValue *condition,
	--                                                          GError **error,
	--                                                          ...);
	-- gboolean            gda_delete_row_from_table           (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          const gchar *condition_column_name,
	--                                                          const GValue *condition,
	--                                                          GError **error);
	--
	--Description
	--
	--Details
	--
	--  gda_open_connection ()
	--
	-- GdaConnection*      gda_open_connection                 (const gchar *dsn,
	--                                                          const gchar *username,
	--                                                          const gchar *password,
	--                                                          GdaConnectionOptions options,
	--                                                          GError **error);
	--
	--   Convenient function to open a connection to a Data Source, see also
	--   gda_client_open_connection().
	--
	--   dsn :      a data source name
	--   username :
	--   password :
	--   options :
	--   error :    a place to store errors, or NULL
	--   Returns :  a GdaConnection object if the connection was sucessfully
	--              opened, NULL otherwise
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_execute_select_command ()
	--
	-- GdaDataModel*       gda_execute_select_command          (GdaConnection *cnn,
	--                                                          const gchar *sql,
	--                                                          GError **error);
	--
	--   Execute a SQL SELECT command over an opened connection.
	--
	--   Return: a new GdaDataModel if succesfull, NULL otherwise
	--
	--   cnn :     an opened connection
	--   sql :     a query statament must begin with "SELECT"
	--   error :   a place to store errors, or NULL
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_execute_sql_command ()
	--
	-- gint                gda_execute_sql_command             (GdaConnection *cnn,
	--                                                          const gchar *sql,
	--                                                          GError **error);
	--
	--   This is a convenient function to execute a SQL command over the opened
	--   connection.
	--
	--   cnn :     an opened connection
	--   sql :     a query statament must begin with "SELECT"
	--   error :   a place to store errors, or NULL
	--   Returns : the number of rows affected or -1.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_create_table ()
	--
	-- gboolean            gda_create_table                    (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          GError **error,
	--                                                          ...);
	--
	--   Create a Table over an opened connection using a pair list of colum name
	--   and GType as arguments, you need to finish the list using NULL.
	--
	--   This is just a convenient function to create tables quickly, using
	--   defaults for the provider and converting the GType passed to the
	--   corresponding type in the provider; to use a custom type or more advanced
	--   characteristics in a specific provider use the GdaServerOperation
	--   framework.
	--
	--   cnn :        an opened connection
	--   table_name : num_columns
	--   error :      a place to store errors, or NULL
	--   ... :        pairs of column name and GType, finish with NULL
	--   Returns :    TRUE if the table was created; FALSE and set error otherwise
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_drop_table ()
	--
	-- gboolean            gda_drop_table                      (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          GError **error);
	--
	--   This is just a convenient function to drop a table in an opened
	--   connection.
	--
	--   cnn :        an opened connection
	--   table_name :
	--   error :      a place to store errors, or NULL
	--   Returns :    TRUE if the table was dropped
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_insert_row_into_table ()
	--
	-- gboolean            gda_insert_row_into_table           (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          GError **error,
	--                                                          ...);
	--
	--   This is just a convenient function to insert a row with the values given
	--   as argument. The values must correspond with the GType of the column to
	--   set, otherwise throw to an error. Finish the list with NULL.
	--
	--   The arguments must be pairs of column name followed by his value.
	--
	--   cnn :        an opened connection
	--   table_name :
	--   error :      a place to store errors, or NULL
	--   ... :        a list of string/GValue pairs where the string is the name of
	--                the column followed by its GValue to set in the insert
	--                operation, finished by NULL
	--   Returns :    TRUE if no error occurred, and FALSE and set error otherwise
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_insert_row_into_table_from_string ()
	--
	-- gboolean            gda_insert_row_into_table_from_string
	--                                                         (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          GError **error,
	--                                                          ...);
	--
	--   This is just a convenient function to insert a row with the values given
	--   as arguments. The values must be strings that could be converted to the
	--   type in the corresponding column. Finish the list with NULL.
	--
	--   The arguments must be pairs of column name followed by his value.
	--
	--   The SQL command is like: INSERT INTO table_name (column1, column2, ...)
	--   VALUES (value1, value2, ...)
	--
	--   cnn :        an opened connection
	--   table_name :
	--   error :      a place to store errors, or NULL
	--   ... :        a list of strings to be converted as value, finished by NULL
	--   Returns :    TRUE if no error occurred, and FALSE and set error otherwise
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_update_value_in_table ()
	--
	-- gboolean            gda_update_value_in_table           (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          const gchar *search_for_column,
	--                                                          const GValue *condition,
	--                                                          const gchar *column_name,
	--                                                          const GValue *new_value,
	--                                                          GError **error);
	--
	--   This is just a convenient function to update values in a table on a given
	--   column where the row is fitting the given condition.
	--
	--   The SQL command is like: UPDATE INTO table_name SET column_name =
	--   new_value WHERE search_for_column = condition
	--
	--   cnn :               an opened connection
	--   table_name :
	--   search_for_column : the name of the column to used in the WHERE condition
	--                       clause
	--   condition :         a GValue to used to find the value to be updated; it
	--                       must correspond with the GType of the column used to
	--                       search
	--   column_name :       the column containing the value to be updated
	--   new_value :         the new value to update to; the GValue must correspond
	--                       with the GType of the column to update
	--   error :             a place to store errors, or NULL
	--   Returns :           TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_update_values_in_table ()
	--
	-- gboolean            gda_update_values_in_table          (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          const gchar *condition_column_name,
	--                                                          const GValue *condition,
	--                                                          GError **error,
	--                                                          ...);
	--
	--   This is just a convenient function to update values in a table on a given
	--   column where the row is fitting the given condition.
	--
	--   The SQL command is like: UPDATE INTO table_name SET column1 = new_value1,
	--   column2 = new_value2 ... WHERE condition_column_name = condition
	--
	--   cnn :                   an opened connection
	--   table_name :            the name of the table where the update will be
	--                           done
	--   condition_column_name : the name of the column to used in the WHERE
	--                           condition clause
	--   condition :             a GValue to used to find the values to be updated;
	--                           it must correspond with the column's GType
	--   error :                 a place to store errors, or NULL
	--   ... :                   a list of string/GValue pairs where the string is
	--                           the name of the column to be updated followed by
	--                           the new GValue to set, finished by NULL
	--   Returns :               TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_delete_row_from_table ()
	--
	-- gboolean            gda_delete_row_from_table           (GdaConnection *cnn,
	--                                                          const gchar *table_name,
	--                                                          const gchar *condition_column_name,
	--                                                          const GValue *condition,
	--                                                          GError **error);
	--
	--   This is just a convenient function to delete the row fitting the given
	--   condition from the given table.
	--
	--   condition must be a valid GValue and must correspond with the GType of the
	--   column to use in the WHERE clause.
	--
	--   The SQL command is like: DELETE FROM table_name WHERE
	--   contition_column_name = condition
	--
	--   cnn :                   an opened connection
	--   table_name :
	--   condition_column_name : the name of the column to used in the WHERE
	--                           condition clause
	--   condition :             a GValue to used to find the row to be deleted
	--   error :                 a place to store errors, or NULL
	--   Returns :               TRUE if no error occurred, and FALSE and set error
	--                           otherwise

feature {} -- External calls
	gda_init (app_id, version: POINTER; nargs: INTEGER; args: POINTER) is
			--  void gda_init (const gchar *app_id, const gchar *version, gint nargs, gchar *args[])
		external "C use <libgda/libgda.h>"
		end
	
	--  void (*GdaInitFunc) (gpointer user_data)
	
	gda_main_run (init_func, user_data: POINTER) is
			--  void gda_main_run (GdaInitFunc init_func, gpointer user_data)
		external "C use <libgda/libgda.h>"
		end

	gda_main_quit is
			--  void gda_main_quit (void)
		external "C use <libgda/libgda.h>"
		end

end
