-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ARRAY7

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         a: ARRAY[INTEGER_8]; b: ARRAY[ARRAY[INTEGER_8]]; c: ARRAY[STRING]; d: ARRAY[AUX_ARRAY7]; e: ARRAY[INTEGER_64]
         g: ARRAY[CHARACTER]
      do
         a := {ARRAY[INTEGER_8] 1, << 1, 2, 3 >> }
         assert(a.item(1) = 1)
         assert(a.item(2) = 2)
         assert(a.item(3) = 3)
         b := {ARRAY[ARRAY[INTEGER_8]] 1, << a >> }
         assert(b.item(1) = a)
         c := {ARRAY[STRING] 1, << "hello" >> }
         assert(c.item(1).is_equal("hello"))
         d := {ARRAY[AUX_ARRAY7] 1, << aux1, aux2 >> }
         assert(d.item(1) = aux1)
         assert(d.item(2) = aux2)
         e := {ARRAY[INTEGER_64] 1, << 1234567890123, {INTEGER_64 4}, {INTEGER_64 5} >> }
         assert(e.item(1) = 1234567890123)
         assert(e.item(2) = 4)
         assert(e.item(2) = 4.to_integer_64)
         assert(e.item(3) = 5)
         assert(e.item(3) = 5.to_integer_64)
         g := {ARRAY[CHARACTER] 1, << 'd', 'c' >> }
         assert(g.item(1) = 'd')
         assert(g.item(2) = 'c')
         -- *** INTEGER_8 doesn't conform to ANY (Vincent Croizier,
         -- 01/11/2004) ***
         --         verify(a.item(1), 1)
         --         verify(a.item(2), 2)
         --         verify(a.item(3), 3)
         assert(b.item(1)~a)
         assert (c.item(1)~"hello") 
         -- *** the following reimplementation of the the previous two tests fails as the compiler wrongly says that a STRING and does not conform to ANY (Paolo R. 29/8/2011)
         --     verify(b.item(1),a)
         --     verify(c.item(1), "hello") 

         -- *** INTEGER doesn't conform to ANY (Vincent Croizier,
         -- 01/11/2004) ***
         --         verify(d.item(2), aux2)
         --         verify(d.item(2).x, (8).to_integer)
         --                      **********
         -- *** No BUG here (D.Colnet 2/11/2002)
         --         verify(d.item(2).z, (7).to_integer)
         --                      **********
         -- *** No BUG here (D.Colnet 2/11/2002)
         -- *** INTEGER_64 doesn't conform to ANY (Vincent Croizier,
         -- 01/11/2004) ***
         --         verify(e.item(1), 1234567890123)
         assert(e.item(2) = 4.to_integer_64)
         assert(e.item(2).is_equal(4.to_integer_64))
         --         verify(e.item(2), (4).to_integer_64)
         --                    *************
         -- *** No BUG here (D.Colnet 2/11/2002)
         -- *** CHARACTER doesn't conform to ANY (Vincent Croizier,
         -- 01/11/2004) ***
         --         verify(g.item(1), 'd')
         --         verify(g.item(2), 'c')
      end

   aux1: AUX_ARRAY7

   aux2: AUX_ARRAY7
      once
         Result.set(8, 9, 7)
      end

   verify (v1, v2: ANY)
      do
         assert(v1.is_equal(v2))
      end

end -- class TEST_ARRAY7
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
