class TEST_NATURAL6

inherit
   EIFFELTEST_TOOLS

create {}
   main

feature {}
   main
      local
         a8: NATURAL_8; a16: NATURAL_16; a32: NATURAL_32; a64: NATURAL_64
      do
         a8 := 4.to_natural_8
         assert((a8 |<< 1) = 8.to_natural_8)

         a8 := 128.to_natural_8
         assert((a8 |<< 1) = 0.to_natural_8)

         a8 := 1.to_natural_8
         assert((a8 |<< 1) = 2.to_natural_8)

         a8 := 127.to_natural_8
         assert((a8 |<< 1) = 254.to_natural_8)

         a8 := 127.to_natural_8
         assert((a8 |<< 7) = 128.to_natural_8)

         
         a16 := 5.to_natural_16
         assert((a16 |<< 1) = 10.to_natural_16)

         a16 := 128.to_natural_16
         assert((a16 |<< 2) = 512.to_natural_16)

         a16 := 1.to_natural_16
         assert((a16 |<< 16) = 0.to_natural_16)

         a16 := 65535.to_natural_16
         assert((a16 |<< 1) = 65534.to_natural_16)

         a16 := 127.to_natural_16
         assert((a16 |<< 7) = 0x3f80.to_natural_16)


         a32 := 6.to_natural_32
         assert((a32 |<< 1) = 12.to_natural_32)

         a32 := 128.to_natural_32
         assert((a32 |<< 2) = 512.to_natural_32)

         a32 := 1.to_natural_32
         assert((a32 |<< 31) = 2147483648.to_natural_32)

         a32 := 4294967295.to_natural_32
         assert((a32 |<< 1) = 4294967294.to_natural_32)

         a32 := 127.to_natural_32
         assert((a32 |<< 7) = 0x3f80.to_natural_32)

         assert(a32 = a32.to_natural_32)
         a32 := a32.to_natural_32


         a64 := 4711.to_natural_64
         assert((a64 |<< 1) = 9422.to_natural_64)

         a64 := 128.to_natural_64
         assert((a64 |<< 3) = 1024.to_natural_64)

         a64 := 1.to_natural_64
         assert(((a64 |<< 32) |<< 32) = 0.to_natural_64)

         a64 := 0.to_natural_64.bit_not
         assert((a64 |<< 1) = (0.to_natural_64.bit_not - 1.to_natural_64))

         a64 := 127.to_natural_64
         assert((a64 |<< 17) = 16646144.to_natural_64)



         a8 := 4.to_natural_8
         assert((a8 |>> 1) = 2.to_natural_8)

         a8 := 128.to_natural_8
         assert((a8 |>> 1) = 64.to_natural_8)

         a8 := 1.to_natural_8
         assert((a8 |>> 1) = 0.to_natural_8)

         a8 := 127.to_natural_8
         assert((a8 |>> 1) = 63.to_natural_8)

         a8 := 127.to_natural_8
         assert((a8 |>> 7) = 0.to_natural_8)


         a16 := 13.to_natural_16
         assert((a16 |>> 1) = 6.to_natural_16)

         a16 := 1024.to_natural_16
         assert((a16 |>> 2) = 256.to_natural_16)

         a16 := 1.to_natural_16
         assert((a16 |>> 16) = 0.to_natural_16)

         a16 := 65535.to_natural_16
         assert((a16 |>> 5) = 2047.to_natural_16)


         a32 := 33.to_natural_32
         assert((a32 |>> 5) = 1.to_natural_32)

         a32 := 128.to_natural_32
         assert((a32 |>> 2) = 32.to_natural_32)

         a32 := 1.to_natural_32
         assert(((a32 |>> 16) |>> 16) = 0.to_natural_32)

         a32 := 4294967295.to_natural_32
         assert((a32 |>> 1) = 0x7fffFFFF.to_natural_32)

         a32 := 255.to_natural_32
         assert((a32 |>> 7) = 1.to_natural_32)


         a64 := 123456789.to_natural_64
         assert((a64 |>> 4) = 7716049.to_natural_64)

         a64 := 0x7fffFFFFffffFFFF.to_natural_64.bit_not
         assert((a64 |>> 3) = 0x1000000000000000.to_natural_64)

         a64 := 1.to_natural_64
         assert(((a64 |>> 32) |>> 32) = 0.to_natural_64)

         a64 := 0.to_natural_64.bit_not
         assert((a64 |>> 1) = 0x7fffFFFFffffFFFF.to_natural_64)

         a64 := 0.to_natural_64.bit_not
         assert((a64 |>> 63) = 1.to_natural_64)

      end
end
