expanded class AGGREGATOR[E_, R_]

feature {ANY}
   map, map_iter (items: ITERABLE[E_]; action: FUNCTION[TUPLE[E_, R_], R_]; initial: R_): R_ is
      local
         iterator: ITERATOR[E_]
      do
         Result := initial
         from
            iterator := items.new_iterator
         until
            iterator.is_off
         loop
            Result := action.item([iterator.item, Result])
            iterator.next
         end
      end

   map_index (items: INDEXABLE[E_]; action: FUNCTION[TUPLE[E_, R_], R_]; initial: R_): R_ is
      local
         i: INTEGER
      do
         Result := initial
         from
            i := items.lower
         until
            i > items.upper
         loop
            Result := action.item([items.item(i), Result])
            i := i + 1
         end
      end

end
