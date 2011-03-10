expanded class AGGREGATOR[E_, R_]

   aggregate (items: ITERABLE[E_]; action: FUNCTION[TUPLE[E_, R_], R_]; initial: R_): R_ is
      local
         iterator: ITERATOR[E_]
      do
         Result := initial
         from
            iterator := items.iterator
         until
            iterator.is_off
         loop
            Result := action.item([iterator.item, Result])
            iterator.next
         end
      end

end
