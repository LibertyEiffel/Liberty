-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2017: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
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
class EDC_NOT_EXPRESSION

inherit
   EDC_EXPRESSION

create {EDC_EXPRESSION}
   make

feature {ANY}
   accept (a_visitor: VISITOR)
      local
         v: EDC_NOT_EXPRESSION_VISITOR
      do
         v ::= a_visitor
         v.visit_not_expression(Current)
      end

feature {}
   make (a_exp: like exp)
      require
         a_exp /= Void
      do
         exp := a_exp
      ensure
         exp = a_exp
      end

feature {ANY}
   exp: EDC_EXPRESSION

feature {ANY}
   can_call: BOOLEAN
      do
         Result := exp.can_call
      end

   open_count: INTEGER
      do
         Result := exp.open_count
      end

feature {ANY}
   matches (a_columns: TRAVERSABLE[EDC_COLUMN]; a_data: TRAVERSABLE[EDC_DATUM]): BOOLEAN
      do
         Result := not exp.matches(a_columns, a_data)
      end

   can_match (a_column: EDC_COLUMN): BOOLEAN
      do
         Result := exp.can_match(a_column)
      end

feature {EDC_SELECTABLE, EDC_EXPRESSION}
   clear_prepare
      do
         exp.clear_prepare
      end

   do_prepare_call (arguments: TRAVERSABLE[EDC_VALUE]; cursor: INTEGER): INTEGER
      do
         Result := exp.do_prepare_call(arguments, cursor)
      end

   do_set_parameter_positions (position: INTEGER): INTEGER
      do
         Result := exp.do_set_parameter_positions(position)
      end

end -- class EDC_NOT_EXPRESSION
