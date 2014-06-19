-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INHERIT_ARRAY1

create {}
   make

feature {ANY}
   a_integer: AUX_INHERIT_ARRAY1[INTEGER]

   a_real_32: AUX_INHERIT_ARRAY1[REAL_32]

   a_real: AUX_INHERIT_ARRAY1[REAL]

   a_character: AUX_INHERIT_ARRAY1[CHARACTER]

   a_boolean: AUX_INHERIT_ARRAY1[BOOLEAN]

   a_animal: AUX_INHERIT_ARRAY1[ANIMAL]

   make
      local
         cat: CAT; dog: DOG
      do
         create a_integer.make({ARRAY[INTEGER] 1, << 1, 2, 3 >> })
         create a_real_32.make({ARRAY[REAL_32] 1, << {REAL_32 1.0}, {REAL_32 2.5}, {REAL_32 3.6} >> })
         create a_real.make({ARRAY[REAL] 1, << 1.0, 2.0, 3.7 >> })
         create a_boolean.make({ARRAY[BOOLEAN] 1, << True, False, True >> })
         create cat
         create dog
         -- create a_any.make({ARRAY[ANY] 1, <<cat,2,dog>>});
         create a_animal.make({ARRAY[ANIMAL] 1, << cat, Void, dog >> })
      end

end -- class TEST_INHERIT_ARRAY1
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
