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
class EDC_LOG_TABLE_LOGGER

inherit
   EDC_NOT_NULL_CONSTRAINT_VISITOR
   EDC_BLOB_COLUMN_VISITOR
   EDC_CHARACTER_COLUMN_VISITOR
   EDC_INCREMENT_COLUMN_VISITOR
   EDC_INTEGER_COLUMN_VISITOR
   EDC_STRING_COLUMN_VISITOR
   EDC_TIME_COLUMN_VISITOR
   EDC_PRIMARY_KEY_VISITOR

create {EDC_LOG_CONNECTION}
   make

feature {EDC_LOG_CONNECTION}
   log_create (a_table: EDC_TABLE)
      local
         i, j: INTEGER; column: EDC_COLUMN; index: EDC_INDEX
      do
         log.put_string(once "create table %"")
         log.put_string(a_table.name)
         log.put_string(once "%" (")
         from
            i := a_table.lower_column
         until
            i > a_table.upper_column
         loop
            if i > a_table.lower_column then
               log.put_string(once ", ")
            end
            column := a_table.item_column(i)
            log.put_character('%"')
            log.put_string(column.name)
            log.put_character('%"')
            column.accept(Current)
            from
               j := column.lower_constraint
            until
               j > column.upper_constraint
            loop
               column.item_constraints(j).accept(Current)
               j := j + 1
            end
            i := i + 1
         end
         from
            i := a_table.lower_index
         until
            i > a_table.upper_index
         loop
            log.put_string(once ", ")
            index := a_table.item_index(i)
            index.accept(Current)
            i := i + 1
         end
         log.put_string(once ")%N")
      end

   log_drop (a_table: EDC_TABLE)
      do
         log.put_string(once "drop table %"")
         log.put_string(a_table.name)
         log.put_string(once "%"%N")
      end

feature {EDC_NOT_NULL_CONSTRAINT}
   visit_not_null_constraint (a_not_null_constraint: EDC_NOT_NULL_CONSTRAINT)
      do
         log.put_string(once " not null")
      end

feature {EDC_BLOB_COLUMN}
   visit_blob_column (a_blob_column: EDC_BLOB_COLUMN)
      do
         log.put_string(once " BLOB")
      end

feature {EDC_CHARACTER_COLUMN}
   visit_character_column (a_character_column: EDC_CHARACTER_COLUMN)
      do
         log.put_string(once " CHAR")
      end

feature {EDC_INCREMENT_COLUMN}
   visit_increment_column (a_increment_column: EDC_INCREMENT_COLUMN)
      do
         log.put_string(once " INCREMENT")
      end

feature {EDC_INTEGER_COLUMN}
   visit_integer_column (a_integer_column: EDC_INTEGER_COLUMN)
      do
         log.put_string(once " INTEGER")
      end

feature {EDC_STRING_COLUMN}
   visit_string_column (a_string_column: EDC_STRING_COLUMN)
      do
         log.put_string(once " VARCHAR(")
         log.put_integer(a_string_column.size)
         log.put_character(')')
      end

feature {EDC_TIME_COLUMN}
   visit_time_column (a_time_column: EDC_TIME_COLUMN)
      do
         log.put_string(once " TIME")
      end

feature {EDC_PRIMARY_KEY}
   visit_primary_key (a_primary_key: EDC_PRIMARY_KEY)
      local
         i: INTEGER
      do
         log.put_string(once "primary key (")
         from
            i := a_primary_key.lower
         until
            i > a_primary_key.upper
         loop
            if i > a_primary_key.lower then
               log.put_string(once ", ")
            end
            log.put_character('%"')
            log.put_string(a_primary_key.item(i).name)
            log.put_character('%"')
            i := i + 1
         end
         log.put_character(')')
      end

feature {}
   make (a_log: like log)
      do
         log := a_log
      end

   log: OUTPUT_STREAM

end -- class EDC_LOG_TABLE_LOGGER
