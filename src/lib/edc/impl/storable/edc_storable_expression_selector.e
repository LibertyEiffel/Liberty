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
class EDC_STORABLE_EXPRESSION_SELECTOR

create {EDC_STORABLE_SELECTOR}
   make

feature {EDC_STORABLE_SELECTOR}
   clear
      do
         columns.clear_count
         data.clear_count
      end

   add (a_column: EDC_COLUMN)
      do
         columns.add_last(a_column)
      end

   call (a_connection: EDC_STORABLE_CONNECTION; a_where_clause: EDC_EXPRESSION): EDC_STORABLE_RESULT_SET
      do
         find_index(a_connection)
         create res.make(a_connection, columns.twin)
         join.clear_count
         join.resize(columns.count)
         match_rows(data.lower, 0, a_where_clause)
         Result := res
      end

feature {}
   find_index (a_connection: EDC_STORABLE_CONNECTION)
         -- Try to use indexes (to avoid a full scan) if some are defined.
      local
         i, j: INTEGER; a_data: EDC_STORABLE_DATA; index: EDC_STORABLE_INDEX; table: EDC_STORABLE_TABLE
         column: EDC_COLUMN; ccs: COMPARATOR_COLLECTION_SORTER[EDC_STORABLE_DATA]
      do
         ccs.set_comparator(data_comparator)
         from
            i := columns.lower
         until
            i > columns.upper
         loop
            column := columns.item(i)
            table := a_connection.xml_table(column.table.name)
            a_data := table
            from
               j := table.index_lower
            until
               j > table.index_upper
            loop
               index := table.index_item(j)
               if index.index.has(column) and then index.count < a_data.count then
                  a_data := index
               end
               j := j + 1
            end
            if not data.fast_has(a_data) then
               ccs.add(data, a_data)
            end
            i := i + 1
         end
      end

   match_rows (data_index, fill: INTEGER; a_where_clause: EDC_EXPRESSION)
         -- The core algorithm (recursive)
      require
         data_index.in_range(data.lower, data.upper + 1)
         fill.in_range(0, columns.count)
         fill = join_count
      local
         i, c: INTEGER; found: BOOLEAN; a_data: EDC_STORABLE_DATA; col: EDC_COLUMN; vals: TRAVERSABLE[EDC_DATUM]
      do
         if fill = data.count then
            if a_where_clause = Void or else a_where_clause.matches(columns, join) then
               check
                  not res.has(join)
               end
               res.add(join.twin)
            end
         elseif data.valid_index(data_index) then
            a_data := data.item(data_index)
            from
               c := columns.lower
            until
               c > columns.upper
            loop
               if join.item(c) = Void then
                  col := columns.item(c)
                  if a_data.has_column(col) then
                     if a_where_clause = Void or else a_where_clause.can_match(col) then
                        vals := a_data.traversable(col)
                        from
                           i := vals.lower
                        until
                           i > vals.upper
                        loop
                           join.put(vals.item(i), c)
                           found := True
                           match_rows(data_index, fill + 1, a_where_clause)
                           i := i + 1
                        end
                        join.put(Void, c)
                     end
                  end
               end
               if not found then
                  -- Try searching using a fuller scan
                  match_rows(data_index + 1, fill, a_where_clause)
               end
               c := c + 1
            end
         end
      end

feature {}
   data_comparator: PREDICATE[TUPLE[EDC_STORABLE_DATA, EDC_STORABLE_DATA]]
      once
         Result := agent data_compare
      end

   data_compare (d1, d2: EDC_STORABLE_DATA): BOOLEAN
      do
         Result := d1.count > d2.count
      end

feature {}
   columns: FAST_ARRAY[EDC_COLUMN]

   data: FAST_ARRAY[EDC_STORABLE_DATA]

   join: FAST_ARRAY[EDC_DATUM]

   res: EDC_STORABLE_RESULT_SET

   make
      do
         create columns.make(0)
         create data.make(0)
         create join.make(0)
      end

   join_count: INTEGER
      local
         i: INTEGER
      do
         from
            i := join.lower
         until
            i > join.upper
         loop
            if join.item(i) /= Void then
               Result := Result + 1
            end
            i := i + 1
         end
      end

end -- class EDC_STORABLE_EXPRESSION_SELECTOR
