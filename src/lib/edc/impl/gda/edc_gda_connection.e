-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2017: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
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
class EDC_GDA_CONNECTION

inherit
   EDC_CONNECTION

feature {ANY}
   is_equal (other: EDC_CONNECTION): BOOLEAN
      do
         Result := other = Current
      end

feature {ANY} -- Connection management:
   disconnect
      do
         connnection.close
      end

   is_connected: BOOLEAN
      do
         Result := connection.is_opened
      end

feature {ANY} -- Session management:
   commit
      do
         current_transaction := current_transaction.commit_to(null_transaction)
      ensure
         not has_current_transaction
      end

   new_savepoint (name: STRING): EDC_SAVEPOINT
      do
         create current_transaction.make(name.twin, current_transaction)
         Result := current_transaction
      end

   rollback
      do
         current_transaction := current_transaction.rollback_to(null_transaction)
      ensure
         not has_current_transaction
      end

   rollback_to (a_savepoint: EDC_SAVEPOINT)
      do
         current_transaction := current_transaction.rollback_to(a_savepoint.transaction)
      end

   auto_commit: BOOLEAN

   set_auto_commit (a_auto_commit: like auto_commit)
      do
         if has_current_transaction then
            if a_auto_commit then
               commit
            else
               rollback
            end
         end
         auto_commit := a_auto_commit
      end

feature {ANY}
   create_table (a_table: EDC_TABLE)
      do
         not_yet_implemented
         database.update_dbms_data(0, Void)
      end

   drop_table (a_table: EDC_TABLE)
      do
         not_yet_implemented
         database.update_dbms_data(0, Void)
      end

   has_table_name (a_table_name: STRING): BOOLEAN
      do
         Result := database.table_by_name(a_table_name) /= Void
      end

   table (a_table_name: STRING): EDC_TABLE
      local
         gda_table: GDA_DICT_TABLE; table: EDC_GDA_TABLE
      do
         table := tables.reference_at(a_table_name)
         if table = Void then
            gda_table := database.table_by_name(a_table_name)
            create table.make(gda_table)
            tables.add(table, a_table_name.twin)
         end
         Result := table.table
      end

feature {ANY} -- Fetch direction:
   set_fetch_direction (a_fetch_direction: INTEGER)
      do
         fetch_direction := a_fetch_direction
      end

   fetch_direction: INTEGER

feature {} -- Transaction handling
   current_transaction: EDC_GDA_TRANSACTION
      require
         not auto_commit
      attribute
      end

   open_transaction (name: STRING)
      require
         not auto_commit
      do
         create current_transaction.make(name.twin, current_transaction, gda)
      ensure
         has_current_transaction
         current_transaction.name.is_equal(name)
      end

   commit_current_transaction
      require
         not auto_commit
         has_current_transaction
      do
         current_transaction := current_transaction.commit
      end

   rollback_current_transaction
      require
         not auto_commit
         has_current_transaction
      do
         current_transaction := current_transaction.rollback
      end

   has_current_transaction: BOOLEAN
      require
         not auto_commit
      do
         Result := current_transaction /= null_transaction
      end

feature {EDC_GDA_TRANSACTION}
   set_current_transaction (t: like current_transaction)
      require
         t.previous = Void
      do
         current_transaction := t
      ensure
         current_transaction = t
      end

feature {EDC_CALL_HANDLER}
   call_select (a_selectable: EDC_SELECTABLE): EDC_RESULT_SET
      do
         not_yet_implemented
      end

   call_insert (a_columns: FAST_ARRAY[EDC_COLUMN]; a_values: FAST_ARRAY[EDC_VALUE])
      do
         not_yet_implemented
      end

feature {}
   make (a_connection: like connection; a_gda: like gda)
      require
         a_connection /= Void
         a_gda /= Void
      local
         dict: GDA_DICT
      do
         connection := a_connection
         gda := a_gda
         create dict.make
         dict.set_connection(a_connection)
         create database.from_dict(dict)
         create tables.make(0)
         create null_transaction.null
         current_transaction := null_transaction
      ensure
         connection = a_connection
         gda = a_gda
      end

   connection: GDA_CONNECTION

   database: GDA_DICT_DATABASE

   tables: HASHED_DICTIONARY[EDC_GDA_TABLE, STRING]

   null_transaction: EDC_GDA_TRANSACTION

feature {EDC_GDA_TRANSACTION}
   gda: GDA_CLIENT

invariant
   connection /= Void
   current_transaction /= Void

end -- class EDC_GDA_CONNECTION
