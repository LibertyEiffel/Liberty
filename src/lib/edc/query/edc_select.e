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
class EDC_SELECT

inherit
   EDC_SELECTABLE

create {EDC_CONNECTION}
   make

feature {ANY}
   accept (a_visitor: VISITOR)
      local
         v: EDC_SELECT_VISITOR
      do
         v ::= a_visitor
         v.visit_select(Current)
      end

feature {ANY}
   call (arguments: TRAVERSABLE[EDC_VALUE]): EDC_RESULT_SET
      require
         arguments = Void implies open_count = 0
         arguments /= Void implies arguments.count = open_count
      local
         lost: INTEGER
      do
         if arguments /= Void then
            lost := do_prepare_call(arguments, arguments.lower)
         end
         check
            can_call
         end
         Result := connection.call_select(Current)
         --|*** TODO: take order_by into account
      end

feature {ANY}
   order_by (a_columns: TRAVERSABLE[EDC_COLUMN]): like Current
      do
         not_yet_implemented
         Result := Current
      ensure
         chain: Result = Current
      end

end -- class EDC_SELECT
