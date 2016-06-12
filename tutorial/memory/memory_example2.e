class MEMORY_EXAMPLE2
   --
   -- Here is a little cookbook for people using very large computers.
   -- We suppose here that the goal is to minimize execution time (i.e.
   -- we suppose that in this case you have a _lot_ of available memory).
   --
   -- Note: it is usually interesting to compare the execution time of this
   -- example with/without the Liberty Eiffel garbage collector:
   --    compile -boost        example2
   --    compile -boost -no_gc example2
   --
   -- Hint: when the -no_gc flag is used, there is one C malloc for
   -- each object.
   --

insert
   MEMORY

create {ANY}
   main

feature {ANY}
   main
      local
         long_loop: INTEGER; foo: STRING
      do
         -- Here, we suppose that you have a _LOT_ of memory and our
         -- prediction is to push ceils at the maximum:
         set_high_memory_strategy
         from
            long_loop := 50000
            -- Please uncomment the following line to have more time
            -- to check memory consumption:
            -- long_loop := 10_000_000;
         until
            long_loop <= 0
         loop
            foo := ("bar").twin
            long_loop := long_loop - 1
         end

         io.put_string("Collector counter: ")
         io.put_integer(collector_counter)
         io.put_new_line
         io.put_string("Allocated bytes of memory: ")
         io.put_integer(allocated_bytes)
         io.put_new_line
      end

end -- class MEMORY_EXAMPLE2
