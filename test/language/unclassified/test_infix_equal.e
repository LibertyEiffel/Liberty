-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INFIX_EQUAL

create {}
   make

feature {ANY}
   make
      local
         c: CHARACTER; d, d2: REAL_64; r: REAL_32; animal: ANIMAL; dog: DOG
      do
         -- a: ANY
         c := 'a'
         assert('a' = c)
         -- *** CHARACTER does not conform to ANY (Vincent Croizier, 03/11/2004) ***
         -- a := c
         -- *** assert(not(a = 'a'))
         -- Yes, it was a really bad idea to accept such code !
         -- *** (Dom. july 12th 2004) ***
         -- *** assert(not('a' = a))
         -- Yes, it was a really bad idea to accept such code !
         -- *** (Dom. july 12th 2004) ***
         assert(88 = 88)
         -- *** INTEGER_8 does not conform to ANY (Vincent Croizier, 03/11/2004) ***
         -- a := 88
         -- *** assert(not(a = 88))
         -- Yes, it was a really bad idea to accept such code !
         -- *** (Dom. july 12th 2004) ***
         -- *** assert(not(88 = a))
         -- Yes, it was a really bad idea to accept such code !
         -- *** (Dom. july 12th 2004) ***
         assert(88.to_real_64 = 88.0)
         -- *** INTEGER_8 does not conform to ANY (Vincent Croizier, 03/11/2004) ***
         -- a := 88
         -- assert(equal(a,88))
         -- ***  assert(not(a = 88))
         -- Yes, it was a really bad idea to accept such code !
         -- *** (Dom. july 12th 2004) ***
         -- ***    assert(not(88 = a))
         -- Yes, it was a really bad idea to accept such code !
         -- *** (Dom. july 12th 2004) ***
         r := {REAL_32 88.0}
         assert(r = 88.000)
         -- *** REAL does not conform to ANY (Vincent Croizier, 03/11/2004) ***
         -- a := 88.0
         assert(r = 88)
         assert(88 = r)
         d := 88.0
         assert(d = 88.0)
         assert(88.0 = d)
         d2 := d
         assert(d2 = 88.0)
         assert(88.0 = d2)
         -- *** REAL does not conform to ANY (Vincent Croizier, 03/11/2004) ***
         -- a := d2
         assert(d2 = 88.to_real_64)
         assert(88.to_real_64 = d2)
         assert(animal = dog)
         assert(dog = animal)
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_INFIX_EQUAL: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N")
         end
      end

   cpt: INTEGER

end -- class TEST_INFIX_EQUAL
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
