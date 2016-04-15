note
   description:
      "SQLite3 relational database."
   copyright:
      "(C) 2006,2016 Paolo Redaelli, Raphael Mack"
   license:
      "LGPL v2 or later"
   author:
      "$Author:$"
   date:
      "$Date:$"
   revision:
      "$Revision:$"

class SQLITE_DATABASE

inherit
   DATABASE
      undefine copy, is_equal
      end
   C_STRUCT

insert
   SQLITE3_EXTERNALS
   SQLITE_ERROR_CODES
      undefine copy, is_equal
      end

create {ANY}
   connect

feature {}

   dispose
      local
         res: INTEGER
      do
         res := sqlite3_close(handle);
         handle := default_pointer
         --TODO: handle res
         -- Note: I'm not sure that res shall be handled at all here. In
         -- fact we are actually disposing the database. We are not caring
         -- anymore of its destiny. Instead we shall handle closing a
         -- database and recycling the wrapper. Paolo 2008-08-96
         ;
      end -- dispose

   struct_size: like size_t
      external "plug_in"
      alias "{
         location: "${eiffel_libraries}/plugins"
         module_name: "sqlite3"
         feature_name: "sizeof(sqlite3)"
         }"
      end -- struct_size

feature {ANY}

   result_set: SQLITE_RESULT_SET;

feature {ANY}

   connect (a_connection_string: STRING;)
         -- Try to connect to an SQLite database. `last_action_result'
         -- will hold the result of this feature call. `is_connected'
         -- will be true if database is usable; i.e. readable and
         -- writable.
      do
         last_action_result := sqlite3_open(a_connection_string.to_external, $handle);
         last_action_success := last_action_result = sqlite_ok;
         is_connected := last_action_success;
      end -- connect

   close
         -- Try to close the database.
         -- `last_action_result' will be `sqlite_ok' if the close is
         -- successful. If there are prepared statements that have not
         -- been finalized, then it will be `sqlite_busy'.
         -- Note `sqlite_error' will be set if the hidden handle is
         -- not a valid connection pointer returned by sqlite3_open()
         -- or if the connection pointer has been closed previously.
      require
         connected: is_connected
      do
         last_action_result := sqlite3_close(handle);
         last_action_success := last_action_result = sqlite_ok;
         is_connected := False;
      end -- close

   is_connected: BOOLEAN;

   execute (some_sql: STRING;)
         -- Current implementation uses the plain sqlite3_exec which
         -- always strings as result. TODO: improve it using prepared
         -- statement which allows typed results.
      do
         create result_set.make;
         last_action_result := sqlite3_exec(handle, some_sql.to_external, $accumulator_callback, Current.to_pointer, default_pointer
         -- as char **error_msg, since it is currently not used
         );

         last_action_success := last_action_result = sqlite_ok;
      end -- execute

   last_action_result: INTEGER;

feature {ANY} -- Prepared queries and commands
   

   prepare_command (some_sql: STRING;): SQLITE_PREPARED_COMMAND
      do
         create Result.make(Current, some_sql);
      end -- prepare_command

   prepare_query (some_sql: STRING;): SQLITE_PREPARED_QUERY
      do
         create Result.make(Current, some_sql);
      end -- prepare_query

feature {} -- Implementation
   

   accumulator_callback (n_columns: INTEGER; values: NATIVE_ARRAY[POINTER]; column_names: NATIVE_ARRAY[POINTER];): INTEGER
      require
         result_set_present: result_set /= Void
      local
         i: INTEGER; a_tuple: SQLITE_RESULT_ROW; column_name: STRING
         a_value: SQLITE_STRING_VALUE
      do
         debug
            print("SQLITE_DATABASE.accumulator_callback (" + n_columns.out + ", [");
         end-- debug
         create a_tuple.make(n_columns);
         from
            i := 0;
         until
            i >= n_columns
         loop
            if values.item(i) /= default_pointer then
               create a_value.from_external_copy(values.item(i));
               debug
                  print("'" + a_value.out + "' ");
               end-- debug
               a_tuple.put(a_value, i);
            else
               debug
                  print("''");
               end-- debug
            end-- if
            i := i + 1;
         end-- loop

         result_set.add_last(a_tuple);

         debug
            print("], [");
            from
               i := 0;
            until
               i >= n_columns
            loop
               if column_names.item(i) /= default_pointer then
                  create column_name.from_external_copy(column_names.item(i));
                  print("'" + column_name + "' ");
               end-- if
               i := i + 1;
            end-- loop

            print("])%N");
         end-- debug

         Result := 0 -- 0 means "ok, go on"; anything else blocks the query with an error
         ;
      ensure
         result_set_grown: old result_set.count < result_set.count
      end -- accumulator_callback

invariant
   success: last_action_success implies last_action_result = sqlite_ok

end -- class SQLITE_DATABASE
