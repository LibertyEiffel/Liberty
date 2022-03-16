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
deferred class EDC_COMPARABLE_COLUMN_VALUE[C_ -> COMPARABLE]

inherit
   EDC_COLUMN_VALUE[C_]
      redefine less_than, lt, infix "<", less_than_or_equal, le, infix "<=", greater_than, gt, infix ">", greater_than_or_equal,
         ge, infix ">="
      end

feature {ANY} -- Expressions
   less_than, lt, infix "<" (a_value: EDC_TYPED_VALUE[C_]): EDC_EXPRESSION
      do
         create {EDC_LT_EXPRESSION[C_]} Result.make(Current, a_value)
      end

   less_than_or_equal, le, infix "<=" (a_value: EDC_TYPED_VALUE[C_]): EDC_EXPRESSION
      do
         create {EDC_LE_EXPRESSION[C_]} Result.make(Current, a_value)
      end

   greater_than, gt, infix ">" (a_value: EDC_TYPED_VALUE[C_]): EDC_EXPRESSION
      do
         create {EDC_GT_EXPRESSION[C_]} Result.make(Current, a_value)
      end

   greater_than_or_equal, ge, infix ">=" (a_value: EDC_TYPED_VALUE[C_]): EDC_EXPRESSION
      do
         create {EDC_GE_EXPRESSION[C_]} Result.make(Current, a_value)
      end

end -- class EDC_COMPARABLE_COLUMN_VALUE
