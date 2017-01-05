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
class EDC_SQLITE_QUERY_BUILDER_CREATE_TABLE

inherit
   EDC_SQLITE_QUERY_BUILDER
   EDC_BLOB_COLUMN_VISITOR
   EDC_CHARACTER_COLUMN_VISITOR
   EDC_INCREMENT_COLUMN_VISITOR
   EDC_INTEGER_COLUMN_VISITOR
   EDC_STRING_COLUMN_VISITOR
   EDC_TIME_COLUMN_VISITOR
   EDC_TABLE_VISITOR
   EDC_PRIMARY_KEY_VISITOR
   EDC_NOT_NULL_CONSTRAINT_VISITOR

insert
   SINGLETON

create {EDC_SQLITE_CONNECTION}
   make

feature {}
   make (a_tools: like tools)
      require
         a_tools /= Void
      do
         tools := a_tools
      ensure
         tools = a_tools
      end

   state: INTEGER

   state_create_table_columns: INTEGER 0

   state_create_table_constraints: INTEGER 1

   state_create_index: INTEGER 2

feature {ESE_TYPED_VISITABLE, VISITOR}
   as_typed (item_type_generator: STRING): VISITOR
      do
         check
            no_untyped_visitor: False
         end
      end

feature {EDC_CONNECTION}
   query_for (a_table: EDC_TABLE): STRING
         -- Always returns the same STRING
      do
         Result := current_query
         current_query.clear_count
         a_table.accept(Current)
      end

feature {}
   append_column_constraints (a_column: EDC_COLUMN)
      local
         i: INTEGER
      do
         from
            i := a_column.lower_constraint
         until
            i > a_column.upper_constraint
         loop
            current_query.extend(' ')
            a_column.item_constraint(i).accept(Current)
            i := i + 1
         end
      end

feature {EDC_BLOB_COLUMN}
   visit_blob_column (a_blob_column: EDC_BLOB_COLUMN)
      do
         query_column_short(a_blob_column)
         current_query.append(once " BLOB")
         append_column_constraints(a_blob_column)
      end

feature {EDC_CHARACTER_COLUMN}
   visit_character_column (a_character_column: EDC_CHARACTER_COLUMN)
      do
         query_column_short(a_character_column)
         current_query.append(once " VARCHAR(1)")
         append_column_constraints(a_character_column)
      end

feature {EDC_INCREMENT_COLUMN}
   visit_increment_column (a_increment_column: EDC_INCREMENT_COLUMN)
      do
         query_column_short(a_increment_column)
         current_query.append(once " INTEGER")
         append_column_constraints(a_increment_column)
      end

feature {EDC_INTEGER_COLUMN}
   visit_integer_column (a_integer_column: EDC_INTEGER_COLUMN)
      do
         query_column_short(a_integer_column)
         current_query.append(once " INTEGER")
         append_column_constraints(a_integer_column)
      end

feature {EDC_STRING_COLUMN}
   visit_string_column (a_string_column: EDC_STRING_COLUMN)
      do
         query_column_short(a_string_column)
         current_query.append(once " TEXT")
         append_column_constraints(a_string_column)
      end

feature {EDC_TIME_COLUMN}
   visit_time_column (a_time_column: EDC_TIME_COLUMN)
      do
         query_column_short(a_time_column)
         current_query.append(once " TIMESTAMP")
         append_column_constraints(a_time_column)
      end

feature {EDC_TABLE}
   visit_table (a_table: EDC_TABLE)
      local
         i: INTEGER
      do
         state := state_create_table_columns
         current_query.append(once "CREATE TABLE ")
         query_table(a_table)
         current_query.append(once " (")
         from
            i := a_table.lower_column
         until
            i > a_table.upper_column
         loop
            if i > a_table.lower_column then
               current_query.append(once ", ")
            end
            a_table.item_column(i).accept(Current)
            i := i + 1
         end
         state := state_create_table_constraints
         from
            i := a_table.lower_index
         until
            i > a_table.upper_index
         loop
            current_query.append(once ", ")
            a_table.item_index(i).accept(Current)
            i := i + 1
         end
         current_query.append(once ");")
         state := state_create_index
         from
            i := a_table.lower_index
         until
            i > a_table.upper_index
         loop
            a_table.item_index(i).accept(Current)
            i := i + 1
         end
      end

feature {EDC_PRIMARY_KEY}
   visit_primary_key (a_primary_key: EDC_PRIMARY_KEY)
      local
         i: INTEGER
      do
         if state = state_create_table_constraints then
            current_query.append(once "PRIMARY KEY (")
            from
               i := a_primary_key.lower
            until
               i > a_primary_key.upper
            loop
               if i > a_primary_key.lower then
                  current_query.append(once ", ")
               end
               query_column_short(a_primary_key.item(i))
               i := i + 1
            end
            current_query.extend(')')
         end
      end

feature {EDC_NOT_NULL_CONSTRAINT}
   visit_not_null_constraint (a_not_null_constraint: EDC_NOT_NULL_CONSTRAINT)
      do
         current_query.append(once " NOT NULL")
      end

end -- class EDC_SQLITE_QUERY_BUILDER_CREATE_TABLE
