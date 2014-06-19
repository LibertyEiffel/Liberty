class TEST_NATURAL4
   
inherit
   EIFFELTEST_TOOLS

create {}
   main

feature {}
   main
      local
         n64: NATURAL_64; debug_view: STRING
      do
         -- Testing {NUMBER}.is_natural_64:
         assert(("0").to_number.is_natural_64)
         assert(("255").to_number.is_natural_64)
         assert(("256").to_number.is_natural_64)
         assert(("65535").to_number.is_natural_64)
         assert(("65536").to_number.is_natural_64)
         assert(("4294967295").to_number.is_natural_64)
         assert(("4294967296").to_number.is_natural_64)
         assert(("18446744073709551615").to_number.is_natural_64)

         assert(not ("-1").to_number.is_natural_64)
         assert(not ("18446744073709551616").to_number.is_natural_64)

         -- Testing {NUMBER}.to_natural_64:
         n64 := ("0").to_number.to_natural_64
         assert(n64 = 0.to_natural_64)
         debug_view := n64.to_string
         assert(n64.to_string.is_equal("0"))

         n64 := ("255").to_number.to_natural_64
         assert(n64 = 255.to_natural_64)
         debug_view := n64.to_string
         assert(n64.to_string.is_equal("255"))
         
         n64 := ("256").to_number.to_natural_64
         assert(n64 = 256.to_natural_64)
         debug_view := n64.to_string
         assert(n64.to_string.is_equal("256"))

         n64 := ("65535").to_number.to_natural_64
         assert(n64 = 65535.to_natural_64)
         debug_view := n64.to_string
         assert(n64.to_string.is_equal("65535"))

         n64 := ("65536").to_number.to_natural_64
         assert(n64 = 65536.to_natural_64)
         debug_view := n64.to_string
         assert(n64.to_string.is_equal("65536"))

         n64 := ("4294967295").to_number.to_natural_64
         assert(n64 = 4294967295.to_natural_64)
         debug_view := n64.to_string
         assert(n64.to_string.is_equal("4294967295"))

         n64 := ("4294967296").to_number.to_natural_64
         assert(n64 = 4294967296.to_natural_64)
         debug_view := n64.to_string
         assert(n64.to_string.is_equal("4294967296"))
         
         n64 := ("18446744073709551614").to_number.to_natural_64
         debug_view := n64.to_string
         assert(n64.to_string.is_equal("18446744073709551614"))

         n64 := ("18446744073709551615").to_number.to_natural_64
         debug_view := n64.to_string
         assert(n64.to_string.is_equal("18446744073709551615"))

         debug_view := 0.to_natural_8.bit_not.to_string
         assert(debug_view.is_equal("255"))
         
         debug_view := 0.to_natural_16.bit_not.to_string
         assert(debug_view.is_equal("65535"))

         debug_view := 0.to_natural_32.bit_not.to_string
         assert(debug_view.is_equal("4294967295"))

         debug_view := 0.to_natural_64.bit_not.to_string
         assert(debug_view.is_equal("18446744073709551615"))

         assert(1.to_natural_8.bit_rotate_left(1) = 2.to_natural_8)
         assert(1.to_natural_16.bit_rotate_left(1) = 2.to_natural_16)
         assert(1.to_natural_32.bit_rotate_left(1) = 2.to_natural_32)
         assert(1.to_natural_64.bit_rotate_left(1) = 2.to_natural_64)

         assert(1.to_natural_8.bit_rotate(-1) = 2.to_natural_8)
         assert(1.to_natural_16.bit_rotate(-1) = 2.to_natural_16)
         assert(1.to_natural_32.bit_rotate(-1) = 2.to_natural_32)
         assert(1.to_natural_64.bit_rotate(-1) = 2.to_natural_64)

         assert(128.to_natural_8.bit_rotate_right(1) = 64.to_natural_8)
         assert(128.to_natural_16.bit_rotate_right(1) = 64.to_natural_16)
         assert(128.to_natural_32.bit_rotate_right(1) = 64.to_natural_32)
         assert(128.to_natural_64.bit_rotate_right(1) = 64.to_natural_64)

         assert(128.to_natural_8.bit_rotate(1) = 64.to_natural_8)
         assert(128.to_natural_16.bit_rotate(1) = 64.to_natural_16)
         assert(128.to_natural_32.bit_rotate(1) = 64.to_natural_32)
         assert(128.to_natural_64.bit_rotate(1) = 64.to_natural_64)
      end
end
