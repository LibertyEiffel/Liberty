class EXAMPLE2

create {ANY}
   main

feature {ANY}
   main
      local
         t: TRIANGLE
      do
         create t.make(create {POINT}.make(1.0, 2.0), create {POINT}.make(3.0, 4.0), create {POINT}.make(5.0, 6.0))
         t.display_on(io)
         io.put_string("[

       Also have a look at the OUTPUT_STREAM interface.
       Type:
               short OUTPUT_STREAM

                       ]")
      end

end -- class EXAMPLE2
