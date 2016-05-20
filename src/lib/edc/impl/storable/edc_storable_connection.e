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
class EDC_STORABLE_CONNECTION

inherit
   EDC_CONNECTION

create {EDC_STORABLE_DRIVER}
   prepare_connect

feature {ANY}
   is_equal (other: EDC_CONNECTION): BOOLEAN
      local
         othercnx: like Current
      do
         if othercnx ?:= other then
            othercnx ::= other
            Result := repository.is_equal(othercnx.repository)
         end
      end

feature {ANY} -- Connection management:
   disconnect
      do
         if auto_commit then
            commit
         end
         repository := Void
      end

   is_connected: BOOLEAN
      do
         Result := repository /= Void
      end

feature {ANY} -- Session management:
   commit
      do
         transient.register(to_internals, transient_key)
         repository.commit
         transient.unregister(transient_key)
      end

   new_savepoint (name: STRING): EDC_STORABLE_SAVEPOINT
      do
         create Result.make(name, repository)
      end

   rollback
         -- The current implementation is quite brutal because it invalidates any EDC_TABLE reference.
         --|*** TODO: it means there is an indirection missing.
      local
         i: INTEGER
      do
         transient.register(to_internals, transient_key)
         clear_repository
         repository.update
         transient.unregister(transient_key)
      end

   rollback_to (a_savepoint: EDC_STORABLE_SAVEPOINT)
         -- The current implementation is quite brutal because it invalidates any EDC_TABLE reference.
         --|*** TODO: it means there is an indirection missing.
      do
         transient.register(to_internals, transient_key)
         clear_repository
         a_savepoint.restore(repository)
         repository.commit
         transient.unregister(transient_key)
      end

   auto_commit: BOOLEAN

   set_auto_commit (a_auto_commit: like auto_commit)
      do
         auto_commit := a_auto_commit
      end

feature {}
   clear_repository
      local
         i: INTEGER
      do
         -- invalidate current references
         from
            i := repository.lower
         until
            i > repository.upper
         loop
            repository.item(i).table.set_connection(Void)
            i := i + 1
         end
      end

feature {}
   debug_remove (t: EDC_TABLE)
      local
         i: INTEGER
      do
         from
            i := tables.upper
         until
            i < tables.lower
         loop
            if tables.item(i).table = t then
               tables.remove(i)
               i := tables.lower
            end
            i := i - 1
         end
      end

feature {ANY}
   create_table (a_table: EDC_TABLE)
      local
         t: EDC_STORABLE_TABLE
      do
         create t.make(a_table)
         debug
            tables.add_last(t)
         end
         a_table.set_connection(Current)
         repository.put(t, a_table.name)
         commit
      end

   drop_table (a_table: EDC_TABLE)
      do
         debug
            debug_remove(a_table)
         end
         a_table.set_connection(Void)
         repository.remove(a_table.name)
         commit
      end

   has_table_name (a_table_name: STRING): BOOLEAN
      do
         Result := repository.has(a_table_name)
      end

   table (a_table_name: STRING): EDC_TABLE
      do
         Result := repository.at(a_table_name).table
      end

   all_table_names: FAST_ARRAY[STRING]
      local
         i: INTEGER
      do
         create Result.make(repository.count)
         from
            i := repository.lower
         until
            i > repository.upper
         loop
            Result.put(repository.key(i), i - repository.lower)
            i := i + 1
         end
      end

feature {EDC_STORABLE_EXPRESSION_SELECTOR}
   xml_table (a_table_name: STRING): EDC_STORABLE_TABLE
      do
         if repository.has(a_table_name) then
            Result := repository.at(a_table_name)
         end
      end

feature {ANY} -- Fetch direction:
   set_fetch_direction (a_fetch_direction: like fetch_direction)
      do
         fetch_direction := a_fetch_direction
      end

   fetch_direction: INTEGER_8

feature {EDC_CALL_HANDLER}
   call_select (a_selectable: EDC_SELECTABLE): EDC_RESULT_SET
      local
         selector: EDC_STORABLE_SELECTOR
      do
         Result := selector.call(Current, a_selectable)
      end

   call_insert (a_columns: FAST_ARRAY[EDC_COLUMN]; a_values: FAST_ARRAY[EDC_VALUE])
      local
         t: EDC_STORABLE_TABLE; row: FAST_ARRAY[EDC_DATUM]; v: EDC_VALUE; i: INTEGER
      do
         t := xml_table(a_columns.first.table.name)
         from
            create row.with_capacity(a_values.count)
            i := a_values.lower
         until
            i > a_values.upper
         loop
            v := a_values.item(i)
            if v = Void then
               row.add_last(Void)
            else
               row.add_last(v.datum)
            end
            i := i + 1
         end
         t.add(row)
      end

feature {EDC_STORABLE_CONNECTION}
   repository: REPOSITORY[EDC_STORABLE_TABLE]

feature {}
   tables: FAST_ARRAY[EDC_STORABLE_TABLE]
         -- only exists in debug mode

feature {EDC_STORABLE_DRIVER}
   connect_to (a_repository: like repository)
      require
         a_repository.is_connected
         a_repository.is_updateable
         a_repository.is_commitable
      do
         repository := a_repository
         fetch_direction := fetch_forward
         debug
            create tables.make(0)
         end
         transient.unregister(transient_key)
      end

feature {}
   prepare_connect
      do
         transient.register(to_internals, transient_key)
      end

   transient: REPOSITORY_TRANSIENT

   transient_key: STRING "EDC_STORABLE_CONNECTION"

end -- class EDC_STORABLE_CONNECTION
