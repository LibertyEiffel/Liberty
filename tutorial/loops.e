class LOOPS
   --
   -- Have a look at feature `gcd' to have an example of assertions in a loop.
   -- Also note that Liberty Eiffel handles recursivity in assertions.
   -- (There is also a feature `gcd' in class INTEGER_GENERAL.)
   --
   -- compile the program with -loop_check to validate loop
   -- assertions (variant and invariant) at runtime

create {ANY}
   make

feature {ANY}
   make
      do
         check
            -- check allows to define assertions, which shall hold
            -- whenever this location is reached.
            -- if compiled with option -all_check (or assertion(check); in ACE)
            -- these assertions are validated at runtime

            gcd(3, 4) = 1
            naming_is_pssible: gcd(4, 4) = 4 -- of course we can give the assertion an explicit name
            gcd(8, 4) = 4
            gcd(9, 8) = 1
            gcd(9, 12) = 3
         end
      end

   gcd (value_1, value_2: INTEGER): INTEGER
         -- Greatest Common Divisor of `value_1' and `value_2'.
      require
         value_1 > 0
         value_2 > 0
      local
         value: INTEGER
      do
         from
            -- in the from block we do some loop related initialization
            Result := value_1
            value := value_2
         invariant
            -- the loop invariant(s) state properties that hold for
            -- each iteration
            Result > 0
            value > 0
            gcd(Result, value) = gcd(value_1, value_2)
         variant
            -- with each iteration the variant decreases but stays non-negative
            -- if such a variant exists the loop definitely terminates
            Result.max(value)
         until
            -- termination condition: the loop body will be executed
            -- until this BOOLEAN expression becomes True
            Result = value
         loop
            -- the body of the loop contains the code which is
            -- executed for each iteration
            if Result > value then
               Result := Result - value
            else
               value := value - Result
            end
         end
      ensure
         Result = gcd(value_2, value_1)
      end

end -- class LOOPS
