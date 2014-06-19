-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_COLLECTION_SORTER4

create {}
   make

feature {}
   make
      local
         sorter: COLLECTION_SORTER[INTEGER]; a: ARRAY[INTEGER]
      do
         create a.make(1, 0)
         assert(sorter.is_sorted(a))
         sorter.add(a, 2)
         assert(sorter.is_sorted(a))
         sorter.add(a, 3)
         assert(sorter.is_sorted(a))
         sorter.add(a, 1)
         assert(sorter.is_sorted(a))
         sorter.add(a, 1)
         assert(sorter.is_sorted(a))
         sorter.add(a, 3)
         assert(sorter.is_sorted(a))
         sorter.add(a, 2)
         assert(sorter.is_sorted(a))
         check
            sorter.is_sorted({ARRAY[INTEGER] 1, << 1, 2, 3 >> })
         end
      end

   compteur: INTEGER -- Pour numeroter les tests.

   assert (bool: BOOLEAN)
      do
         compteur := compteur + 1
         if not bool then
            std_error.put_string("*** ERREUR TEST_COLLECTION_SORTER4 test No ")
            std_error.put_integer(compteur)
            std_error.put_string("***%N")
            sedb_breakpoint
            die_with_code(exit_failure_code)
         end
      end

end -- class TEST_COLLECTION_SORTER4
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
