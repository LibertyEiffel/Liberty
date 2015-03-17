-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NATURAL1
   
inherit
   EIFFELTEST_TOOLS
   
create {}
   main

feature {}
   main
      local
         a8, b8, c8, d8, e8, f8, g8, h8, j8: NATURAL_8
         a64, b64, c64, d64, e64, f64, g64, h64, j64: NATURAL_64
      do
         assert(j8 = 0.to_natural_8)
         a8 := a8 + 1.to_natural_8

         assert(a8 /= 0.to_natural_8)
         assert(a8 = 1.to_natural_8)
      
         b8 := 2.to_natural_8
         c8 := 100.to_natural_8
         
         assert(b8 = b8)
         assert(a8 + a8 = b8)
         assert(a8 < b8)
         assert(a8 <= b8)
         assert(b8 >= b8)
         assert(b8 >= a8)
         assert(b8 > a8)
         assert(c8 > b8)
         assert(c8 = c8)
         
         e8 := c8
         d8 := c8 + e8
         assert(d8 > c8)
         assert(d8 >= e8)
         assert(d8 >= e8 + c8)
         assert(d8 <= e8 + c8)
         
         assert(a8 = a8)
         assert(not (a8 = j8))
         assert(not (j8 = a8))
         assert(j8 < a8)
         assert(not (a8 < j8))
         assert(j8 <= a8)
         assert(a8 > j8)
         assert(a8 >= j8)
         
         h8 := 10.to_natural_8
         g8 := c8 // h8
         f8 := c8 \\ h8
         assert(g8 = h8)
         assert(f8 = (a8 - a8))
         assert((a8 + b8).to_integer_32 = 3)
         assert(a8.out.is_equal("1"))
         assert(b8.out.is_equal("2"))
         assert(d8.out.is_equal("200"))

         -- ----------------------------------------
         assert(j64 = 0.to_natural_64)
         a64 := a64 + 1.to_natural_64

         assert(a64 /= 0.to_natural_64)
         assert(a64 = 1.to_natural_64)
      
         b64 := 2.to_natural_64
         c64 := 100.to_natural_64
         
         assert(b64 = b64)
         assert(a64 + a64 = b64)
         assert(a64 < b64)
         assert(a64 <= b64)
         assert(b64 >= b64)
         assert(b64 >= a64)
         assert(b64 > a64)
         assert(c64 > b64)
         assert(c64 = c64)
         
         e64 := c64
         d64 := c64 + e64
         assert(d64 > c64)
         assert(d64 >= e64)
         assert(d64 >= e64 + c64)
         assert(d64 <= e64 + c64)
         
         assert(a64 = a64)
         assert(not (a64 = j64))
         assert(not (j64 = a64))
         assert(j64 < a64)
         assert(not (a64 < j64))
         assert(j64 <= a64)
         assert(a64 > j64)
         assert(a64 >= j64)
         
         h64 := 10.to_natural_64
         g64 := c64 // h64
         f64 := c64 \\ h64
         assert(g64 = h64)
         assert(f64 = (a64 - a64))
         assert((a64 + b64).to_integer_32 = 3)
         assert(a64.out.is_equal("1"))
         assert(a64.to_number.to_string.is_equal("1"))
         assert(b64.out.is_equal("2"))
         assert(d64.out.is_equal("200"))         

         d64 := 9223372036854775807.to_natural_64
         assert(d64.out.is_equal("9223372036854775807"))
         d64 := d64 * 2.to_natural_64
         assert(d64.out.is_equal("18446744073709551614"))
         assert(d64.to_number.to_string.is_equal("18446744073709551614"))

         d64 := d64 + 1.to_natural_64
         assert(d64.out.is_equal("18446744073709551615"))
         assert(d64.to_number.to_string.is_equal("18446744073709551615"))         
         d64 := d64 #+ 1.to_natural_64
         assert(d64.out.is_equal("0"))
         
      end
   
end -- class TEST_NATURAL1
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
