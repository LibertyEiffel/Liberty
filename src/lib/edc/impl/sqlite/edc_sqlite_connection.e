-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2022: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
class EDC_SQLITE_CONNECTION

inherit
   EDC_CONNECTION
      redefine call_update, call_delete
      end

insert
   PLATFORM
   SQLITE_ERROR_CODES
      rename error_message as sqlite_error_message
      export {} all
      end

create {EDC_SQLITE_DRIVER}
   make

feature {ANY} -- Connection management:
   disconnect
      do
         database.close
      end

   is_connected: BOOLEAN
      do
         Result := database.is_connected
      end

feature {ANY} -- Session management:
   commit
      local
         done: BOOLEAN
      do
         if in_transaction then
            from
            until
               done
            loop
               database.execute(once "COMMIT;")
               if database.last_action_success then
                  done := True
               else
                  done := not dispatch_error(once "commit")
               end
            end
         end
      end

   new_savepoint (name: STRING): EDC_SAVEPOINT
      do
         not_yet_implemented
      end

   rollback
      local
         done: BOOLEAN
      do
         if in_transaction then
            from
            until
               done
            loop
               database.execute(once "ROLLBACK;")
               if database.last_action_success then
                  done := True
               else
                  done := not dispatch_error(once "rollback")
               end
            end
         end
      end

   rollback_to (a_savepoint: EDC_SAVEPOINT)
      do
         not_yet_implemented
      end

   auto_commit: BOOLEAN

   set_auto_commit (a_auto_commit: like auto_commit)
      do
         auto_commit := a_auto_commit
         if a_auto_commit then
            commit
         end
      end

