class EXAMPLE3
   -- You can also compile this code without -sedb (there's an output)

create {ANY}
   main

feature {ANY}
   main
      local
         x, y, z: POINT; t: TRIANGLE
      do
         create x.make(1.0, 2.0)
         point_display(x)
         create y.make(3.0, 4.0)
         point_display(y)
         create z.make(5.0, 6.0)
         point_display(z)
         create t.make(x, y, z)
         triangle_display(t)
         t.translate(1, 2)
         triangle_display(t)
         -- It is too bad (i.e. not object oriented).
         -- Have a look at version3 of class TRIANGLE
      end

   triangle_display (t: TRIANGLE)
      do
         io.put_string("TRIANGLE[%N%T")
         point_display(t.p1)
         io.put_string("%N%T")
         point_display(t.p2)
         io.put_string("%N%T")
         point_display(t.p3)
         io.put_string("%T]%N")
      end

   point_display (p: POINT)
      do
         io.put_string("POINT[")
         io.put_real(p.x)
         io.put_character(',')
         io.put_real(p.y)
         io.put_string("]%N")
      end

end -- class EXAMPLE3
