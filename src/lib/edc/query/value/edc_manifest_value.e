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
class EDC_MANIFEST_VALUE[T_]

inherit
   EDC_TYPED_VALUE[T_]
      redefine is_equal
      end
   ESE_TYPED_VISITABLE[T_]
      redefine is_equal
      end

create {EDC_COLUMN}
   make

feature {}
   typed_accept (a_visitor: ESE_TYPED_VISITOR[T_])
      local
         v: EDC_MANIFEST_VALUE_VISITOR[T_]
      do
         v ::= a_visitor
         v.visit_manifest_value(Current)
      end

feature {ANY}
   item: T_

   is_equal (other: like Current): BOOLEAN
      local
         t: T_
      do
         if t /= Void then
            -- type is expanded
            Result := item = other.item
         else
            Result := item = other.item or else item /= Void and then item.is_equal(other.item)
         end
      end

   value (a_columns: TRAVERSABLE[EDC_COLUMN]; a_data: TRAVERSABLE[EDC_DATUM]): EDC_TYPED_DATUM[T_]
      do
         Result := datum
      end

feature {EDC_EXPRESSION}
   can_call: BOOLEAN True

   open_count: INTEGER 0

   do_prepare_call (arguments: TRAVERSABLE[EDC_VALUE]; cursor: INTEGER): INTEGER
      do
         Result := cursor
      end

   do_set_parameter_positions (position: INTEGER): INTEGER
      do
         Result := position
      end

feature {ANY}
   datum: EDC_TYPED_DATUM[T_]
      do
         Result := datum_factory.as_datum(item)
      end

feature {}
   make (a_item: like item)
      do
         item := a_item
      end

   datum_factory: EDC_DATUM_FACTORY[T_]

end -- class EDC_MANIFEST_VALUE
