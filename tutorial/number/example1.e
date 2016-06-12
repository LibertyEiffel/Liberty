class EXAMPLE1
   --
   -- To start with NUMBERs, just compile and run it :
   --
   --            compile -o example1 -boost example1
   --

insert
   ANY
   PLATFORM

create {ANY}
   make

feature {ANY}
   make
      local
         max, n1, n2: NUMBER
      do
         max := Maximum_integer.to_number
         io.put_string("[
            The maximum integer value on this architecture is:
            max =
         ]")

         io.put_number(max)
         io.put_string("%N%Nmax + max = ")
         io.put_number(max + max)
         io.put_string("%Nmax * max = ")
         io.put_number(max * max)
         io.put_string("%N%Nmax - max * max = ")
         io.put_number(max - max * max)
         io.put_string("[

            Do you like NUMBERs ?
            So have a look at NUMBERs division:

                        ]")

         n1 := 2.to_number
         n2 := 6.to_number
         io.put_string("Assume n1 = ")
         io.put_number(n1)
         io.put_string("  and n2 = ")
         io.put_number(n2)
         io.put_string("  then  n1/n2 = ")
         io.put_number(n1 / n2)
         io.put_string("[

            With NUMBER, you always get the exact result.
            Do you like NUMBERs ?
            Have a look at example #2 to know more about NUMBERs

         ]")
      end

end -- class EXAMPLE1
