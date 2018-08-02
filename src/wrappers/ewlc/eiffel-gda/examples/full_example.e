note
	description: "Gnome Data Access full example."
	copyright: "[
					Copyright (C) 2006-2018: , 2007 Paolo Redaelli, GDA team
					
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

class FULL_EXAMPLE

insert 
	GDA
	ARGUMENTS
	GDA_CONNECTION_OPTIONS_ENUM
	SHARED_G_ERROR
	
create {ANY} make

feature {ANY} -- Commands

	default_buffer_size: INTEGER is 1024

	make
		do
			io.put_line("Starting")
			debug 
				io.put_line("Warning: There were a little bug in version 1.9.x; gda_config_save_data_source() does not create the configuration directory ~/.libgda, so you have to do it. Check if it is still present.")
			end

			gda.init ("Full eiffel-gda test", "0.1", command_arguments)
			
			list_providers
			list_data_sources

			if has_connection then
				print("Using connection:%N")
				print(connection.out)
				print("%N")
				
				execute_some_queries
				process_accounts
				play_with_parameters				
			else 
				print ("Unable to connect to database `" + database_name + "'!%N")
				check error.is_not_null end
				if error.message /= Void then
					print ("Error message `") print(error.message) print ("'") 
				else print ("No error message available. ") 
				end
				
				if error.domain.is_valid then 
					print ("Error domain `") print(error.domain.to_string) print ("'%N")
				else print ("Error domain invalid%N")
				end
			end
			print ("Ending%N")
			gda.quit
		end

	list_providers
		local info_iterator: ITERATOR [GDA_PROVIDER_INFO]
		do
			print ("Providers:%N")
			from
				info_iterator := gda.providers.get_new_iterator
				info_iterator.start
			until
				info_iterator.is_off
			loop
				io.put_line(info_iterator.item.out)
				info_iterator.next
			end
		end

	list_data_sources
		local
			info_iterator: ITERATOR [GDA_DATA_SOURCE_INFO]
			source: GDA_DATA_SOURCE_INFO
		do
			print ("Data sources:%N")
			from
				info_iterator := gda.data_sources.get_new_iterator
				info_iterator.start
			until
				info_iterator.is_off
			loop
				source := info_iterator.item
				io.put_line(source.out)
				info_iterator.next
			end
		end

	execute_some_queries
		do
			
			-- execute_some_queries (GdaConnection * connection)
			-- {
			--
			--         execute_sql (connection, "DELETE FROM cliente");
			--         execute_sql (connection,
			--                                "INSERT INTO cliente(cd_cli, dni, nombr, direc, telef) "
			--                                "VALUES ('1', '1234', 'Xabier',"
			--                                "'Rua Unha calquera', '123')"
			--                                "; INSERT INTO cliente(cd_cli, dni, nombr, direc, telef) "
			--                                "VALUES ('2', '2345', 'Rodriguez',"
			--                                "'Rua Outra calquera', '234')");
			--         execute_sql (connection,
			--                                "INSERT INTO cliente(cd_cli, dni, nombr, direc, telef) "
			--                                "VALUES ('1', '1234', 'Xabier',"
			--                                "'Rua Unha calquera', '123')"
			--                                "; INSERT INTO cliente(cd_cli, dni, nombr, direc, telef) "
			--                                "VALUES ('2', '2345', 'Rodriguez',"
			--                                "'Rua Outra calquera', '234')");
			--
			--         execute_sql_command (connection, "SELECT * FROM cliente");
			--
			--
			--         execute_sql (connection,
			--                                "DELETE FROM accounts;"
			--                                "INSERT INTO accounts"
			--                                "(client_code, account_code, balance)"
			--                                "VALUES (123, 456, 1000);"
			--                                "INSERT INTO accounts"
			--                                "(client_code, account_code, balance)"
			--                                "VALUES (789, 012, 5000);");
			--
			--         execute_sql_command (connection, "SELECT * FROM accounts");
			-- }
			--

		end
	
	process_accounts
		do
			not_yet_implemented
			-- void
			-- process_accounts (GdaConnection * connection)
			-- {
			--         GdaTransaction *transaction_one, *transaction_two;
			--         GdaCommand *command;
			--
			--         transaction_one = gda_transaction_new ("accounts1");
			--         gda_transaction_set_isolation_level (transaction_one,
			--                                              GDA_TRANSACTION_ISOLATION_SERIALIZABLE);
			--         gda_connection_begin_transaction (connection, transaction_one);
			--
			--         command = gda_command_new ("UPDATE accounts SET balance=balance+50"
			--                                    "WHERE account_code=456",
			--                                    GDA_COMMAND_TYPE_SQL,
			--                                    GDA_COMMAND_OPTION_STOP_ON_ERRORS);
			--         gda_command_set_transaction (command, transaction_one);
			--         gda_connection_execute_select_command (connection, command, NULL);
			--         gda_command_free (command);
			--
			--         command = gda_command_new ("UPDATE accounts SET balance=balance-50"
			--                                    "WHERE account_code=12",
			--                                    GDA_COMMAND_TYPE_SQL,
			--                                    GDA_COMMAND_OPTION_STOP_ON_ERRORS);
			--         gda_command_set_transaction (command, transaction_one);
			--         gda_connection_execute_select_command (connection, command, NULL);
			--         gda_command_free (command);
			--
			--         gda_connection_commit_transaction (connection, transaction_one);
			--         g_object_unref (transaction_one);
			--
			--         transaction_two = gda_transaction_new ("accounts2");
			--         gda_transaction_set_isolation_level (transaction_two,
			--                                              GDA_TRANSACTION_ISOLATION_SERIALIZABLE);
			--         gda_connection_begin_transaction (connection, transaction_two);
			--
			--         command = gda_command_new ("UPDATE accounts SET balance=balance+400"
			--                                    "WHERE account_code=456",
			--                                    GDA_COMMAND_TYPE_SQL,
			--                                    GDA_COMMAND_OPTION_STOP_ON_ERRORS);
			--         gda_command_set_transaction (command, transaction_two);
			--         gda_connection_execute_select_command (connection, command, NULL);
			--         gda_command_free (command);
			--
			--         command = gda_command_new ("UPDATE accounts SET balance=balance-400"
			--                                    "WHERE account_code=12",
			--                                    GDA_COMMAND_TYPE_SQL,
			--                                    GDA_COMMAND_OPTION_STOP_ON_ERRORS);
			--         gda_command_set_transaction (command, transaction_two);
			--         gda_connection_execute_select_command (connection, command, NULL);
			--         gda_command_free (command);
			--
			--         gda_connection_rollback_transaction (connection, transaction_two);
			--         g_object_unref (transaction_two);
			--
			--         execute_sql_command (connection, "SELECT * FROM accounts");
			-- }
		end

	play_with_parameters
		do
			not_yet_implemented
			-- void
			-- play_with_parameters ()
			-- {
			--         GdaParameterList *list;
			--         GdaParameter *parameter;
			--         GValue *value;
			--
			--         list = gda_parameter_list_new (NULL);
			--
			--         g_value_set_int (value = gda_value_new (G_TYPE_INT), 10);
			--         parameter = gda_parameter_new_from_value ("p1", value);
			--         gda_parameter_list_add_param (list, parameter);
			--         gda_value_free (value);
			--         g_object_unref (parameter);
			--
			--         g_value_set_int (value = gda_value_new (G_TYPE_INT), 2);
			--         parameter = gda_parameter_new_from_value ("p2", value);
			--         gda_parameter_list_add_param (list, parameter);
			--         gda_value_free (value);
			--         g_object_unref (parameter);
			--
			--         g_object_unref (list);
			-- }
		end
	execute_sql (an_sql: STRING)
		do
       -- void
        -- execute_sql (GdaConnection * connection, const gchar * 
        -- buffer)
        -- {
        --         GdaCommand *command;
        --         gint number;
        --
        --         command = gda_command_new (buffer, 
        --         GDA_COMMAND_TYPE_SQL,
        --                                    
        --                                    GDA_COMMAND_OPTION_STOP_ON_ERRORS);
        --         gda_connection_execute_select_command (connection, 
        --         command, NULL);
        --
        --         gda_command_free (command);
        -- }
		end  

