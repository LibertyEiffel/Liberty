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
expanded class EDC_STORABLE_SELECTOR

feature {EDC_STORABLE_CONNECTION}
   call (a_connection: EDC_STORABLE_CONNECTION; a_selectable: EDC_SELECTABLE): EDC_STORABLE_RESULT_SET
      local
         i: INTEGER
      do
         expression_selector.clear
         from
            i := a_selectable.lower
         until
            i > a_selectable.upper
         loop
            expression_selector.add(a_selectable.item(i))
            i := i + 1
         end
         Result := expression_selector.call(a_connection, a_selectable.where_clause)
      end

feature {}
   expression_selector: EDC_STORABLE_EXPRESSION_SELECTOR
      once
         create Result.make
      end

end -- class EDC_STORABLE_SELECTOR
