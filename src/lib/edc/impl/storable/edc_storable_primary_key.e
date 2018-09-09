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
class EDC_STORABLE_PRIMARY_KEY

insert
   HASHABLE

create {EDC_STORABLE_PRIMARY_KEY_INDEXER}
   make

feature {ANY}
   hash_code: INTEGER

   is_equal (other: like Current): BOOLEAN
      do
         Result := index = other.index and then index.table.same_rows(row, other.row)
      end

feature {EDC_STORABLE_PRIMARY_KEY_INDEXER}
   set_row (a_row: like row)
      require
         a_row /= Void
      do
         row := a_row
         set_hash_code
      end

feature {}
   make (a_index: like index; a_row: like row)
      do
         index := a_index
         row := a_row
         if row /= Void then
            set_hash_code
         end
      end

   set_hash_code
      local
         i, x: INTEGER; col: EDC_COLUMN
      do
         hash_code := 0
         from
            i := index.lower
         until
            i > index.upper
         loop
            col := index.item(i)
            x := index.table.index_of_column(col)
            hash_code := hash_code #* 8 #+ col.hash_code(row.item(x))
            i := i + 1
         end
         -- be sure the hash_code is positive
         hash_code := hash_code & 0x7FFFFFFF
      end

feature {EDC_STORABLE_PRIMARY_KEY, EDC_STORABLE_PRIMARY_KEY_INDEXER}
   index: EDC_PRIMARY_KEY

   row: FAST_ARRAY[EDC_DATUM]

end -- class EDC_STORABLE_PRIMARY_KEY
