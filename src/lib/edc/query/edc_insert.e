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
class EDC_INSERT

inherit
   EDC_QUERY

create {EDC_CONNECTION}
   make

feature {ANY}
   accept (a_visitor: VISITOR)
      local
         v: EDC_INSERT_VISITOR
      do
         v ::= a_visitor
         v.visit_insert(Current)
      end

feature {ANY}
   values (a_row: TRAVERSABLE[EDC_VALUE]): like Current
      require
         valid_row(a_row)
      local
         i: INTEGER; row: FAST_ARRAY[EDC_VALUE]
      do
         Result := Current
         from
            create row.with_capacity(a_row.count)
            i := a_row.lower
         until
            i > a_row.upper
         loop
            row.add_last(a_row.item(i))
            i := i + 1
         end
         rows.add_last(row)
      ensure
         chain: Result = Current
      end

   valid_row (a_row: TRAVERSABLE[EDC_VALUE]): BOOLEAN
      do
         Result := a_row /= Void and then a_row.count = columns.count
      end

   call
      local
         i: INTEGER
      do
         connection.call_insert(columns, rows.item(i))
         if connection.auto_commit then
            connection.commit
         end
      end

feature {EDC_CONNECTION}
   valid_columns (a_columns: TRAVERSABLE[EDC_COLUMN]): BOOLEAN
      local
         i: INTEGER; t: EDC_TABLE
      do
         Result := a_columns /= Void and then a_columns.count > 0
         from
            t := a_columns.first.table
            i := a_columns.lower + 1
         until
            not Result or else i > a_columns.upper
         loop
            Result := a_columns.item(i).table = t
            i := i + 1
         end
      end

feature {}
   make (a_connection: like connection; a_columns: TRAVERSABLE[EDC_COLUMN])
      require
         a_connection /= Void
         in_same_table: valid_columns(a_columns)
      local
         i: INTEGER
      do
         connection := a_connection
         from
            create columns.with_capacity(a_columns.count)
            i := a_columns.lower
         until
            i > a_columns.upper
         loop
            columns.add_last(a_columns.item(i))
            i := i + 1
         end
         create rows.make(0)
      end

   connection: EDC_CONNECTION

   columns: FAST_ARRAY[EDC_COLUMN]

   rows: FAST_ARRAY[FAST_ARRAY[EDC_VALUE]]

end -- class EDC_INSERT
