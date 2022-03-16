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
class EDC_TABLE

insert
   EDC_CONSTANTS
      redefine is_equal
      end
   VISITABLE
      redefine is_equal
      end

create {ANY}
   make

feature {ANY}
   accept (a_visitor: VISITOR)
      local
         v: EDC_TABLE_VISITOR
      do
         v ::= a_visitor
         v.visit_table(Current)
      end

feature {ANY}
   is_connected: BOOLEAN
      do
         Result := connection /= Void and then connection.is_connected
      end

   name: STRING

   connection: EDC_CONNECTION

   is_equal (other: like Current): BOOLEAN
      do
         Result := name.is_equal(other.name) and then (connection = other.connection or else connection.is_equal(other.connection))
      end

   prefix "*", all_columns: FAST_ARRAY[EDC_COLUMN]
      do
         if all_columns_memory = Void then
            create all_columns_memory.make(0)
         end
         all_columns_memory.clear_count
         all_columns_memory.append_collection(columns)
         Result := all_columns_memory
      end

feature {}
   all_columns_memory: FAST_ARRAY[EDC_COLUMN]

feature {ANY} -- Columns
   count_column: INTEGER
      do
         Result := columns.count
      end

   lower_column: INTEGER
      do
         Result := columns.lower
      end

   upper_column: INTEGER
      do
         Result := columns.upper
      end

   item_column (i: INTEGER): EDC_COLUMN
      require
         i.in_range(lower_column, upper_column)
      do
         Result := columns.item(i)
      end

   column (column_name: STRING): EDC_COLUMN
      require
         not column_name.is_empty
      local
         i: INTEGER
      do
         i := index_of_column_by_name(column_name)
         if i /= -1 then
            Result := columns.item(i)
         end
      ensure
         Result /= Void implies has_column(Result) and then Result.name.is_equal(column_name)
      end

   add_column (a_column: EDC_COLUMN)
      require
         not has_column(a_column)
      do
         columns.add_last(a_column)
         a_column.set_table(Current)
      ensure
         has_column(a_column)
      end

   remove_column (a_column: EDC_COLUMN)
      require
         has_column(a_column)
      do
         columns.remove(columns.first_index_of(a_column))
         a_column.unset_table
      ensure
         not has_column(a_column)
      end

   has_column (a_column: EDC_COLUMN): BOOLEAN
      do
         Result := a_column.table = Current
         check
            Result = columns.has(a_column)
         end
      end

   index_of_column (a_column: EDC_COLUMN): INTEGER
      do
         Result := columns.first_index_of(a_column)
      end

   same_rows (row1, row2: FAST_ARRAY[EDC_DATUM]): BOOLEAN
      local
         i: INTEGER
      do
         from
            Result := True
            i := columns.lower
         until
            not Result or else i > columns.upper
         loop
            Result := columns.item(i).same_values(row1.item(i), row2.item(i))
            i := i + 1
         end
      end

feature {ANY}
   count_index: INTEGER
      do
         if index /= Void then
            Result := index.count
         end
      end

   lower_index: INTEGER
      do
         if index /= Void then
            Result := index.lower
         end
      end

   upper_index: INTEGER
      do
         if index /= Void then
            Result := index.upper
         else
            Result := -1
         end
      end

   has_index (a_index: EDC_INDEX): BOOLEAN
      do
         if index /= Void then
            Result := index.has(a_index)
         end
      end

   item_index (i: INTEGER): EDC_INDEX
      require
         i.in_range(lower_index, upper_index)
      do
         if index /= Void then
            Result := index.item(i)
         end
      end

   add_index (a_index: EDC_INDEX)
      require
         a_index.table = Void
         a_index.can_add_to(Current)
         not has_index(a_index)
      do
         if index = Void then
            create index.make(0)
         end
         index.add_last(a_index)
         a_index.set_table(Current)
      ensure
         has_index(a_index)
         a_index.table = Current
      end

   remove_index (a_index: EDC_INDEX)
      require
         a_index.table = Current
         has_index(a_index)
      do
         index.remove(index.first_index_of(a_index))
         a_index.set_table(Void)
      ensure
         a_index.table = Void
         not has_index(a_index)
      end

feature {}
   index_of_column_by_name (column_name: STRING): INTEGER
      local
         i: INTEGER
      do
         from
            Result := -1
            i := columns.lower
         until
            Result /= -1 or else i > columns.upper
         loop
            if columns.item(i).name.is_equal(column_name) then
               Result := i
            end
            i := i + 1
         end
      end

feature {}
   make (a_name: STRING)
      require
         a_name.count > 0
      do
         name := a_name
         create columns.make(0)
      end

feature {EDC_CONNECTION}
   set_connection (a_connection: like connection)
      do
         connection := a_connection
      ensure
         connection = a_connection
      end

   columns: FAST_ARRAY[EDC_COLUMN]

   index: FAST_ARRAY[EDC_INDEX]

end -- class EDC_TABLE
