-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ARRAY_ADD_LAST1

create {}
   make

feature {ANY}
   t_boolean: ARRAY[BOOLEAN]

   t_integer: ARRAY[INTEGER]

   t_animal: ARRAY[ANIMAL]

   t_real: ARRAY[REAL]

   t_any: ARRAY[ANY]

   make
      local
         i: INTEGER; cat: CAT
      do
         t_boolean := {ARRAY[BOOLEAN] 1, << True >> }
         from
            i := 1
         until
            i = 100
         loop
            i := i + 1
            t_boolean.add_last(True)
            assert(t_boolean.occurrences(True) = i)
         end
         t_integer := {ARRAY[INTEGER] 1, << {INTEGER_32 56} >> }
         from
            i := 1
         until
            i = 100
         loop
            i := i + 1
            t_integer.add_last(56)
            assert(t_integer.occurrences(56) = i)
         end
         create cat
         t_animal := {ARRAY[ANIMAL] 1, << cat >> }
         from
            i := 1
         until
            i = 100
         loop
            i := i + 1
            t_animal.add_last(cat)
            assert(t_animal.occurrences(cat) = i)
         end
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_ARRAY_ADD_LAST1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_ARRAY_ADD_LAST1
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
