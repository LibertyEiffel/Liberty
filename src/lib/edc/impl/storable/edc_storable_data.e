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
deferred class EDC_STORABLE_DATA

feature {ANY}
   count: INTEGER
      deferred
      end

   lower: INTEGER
      deferred
      end

   upper: INTEGER
      deferred
      end

   item (i: INTEGER): FAST_ARRAY[EDC_DATUM]
      require
         i.in_range(lower, upper)
      deferred
      ensure
         Result /= Void
      end

   has (a_row: FAST_ARRAY[EDC_DATUM]): BOOLEAN
      deferred
      end

   has_column (a_column: EDC_COLUMN): BOOLEAN
      deferred
      end

   index_of_column (a_column: EDC_COLUMN): INTEGER
      deferred
      end

   traversable (a_column: EDC_COLUMN): TRAVERSABLE[EDC_DATUM]
      require
         has_column(a_column)
      do
         create {EDC_STORABLE_TRAVERSABLE} Result.make(Current, index_of_column(a_column))
      ensure
         Result /= Void
      end

end -- class EDC_STORABLE_DATA
