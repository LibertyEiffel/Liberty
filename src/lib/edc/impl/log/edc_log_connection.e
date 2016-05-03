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
class EDC_LOG_CONNECTION

inherit
   EDC_CONNECTION

insert
   EDC_CALL_HANDLER
      rename is_equal as call_handler_is_equal
      export {} call_handler_is_equal
      end

create {EDC_LOG_DRIVER}
   make

feature {ANY}
   is_equal (other: EDC_CONNECTION): BOOLEAN
      local
         othercnx: like Current
      do
         if othercnx ?:= other then
            othercnx ::= other
            Result := log.is_equal(othercnx.log) and then connection.is_equal(othercnx.connection)
         end
      end

feature {ANY} -- Connection management:
   disconnect
      do
         connection.disconnect
      end

   is_connected: BOOLEAN
      do
         Result := log.is_connected and then connection.is_connected
      end

feature {ANY} -- Session management:
   commit
      do
         log.put_string(once "commit%N")
         connection.commit
      end

   new_savepoint (name: STRING): EDC_SAVEPOINT
      do
         log.put_string(once "savepoint %"")
         log.put_string(name)
         log.put_string(once "%"%N")
         Result := connection.new_savepoint(name)
      end

   rollback
      do
         log.put_string(once "rollback%N")
         connection.rollback
      end

   rollback_to (a_savepoint: EDC_SAVEPOINT)
      do
         log.put_string(once "rollback to savepoint %"")
         log.put_string(a_savepoint.name)
         log.put_string(once "%"%N")
         connection.rollback_to(a_savepoint)
      end

   auto_commit: BOOLEAN
      do
         Result := connection.auto_commit
      end

   set_auto_commit (a_auto_commit: like auto_commit)
      do
         connection.set_auto_commit(a_auto_commit)
      end

feature {ANY}
   create_table (a_table: EDC_TABLE)
      do
         table_logger.log_create(a_table)
         connection.create_table(a_table)
         a_table.set_connection(Current)
      end

   drop_table (a_table: EDC_TABLE)
      do
         table_logger.log_drop(a_table)
         connection.drop_table(a_table)
      end

   has_table_name (a_table_name: STRING): BOOLEAN
      do
         Result := connection.has_table_name(a_table_name)
      end

   table (a_table_name: STRING): EDC_TABLE
      do
         Result := connection.table(a_table_name)
      end

feature {ANY} -- Fetch direction:
   set_fetch_direction (a_fetch_direction: INTEGER)
      do
         connection.set_fetch_direction(a_fetch_direction)
      end

   fetch_direction: INTEGER
      do
         Result := connection.fetch_direction
      end

feature {EDC_CALL_HANDLER}
   call_select (a_selectable: EDC_SELECTABLE): EDC_RESULT_SET
      do
         query_logger.log_selectable(a_selectable)
         Result := connection.call_select(a_selectable)
      end

   call_insert (a_columns: FAST_ARRAY[EDC_COLUMN]; a_values: FAST_ARRAY[EDC_VALUE])
      do
         query_logger.log_insert(a_columns, a_values)
         connection.call_insert(a_columns, a_values)
      end

feature {}
   make (a_log: like log; a_connection: like connection)
      require
         a_log /= Void
         a_connection /= Void
      do
         log := a_log
         connection := a_connection
         create table_logger.make(a_log)
         create query_logger.make(a_log)
      end

feature {EDC_LOG_CONNECTION}
   log: OUTPUT_STREAM

   connection: EDC_CONNECTION

feature {}
   table_logger: EDC_LOG_TABLE_LOGGER

   query_logger: EDC_LOG_QUERY_LOGGER

invariant
   log /= Void
   connection /= Void

end -- class EDC_LOG_CONNECTION
