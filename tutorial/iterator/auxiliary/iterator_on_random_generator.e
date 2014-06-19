class ITERATOR_ON_RANDOM_GENERATOR

inherit
   ITERATOR[INTEGER]

create {ANY}
   make

feature {ANY}
   count: INTEGER
      -- Of the sequence.

   item: INTEGER

   start
      do
         random_number_generator.with_seed(seed)
         random_number_generator.next
         left := count
         item := random_number_generator.last_integer(range)
      end

   next
      do
         random_number_generator.next
         left := left - 1
         item := random_number_generator.last_integer(range)
      end

   is_off: BOOLEAN
      do
         Result := left = 0
      end

feature {}
   seed: INTEGER 5555

   range: INTEGER 256

   left: INTEGER

   random_number_generator: MINIMAL_RANDOM_NUMBER_GENERATOR

   make (c: like count)
      require
         count >= 0
      do
         count := c
         create random_number_generator.with_seed(seed)
      end

feature {ANY} -- Check that the underlying traversable has not changed
   iterable_generation: INTEGER 0
   generation: INTEGER 0

end -- class ITERATOR_ON_RANDOM_GENERATOR
