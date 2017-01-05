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
class EDC_STORABLE_TABLE
   --
   -- A proxy object that is storable (allows to put the tables in an XML_REPOSITORY)
   --

inherit
   EDC_STORABLE_DATA

insert
   STORABLE

create {EDC_STORABLE_CONNECTION}
   make

feature {ANY}
   count: INTEGER
      do
         Result := rows.count
      end

   lower: INTEGER
      do
         Result := rows.lower
      end

   upper: INTEGER
      do
         Result := rows.upper
      end

   item (i: INTEGER): FAST_ARRAY[EDC_DATUM]
      do
         Result := rows.item(i)
      end

   index_of (a_row: FAST_ARRAY[EDC_DATUM]): INTEGER
      local
         i: INTEGER; found: BOOLEAN; row: FAST_ARRAY[EDC_DATUM]
      do
         from
            Result := rows.lower - 1
            i := rows.lower
         until
            found or else i > rows.upper
         loop
            row := rows.item(i)
            if row /= Void and then same_rows(row, a_row) then
               Result := i
               found := True
            end
            i := i + 1
         end
      end

   has (a_row: FAST_ARRAY[EDC_DATUM]): BOOLEAN
      do
         Result := rows.valid_index(index_of(a_row))
      end

feature {EDC_STORABLE_INDEX}
   same_rows (row1, row2: FAST_ARRAY[EDC_DATUM]): BOOLEAN
      do
         Result := table.same_rows(row1, row2)
      end

feature {ANY}
   table: EDC_TABLE

   has_column (a_column: EDC_COLUMN): BOOLEAN
      do
         Result := a_column.table = table
      end

   index_of_column (a_column: EDC_COLUMN): INTEGER
      do
         Result := table.index_of_column(a_column)
      end

feature {EDC_STORABLE_CONNECTION}
   can_add (a_row: FAST_ARRAY[EDC_DATUM]): BOOLEAN
      local
         i: INTEGER
      do
         from
            Result := a_row /= Void and then a_row.count = table.count_column
            i := indexes.lower
         until
            not Result or else i > indexes.upper
         loop
            Result := indexes.item(i).can_add(a_row)
            i := i + 1
         end
      end

   add (a_row: FAST_ARRAY[EDC_DATUM])
      require
         can_add(a_row)
      local
         i, pos: INTEGER
      do
         if holes.is_empty then
            rows.add_last(a_row)
            pos := rows.upper
         else
            pos := holes.first
            check
               rows.item(pos) = Void
            end
            holes.remove_first
            rows.put(a_row, pos)
         end
         from
            i := indexes.lower
         until
            i > indexes.upper
         loop
            indexes.item(i).add(a_row)
            i := i + 1
         end
      ensure
         has(a_row)
      end

   remove (a_row: FAST_ARRAY[EDC_DATUM])
      require
         has(a_row)
      local
         x, i: INTEGER
      do
         x := index_of(a_row)
         rows.put(Void, x)
         holes.add_last(x)
         from
            i := indexes.lower
         until
            i > indexes.upper
         loop
            if indexes.item(i).has(a_row) then
               indexes.item(i).remove(a_row)
            end
            i := i + 1
         end
      end

feature {EDC_STORABLE_EXPRESSION_SELECTOR}
   index_count: INTEGER
      do
         Result := indexes.count
      end

   index_lower: INTEGER
      do
         Result := indexes.lower
      end

   index_upper: INTEGER
      do
         Result := indexes.upper
      end

   index_item (i: INTEGER): EDC_STORABLE_INDEX
      require
         i.in_range(index_lower, index_upper)
      do
         Result := indexes.item(i)
      end

feature {}
   make (a_table: EDC_TABLE)
      local
         i: INTEGER
      do
         create rows.make(0)
         create holes.with_capacity(4, 0)
         table := a_table
         from
            create indexes.with_capacity(a_table.count_index)
            i := a_table.lower_index
         until
            i > a_table.upper_index
         loop
            indexes.add_last(create {EDC_STORABLE_INDEX}.make(a_table.item_index(i), Current))
            i := i + 1
         end
      end

   indexes: FAST_ARRAY[EDC_STORABLE_INDEX]

   rows: FAST_ARRAY[FAST_ARRAY[EDC_DATUM]]

   holes: RING_ARRAY[INTEGER]

invariant
   rows /= Void

end -- class EDC_STORABLE_TABLE
