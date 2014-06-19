class EXAMPLE3
   -- Again, compile with:  compile -sedb example1
   -- ... and try to understand what happens at run-time.

create {ANY}
   main

feature {ANY}
   main
      local
         x, y, z: POINT; t: TRIANGLE
      do
         create x
         x.translate(1.0, 2.0)
         create z
         z.translate(5.0, 6.0)
         create t
         t.make(x, y, z)
         t.translate(1, 2)
         -- It is now time to look at version2 of class
         -- TRIANGLE

         sedb_breakpoint
      end

end -- class EXAMPLE3
