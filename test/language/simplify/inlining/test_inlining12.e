-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INLINING12

create {}
   make

feature {ANY}
   aux: AUX_INLINING12

   make
      do
         create aux
         ecrire01(create {REFERENCE[INTEGER]}.set_item(1), 2)
         assert(aux.a.item = 1)
         assert(aux.b = 2)
         assert(aux.b_is_gt(1))
         assert(b_is_gt(1))
         create aux
         ecrire02(1, 2)
         assert(aux.a.item = 1)
         assert(aux.b = 2)
      end

   ecrire01 (a: REFERENCE[INTEGER]; b: INTEGER)
      do
         aux.ecrire(a, b)
      end

   ecrire02 (a: INTEGER; b: INTEGER)
      do
         aux.ecrire(create {REFERENCE[INTEGER]}.set_item(a), b)
      end

   b_is_gt (x: INTEGER): BOOLEAN
      do
         Result := aux.b > x
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_INLINING12: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N")
         end
      end

   cpt: INTEGER

end -- class TEST_INLINING12
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
