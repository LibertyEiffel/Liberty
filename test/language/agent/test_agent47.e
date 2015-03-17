-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT47
   -- Test de la liaison dynamique (sur la cible)

inherit
   AUX_AGENT47
      redefine f
      end

create {}
   make

feature {ANY}
   make
      local
         aux: AUX_AGENT47
      do
         create aux
         memory.set_item("In aux agent 47%N")
         aux.test(aux)
         memory.set_item("In agent 47%N")
         aux.test(Current)
         aux := Current
         memory.set_item("In aux agent 47%N")
         aux.test(create {AUX_AGENT47})
         memory.set_item("In agent 47%N")
         aux.test(Current)
      end

   f
      do
         assert(memory.item.is_equal("In agent 47%N"))
         memory.set_item(Void)
      end

end -- class TEST_AGENT47
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
