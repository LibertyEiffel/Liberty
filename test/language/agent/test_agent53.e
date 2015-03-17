-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT53
   -- SZ:403: pc@axlog.fr (philippe coucaud)

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         k1: AUX_AGENT53_CONTAINER[AUX_AGENT53_FOO1]; b: BOOLEAN; d: REAL
      do
         create k1.make
         b := k1.exists(agent {AUX_AGENT53_FOO1}.has1) -- FOO1 -> BOOLEAN
         assert(not b)
         b := k1.exists(agent {AUX_AGENT53_FOO1}.has2) -- FOO1 -> BOOLEAN
         assert(not b)
         d := k1.stats_for(agent {AUX_AGENT53_FOO1}.stats1) -- FOO1 -> [INTEGER,INTEGER]
      end

end -- class TEST_AGENT53
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
