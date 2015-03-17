-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_FA4
   --
   -- From a bug report of Franck ARNAUD
   --

create {}
   make

feature {ANY}
   make
      local
         r1: AUX_FA4R1; r1b: AUX_FA4R1B; r2: AUX_FA4R2; b1: AUX_FA4B1; b2: AUX_FA4B2
      do
         create r1
         r1.init_ref
         assert(r1.ref.value1.is_equal("ref"))
         assert(r1.get_ref.is_equal("ref"))
         b1 := r1
         b1.init_ref
         assert(b1.ref.value1.is_equal("ref"))
         assert(b1.get_ref.is_equal("ref"))
         assert(r1.ref.value1.is_equal("ref"))
         assert(r1.get_ref.is_equal("ref"))
         create r1b
         r1b.init_ref
         assert(r1b.ref.value1.is_equal("ref"))
         assert(r1b.get_ref.is_equal("ref"))
         b1 := r1b
         b1.init_ref
         assert(b1.ref.value1.is_equal("ref"))
         assert(b1.get_ref.is_equal("ref"))
         assert(r1b.ref.value1.is_equal("ref"))
         assert(r1b.get_ref.is_equal("ref"))
         create r2
         r2.init_ref
         assert(r2.ref.value1.is_equal("ref"))
         assert(r2.get_ref.is_equal("ref"))
         r2.init_autre
         assert(r2.autre.is_equal("autre"))
         b1 := r2
         b1.init_ref
         assert(b1.ref.value1.is_equal("ref"))
         assert(b1.get_ref.is_equal("ref"))
         b2 := r2
         b2.init_autre
         assert(b2.autre.is_equal("autre"))
         assert(r2.ref.value1.is_equal("ref"))
         assert(r2.get_ref.is_equal("ref"))
         assert(r2.autre.is_equal("autre"))
      end

   assert (bool: BOOLEAN)
      do
         cpt := cpt + 1
         if not bool then
            std_output.put_string("TEST_FA4: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            --       std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_FA4
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
