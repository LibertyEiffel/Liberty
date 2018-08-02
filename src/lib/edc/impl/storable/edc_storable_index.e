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
class EDC_STORABLE_INDEX

inherit
   EDC_STORABLE_DATA

create {EDC_STORABLE_TABLE}
   make

feature {ANY}
   count: INTEGER
      do
         Result := indexer.count
      end

   lower: INTEGER
      do
         Result := indexer.lower
      end

   upper: INTEGER
      do
         Result := indexer.upper
      end

   item (i: INTEGER): FAST_ARRAY[EDC_DATUM]
      do
         Result := indexer.item(i)
      end

   has (a_row: FAST_ARRAY[EDC_DATUM]): BOOLEAN
      do
         Result := indexer.has(a_row)
      end

feature {ANY}
   index: EDC_INDEX
      do
         Result := indexer.index
      end

   has_column (a_column: EDC_COLUMN): BOOLEAN
      do
         Result := index.has(a_column)
      end

   index_of_column (a_column: EDC_COLUMN): INTEGER
      do
         Result := index.index_of(a_column)
      end

feature {EDC_STORABLE_TABLE}
   can_add (a_row: FAST_ARRAY[EDC_DATUM]): BOOLEAN
      do
         Result := indexer.can_add(a_row)
      end

   add (a_row: FAST_ARRAY[EDC_DATUM])
      require
         can_add(a_row)
      do
         indexer.add(a_row)
      ensure
         has(a_row)
      end

   remove (a_row: FAST_ARRAY[EDC_DATUM])
      require
         has(a_row)
      do
         indexer.remove(a_row)
      end

feature {}
   make (a_index: like index; a_table: EDC_STORABLE_TABLE)
      require
         a_index /= Void
         a_table /= Void
      do
         indexer := factory.new_indexer(a_index, a_table)
      ensure
         a_index = a_index
         indexer.table = a_table
      end

   add_verifier: EDC_STORABLE_ADD_VERIFIER
      once
         create Result.make
      end

   indexer: EDC_STORABLE_INDEXER

   factory: EDC_STORABLE_INDEXER_FACTORY
      once
         create Result.make
      end

invariant
   indexer /= Void

end -- class EDC_STORABLE_INDEX
