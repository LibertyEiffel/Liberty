class TEST_NATURAL5
--
-- Added to_real_* tests.
--
inherit
   EIFFELTEST_TOOLS

create {}
   main

feature {}
   main
      local
         n8: NATURAL_8; n16: NATURAL_16; n32: NATURAL_32; n64: NATURAL_64
         r32: REAL_32; r64: REAL_64
      do
         n8 := 1.to_natural_8
         r32 := n8.to_real_32
         assert(r32.to_string.has_prefix("1.0"))
         
         n8 := 2.to_natural_8
         r64 := n8.to_real_64
         assert(r64.to_string.has_prefix("2.0"))

         n16 := 3.to_natural_16
         r32 := n16.to_real_32
         assert(r32.to_string.has_prefix("3.0"))
         
         n16 := 4.to_natural_16
         r64 := n16.to_real_64
         assert(r64.to_string.has_prefix("4.0"))
         
         n32 := 5.to_natural_32
         r32 := n32.to_real_32
         assert(r32.to_string.has_prefix("5.0"))
         
         n32 := 6.to_natural_32
         r64 := n32.to_real_64
         assert(r64.to_string.has_prefix("6.0"))

         n64 := 7.to_natural_64
         r32 := n64.to_real_32
         assert(r32.to_string.has_prefix("7.0"))

         n64 := 8.to_natural_64
         r64 := n64.to_real_64
         assert(r64.to_string.has_prefix("8.0"))
         

         n64 := 10.to_natural_64
         assert(n64.to_natural_32 = 10.to_natural_32)
         assert(n64.to_natural_16 = 10.to_natural_16)
         assert(n64.to_natural_8 = 10.to_natural_8)

         n32 := 11.to_natural_32
         assert(n32.to_natural_64 = 11.to_natural_64)
         assert(n32.to_natural_16 = 11.to_natural_16)
         assert(n32.to_natural_8 = 11.to_natural_8)
         
         n16 := 12.to_natural_16
         assert(n16.to_natural_64 = 12.to_natural_64)
         assert(n16.to_natural_32 = 12.to_natural_32)
         assert(n16.to_natural_8 = 12.to_natural_8)
         
         n8 := 13.to_natural_8
         assert(n8.to_natural_64 = 13.to_natural_64)
         assert(n8.to_natural_32 = 13.to_natural_32)
         assert(n8.to_natural_16 = 13.to_natural_16)

         assert(14.to_natural_8.to_number.to_string.is_equal("14"))
         assert(14.to_natural_16.to_number.to_string.is_equal("14"))
         assert(14.to_natural_32.to_number.to_string.is_equal("14"))
         assert(14.to_natural_64.to_number.to_string.is_equal("14"))

      end
end
