class ITERATOR_ON_RANDOM_GENERATOR

inherit
   ITERATOR[INTEGER]

create {ANY}
   make

feature {ANY}
   count: INTEGER
      -- Of the sequence.

   item: INTEGER

   start is
      do
         random_number_generator.with_seed(seed)
         random_number_generator.next
         left := count
         item := random_number_generator.last_integer(range)
      end

   next is
      do
         random_number_generator.next
         left := left - 1
         item := random_number_generator.last_integer(range)
      end

   is_off: BOOLEAN is
      do
         Result := left = 0
      end

feature {}
   seed: INTEGER is 5555

   range: INTEGER is 256

   left: INTEGER

   random_number_generator: MINIMAL_RANDOM_NUMBER_GENERATOR

   make (c: like count) is
      require
         count >= 0
      do
         count := c
         create random_number_generator.with_seed(seed)
      end

end -- class ITERATOR_ON_RANDOM_GENERATOR
