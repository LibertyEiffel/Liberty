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
class EDC_ISNULL_EXPRESSION[T_]

inherit
   EDC_EXPRESSION
   ESE_TYPED_VISITABLE[T_]

create {EDC_VALUE}
   make

feature {}
   typed_accept (a_visitor: ESE_TYPED_VISITOR[T_])
      local
         v: EDC_ISNULL_EXPRESSION_VISITOR[T_]
      do
         v ::= a_visitor
         v.visit_isnull_expression(Current)
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
   exp: EDC_TYPED_VALUE[T_]

feature {ANY}
   can_call: BOOLEAN True

   open_count: INTEGER 0

   matches (a_columns: TRAVERSABLE[EDC_COLUMN]; a_data: TRAVERSABLE[EDC_DATUM]): BOOLEAN
      local
         e: EDC_TYPED_DATUM[T_]
      do
         e ::= exp.value(a_columns, a_data)
         Result := e = Void
      end

   can_match (a_column: EDC_COLUMN): BOOLEAN
      do
         Result := exp.is_column(a_column)
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

end -- class EDC_ISNULL_EXPRESSION
