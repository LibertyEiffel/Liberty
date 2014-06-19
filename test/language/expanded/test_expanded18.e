-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_EXPANDED18

insert
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   make
      local
         a: AUX_EXPANDED18A; b: AUX_EXPANDED18B; c: AUX_EXPANDED18C
      do
         ---- Original:
         -- c: expanded AUX_EXPANDED18C
         assert(a.value1 = 0)
         assert(a.value2 = '%/0/')
         a.make
         assert(a.value1 = 1)
         assert(a.value2 = 'A')
         create a
         assert(a.value1 = 0)
         assert(a.value2 = '%/0/')
         a.make
         create {AUX_EXPANDED18A} a
         assert(a.value1 = 0)
         assert(a.value2 = '%/0/')
         assert(b.value1 = 1)
         assert(b.value2 = 'A')
         b.clear
         assert(b.value1 = 0)
         assert(b.value2 = '%/0/')
         create b.make
         assert(b.value1 = 1)
         assert(b.value2 = 'A')
         b.clear
         create {AUX_EXPANDED18B} b.make
         assert(b.value1 = 1)
         assert(b.value2 = 'A')
         assert(c.value1 = 1)
         assert(c.value2 = 'A')
         c.clear
         assert(c.value1 = 0)
         assert(c.value2 = '%/0/')
         create c.make
         assert(c.value1 = 1)
         assert(c.value2 = 'A')
      end

end -- class TEST_EXPANDED18
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
