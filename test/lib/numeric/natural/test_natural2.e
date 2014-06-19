class TEST_NATURAL2
   
inherit
   EIFFELTEST_TOOLS

create {}
   main

feature {}
   main
      local
         a8, b8, c8, d8: NATURAL_8
         a16, b16, c16, d16: NATURAL_16
      do
         a8 := 0.to_natural_8
         assert(a8 = b8)
         assert(a8.is_equal(b8))

         b8 := 1.to_natural_8
         assert(b8 = a8 + b8)

         c8 := 2.to_natural_8 * b8
         assert(c8.to_integer_8 = 2)
         
         d8 := c8 * c8
         assert(d8.to_integer_8 = 4)
         
         assert((d8 // c8) = c8)
         
         assert((d8 \\ c8) = 0.to_natural_8)         

         assert((d8 #// c8) = c8)
         
         assert((d8 #\\ c8) = 0.to_natural_8)         

         assert((4.to_natural_8 / 2.to_natural_8).in_range(1.9, 2.1))
         -- ----------------------------------------------------
         a16 := 0.to_natural_16
         assert(a16 = b16)
         assert(a16.is_equal(b16))

         b16 := 1.to_natural_16
         assert(b16 = a16 + b16)

         c16 := 2.to_natural_16 * b16
         assert(c16.to_integer_8 = 2)
         
         d16 := c16 * c16
         assert(d16.to_integer_8 = 4)
         
         assert((d16 // c16) = c16)
         
         assert((d16 \\ c16) = 0.to_natural_16)         

         assert((d16 #// c16) = c16)
         
         assert((d16 #\\ c16) = 0.to_natural_16)         

         assert((4.to_natural_16 / 2.to_natural_16).in_range(1.9, 2.1))
      end

end
