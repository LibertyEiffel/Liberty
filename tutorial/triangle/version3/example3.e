class EXAMPLE3
   -- Let's start to copy and to compare objects... you may also run
   -- this example step-by-step using the Liberty Eiffel Debugger (-sedb).

create {ANY}
   main

feature {ANY}
   main
      local
         x, y, z: POINT
      do
         create x.make(1.0, 2.0)
         create y.make(1.0, 2.0)
         create z.make(3.0, 4.0)
         if x = y then
            io.put_string("x = y%N")
         end

         if x /= y then
            io.put_string("x /= y%N")
         end

         if x.is_equal(y) then
            io.put_string("x.is_equal(y)%N")
         end

         if y.is_equal(z) then
            io.put_string("x.is_equal(y)%N")
         end

         y := x
         if x = y then
            io.put_string("x = y%N")
         end

         if x.is_equal(y) then
            io.put_string("x.is_equal(y)%N")
         end

         io.put_string("To get a clone of x:%N")
         y := x.twin
         if x /= y and then x.is_equal(y) then
            io.put_string("x /= y and then x.is_equal(y)%N")
         end

         sedb_breakpoint
      end

end -- class EXAMPLE3
