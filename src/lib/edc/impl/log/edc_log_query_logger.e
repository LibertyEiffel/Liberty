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
class EDC_LOG_QUERY_LOGGER

inherit
   EDC_BLOB_COLUMN_VISITOR
   EDC_CHARACTER_COLUMN_VISITOR
   EDC_INTEGER_COLUMN_VISITOR
   EDC_STRING_COLUMN_VISITOR
   EDC_TIME_COLUMN_VISITOR
   EDC_SELECT_VISITOR
   EDC_UPDATE_VISITOR
   EDC_DELETE_VISITOR

create {EDC_LOG_CONNECTION}
   make

feature {EDC_LOG_CONNECTION}
   log_selectable (a_select: EDC_SELECTABLE)
      do
         a_select.accept(Current)
      end

   log_insert (a_columns: FAST_ARRAY[EDC_COLUMN]; a_values: FAST_ARRAY[EDC_VALUE])
      require
         a_columns.count = a_values.count
      local
         i: INTEGER
      do
         log.put_string(once "insert into %"")
         log.put_string(a_columns.first.table.name)
         log.put_string(once "%" (")
         from
            i := a_columns.lower
         until
            i > a_columns.upper
         loop
            if i > a_columns.lower then
               log.put_string(once ", ")
            end
            log.put_character('%"')
            log.put_string(a_columns.item(i).name)
            log.put_character('%"')
            i := i + 1
         end
         log.put_string(once ") values (")
         from
            i := a_values.lower
         until
            i > a_values.upper
         loop
            if i > a_values.lower then
               log.put_string(once ", ")
            end
            value := a_values.item(i)
            a_columns.item(i).accept(Current)
            i := i + 1
         end
         log.put_string(once ")%N")
      end

feature {}
   value: EDC_VALUE
         -- used when visiting a column to print the good value type

feature {EDC_BLOB_COLUMN}
   visit_blob_column (a_blob_column: EDC_BLOB_COLUMN)
      do
         log.put_string(once "<blob>")
      end

feature {EDC_CHARACTER_COLUMN}
   visit_character_column (a_character_column: EDC_CHARACTER_COLUMN)
      local
         l: EDC_LOG_QUERY_TYPED_VALUE_LOGGER[CHARACTER]
      do
         l ::= value_loggers.reference_at(once "char")
         if l = Void then
            create l.make(agent_put_char)
            value_loggers.put(l, once "char")
         end
         value.accept(l)
      end

feature {}
   put_char (a_char: CHARACTER)
      do
         log.put_character('%'')
         if a_char = '%'' then
            log.put_character('%'')
            log.put_character('%'')
         else
            log.put_character(a_char)
         end
         log.put_character('%'')
      end

   agent_put_char: PROCEDURE[TUPLE[CHARACTER]]
      once
         Result := agent put_char
      end

feature {EDC_INTEGER_COLUMN}
   visit_integer_column (a_integer_column: EDC_INTEGER_COLUMN)
      local
         l: EDC_LOG_QUERY_TYPED_VALUE_LOGGER[INTEGER_32]
      do
         l ::= value_loggers.reference_at(once "integer")
         if l = Void then
            create l.make(agent_put_integer)
            value_loggers.put(l, once "integer")
         end
         value.accept(l)
      end

feature {}
   put_integer (a_integer: INTEGER_32)
      do
         log.put_integer(a_integer)
      end

   agent_put_integer: PROCEDURE[TUPLE[INTEGER_32]]
      once
         Result := agent put_integer
      end

feature {EDC_STRING_COLUMN}
   visit_string_column (a_string_column: EDC_STRING_COLUMN)
      local
         l: EDC_LOG_QUERY_TYPED_VALUE_LOGGER[STRING]
      do
         l ::= value_loggers.reference_at(once "string")
         if l = Void then
            create l.make(agent_put_string)
            value_loggers.put(l, once "string")
         end
         value.accept(l)
      end

feature {}
   put_string (a_string: STRING)
      local
         i: INTEGER; c: CHARACTER
      do
         log.put_character('%'')
         from
            i := a_string.lower
         until
            i > a_string.upper
         loop
            c := a_string.item(i)
            if c = '%'' then
               log.put_character('%'')
               log.put_character('%'')
            else
               log.put_character(c)
            end
            i := i + 1
         end
         log.put_character('%'')
      end

   agent_put_string: PROCEDURE[TUPLE[STRING]]
      once
         Result := agent put_string
      end

feature {EDC_TIME_COLUMN}
   visit_time_column (a_time_column: EDC_TIME_COLUMN)
      do
         --|*** TODO
      end

feature {EDC_SELECT}
   visit_select (a_select: EDC_SELECT)
      local
         i: INTEGER; t: EDC_TABLE; c: EDC_COLUMN
      do
         log.put_string(once "select ")
         tables.clear_count
         from
            i := a_select.lower
         until
            i > a_select.upper
         loop
            if i > a_select.lower then
               log.put_string(once ", ")
            end
            c := a_select.item(i)
            t := c.table
            tables.add(t.name)
            log.put_character('"')
            log.put_string(c.name)
            log.put_character('"')
            i := i + 1
         end
         if tables.count > 0 then
            log.put_string(once " from ")
            from
               i := tables.lower
            until
               i > tables.upper
            loop
               if i > tables.lower then
                  log.put_string(once ", ")
               end
               log.put_character('"')
               log.put_string(tables.item(i))
               log.put_character('"')
               i := i + 1
            end
         end
         if a_select.where_clause /= Void then
            log.put_string(once " where ...")
         end
         log.put_new_line
      end

feature {EDC_UPDATE}
   visit_update (a_update: EDC_UPDATE)
      do
      end

feature {EDC_DELETE}
   visit_delete (a_detete: EDC_DELETE)
      do
      end

feature {}
   make (a_log: like log)
      do
         log := a_log
         create value_loggers.make
      end

   log: OUTPUT_STREAM

   value_loggers: HASHED_DICTIONARY[EDC_LOG_QUERY_VALUE_LOGGER, STRING]

   tables: SET[STRING]
      once
         create {HASHED_SET[STRING]} Result.make
      end

end -- class EDC_LOG_QUERY_LOGGER
