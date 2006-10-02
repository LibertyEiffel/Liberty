indexing
	description: "Gnome Data Access full example."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GDA team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class FULL_EXAMPLE

inherit GDA
insert ARGUMENTS
creation make

feature 
	default_buffer_size: INTEGER is 1024

	make is
		do
			print ("Starting%N")

			gda.init ("TestGDA", "0.1", arguments.argument_count, arguments.command_arguments)

			save_data_source
			-- remove_data_source

			-- 	gda_main_run ((GdaInitFunc) do_stuff, (gpointer) NULL);
			-- 	/* do_stuff(); */
			print ("Ending%N")
		end

	save_data_source is
		do
			gda_config_save_data_source ("calvaris", "PostgreSQL", "DATABASE=calvaris",
												  "cosa de calvaris", NULL, NULL);



-- void
-- remove_ds ()
-- {
-- 	gda_config_remove_data_source ("calvaris");
-- }
	
  

-- gboolean
-- get_errors (GdaConnection * connection)
-- {
-- 	GList *list;
-- 	GList *node;
-- 	GdaConnectionEvent *error;

-- 	list = (GList *) gda_connection_get_events (connection);

-- 	for (node = g_list_first (list); node != NULL; node = g_list_next (node)) {
-- 		error = (GdaConnectionEvent *) node->data;
-- 		g_print ("Error no: %d\t", gda_connection_event_get_code (error));
-- 		g_print ("desc: %s\t", gda_connection_event_get_description (error));
-- 		g_print ("source: %s\t", gda_connection_event_get_source (error));
-- 		g_print ("sqlstate: %s\n", gda_connection_event_get_sqlstate (error));
-- 	}
-- }



-- void
-- show_table (GdaDataModel * dm)
-- {
-- 	gint row_id;
-- 	gint column_id;
-- 	GValue *value;
-- 	gchar *string;

-- 	for (column_id = 0; column_id < gda_data_model_get_n_columns (dm);
-- 	     column_id++)
-- 		g_print ("%s\t", gda_data_model_get_column_title (dm, column_id));
-- 	g_print ("\n");

-- 	for (row_id = 0; row_id < gda_data_model_get_n_rows (dm); row_id++) {
-- 		for (column_id = 0; column_id < gda_data_model_get_n_columns (dm);
-- 		     column_id++)
-- 			{
-- 				value =
-- 					(GValue *) gda_data_model_get_value_at (dm, column_id, row_id);
-- 				string = gda_value_stringify (value);
-- 				g_print ("%s\t", string);
-- 				g_free (string);
-- 			}
-- 		g_print ("\n");
-- 	}
-- }



-- void
-- show_table2 (GdaDataModel * dm)
-- {
-- 	gint row_id;
-- 	gint column_id;
-- 	const GValue *value;
-- 	GdaRow *row;
-- 	gchar *string;

-- 	for (column_id = 0; column_id < gda_data_model_get_n_columns (dm);
-- 	     column_id++)
-- 		g_print ("%s\t", gda_data_model_get_column_title (dm, column_id));
-- 	g_print ("\n");

-- 	for (row_id = 0; row_id < gda_data_model_get_n_rows (dm); row_id++) {
-- 		row = (GdaRow *) gda_data_model_row_get_row (GDA_DATA_MODEL_ROW (dm), row_id);
-- 		for (column_id = 0; column_id < gda_data_model_get_n_columns (dm);
-- 		     column_id++) {
-- 			value = gda_row_get_value (row, column_id);
-- 			string = gda_value_stringify (value);
-- 			g_print ("%s\t", string);
-- 			g_free (string);
-- 		}
-- 		g_print ("\n");
-- 	}
-- }



