indexing
	description: "Gnome Data Access library shared object."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GDA team
					
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

class GDA_MAIN

inherit WRAPPER_HANDLER redefine default_create end

insert
	SINGLETON  redefine default_create end
	SHARED_ARCHETYPES_DICTIONARY [GDA_OBJECT] redefine default_create end
	SHARED_G_ERROR redefine default_create end
	GDA_DICT_CONSTRAINT_TYPE_ENUM redefine default_create end
	GDA_CONFIG_EXTERNALS redefine default_create end
	
creation  {GDA} default_create

feature {} -- creation
	default_create is
		local 
			dummy_gda_dict: GDA_DICT
			dummy_gda_dict_table: GDA_DICT_TABLE
			dummy_gda_dict_type: GDA_DICT_TYPE
		do
			-- Store archetypes
			store_archetype(create {GDA_COLUMN}.dummy)
			create dummy_gda_dict.dummy
			store_archetype(dummy_gda_dict)
			store_archetype(create {GDA_DICT_AGGREGATE}.from_dict(dummy_gda_dict))
			store_archetype(create {GDA_DICT_DATABASE}.from_dict(dummy_gda_dict))
			store_archetype(create {GDA_DICT_FUNCTION}.from_dict(dummy_gda_dict))
			create dummy_gda_dict_table.from_dict(dummy_gda_dict)
			store_archetype(dummy_gda_dict_table)
			store_archetype(create {GDA_DICT_CONSTRAINT}.from_table(dummy_gda_dict_table,constraint_not_null))
			create dummy_gda_dict_type.from_dict(dummy_gda_dict)
			store_archetype(dummy_gda_dict_type)
			store_archetype(create {GDA_DICT_FIELD}.from_dict(dummy_gda_dict,dummy_gda_dict_type))
		end
	
