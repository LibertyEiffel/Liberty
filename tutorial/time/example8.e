class EXAMPLE8
   --
   -- Using BENCHMARK
   --

create {ANY}
   make

feature {}
   make
      local
         external_loop, internal_loop: BENCHMARK; i, j: INTEGER
      do
         create external_loop.make("external loop")
         create internal_loop.make("internal loop")
         from
            j := 1
            external_loop.start
         until
            j > 3000
         loop
            from
               i := j
               internal_loop.start
            until
               i < 0
            loop
               dummy
               internal_loop.next
               i := i - 1
            end
            internal_loop.break
            external_loop.next
            j := j + 1
         end

         external_loop.break
         internal_loop.print_now
         external_loop.print_now
         std_output.put_string("Total internal time: ")
         std_output.put_real(internal_loop.total_time)
         std_output.put_new_line
         std_output.put_string("Total external time: ")
         std_output.put_real(external_loop.total_time)
         std_output.put_new_line
      end

   dummy
      do
      end

end -- class EXAMPLE8
