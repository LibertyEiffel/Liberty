class EXAMPLE3

insert
   ARGUMENTS

create {ANY}
   main

feature {ANY}
   main
      local
         random_number_generator: RANDOM_NUMBER_GENERATOR; seed, count: INTEGER
      do
         if argument_count < 2 then
            io.put_string("Usage: ")
            io.put_string(argument(0))
            io.put_string(" <seed> <count> [minimal|press]%N")
            die_with_code(exit_failure_code)
         end
         seed := argument(1).to_integer
         count := argument(2).to_integer
         if argument_count > 2 then
            if argument(3).same_as("press") then
               create {PRESS_RANDOM_NUMBER_GENERATOR} random_number_generator.with_seed(seed)
               io.put_string("Using PRESS_RANDOM_NUMBER_GENERATOR.%N")
            else
               create {MINIMAL_RANDOM_NUMBER_GENERATOR} random_number_generator.with_seed(seed)
               io.put_string("Using MINIMAL_RANDOM_NUMBER_GENERATOR.%N")
            end
         else
            create {PRESS_RANDOM_NUMBER_GENERATOR} random_number_generator.with_seed(seed)
            io.put_string("Using default PRESS_RANDOM_NUMBER_GENERATOR.%N")
         end

         from
         until
            count = 0
         loop
            random_number_generator.next
            io.put_real(random_number_generator.last_real)
            count := count - 1
            io.put_string("%N")
         end
      end

end -- class EXAMPLE3
