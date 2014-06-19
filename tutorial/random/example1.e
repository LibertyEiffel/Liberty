class EXAMPLE1

create {ANY}
   main

feature {}
   main
      local
         count, range, column: INTEGER
      do
         io.put_string("Using the MINIMAL_RANDOM_NUMBER_GENERATOR random number generator.%NHow many numbers? ")
         io.read_integer
         count := io.last_integer
         io.put_string("Range ( > 1)     ? ")
         io.read_integer
         range := io.last_integer
         from
         until
            count = 0
         loop
            random_number_generator.next
            io.put_integer(random_number_generator.last_integer(range))
            count := count - 1
            if column = 6 then
               io.put_string("%N")
               column := 0
            else
               column := column + 1
               io.put_string("%T")
            end
         end

         io.put_string("%N")
      end

feature {}
   random_number_generator: RANDOM_NUMBER_GENERATOR
         -- Note: this is a once function in order to use always the same RANDOM_NUMBER_GENERATOR.
      once
         create {MINIMAL_RANDOM_NUMBER_GENERATOR} Result.make
      end

end -- class EXAMPLE1
