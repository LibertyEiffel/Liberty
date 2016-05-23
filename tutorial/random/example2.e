class EXAMPLE2

create {ANY}
   main

feature {}
   main
      local
         count: INTEGER
      do
         io.put_string("Using the PRESS_RANDOM_NUMBER_GENERATOR random number generator.%NHow many numbers? ")
         io.read_integer
         count := io.last_integer
         from
         until
            count = 0
         loop
            random_generator.next
            io.put_real(random_generator.last_real)
            count := count - 1
            io.put_string("%N")
         end
      end

feature {}
   random_generator: RANDOM_NUMBER_GENERATOR
      once
         create {PRESS_RANDOM_NUMBER_GENERATOR} Result.make
      end

end -- class EXAMPLE2
