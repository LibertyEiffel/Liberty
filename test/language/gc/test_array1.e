-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ARRAY1

create {}
   make

feature {ANY}
   make
      local
         array_of_array: ARRAY[ARRAY[INTEGER]]; i, limit: INTEGER
      do
         limit := 5000
         create array_of_array.make(1, limit)
         from
            i := 1
         until
            i > limit
         loop
            array_of_array.put({ARRAY[INTEGER] 1, << 2, 3 >> }, i)
            array_of_array.put({ARRAY[INTEGER] 1, << i + 1, i >> }, i)
            i := i + 1
         end
         from
            i := 1
         until
            i > limit
         loop
            array_of_array.put({ARRAY[INTEGER] 1, << i + 1, i >> }, i)
            check_array_contents(array_of_array)
            i := i + 1
         end
      end

   check_array_contents (a: ARRAY[ARRAY[INTEGER]])
      local
         i: INTEGER
      do
         from
            i := a.upper
         until
            i = 0
         loop
            if not {ARRAY[INTEGER] 1, << i + 1, i >> }.is_equal(a.item(i)) then
               crash
            end
            i := i - 1
         end
      end

end -- class TEST_ARRAY1
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