feature {ANY} -- Queries
	client: GDA_CLIENT
		once 
			create Result.make
		end

	connection: GDA_CONNECTION
			-- Connection to an example SQLite database. Void if couldn't find the database
		once
			if not gda.has_data_source(database_name) then 
				print ("Creating example database%N")
				gda.save_data_source (database_name, provider, connection_string,
											 description, username, password,
											 False -- Not global
											 )
			end

			Result := (client.open_connection 
						  (database_name, username, password,
							0 -- No options such as	gda_connection_options_read_only
							))
			-- ensure not_void: Result /= Void read_only: (Result.options &&
			-- gda_connection_options_read_only ).to_boolean TODO: this is bad to
			-- read. It would be nice to provide GDA_CONNECTION.is_read_only and
			-- similars.
		end

	has_connection: BOOLEAN
		do
			Result := (connection/=Void)
		end
	
	print_events
		local 
			events: G_SLIST[GDA_CONNECTION_EVENT]
			event_iterator: ITERATOR[GDA_CONNECTION_EVENT]
			event: GDA_CONNECTION_EVENT
		do
			from
				event_iterator := connection.events.get_new_iterator
				event_iterator.start
			until 
				event_iterator.is_off
			loop
				event := event_iterator.item
				io.put_line(once "Error no: "+event.code.out+
								once "description: "+event.description+
								once "source: "+event.source+
								once "sqlstate: TODO")
					event_iterator.next
				end
			end

