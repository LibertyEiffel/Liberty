class TII
   -- Test Integer inherited

   -- This currently (2011-12-23) fails: 

   -- ****** Fatal Error: An expanded value can be compared only with
   -- the same other expanded value. Expression `Current' is of type
   -- II while expression `zero' is of type INTEGER_8. Comparison not
   -- allowed (VWEQ).
   -- 
   -- Line 192 column 28 in INTEGRAL (/home/paolo/current-liberty/src/lib/numeric/integral.e):
   --          Result = (Current /= zero)

   -- but zero is defined like Current so this error should not occour.

create make
feature make
      local i: II
      do
         i.print_on(std_output)
      end
   end
