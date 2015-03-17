-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MANIFEST_ARRAY

create {}
   make

feature {ANY}
   array_boolean: ARRAY[BOOLEAN]

   array_integer: ARRAY[INTEGER]

   array_animal: ARRAY[ANIMAL]

   array_quadruped: ARRAY[QUADRUPED]

   array_real_32: ARRAY[REAL_32]

   array_real_64: ARRAY[REAL_64]

   array_character: ARRAY[CHARACTER]

   make
      local
         cat: CAT; dog: DOG
      do
         array_integer := {ARRAY[INTEGER] 1, << 1, 2, 3 >> }
         assert(array_integer.fast_first_index_of(2) = 2)
         array_boolean := {ARRAY[BOOLEAN] 1, << True, False >> }
         assert(1 = array_boolean.first_index_of(True))
         assert(1 = array_boolean.fast_first_index_of(True))
         assert(2 = array_boolean.first_index_of(False))
         assert(2 = array_boolean.fast_first_index_of(False))
         assert({ARRAY[INTEGER_8] 1, << 1, 2, 3 >> }.is_equal({ARRAY[INTEGER_8] 1, << 1, 2, 3 >> }))
         assert({ARRAY[CHARACTER] 1, << 'a', 'b', 'c' >> }.is_equal({ARRAY[CHARACTER] 1, << 'a', 'b', 'c' >> }))
         array_character := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c' >> }
         assert(array_character.item(1) = 'a')
         create array_character.make(1, 1)
         array_character.put('z', 1)
         assert(array_character.item(1) = 'z')
         assert({ARRAY[REAL] 1, << 1.5, 2.5, 3.0 >> }.is_equal({ARRAY[REAL] 1, << 1.5, 2.5, 3.0 >> }))
         array_integer := {ARRAY[INTEGER] 1, << 1 >> }
         array_real_32 := {ARRAY[REAL_32] 1, << 1.0.force_to_real_32 >> }
         assert(array_real_32.first = array_integer.last.force_to_real_32)
         create cat
         array_quadruped := {ARRAY[CAT] 1, << cat, cat >> }
         array_animal := {ARRAY[CAT] 1, << cat, cat >> }
         assert(array_animal.is_equal(array_quadruped))
         array_quadruped.put(Void, 1)
         array_animal.put(Void, 1)
         assert(array_animal.is_equal(array_quadruped))
         array_animal.put(cat, 1)
         assert(not array_animal.is_equal(array_quadruped))
         create cat
         create dog
         array_quadruped := {ARRAY[QUADRUPED] 1, << cat, dog >> }
         array_animal := {ARRAY[ANIMAL] 1, << cat, dog >> }
         assert(array_animal.is_equal(array_quadruped))
         array_quadruped := {ARRAY[QUADRUPED] 1, << cat, dog >> }
         assert(array_animal.is_equal(array_quadruped))
         array_real_64 := {ARRAY[REAL_64] 1, << d1, d2, d3 >> }
         assert(array_real_64.is_equal({ARRAY[REAL_64] 1, << d1, d2, d3 >> }))
      end

   d1: REAL_64 1.5

   d2: REAL_64 1.7

   d3: REAL_64 1.8

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_MANIFEST_ARRAY: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N")
         end
      end

   cpt: INTEGER

end -- class TEST_MANIFEST_ARRAY
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
