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
deferred class EDC_TYPED_VALUE[T_]

inherit
   EDC_VALUE

feature {ANY}
   value (a_columns: TRAVERSABLE[EDC_COLUMN]; a_data: TRAVERSABLE[EDC_DATUM]): EDC_TYPED_DATUM[T_]
      deferred
      ensure
         Result /= Void implies Result.item /= Void
      end

feature {ANY} -- Expressions
   is_null: EDC_EXPRESSION
      do
         create {EDC_ISNULL_EXPRESSION[T_]} Result.make(Current)
      end

   equals, infix "==" (other: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      do
         create {EDC_EQUALS_EXPRESSION[T_]} Result.make(Current, other)
      end

   in, infix "~~" (set: EDC_SELECT): EDC_EXPRESSION
      do
         create {EDC_IN_EXPRESSION[T_]} Result.make(Current, set)
      end

   is_like, infix "~=" (a_value: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      require
         False
      do
         -- nothing
      end

   less_than, lt, infix "<" (a_value: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      require
         at_least_one_column: not_recursive
      do
         Result := a_value.gt(Current)
      ensure
         ok_not_recursive
      end

   less_than_or_equal, le, infix "<=" (a_value: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      require
         at_least_one_column: not_recursive
      do
         Result := a_value.ge(Current)
      ensure
         ok_not_recursive
      end

   greater_than, gt, infix ">" (a_value: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      require
         at_least_one_column: not_recursive
      do
         Result := a_value.lt(Current)
      ensure
         ok_not_recursive
      end

   greater_than_or_equal, ge, infix ">=" (a_value: EDC_TYPED_VALUE[T_]): EDC_EXPRESSION
      require
         at_least_one_column: not_recursive
      do
         Result := a_value.le(Current)
      ensure
         ok_not_recursive
      end

feature {ANY} -- Protect comparison functions with this trick.
   not_recursive: BOOLEAN
         -- Be sure that at least one of both values (either left or right) is a column
      do
         Result := not recursive
         recursive := True
      end

   ok_not_recursive: BOOLEAN
         -- Called in the comparison functions' postcondition to reset the at-least-one-column test.
      do
         Result := recursive
         recursive := False
      end

feature {EDC_EXPRESSION}
   is_column (a_column: EDC_COLUMN): BOOLEAN
      do
         -- defaults to False
      end

   clear_prepare
      do
      end

feature {}
   recursive: BOOLEAN

end -- class EDC_TYPED_VALUE
