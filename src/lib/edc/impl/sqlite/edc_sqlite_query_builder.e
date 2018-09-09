-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2018: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
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
deferred class EDC_SQLITE_QUERY_BUILDER

feature {EDC_SQLITE_CONNECTION}
   prepared_arguments: FAST_ARRAY[ANY]
      once
         create Result.make(0)
      end

feature {}
   current_query: STRING ""

   query_table (a_table: EDC_TABLE)
      require
         a_table /= Void
      do
         current_query.extend('"')
         current_query.append(a_table.name)
         current_query.extend('"')
      end

   query_column (a_column: EDC_COLUMN)
      require
         a_column /= Void
      do
         current_query.extend('"')
         current_query.append(a_column.table.name)
         current_query.append(once "%".%"")
         current_query.append(a_column.name)
         current_query.extend('"')
      end

   query_column_short (a_column: EDC_COLUMN)
      require
         a_column /= Void
      do
         current_query.extend('"')
         current_query.append(a_column.name)
         current_query.extend('"')
      end

   query_value (a_value: EDC_VALUE)
      require
         tools /= Void
      do
         if a_value = Void then
            current_query.append(once "NULL")
         else
            a_value.accept(tools)
         end
      end

   query_expression (a_expression: EDC_EXPRESSION)
      require
         tools /= Void
         a_expression /= Void
      do
         a_expression.accept(tools)
      end

feature {}
   tools: EDC_SQLITE_QUERY_BUILDER_TOOLS

end -- class EDC_SQLITE_QUERY_BUILDER
