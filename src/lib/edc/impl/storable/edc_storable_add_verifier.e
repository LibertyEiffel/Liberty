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
class EDC_STORABLE_ADD_VERIFIER

inherit
   EDC_PRIMARY_KEY_VISITOR

create {EDC_STORABLE_INDEX}
   make

feature {ESE_TYPED_VISITABLE, VISITOR}
   as_typed (item_type_generator: STRING): EDC_SQLITE_QUERY_BUILDER_TOOLS
      do
         check
            False
         end
      end

feature {EDC_STORABLE_INDEX}
   can_add (a_index: like index; a_table: like table; a_row: like row): BOOLEAN
      do
         index := a_index
         table := a_table
         row := a_row
         a_index.index.accept(Current)
         Result := res
      end

feature {EDC_PRIMARY_KEY}
   visit_primary_key (a_primary_key: EDC_PRIMARY_KEY)
      local
         i, c: INTEGER; col: EDC_COLUMN; over: BOOLEAN
      do
         -- make sure that the primary key is not already used
         from
            res := False
            i := a_primary_key.lower
         until
            over or else i > a_primary_key.upper
         loop
            col := a_primary_key.item(i)
            c := table.index_of_column(col)
            if row.valid_index(c) then
               res := res or else not has_value(col, row.item(c))
            else
               -- The whole primary key is not provided; cannot add
               res := False
               over := True
            end
            i := i + 1
         end
      end

feature {}
   has_value (a_column: EDC_COLUMN; a_value: EDC_DATUM): BOOLEAN
      local
         c, i: INTEGER
      do
         if index.has_column(a_column) then
            c := index.index_of_column(a_column)
            from
               i := index.lower
            until
               Result or else i > index.upper
            loop
               Result := a_column.same_values(index.item(i).item(c), a_value)
               i := i + 1
            end
         end
      end

feature {}
   index: EDC_STORABLE_INDEX

   table: EDC_STORABLE_TABLE

   row: FAST_ARRAY[EDC_DATUM]

   res: BOOLEAN

   make
      do
      end

end -- class EDC_STORABLE_ADD_VERIFIER
