class MEMORY_EXAMPLE1
   --
   -- Here is a little cookbook for people using very small computers.
   -- We suppose here that the goal is to save memory.
   --
   -- Note: to see how many times the garbage collector is triggered,
   -- keep in mind that you can use the -gc_info flag as in:
   --
   --    compile -gc_info -boost example1
   --
   -- Also note that you can run this example under the debugger:
   --
   --    compile -gc_info -sedb -no_check example1
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
         -- Just enable the `low_memory_strategy' here at the beginning
         -- of the execution of your main:
         set_low_memory_strategy
         from
            long_loop := 50000
            -- Please uncomment the following line to have more time
            -- to check memory consumption:
            -- long_loop := 10_000_000;
         until
            long_loop <= 0
         loop
            -- Allocate both a fixed size object (of class STRING) and a
            -- resizable object (of class NATIVE_ARRAY[CHARACTER]):
            foo := ("bar").twin
            long_loop := long_loop - 1
         end

         sedb_breakpoint
         -- Press key G now !
         io.put_string("Collector counter: ")
         io.put_integer(collector_counter)
         io.put_new_line
         io.put_string("Allocated bytes of memory: ")
         io.put_integer(allocated_bytes)
         io.put_new_line
      end

end -- class MEMORY_EXAMPLE1
