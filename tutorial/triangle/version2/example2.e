class EXAMPLE2

create {ANY}
   main

feature {ANY}
   main
      local
         x, y, z: POINT; t: TRIANGLE
      do
         create x.make(1.0, 2.0)
         create y.make(3.0, 4.0)
         create z.make(5.0, 6.0)
         create t.make(x, y, z)
         t.translate(1, 2)
         sedb_breakpoint
         -- Do not forget to do:
         --         short POINT
         -- and
         --         short TRIANGLE
      end

end -- class EXAMPLE2
