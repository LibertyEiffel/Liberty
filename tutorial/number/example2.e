class EXAMPLE2
   --
   -- To start with NUMBERs, just compile an run it :
   --
   --            compile -o example2 -boost example2
   --

create {ANY}
   make

feature {ANY}
   make
      local
         n1, n2, n3: NUMBER
      do
         n1 := ("1/3").to_number
         n2 := 1.to_number / 3.to_number
         n3 := n1 + n2
         io.put_number(n1)
         io.put_string(" + ")
         io.put_number(n2)
         io.put_string(" = ")
         io.put_number(n3)
         io.put_new_line
         io.put_number(n1)
         io.put_string(" + ")
         io.put_number(n3)
         io.put_string(" = ")
         io.put_number(n1 + n3)
         io.put_string("[

            Do you like NUMBERs ?
            Have a look at example #3 to know more about NUMBERs.

                        ]")
      end

end -- class EXAMPLE2
