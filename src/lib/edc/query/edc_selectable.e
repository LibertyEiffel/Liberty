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
deferred class EDC_SELECTABLE

inherit
   EDC_QUERY

feature {ANY}
   where_clause: EDC_EXPRESSION

   open_count: INTEGER
         -- The number of open arguments
      do
         if where_clause /= Void then
            Result := where_clause.open_count
         end
      end

feature {EDC_EXPRESSION}
   clear_prepare
      do
         if where_clause /= Void then
            where_clause.clear_prepare
         end
      end

   do_prepare_call (arguments: TRAVERSABLE[EDC_VALUE]; cursor: INTEGER): INTEGER
         -- If the query has open arguments, fill them with the supplied values
      require
         arguments /= Void implies arguments.count >= open_count
         arguments /= Void implies arguments.valid_index(cursor)
      do
         if where_clause /= Void then
            where_clause.clear_prepare
            Result := where_clause.do_prepare_call(arguments, cursor)
         end
      ensure
         Result >= cursor
         can_call
      end

feature {ANY} -- Columns:
   count: INTEGER
      do
         Result := columns.count
      end

   lower: INTEGER
      do
         Result := columns.lower
      end

   upper: INTEGER
      do
         Result := columns.upper
      end

   item (i: INTEGER): EDC_COLUMN
      require
         i.in_range(lower, upper)
      do
         Result := columns.item(i)
      end

feature {ANY}
   where (a_where_clause: like where_clause): like Current
      require
         a_where_clause /= Void
         where_clause = Void
      do
         where_clause := a_where_clause
         where_clause.set_parameter_positions
         Result := Current
      ensure
         chain: Result = Current
      end

feature {EDC_EXPRESSION}
   do_set_parameter_positions (position: INTEGER): INTEGER
      do
         if where_clause = Void then
            Result := position
         else
            Result := where_clause.do_set_parameter_positions(position)
         end
      end

feature {}
   make (a_connection: like connection; a_columns: TRAVERSABLE[EDC_COLUMN])
      require
         a_columns.count > 0
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
      end

feature {EDC_CONNECTION, EDC_INTERNALS_HANDLER}
   connection: EDC_CONNECTION

   columns: FAST_ARRAY[EDC_COLUMN]

feature {EDC_EXPRESSION}
   can_call: BOOLEAN
         -- Check that all open arguments are filled with values
      do
         Result := where_clause = Void or else where_clause.can_call
      end

invariant
   columns.count > 0
   connection /= Void

end -- class EDC_SELECTABLE
