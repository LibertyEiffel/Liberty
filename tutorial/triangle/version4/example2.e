class EXAMPLE2

create {ANY}
   main

feature {ANY}
   main
      local
         t1, t2: TRIANGLE
      do
         sedb_breakpoint
         -- Under sedb, try the 'G' command now.
         create t1.make(create {POINT}.make(1.0, 2.0), create {POINT}.make(3.0, 4.0), create {POINT}.make(5.0, 6.0))
         sedb_breakpoint
         -- Under sedb, try the 'G' again and check for the number of
         -- created TRIANGLEs and created POINTs.

         t2 := t1.twin
         check
            t1 /= t2
            t1.is_equal(t2)
         end
         t2.copy(t1)
         io.put_string("[

            It is a good exercice to run this example with the
            garbage collector information enabled:
            Type:
                   compile -gc_info -sedb example2

                       ]")
      end

end -- class EXAMPLE2
