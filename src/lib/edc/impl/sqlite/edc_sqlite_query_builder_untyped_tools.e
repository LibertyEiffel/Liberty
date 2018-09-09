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
deferred class EDC_SQLITE_QUERY_BUILDER_UNTYPED_TOOLS

inherit
   EDC_SQLITE_QUERY_BUILDER
      -- values:
   EDC_BLOB_COLUMN_VALUE_VISITOR
   EDC_CHARACTER_COLUMN_VALUE_VISITOR
   EDC_INCREMENT_VALUE_VISITOR
   EDC_INTEGER_COLUMN_VALUE_VISITOR
   EDC_STRING_COLUMN_VALUE_VISITOR
   EDC_TIME_COLUMN_VALUE_VISITOR
      -- expressions:
   EDC_AND_EXPRESSION_VISITOR
   EDC_LIKE_EXPRESSION_VISITOR
   EDC_NOT_EXPRESSION_VISITOR
   EDC_OR_EXPRESSION_VISITOR

feature {}
   make (a_untyped: like untyped)
      require
         a_untyped /= Void
      do
         untyped := a_untyped
      ensure
         untyped = a_untyped
      end

   untyped: EDC_SQLITE_QUERY_BUILDER_TOOLS

feature {EDC_BLOB_COLUMN_VALUE}
   visit_blob_column_value (a_string_column_value: EDC_BLOB_COLUMN_VALUE)
      do
         a_string_column_value.accept(untyped)
      end

feature {EDC_CHARACTER_COLUMN_VALUE}
   visit_character_column_value (a_character_column_value: EDC_CHARACTER_COLUMN_VALUE)
      do
         a_character_column_value.accept(untyped)
      end

feature {EDC_INCREMENT_VALUE}
   visit_increment_value (a_increment_value: EDC_INCREMENT_VALUE)
      do
         a_increment_value.accept(untyped)
      end

feature {EDC_INTEGER_COLUMN_VALUE}
   visit_integer_column_value (a_integer_column_value: EDC_INTEGER_COLUMN_VALUE)
      do
         a_integer_column_value.accept(untyped)
      end

feature {EDC_STRING_COLUMN_VALUE}
   visit_string_column_value (a_string_column_value: EDC_STRING_COLUMN_VALUE)
      do
         a_string_column_value.accept(untyped)
      end

feature {EDC_TIME_COLUMN_VALUE}
   visit_time_column_value (a_time_column_value: EDC_TIME_COLUMN_VALUE)
      do
         a_time_column_value.accept(untyped)
      end

feature {EDC_AND_EXPRESSION}
   visit_and_expression (a_and_expression: EDC_AND_EXPRESSION)
      do
         a_and_expression.accept(untyped)
      end

feature {EDC_LIKE_EXPRESSION}
   visit_like_expression (a_like_expression: EDC_LIKE_EXPRESSION)
      do
         a_like_expression.accept(untyped)
      end

feature {EDC_NOT_EXPRESSION}
   visit_not_expression (a_not_expression: EDC_NOT_EXPRESSION)
      do
         a_not_expression.accept(untyped)
      end

feature {EDC_OR_EXPRESSION}
   visit_or_expression (a_or_expression: EDC_OR_EXPRESSION)
      do
         a_or_expression.accept(untyped)
      end

end -- class EDC_SQLITE_QUERY_BUILDER_UNTYPED_TOOLS
