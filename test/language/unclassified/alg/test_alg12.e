-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ALG12
   -- From a bug report of Alain Le Guennec <Alain.Le_Guennec@irisa.fr>

insert
   MEMORY

create {}
   make

feature {ANY}
   tab: ARRAY[AUX_ALG12]

   d0, d1: AUX_ALG12

   make
      do
         create tab.with_capacity(2, 0)
         create d0.make("d0")
         tab.force(d0, 0)
         create d1.make("d1")
         tab.force(d1, 1)
         -- Let's restrict the array to d1.
         tab.resize(1, 1)
         -- Let's overwrite d1 by d0.
         tab.put(d0, 1)
         d0 := Void
         d1 := Void
         -- d1 should be collectable from now on.
         full_collect
         full_collect
      end

end -- class TEST_ALG12
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
