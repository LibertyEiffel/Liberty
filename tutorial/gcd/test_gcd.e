class TEST_GCD
   --
   -- Have a look at feature `gcd' to have an example of assertions in a loop.
   -- Also note that SmartEiffel handle recursivity in assertions.
   -- (There is also a feature `gcd' in class INTEGER_GENERAL.)
   --

create {ANY}
   make

feature {ANY}
   make is
      do
         check
            gcd(3, 4) = 1
            gcd(4, 4) = 4
            gcd(8, 4) = 4
            gcd(9, 8) = 1
            gcd(9, 12) = 3
         end
      end

   gcd (value_1, value_2: INTEGER): INTEGER is
         -- Great Common Divisor of `value_1' and `value_2'.
      require
         value_1 > 0
         value_2 > 0
      local
         value: INTEGER
      do
         from
            Result := value_1
            value := value_2
         invariant
            Result > 0
            value > 0
            gcd(Result, value) = gcd(value_1, value_2)
         variant
            Result.max(value)
         until
            Result = value
         loop
            if Result > value then
               Result := Result - value
            else
               value := value - Result
            end
         end
      ensure
         Result = gcd(value_2, value_1)
      end

end -- class TEST_GCD
