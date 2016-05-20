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
deferred class EDC_EXPRESSION

inherit
   VISITABLE

feature {ANY}
   infix "and" (other: EDC_EXPRESSION): EDC_EXPRESSION
      require
         other /= Void
      do
         create {EDC_AND_EXPRESSION} Result.make(Current, other)
      ensure
         Result /= Void
      end

   infix "or" (other: EDC_EXPRESSION): EDC_EXPRESSION
      require
         other /= Void
      do
         create {EDC_OR_EXPRESSION} Result.make(Current, other)
      ensure
         Result /= Void
      end

   prefix "not": EDC_EXPRESSION
      do
         create {EDC_NOT_EXPRESSION} Result.make(Current)
      ensure
         Result /= Void
      end

feature {ANY}
   can_call: BOOLEAN
      deferred
      end

   open_count: INTEGER
      deferred
      end

feature {EDC_SELECTABLE, EDC_EXPRESSION}
   clear_prepare
      deferred
      end

   do_prepare_call (arguments: TRAVERSABLE[EDC_VALUE]; cursor: INTEGER): INTEGER
      require
         arguments /= Void implies arguments.count >= open_count
         arguments /= Void implies arguments.valid_index(cursor)
      deferred
      ensure
         Result >= cursor
         can_call
      end

   do_set_parameter_positions (position: INTEGER): INTEGER
      deferred
      end

feature {ANY}
   matches (a_columns: TRAVERSABLE[EDC_COLUMN]; a_data: TRAVERSABLE[EDC_DATUM]): BOOLEAN
         -- True if the expression matches for the given columns and data.
      require
         a_columns.count = a_data.count
      deferred
      end

   can_match (a_column: EDC_COLUMN): BOOLEAN
         -- True if the expression ''can match'' for the column `a_column' (i.e. not necessarily matches, but
         -- ''can'').
      deferred
      end

feature {EDC_SELECTABLE}
   set_parameter_positions
      local
         lost: INTEGER
      do
         lost := do_set_parameter_positions(1)
      end

end -- class EDC_EXPRESSION