feature {ANY} -- Constants
	database_name: STRING is "eiffel-gda-example"
	provider: STRING is "SQLite"
	connection_string: STRING is "DB_NAME=example;DB_DIR=."
	description: STRING is "Example database for eiffel-gda"
	username: STRING is once Result := Void end
	password: STRING is once Result := Void end

feature {} -- original C example
	--
	-- void
	-- show_table (GdaDataModel * dm)
	-- {
	--         gint row_id;
	--         gint column_id;
	--         GValue *value;
	--         gchar *string;
	--
	--         for (column_id = 0; column_id < gda_data_model_get_n_columns (dm);
	--              column_id++)
	--                 g_print ("%s\t", gda_data_model_get_column_title (dm, column_id));
	--         g_print ("\n");
	--
	--         for (row_id = 0; row_id < gda_data_model_get_n_rows (dm); row_id++) {
	--                 for (column_id = 0; column_id < gda_data_model_get_n_columns (dm);
	--                      column_id++)
	--                         {
	--                                 value =
	--                                         (GValue *) gda_data_model_get_value_at (dm, column_id, row_id);
	--                                 string = gda_value_stringify (value);
	--                                 g_print ("%s\t", string);
	--                                 g_free (string);
	--                         }
	--                 g_print ("\n");
	--         }
	-- }
	--
	--
	--
	-- void
	-- show_table2 (GdaDataModel * dm)
	-- {
	--         gint row_id;
	--         gint column_id;
	--         const GValue *value;
	--         GdaRow *row;
	--         gchar *string;
	--
	--         for (column_id = 0; column_id < gda_data_model_get_n_columns (dm);
	--              column_id++)
	--                 g_print ("%s\t", gda_data_model_get_column_title (dm, column_id));
	--         g_print ("\n");
	--
	--         for (row_id = 0; row_id < gda_data_model_get_n_rows (dm); row_id++) {
	--                 row = (GdaRow *) gda_data_model_row_get_row (GDA_DATA_MODEL_ROW (dm), row_id);
	--                 for (column_id = 0; column_id < gda_data_model_get_n_columns (dm);
	--                      column_id++) {
	--                         value = gda_row_get_value (row, column_id);
	--                         string = gda_value_stringify (value);
	--                         g_print ("%s\t", string);
	--                         g_free (string);
	--                 }
	--                 g_print ("\n");
	--         }
	-- }
	--
	--
	--
	--
	--
	-- gint
	-- execute_sql_command (GdaConnection * connection, const gchar * buffer)
	-- {
	--         GdaCommand *command;
	--         GList *list;
	--         GList *node;
	--         gboolean errors = FALSE;
	--
	--         GdaDataModel *dm;
	--
	--
	--         command = gda_command_new (buffer, GDA_COMMAND_TYPE_SQL,
	--                                    GDA_COMMAND_OPTION_STOP_ON_ERRORS);
	--         list = gda_connection_execute_command (connection, command, NULL);
	--         if (list != NULL) {
	--                 for (node = list; node != NULL; node = g_list_next (node)) {
	--                         if (GDA_IS_DATA_MODEL (list->data)) {
	--                                 dm = (GdaDataModel *) node->data;
	--                                 show_table2 (dm);
	--                                 g_object_unref (dm);
	--                         }
	--                         else if (list->data)
	--                                 g_object_unref (list->data);
	--                 }
	--                 g_list_free (list);
	--         }
	--         else {
	--                 errors = TRUE;
	--                 get_errors (connection);
	--         }
	--         gda_command_free (command);
	--
	--         return (errors);
	-- }
	--
	--
	--

	--
	--
	--
	-- do_stuff ()
	-- {
	--         GdaClient *client;
	--         GdaConnection *connection;
	--
	--         list_providers ();
	--         list_datasources ();
	--
	--         client = gda_client_new ();
	--
	--         g_print ("CONNECTING\n");
	--         connection = gda_client_open_connection (client, "calvaris", NULL, NULL,
	--                                                  GDA_CONNECTION_OPTIONS_READ_ONLY);
	--
	--         g_print ("CONNECTED\n");
	--
	--         execute_some_queries (connection);
	--
	--         g_print ("ERRORS PROVED!\n");
	--
	--         process_accounts (connection);
	--
	--         gda_client_close_all_connections (client);
	--
	--         g_object_unref (G_OBJECT (client));
	--
	--         play_with_parameters ();
	--
	--         gda_main_quit ();
	-- }
	--
	--
	--
	--
	-- int
	-- main (int argc, char **argv)
	-- {
	--
	--         g_print ("STARTING\n");
	--         gda_init ("TestGDA", "0.1", argc, argv);
	--
	--         save_ds ();
	--         /*  remove_ds(); */
	--
	--         gda_main_run ((GdaInitFunc) do_stuff, (gpointer) NULL);
	--         /* do_stuff(); */
	--         g_print ("ENDING\n");
	--
	-- }
	--
	--

end -- class FULL_EXAMPLE
