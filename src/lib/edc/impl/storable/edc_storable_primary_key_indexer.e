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
class EDC_STORABLE_PRIMARY_KEY_INDEXER

inherit
   EDC_STORABLE_INDEXER

create {EDC_STORABLE_INDEXER_FACTORY}
   make

feature {EDC_STORABLE_INDEX}
   count: INTEGER
      do
         Result := rows.count
      end

   lower: INTEGER
      do
         Result := rows.lower
      end

   upper: INTEGER
      do
         Result := rows.upper
      end

   item (i: INTEGER): FAST_ARRAY[EDC_DATUM]
      do
         Result := rows.item(i).row
      end

   has (a_row: FAST_ARRAY[EDC_DATUM]): BOOLEAN
      do
         buffer.set_row(a_row)
         Result := rows.has(buffer)
      end

   index: EDC_PRIMARY_KEY

   can_add (a_row: FAST_ARRAY[EDC_DATUM]): BOOLEAN
      do
         -- make sure that the primary key is not already used
         Result := not has(a_row)
      end

   add (a_row: FAST_ARRAY[EDC_DATUM])
      do
         rows.add(create {EDC_STORABLE_PRIMARY_KEY}.make(index, a_row))
      end

   remove (a_row: FAST_ARRAY[EDC_DATUM])
      do
         buffer.set_row(a_row)
         rows.remove(buffer)
      end

feature {}
   make (a_primary_key: like index; a_table: like table)
      do
         index := a_primary_key
         table := a_table
         create buffer.make(index, Void)
         create rows.make
      end

   rows: HASHED_SET[EDC_STORABLE_PRIMARY_KEY]

   buffer: EDC_STORABLE_PRIMARY_KEY

end -- class EDC_STORABLE_PRIMARY_KEY_INDEXER
