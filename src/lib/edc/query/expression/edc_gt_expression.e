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
class EDC_GT_EXPRESSION[N_ -> COMPARABLE]

inherit
   EDC_EXPRESSION
   ESE_TYPED_VISITABLE[N_]

create {EDC_VALUE}
   make

feature {}
   typed_accept (a_visitor: ESE_TYPED_VISITOR[N_])
      local
         v: EDC_GT_EXPRESSION_VISITOR[N_]
      do
         v ::= a_visitor
         v.visit_gt_expression(Current)
      end

feature {}
   make (a_left: like left; a_right: like right)
      require
         a_left /= Void
         a_right /= Void
      do
         left := a_left
         right := a_right
      ensure
         left = a_left
         right = a_right
      end

feature {ANY}
   left: EDC_TYPED_VALUE[N_]

   right: EDC_TYPED_VALUE[N_]

feature {ANY}
   can_call: BOOLEAN
      do
         Result := left.can_call and then right.can_call
      end

   open_count: INTEGER
      do
         Result := left.open_count + right.open_count
      end

feature {ANY}
   matches (a_columns: TRAVERSABLE[EDC_COLUMN]; a_data: TRAVERSABLE[EDC_DATUM]): BOOLEAN
      local
         l: EDC_TYPED_DATUM[N_]; r: EDC_TYPED_DATUM[N_]
      do
         l ::= left.value(a_columns, a_data)
         r ::= right.value(a_columns, a_data)
         if l /= Void and then r /= Void then
            Result := l.item > r.item
         end
      end

   can_match (a_column: EDC_COLUMN): BOOLEAN
      do
         Result := left.is_column(a_column) or else right.is_column(a_column)
      end

feature {EDC_SELECTABLE, EDC_EXPRESSION}
   clear_prepare
      do
         left.clear_prepare
         right.clear_prepare
      end

   do_prepare_call (arguments: TRAVERSABLE[EDC_VALUE]; cursor: INTEGER): INTEGER
      do
         Result := right.do_prepare_call(arguments, left.do_prepare_call(arguments, cursor))
      end

   do_set_parameter_positions (position: INTEGER): INTEGER
      do
         Result := right.do_set_parameter_positions(left.do_set_parameter_positions(position))
      end

end -- class EDC_GT_EXPRESSION
