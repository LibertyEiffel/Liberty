deferred class COROUTINE[O_ -> TUPLE, Y_]

feature {ANY}
   item (o: O_): ITERATOR[Y_]
      local
         i: ANY_COROUTINE_ITERATOR
      do
         create iterator.make(Current, o)
         i := iterator
         i.fix_dumb_cecil
         Result := iterator
      end

feature {COROUTINE_ITERATOR}
   invoke (arguments: O_)
         -- Define this routine, and call `yield' each time a value should be sent back to the caller.
      deferred
      end

   set_iterator (a_iterator: like iterator)
      do
         iterator := a_iterator
      ensure
         iterator = a_iterator
      end

feature {}
   iterator: COROUTINE_ITERATOR[O_, Y_]

   frozen yield (value: Y_)
      local
         i: like iterator
      do
         i := iterator
         iterator := Void
         i.set_item(value)
         i.yield
      end

end
