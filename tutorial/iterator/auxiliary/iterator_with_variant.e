class ITERATOR_WITH_VARIANT[X]
   --
   -- Acts like a Facade in order to add a loop variant facility on any
   -- kinds of ITERATOR[X].
   --

inherit
   ITERATOR[X]

insert
   PLATFORM

create {ANY}
   make

feature {ANY}
   make (iterator: like basic_iterator)
      require
         iterator /= Void
      do
         basic_iterator := iterator
      ensure
         basic_iterator = iterator
      end

   variant_value: INTEGER

   item: X
      do
         Result := basic_iterator.item
      end

   start
      do
         basic_iterator.start
         variant_value := Maximum_integer
      end

   next
      do
         basic_iterator.next
         variant_value := variant_value - 1
      end

   is_off: BOOLEAN
      do
         Result := basic_iterator.is_off
      end

feature {ANY} -- Check that the underlying traversable has not changed
   iterable_generation: INTEGER
      do
         Result := basic_iterator.iterable_generation
      end

   generation: INTEGER
      do
         Result := basic_iterator.generation
      end

feature {}
   basic_iterator: ITERATOR[X]
      -- The true (fast) iterator.

end -- class ITERATOR_WITH_VARIANT
