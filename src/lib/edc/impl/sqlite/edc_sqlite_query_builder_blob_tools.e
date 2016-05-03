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
class EDC_SQLITE_QUERY_BUILDER_BLOB_TOOLS

inherit
   EDC_SQLITE_QUERY_BUILDER_UNTYPED_TOOLS
      -- values:
   EDC_MANIFEST_VALUE_VISITOR[EDC_BLOB]
   EDC_PARAMETER_VISITOR[EDC_BLOB]
      -- expressions:
   EDC_EQUALS_EXPRESSION_VISITOR[EDC_BLOB]
   EDC_IN_EXPRESSION_VISITOR[EDC_BLOB]
   EDC_ISNULL_EXPRESSION_VISITOR[EDC_BLOB]

insert
   SINGLETON

create {EDC_SQLITE_QUERY_BUILDER_TOOLS}
   make

feature {EDC_MANIFEST_VALUE}
   visit_manifest_value (a_manifest_value: EDC_MANIFEST_VALUE[EDC_BLOB])
      do
         not_yet_implemented
      end

feature {EDC_PARAMETER}
   visit_parameter (a_parameter: EDC_PARAMETER[EDC_BLOB])
      do
         current_query.extend('?')
         prepared_arguments.add_last(a_parameter.item.to_string)
      end

feature {EDC_EQUALS_EXPRESSION}
   visit_equals_expression (a_equals_expression: EDC_EQUALS_EXPRESSION[EDC_BLOB])
      do
         a_equals_expression.left.accept(Current)
         current_query.append(once " = ")
         a_equals_expression.right.accept(Current)
      end

feature {EDC_IN_EXPRESSION}
   visit_in_expression (a_in_expression: EDC_IN_EXPRESSION[EDC_BLOB])
      do
         a_in_expression.left.accept(Current)
         current_query.append(once " in ")
         a_in_expression.right.accept(Current)
      end

feature {EDC_ISNULL_EXPRESSION}
   visit_isnull_expression (a_isnull_expression: EDC_ISNULL_EXPRESSION[EDC_BLOB])
      do
         a_isnull_expression.exp.accept(Current)
         current_query.append(once " is null")
      end

end -- class EDC_SQLITE_QUERY_BUILDER_BLOB_TOOLS
