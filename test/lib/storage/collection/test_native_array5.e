-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NATIVE_ARRAY5

create {}
   make

feature {ANY}
   make
      local
         a: NATIVE_ARRAY[NATIVE_ARRAY[CHARACTER]]
      do
         a := a.calloc(2)
         a.put(a.item(0).calloc(2), 0)
         a.put(a.item(1).calloc(2), 1)
         a.item(0).put('a', 0)
         a.item(0).put('b', 1)
         a.item(1).put('c', 0)
         a.item(1).put('d', 1)
         assert(a.item(0).item(0) = 'a')
         assert(a.item(0).item(1) = 'b')
         assert(a.item(1).item(0) = 'c')
         assert(a.item(1).item(1) = 'd')
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_NATIVE_ARRAY5: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_NATIVE_ARRAY5
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
