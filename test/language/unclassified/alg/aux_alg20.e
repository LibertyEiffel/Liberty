-- This file is part of LibertEiffel The GNU Eiffel Compiler Tools and Libraries.
--
class AUX_ALG20

create {ANY}
   make

feature {}
   make(i: INTEGER)
      do
         n := i + 1
      end

   n: INTEGER

feature {ANY}
   value: INTEGER
      do
         Result := n
      end
end
