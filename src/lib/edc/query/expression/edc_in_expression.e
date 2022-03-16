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
class EDC_IN_EXPRESSION[T_]

inherit
   EDC_EXPRESSION
   ESE_TYPED_VISITABLE[T_]

create {EDC_VALUE}
   make

feature {}
   typed_accept (a_visitor: ESE_TYPED_VISITOR[T_])
      local
         v: EDC_IN_EXPRESSION_VISITOR[T_]
      do
         v ::= a_visitor
         v.visit_in_expression(Current)
      end

feature {}
   make (a_left: like left; a_right: like right)
      require
         a_left /= Void
         a_right.count = 1
      do
         left := a_left
         right := a_right
      ensure
         left = a_left
         right = a_right
      end

feature {ANY}
   left: EDC_TYPED_VALUE[T_]

   right: EDC_SELECT

feature {ANY}
   can_call: BOOLEAN
      do
         Result := right.can_call
      end

   open_count: INTEGER
      do
         Result := right.open_count
      end

feature {ANY}
   matches (a_columns: TRAVERSABLE[EDC_COLUMN]; a_data: TRAVERSABLE[EDC_DATUM]): BOOLEAN
         --|*** TODO: optimize so that the right.call is made once for each query (maybe requires an extra
         --|function?)
      local
         l, r: EDC_TYPED_DATUM[T_]; rs: EDC_RESULT_SET; c: EDC_TYPED_COLUMN[T_]
      do
         l ::= left.value(a_columns, a_data)
         if l /= Void then
            rs := right.call(Void) -- should already have been prepared
            if rs /= Void then
               from
                  c ::= right.item(right.lower)
               until
                  Result or else rs.is_off
               loop
                  r := c.item(rs)
                  if r /= Void then
                     Result := l.item = r.item or else l.item.is_equal(r.item)
                  end
                  rs.next
               end
            end
         end
      end

   can_match (a_column: EDC_COLUMN): BOOLEAN
      do
         Result := left.is_column(a_column)
      end

feature {EDC_SELECTABLE, EDC_EXPRESSION}
   clear_prepare
      do
         right.clear_prepare
      end

   do_prepare_call (arguments: TRAVERSABLE[EDC_VALUE]; cursor: INTEGER): INTEGER
      do
         Result := right.do_prepare_call(arguments, cursor)
      end

   do_set_parameter_positions (position: INTEGER): INTEGER
      do
         Result := right.do_set_parameter_positions(left.do_set_parameter_positions(position))
      end

end -- class EDC_IN_EXPRESSION
