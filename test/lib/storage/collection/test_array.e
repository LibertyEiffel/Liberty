-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ARRAY

create {}
   make

feature {ANY}
   t_boolean: ARRAY[BOOLEAN]

   t_integer: ARRAY[INTEGER_8]

   t_animal: ARRAY[ANIMAL]

   t_real: ARRAY[REAL]

   make
      local
         cat: CAT; dog: DOG
      do
         assert(True)
         t_boolean := {ARRAY[BOOLEAN] 1, << True, False >> }
         assert(1 = t_boolean.first_index_of(True))
         assert(1 = t_boolean.fast_first_index_of(True))
         assert(2 = t_boolean.first_index_of(False))
         assert(2 = t_boolean.fast_first_index_of(False))
         assert({ARRAY[INTEGER_8] 1, << 1, 2, 3 >> }.is_equal({ARRAY[INTEGER_8] 1, << 1, 2, 3 >> }))
         assert({ARRAY[CHARACTER] 1, << 'a', 'b', 'c' >> }.is_equal({ARRAY[CHARACTER] 1, << 'a', 'b', 'c' >> }))
         assert({ARRAY[REAL] 1, << 1.5, 2.5, 3.0 >> }.is_equal({ARRAY[REAL] 1, << 1.5, 2.5, 3.0 >> }))
         t_integer := {ARRAY[INTEGER_8] 1, << 1, 2 >> }
         t_real := {ARRAY[REAL] 1, << 1.0, 2.0 >> }
         create cat
         t_animal := {ARRAY[ANIMAL] 1, << cat, cat >> }
         t_animal.put(Void, 1)
         t_animal.put(cat, 1)
         create cat
         create dog
         t_animal := {ARRAY[ANIMAL] 1, << cat, dog >> }
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_ARRAY: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            --       std_output.put_string("Yes%N")
         end
      end

   cpt: INTEGER

end -- class TEST_ARRAY
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
