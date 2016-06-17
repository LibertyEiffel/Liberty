class EULERO
   --
   -- Project Euler Question 1
   -- https://projecteuler.net/problem=1
   --

create {ANY}
   make

feature {ANY}
   low: INTEGER 1

   high: INTEGER 999

   make
      do
         io.put_string("Sum of all naturals divisible for 3 or 5 lower than 1000 is: ")
         io.put_line((low |..| high).aggregate(
            agent (progressive, i: INTEGER): INTEGER
               do
                  if i.divisible(3) or i.divisible(5) then
                     Result := progressive + i
                  else
                     Result := progressive
                  end
               end (?, ?), 0).out)
      end

end -- class EULERO
