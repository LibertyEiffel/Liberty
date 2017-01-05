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
class EDC_SQLITE_QUERY_BUILDER_TOOLS

inherit
   EDC_TYPEABLE_VISITOR
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

insert
   SINGLETON

create {EDC_SQLITE_CONNECTION}
   make

feature {}
   new_blob_visitor: ESE_TYPED_VISITOR[EDC_BLOB]
      do
         create {EDC_SQLITE_QUERY_BUILDER_BLOB_TOOLS} Result.make(Current)
      end

   new_character_visitor: ESE_TYPED_VISITOR[CHARACTER]
      do
         create {EDC_SQLITE_QUERY_BUILDER_CHARACTER_TOOLS} Result.make(Current)
      end

   new_integer_visitor: ESE_TYPED_VISITOR[INTEGER]
      do
         create {EDC_SQLITE_QUERY_BUILDER_INTEGER_TOOLS} Result.make(Current)
      end

   new_string_visitor: ESE_TYPED_VISITOR[STRING]
      do
         create {EDC_SQLITE_QUERY_BUILDER_STRING_TOOLS} Result.make(Current)
      end

   new_time_visitor: ESE_TYPED_VISITOR[TIME]
      do
         create {EDC_SQLITE_QUERY_BUILDER_TIME_TOOLS} Result.make(Current)
      end

feature {EDC_BLOB_COLUMN_VALUE}
   visit_blob_column_value (a_blob_column_value: EDC_BLOB_COLUMN_VALUE)
      do
         query_column(a_blob_column_value.column)
      end

feature {EDC_CHARACTER_COLUMN_VALUE}
   visit_character_column_value (a_character_column_value: EDC_CHARACTER_COLUMN_VALUE)
      do
         query_column(a_character_column_value.column)
      end

feature {EDC_INCREMENT_VALUE}
   visit_increment_value (a_increment_value: EDC_INCREMENT_VALUE)
      do
         not_yet_implemented
      end

feature {EDC_INTEGER_COLUMN_VALUE}
   visit_integer_column_value (a_integer_column_value: EDC_INTEGER_COLUMN_VALUE)
      do
         query_column(a_integer_column_value.column)
      end

feature {EDC_STRING_COLUMN_VALUE}
   visit_string_column_value (a_string_column_value: EDC_STRING_COLUMN_VALUE)
      do
         query_column(a_string_column_value.column)
      end

feature {EDC_TIME_COLUMN_VALUE}
   visit_time_column_value (a_time_column_value: EDC_TIME_COLUMN_VALUE)
      do
         query_column(a_time_column_value.column)
      end

feature {EDC_AND_EXPRESSION}
   visit_and_expression (a_and_expression: EDC_AND_EXPRESSION)
      do
         a_and_expression.left.accept(Current)
         current_query.append(once " and ")
         a_and_expression.right.accept(Current)
      end

feature {EDC_LIKE_EXPRESSION}
   visit_like_expression (a_like_expression: EDC_LIKE_EXPRESSION)
      do
         a_like_expression.left.accept(Current)
         current_query.append(once " like ")
         a_like_expression.right.accept(Current)
      end

feature {EDC_NOT_EXPRESSION}
   visit_not_expression (a_not_expression: EDC_NOT_EXPRESSION)
      do
         current_query.append(once "not ")
         a_not_expression.exp.accept(Current)
      end

feature {EDC_OR_EXPRESSION}
   visit_or_expression (a_or_expression: EDC_OR_EXPRESSION)
      do
         a_or_expression.left.accept(Current)
         current_query.append(once " or ")
         a_or_expression.right.accept(Current)
      end

feature {}
   make
      do
      end

end -- class EDC_SQLITE_QUERY_BUILDER_TOOLS