-- void
-- process_accounts (GdaConnection * connection)
-- {
-- 	GdaTransaction *transaction_one, *transaction_two;
-- 	GdaCommand *command;

-- 	transaction_one = gda_transaction_new ("accounts1");
-- 	gda_transaction_set_isolation_level (transaction_one,
-- 					     GDA_TRANSACTION_ISOLATION_SERIALIZABLE);
-- 	gda_connection_begin_transaction (connection, transaction_one);

-- 	command = gda_command_new ("UPDATE accounts SET balance=balance+50"
-- 				   "WHERE account_code=456",
-- 				   GDA_COMMAND_TYPE_SQL,
-- 				   GDA_COMMAND_OPTION_STOP_ON_ERRORS);
-- 	gda_command_set_transaction (command, transaction_one);
-- 	gda_connection_execute_command (connection, command, NULL);
-- 	gda_command_free (command);

-- 	command = gda_command_new ("UPDATE accounts SET balance=balance-50"
-- 				   "WHERE account_code=12",
-- 				   GDA_COMMAND_TYPE_SQL,
-- 				   GDA_COMMAND_OPTION_STOP_ON_ERRORS);
-- 	gda_command_set_transaction (command, transaction_one);
-- 	gda_connection_execute_command (connection, command, NULL);
-- 	gda_command_free (command);

-- 	gda_connection_commit_transaction (connection, transaction_one);
-- 	g_object_unref (transaction_one);

-- 	transaction_two = gda_transaction_new ("accounts2");
-- 	gda_transaction_set_isolation_level (transaction_two,
-- 					     GDA_TRANSACTION_ISOLATION_SERIALIZABLE);
-- 	gda_connection_begin_transaction (connection, transaction_two);

-- 	command = gda_command_new ("UPDATE accounts SET balance=balance+400"
-- 				   "WHERE account_code=456",
-- 				   GDA_COMMAND_TYPE_SQL,
-- 				   GDA_COMMAND_OPTION_STOP_ON_ERRORS);
-- 	gda_command_set_transaction (command, transaction_two);
-- 	gda_connection_execute_command (connection, command, NULL);
-- 	gda_command_free (command);

-- 	command = gda_command_new ("UPDATE accounts SET balance=balance-400"
-- 				   "WHERE account_code=12",
-- 				   GDA_COMMAND_TYPE_SQL,
-- 				   GDA_COMMAND_OPTION_STOP_ON_ERRORS);
-- 	gda_command_set_transaction (command, transaction_two);
-- 	gda_connection_execute_command (connection, command, NULL);
-- 	gda_command_free (command);

-- 	gda_connection_rollback_transaction (connection, transaction_two);
-- 	g_object_unref (transaction_two);

-- 	execute_sql_command (connection, "SELECT * FROM accounts");
-- }


-- gint
-- execute_sql_command (GdaConnection * connection, const gchar * buffer)
-- {
-- 	GdaCommand *command;
-- 	GList *list;
-- 	GList *node;
-- 	gboolean errors = FALSE;

-- 	GdaDataModel *dm;


-- 	command =
-- 		gda_command_new (buffer, GDA_COMMAND_TYPE_SQL,
-- 				 GDA_COMMAND_OPTION_STOP_ON_ERRORS);
-- 	list = gda_connection_execute_command_l (connection, command, NULL);
-- 	if (list != NULL)
-- 		for (node = g_list_first (list); node != NULL; node = g_list_next (node)) {
-- 			dm = (GdaDataModel *) node->data;
-- 			if (dm == NULL)	{
-- 				errors = TRUE;
-- 				get_errors (connection);
-- 			}
-- 			else {
-- 				show_table2 (dm);
-- 				g_object_unref (dm);
-- 			}
-- 		}
-- 	else {
-- 		errors = TRUE;
-- 		get_errors (connection);
-- 	}
-- 	gda_command_free (command);

-- 	return (errors);
-- }



-- void
-- execute_sql (GdaConnection * connection, const gchar * buffer)
-- {
-- 	GdaCommand *command;
-- 	gint number;

-- 	command = gda_command_new (buffer, GDA_COMMAND_TYPE_SQL,
-- 				   GDA_COMMAND_OPTION_STOP_ON_ERRORS);
-- 	gda_connection_execute_command (connection, command, NULL);

-- 	gda_command_free (command);
-- }



