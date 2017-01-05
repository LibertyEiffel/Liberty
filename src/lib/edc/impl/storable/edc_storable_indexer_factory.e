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
class EDC_STORABLE_INDEXER_FACTORY

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
   new_indexer (a_index: EDC_INDEX; a_table: like table): like res
      do
         table := a_table
         a_index.accept(Current)
         Result := res
      end

feature {EDC_PRIMARY_KEY}
   visit_primary_key (a_primary_key: EDC_PRIMARY_KEY)
      do
         create {EDC_STORABLE_PRIMARY_KEY_INDEXER} res.make(a_primary_key, table)
      end

feature {}
   table: EDC_STORABLE_TABLE

   res: EDC_STORABLE_INDEXER

   make
      do
      end

end -- class EDC_STORABLE_INDEXER_FACTORY
