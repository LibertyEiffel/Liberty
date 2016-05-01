class EXAMPLE4

create {ANY}
   main

feature {ANY}
   main
      local
         x, y, z: POINT; t1, t2: TRIANGLE
      do
         create x.make(1.0, 2.0)
         create y.make(1.0, 2.0)
         create z.make(3.0, 4.0)
         check
            x /= y
            x.is_equal(y)
         end
         create t1.make(x, y, z)
         create t2.make(x.twin, y.twin, z.twin)
         check
            t1 /= t2
            t1.is_equal(t2) -- Normal crash here ...
         end
         -- To know how to customize the TRIANGLE.is_equal feature,
         -- just have a look in the version4 directory.
      end

end -- class EXAMPLE4