feature 
	is_initialized: BOOLEAN
			-- Has the Gnome Data Access library been initialized?
	
	init (an_application_id, a_version: STRING; some_arguments: FAST_ARRAY [STRING]) is
			-- Initializes the GDA library with `an_application_id' as
			-- name of the program, `a_version' as revision number of the
			-- program.  `some_arguments' is a list of arguments, usually
			-- taken from ARGUMENTS.command_arguments. 
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

	default_dict: GDA_DICT is
			-- the default dictionary.
		local ptr: POINTER; factory: G_OBJECT_EXPANDED_FACTORY[GDA_DICT]
		do
			ptr:=gda_get_default_dict
			Result:=factory.existant_wrapper(ptr)
			if Result=Void then create Result.from_external_pointer(ptr) end
		ensure not_void: Result/=Void
		end

feature {} -- External calls
	gda_init (app_id, version: POINTER; nargs: INTEGER; args: POINTER) is
			--  void gda_init (const gchar *app_id, const gchar *version, gint nargs, gchar *args[])
		external "C use <libgda/libgda.h>"
		end
	
	--  void (*GdaInitFunc) (gpointer user_data)
	
	gda_get_default_dict: POINTER is
			-- GdaDict* gda_get_default_dict (void);
		external "C use <libgda/libgda.h>"
		end

	gda_main_run (init_func, user_data: POINTER) is
			--  void gda_main_run (GdaInitFunc init_func, gpointer user_data)
		external "C use <libgda/libgda.h>"
		end

	gda_main_quit is
			--  void gda_main_quit (void)
		external "C use <libgda/libgda.h>"
		end

feature {} -- TODO: Convenient functions - Do quickly some actions
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

feature {} -- Convenient functions extaernal calls
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

feature -- Configuration
	-- Features to allow applications an easy access to the libgda
	-- configuration, thus making them able to access the list of data
	-- sources configured in the system, for instance.
	
	get_string (a_path: STRING): STRING is
			-- the value of the configuration entry `a_path'.
		require
			path_not_void: a_path /= Void
		do
			create Result.from_external(gda_config_get_string(a_path.to_external))
		end

	get_int (a_path: STRING): INTEGER is
			-- the  value of the configuration entry `a_path' as an integer.
		require
			path_not_void: a_path /= Void
		do
			Result := gda_config_get_int(a_path.to_external)
		end

	get_real (a_path: STRING): REAL is
			-- the value of the configuration entry `a_path' as a float.
		require
			path_not_void: a_path /= Void
		do
			Result := gda_config_get_float (a_path.to_external)
		end

	get_boolean (a_path: STRING): BOOLEAN is
			-- the value of the configuration entry `a_path' as a boolean.
		require
			path_not_void: a_path /= Void
		do
			Result := (gda_config_get_boolean(a_path.to_external)).to_boolean
		end

	set_string (a_path, a_new_value: STRING) is
			-- Sets the configuration entry `a_path' to contain
			-- `a_new_value'. `is_successful' will be True if no errors
			-- occurred
		require
			path_not_void: a_path /= Void
			value_not_void: a_new_value /= Void
		do
			is_successful := (gda_config_set_string (a_path.to_external,
																  a_new_value.to_external)).to_boolean
		ensure set: get_string(a_path).is_equal(a_new_value)
		end

	set_int (a_path: STRING; a_new_value: INTEGER ) is
			-- Sets the configuration entry `a_path' to contain `a_new_value'.
			-- `is_successful' will be True if no errors occurred
		require
			path_not_void: a_path /= Void
		do
			is_successful := (gda_config_set_int (a_path.to_external, a_new_value)).to_boolean
			ensure set: get_int (a_path) = a_new_value
		end

	set_real (a_path: STRING; a_new_value: REAL) is
			-- Sets the configuration entry `a_path' to contain
			-- `a_new_value'. `is_successful' will be True if no errors
			-- occurred
		require
			path_not_void: a_path /= Void
		do
			is_successful:=(gda_config_set_float(a_path.to_external, a_new_value)).to_boolean
		ensure set: get_real (a_path) = a_new_value
		end

	set_boolean (a_path: STRING; a_new_value: BOOLEAN) is
			-- Sets the given configuration entry to contain a boolean.
			-- `is_successful' will be True if no errors occurred
		require
			path_not_void: a_path /= Void
		do
			is_successful:=(gda_config_set_boolean(a_path.to_external, a_new_value.to_integer)).to_boolean
		ensure set: get_boolean (a_path) = a_new_value
		end

	remove_section (a_path: STRING) is
			-- Removes the given section from the configuration database.
		require
			path_not_void: a_path /= Void
		do
			gda_config_remove_section (a_path.to_external)
		end

	remove_key (a_path: STRING) is
			-- Removes the given entry from the configuration
			-- database. If the section is empty, also remove the
			-- section.
		require
			path_not_void: a_path /= Void
		do
			gda_config_remove_key (a_path.to_external)
		end
	
	has_section (a_path: STRING): BOOLEAN is
			-- Does the section `a_path' exists in the configuration
			-- system?
		require
			path_not_void: a_path /= Void
		do
			Result:=gda_config_has_section(a_path.to_external).to_boolean
		end

	has_key (a_path: STRING): BOOLEAN is
			-- Does the key `a_path' exists in the configuration system?
		require
			path_not_void: a_path /= Void
		do
			Result:=gda_config_has_key(a_path.to_external).to_boolean
		end

	sections (a_path: STRING): GDA_SECTIONS is
			-- A list with the names of all the sections available under
			-- the given root directory (`a_path').
		require path_not_void: a_path/=Void
		do
			create Result.from_external_pointer(gda_config_list_sections(a_path.to_external))
		ensure Result.is_petrified
		end	

	--  TODO keys (a_path: STRING): GDA_CONFIG_SECTIONS is require
	--  path_not_void: a_path/=Void do
			
	-- GList*      gda_config_list_keys            (const gchar *path);

	-- Returns a list of all keys that exist under the given path.

	-- To free the returned value, you can use gda_config_free_list.

	-- path : 	path for root dir.
	-- Returns : 	a list containing all the key names.
	providers: GDA_PROVIDERS is
			-- a list of all providers currently installed in the system.
		do
				create Result.from_external_pointer (gda_config_get_provider_list)
				-- the underlying GList - made of GdaProviderInfo
				-- structures - shouldn't be freed or modified. Garbage
				-- collector should not free the list. Then:
		ensure Result.is_petrified
		end
	
	provider (a_name: STRING): GDA_PROVIDER_INFO is
			-- the GdaProviderInfo structure from the provider list given
			-- its name, don't modify or free it. Void if provider `a_name' is not found.
		require name_not_void: a_name /= Void
		local ptr: POINTER
		do
			ptr := gda_config_get_provider_by_name (a_name.to_external)
			if ptr.is_not_null then 
				create Result.from_external_pointer (ptr)
				-- the returned GdaProviderInfo should not be modified or 
				-- freed. Hence:
				Result.set_shared
			end
		end

	provider_model: GDA_DATA_MODEL is
			-- Fills a new GdaDataModel object using information from all
			-- providers which are currently installed in the system.

			-- Rows are separated in 3 columns: 'Id', 'Location' and
			-- 'Description'.
		local factory: G_OBJECT_EXPANDED_FACTORY[GDA_DATA_MODEL]
		do
			Result := factory.wrapper(gda_config_get_provider_model)
		end
	
	
	-- data_sources: GDA_DATA_SOURCE_INFO_LIST is
	-- a list of all data sources currently configured in the
	-- system.  TODO: to implement the following we need a
	-- specialized class "To free the returned list, call the
	-- gda_config_free_data_source_list function."
	-- do
	--	create Result.from_external_pointer (gda_config_get_data_source_list)
	-- end

	has_data_source (a_name: STRING): BOOLEAN is
			-- Does the data source `a_name' exist?
		local
			ptr: POINTER
		do
			ptr := gda_config_find_data_source(a_name.to_external)
			if (ptr.is_not_null) then
				Result := True
				-- After usage, the returned structure's memory must be freed using
				gda_data_source_info_free(ptr)
			end
		end
	
	-- TODO: find_data_source (a_name: STRING): GDA_DATA_SOURCE_INFO is
	-- a GDA_DATA_SOURCE_INFO structure from the data source list given its
	-- name. 
	
	-- Void if not found.
	--require name_not_void: a_name /= Void
	--local
	--	ptr: POINTER
	--	do
	--		ptr := gda_config_find_data_source(a_name.to_external)
	-- After usage, the returned structure's memory must be freed
	-- using gda_data_source_info_free().
	--if ptr.is_not_null then
	--create Result.from_external_pointer (ptr)
	--	end
	--end
	
	data_source_model: GDA_DATA_MODEL is
			-- a new GdaDataModel object using information from all data sources
			-- which are currently configured in the system.

			-- Rows are separated in 7 columns: `Name', `Provider', `Connection
			-- string', `Description', `Username', `Password' and `Global'.
		local factory: G_OBJECT_EXPANDED_FACTORY[GDA_DATA_MODEL]
		do
			Result := factory.wrapper(gda_config_get_data_source_model)
		end

	can_modify_global_config: BOOLEAN is
			-- Can the program modify the global configured data sources?
		do
			Result:= gda_config_can_modify_global_config.to_boolean
		end

	save_data_source (a_name, a_provider, a_connection_string, a_description, a_username, a_password: STRING; is_global: BOOLEAN) is
			-- Adds a new data source (or update an existing one) to the
			-- GDA configuration, based on the parameters given.

			-- `a_name' is the name for the data source to be saved.
		
			-- `a_provider': the provider ID for the new data source.
		
			-- `a_connection_string': the connection string for the new
			--data source.
		
			-- `a_description' : an (optional) description for the new
			-- data source. Can be Void.
		
			-- `a_username' : user name for the new data source.
		
			-- `a_password' : 	password to use when authenticating 
			-- username.
		
			-- `is_global' : 	TRUE if the data source is system-wide
		
			-- `a_username' and `a_password' can be Void if you do not
			-- need them to enter the database

			-- `is_successful' will be update (True in case of no
			-- errors).
		require 
			name_not_void: a_name /= Void
			provider_not_void: a_provider /= Void
			connection_string_not_void: a_connection_string /= Void
		local username_ptr, password_ptr, descr_ptr: POINTER
		do
			if a_username/=Void then username_ptr:=a_username.to_external end
			if a_password/=Void then password_ptr:=a_password.to_external end
			if a_description/=Void then descr_ptr:=a_description.to_external end
			
			is_successful := (gda_config_save_data_source
									(a_name.to_external, 
									 a_provider.to_external,
									 a_connection_string.to_external,
									 descr_ptr,
									 username_ptr,
									 password_ptr,
									 is_global.to_integer)).to_boolean
		end
	
		-- TODO: gda_config_save_data_source_info ()

		-- gboolean    gda_config_save_data_source_info
		--                                             (GdaDataSourceInfo *dsn_info);

		-- Saves a data source in the libgda configuration given a GdaDataSourceInfo structure containing all the information about the data source.

		-- dsn_info : 	a GdaDataSourceInfo structure.
		-- Returns : 	TRUE if no error occurred

	remove_data_source (a_data_source: STRING) is
			-- Removes `a_data_source' from the GDA configuration.
		require
			source_not_void: a_data_source /= Void
		do
			gda_config_remove_data_source (a_data_source.to_external)
		end


		-- name : 	name for the data source to be removed.
		-- gda_config_add_listener ()

		-- guint       gda_config_add_listener         (const gchar *path,
		--                                              GdaConfigListenerFunc func,
		--                                              gpointer user_data);

		-- Installs a configuration listener, which is a callback function which will be called every time a change occurs on a given configuration entry.

		-- path : 	configuration path to listen to.
		-- func : 	callback function.
		-- user_data : 	data to be passed to the callback function.
		-- Returns : 	the ID of the listener, which you will need for calling gda_config_remove_listener. If an error occurs, 0 is returned.
		-- gda_config_remove_listener ()

		-- void        gda_config_remove_listener      (guint id);

		-- Removes a configuration listener previously installed with gda_config_add_listener, given its ID.

		-- id : 	the ID of the listener to remove.


