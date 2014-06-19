class NATURAL_USAGE
   --
   -- Well, using NATURAL_8, NATURAL_16, NATURAL_32 and NATURAL_64 classes
   -- is pretty simple, but an example may be useful.
   --

create {ANY}
   main

feature {ANY}
   main
      local
         n8: NATURAL_8; n16: NATURAL_16; n32: NATURAL_32; n64: NATURAL_64
      do
         -- To initialize some NATURAL_8 variable with 1:
         n8 := 1.to_natural_8
         -- To initialize some NATURAL_16 variable with 1:

         n16 := 1.to_natural_16
         -- As you may have guess:

         n32 := 1.to_natural_32
         n64 := 1.to_natural_64
         -- To increment a NATURAL_8:

         n8 := n8 + 1.to_natural_8
         -- To increment a NATURAL_16:

         n16 := n16 + 1.to_natural_16
         -- As you have guess:

         n32 := n32 + 1.to_natural_32
         n64 := n64 + 1.to_natural_64
         -- Obviously, there are many other available features in NATURAL_* classes.
         --
         -- Finally, note that nothing is implicit! There is no automatic promotion/conversion.
         --
         -- (The current strict rule applied to NATURAL may be extended to all INTEGER_* types.)

         io.put_string("Maximum NATURAL_8 = ")
         io.put_natural_8_format(0.to_natural_8.bit_not, 21)
         io.put_string("%N")

         io.put_string("Maximum NATURAL_16 = ")
         io.put_natural_16_format(0.to_natural_16.bit_not, 20)
         io.put_string("%N")

         io.put_string("Maximum NATURAL_32 = ")
         io.put_natural_32_format(0.to_natural_32.bit_not, 20)
         io.put_string("%N")

         io.put_string("Maximum NATURAL_64 = ")
         io.put_natural_64(0.to_natural_64.bit_not)
         io.put_string("%N")
      end

end -- class NATURAL_USAGE