-- void
-- execute_some_queries (GdaConnection * connection)
-- {

-- 	execute_sql (connection, "DELETE FROM cliente");
-- 	execute_sql (connection,
-- 			       "INSERT INTO cliente(cd_cli, dni, nombr, direc, telef) "
-- 			       "VALUES ('1', '1234', 'Xabier',"
-- 			       "'Rua Unha calquera', '123')"
-- 			       "; INSERT INTO cliente(cd_cli, dni, nombr, direc, telef) "
-- 			       "VALUES ('2', '2345', 'Rodriguez',"
-- 			       "'Rua Outra calquera', '234')");
-- 	execute_sql (connection,
-- 			       "INSERT INTO cliente(cd_cli, dni, nombr, direc, telef) "
-- 			       "VALUES ('1', '1234', 'Xabier',"
-- 			       "'Rua Unha calquera', '123')"
-- 			       "; INSERT INTO cliente(cd_cli, dni, nombr, direc, telef) "
-- 			       "VALUES ('2', '2345', 'Rodriguez',"
-- 			       "'Rua Outra calquera', '234')");

-- 	execute_sql_command (connection, "SELECT * FROM cliente");


-- 	execute_sql (connection,
-- 			       "DELETE FROM accounts;"
-- 			       "INSERT INTO accounts"
-- 			       "(client_code, account_code, balance)"
-- 			       "VALUES (123, 456, 1000);"
-- 			       "INSERT INTO accounts"
-- 			       "(client_code, account_code, balance)"
-- 			       "VALUES (789, 012, 5000);");

-- 	execute_sql_command (connection, "SELECT * FROM accounts");
-- }



-- void
-- list_datasources (void)
-- {
-- 	GList *ds_list;
-- 	GList *node;
-- 	GdaDataSourceInfo *info;

-- 	ds_list = gda_config_get_data_source_list ();

-- 	g_print ("\n");
-- 	for (node = g_list_first (ds_list); node != NULL; node = g_list_next (node)) {
-- 		info = (GdaDataSourceInfo *) node->data;
		
-- 		g_print
-- 			("NAME: %s PROVIDER: %s CNC: %s DESC: %s USER: %s PASSWORD: %s\n",
-- 			 info->name, info->provider, info->cnc_string, info->description,
-- 			 info->username, info->password);
		
-- 	}
-- 	g_print ("\n");

-- 	gda_config_free_data_source_list (ds_list);

-- }



-- void
-- list_providers (void)
-- {
-- 	GList *prov_list;
-- 	GList *node;
-- 	GdaProviderInfo *info;

-- 	prov_list = gda_config_get_provider_list ();

-- 	for (node = g_list_first (prov_list); node != NULL;
-- 	     node = g_list_next (node))	{
-- 		info = (GdaProviderInfo *) node->data;
		
-- 		g_print ("ID: %s\n", info->id);
-- 	}
-- }


-- void
-- play_with_parameters ()
-- {
-- 	GdaParameterList *list;
-- 	GdaParameter *parameter;
-- 	GValue *value;

-- 	list = gda_parameter_list_new (NULL);

-- 	g_value_set_int (value = gda_value_new (G_TYPE_INT), 10);
-- 	parameter = gda_parameter_new_from_value ("p1", value);
-- 	gda_parameter_list_add_param (list, parameter);
-- 	gda_value_free (value);
-- 	g_object_unref (parameter);

-- 	g_value_set_int (value = gda_value_new (G_TYPE_INT), 2);
-- 	parameter = gda_parameter_new_from_value ("p2", value);
-- 	gda_parameter_list_add_param (list, parameter);
-- 	gda_value_free (value);
-- 	g_object_unref (parameter);

-- 	g_object_unref (list);
-- }



-- void
-- do_stuff ()
-- {
-- 	GdaClient *client;
-- 	GdaConnection *connection;

-- 	list_providers ();
-- 	list_datasources ();

-- 	client = gda_client_new ();

-- 	g_print ("CONNECTING\n");
-- 	connection = gda_client_open_connection (client, "calvaris", NULL, NULL,
-- 						 GDA_CONNECTION_OPTIONS_READ_ONLY);

-- 	g_print ("CONNECTED\n");

-- 	execute_some_queries (connection);

-- 	g_print ("ERRORS PROVED!\n");

-- 	process_accounts (connection);

-- 	gda_client_close_all_connections (client);

-- 	g_object_unref (G_OBJECT (client));

-- 	play_with_parameters ();

-- 	gda_main_quit ();
-- }

end -- class FOO