feature {} -- V3	
	--   Configuration -- Access/Management of libgda configuration
	--
	--Synopsis
	--
	--
	--
	--
	-- void                (*GdaConfigListenerFunc)            (const gchar *path,
	--                                                          gpointer user_data);
	--                     GdaProviderInfo;
	--                     GdaDataSourceInfo;


	--
	--Details
	--
	--  GdaConfigListenerFunc ()
	--
	-- void                (*GdaConfigListenerFunc)            (const gchar *path,
	--                                                          gpointer user_data);
	--
	--   path :
	--   user_data :
	--
	--   --------------------------------------------------------------------------
	--
	--  GdaProviderInfo
	--
	-- typedef struct {
	--         gchar            *id;
	--         gchar            *location;
	--         gchar            *description;
	--         GdaParameterList *gda_params; /* Contains a list of GdaParameter to create a DSN */
	--         gchar            *dsn_spec; /* XML string with all the parameters required to create a DSN */
	-- } GdaProviderInfo;
	--
	--   --------------------------------------------------------------------------
	--
	--  GdaDataSourceInfo
	--
	-- typedef struct {
	--         gchar    *name;
	--         gchar    *provider;
	--         gchar    *cnc_string;
	--         gchar    *description;
	--         gchar    *username;
	--         gchar    *password;
	--         gboolean  is_global;
	-- } GdaDataSourceInfo;
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_get_string ()
	--
	-- gchar*              gda_config_get_string               (const gchar *path);
	--
	--   Gets the value of the specified configuration entry as a string. You are
	--   then responsible to free the returned string.
	--
	--   path :    path to the configuration entry.
	--   Returns : the value stored at the given entry.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_get_int ()
	--
	-- gint                gda_config_get_int                  (const gchar *path);
	--
	--   Gets the value of the specified configuration entry as an integer.
	--
	--   path :    path to the configuration entry.
	--   Returns : the value stored at the given entry.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_get_float ()
	--
	-- gdouble             gda_config_get_float                (const gchar *path);
	--
	--   Gets the value of the specified configuration entry as a float.
	--
	--   path :    path to the configuration entry.
	--   Returns : the value stored at the given entry.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_get_boolean ()
	--
	-- gboolean            gda_config_get_boolean              (const gchar *path);
	--
	--   Gets the value of the specified configuration entry as a boolean.
	--
	--   path :    path to the configuration entry.
	--   Returns : the value stored at the given entry.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_set_string ()
	--
	-- gboolean            gda_config_set_string               (const gchar *path,
	--                                                          const gchar *new_value);
	--
	--   Sets the given configuration entry to contain a string.
	--
	--   path :      path to the configuration entry.
	--   new_value : new value.
	--   Returns :   TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_set_int ()
	--
	-- gboolean            gda_config_set_int                  (const gchar *path,
	--                                                          gint new_value);
	--
	--   Sets the given configuration entry to contain an integer.
	--
	--   path :      path to the configuration entry.
	--   new_value : new value.
	--   Returns :   TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_set_float ()
	--
	-- gboolean            gda_config_set_float                (const gchar *path,
	--                                                          gdouble new_value);
	--
	--   Sets the given configuration entry to contain a float.
	--
	--   path :      path to the configuration entry.
	--   new_value : new value.
	--   Returns :   TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_set_boolean ()
	--
	-- gboolean            gda_config_set_boolean              (const gchar *path,
	--                                                          gboolean new_value);
	--
	--   Sets the given configuration entry to contain a boolean.
	--
	--   path :      path to the configuration entry.
	--   new_value : new value.
	--   Returns :   TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_remove_section ()
	--
	-- void                gda_config_remove_section           (const gchar *path);
	--
	--   Removes the given section from the configuration database.
	--
	--   path : path to the configuration section.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_remove_key ()
	--
	-- void                gda_config_remove_key               (const gchar *path);
	--
	--   Removes the given entry from the configuration database. If the section is
	--   empty, also remove the section.
	--
	--   path : path to the configuration entry.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_has_section ()
	--
	-- gboolean            gda_config_has_section              (const gchar *path);
	--
	--   Checks whether the given section exists in the configuration system.
	--
	--   path :    path to the configuration section.
	--   Returns : TRUE if the section exists, FALSE otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_has_key ()
	--
	-- gboolean            gda_config_has_key                  (const gchar *path);
	--
	--   Checks whether the given key exists in the configuration system.
	--
	--   path :    path to the configuration key.
	--   Returns : TRUE if the entry exists, FALSE otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_list_sections ()
	--
	-- GList*              gda_config_list_sections            (const gchar *path);
	--
	--   Returns a GList containing the names of all the sections available under
	--   the given root directory.
	--
	--   To free the returned value, you can use gda_config_free_list.
	--
	--   path :    path for root dir.
	--   Returns : a list containing all the section names.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_list_keys ()
	--
	-- GList*              gda_config_list_keys                (const gchar *path);
	--
	--   Returns a list of all keys that exist under the given path.
	--
	--   To free the returned value, you can use gda_config_free_list.
	--
	--   path :    path for root dir.
	--   Returns : a list containing all the key names.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_free_list ()
	--
	-- void                gda_config_free_list                (GList *list);
	--
	--   Frees all memory used by the given GList, which must be the return value
	--   from either gda_config_list_sections and gda_config_list_keys.
	--
	--   list : list to be freed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_get_provider_list ()
	--
	-- GList*              gda_config_get_provider_list        (void);
	--
	--   Returns a list of all providers currently installed in the system. Each of
	--   the nodes in the returned GList is a GdaProviderInfo.
	--
	--   Returns : a GList of GdaProviderInfo structures, don't free or modify it!
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_free_provider_list ()
	--
	-- void                gda_config_free_provider_list       (GList *list);
	--
	--   Frees a list of GdaProviderInfo structures.
	--
	--   list : the list to be freed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_get_provider_by_name ()
	--
	-- GdaProviderInfo*    gda_config_get_provider_by_name     (const gchar *name);
	--
	--   Gets a GdaProviderInfo structure from the provider list given its name,
	--   don't modify or free it.
	--
	--   name :    name of the provider to search for.
	--   Returns : a GdaProviderInfo structure, if found, or NULL if not found.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_get_provider_model ()
	--
	-- GdaDataModel*       gda_config_get_provider_model       (void);
	--
	--   Fills and returns a new GdaDataModel object using information from all
	--   providers which are currently installed in the system.
	--
	--   Rows are separated in 3 columns: 'Id', 'Location' and 'Description'.
	--
	--   Returns : a new GdaDataModel object.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_provider_info_copy ()
	--
	-- GdaProviderInfo*    gda_provider_info_copy              (GdaProviderInfo *src);
	--
	--   Creates a new GdaProviderInfo structure from an existing one.
	--
	--   src :     provider information to get a copy from.
	--   Returns : a newly allocated GdaProviderInfo with contains a copy of
	--             information in src.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_provider_info_free ()
	--
	-- void                gda_provider_info_free              (GdaProviderInfo *provider_info);
	--
	--   Deallocates all memory associated to the given GdaProviderInfo.
	--
	--   provider_info : provider information to free.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_get_data_source_list ()
	--
	-- GList*              gda_config_get_data_source_list     (void);
	--
	--   Returns a list of all data sources currently configured in the system.
	--   Each of the nodes in the returned GList is a GdaDataSourceInfo. To free
	--   the returned list, call the gda_config_free_data_source_list function.
	--
	--   Returns : a GList of GdaDataSourceInfo structures.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_find_data_source ()
	--
	-- GdaDataSourceInfo*  gda_config_find_data_source         (const gchar *name);
	--
	--   Gets a GdaDataSourceInfo structure from the data source list given its
	--   name. After usage, the returned structure's memory must be freed using
	--   gda_data_source_info_free().
	--
	--   name :    name of the data source to search for.
	--   Returns : a new GdaDataSourceInfo structure, if found, or NULL if not
	--             found.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_source_info_copy ()
	--
	-- GdaDataSourceInfo*  gda_data_source_info_copy           (GdaDataSourceInfo *src);
	--
	--   Creates a new GdaDataSourceInfo structure from an existing one.
	--
	--   src :     data source information to get a copy from.
	--   Returns : a newly allocated GdaDataSourceInfo with contains a copy of
	--             information in src.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_source_info_equal ()
	--
	-- gboolean            gda_data_source_info_equal          (GdaDataSourceInfo *info1,
	--                                                          GdaDataSourceInfo *info2);
	--
	--   Tells if info1 and info2 are equal
	--
	--   info1 :   a data source information
	--   info2 :   a data source information
	--   Returns : TRUE if info1 and info2 are equal
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_source_info_free ()
	--
	-- void                gda_data_source_info_free           (GdaDataSourceInfo *info);
	--
	--   Deallocates all memory associated to the given GdaDataSourceInfo.
	--
	--   info : data source information to free.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_free_data_source_list ()
	--
	-- void                gda_config_free_data_source_list    (GList *list);
	--
	--   Frees a list of GdaDataSourceInfo structures.
	--
	--   list : the list to be freed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_get_data_source_model ()
	--
	-- GdaDataModel*       gda_config_get_data_source_model    (void);
	--
	--   Fills and returns a new GdaDataModel object using information from all
	--   data sources which are currently configured in the system.
	--
	--   Rows are separated in 6 columns: 'Name', 'Provider', 'Connection string',
	--   'Description', 'Username' and 'Global'.
	--
	--   Returns : a new GdaDataModel object.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_can_modify_global_config ()
	--
	-- gboolean            gda_config_can_modify_global_config (void);
	--
	--   Tells if the calling program can modify the global configured data
	--   sources.
	--
	--   Returns : TRUE if modifications are possible
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_save_data_source ()
	--
	-- gboolean            gda_config_save_data_source         (const gchar *name,
	--                                                          const gchar *provider,
	--                                                          const gchar *cnc_string,
	--                                                          const gchar *description,
	--                                                          const gchar *username,
	--                                                          const gchar *password,
	--                                                          gboolean is_global);
	--
	--   Adds a new data source (or update an existing one) to the GDA
	--   configuration, based on the parameters given.
	--
	--   name :        name for the data source to be saved.
	--   provider :    provider ID for the new data source.
	--   cnc_string :  connection string for the new data source.
	--   description : description for the new data source.
	--   username :    user name for the new data source.
	--   password :    password to use when authenticating username.
	--   is_global :   TRUE if the data source is system-wide
	--   Returns :     TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_save_data_source_info ()
	--
	-- gboolean            gda_config_save_data_source_info    (GdaDataSourceInfo *dsn_info);
	--
	--   Saves a data source in the libgda configuration given a GdaDataSourceInfo
	--   structure containing all the information about the data source.
	--
	--   dsn_info : a GdaDataSourceInfo structure.
	--   Returns :  TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_remove_data_source ()
	--
	-- void                gda_config_remove_data_source       (const gchar *name);
	--
	--   Removes the given data source from the GDA configuration.
	--
	--   name : name for the data source to be removed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_add_listener ()
	--
	-- guint               gda_config_add_listener             (const gchar *path,
	--                                                          GdaConfigListenerFunc func,
	--                                                          gpointer user_data);
	--
	--   Installs a configuration listener, which is a callback function which will
	--   be called every time a change occurs on a given configuration entry.
	--
	--   path :      configuration path to listen to.
	--   func :      callback function.
	--   user_data : data to be passed to the callback function.
	--   Returns :   the ID of the listener, which you will need for calling
	--               gda_config_remove_listener. If an error occurs, 0 is returned.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_config_remove_listener ()
	--
	-- void                gda_config_remove_listener          (guint id);
	--
	--   Removes a configuration listener previously installed with
	--   gda_config_add_listener, given its ID.
	--
	--   id : the ID of the listener to remove.

end 
