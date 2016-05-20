-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2016: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
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
deferred class EDC_CONNECTION
   --
   -- A connection to a data source
   --

insert
   EDC_CONSTANTS
      redefine is_equal
      end

feature {ANY}
   is_equal (other: EDC_CONNECTION): BOOLEAN
         -- to freeze signature
      deferred
      end

feature {ANY} -- Connection management:
   disconnect
         -- Disconnect from the data source
      require
         is_connected
      deferred
      ensure
         not is_connected
      end

   is_connected: BOOLEAN
         -- Is the data source connected?
      deferred
      end

feature {ANY} -- Error management:
   set_error_handler (a_error_handler: like error_handler)
      do
         error_handler := a_error_handler
      ensure
         error_handler = a_error_handler
      end

   error_handler: EDC_ERROR_HANDLER
         -- Used to handle errors.

feature {ANY} -- Session management:
   commit
         -- Commit changed data back to the data source
      require
         is_connected
      deferred
      end

   new_savepoint (name: STRING): EDC_SAVEPOINT
         -- A new savepoint
      require
         is_connected
         not name.is_empty
      deferred
      ensure
         Result.is_active
         Result.name.is_equal(name)
      end

   rollback
         -- Forgets and changed data
      require
         is_connected
      deferred
      end

   rollback_to (a_savepoint: EDC_SAVEPOINT)
         -- Rolls the data back to the given savepoint
      require
         is_connected
         a_savepoint.is_active
      deferred
      ensure
         not a_savepoint.is_active
      end

   auto_commit: BOOLEAN
         -- True if any data changed is immediately committed
      require
         is_connected
      deferred
      end

   set_auto_commit (a_auto_commit: like auto_commit)
         -- Sets the `auto_commit' mode
      require
         is_connected
      deferred
      ensure
         auto_commit = a_auto_commit
      end

feature {ANY}
   create_table (a_table: EDC_TABLE)
         -- Create the table in the data source
      require
         a_table.connection = Void
         new_table: not has_table_name(a_table.name)
         has_columns: a_table.count_column > 0
      deferred
      ensure
         a_table.connection = Current
      end

   drop_table (a_table: EDC_TABLE)
         -- Drops the given table
      require
         known_table: a_table.connection = Current
      deferred
      end

   has_table_name (a_table_name: STRING): BOOLEAN
         -- Does the data source know this table?
      require
         not a_table_name.is_empty
      deferred
      end

   table (a_table_name: STRING): EDC_TABLE
         -- The table in the data source
      require
         has_table_name(a_table_name)
      deferred
      end

   all_table_names: COLLECTION[STRING]
         -- The names of all the known tables
      deferred
      ensure
         Result.for_all(agent has_table_name)
      end

feature {ANY} -- Fetch direction:
   set_fetch_direction (a_fetch_direction: like fetch_direction)
         -- Sets the `fetch_diection'
      require
         a_fetch_direction = fetch_forward or else a_fetch_direction = fetch_backward
      deferred
      ensure
         fetch_direction = a_fetch_direction
      end

   fetch_direction: INTEGER_8
         -- Direction in which the data is returned
      deferred
      ensure
         Result = fetch_forward or else Result = fetch_backward
      end

feature {ANY}
   select_data (columns: TRAVERSABLE[EDC_COLUMN]): EDC_SELECT
         -- Starts a select query that will return data from the data source
      require
         columns.count > 0
      do
         create Result.make(Current, columns)
      ensure
         Result /= Void
      end

   insert_data (columns: TRAVERSABLE[EDC_COLUMN]): EDC_INSERT
         -- Starts an insert query that will insert data in the data source
      require
         columns.count > 0
      do
         create Result.make(Current, columns)
      ensure
         Result /= Void
      end

   update_data (columns: TRAVERSABLE[EDC_COLUMN]): EDC_UPDATE
         -- Starts an update query that will modify some data in the data source
      require
         columns.count > 0
      do
         create Result.make(Current, columns)
      ensure
         Result /= Void
      end

   delete_data (columns: TRAVERSABLE[EDC_COLUMN]): EDC_DELETE
         -- Starts a delete query that will remove some data from the data source
      require
         columns.count > 0
      do
         create Result.make(Current, columns)
      ensure
         Result /= Void
      end

feature {EDC_CALL_HANDLER}
   call_select (a_selectable: EDC_SELECTABLE): EDC_RESULT_SET
         -- The real implementation of data retrieval from the data source
      require
         a_selectable /= Void
      deferred
      ensure
         Result /= Void implies Result.is_before_first
      end

   call_update (a_update: EDC_UPDATE; a_values: TRAVERSABLE[EDC_VALUE]): INTEGER
         -- The real implementation of data update from the data source. Default implementation provided.
      require
         a_update /= Void
         a_values /= Void
      local
         rs: EDC_RESULT_SET
      do
         from
            rs := call_select(a_update)
         until
            rs.is_off
         loop
            rs.update(a_values)
            rs.next
            Result := Result + 1
         end
         if auto_commit then
            commit
         end
      end

   call_delete (a_delete: EDC_DELETE): INTEGER
         -- The real implementation of data removal from the data source. Default implementation provided.
      require
         a_delete /= Void
      local
         rs: EDC_RESULT_SET
      do
         from
            rs := call_select(a_delete)
         until
            rs.is_off
         loop
            rs.delete
            Result := Result + 1
         end
         if auto_commit then
            commit
         end
      end

   call_insert (a_columns: FAST_ARRAY[EDC_COLUMN]; a_values: FAST_ARRAY[EDC_VALUE])
         -- The real implementation of data storage in the data source
      require
         not a_columns.is_empty
         a_columns.count = a_values.count
      deferred
      end

end -- class EDC_CONNECTION
