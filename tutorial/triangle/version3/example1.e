class EXAMPLE1

create {ANY}
   main

feature {ANY}
   main
      local
         p1: POINT
      do
         create p1.make(1.0, 2.0)
         p1.translate(1.0, 2.0)
         p1.display
         io.put_string("[

       Also have a look at the new POINT interface. To do so,
            just type the following command in the current
            working directory:
                             short point.e


                       ]")
      end

end -- class EXAMPLE1
