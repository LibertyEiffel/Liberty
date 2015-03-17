class TEST_NATURAL3
   
inherit
   EIFFELTEST_TOOLS

create {}
   main

feature {}
   main
      local
         a8: NATURAL_8; a16: NATURAL_16; a64: NATURAL_64
      do
         a8 := 4.to_natural_8

         assert(1.to_natural_8 + 1.to_natural_8 + 1.to_natural_8 + 1.to_natural_8 = a8)

         assert(a8 + 0.to_natural_8 = a8)

         assert(0.to_natural_8.hexadecimal_digit = '0')
         assert(1.to_natural_8.hexadecimal_digit = '1')
         assert(2.to_natural_8.hexadecimal_digit = '2')
         assert(3.to_natural_8.hexadecimal_digit = '3')
         assert(4.to_natural_8.hexadecimal_digit = '4')
         assert(9.to_natural_8.hexadecimal_digit = '9')
         assert(10.to_natural_8.hexadecimal_digit = 'A')
         assert(11.to_natural_8.hexadecimal_digit = 'B')
         assert(15.to_natural_8.hexadecimal_digit = 'F')

         assert(0.to_natural_8.decimal_digit = '0')
         assert(1.to_natural_8.decimal_digit = '1')
         assert(2.to_natural_8.decimal_digit = '2')
         assert(3.to_natural_8.decimal_digit = '3')
         assert(4.to_natural_8.decimal_digit = '4')
         assert(9.to_natural_8.decimal_digit = '9')

         assert(0.to_natural_8.to_number.to_integer_32 = 0)
         assert(255.to_natural_8.to_number.to_integer_32 = 255)

         assert(32.to_natural_8.to_character = ' ')
         
         assert(2.to_natural_8.is_even)
         assert(1.to_natural_8.is_odd)

         assert(0.to_natural_8.to_string.is_equal("0"))
         assert(255.to_natural_8.to_string.is_equal("255"))         

         assert(0.to_natural_8.to_unicode_string.is_equal(U"0"))
         assert(255.to_natural_8.to_unicode_string.is_equal(U"255"))

         assert(0.to_natural_8.to_integer_8.to_natural_8  = 0.to_natural_8)
         assert(0.to_natural_8.to_integer_16.to_natural_8 = 0.to_natural_8)
         assert(0.to_natural_8.to_integer_32.to_natural_8 = 0.to_natural_8)
         assert(0.to_natural_8.to_integer_64.to_natural_8 = 0.to_natural_8)

         assert(1.to_natural_8.to_integer_8.to_natural_8  = 1.to_natural_8)
         assert(1.to_natural_8.to_integer_16.to_natural_8 = 1.to_natural_8)
         assert(1.to_natural_8.to_integer_32.to_natural_8 = 1.to_natural_8)
         assert(1.to_natural_8.to_integer_64.to_natural_8 = 1.to_natural_8)

         assert(127.to_natural_8.to_integer_8.to_natural_8  = 127.to_natural_8)
         assert(255.to_natural_8.to_integer_16.to_natural_8 = 255.to_natural_8)
         assert(255.to_natural_8.to_integer_32.to_natural_8 = 255.to_natural_8)
         assert(255.to_natural_8.to_integer_64.to_natural_8 = 255.to_natural_8)

         assert(0.to_natural_8 < 255.to_natural_8)
         assert(0.to_natural_8 <= 255.to_natural_8)
         assert(255.to_natural_8 <= 255.to_natural_8)
         
         
         assert(255.to_natural_8 > 0.to_natural_8)
         assert(255.to_natural_8 >= 0.to_natural_8)
         assert(255.to_natural_8 >= 255.to_natural_8)
         
         -- -------------------------------------------------------------
         a16 := 4.to_natural_16

         assert(1.to_natural_16 + 1.to_natural_16 + 1.to_natural_16 + 1.to_natural_16 = a16)

         assert(a16 + 0.to_natural_16 = a16)

         assert(0.to_natural_16.hexadecimal_digit = '0')
         assert(1.to_natural_16.hexadecimal_digit = '1')
         assert(2.to_natural_16.hexadecimal_digit = '2')
         assert(3.to_natural_16.hexadecimal_digit = '3')
         assert(4.to_natural_16.hexadecimal_digit = '4')
         assert(9.to_natural_16.hexadecimal_digit = '9')
         assert(10.to_natural_16.hexadecimal_digit = 'A')
         assert(11.to_natural_16.hexadecimal_digit = 'B')
         assert(15.to_natural_16.hexadecimal_digit = 'F')

         assert(0.to_natural_16.decimal_digit = '0')
         assert(1.to_natural_16.decimal_digit = '1')
         assert(2.to_natural_16.decimal_digit = '2')
         assert(3.to_natural_16.decimal_digit = '3')
         assert(4.to_natural_16.decimal_digit = '4')
         assert(9.to_natural_16.decimal_digit = '9')

         assert(0.to_natural_16.to_number.to_integer_32 = 0)
         assert(255.to_natural_16.to_number.to_integer_32 = 255)

         assert(32.to_natural_16.to_character = ' ')
         
         assert(2.to_natural_16.is_even)
         assert(1.to_natural_16.is_odd)

         assert(0.to_natural_16.to_string.is_equal("0"))
         assert(255.to_natural_16.to_string.is_equal("255"))         

         assert(0.to_natural_16.to_unicode_string.is_equal(U"0"))
         assert(255.to_natural_16.to_unicode_string.is_equal(U"255"))

         assert(0.to_natural_16.to_integer_8.to_natural_16  = 0.to_natural_16)
         assert(0.to_natural_16.to_integer_16.to_natural_16 = 0.to_natural_16)
         assert(0.to_natural_16.to_integer_32.to_natural_16 = 0.to_natural_16)
         assert(0.to_natural_16.to_integer_64.to_natural_16 = 0.to_natural_16)

         assert(1.to_natural_16.to_integer_8.to_natural_16  = 1.to_natural_16)
         assert(1.to_natural_16.to_integer_16.to_natural_16 = 1.to_natural_16)
         assert(1.to_natural_16.to_integer_32.to_natural_16 = 1.to_natural_16)
         assert(1.to_natural_16.to_integer_64.to_natural_16 = 1.to_natural_16)

         assert(127.to_natural_16.to_integer_8.to_natural_16  = 127.to_natural_16)
         assert(255.to_natural_16.to_integer_16.to_natural_16 = 255.to_natural_16)
         assert(255.to_natural_16.to_integer_32.to_natural_16 = 255.to_natural_16)
         assert(255.to_natural_16.to_integer_64.to_natural_16 = 255.to_natural_16)

         assert(0.to_natural_16 < 255.to_natural_16)
         assert(0.to_natural_16 <= 255.to_natural_16)
         assert(255.to_natural_16 <= 255.to_natural_16)
         
         
         assert(255.to_natural_16 > 0.to_natural_16)
         assert(255.to_natural_16 >= 0.to_natural_16)
         assert(255.to_natural_16 >= 255.to_natural_16)
         
         -- -------------------------------------------------------------
         a64 := 4.to_natural_64

         assert(1.to_natural_64 + 1.to_natural_64 + 1.to_natural_64 + 1.to_natural_64 = a64)

         assert(a64 + 0.to_natural_64 = a64)

         assert(0.to_natural_64.hexadecimal_digit = '0')
         assert(1.to_natural_64.hexadecimal_digit = '1')
         assert(2.to_natural_64.hexadecimal_digit = '2')
         assert(3.to_natural_64.hexadecimal_digit = '3')
         assert(4.to_natural_64.hexadecimal_digit = '4')
         assert(9.to_natural_64.hexadecimal_digit = '9')
         assert(10.to_natural_64.hexadecimal_digit = 'A')
         assert(11.to_natural_64.hexadecimal_digit = 'B')
         assert(15.to_natural_64.hexadecimal_digit = 'F')

         assert(0.to_natural_64.decimal_digit = '0')
         assert(1.to_natural_64.decimal_digit = '1')
         assert(2.to_natural_64.decimal_digit = '2')
         assert(3.to_natural_64.decimal_digit = '3')
         assert(4.to_natural_64.decimal_digit = '4')
         assert(9.to_natural_64.decimal_digit = '9')

         assert(0.to_natural_64.to_number.to_integer_32 = 0)
         assert(255.to_natural_64.to_number.to_integer_32 = 255)

         assert(32.to_natural_64.to_character = ' ')
         
         assert(2.to_natural_64.is_even)
         assert(1.to_natural_64.is_odd)

         assert(0.to_natural_64.to_string.is_equal("0"))
         assert(255.to_natural_64.to_string.is_equal("255"))         

         assert(0.to_natural_64.to_unicode_string.is_equal(U"0"))
         assert(255.to_natural_64.to_unicode_string.is_equal(U"255"))

         assert(0.to_natural_64.to_integer_8.to_natural_64  = 0.to_natural_64)
         assert(0.to_natural_64.to_integer_64.to_natural_64 = 0.to_natural_64)
         assert(0.to_natural_64.to_integer_32.to_natural_64 = 0.to_natural_64)
         assert(0.to_natural_64.to_integer_64.to_natural_64 = 0.to_natural_64)

         assert(1.to_natural_64.to_integer_8.to_natural_64  = 1.to_natural_64)
         assert(1.to_natural_64.to_integer_64.to_natural_64 = 1.to_natural_64)
         assert(1.to_natural_64.to_integer_32.to_natural_64 = 1.to_natural_64)
         assert(1.to_natural_64.to_integer_64.to_natural_64 = 1.to_natural_64)

         assert(127.to_natural_64.to_integer_8.to_natural_64  = 127.to_natural_64)
         assert(255.to_natural_64.to_integer_64.to_natural_64 = 255.to_natural_64)
         assert(255.to_natural_64.to_integer_32.to_natural_64 = 255.to_natural_64)
         assert(255.to_natural_64.to_integer_64.to_natural_64 = 255.to_natural_64)

         assert(0.to_natural_64 < 255.to_natural_64)
         assert(0.to_natural_64 <= 255.to_natural_64)
         assert(255.to_natural_64 <= 255.to_natural_64)
         
         
         assert(255.to_natural_64 > 0.to_natural_64)
         assert(255.to_natural_64 >= 0.to_natural_64)
         assert(255.to_natural_64 >= 255.to_natural_64)
      end
end
