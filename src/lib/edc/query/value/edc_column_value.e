-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright(C) 2006-2009: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
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
deferred class EDC_COLUMN_VALUE[T_]

inherit
   EDC_TYPED_VALUE[T_]
      redefine is_column
      end

feature {ANY}
   column: EDC_TYPED_COLUMN[T_]

   item (set: EDC_RESULT_SET): EDC_TYPED_DATUM[T_] is
      do
         Result := column.item(set)
      end

   value (a_columns: TRAVERSABLE[EDC_COLUMN]; a_data: TRAVERSABLE[EDC_DATUM]): EDC_TYPED_DATUM[T_] is
      local
         i: INTEGER
      do
         from
            i := a_columns.lower
         until
            Result /= Void or else i > a_columns.upper
         loop
            if a_columns.item(i).is_equal(column) then
               Result ::= a_data.item(i)
            end
            i := i + 1
         end
      end

feature {EDC_EXPRESSION}
   can_call: BOOLEAN is True

   open_count: INTEGER is 0

   do_prepare_call (arguments: TRAVERSABLE[EDC_VALUE]; cursor: INTEGER): INTEGER is
      do
         Result := cursor
      end

   do_set_parameter_positions (position: INTEGER): INTEGER is
      do
         Result := position
      end

feature {}
   make (a_column: like column) is
      require
         a_column /= Void
      do
         column := a_column
      end

feature {ANY}
   datum: EDC_DATUM is
      require
         False
      do
         sedb_breakpoint
         check
            False
         end
      end

feature {EDC_EXPRESSION}
   is_column (a_column: EDC_COLUMN): BOOLEAN is
      do
         Result := column = a_column or else column.is_equal(a_column)
      end

invariant
   column /= Void

end -- class EDC_COLUMN_VALUE
