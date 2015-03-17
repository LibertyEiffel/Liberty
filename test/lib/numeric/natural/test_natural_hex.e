class TEST_NATURAL_HEX
--
-- Added to_hex_* tests.
--
inherit
   EIFFELTEST_TOOLS

create {}
   main

feature {}
   main
      local
         n8: NATURAL_8; n16: NATURAL_16; n32: NATURAL_32; n64: NATURAL_64
         str: STRING
      do
         n8 := 1.to_natural_8
         str := n8.to_hexadecimal
         assert(str.is_equal("01"))

         n8 := 2.to_natural_8
         str := n8.to_hexadecimal
         assert(str.is_equal("02"))

         n8 := 10.to_natural_8
         str := n8.to_hexadecimal
         assert(str.is_equal("0A"))

         n8 := 16.to_natural_8
         str := n8.to_hexadecimal
         assert(str.is_equal("10"))

         n16 := 256.to_natural_16
         str := n16.to_hexadecimal
         assert(str.is_equal("0100"))

         n16 := 65535.to_natural_16
         str := n16.to_hexadecimal
         assert(str.is_equal("FFFF"))

         n32 := 65535.to_natural_32
         str := n32.to_hexadecimal
         assert(str.is_equal("0000FFFF"))

         n32 := 65536.to_natural_32
         str := n32.to_hexadecimal
         assert(str.is_equal("00010000"))

         n32 := ~(0.to_natural_32)
         str := n32.to_hexadecimal
         assert(str.is_equal("FFFFFFFF"))

         n64 := 0.to_natural_64
         str := n64.to_hexadecimal
         assert(str.is_equal("0000000000000000"))

         n64 := 0x7FFFFFFFFFFFFFFF.to_natural_64
         str := n64.to_hexadecimal
         assert(str.is_equal("7FFFFFFFFFFFFFFF"))

         n64 := n64 |<< 1
         str := n64.to_hexadecimal
         assert(str.is_equal("FFFFFFFFFFFFFFFE"))

         n64 := ~(0.to_natural_64)
         str := n64.to_hexadecimal
         assert(str.is_equal("FFFFFFFFFFFFFFFF"))

      end
end
