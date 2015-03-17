class EXAMPLE1
   -- Getting started with creation procedures.

create {ANY}
   main

feature {ANY}
   main
      local
         p1: POINT
      do
         create p1.make(1.0, 2.0)
         p1.translate(1.0, 2.0)
         -- Using make again on the very same POINT:
         p1.make(1.0, 2.0)
         sedb_breakpoint
      end

end -- class EXAMPLE1
