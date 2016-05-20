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
class EDC_SQLITE_DATA_CONVERTER

inherit
   EDC_BLOB_COLUMN_VISITOR
   EDC_CHARACTER_COLUMN_VISITOR
   EDC_INCREMENT_COLUMN_VISITOR
   EDC_INTEGER_COLUMN_VISITOR
   EDC_STRING_COLUMN_VISITOR
   EDC_TIME_COLUMN_VISITOR

create {EDC_SQLITE_RESULT_SET}
   make

feature {ESE_TYPED_VISITABLE, VISITOR}
   as_typed (item_type_generator: STRING): EDC_SQLITE_QUERY_BUILDER_TOOLS
      do
         check
            False
         end
      end

feature {EDC_SQLITE_RESULT_SET}
   datum (a_column: EDC_COLUMN; a_result_set: like result_set; a_row_index: like row_index
      a_column_index: like column_index): EDC_DATUM
      do
         result_set := a_result_set
         row_index := a_row_index
         column_index := a_column_index
         a_column.accept(Current)
         Result := the_datum
      end

feature {EDC_BLOB_COLUMN}
   visit_blob_column (a_blob_column: EDC_BLOB_COLUMN)
      local
         d: STRING
      do
         d := result_set.item(row_index).string_item(column_index)
         the_datum := a_blob_column.as_datum(create {EDC_BLOB}.from_string(d))
      end

feature {EDC_CHARACTER_COLUMN}
   visit_character_column (a_character_column: EDC_CHARACTER_COLUMN)
      local
         d: INTEGER
      do
         d := result_set.item(row_index).integer_item(column_index)
         the_datum := a_character_column.as_datum(d.to_character)
      end

feature {EDC_INCREMENT_COLUMN}
   visit_increment_column (a_increment_column: EDC_INCREMENT_COLUMN)
      local
         d: INTEGER
      do
         d := result_set.item(row_index).integer_item(column_index)
         the_datum := a_increment_column.as_datum(d + 1)
      end

feature {EDC_INTEGER_COLUMN}
   visit_integer_column (a_integer_column: EDC_INTEGER_COLUMN)
      local
         d: INTEGER
      do
         d := result_set.item(row_index).integer_item(column_index)
         the_datum := a_integer_column.as_datum(d)
      end

feature {EDC_STRING_COLUMN}
   visit_string_column (a_string_column: EDC_STRING_COLUMN)
      local
         d: STRING
      do
         d := result_set.item(row_index).string_item(column_index)
         the_datum := a_string_column.as_datum(d)
      end

feature {EDC_TIME_COLUMN}
   visit_time_column (a_time_column: EDC_TIME_COLUMN)
      do
         not_yet_implemented
      end

feature {}
   result_set: SQLITE_RESULT_SET

   row_index: INTEGER

   column_index: INTEGER

   the_datum: EDC_DATUM

   make
      do
      end

end -- class EDC_SQLITE_DATA_CONVERTER
