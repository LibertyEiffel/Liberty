class EXAMPLE2
   -- Again, compile with:  compile -sedb example1

create {ANY}
   main

feature {ANY}
   main
      local
         x, y, z: POINT; t: TRIANGLE
      do
         create x
         x.translate(1.0, 2.0)
         create y
         y.translate(3.0, 4.0)
         create z
         z.translate(5.0, 6.0)
         create t
         t.make(x, y, z)
         t.translate(1, 2)
         sedb_breakpoint
         -- Do not forget to do:
         --         short point
         -- and
         --         short triangle
      end

end -- class EXAMPLE2
