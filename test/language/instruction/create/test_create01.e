-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_CREATE01

create {}
   make

feature {ANY}
   make
      local
         old_a, new_a: ARRAY[INTEGER]; old_aux, new_aux: AUX_CREATE01; x: INTEGER
      do
         create old_a.make(1, 1)
         create new_a.make(1, 1)
         assert(old_a.is_equal(new_a))
         new_a := create {ARRAY[INTEGER]}.make(1, 1)
         assert(old_a.is_equal(new_a))
         create old_aux
         create new_aux
         assert(old_aux.is_equal(new_aux))
         new_aux := create {AUX_CREATE01}
         assert(old_aux.is_equal(new_aux))
         x := (create {AUX_CREATE01}).x
         assert(x = 1)
         assert(1 = foo(create {AUX_CREATE01}))
      end

   foo (aux: AUX_CREATE01): INTEGER
      do
         Result := aux.x
      ensure
         not aux.is_equal(create {AUX_CREATE01})
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_CREATE01: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         end
      end

   cpt: INTEGER

end -- class TEST_CREATE01
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
