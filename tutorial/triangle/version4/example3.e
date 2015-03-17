class EXAMPLE3
   -- Test of the customized is_equal/copy of class TRIANGLE.

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
      end

end -- class EXAMPLE3
