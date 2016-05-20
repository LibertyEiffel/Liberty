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
deferred class EDC_TYPED_COLUMN[T_]

inherit
   EDC_COLUMN

feature {ANY}
   as_value: EDC_COLUMN_VALUE[T_]
      deferred
      end

   infix "@", manifest (a_data: T_): EDC_MANIFEST_VALUE[T_]
      do
         create Result.make(a_data)
      end

   prefix "#", parameter: EDC_PARAMETER[T_]
      do
         create Result.make
      end

feature {ANY} -- Convenient shorthands
   is_null: EDC_EXPRESSION
      do
         Result := as_value.is_null
      end

   equals, infix "==" (other: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      do
         Result := as_value.equals(other)
      end

   in, infix "~~" (set: EDC_SELECT): EDC_EXPRESSION
      do
         Result := as_value.in(set)
      end

   is_like, infix "~=" (a_value: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      do
         Result := as_value.is_like(a_value)
      end

   less_than, lt, infix "<" (a_value: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      do
         Result := as_value.lt(a_value)
      end

   less_than_or_equal, le, infix "<=" (a_value: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      do
         Result := as_value.le(a_value)
      end

   greter_than, gt, infix ">" (a_value: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      do
         Result := as_value.gt(a_value)
      end

   greater_than_or_equal, ge, infix ">=" (a_value: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      do
         Result := as_value.ge(a_value)
      end

feature {ANY}
   as_datum (datum: T_): EDC_TYPED_DATUM[T_]
      do
         Result := datum_factory.as_datum(datum)
      end

feature {ANY}
   item (set: EDC_RESULT_SET): EDC_TYPED_DATUM[T_]
      do
         Result ::= set.item(Current)
      end

   valid_value (a_value: EDC_DATUM): BOOLEAN
      local
         i: INTEGER
      do
         Result := {EDC_TYPED_DATUM[T_]} ?:= a_value
         if Result and then constraints /= Void then
            from
               i := constraints.lower
            until
               not Result or else i > constraints.upper
            loop
               Result := constraints.item(i).valid_value(a_value)
            end
         end
      end

   same_values (v1, v2: EDC_DATUM): BOOLEAN
      local
         tv1, tv2: EDC_TYPED_DATUM[T_]; t1, t2: T_; is_expanded: BOOLEAN
      do
         is_expanded := t1 /= Void
         -- NULL values are always different
         if v1 /= Void and then v2 /= Void then
            tv1 ::= v1
            tv2 ::= v2
            t1 := tv1.item
            t2 := tv2.item
            if is_expanded then
               Result := t1 = t2
            else
               Result := t1 = t2 or else t1 /= Void and then t1.is_equal(t2)
            end
         end
      end

   value (a_value: EDC_DATUM): T_
      require
         a_value /= Void
      local
         v: EDC_TYPED_DATUM[T_]
      do
         v ::= a_value
         Result := v.item
      end

feature {}
   make (a_name: like name)
      require
         a_name.count > 0
      do
         name := a_name
      end

   datum_factory: EDC_DATUM_FACTORY[T_]

end -- class EDC_TYPED_COLUMN
