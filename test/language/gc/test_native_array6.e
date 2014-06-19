-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NATIVE_ARRAY6

create {}
   make

feature {ANY}
   limit: INTEGER 100000

   na_max: INTEGER 9999

   make
      local
         i: INTEGER; na1, na2: NATIVE_ARRAY[CHARACTER]
      do
         na1 := na1.calloc(na_max)
         na1.set_all_with('a', na_max)
         from
            i := limit
         until
            i = 0
         loop
            na2 := na2.calloc(i)
            check_na(na1)
            i := i - 1
         end
         na1 := na1.calloc(na_max)
         na1.set_all_with('a', na_max)
         from
            i := limit
         until
            i = 0
         loop
            na2 := na2.calloc(i)
            check_na(na1)
            i := i - 1
         end
      end

   check_na (na: NATIVE_ARRAY[CHARACTER])
      local
         i: INTEGER
      do
         from
            i := na_max
         until
            i < 0
         loop
            assert(na.item(i) = 'a')
            i := i - 1
         end
      end

   assert (b: BOOLEAN)
      do
         if not b then
            std_output.put_string("Error in TEST_NATIVE_ARRAY6%N")
            crash
         else
            --       std_output.put_string("Yes%N");
         end
      end

end -- class TEST_NATIVE_ARRAY6
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
