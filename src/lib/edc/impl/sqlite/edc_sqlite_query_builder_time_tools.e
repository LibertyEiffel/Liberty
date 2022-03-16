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
class EDC_SQLITE_QUERY_BUILDER_TIME_TOOLS

inherit
   EDC_SQLITE_QUERY_BUILDER_UNTYPED_TOOLS
      -- values:
   EDC_MANIFEST_VALUE_VISITOR[TIME]
   EDC_PARAMETER_VISITOR[TIME]
      -- expressions:
   EDC_EQUALS_EXPRESSION_VISITOR[TIME]
   EDC_GE_EXPRESSION_VISITOR[TIME]
   EDC_GT_EXPRESSION_VISITOR[TIME]
   EDC_IN_EXPRESSION_VISITOR[TIME]
   EDC_ISNULL_EXPRESSION_VISITOR[TIME]
   EDC_LE_EXPRESSION_VISITOR[TIME]
   EDC_LT_EXPRESSION_VISITOR[TIME]

insert
   SINGLETON

create {EDC_SQLITE_QUERY_BUILDER_TOOLS}
   make

feature {EDC_MANIFEST_VALUE}
   visit_manifest_value (a_manifest_value: EDC_MANIFEST_VALUE[TIME])
      do
         not_yet_implemented
      end

feature {EDC_PARAMETER}
   visit_parameter (a_parameter: EDC_PARAMETER[TIME])
      local
         r: REFERENCE[TIME]
      do
         current_query.extend('?')
         create r.set_item(a_parameter.item)
         prepared_arguments.add_last(r)
      end

feature {EDC_EQUALS_EXPRESSION}
   visit_equals_expression (a_equals_expression: EDC_EQUALS_EXPRESSION[TIME])
      do
         not_yet_implemented
      end

feature {EDC_GE_EXPRESSION}
   visit_ge_expression (a_ge_expression: EDC_GE_EXPRESSION[TIME])
      do
         not_yet_implemented
      end

feature {EDC_GT_EXPRESSION}
   visit_gt_expression (a_gt_expression: EDC_GT_EXPRESSION[TIME])
      do
         not_yet_implemented
      end

feature {EDC_IN_EXPRESSION}
   visit_in_expression (a_in_expression: EDC_IN_EXPRESSION[TIME])
      do
         not_yet_implemented
      end

feature {EDC_ISNULL_EXPRESSION}
   visit_isnull_expression (a_isnull_expression: EDC_ISNULL_EXPRESSION[TIME])
      do
         not_yet_implemented
      end

feature {EDC_LE_EXPRESSION}
   visit_le_expression (a_le_expression: EDC_LE_EXPRESSION[TIME])
      do
         not_yet_implemented
      end

feature {EDC_LT_EXPRESSION}
   visit_lt_expression (a_lt_expression: EDC_LT_EXPRESSION[TIME])
      do
         not_yet_implemented
      end

end -- class EDC_SQLITE_QUERY_BUILDER_TIME_TOOLS
