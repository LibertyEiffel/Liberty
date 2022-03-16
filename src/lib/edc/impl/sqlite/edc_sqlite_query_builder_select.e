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
class EDC_SQLITE_QUERY_BUILDER_SELECT

inherit
   EDC_SQLITE_QUERY_BUILDER

insert
   SINGLETON

create {EDC_SQLITE_CONNECTION}
   make

feature {}
   make (a_tools: like tools)
      require
         a_tools /= Void
      do
         tools := a_tools
      ensure
         tools = a_tools
      end

feature {ESE_TYPED_VISITABLE, VISITOR}
   as_typed (item_type_generator: STRING): VISITOR
      do
         check
            False
         end
      end

feature {EDC_CONNECTION}
   query_for (a_selectable: EDC_SELECTABLE): STRING
         -- Always returns the same STRING
      local
         i: INTEGER; column: EDC_COLUMN; table: EDC_TABLE
      do
         prepared_arguments.clear_count
         Result := current_query
         Result.copy(once "SELECT ")
         from
            tables_memory.clear_count
            i := a_selectable.lower
         until
            i > a_selectable.upper
         loop
            column := a_selectable.item(i)
            table := column.table
            tables_memory.put(table, table.name)
            if i > a_selectable.lower then
               Result.append(once ", ")
            end
            query_column(column)
            i := i + 1
         end
         Result.append(once " FROM ")
         from
            i := tables_memory.lower
         until
            i > tables_memory.upper
         loop
            if i > tables_memory.lower then
               Result.append(once ", ")
            end
            query_table(tables_memory.item(i))
            i := i + 1
         end
         if a_selectable.where_clause /= Void then
            Result.append(once " WHERE ")
            query_expression(a_selectable.where_clause)
         end
         Result.extend(';')
      end

feature {}
   tables_memory: HASHED_DICTIONARY[EDC_TABLE, STRING]
      once
         create Result.make
      end

end -- class EDC_SQLITE_QUERY_BUILDER_SELECT