feature {ANY}
   create_table (a_table: EDC_TABLE)
      local
         query: STRING; t: EDC_SQLITE_TABLE; done: BOOLEAN
      do
         query := create_table_query_builder.query_for(a_table)
         from
         until
            done
         loop
            database.execute(query)
            if database.last_action_success then
               create t.with_table(a_table)
               t.table.set_connection(Current)
               tables.add(t, a_table.name)
               done := True
            else
               done := not dispatch_error(query)
            end
         end
      end

   drop_table (a_table: EDC_TABLE)
      local
         query: STRING; done: BOOLEAN
      do
         if tables.has(a_table.name) then
            query := once ""
            query.copy(once "DROP TABLE %"")
            query.append(a_table.name)
            query.append(once "%";")
            from
            until
               done
            loop
               database.execute(query)
               if database.last_action_success then
                  tables.remove(a_table.name)
                  done := True
               else
                  done := not dispatch_error(query)
               end
            end
         end
      end

   has_table_name (a_table_name: STRING): BOOLEAN
      local
         query: STRING; done: BOOLEAN
      do
         query := once ""
         query.copy(once "PRAGMA table_info(")
         query.append(a_table_name)
         query.append(once ");")
         from
         until
            done
         loop
            database.execute(query)
            if database.last_action_success then
               Result := database.result_set.count > 0
               done := True
            else
               done := not dispatch_error(query)
            end
         end
      end

   table (a_table_name: STRING): EDC_TABLE
      local
         name, query, type: STRING; n, i, s: INTEGER; column: EDC_COLUMN; t: EDC_SQLITE_TABLE; done: BOOLEAN
      do
         t := tables.reference_at(a_table_name)
         if t = Void then
            -- PRAGMA table_info(table-name);
            -- For each column in the named table, invoke the callback function once with information about
            -- that column, including the column name, data type, whether or not the column can be NULL, and
            -- the default value for the column.
            -- => use this to fill in the EDC_COLUMNs into table.columns
            name := a_table_name.twin
            query := once ""
            query.copy(once "PRAGMA table_info(")
            query.append(name)
            query.append(once ");")
            from
            until
               done
            loop
               database.execute(query)
               if database.last_action_success then
                  n := database.result_set.count
                  if n > 0 then
                     create t.make(name)
                     tables.add(t, name)
                     from
                        i := database.result_set.lower
                     until
                        i > database.result_set.upper
                     loop
                        name := database.result_set.item(i).string_item(1)
                        type := database.result_set.item(i).string_item(2)
                        inspect
                           type_of(type)
                        when "INTEGER" then
                           create {EDC_INTEGER_COLUMN} column.make(name)
                        when "TEXT", "CHAR", "VARCHAR" then
                           s := size_of(type)
                           if s = 1 then
                              create {EDC_CHARACTER_COLUMN} column.make(name)
                           else
                              create {EDC_STRING_COLUMN} column.make(name, s)
                           end
                        when "BLOB" then
                           create {EDC_BLOB_COLUMN} column.make(name)
                        when "TIMESTAMP" then
                           create {EDC_TIME_COLUMN} column.make(name)
                        else
                           not_yet_implemented
                        end
                        --|*** TODO: set constraints (not null, default value)
                        t.table.add_column(column)
                        i := i + 1
                     end
                  end
                  done := True
               else
                  done := not dispatch_error(query)
               end
            end
         end
         if t /= Void then
            Result := t.table
            Result.set_connection(Current)
         end
      end

   all_table_names: FAST_ARRAY[STRING]
      local
         i, n: INTEGER; query: STRING; done: BOOLEAN
      do
         query := once "select name from sqlite_master where type='table' order by name;"
         from
         until
            done
         loop
            database.execute(query)
            if database.last_action_success then
               n := database.result_set.count
               create Result.make(n)
               from
                  i := database.result_set.lower
               until
                  i > database.result_set.upper
               loop
                  Result.put(database.result_set.item(i).string_item(1), i - database.result_set.lower)
                  i := i + 1
               end
               done := True
            else
               done := not dispatch_error(query)
            end
         end
      end

feature {ANY} -- Fetch direction:
   set_fetch_direction (a_fetch_direction: like fetch_direction)
      do
         fetch_direction := a_fetch_direction
      end

   fetch_direction: INTEGER_8

feature {EDC_CALL_HANDLER}
   call_select (a_selectable: EDC_SELECTABLE): EDC_SQLITE_RESULT_SET
      local
         query: STRING; prepared: SQLITE_PREPARED_QUERY; done: BOOLEAN
      do
         query := select_query_builder.query_for(a_selectable)
         prepared := database.prepare_query(query)
         from
         until
            done
         loop
            prepared.execute(select_query_builder.prepared_arguments)
            if prepared.last_exec_success then
               create Result.make(prepared.last_result, a_selectable.columns, Current)
               done := True
            else
               done := not dispatch_error(query)
            end
         end
      end

   call_update (a_update: EDC_UPDATE; a_values: TRAVERSABLE[EDC_VALUE]): INTEGER
      local
         query: STRING; prepared: SQLITE_PREPARED_COMMAND; done: BOOLEAN
      do
         if check_transaction then
            query := update_query_builder.query_for(a_update, a_values)
            prepared := database.prepare_command(query)
            from
            until
               done
            loop
               prepared.execute(update_query_builder.prepared_arguments)
               if database.last_action_success then
                  Result := prepared.last_affected_rows
                  done := True
               else
                  done := not dispatch_error(query)
               end
            end
         end
      end

   call_delete (a_delete: EDC_DELETE): INTEGER
      local
         query: STRING; prepared: SQLITE_PREPARED_COMMAND; done: BOOLEAN
      do
         if check_transaction then
            query := delete_query_builder.query_for(a_delete)
            prepared := database.prepare_command(query)
            from
            until
               done
            loop
               prepared.execute(delete_query_builder.prepared_arguments)
               if database.last_action_success then
                  Result := prepared.last_affected_rows
                  if auto_commit then
                     commit
                  end
                  done := True
               else
                  done := not dispatch_error(query)
               end
            end
         end
      end

   call_insert (a_columns: FAST_ARRAY[EDC_COLUMN]; a_values: FAST_ARRAY[EDC_VALUE])
      local
         query: STRING; done: BOOLEAN
      do
         if check_transaction then
            query := insert_query_builder.query_for(a_columns, a_values)
            database.execute(query)
            from
            until
               done
            loop
               if database.last_action_success then
                  if auto_commit then
                     commit
                  end
                  done := True
               else
                  done := not dispatch_error(query)
               end
            end
         end
      end

feature {}
   in_transaction: BOOLEAN

   check_transaction: BOOLEAN
      local
         done: BOOLEAN
      do
         if auto_commit then
            Result := True
         else
            Result := in_transaction
            if not Result then
               from
               until
                  done
               loop
                  database.execute(once "BEGIN;")
                  if database.last_action_success then
                     in_transaction := True
                     Result := True
                     done := True
                  else
                     done := not dispatch_error(once "begin")
                  end
               end
            end
         end
      ensure
         auto_commit implies Result
         not auto_commit implies Result = in_transaction
      end

feature {} -- Column types
   type_of (a_raw_type: STRING): STRING
      require
         not a_raw_type.is_empty
      local
         i: INTEGER
      do
         Result := once ""
         Result.copy(a_raw_type)
         i := Result.first_index_of('(')
         if Result.valid_index(i) then
            Result.shrink(1, i - 1)
         end
         Result.to_upper
      end

   size_of (a_raw_type: STRING): INTEGER
      require
         not a_raw_type.is_empty
      local
         i: INTEGER; s: STRING
      do
         i := a_raw_type.first_index_of('(')
         if a_raw_type.valid_index(i) and then a_raw_type.last = ')' then
            s := once ""
            s.copy_substring(a_raw_type, i + 1, a_raw_type.count - 1)
            if s.is_integer then
               Result := s.to_integer
            end
         else
            Result := Maximum_integer
         end
      end

feature {}
   make (a_database: like database; info: DICTIONARY[STRING, STRING]; a_error_handler: like error_handler)
      require
         a_database /= Void
      do
         database := a_database
         create tables.make
         error_handler := a_error_handler -- before set_info otherwise some SQLite errors may escape application handling
         if info /= Void then
            set_info(info)
         end
      ensure
         database = a_database
      end

   database: SQLITE_DATABASE

   tables: HASHED_DICTIONARY[EDC_SQLITE_TABLE, STRING]

   set_info (info: DICTIONARY[STRING, STRING])
      require
         info /= Void
      local
         i: INTEGER; query: STRING; error, done: BOOLEAN
      do
         from
            query := once ""
            i := info.lower
         until
            i > info.upper or else error
         loop
            query.copy(once "PRAGMA ")
            query.append(info.key(i))
            if info.item(i) /= Void then
               query.extend('=')
               query.append(info.item(i))
            end
            query.extend(';')
            from
               done := False
            until
               done
            loop
               database.execute(query)
               if database.last_action_success then
                  done := True
               else
                  error := not dispatch_error(query)
                  done := error
               end
            end
            i := i + 1
         end
      end

feature {}
   dispatch_error (query: STRING): BOOLEAN
         -- True if retry
      local
         error: EDC_ERROR
      do
         error := edc_error(database.last_action_result, query)
         Result := error.handle(error_handler)
      end

   edc_error (code: INTEGER; query: STRING): EDC_ERROR
      do
         if code = sqlite_ok then
            check False end
         elseif code = sqlite_error then
            create {EDC_ERROR_QUERY_FAILED} Result.make(once "SQL error or missing database", query)
         elseif code = sqlite_internal then
            create {EDC_ERROR_UNKNOWN} Result.make(once "Internal error")
         elseif code = sqlite_perm then
            create {EDC_ERROR_ACCESS_DENIED} Result.make(once "Access permission denied", query)
         elseif code = sqlite_abort then
            create {EDC_ERROR_QUERY_FAILED} Result.make(once "Callback routine requested an abort", query)
         elseif code = sqlite_busy then
            create {EDC_ERROR_LOCKED} Result.make(once "Database file locked", query)
         elseif code = sqlite_locked then
            create {EDC_ERROR_LOCKED} Result.make(once "Table locked", query)
         elseif code = sqlite_nomem then
            create {EDC_ERROR_UNKNOWN} Result.make(once "Out of memory")
         elseif code = sqlite_readonly then
            create {EDC_ERROR_ACCESS_DENIED} Result.make(once "Database file is read-only", query)
         elseif code = sqlite_interrupt then
            create {EDC_ERROR_QUERY_FAILED} Result.make(once "Interrupted", query)
         elseif code = sqlite_ioerr then
            create {EDC_ERROR_UNKNOWN} Result.make(once "I/O error")
         elseif code = sqlite_corrupt then
            create {EDC_ERROR_UNKNOWN} Result.make(once "Database file corrupted")
         elseif code = sqlite_notfound then
            create {EDC_ERROR_QUERY_FAILED} Result.make(once "Table or row not found", query)
         elseif code = sqlite_full then
            create {EDC_ERROR_QUERY_FAILED} Result.make(once "Database full", query)
         elseif code = sqlite_cantopen then
            create {EDC_ERROR_ACCESS_DENIED} Result.make(once "Database file cannot be opened", query)
         elseif code = sqlite_protocol then
            create {EDC_ERROR_UNKNOWN} Result.make(once "Database lock protocol error")
         elseif code = sqlite_empty then
            create {EDC_ERROR_QUERY_FAILED} Result.make(once "Table empty", query)
         elseif code = sqlite_schema then
            create {EDC_ERROR_UNKNOWN} Result.make(once "Database schema unexpectedly changed")
         elseif code = sqlite_toobig then
            create {EDC_ERROR_QUERY_FAILED} Result.make(once "Row too big", query)
         elseif code = sqlite_constraint then
            create {EDC_ERROR_QUERY_FAILED} Result.make(once "Constraint violation", query)
         elseif code = sqlite_mismatch then
            create {EDC_ERROR_QUERY_FAILED} Result.make(once "Data type mismatch", query)
         elseif code = sqlite_misuse then
            create {EDC_ERROR_UNKNOWN} Result.make(once "Library incorrectly used")
         elseif code = sqlite_nolfs then
            create {EDC_ERROR_UNKNOWN} Result.make(once "OS features not supported by host")
         elseif code = sqlite_auth then
            create {EDC_ERROR_ACCESS_DENIED} Result.make(once "Authorization denied", query)
         elseif code = sqlite_row then
            check False end
         elseif code = sqlite_done then
            check False end
         else
            create {EDC_ERROR_UNKNOWN} Result.make("Unknown code: " + code.out)
         end
      end

feature {} -- Query builders
   create_table_query_builder: EDC_SQLITE_QUERY_BUILDER_CREATE_TABLE
      once
         create Result.make(tools)
      end

   select_query_builder: EDC_SQLITE_QUERY_BUILDER_SELECT
      once
         create Result.make(tools)
      end

   update_query_builder: EDC_SQLITE_QUERY_BUILDER_UPDATE
      once
         create Result.make(tools)
      end

   delete_query_builder: EDC_SQLITE_QUERY_BUILDER_DELETE
      once
         create Result.make(tools)
      end

   insert_query_builder: EDC_SQLITE_QUERY_BUILDER_INSERT
      once
         create Result.make(tools)
      end

   tools: EDC_SQLITE_QUERY_BUILDER_TOOLS
      once
         create Result.make
      end

invariant
   database /= Void

end -- class EDC_SQLITE_CONNECTION
