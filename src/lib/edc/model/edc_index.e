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
deferred class EDC_INDEX
   --
   -- A table constraint
   --

insert
   EDC_CONSTANTS
   VISITABLE

feature {ANY}
   table: EDC_TABLE

   can_add_to (a_table: like table): BOOLEAN
      require
         a_table /= Void
      deferred
      end

   has (a_column: EDC_COLUMN): BOOLEAN
      require
         a_column /= Void
      deferred
      end

   index_of (a_column: EDC_COLUMN): INTEGER
      require
         a_column /= Void
      deferred
      end

   count: INTEGER
      deferred
      end

   lower: INTEGER
      deferred
      end

   upper: INTEGER
      deferred
      end

   item (i: INTEGER): EDC_COLUMN
      require
         i.in_range(lower, upper)
      deferred
      ensure
         Result /= Void
      end

feature {EDC_TABLE}
   set_table (a_table: like table)
      require
         table = Void implies can_add_to(a_table)
         table /= Void implies a_table = Void
      do
         table := a_table
      ensure
         table = a_table
      end

end -- class EDC_INDEX
