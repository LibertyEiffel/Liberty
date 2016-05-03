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
class EDC_PRIMARY_KEY

inherit
   EDC_INDEX

create {ANY}
   make, manifest_creation

feature {ANY}
   accept (a_visitor: VISITOR)
      local
         v: EDC_PRIMARY_KEY_VISITOR
      do
         v ::= a_visitor
         v.visit_primary_key(Current)
      end

feature {ANY}
   can_add_to (a_table: like table): BOOLEAN
      local
         i: INTEGER
      do
         -- check that there is no other primary key
         from
            Result := True
            i := a_table.lower_index
         until
            not Result or else i > a_table.upper_index
         loop
            Result := not ({EDC_PRIMARY_KEY} ?:= a_table.item_index(i))
            i := i + 1
         end
         -- check that all the columns belong to that table
         from
            i := columns.lower
         until
            i > columns.upper
         loop
            Result := columns.item(i).table = a_table
            i := i + 1
         end
      end

   has (a_column: EDC_COLUMN): BOOLEAN
      do
         Result := columns.has(a_column)
      end

   index_of (a_column: EDC_COLUMN): INTEGER
      do
         Result := columns.first_index_of(a_column)
      end

   count: INTEGER
      do
         Result := columns.count
      end

   lower: INTEGER
      do
         Result := columns.lower
      end

   upper: INTEGER
      do
         Result := columns.upper
      end

   item (i: INTEGER): EDC_COLUMN
      do
         Result := columns.item(i)
      end

feature {}
   make (a_columns: TRAVERSABLE[EDC_COLUMN])
      local
         i: INTEGER
      do
         from
            create columns.with_capacity(a_columns.count)
            i := a_columns.lower
         until
            i > a_columns.upper
         loop
            columns.add_last(a_columns.item(i))
            i := i + 1
         end
      end

   columns: FAST_ARRAY[EDC_COLUMN]

feature {} -- Implement manifest generic creation (very low-level):
   manifest_semicolon_check: BOOLEAN False

   manifest_make (needed_capacity: INTEGER)
      do
         create columns.make(needed_capacity)
      end

   manifest_put (index: INTEGER; element: EDC_COLUMN)
      do
         columns.put(element, index)
      end

end -- class EDC_PRIMARY_KEY
