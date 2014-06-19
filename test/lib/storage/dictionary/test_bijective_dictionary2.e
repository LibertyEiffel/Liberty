-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_BIJECTIVE_DICTIONARY2

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         d1: HASHED_BIJECTIVE_DICTIONARY[INTEGER, INTEGER]
      do
         create d1.make
         assert(d1.count = 0)
         d1.put(1, 2)
         assert(d1.count = 1)
         assert(d1.at(2) = 1)
         assert(d1.fast_at(2) = 1)
         assert(d1.has_value(1))
         assert(d1.fast_has_value(1))
         d1.put(3, 4)
         assert(d1.count = 2)
         assert(d1.at(4) = 3)
         assert(d1.fast_at(4) = 3)
         assert(d1.has_value(3))
         assert(d1.fast_has_value(3))
         d1.put(5, 2)
         assert(d1.count = 2)
         assert(d1.at(2) = 5)
         assert(d1.fast_at(2) = 5)
         assert(d1.has_value(5))
         assert(d1.fast_has_value(5))
         assert(not d1.has_value(1))
      end

end -- class TEST_BIJECTIVE_DICTIONARY2
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
