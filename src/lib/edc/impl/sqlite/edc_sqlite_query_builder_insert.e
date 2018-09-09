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
class EDC_SQLITE_QUERY_BUILDER_INSERT

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
   query_for (a_columns: FAST_ARRAY[EDC_COLUMN]; a_values: FAST_ARRAY[EDC_VALUE]): STRING
         -- Always returns the same STRING
      local
         i: INTEGER
      do
         prepared_arguments.clear_count
         Result := current_query
         Result.copy(once "INSERT INTO ")
         query_table(a_columns.first.table)
         Result.append(once " (")
         from
            i := a_columns.lower
         until
            i > a_columns.upper
         loop
            if i > a_columns.lower then
               Result.append(once ", ")
            end
            query_column_short(a_columns.item(i))
            i := i + 1
         end
         Result.append(once ") VALUES (")
         from
            i := a_values.lower
         until
            i > a_values.upper
         loop
            if i > a_values.lower then
               Result.append(once ", ")
            end
            query_value(a_values.item(i))
            i := i + 1
         end
         Result.append(once ");")
      end

end -- class EDC_SQLITE_QUERY_BUILDER_INSERT
