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
class EDC_SQLITE_QUERY_BUILDER_CHARACTER_TOOLS

inherit
   EDC_SQLITE_QUERY_BUILDER_UNTYPED_TOOLS
      -- values:
   EDC_MANIFEST_VALUE_VISITOR[CHARACTER]
   EDC_PARAMETER_VISITOR[CHARACTER]
      -- expressions:
   EDC_EQUALS_EXPRESSION_VISITOR[CHARACTER]
   EDC_GE_EXPRESSION_VISITOR[CHARACTER]
   EDC_GT_EXPRESSION_VISITOR[CHARACTER]
   EDC_IN_EXPRESSION_VISITOR[CHARACTER]
   EDC_ISNULL_EXPRESSION_VISITOR[CHARACTER]
   EDC_LE_EXPRESSION_VISITOR[CHARACTER]
   EDC_LT_EXPRESSION_VISITOR[CHARACTER]

insert
   SINGLETON

create {EDC_SQLITE_QUERY_BUILDER_TOOLS}
   make

feature {EDC_MANIFEST_VALUE}
   visit_manifest_value (a_manifest_value: EDC_MANIFEST_VALUE[CHARACTER])
      do
         current_query.extend('%'')
         current_query.extend(a_manifest_value.item)
         current_query.extend('%'')
      end

feature {EDC_PARAMETER}
   visit_parameter (a_parameter: EDC_PARAMETER[CHARACTER])
      local
         r: REFERENCE[CHARACTER]
      do
         current_query.extend('?')
         create r.set_item(a_parameter.item)
         prepared_arguments.add_last(r)
      end

feature {EDC_EQUALS_EXPRESSION}
   visit_equals_expression (a_equals_expression: EDC_EQUALS_EXPRESSION[CHARACTER])
      do
         a_equals_expression.left.accept(Current)
         current_query.append(once " = ")
         a_equals_expression.right.accept(Current)
      end

feature {EDC_GE_EXPRESSION}
   visit_ge_expression (a_ge_expression: EDC_GE_EXPRESSION[CHARACTER])
      do
         a_ge_expression.left.accept(Current)
         current_query.append(once " >= ")
         a_ge_expression.right.accept(Current)
      end

feature {EDC_GT_EXPRESSION}
   visit_gt_expression (a_gt_expression: EDC_GT_EXPRESSION[CHARACTER])
      do
         a_gt_expression.left.accept(Current)
         current_query.append(once " > ")
         a_gt_expression.right.accept(Current)
      end

feature {EDC_IN_EXPRESSION}
   visit_in_expression (a_in_expression: EDC_IN_EXPRESSION[CHARACTER])
      do
         a_in_expression.left.accept(Current)
         current_query.append(once " in ")
         a_in_expression.right.accept(Current)
      end

feature {EDC_ISNULL_EXPRESSION}
   visit_isnull_expression (a_isnull_expression: EDC_ISNULL_EXPRESSION[CHARACTER])
      do
         a_isnull_expression.exp.accept(Current)
         current_query.append(once " is null")
      end

feature {EDC_LE_EXPRESSION}
   visit_le_expression (a_le_expression: EDC_LE_EXPRESSION[CHARACTER])
      do
         a_le_expression.left.accept(Current)
         current_query.append(once " <= ")
         a_le_expression.right.accept(Current)
      end

feature {EDC_LT_EXPRESSION}
   visit_lt_expression (a_lt_expression: EDC_LT_EXPRESSION[CHARACTER])
      do
         a_lt_expression.left.accept(Current)
         current_query.append(once " < ")
         a_lt_expression.right.accept(Current)
      end

end -- class EDC_SQLITE_QUERY_BUILDER_CHARACTER_TOOLS
