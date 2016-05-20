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
class EDC_SQLITE_RESULT_SET

inherit
   EDC_RESULT_SET

create {EDC_SQLITE_CONNECTION}
   make

feature {ANY} -- Connection:
   disconnect
      do
         connection := Void
      end

   is_connected: BOOLEAN
      do
         Result := connection /= Void and then connection.is_connected
      end

   connection: EDC_CONNECTION

feature {ANY} -- Data query:
   is_after_last: BOOLEAN
      do
         Result := cursor > result_set.upper
      end

   is_before_first: BOOLEAN
      do
         Result := cursor < result_set.lower
      end

   next
      do
         cursor := cursor + 1
      end

   previous
      do
         cursor := cursor - 1
      end

feature {EDC_CONNECTION}
   update (values: TRAVERSABLE[EDC_VALUE])
      do
         not_yet_implemented
      end

   delete
      do
         not_yet_implemented
      end

feature {ANY}
   fetch_direction: INTEGER_8
      do
         Result := fetch_forward
      end

   column_count: INTEGER
      do
         Result := columns.count
      end

   column (index: INTEGER): EDC_COLUMN
      do
         Result := columns.item(index)
      end

   column_named (column_name: STRING): EDC_COLUMN
      local
         i: INTEGER; col: EDC_COLUMN
      do
         from
            i := columns.lower
         until
            Result /= Void or else i > columns.upper
         loop
            col := columns.item(i)
            if col.name.is_equal(column_name) then
               Result := col
            end
            i := i + 1
         end
      end

feature {EDC_COLUMN}
   item (a_column: EDC_COLUMN): EDC_DATUM
      local
         i: INTEGER
      do
         i := columns.fast_first_index_of(a_column)
         Result := data_converter.datum(a_column, result_set, cursor, i)
      end

feature {}
   data_converter: EDC_SQLITE_DATA_CONVERTER
      once
         create Result.make
      end

   result_set: SQLITE_RESULT_SET

   columns: FAST_ARRAY[EDC_COLUMN]

   make (a_result_set: like result_set; a_columns: like columns; a_connection: like connection)
      require
         a_result_set /= Void
         a_columns.count > 0
         a_connection /= Void
      do
         result_set := a_result_set
         columns := a_columns
         connection := a_connection
         cursor := result_set.lower - 1
      ensure
         result_set = a_result_set
         columns = a_columns
         connection = a_connection
         is_before_first
      end

   cursor: INTEGER

invariant
   result_set /= Void
   columns.count > 0

end -- class EDC_SQLITE_RESULT_SET
